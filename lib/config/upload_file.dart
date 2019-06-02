import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:math' as math;

import 'package:dio/dio.dart';

abstract class TEFileUploadTask {
  void call();
}

class TEFileUploadMultipartTask implements TEFileUploadTask {
  final Uri url;
  final Uri proxy; // Dart默认不识别iOS系统设定的代理服务器，如需抓包需要手动设置代理，通过此字段可支持http协议代理，https需要忽略证书校验。
  final Map<String, dynamic> headers;
  final Map<String, dynamic> data;

  final void Function(TEFileUploadTask task, List<int> data) onData;
  final void Function(TEFileUploadTask task, HttpClientResponse response) onDone;
  final void Function(TEFileUploadTask task, dynamic error) onError;

  TEFileUploadMultipartTask({this.url, this.proxy, this.headers, this.data, this.onData, this.onDone, this.onError});

  Future<void> call() async {
    try {
      var response = await HttpClient().openUrl('POST', proxy == null ? url : url.replace(host: proxy.host, port: proxy.port)).then((request) {
        if (proxy != null) {
          request.headers.host = url.host;
          request.headers.port = url.port;
        }

        FormData formData = FormData.from(data);
        var bytes = formData.bytes();
        request.headers.contentLength = bytes.length;
//        headers.forEach((name, value) {
//          if (name != 's') request.headers.set(name, value);
//        });
        request.headers.set('Content-Type', 'multipart/form-data; boundary=${formData.boundary.substring(2)}');
        List<List<int>> buffer = <List<int>>[];
        for (var start = 0, end = bytes.length, size = 65536; start < end; start += size) {
          buffer.add(bytes.getRange(start, math.min(start + size, end)).toList());
        }
        return (Stream.fromIterable(buffer).asBroadcastStream()..listen((data) => onData(this, data))).pipe(request);
      });
      onDone(this, response as HttpClientResponse);
    } catch (e) {
      onError(this, e);
    }
  }
}

class TEFileUploadController {
  static TEFileUploadController sharedInstance = TEFileUploadController();

  final maxConnectionCount = 1;
  final proxy = null; //Uri.parse('http://10.72.103.152:8080/'); // 抓包时设为开发机的IP，真机需接入Tencent-LabWiFi

  final List<TEFileUploadTask> taskList = <TEFileUploadTask>[];
  final Queue<TEFileUploadTask> queue = Queue<TEFileUploadTask>();

  UploadFileInfo _localFile(String path, {String fileName}) {
    return UploadFileInfo(File(path), fileName ?? path.substring(path.lastIndexOf(RegExp(r'(\/|\\)')) + 1));
  }

  void uploadImageFile(
    String path, {
    String fileName,
    void Function(TEFileUploadTask task, List<int> data) onData,
    void Function(TEFileUploadTask task, HttpClientResponse response) onDone,
    void Function(TEFileUploadTask task, dynamic error) onError,
  }) {
    print('add');
    queue.clear();
    queue.addLast(TEFileUploadMultipartTask(
        url: Uri.parse('http://wd.chivan.cn:3000/file/upload/img'),
        proxy: proxy,
//        headers: ServerApi.api.,
        data: {
          'image': _localFile(path, fileName: fileName),
        },
        onData: (task, data) {
          if (onData != null) onData(task, data);
        },
        onDone: (task, response) {
          removeUploadTask(task);
          if (onDone != null) onDone(task, response);
        },
        onError: (task, error) {
          removeUploadTask(task);
          if (onError != null) onError(task, error);
        }));
    updateTasks();
  }

  void updateTasks() {
    print('begin...:${queue.length},${taskList.length}');
    taskList.clear();
    while (taskList.length < maxConnectionCount && queue.length > 0) {
      print('begin');
      taskList.add(queue.removeFirst()..call());
    }
  }

  void removeUploadTask(TEFileUploadTask task) {
    taskList.remove(task);
    updateTasks();
  }
}
