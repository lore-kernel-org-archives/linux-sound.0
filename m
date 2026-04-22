Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F31D1A9FA7
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776847216; cv=none; b=W9cmSWhBXyTLUbpeayTEf6be891GMIqKn5ul72A7+AvItVugCwJQiFZL85mRX0Y8+MrVvhYfCdwDVaeYLjLUR73DPspziDoQtwK4F3Ih815t8lsONx/zWSIdlEmQ0kdGFY9DiFIHJeCO59nX3TXWf3pRjVl10Ieq094GN+DI+Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776847216; c=relaxed/simple;
	bh=he1D0MM88OnV1y8IetALIaxrHtbPYbbrHFY5t6qGMfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNELgGgXmmjc6tUJsPL3T0zyLszTs60KWgLWYCFUPfGNBl1Aq9OMV5HRezjxqx9xqFUO2MSuGd/ZmU8olIm8cE6stcwCq5MQ22TsHEveOamwfXzzdYeCYQ8H4AsFAsaWi0ybInByhgCJygr2bFOmBxUp2iCSoEp5LQr4zkwKKEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=pLEPWlzc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="pLEPWlzc"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43fe8bda8e9so2693726f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 01:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776847212; x=1777452012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=he1D0MM88OnV1y8IetALIaxrHtbPYbbrHFY5t6qGMfo=;
        b=pLEPWlzcPMERZZdQ5t5H8QQuVZLcgiL/GHmasm1ttTGwR5+9YajsfI9tvn/53LIVZK
         ngHMsJuRwAV99H4+2kD4aRZ3+/pUtWZw8BKJpWb0IoFmj05SGoZBYlM/uZ4YaAms9pCa
         OUP7IVoz2K/HOwS/48mDBWA2CVDTjk2BjBTA8ToFYPagi8fCKboIXHVZyE9oQDS12yhY
         kNWjRLqM3uTXgh94Bm/hhD/cjiOlFa8f3fOd98CDXOIScAvhrTqH7rVm4dDRGSXGCnDr
         oE/z6jh105VxK9/LV/Z2fVKhdBWg4zFf3aJJxila6QWzumRhRGMJPjswRGoHjZ7B4s7T
         K6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776847212; x=1777452012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=he1D0MM88OnV1y8IetALIaxrHtbPYbbrHFY5t6qGMfo=;
        b=L5DQX/CRSUa+0fTLLHwh/iK+OYotLWEs5laCstqEz6wxs2khDXbL2eYMhfftiRX17f
         BpV0DwtF3Fkky55Ibb7ZVJugyc6WLonpl4/C/HfqhQ8gZvXtg7nktwcCWPqVGxgx5mOH
         nQTtGD/JEz0M8FNpzSIflfkJAmrayQmfv/ekkDJ3T5/AzD90+LN+kjc2I7wkrFIdfIGL
         cDLo9OM2HK94z4h+cENp/plmanyebth+GnsWR9slKg1TKVJSc2VMJzKGPav2qRHwo09k
         PwnHiG4j3P9tzIcTfmI1H10kj4nPsgi31xr1+tp4YyWfe62ayqr7iL9wuqdopj3dWbCV
         bTZQ==
X-Forwarded-Encrypted: i=1; AFNElJ841c0fZBuovQLaEItES0o77XSPL+QXt4kZPjpoNPQabQfakUaBhNPQQ/tQhnfxPDnD4ZTfqpweKHIeJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgkAqwnoaBdy0an9U/BCh8t/guoYjNVp3Cb74Ok69Tu0N+5UJs
	EvQ0eUAjKDqIib4idA9AQwI5ZurN0MtN8xUHNlximT/PK8tpBjUdKKunBm5KaX9zCsSWcmk8Act
	ejY3G
X-Gm-Gg: AeBDiesSHy49TGpL/m4X+wEqlpsViMdgudvuDt3iGBa7cxpXj85dxNkOz4JvU3kZX55
	jDMTvVMNcMlLR94AfbBTBGlEZz06qQOF3wbrySZmVBIgJjC/stw7xhjypgrbjbHaLnVuOOKcFbq
	b4cbJE9hPNIJuLOZ3Lcqa8OJGOxNuhcavZQKE7/42iS51eiFbzkoO66Q/WQYBF4XHNTXiYe0fyp
	L+fKnRrZ3XgAy2ehResAKw/gpY72zIcuYkfYs+Lk9dhT3ETvWd0zUDhhhIfvXRbKB2OjsHksIuh
	juU7SE4SaXJFG4lfaVt+j6hqePPxL7jNXTDc/udgpNZSBkR3FZqNlmPnTI7WuXgaHYHgY4j7jxG
	+Au87KoEVMpr57YRKWcpEa2n1LfYZ1JgNqg+dmFyuIQLsXoka1iYnVZz0CuDBV2Xk8eSheRsMde
	inia5ZeDKp9HhtgA14mYOJ5aOvi4AEhOzxqals6bW1wyQqsPjQ0SZuoHE+0pj6qELPg4dQrj8pc
	c3T//geYe7n9RudKEsrXasVzw==
