class Urls{
  static String baseUrl = 'https://task.teamrabbil.com/api/v1';

  static String changeTaskStatus(String taskId, String status) =>
      '$baseUrl/updateTaskStatus/$taskId/$status';
}
