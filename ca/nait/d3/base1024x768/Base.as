﻿package ca.nait.d3.base1024x768{		import flash.display.MovieClip;	import flash.events.Event;	import flash.events.MouseEvent;		import ca.nait.d3.base1024x768.steps.*;			public class Base extends MovieClip {				private var titles:Array = [];		private var clips:Array = [];		private var instructions:Array = [];		private var _currentIndex:Number = -1;		private var currentClip:MovieClip;		private var highestIndex:Number = -1;				public function Base() {						titles.push("Introduction");			titles.push("Step 1");			titles.push("Step 2");			titles.push("Step 3");			titles.push("Step 4");			titles.push("Step 5");						//clips.push(new TowerPosition());			clips.push(new Intro());			clips.push(new Step1());			clips.push(new Step2());			clips.push(new Step3());			clips.push(new Step4());			clips.push(new Step5());						instructions.push("");			instructions.push("Using cross measurements, determine the damage amount and damage type. Complete a measurement by dragging from point A to point D. Do the same for point B and point C.\n\n After taking measurements answer the multiple choice question.");			instructions.push("Select the points on the frame where it is to be anchored prior to performing a repair.");			instructions.push("Based on the severity of damage, set the tower position to accurately pull the frame in the opposite direction of the angle of impact.");			instructions.push("Connect the tower by pulling the hook and connecting the chain to the frame.");			instructions.push("Apply pressure and keep an eye on how high it goes on the gauge. Be sure to stress relieve the frame after applying pressure and notice if the pressure gauge drops after doing so. Stress relieving will also help reduce the amount of 'spring back' once the pressure is released. Repeat this step as needed until the frame is back within tolerance.");									nextButton.addEventListener(MouseEvent.CLICK, onNavClick, false, 0, true);			previousButton.addEventListener(MouseEvent.CLICK, onNavClick, false, 0, true);			helpButton.addEventListener(MouseEvent.CLICK, onHelpButtonClick, false, 0, true);			currentIndex = 0;					}										public function get currentIndex():Number{			return _currentIndex;		}		public function set currentIndex(p_index:Number):void{			if (p_index >= 0 && p_index < titles.length){				_currentIndex = p_index;				titleTF.text = titles[currentIndex];				instructionsOverlay.titleTF.text = titles[currentIndex];				instructionsOverlay.instructionsTF.text = instructions[currentIndex];				instructionsOverlay.visible = p_index > 0 && p_index > highestIndex;				highestIndex = Math.max(p_index, highestIndex);				helpButton.visible = instructions[currentIndex] != "";				if (instructionsOverlay.visible) instructionsOverlay.visible = helpButton.visible;				previousButton.enabled = currentIndex > 0;				nextButton.enabled = currentIndex < titles.length - 1;				setClip();			}		}				protected function onNavClick(p_nav:MouseEvent):void{			if (p_nav.currentTarget == nextButton) currentIndex++;			else currentIndex--;		}				protected function onHelpButtonClick(p_nav:MouseEvent):void{			instructionsOverlay.visible = !instructionsOverlay.visible;		}						protected function setClip():void{			if (currentClip) removeChild(currentClip);			currentClip = clips[currentIndex];			addChild(currentClip);			setChildIndex(currentClip, 0);					}				}	}