X-Received: by 2002:a05:6000:40ca:b0:43e:a70d:763d with SMTP id ffacd0b85a97d-43fe3e14e43mr32928616f8f.46.1776847211344;
        Wed, 22 Apr 2026 01:40:11 -0700 (PDT)
Received: from localhost (p200300f65f114e08a760282010012dc7.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:a760:2820:1001:2dc7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43fe4e3a18csm49986758f8f.20.2026.04.22.01.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:40:10 -0700 (PDT)
Date: Wed, 22 Apr 2026 10:40:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>, 
	Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>, linux1394-devel@lists.sourceforge.net, 
	linux-sound@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
Message-ID: <aeiJRw-I622NhiHj@monoceros>
References: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
 <20260420090816.GA11108@sakamocchi.jp>
 <aeZk1I3DTmyx_ZUL@cae.in-ulm.de>
 <20260421125357.GA46532@sakamocchi.jp>
 <aed_ZwYj_ruoTAZc@monoceros>
 <aeh2eXBdL3bfzXYR@ashevche-desk.local>
 <aeiElvAzJRPLKUeI@monoceros>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o6cal6n77lgebwiu"
Content-Disposition: inline
In-Reply-To: <aeiElvAzJRPLKUeI@monoceros>


--o6cal6n77lgebwiu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/2] firewire: Simplify storing pointers in device id
 struct
MIME-Version: 1.0

Hello again,

On Wed, Apr 22, 2026 at 10:30:24AM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> On Wed, Apr 22, 2026 at 10:19:21AM +0300, Andy Shevchenko wrote:
> > On Tue, Apr 21, 2026 at 04:07:42PM +0200, Uwe Kleine-K=F6nig (The Capab=
le Hub) wrote:
> > > On Tue, Apr 21, 2026 at 09:53:57PM +0900, Takashi Sakamoto wrote:
> > > > On Mon, Apr 20, 2026 at 07:39:32PM +0200, Christian A. Ehrhardt wro=
te:
> > > > > On Mon, Apr 20, 2026 at 06:08:16PM +0900, Takashi Sakamoto wrote:
> >=20
> > ...
> >=20
> > > > Thanks for the references. It looks like there is not much to consi=
der
> > > > outside of mm subsystem. But I have some concerns if supporting
> > > > ARM/RISC-V adoptation of CHERI extension in Linux FireWire subsyste=
m.
> > > >=20
> > > > Any structures in UAPI header of this subsystem are defined with
> > > > an assumption that the size of pointer in the existing System V
> > > > architectures is up to 64 bits at most. We can see many usage of
> > > > '__u64' type member for pointers (e.g. 'rom' in fw_cdev_get_info
> > > > structure). I imagine to need defining specific structures for this=
 kind
> > > > of 'fat' pointer. (The same assumption lays on compat ioctl.)
> > >=20
> > > The Standard C answer to that is: The assumption that you can fit a
> > > pointer in an unsigned long or u64 is not generally justified. This is
> > > "only" given for all current Linux archtectures. And if you want an
> > > integer type to store a pointer, use uintptr_t.
> >=20
> > No, please don't. Linus was clear about this. Use `unsigned long` in th=
at case.
>=20
> On CHERI we have sizeof(unsigned long) =3D 4 and sizeof(void *) =3D 8, so
> what Linus wants doesn't work.

Correction, we have sizeof(unsigned long) =3D 8 and sizeof(void *) =3D 16 or
course.

--o6cal6n77lgebwiu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnoiWcACgkQj4D7WH0S
/k6vZwf2MaO+hdizR/dfeu806x5LS+2B+xB3HB1ZZm4Cd3NhNoUCYCUb/a7BxBij
wKU81Bdyn8mw8XvBq/njGVf1nzzQxcR9FvJBxv0Odw+feVvRGbzolWAcoqw2h5i0
05rcfPwxNlAEjUDkEeRRzzx2ln5PRU4Ziv1ugELVESvngAI/UmK3ki376hMNdugd
Q5LldfxVSN/Djwqcn5hP5g2G8fhUnYwkSAAVz8f5PHv1XvRKKpGnc7cKLHC1VBD2
Lkr8j27JpE72z7Vd4QYoLFPBBI9+zRChDsYPZhh79CN4BIcFDFJmxvEgAdUXCpR1
0nkuAWXPvOvNw1mGmaMuKtiMBVUY
=aFGC
-----END PGP SIGNATURE-----

--o6cal6n77lgebwiu--
