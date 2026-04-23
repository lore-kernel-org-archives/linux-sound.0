Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1AE3806C2
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 16:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776963201; cv=none; b=V2JvGq9f4Ov8q/F3lg4rbXataP8p1EeaTXUmfMr4cWJFJhO5DLEHMNMdgmyNA7s3t0zJCtASVa2cVF1ii/HWI7TbLZqSjcAOaWdjh1r9DpJZncCB4d8JdPnsmM8SLgj9YORPs6LlNpjWU/JUWmYUlzK04Nn+KRl10Xsvcb2xO/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776963201; c=relaxed/simple;
	bh=Gv5gPS7Utwk+pVDTTtrhUz0kR0Mi5lgYPnBIxUTDYUk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwacHUuz3d27eSNAb8VzXq5j//F7OzbUNJaFCMvzElR1jFkreJGI8cIlnHt+OoRvYR2FmjMMfqicapmsQBycu0y/9Z3Kul/5j9ynefWZZOsOONRrTcQNLTnYJOvVuh1E4MBXgDP9XapCk/AGHh0amgwPdu+Pgr009mH6EuKEKYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Ebz4dz6Q; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Ebz4dz6Q"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so64068965e9.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 09:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776963194; x=1777567994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1HR1AGhXc2/nBLZyQcDv4KG81pceu424Vc1dZ8FK8VU=;
        b=Ebz4dz6QMmEF3wtkungJAtJ2IOX8eJ8E8rQc8cItxsV245mr357p+aKZi5KX4VpzHd
         0awlszml9dat0cCziWMlc1jERJv/3km3woQm4nY26jo4hXVM2wN90Gns8uwCNb6i4ol+
         fCJIW9ciObKUeFDglHtHDVW8dwxjXcXZ2Ztf7rmevCq5FDotbyZX9GOcunJx7kTjOVC8
         lU/V7r8CFATkHDmmwpDPHlu28kOaCTYQnZIW+yzOUiz+6v0HggL/XruRlToqIjWN9lwo
         xCJE/cHi+LcH4xrXoYLzjPKVj7GVodCGkOYyETCyz7CYu+T9qOl09tss5DbFkp7B3hUM
         KeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776963194; x=1777567994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1HR1AGhXc2/nBLZyQcDv4KG81pceu424Vc1dZ8FK8VU=;
        b=GuC5mrhTExS3TUjGXFwJUB5HcEIuXHUdcA5i8UeNqaIwZE1gqCA192vVSplrc1p1uN
         rhTNhT+/zx5ptlI2amhrXEvLnIil2Q7Cr8OIPjS/E2MQ53WlYQAEEhI85KBRSU7tOyen
         aUOoUqUTti3xAviCwmcbRPjZF7zZsyWRdwASgsS3a8C9b0arwC8vpwGmdj0OI/OaHo7k
         7ul2dKf/C/mbgh+hAbIo7vtwEy9CNN0jAvGr8KjPDaUvpwEXun+4MgmahcxcGA2udzBf
         NvUUvyvK0UCMJ2PKww7IP+KBLE9Wfah2LZqwmjeevoVQNcGVYQ2r3E6brttingUrkMyI
         ey7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8YTcF4ikeOPyrTTNAPCBl3V1KmDhs2Xmj6gQKhpSswzgahC8uOVcpSITrmvnCAD+E3McuD0ceF+mH1pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQS2ycfKQbdOekRR9aqV93b/V9DwdhUPaybSAJQxWMZi6/mIWp
	g9ceOqQo8EkDy42WFblLZUTJthmj9uksxiggIuXnRz2iFl5gD3nf7W8CEOXsOs8Jbl0DCc8moaA
	Gpy+g
X-Gm-Gg: AeBDietht7RvfyHlSJFGYW09K9rWCItjFWbneK3VCv5mWVPuo8s0r6nQ5/NHCgcW/HH
	9VUNoCeig8dWa3djkvDyw1GETEQeO/FaSnSupnY8jGK7O5J2r2EonRV8j8GWT3p3gr3rfEOi8n1
	TJKjcFNxeDRFB1PVx8AD1hXyAtUy1hwOAR+4EbqJNhW3ZX67jxMGvtmfenuxhIKYvQH26/UISCp
	vcJfsVcKECM+tIHclBr23RD8BKEWoKMJxM5HIG11bvjKiKMRVPgH/aA7qtphDRlpwwH44YUJCk7
	88CRdbh90ptGYdvi7kN2q5AOziJsntYoa3PyE96fxoSB20DPNOT0YuiX/4RDA6GLHEdvhns/CRZ
	a4RwmJTu7L73Kg8pzfnBChSmU6W6f9QnpYRRw4bS+FvmnNqm5xo4H/bv7NetFdZsAaQ5OJIk84z
	0/JIm1nF1rUM8O3glgKOhcm9luw/DPIwoLTEGKLUu44pHVcApOcbFqcQrzAIPJwrUHyY+12/YSL
	Oihhw65Ykrc0wKabtiOO7KKdQ==
X-Received: by 2002:a05:600c:4e14:b0:489:1f08:91b with SMTP id 5b1f17b1804b1-4891f080a7emr261351675e9.16.1776963194414;
        Thu, 23 Apr 2026 09:53:14 -0700 (PDT)
