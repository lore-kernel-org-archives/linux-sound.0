From: Keith Duthie <psycho@albatross.co.nz>
Date: Wed, 17 Feb 1999 16:05:50 +0000
Subject: Re: Sound Card Problems
MIME-Version: 1
Content-Type: multipart/mixed; boundary="185212428-815479156-919267550=:30935"
Message-Id: <marc-linux-sound-91927037701151@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91922152200751@msgid-missing>
In-Reply-To: <marc-linux-sound-91922152200751@msgid-missing>
To: linux-sound@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

--185212428-815479156-919267550=:30935
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 17 Feb 1999, Rodrigo Castro wrote:

> Tried everything. Not working. I don't even know if you have any more idea
> about what may be the problem. My motherboard chipset is VIA and I read
> something about a conflict between some VIA chipsets and sound cards. I
> sent a message to linux-kernel list. Let's see if someone there gives us a
> tip of what may not be working.
> The worst thing is that it used to work in 2.0.36, but nowadays when I try
> to revert to 2.0.36 kernel, it does not work more (with isapnptools). The
> only way I found that works is initializing my card with a kernel patch in
> a 2.0.* kernel.
Try this patch, then recompile. If it works then the problem was the 
motherboard.
-- 
.sig under deconstruction. Please watch out for falling stars.

--185212428-815479156-919267550=:30935
Content-Type: TEXT/PLAIN; charset=US-ASCII; name=patch
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.10.9902180505500.30935@loki.wibble.prv>
Content-Description: 
Content-Disposition: attachment; filename=patch

LS0tIGxpbnV4L2luY2x1ZGUvYXNtLWkzODYvZG1hLmgub3JpZwlTYXQgSmFu
IDMwIDE0OjE2OjAyIDE5OTkNCisrKyBsaW51eC9pbmNsdWRlL2FzbS1pMzg2
L2RtYS5oCVRodSBGZWIgMTggMDU6MDI6MDcgMTk5OQ0KQEAgLTI5Miw3ICsy
OTIsNyBAQA0KICNpZmRlZiBDT05GSUdfUENJX1FVSVJLUw0KIGV4dGVybiBp
bnQgaXNhX2RtYV9icmlkZ2VfYnVnZ3k7DQogI2Vsc2UNCi0jZGVmaW5lIGlz
YV9kbWFfYnJpZGdlX2J1Z2d5IAkoMCkNCisjZGVmaW5lIGlzYV9kbWFfYnJp
ZGdlX2J1Z2d5IAkoMSkNCiAjZW5kaWYNCiANCiAjZW5kaWYgLyogX0FTTV9E
TUFfSCAqLw0K
--185212428-815479156-919267550=:30935--
