Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6022D063E
	for <linux-sound@vger.kernel.org>; Wed,  1 Jul 2026 15:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782919217; cv=none; b=jSODzZUAc7ohy9I8nJwIHjwVfj4o9gJ8CRjoTGA1Sqc8VqKcYZVpZfua8zBKOucvnWMKqPbMlebDn3WORDAKYt1meAzcHD2f4r/KEOqnUKjPkctRM7ZVbLyRDWzdF2Y6k3wwwEyMpwUOdDBR1QJaAuMvhvE4Wdi0TU67vnfpA0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782919217; c=relaxed/simple;
	bh=WoEMouwpJ9MP0SByDC6EGgovMZINBtXRAayeX43OEAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HH3UlT2EzNr6AT96b6fVI1Xi2tnkWt+9Qj1WIQ6dpZ/VPWm70MTQ4uxVV4jaN/oPM4m1UWFw1pvN5gdKRi16xXrwxKUUvFhIrLBQs1YTdbwxkcr4dd4ppLHkbq2U9lOandJe5SMIj1W+idNXfkr2Dikstwzea0ABi+LKPz5CsD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=L2PZnNjg; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="L2PZnNjg"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso521287f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 01 Jul 2026 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782919213; x=1783524013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y56nzJkD/cZOP4zMLr6iT6rkAPVerpYOSX82UBBme6Q=;
        b=L2PZnNjgnSmwX05U/U1hWAW4KOGWpRfM9J+eNFPoGSZQTl2yePwd2ZOdFgECFbmc6c
         iI0osFhRYkWVTbq3LLrgzkaw+Fz//jlNf6zFUkqPMKH34ZELAXBt5kDgIhTVmdxbUeaF
         E1P4wDJ/bcjAX3H8VWS5+NPIXi3gv1zGjoYF+9/AC7/VMnSWILIWucI6Ju2TRmsHIKGo
         c9EE7fmJTiPTTCUxkvJebtrovAb/5rMxtPWVbgq8ZflVBHI6rWREWVlrurIsff5u8sew
         1FVjLYTksQPhZvg5/GKWWnI3QHxSIEo4aq1ux+O6IrLGqk1nDPfO9znHsy3Ps93woX17
         VmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782919213; x=1783524013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y56nzJkD/cZOP4zMLr6iT6rkAPVerpYOSX82UBBme6Q=;
        b=UgaQJWm+GcOZOWL+aCbVeNbkTtKkbzvaHe8UOol4OeiDA4hSXnSqoPgdlsd+ycGPOJ
         o9WnkGmD3nkCJcc8QnQ8LTMtVQY4yvcV9fGj33/LJY6oB4Q+p6GmK5xmHE0iQTlJXEQE
         bGMqQAE5GJ5Uy00diDjcCTGFTepspaz65TTgx25XVn5QK5fUeFChNH74k7C8CSNRvEp2
         fHsfYrsxPfGFl5LEQkTr17NqwEGqfE0ExjTI2GK/8iDhTJrH+GX/SaRMVtWWORnkSd6T
         Q79NXaBjN/Qo0bsxKihktK8BvZ6lMJusglD9wYHeryinP4qKnmL3yCntVFLa6VhNEXzr
         HOpA==
X-Forwarded-Encrypted: i=1; AFNElJ9xUvKsHBSy/ysbSuZfbhGZdszetSpDSg/KsY1nBd5s8aDR4+9DQeRoz7QJZY9wR1HnkuF92pD7iH82cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQCdrvwKcHP+Z8RycdZRXfrHF4Z1gdr7RJCrwGfrZcT8YBq5Gt
	dbHLCpsD2iyy0lRGbiexldycu2k/g+Jd2A3uN/2vzeS5vcB08eVDCR1ueccC5fLmUkPL8mM081Z
	TIqF90FJA8g==
