From: Alessandro Zummo <azummo@ita.flashnet.it>
Date: Tue, 15 Feb 2000 22:07:02 +0000
Subject: Re: SB, PNP, kernel, etc.
MIME-Version: 1
Content-Type: multipart/mixed; boundary="BOUNDARY.146029240.6"
Message-Id: <marc-linux-sound-95066320710986@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95071956214609@msgid-missing>
In-Reply-To: <marc-linux-sound-95071956214609@msgid-missing>
To: linux-sound@vger.kernel.org

Warning: This is a message in MIME format. Your mail reader does not
support MIME. Some parts of this message will be readable as plain text.
To see the rest, you will need to upgrade your mail reader. Following are
some URLs where you can find MIME-capable mail programs for common platforms:

  Amiga............: YAM          http://www.yam.ch/
  Unix.............: Metamail     ftp://ftp.bellcore.com/nsb/
  Windows/Macintosh: Eudora       http://www.qualcomm.com/

General info about MIME can be found at:

http://www.cis.ohio-state.edu/hypertext/faq/usenet/mail/mime-faq/top.html


--BOUNDARY.146029240.6
Content-Type: text/plain

 On 15-Feb-00 at 23:22:14,
  Peter Leif Rasmussen <plr@cedara.com> wrote:


> I have also tried to compile the SB driver as a module, run isapnp with
> the isapnp.conf file that came out of using "pnpdump -c", but edited to
> use the same values as when compiling the driver into the kernel. And then
> attempting to load the driver with depmod (and I also attempted insmod).
> Here I usually get a message that there isn't any PNP device, and that
> puzzles me because executing "isapnp isapnp.conf" went all right?


Well, that's a fault of mine. Kernel 2.3.45 has a new pnp
driver for the soundblaster.

Unluckly is still bugged, so here is a patch for you.
You could simply apply it over your 2.3.45 kernel tree,
but remember to remove it before upgrading to 2.3.46.

If it doesn't still work, please send me the output
of cat /proc/isapnp and check for relevant parts
in the kernel log file(s).

-- 

   - *Alex* -

  http://freepage.logicom.it/azummo/

--BOUNDARY.146029240.6
Content-Type: application/octet-stream; name="sb_patch.2.3.45.gz"
Content-Disposition: attachment; filename="sb_patch.2.3.45.gz"
Content-Transfer-Encoding: base64

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
y1dKc+XSmHJwv6yc9mePzvBzef4/2pUQFyBTAAA=

--BOUNDARY.146029240.6--
