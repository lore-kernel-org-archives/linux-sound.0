Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E7435DA53
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 08:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776846629; cv=none; b=rTW1taTf4AshmGLZLFLZokU97vOTllRYE15Hi0hfYdJzyjGp5yU40epcU3oEAzJ/eS9Eq5kyoba7enf5TNO/bRPk1wSdccl3hnJ+bGlwBJI90zv4BFVHfdyiLzAxerh7uOxlJ7siJvU0hAmWZuWObC0mxjvOUm2MmMUUL6Pdwmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776846629; c=relaxed/simple;
	bh=OZ4IYteuZkrOXWchEqOT12FfHAQEKPkAPQKvUin96dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s65SO9hCXdEHcqdlIFvySQ5JnWkH+ffUDgeBOxzr5AXZwF/MCFcIbsj24KcI3RRPBEZpWjc77ZkO/6QP6vNW02rLRdBdyJWVPLBoYT5StcvFIVumRCEST7s++68FIlfcMLJSN+3aT2t6bYaBUalFNywLcCYHPVTQOuXZA3E7l0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=kW9C101Q; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="kW9C101Q"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d73422431so4390613f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 01:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776846624; x=1777451424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OZ4IYteuZkrOXWchEqOT12FfHAQEKPkAPQKvUin96dg=;
        b=kW9C101QwFAU9E4rWL8zoZ6+P/u1YFBiRjYqhQXVOTC14LqVKYuSONw+BBNWJ4I7PJ
         +ozFLyGOBY3Jq3NcURB3bYdGksKpZ8Hnn/laTjYS5iu/Qoonmok1IS/A8RA0PllJ8UvP
         TCfPfSN8QeqPiMzHsaGbEyP9ZDAqbWLNlNponoQtKuyB7ALwRMI4i3URCsYaMQpsQhzA
         T/xmb7hpEvkDVbB4NAcgkAv6IM9bJRJV4cDjnIGDt1C3K++Z+putoXv3rpTZRSmVUNnq
         XGvSHzS8KPwleQGJHmf35yg7CHWPQ5t/Qu6VEdwYYeHkXKDsY33+6sBu0JoVorleN6TV
         ivtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776846624; x=1777451424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZ4IYteuZkrOXWchEqOT12FfHAQEKPkAPQKvUin96dg=;
        b=Og0TztuSgKtVfEYaiAuyQ8GVS94YQ0MDXYQ7lx3HcEiGAdmL0lMNQkbLcI9rdXzHn/
         9ohgD13KQvhhr0zg05MhfOAVcHyB/1/W/QtumiLLleb7V5nqfDBHCj3qDnCbHUbAnGcS
         iXk9hhObJ2GdiMO8AGS/AaBfHba8mAnJ4vOjx34kU9UTnORl6JeCys8Pr5cgYnsyy7l3
         /3+pru6QA3lQ085ULIpcCghmXeq/mE8vgGF3ET95VF/fmM+gly02RQtpb634GxAmFi35
         SDUrAs4XkSKjksajurExQ2+SzO+htv4Z66ia4nCVhScUykPF2T4TbnuYz6uj3xiGaqQp
         vdQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8abpzy4/kVhMc40j+O9gHZXMVH1oTnnOFyWvd/QlknSCMDR34j9fZpW6R8YyYlN9cQ57SBTcJwDKqUFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCV49BcVDwb1E8QZI5wrh6kQ0smV4I72pllEPrJiMoOTsCXkGt
	UvUhbnrlxnk+4F+ku9uEDF1yl6R1TFkUJ4pcpaJTJLj2bVziqVUYLM8mqwkxuO1B27w=
X-Gm-Gg: AeBDieuZmT9TRbLMgIIGK+NCOkbfgrWLxr7Ftwzfze91Wa7kMoc2b1bo6f+pGSH124a
	pH1lUe0fJzxVkx+TL6mqywafJoJw0se+YPaO+C8UnltguLct+Oi23Is/nNnrYpqYKIRTYKXJrZA
	30zT8zb5QlT5gWrGwLgC9ZQGGNLMHLSo5YDoV2tWQ8hfXGLvADcOYLvt10pEPe96kx0vKp0HInQ
	Lmhb1nO8yVDEitexdesPIXXtyZQkXAZcbsmL6RgxKVptHm6MzveaFDASg1rFgffR8juDi9Jeyli
	ogI8ED3CZtk58c+6g0pT5rLbyokD6DTcioNrd13ljEPWjG1B7fQQllilDhol4LveT5x2CAftFR/
	bT9rHcZogK1VNoKVBLNQ0vT3GpM85PbpjrhmVgpQThtc+j42ZIfEzUlRAHAgdihK2x8NkqKEfV5
	uE6BC7+Cw/GB60I8yA1BD4C3uTQwbii5FXMOTk/xRHp+Q42r6d0Z2rZCodG9DM/qetPMF0PuP46
	cNvlCF2Uk5TAYtPN9BjHHcghA==
