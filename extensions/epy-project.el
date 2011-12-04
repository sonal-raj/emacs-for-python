;; Project-related functions for emacs-for-python

(defun epy-proj-build-menu ()
  "Build the menu for epy-proj"
  (define-key-after global-map [menu-bar pyproject]
    (cons "Epy"(make-sparse-keymap "Epy"))
    'tools)
  )

(defun epy-proj-build-test-menu ()
  "Build the sub-menu related to test discovery"
  
  (define-key global-map [menu-bar pyproject tests]
    (cons "Tests" (make-sparse-keymap "Tests"))
    )
  
  (let ((tests (epy-unittest-discover default-directory)))
    (dolist (test tests)
      
      (define-key global-map (vector 'menu-bar 'pyproject 'tests (make-symbol test))
	(cons test (make-sparse-keymap test)))
      )
    )
  )

(defun epy-proj-run-test (test)
  "Take a TEST data structure and run the test"
  (shell-command "python -munittest2")
  )









