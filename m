From: "Nikolopoulos Billy" <ee2653@ee.teiath.gr>
Date: Tue, 29 Sep 1998 20:36:08 +0000
Subject: Re: Installing a Kernel
Message-Id: <marc-linux-sound-90710578402594@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90685171815750@msgid-missing>
In-Reply-To: <marc-linux-sound-90685171815750@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>Hi,
>I'm trying to upgrade kernel 2.0.32 to kernel 2.0.35 under RedHat 5.0.
>Here's what I do:
>    I place the 2.0.35_kernel.tar.gz file in /usr/src,
>    I execute the command tar xvzf [name of the file].tar.gz
>A lot of text flies by for quite a long moment and when it ends a new
>directory called "linux" is created.
>    then I execute the make .... commands (I'm followinf the directives
>of the How-to's); but when I reboot, nothing has changed !!!
>Can somebody tell me if I did something wrong ??? and/or tell me exactly
>what to do ?


Hello,

First of all you make a make zimage or a zlilo ?

If you do zlilo is the /etc/lilo.conf showing in the right vmlinuz ???

Billy
