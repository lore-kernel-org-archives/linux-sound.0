Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1312740D590
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 19:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781032828; cv=none; b=qKLqRwXo6Y9YEZESiBgl6Dt1wfmkH9kGHgTJS1F8PdBGerk0gCqTDmJ0Dj4NbypOzllMUvZkJ/qH6WIv/RUN03UI18PkYkQM0I4QeFXYUWTyhqIXfH9RhCmm1fB00TYgcecgtqnYxUT69GaqSDiAGRK8KhCnxXhQCYUIaWtl/gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781032828; c=relaxed/simple;
	bh=rlmbF+XFmpnsuEbkCrCG5OvGXP8h/md2WplUgUGwEU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ig/NVe7L9TkqWTrwySD8GGDe3QI4DLMi6uReSRGevm6E1eYWJe3F+IXQrfvI4bufCyJnijPNJSdOHpgv1TiIKOxTxtFCf0td9AebeJHHJ1cNqfaMJL0iOvmnsY8nESyR2MynLMr1pWQv7gIey3txnHxmQHncFSDgYLBQtcGKRB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=o82RCiKt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="o82RCiKt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490c1915793so40671825e9.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 12:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781032824; x=1781637624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rlmbF+XFmpnsuEbkCrCG5OvGXP8h/md2WplUgUGwEU4=;
        b=o82RCiKtfurXfuLpEp6G4ZzkV9Z0TMzyYf0io/uBe+bWjYQ/1hmRqAq4HFP/N/Ivpg
         OBgSRnxTn+Ywcvkk/toYNVU4LDCrbe1+G+Y4NOaodhKZ4OVPbp2tyEjAmdLIGeP22Lss
         MMyBJrPDxni/QwUGNFRs15MZA4H1NqQbv13J/Htv1ikK0LjwFqedbkMpGyQSS9GvfUYs
         Ik3Km0lOqg/5nGpvA2v6Kq7Eh979PyIEbfxskzde37gdU65Sp/I58P7O8Hzu5XCbRSyz
         ooSfF5Y/TwAlyq+PKvld/1nYR+lY5S4CYFDgNJ6yJdZZKOdn5AGIr5rF6aIBTzgoCnqx
         8TWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781032824; x=1781637624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlmbF+XFmpnsuEbkCrCG5OvGXP8h/md2WplUgUGwEU4=;
        b=EPCjKYl2U/zxbqLUwWlRyhKnUV+n3LBXCsYRi3/kFPdgDM7kIzUgrn6pCCmqhtuMii
         ypyOIJuXc7xdCMmd5OoeiHRxCERcE9NmDlOW528di2vI5SijjHjBmHmp3V5JZxYpyMM2
         vNL+A2q6W6gGkubcCGDElKYNH8GQENdNwCCXIqTFy4DueaNyzLZbv3i4BRVqcOZKxNHu
         5bfjXyDOlkfCzljRoeW/rr3I18/tb47d8m7uG5mY63o5vVnERAbZh+dkoEpTCfU+LiTQ
         RH1JKCWZNs6zBDPBHs0hw9AyP5G0oh9z1+9Tb0L7SyWYO1K5GAxuz/BLg7I+mUqyo0OJ
         pf6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9DPkZ4XZV+FU2lIF2nxJvbFrlZUACcWynEwsSQdf6aJdqaOeqH8VCyNI1VBz1CaS5yGqkukuohkfSONw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmz/39SfzbHwz9VYDHx3D96JI8lBlcbCrYbgjhegfxMrxLT6MM
	98JE8hot6Z2K9DV+XCODha7nx4SbF42YxKsf17SPQq/lzskKzOXfg0lpWUan0mUksJZTfkzsGo8
	ROtf3