X-Received: by 2002:a05:6000:24c7:b0:43c:fe0e:5bb9 with SMTP id ffacd0b85a97d-43fe3dd4ca7mr34009680f8f.12.1776846624221;
        Wed, 22 Apr 2026 01:30:24 -0700 (PDT)
Received: from localhost (p200300f65f114e08a760282010012dc7.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:a760:2820:1001:2dc7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43fe4e44f69sm45957643f8f.25.2026.04.22.01.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:30:23 -0700 (PDT)
Date: Wed, 22 Apr 2026 10:30:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>, 
	Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, linux1394-devel@lists.sourceforge.net, 
	linux-sound@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
Message-ID: <aeiElvAzJRPLKUeI@monoceros>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
 <20260420090816.GA11108@sakamocchi.jp>
 <aeZk1I3DTmyx_ZUL@cae.in-ulm.de>
 <20260421125357.GA46532@sakamocchi.jp>
 <aed_ZwYj_ruoTAZc@monoceros>
 <aeh2eXBdL3bfzXYR@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5naj64jzyrf6k2ns"
Content-Disposition: inline
In-Reply-To: <aeh2eXBdL3bfzXYR@ashevche-desk.local>


--5naj64jzyrf6k2ns
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
MIME-Version: 1.0

Hello Andy,

On Wed, Apr 22, 2026 at 10:19:21AM +0300, Andy Shevchenko wrote:
> On Tue, Apr 21, 2026 at 04:07:42PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > On Tue, Apr 21, 2026 at 09:53:57PM +0900, Takashi Sakamoto wrote:
> > > On Mon, Apr 20, 2026 at 07:39:32PM +0200, Christian A. Ehrhardt wrote:
> > > > On Mon, Apr 20, 2026 at 06:08:16PM +0900, Takashi Sakamoto wrote:
>=20
> ...
>=20
> > > Thanks for the references. It looks like there is not much to consider
> > > outside of mm subsystem. But I have some concerns if supporting
> > > ARM/RISC-V adoptation of CHERI extension in Linux FireWire subsystem.
> > >=20
> > > Any structures in UAPI header of this subsystem are defined with
> > > an assumption that the size of pointer in the existing System V
> > > architectures is up to 64 bits at most. We can see many usage of
> > > '__u64' type member for pointers (e.g. 'rom' in fw_cdev_get_info
> > > structure). I imagine to need defining specific structures for this k=
ind
> > > of 'fat' pointer. (The same assumption lays on compat ioctl.)
> >=20
> > The Standard C answer to that is: The assumption that you can fit a
> > pointer in an unsigned long or u64 is not generally justified. This is
> > "only" given for all current Linux archtectures. And if you want an
> > integer type to store a pointer, use uintptr_t.
>=20
> No, please don't. Linus was clear about this. Use `unsigned long` in that=
 case.

On CHERI we have sizeof(unsigned long) =3D 4 and sizeof(void *) =3D 8, so
what Linus wants doesn't work.

But let me note that we don't have to resolve that question for this
patch set. We're still far away from working on mainlining the core
changes for CHERI that most probaly will require some casting between
pointers and integer types. My plan for now is to work on changes (like
the one here) where we have both, a benefit for mainline and as a side
effect a simplification for CHERI enablement. So I wouldn't mind to
delay the discussion.

Best regards
Uwe

--5naj64jzyrf6k2ns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnohxsACgkQj4D7WH0S
/k7sGgf/YgFmalTz5ICb1xOQxayxrGepGEdt1Qs7qEHKYa+MNNXQwoi1R+2JR71X
HMTDVLvbSa+l1Igsbu+R+hZDn/KYAU4UPoS50EEzYJ3pQmGT2AzRvWBquYWLy1O8
K7/86rAH+W2ktJG8pp98HraTCoviItmi+goREvpITTIcwoX2h7o6U/NBu+0DgiXI
Y6TW6OOs7ATbileJMIYrjF8OHOC1T/bTCKUwNFjnKnlBT9EXWtXD+jbXZKNgudyA
tv6PiQlhVkBG+Vcr8SnsFmwmxqQZ6vpoZ7arlveZMZAG6KppjGUCx+dXC+GRLzH4
9+TxZ6YZBR0q6XtifZeEG9M6ZeIQSg==
=yCOE
-----END PGP SIGNATURE-----

--5naj64jzyrf6k2ns--
