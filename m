From: Ray Olszewski <ray@comarre.com>
Date: Wed, 08 Dec 1999 17:53:28 +0000
Subject: Re: PCI 512 Working and printing problems
Message-Id: <marc-linux-sound-94467847016944@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94465556330841@msgid-missing>
In-Reply-To: <marc-linux-sound-94465556330841@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

First lesson for a self-proclaimed "really a newbie" -- to get help with
problems, you have to describe them in some detail. "But it will not print"
isn't very informative; it doesn't even tell us which of the many possible
ways of printing you tried. So ... I suspect the last entry on my list below
is your answer, but I'm leaving the others in because they give you some
step-by-step guidence in how to analyze printer problems under Linux.

1. What is "lp"? It is usually the default entry in /etc/printcap, but what
printer does it select and what actual /dev/lp* device does it point to? Is
it the right device?

2. If you try to print by directing a text file directly to the device, what
happens? You do this with a command something like

        cat somefile > /dev/lp1

3. If you try to print using lpr, what happens? What error message is
returned? I mean a command something like

        lpr somefile

4. As to drivers, the most authoritative source I know for this information
is http://www.picante.com/~gtaylor/pht/printer_list.cgi . I can't find an
"HP820" on the list, but there is an HP "Deskjet 820C" listed as working
"partially" with Linux, requiring the "pbm2ppa" driver. Since this printer
is a PPA printer and the 500 and 600 sries are PCL printers, the drivers
you've tried so far are unlikely to be helpful. Consult the above URL for
more information. 

PS - If you can't report your distribution and version of Linux exactly, you
should at least mention the kernel version - "uname -a" will give you this
and other descriptive information. At the most comprehensive distribution
site I know (http://kernelnotes.org/dist-index.html - does anyone have other
candidates?), there were no Portugese distributions listed, but there was
one Brazilian one called "Conectiva" that is based on Red Hat. Is that what
you are using, perhaps?

At 10:10 AM 12/8/99 -0200, OHPC wrote [in part]:

>My printer, however, won't print anything. I have a HP820, tried to use the 
>HP 5XX and 6XX drivers, and use the lp port. But it will not print. Can 
>anybody help me?

------------------------------------"Never tell me the odds!"---
Ray Olszewski                                        -- Han Solo
Palo Alto, CA           	 	         ray@comarre.com        
----------------------------------------------------------------
