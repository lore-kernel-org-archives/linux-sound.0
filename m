Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317CE274641
	for <linux-sound@vger.kernel.org>; Tue,  2 Dec 2025 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764691963; cv=none; b=bv8qut/9+nwAtrHhJo/mrFVHykM2pxp1crjEQUhca06ZClcWrxYdV/iubW4jrjfVT+WXHhJYAjqCqXWANiU2EZXV4ZVFescLJyRvwtCjCku6xaWCa+4ub93tLBs5fh9s8S2rsWr4r7OsA8nPN5/xDig+P637UeW22UgZbkMemo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764691963; c=relaxed/simple;
	bh=jGdyl39hGBTfFSqZGJdIn2Ab54gJcV0leFG5tbuxhQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOuaqPSXRH5rjjxG0C+hPhQdaEC7Z3MEaIuKc1jUHwsxj11RqjwT8EOz+pVg9WmxorzQGI6bkyHQNcH5uD9jx+M8HWJHuBFTcpC1aml0O8JHr8bJxjRjQYSU8e4nOOgw4EY4WQAXjcbBd981IgTef/qLtw586isTvt71tCGqyF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=p2A3LZch; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="p2A3LZch"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso9539848a12.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Dec 2025 08:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764691959; x=1765296759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UrmKwjlopRXYcqrFBEa/DTaDmyfP+x8xcBV9ce6wHdg=;
        b=p2A3LZche6u5Y0Z6fbbA1jEz0uTV9+J11oEhEQR0CNFmrS5s7cGAXj3WLI52SOiwYY
         5HZWQ4vxarof/ZAZkk74IwgABTGTKWXK6/fE50T2YNVlWW9gr34hcZu8+SrJtBwHPwk/
         xXE0UzYyYYaSVWBa5rFsd2MiK8ARynoQYlg8gYykT4N0LUXNDog6ctlM8l6I2AdIt/Cl
         UlwBI5bwSi9y7Df8+Ucd7q4q6PEBkS9D0ZRFRTmznMBw+sitZOdmR42nmZClsqqbqhI+
         y5vvh/MxWEKz/vYBGaiBondxiKtvNDRb/i/HxHXmKfJe7dilgRcigwscEvFFwQzNqviS
         2iRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764691959; x=1765296759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UrmKwjlopRXYcqrFBEa/DTaDmyfP+x8xcBV9ce6wHdg=;
        b=WAxJrOHdmr36+1/udiiTXuVEaqYow3dysADUE8R2rsKiKGFCpDwYIJccPnxkdUBkPW
         yrA7ma9lIHJbq5/GtCPCboXWxGQtD4ruiE3PEfqND9gImiUZ8pkr0bOQVQU8y54+7dkA
         zs7X/5sRk0gY4CeATRS8ft7T5xP8os0lOHRoIF0BANmka376r7mCzf8X606KiUrBeSL/
         CFntSGZfoZJCFQqEVk//K/714aHZ8OHb3cechrbTKBsPISX8k7sO6mdQVriVkzcTVcV4
         WZmj1E02v9bChYgc1KfhEn1Gihq53/fSjvbjU+jFv1VnuQ1bIK58et+4RwX3DCHDFY7V
         84gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPK7AOl2G2+Pca0b9tYuB9CM49Ee6f9c5z1VvqOoQ9Z4gorjMs2aWF5K+6NXTw5BSK26iTV1p0oBjenw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx408FO/2Dpc2aWA7I9R1vr6vp38Yv0aA2nfHw0HTWQ1uRvZbmm
	Xf43n8kay4QoP10wHYH3Y7a3XwHLQIm6ny8xZDSfGfVf9ULk01fMqSvwZGPTT/bsJ/8=
X-Gm-Gg: ASbGncsQNlBuuWsePU84YHCATtQe6r+/kC/LsewQARMgUVgR1tFkS2pCYOfAxkgXY1K
	3iXXO/ohZdUQYRZvqjSMJBAJNml4/KhBypBdX8AOU99MpdclILZc8cjgG17t9QuRhKpYahRBHVE
	Qsr5vp18kRVWL11r0aAczAoV7Cha594J5I3ORazffRo1QoD9/VY+jJ6ZzgC9L+tHgiP1j0FFxtL
	iQzXH4UypbFotbhTlE6ems9aN+2arTFskcNKhhrdZeDX2W6w/ofYI8mrSkPFt+dQCnrU6uEoXRN
	yvKy2gE3nJN+I3fjXpGbICIlvxA2qBbVpVlsTr6lXf6cGtv4EoCXLt6HHllbyVG2+B2cq8avOsx
	60cVK86l+tX/RKRoHo7AWZ/j2yZo5eJlaeEit14Fy5qB4KAJ84I6gvFfXU+yv08T2ap5NFqpdk0
	VNAIctBS9XSJMb+QhtcjwlZ96vPJWv2y+IPK/AVrJpZPbYfHhVJDgn390HLUfF32t3GWjn+dMKV
	LI=
