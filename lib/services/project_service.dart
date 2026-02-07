import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/data_models.dart';

class ProjectService {
  ProjectService._privateConstructor();
  static final ProjectService instance = ProjectService._privateConstructor();

  final ValueNotifier<List<Project>> projectsNotifier = ValueNotifier([]);
  Project? projectBeingEdited;

  static const String _storageKey = 'saved_projects';

  Future<void> loadProjects() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? projectsString = prefs.getString(_storageKey);

      if (projectsString != null) {
        final List<dynamic> decodedList = jsonDecode(projectsString);
        final List<Project> loadedProjects =
            decodedList.map((item) => Project.fromMap(item)).toList();

        projectsNotifier.value = loadedProjects;
      }
    } catch (e) {
      debugPrint('Error cargando proyectos: $e');
    }
  }

  Future<void> _saveToStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String encodedData = jsonEncode(
        projectsNotifier.value.map((p) => p.toMap()).toList(),
      );
      await prefs.setString(_storageKey, encodedData);
    } catch (e) {
      debugPrint('Error guardando proyectos: $e');
    }
  }

  void addProject(Project project) {
    final projects = projectsNotifier.value;
    projects.insert(0, project);
    projectsNotifier.value = List.from(projects);
    _saveToStorage();
  }

  void deleteProject(String projectId) {
    final projects = projectsNotifier.value;
    projects.removeWhere((p) => p.id == projectId);
    projectsNotifier.value = List.from(projects);
    _saveToStorage();
  }

  void updateProject(Project updatedProject) {
    final projects = projectsNotifier.value;
    final index = projects.indexWhere((p) => p.id == updatedProject.id);
    if (index != -1) {
      projects[index] = updatedProject;
      projectsNotifier.value = List.from(projects);
      _saveToStorage();
    }
  }

  void startEditing(Project project) {
    projectBeingEdited = project;
  }

  void stopEditing() {
    projectBeingEdited = null;
  }
}
