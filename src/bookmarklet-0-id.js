// モナレッジのmypageから記事IDをクリップボード出力するブックマークレット
javascript:(async()=>{await navigator.clipboard.writeText(Array.from(document.querySelectorAll(`a[href^='/article/']`)).map(e=>parseInt(e.getAttribute('href').replace(/.*[\/\\]/, ''))).join('\n')).catch(e=>console.error(e))})();