X-Google-Smtp-Source: AGHT+IHkoj4qi3VuuoXtMn7oSySNt+HflKI8cJYIZkn8DmdL3Zp08Fss6KvLm9mOz3t7CAAtYknZ9w==
X-Received: by 2002:a05:6402:12c6:b0:643:130b:c615 with SMTP id 4fb4d7f45d1cf-64789263babmr2197112a12.6.1764691959402;
        Tue, 02 Dec 2025 08:12:39 -0800 (PST)
Received: from localhost (p200300f65f006608cf714cc86879bb1e.dip0.t-ipconnect.de. [2003:f6:5f00:6608:cf71:4cc8:6879:bb1e])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-64751062081sm15877219a12.34.2025.12.02.08.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 08:12:38 -0800 (PST)
Date: Tue, 2 Dec 2025 17:12:38 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Clemens Ladisch <clemens@ladisch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/9] ALSA: seq: Use bus specific probe and remove
Message-ID: <3dd7gqk2mk5zppofatenrjv65womknptmrbeh2xzkkdnyq6ola@fkawcyiusdf7>
References: <cover.1764677854.git.u.kleine-koenig@baylibre.com>
 <87v7ipt1cu.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lvoxzhlytr2neuyl"
Content-Disposition: inline
In-Reply-To: <87v7ipt1cu.wl-tiwai@suse.de>


--lvoxzhlytr2neuyl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/9] ALSA: seq: Use bus specific probe and remove
MIME-Version: 1.0

Hello,

On Tue, Dec 02, 2025 at 03:17:05PM +0100, Takashi Iwai wrote:
> On Tue, 02 Dec 2025 13:35:49 +0100,
> Uwe Kleine-K=F6nig wrote:
> > for the quest to drop .probe(), .remove() and .shutdown() from struct
> > device_driver, this patch set converts all seq drivers to use bus type
> > callbacks.
> >=20
> > The dependencies here are:
> >  - patches #2 - #8 depend (only) on patch #1
> >  - patch #9 depends on #1 - #8
> > but I guess this series will go in in a single go and there is no need
> > to coordinate merging.
> >=20
> > This series is compile tested only, as I have no access to seq devices.
> > Still I'm reasonably sure that there is no user-visible effect when this
> > series is applied. (There is a runtime warning introduced by patch #1
> > that goes away with patches #2-#8 again. So future bisections suffer a
> > tiny bit.)
>=20
> It looks OK though a quick glance, but since it's a bit too late for
> 6.19, I'll postpone this series for 6.20, unless those are urgently
> required for any reason.

There is no urge on my side and 6.20 is fine. There is still much to do
before struct device_driver can be adapted.

Best regards and thanks for your feedback,
Uwe

--lvoxzhlytr2neuyl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkvD/MACgkQj4D7WH0S
/k6Tnwf/dptb9h0mjb3fy1CBzwAtgrVPJMwxqx0Uezy4eZEV/vxOYlTxDdBjLSI6
tq8tL+S2x5dXsqkp3+AQJqtrQaCKinEfxlO700FQfWKCIjtpeR5wBEdlABU7OtmA
NJ1fUZRDCewCKQhXc6CrF/zOJEPUHYXcVBN2Qe0af5WOXkogwWVbnqB36Rqa3TK/
PGyKtL20zbY0g6RzhNHZ2THzfibLg14WpyuYVlu1uyaq1f9jdw0n45Idgwye/D7x
a/GE1tds9sIIsS20X2c6SGIqeUthjL5IBNCyZWi+HszUte50RWTMCLj772Yq+sTB
xVosRgk0UrbvoVKoonEK26he4jJEgg==
=siBO
-----END PGP SIGNATURE-----

--lvoxzhlytr2neuyl--
