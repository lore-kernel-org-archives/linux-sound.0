Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A143CB2D8
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776852633; cv=none; b=bD6lBjf0o4zttDTKkORVYMFkLWLTcbe+/k0jt8oy5jYYqobFCnZEQvswKrrE8EeFMNnLuT4V+QHan+LOM/sn8ZtHjvCFcCX3uyq+OV5Va4YvOVdxyXkkHtoeS4179ZBRzVX+8Slp2b+V8bDBWnXzWTP1+J3wxW9WM9druTMeaSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776852633; c=relaxed/simple;
	bh=mZQy9kJFU9P3eGyB1KX64kPX915PftZ3EqaMGDU/39M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YF+Ni2Zo33jsb2MeqtF5KNja0Idr0xB4KGeYGpsEZGCumugBCxty2s+o4c+DN/DdIpzPSLzmISPjbocg+AMTJzUObOjisrf+xQ/FZLdooLovdUvxGB9Cilw4xgNtT1M9ilrZ7uxh1BhJ0LEJ/I/6JuCGN+RedvnsbBY7oCFPPxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=CVpggqi6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="CVpggqi6"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso30002195e9.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 03:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776852627; x=1777457427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZQy9kJFU9P3eGyB1KX64kPX915PftZ3EqaMGDU/39M=;
        b=CVpggqi6PlFOa53wuTdQ40VYOhO8szZO4LpfaZxHEdCKtgJdCGrW9vZ7P3hzZpFpaR
         f3X/OPvz6GZPZIldKOPOht3VP1khi14n3GgdqgFRnS+W9seN+Upm4ghyDVeZFVF40QfN
         UTaDzXfYoDD85+EYhYSc0ZVCCE2qKn0nV0G5Uk6zJZXNJAoum0b7SbrlS4Nq6MrxSQ/W
         0mQeibLz1Is9zYJ/hdwQGBbJ8fPNCgzXX3YUWw2QQqdGxKoLsjVkRYQxsnFeevXUAyy1
         crKm4zY52hJDWD9x4pNyz+cC3BYcnkrAXy9LDh80qibn9ancwzAWPaxH1xwnHElwZiSz
         lFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776852627; x=1777457427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZQy9kJFU9P3eGyB1KX64kPX915PftZ3EqaMGDU/39M=;
        b=S3P8mJ/BrFoM7pOWgEEBSZ4GcLTJd/+lYiSVW/VVe/m1kzi0lvMLofFyemYf9Q3ucg
         /4T39DPFBLVK5SDImWHD3Rvo5dEUwEp1Bc7L5yqVAlOVCGcvq4pT60C6e4VRPhKlsa98
         4wvjc+t/3ZutY1uHS9WujAdQcM+6LUNOHaap+QIjxHr39jwhvU0FEc4ZuMkcg0osf24h
         NO0PI7BvLar/zSp1bsOrtgwmeZwPmnzYiGHH9bh0rnkymGlGf5B72gGHXb9tpri2Kv+5
         55fbCSdino5h3bq4yPOZ6JvSHZRcC2eU7QdSHqSlb53E7XoLp5TOViex0psEOineV0jW
         Ed/w==
X-Forwarded-Encrypted: i=1; AFNElJ9gNGMzQeIS68rfaSHHtGeqQSTJ5NalGhajVM0yP2YN2OIVZcGF2DCOAySaewF+R8UE8BHlkM/KX6tJJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9cD4+BGXEcXy4X1YujBKf3oY7tKEhJwiV+Io3RcC8iotk99i8
	jpGEP3H1RB2YawIkNHvn0StqZ6BWKYT73mp7OPXmC8ndDJs7OdXta2A1MTya9K5rI/c=
X-Gm-Gg: AeBDievmvcuE+VdlF+zJyftujX8PRlboO5vA2daaN/Tv05GsIhq3cnlkbkbTq+aDZ0g
	9okQtA5w0QT6jFZ6s1bfTtoeb/fOauVRSZgZTzPDW5kq8p4Yn4sqIgmDSCD2bDXj3AEfBTnR7KE
	CqvIfYeVsLD9qi8jAMKNgPlU+sIvNIkltyfiDyYHZ8MaJSr6zlpiVNqoG0DrbJWc5CnTpAg/wKS
	lR5V27fqFGE9AAr03+Hq6ruYANfNL/NWeyD2ccDxtxdhvOT0XDkn8RX3vq8+nOTBk6kZnGU+/l/
	pvnqEl+QKAMsi4x0fR46yNusf4XiyPGtiQThwk/6HFMF2cvIWYABSO+twScF5teRBcZ1UUiw3D1
	mh00IjEctCjCjvI4NGAiVA/+4o9RVeUWaYmaSeZyOCz2gODff8wLi7qVo4m2751IGUasfzLZJCo
	uU1UQWAEx20iNXynNiUxEQFe6ZZV7xkhqpXphPkg19rbPR4fCZ5PnYqw1nuIKeHJCbpKfVqnTaj
	24KWSJ/ztkOsYB8zoqT++yhvQ==
X-Received: by 2002:a05:600c:c085:b0:486:fbdb:b718 with SMTP id 5b1f17b1804b1-488fb784948mr234327275e9.25.1776852626888;
        Wed, 22 Apr 2026 03:10:26 -0700 (PDT)