X-Gm-Gg: Acq92OEy7Z3SthfVU0C2ANR5iqfFpIgC2/DuUFsWT8VG0/GaxpV3CrmfSCx/G9SqwxG
	W5jeUdUTZHERpfMFoG8pEZqObrbEF7zoPafQysBRcbJdjk3hh3YqzmeB71EngA43ZsPcGHjm1R1
	A9IdZP+w95dRmEcYEbp1VE0a+fjhcuOKS9nAyyvZdI+1+sQqSNV70Uj5UzT9c6GKkdrkDeSu1Lo
	9YZAWmBUy07R++zFNxgeEubNMXF0YyX6lbly+R7wOmdwnpt8B5BRdiHmVci+5GKraMF5TNeknpP
	i7kFTIyO6vClZ284pUr0WQTyjWoIxyojqf+qPusOdbhyx7L8RoGnUkKmFF7EY96dbNwvpkQ3AK1
	9aALGm0dFCY8qOoujGBTBYh8g+M2eF8ymiYRZ9k8GdzD7aV3lg1LxQICUWva5H5jTsgfIJv7d6O
	zPSindZGNlZW3LM4eo/LV415eJPxUFP49UjNki4aU=
X-Received: by 2002:a05:600c:530d:b0:490:b92f:ef5b with SMTP id 5b1f17b1804b1-490c25d4cfcmr389552525e9.13.1781032818258;
        Tue, 09 Jun 2026 12:20:18 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-490dc47d4e0sm4497415e9.0.2026.06.09.12.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 12:20:17 -0700 (PDT)
Date: Tue, 9 Jun 2026 21:20:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: Improve style of pnp_device_id array terminators
Message-ID: <aihnGSmBPNjccGKR@monoceros>
References: <47ae32220446ec1869898cf5e4b75ec94c32dfdf.1781023479.git.u.kleine-koenig@baylibre.com>
 <15b9f06b-952b-4c55-aea3-fd64f456d30e@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="svdunbpcuffeoucd"
Content-Disposition: inline
In-Reply-To: <15b9f06b-952b-4c55-aea3-fd64f456d30e@perex.cz>


--svdunbpcuffeoucd
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] ALSA: Improve style of pnp_device_id array terminators
MIME-Version: 1.0

On Tue, Jun 09, 2026 at 08:38:57PM +0200, Jaroslav Kysela wrote:
> On 6/9/26 18:46, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> > To match how device-id array terminators look like for other device
> > types drop `.id =3D ""` from it and let the compiler care for zeroing t=
he
> > entry.
> >=20
> > There are no changes in the compiled drivers, only the source looks
> > nicer.
>=20
> It's not true. Unless the matching and lookup functions are not changed,
> there's difference between NULL pointer and pointer to an empty string.
>=20
> See match_device in drivers/pnp/driver.c - "while (*drv_id->id)". Your
> change will cause NULL pointer dereference.

That's an easy but wrong diagnosis that I fell for first, too. Note that
=2Eid is not a pointer but a char array.

Best regards
Uwe

--svdunbpcuffeoucd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmooZ20ACgkQj4D7WH0S
/k4emgf+KIRD+pZZMDj8W8g2J9mUL113vwgqTF5NR0dP5e7sIxITJiXnQSRTYs9U
CGsJoP+vD/gKn2aI1vw16VHdQbdKdp/QJMDZTahmP2WAVQt1aWx97O5+nuy+cDXN
Oc9pnO5RHjIFaxUkIFuZAZeHH42jHEqImjCA8T0HXKrbnXsjF0GHAEXP/9vAkaF9
m6ib9uJTjInRhx7WagKksvf7GA27lZGBwZtIOJwH2bzDjDXfShbKLl2JY8NUfjzu
OU3tT/gSKLrEuA+j3JWN6vVqefXP2KbfJgvHhJuJQ+NTEz4j8YhVoLJtsUkIYNye
Tn9/N43YdYDsVErzmsm/qbKHrGq4MQ==
=e3IW
-----END PGP SIGNATURE-----

--svdunbpcuffeoucd--
