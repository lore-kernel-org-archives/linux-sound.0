From: Chris Reed <cr212@cam.ac.uk>
Date: Sat, 19 Sep 1998 12:54:12 +0000
Subject: Re: making wav sample of a big mp3
Message-Id: <marc-linux-sound-90621944429393@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90609207319651@msgid-missing>
In-Reply-To: <marc-linux-sound-90609207319651@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 17 Sep 1998 18:48:31 -0400 (EDT) , Michael Stutz wrote: 

>I need to make a 15-second WAV sample from a 3-minute mp3 file that I have.
>Does anyone know an easy way to do this?
>

[this does not belong in linux-sound...]

mpg123 --help shows:
...
   -k n  skip first n frames [0]        -n n  decode only n frames [all]

Use these options with -s to grab the output; the no. of frames /s will 
depend on the mp3,  but a bit of trial and error should work OK.



 -- Christopher Reed, Selwyn College, Cambridge --
 E-Mail: cr212@cam.ac.uk  WWW: http://dura.sel.cam.ac.uk/ [~cr212/]
 r2 T1 cSEL dCS hEn/Chi A4 S+ C*$+++L/UdP W+++ y# a VTsj (Cantab) 1.0 
"Offer me solutions, offer me alternatives and I decline"
