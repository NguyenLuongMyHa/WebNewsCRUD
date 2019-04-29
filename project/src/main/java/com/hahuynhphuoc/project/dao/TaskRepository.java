package com.hahuynhphuoc.project.dao;



import org.springframework.data.repository.CrudRepository;

import com.hahuynhphuoc.project.model.Task;

public interface TaskRepository extends CrudRepository<Task, Integer>{

}