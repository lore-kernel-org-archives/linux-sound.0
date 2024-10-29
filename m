Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21701E0DD8
	for <linux-sound@vger.kernel.org>; Tue, 29 Oct 2024 09:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730193817; cv=none; b=H3nHOwY+whgFJftb5QupKJI54KHm6bHV+gawy76MsnyBs7ckcsMee3Qr7mLpYOG/aLcflzePr+thFyC9XiWy8DvQUE998p8zcOcBwOY97hJW/iaZZe5+KbYlbXzmuFo9jKic1fw7x2l8kql4aBJFDpr88eT/fx+drMx+/p+iGe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730193817; c=relaxed/simple;
	bh=CQnjdf1BvZTH4XhAxhOmXjNSVP+htdTUSRHZ+NtHwTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naJXTh4+M9aMDM2buRmFaMYfxKssrIIHeVOWPWZ0zi9YhIo7yLJ7chrnzi3Kd0xWyL2xNWWo0k2O7EWjVTHBuqIfl00f66JrOsCptaWMsciUsjZiTurdvAY524+w22I7EN4UyOImiq1XQ9N26/FOQI057YJ/ELoxx7dFlZyNeAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XF+poxnT; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XF+poxnT"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d4c482844so3507169f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 29 Oct 2024 02:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730193813; x=1730798613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQnjdf1BvZTH4XhAxhOmXjNSVP+htdTUSRHZ+NtHwTM=;
        b=XF+poxnTTz1vGFpBgPTmr9VvrkdSdCRImtWmvhGwVKVKlAFX1q8jeTWojm8No7xFr1
         +hIesp/w/cUFvSrGLu7gB9iu/Gfj57hE0SPoMei8L34xTaTkHSNjZuS8Eld4O55dPMV2
         n0uszf7ZbHqnRJZIWBFxAAb7vJ8BOXc76HJj1amAgooPMnD6C9EB7V9vRaPaB1PVSA+A
         bw47U72GQuq4MmrrtROEtxhhQ+J/O7a5jcvnjZlopP8WBfpKT8s+dcfIl4sjqP/giA26
         CKhPEhfMsBjPJzRg746fCUw17Cy3ZgTJyf3BzN8UI7bcFzg57Iuvg8zxUteEtuBjEhXs
         eeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730193813; x=1730798613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQnjdf1BvZTH4XhAxhOmXjNSVP+htdTUSRHZ+NtHwTM=;
        b=DOw3qYBU4BCEP6abO9Ul4LLR+eeH6eywAl/IlvxESL61wARbRe1MoDH/UWsiV0QpNu
         +0zUwsXIj8qufXak1HnEOc6zIxzKnzxjSxtyYCHDY4MLVilP/TEf/+ULVhwl86+MNtRm
         CGEYO18N78khI5pqyeOZECdDMkF5YGMAxbyRQRi++SgyffTcCcjQ/qeNrxuvtrH4rodH
         AOGxPkWpwGqM+KdMF3YwcOEhjWhxuyvQy4+ktaV1nHLQrUQUyJWd6JHJBDKSPDTkliFJ
         YsImeXUQSqs1Q+1sKtYVij/UnSkktcMLmdJzXl1T3y486D/1uyFYeUZvuO63/uBd4pw5
         Onpw==
X-Forwarded-Encrypted: i=1; AJvYcCWHi+0YW7Ik66I6Hs0AtWIzfcf1YgK2nsaNw3SsCUCZ+UCb6Ouo+Y/nl2bI5D/LvULZ6IS1dh8iUhJnZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjApzum4wdo2lM7jQso8cV+c+ci+tGHLz7Zt6RN99kfDDWQttZ
	a+tKhUgCQC2r8THT7kg5KuHGi4OCOtGz32GK/uIyo0bJR5JHqVHZi8snuGLw8co=
X-Google-Smtp-Source: AGHT+IH1aaCnWxJ+190B4X3rRtI27v+kXSCMfEXtrprcgTAAwyxSHjsuSln+B4lGQpKN2Z0UMJ9hgw==
X-Received: by 2002:a05:6000:104a:b0:37e:f4ae:987d with SMTP id ffacd0b85a97d-38061159141mr7795045f8f.29.1730193813087;
        Tue, 29 Oct 2024 02:23:33 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b71479sm11836108f8f.69.2024.10.29.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 02:23:32 -0700 (PDT)
Date: Tue, 29 Oct 2024 10:23:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ivan Orlov <ivan.orlov0322@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] sound: Switch back to struct platform_driver::remove()
Message-ID: <mr7tjtqtmblum57yirmvfhzqg5rhyqdotlzn6kvjk4nlixyqrn@uyne6x2vefp6>
References: <20241029073748.508077-2-u.kleine-koenig@baylibre.com>
 <8734kf2sa6.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e4aa3yd6q5uca44q"
Content-Disposition: inline
In-Reply-To: <8734kf2sa6.wl-tiwai@suse.de>


--e4aa3yd6q5uca44q
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] sound: Switch back to struct platform_driver::remove()
MIME-Version: 1.0

Hello Takashi,

On Tue, Oct 29, 2024 at 10:05:21AM +0100, Takashi Iwai wrote:
> On Tue, 29 Oct 2024 08:37:47 +0100,
> Uwe Kleine-K=F6nig wrote:
> >=20
> > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > return void") .remove() is (again) the right callback to implement for
> > platform drivers.
> >=20
> > Convert all platform drivers below sound to use .remove(), with
> > the eventual goal to drop struct platform_driver::remove_new(). As
> > .remove() and .remove_new() have the same prototypes, conversion is done
> > by just changing the structure member name in the driver initializer.
> >=20
> > On the way do a few whitespace changes to make indention consistent.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> > Hello,
> >=20
> > I did a single patch for all of sound. sound/soc was already converted
> > separately, so isn't mixed in here. While I usually prefer to do one
> > logical change per patch, this seems to be overengineering here as the
> > individual changes are really trivial and shouldn't be much in the way
> > for stable backports. But I'll happily split the patch if you prefer it
> > split.
>=20
> It's fine to do this in a single shot.
>=20
> I suppose this can be applied for 6.13, not necessarily to be merged
> for 6.12-rc?

Right, this is not critical and I consider this merge window material.
6.13-rc1 is fine.

Thanks
Uwe

--e4aa3yd6q5uca44q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcgqZEACgkQj4D7WH0S
/k7PTwf/RuQE2So+Bj2/unZ19jDNVY04i3Yaa0IrSvWShbO7Nv/nsVzANSVA6jUU
RRVMKI8AUoBJfFn4R+ZodJnwtjckrihdYHVIBnfB4krigFCmPCydnq1ANy0qMX+E
EbsWx9Q49q5Q7IQayl1BQA/PzL0GzKAase8VT+A9VlrJ5EHgz06aeEJtZTwutQKK
Q11L0Y0rkv/9abSCq1eyEDYvISb38m8iGr9J2iY7gAWVVuUmEkMqR816qixk7n2m
kPdT7cDib074IgZeN0ir30E+t4pT+IsIEDaelPwGia+A3iatvvG/D65jcThdIC9D
7GxxrOXjxiYz1IZcAJwESz+aYyScmA==
=w7Ha
-----END PGP SIGNATURE-----

--e4aa3yd6q5uca44q--
