From: Ishaaq Chandy <kuru@lw1.vsnl.net.in>
Date: Sat, 10 Oct 1998 02:20:05 +0000
Subject: Re: OPTI 82c931
Message-Id: <marc-linux-sound-90800469603242@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90770044004640@msgid-missing>
In-Reply-To: <marc-linux-sound-90770044004640@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Balazs Nagy wrote:
> 
> On Tue, 6 Oct 1998, George A. Michalopoulos wrote:
> 
> > hello all,
> >
> > can anyone describe the exact steps on how can i install OPTI 82c931 on my
> > system ?
> 
> Use the modular sound patch from Alan.  I think RedHat's kernel source
> package contains this.
> --

Actually I have an OPTi82C931 running on RedHat Linux 5.0 kernel 2.0.35.
I just recently got it working.


//www.sequel.demon.co.uk/opti.html was a great help in this regard. You
will have to download a small C program compile and run it. Before this
you must compile the kernel to use the correct sound modules: I use the
MSS and OPL3 modules, for some reason I could'nt get the MAD16 drivers
working, but MSS works just fine. You will also have to set up
/etc/isapnp.conf to for Linux to be able to see your card.

I'd like to take this opportunity to thank all those who responded to a
newbie's cry when he was having trouble with his OPTi82C931. The least I
can do in gratitude is help another one. So if you have any more
problems even after the above, feel free to contact me, I guess our
situations are identical (same card, same distribution), by the way,
what is your kernel number, upgrading mine helped, along with solving
some other problems I had.

I can't seem to find you original post on my machine, but as far as I
remember, you were asking if it were possible to compile sound as part
of the kernel and not as modules. When doing a make menuconfig (after
upgrading to 2.0.35) I noticed that I was no longer allowed to do this
(I was able at 2.0.32) I guess now the OSS modules are just that
-modules. Anyway why burden your kernel even more?

Hope this helps,
Ishaaq Chandy