Received: from localhost (p200300f65f114e08a760282010012dc7.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:a760:2820:1001:2dc7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-488fc0b4c85sm419293425e9.0.2026.04.22.03.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 03:10:26 -0700 (PDT)
Date: Wed, 22 Apr 2026 12:10:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>, 
	Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, linux1394-devel@lists.sourceforge.net, 
	linux-sound@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
Message-ID: <aeicYlO0VNJB9m5K@monoceros>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
 <20260420090816.GA11108@sakamocchi.jp>
 <aeZk1I3DTmyx_ZUL@cae.in-ulm.de>
 <20260421125357.GA46532@sakamocchi.jp>
 <aed_ZwYj_ruoTAZc@monoceros>
 <aeh2eXBdL3bfzXYR@ashevche-desk.local>
 <aeiElvAzJRPLKUeI@monoceros>
 <aeiJRw-I622NhiHj@monoceros>
 <aeiXm6IUIK54iG21@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lpqo3i3mqf5ctrqo"
Content-Disposition: inline
In-Reply-To: <aeiXm6IUIK54iG21@ashevche-desk.local>


--lpqo3i3mqf5ctrqo
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
MIME-Version: 1.0

On Wed, Apr 22, 2026 at 12:40:43PM +0300, Andy Shevchenko wrote:
> On Wed, Apr 22, 2026 at 10:40:09AM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > On Wed, Apr 22, 2026 at 10:30:24AM +0200, Uwe Kleine-K=F6nig (The Capab=
le Hub) wrote:
> > > On Wed, Apr 22, 2026 at 10:19:21AM +0300, Andy Shevchenko wrote:
> > > > On Tue, Apr 21, 2026 at 04:07:42PM +0200, Uwe Kleine-K=F6nig (The C=
apable Hub) wrote:
> > > > > On Tue, Apr 21, 2026 at 09:53:57PM +0900, Takashi Sakamoto wrote:
> > > > > > On Mon, Apr 20, 2026 at 07:39:32PM +0200, Christian A. Ehrhardt=
 wrote:
> > > > > > > On Mon, Apr 20, 2026 at 06:08:16PM +0900, Takashi Sakamoto wr=
ote:
>=20
> ...
>=20
> > > > > > Thanks for the references. It looks like there is not much to c=
onsider
> > > > > > outside of mm subsystem. But I have some concerns if supporting
> > > > > > ARM/RISC-V adoptation of CHERI extension in Linux FireWire subs=
ystem.
> > > > > >=20
> > > > > > Any structures in UAPI header of this subsystem are defined with
> > > > > > an assumption that the size of pointer in the existing System V
> > > > > > architectures is up to 64 bits at most. We can see many usage of
> > > > > > '__u64' type member for pointers (e.g. 'rom' in fw_cdev_get_info
> > > > > > structure). I imagine to need defining specific structures for =
this kind
> > > > > > of 'fat' pointer. (The same assumption lays on compat ioctl.)
> > > > >=20
> > > > > The Standard C answer to that is: The assumption that you can fit=
 a
> > > > > pointer in an unsigned long or u64 is not generally justified. Th=
is is
> > > > > "only" given for all current Linux archtectures. And if you want =
an
> > > > > integer type to store a pointer, use uintptr_t.
> > > >=20
> > > > No, please don't. Linus was clear about this. Use `unsigned long` i=
n that case.
> > >=20
> > > On CHERI we have sizeof(unsigned long) =3D 4 and sizeof(void *) =3D 8=
, so
> > > what Linus wants doesn't work.
> >=20
> > Correction, we have sizeof(unsigned long) =3D 8 and sizeof(void *) =3D =
16 or
> > course.
>=20
> CHERI is not specified for 32-bit platforms?

(Attention, half-knowledge alert; take the stuff I'm saying with a grain
of salt.)

There are 32bit riscv CHERI machines (even real hardware[1], while for
64 bit riscv there is currently only qemu and an expensive FPGA by
Codasip), but a difficulty there is that there is >1 incompatible
variant about the semantics of the additional pointer bits which makes
working on that a bit more difficult and ugly. And I'm not aware of an
effort to make Linux work on those. Also I believe that all users who
want CHERI and Linux will stick to 64bit.

Best regards
Uwe

[1] https://lowrisc.org/news/unveiling-sonata-affordable-cheri-hardware-for=
-embedded-systems/

--lpqo3i3mqf5ctrqo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnono4ACgkQj4D7WH0S
/k6YZQf9FUngrLtMCr92GyMX0DLthDD65eSi2ROyDx6P7CzGggQZgP1/WBa7dwgg
80pyPUF7K7juQkdYWLZq12SpRYGRraItX7p21mP0Ubv5VFxGZMTCbwUi5mSKOd0/
+Gabdj844qXtseKTPl8RiM7/n+7IbauFp44rr7l05FAUW9GVk6VSFvQhAXwVwIfI
TJWshiTH9VQoi4ylpqneEksXynnUCcUc4kJwQN9P+wNVI4bTbb7lAY4JIQsrpATm
U4HW/znVhyslzkRRz3yLDiOPPxPGsBE2+lVlJEWlR9QF/RFlnmy7Hl/dmGE/oJMA
YZpeLnclkayY5MgunizbAjYaz07VMg==
=s4rN
-----END PGP SIGNATURE-----

--lpqo3i3mqf5ctrqo--
