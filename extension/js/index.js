// specify relevant languages for highlight
hljs.configure({
  languages: [
    'bash', 'c#', 'c++', 'json', 'html', 'makefile', 'perl', 'python'
  ]
});


$('pre.programlisting, pre.example').each(function(i, block) {
  hljs.highlightBlock(block);
});