Received: from localhost (p200300f65f114e08a25e1e10fa943eb9.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:a25e:1e10:fa94:3eb9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488fb79ecb9sm224700095e9.8.2026.04.23.09.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 09:53:13 -0700 (PDT)
Date: Thu, 23 Apr 2026 18:53:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, linux1394-devel@lists.sourceforge.net, 
	linux-sound@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
Message-ID: <aepEedmf6sA83XpQ@monoceros>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
 <20260423141959.GA268626@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fu6q2m4ga74mqqyv"
Content-Disposition: inline
In-Reply-To: <20260423141959.GA268626@sakamocchi.jp>


--fu6q2m4ga74mqqyv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
MIME-Version: 1.0

Hello Takashi,

On Thu, Apr 23, 2026 at 11:19:59PM +0900, Takashi Sakamoto wrote:
> It is unclear who is responsible for maintaining the 'ieee1394_device_id'
> structure in include/linux/mod_devicetable.h, but if it falls under my
> responsibility (which seems likely),

It matches my understanding that it's indeed you who is responsible for
ieee1394_device_id.

> I would prefer to postpone applying these patches, or at least exclude
> them from this merge window.

I don't expect them to go in for v7.1-rc1. My idea was to send this kind
of patch during the merge window to allow to get it into next soon after
the merge window closed to allow some cooking in next.
=20
> After reading the discussions around the UAPI, I am not fully convinced
> that your patches appear to provide clear benefits to existing
> IEEE 1394 bus users or their software. From my perspective, the motivation
> appears to be primarily related to the CHERI extension work.

Yes and no. My motivation to work on these is triggered by CHERI indeed.
But I already worked on this kind of update even before I knew about
CHERI to get rid of the casts. (Back then it was about i2c, see
https://lore.kernel.org/all/20240426213832.915485-2-u.kleine-koenig@pengutr=
onix.de/.)

For me this series is a sweet spot, because it allows to reduce the
CHERI patch stack but at the same time reduces the amount of (IMHO ugly)
casts involved in handling pointers in .driver_data. With my mainline
maintainer hat on, I consider the latter alone a good enough reason to
apply patches like this. One issue it addresses en passant is that a
part of the casts back to a pointer drop the const attribute, see the
output of

	git grep '\*).*driver_data' | grep -v '\<const\>'

=2E I didn't check for false positives in this list, but I guess there are
not many. This doesn't affect firewire though, there the casts are all
fine.

As my patch series doesn't introduce changes to the compiled drivers,
the effect on bus users or their software is admittedly quite limited of
course :-), but I'd hope that you see a benefit in the 2nd patch even if
CHERI isn't (and probably shouldn't be) a motivation for you.

The reason I mentioned CHERI was mainly to be transparent about my
motivation, but this triggered more discussion than I liked, distracting
=66rom the advantages of the changes for non-CHERI archs.

> As you know, this subsystem is quite marginal in the Linux kernel
> codebase. Given that, it might be worth considering whether this
> subsystem should be excluded from the build target when capability
> pointers are enabled (e.g. via Kconfig, if available), since it does not
> appear to work outside the ILP32 or LP64 data models. It may be worth
> carefully considering where effort is best spent. I can understand the
> merits of CHERI extensions, but changes related to this subsystem would
> likely be acceptable only after the kernel core functions have been
> updated.

I wasn't aware about this limitation. struct ieee1394_device_id just
happend to be near the top of include/linux/mod_devicetable.h. (There is
only pci_device_id before, but I wanted to start with a smaller part of
this quest.)
=20
> That said, this is just my current view. I would welcome any feedback or
> objections. Besides, it is still one of my tasks to figure out how to
> adapt the UAPI structures and the firewire core implementations to
> non-ILP32/LP64 data models.

With you talking much about UAPI I wonder if you're aware that for all
current Linux architectures my patch set doesn't introduce any changes
in the binary interface because all have sizeof(unsigned long) =3D=3D
sizeof(union { unsigned long; const void *; }). And the two adaptions
(my introduction of the union for driver_data + your UAPI structure
adaptions) should not restrict each other, right?

So I'd be glad if you forgot about CHERI and just judge the patchset for
the things it achieves for current mainline. Of course I hope you agree
it's a nice cleanup eventually and apply it.

Best regards
Uwe

--fu6q2m4ga74mqqyv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnqTm4ACgkQj4D7WH0S
/k6xvQgAp4POxayzNr9QEwF5X9FZazPf0pxT9m+LCU7NuOqLDe8reqqTBrtP8bMd
pRmf4z1i//Xyh9F8JFc2ORL4a0D7qg92xLy4oD/oHR3tS3hyVM3mpugWsguUyoMI
7GT9uZmL6YX3KNAES1JAROcqo86tlgcFf+X3R/Chgda2/LAW5JxpUypD56lvoGSv
RglyaJjZ/XA4TKS/SFTEzJ0MAQ1HxrbMsLqdSAxos4ge5nbDdAM+qAjJMoM8Sj5S
tOj1Zlo6fs/MdlCBjKcXKxApt/3WgRDb5OglB04ttvYABPJ4nE1kPPXVohOW1ucE
ngdW8vp17x7zDM5SPsBRjW6+LY314Q==
=w480
-----END PGP SIGNATURE-----

--fu6q2m4ga74mqqyv--
