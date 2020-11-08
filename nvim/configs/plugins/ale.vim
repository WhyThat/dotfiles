let g:ale_reasonml_refmt_executable     = "bsrefmt"
let g:ale_fixers                        = {}
let g:ale_fixers['javascript']          = ['eslint', 'prettier']
let g:ale_fixers['json']                = ['prettier']
let g:ale_fixers['reason']              = ['refmt']
let g:ale_fixers['reasonjest']         = ['refmt']
let g:ale_fixers['reasonstories']         = ['refmt']
let g:ale_fix_on_save                   = 1
" Fix files automatically on save
let g:ale_pattern_options               = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \}

let g:reasonml_project_airline          = 1
let g:reasonml_syntastic_airline        = 1
let g:reasonml_clean_project_airline    = 1
let g:ale_sign_error                    = '❌'
let g:ale_sign_warning                  = '⚠️'


