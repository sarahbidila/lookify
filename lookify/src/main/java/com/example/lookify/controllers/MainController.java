package com.example.lookify.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.lookify.models.Song;
import com.example.lookify.services.SongService;

@Controller
public class MainController {

	@Autowired
	private SongService songService;
	
	@GetMapping("/")
	public String welcome() {
		return "index.jsp";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		model.addAttribute("songs", songService.allSongs());
		return "dashboard.jsp";
	}
	
	@PostMapping("/dashboard")
	public String dashboard(@RequestParam("artist") String artist, Model model) {
		model.addAttribute("artist", artist);
		return "redirect:/search/"+artist;
	}
	
	@GetMapping("/search/{artist}")
	public String searchResult(@PathVariable("artist") String artist, Model model) {
		model.addAttribute("songs", songService.findByArtist(artist));
		model.addAttribute("searchTerm", artist);
		return "searchResults.jsp";
	}
	
	@GetMapping("/songs/new")
	public String createPage(@ModelAttribute("newSong") Song newSong) {
		return "new.jsp";
	}
	
	@PostMapping("/songs/new")
	public String addSong(
			@Valid
			@ModelAttribute("newSong") Song newSong,
			BindingResult result
			) {
		if (result.hasErrors()) {
			return "new.jsp";
		}
		songService.createSong(newSong);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/songs/{id}")
	public String detail(@PathVariable Long id, Model model) {
		model.addAttribute("song", songService.oneSong(id));
		return "detail.jsp";
	}
	
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable Long id) {
		songService.deleteSong(id);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/songs/top-ten")
	public String topTen(Model model){
		model.addAttribute("topSongs", songService.topSongs());
		return "top.jsp";
	}
	
}