X-Gm-Gg: AfdE7cmhmuFdH1gFyECaXUDHEu4y5Ec+IIbZSCPHh5JKKZuC5ERFTiWyj74mn4ifVML
	oTS59M8DzmoM3CkSyI0SeehqDIaAn2zOWzqOqI0jiFUxBvyYgLtVwcIvUAT5MgnkmHcGSJlJ8Cj
	HUgHyAgYh55keXmYccvySueq8w7US4eGWizDyCx5HtiqCUuh1PFS91o8sWyqJuFXe/rOycjIXab
	aEJoyz3JCIulH2J7U04VTPstDlm3WCghzhiOc5RKH1/uIphOp8+oLPblpJ+2jJ9vRT/knJparEQ
	gI1I2eKFzZ3/MrcSdJS/WdefnfMm8TFNkEjZXcd2jz9H9KT8Qg95xfbi/yOeaZbSUibgOmhVo05
	sGvKaaiSeD0fXBAfng+jN5uXq/wmbe0JC1yOBKn9HnCEeZDp87YvwedD6uHY4rRKGoKVEhDMmD+
	sNweTOBPgqKRStkJoOOEvDKm0vLywuKf2+0UD8GBwmR34r0ZmRotiuf7TyKD7ca0gBDZ+RNBZ1H
	XzZ
X-Received: by 2002:a05:600c:8b2a:b0:492:6113:d4fc with SMTP id 5b1f17b1804b1-493c2b56fccmr33875115e9.17.1782919212545;
        Wed, 01 Jul 2026 08:20:12 -0700 (PDT)
Received: from localhost (p200300f65f47db04f795131629de758f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:f795:1316:29de:758f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493bef17c82sm43085345e9.1.2026.07.01.08.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 08:20:11 -0700 (PDT)
Date: Wed, 1 Jul 2026 17:20:09 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Sohil Mehta <sohil.mehta@intel.com>, 
	Raag Jadav <raag.jadav@intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] soc: qcom: apr: Drop unused apr_device_id
Message-ID: <akUvg-U8WnrwyA7f@monoceros>
References: <dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="clqrflh2ukfelm5m"
Content-Disposition: inline
In-Reply-To: <dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org>


--clqrflh2ukfelm5m
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] soc: qcom: apr: Drop unused apr_device_id
MIME-Version: 1.0

Hello,

On Mon, Jun 15, 2026 at 12:04:28PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> apr_device_id was introduced in commit 6adba21eb434 ("soc: qcom: Add APR
> bus driver") in 2018, and since then not a single driver made use of it.
>=20
> So drop the unused id_table pointer from struct apr_driver and move
> APR_NAME_SIZE to the apr header which still has a usage of it.
>=20
> Note that with the id_table being NULL apr_device_match() degrades to just
> of_driver_match_device(), so replace this callback accordingly.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
>  drivers/soc/qcom/apr.c          | 25 +------------------------
>  include/linux/mod_devicetable.h | 11 -----------
>  include/linux/soc/qcom/apr.h    |  4 ++--
>  3 files changed, 3 insertions(+), 37 deletions(-)

Just a heads-up: If you apply this patch now, it will conflict with
https://lore.kernel.org/all/cover.1782808460.git.u.kleine-koenig@baylibre.c=
om/
that I expect to go into 7.2-rc2.

I intend to send a v2 of this patch once -rc2 is out (and if my
expectation turns out to be true).

Best regards
Uwe

--clqrflh2ukfelm5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpFMCYACgkQj4D7WH0S
/k7GlQf/exJd7rEL7b7hgfotikQMGakIuf8l3GZVzu9tUv9xP3Z/eaqb7EpuGQBW
b4ugFTFXxqGkmtd7Om1J90fTGaub4EsuVyvEHC49ZNFO5d7qmBF13b3WtiKXWENh
nlRX2id17Zrbh/JVA7Hbt7cFm3PvRV046Mm5VT3OIu1o4+q3b6BoEaJR+wdWS+O8
huX6p6QyBCLsyz1Ii7psCNGeDa9tnSuEHS1v1BromDePGzOQ2jfAqjuk5Z06n1vc
wh8JNgOkIkCE2f1yHRNRDZoz480V9XAeFi1w4MJNRe3yZIvNM6wePkCwdhhhwzly
GUqiX2FfdNJGp4T708tzIO2gAUSA1w==
=76mf
-----END PGP SIGNATURE-----

--clqrflh2ukfelm5m--
