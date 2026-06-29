Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3048C3368BB
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741465; cv=none; b=cO54ZzacXadyQvxV64PH7m5Otz38Kv6VRiVMxXPezgca9zTPXMW9k6q0eHOKUxbfky0Yq6BFiineV9iwF0BefSsg1cYYGgAWG2dwvCezAyZnbGMEPMjSlFBh23Qkrzzdbf8Kt3Y0e4APeJjmh3I0LyKZP+GpEpO8gIblQn1Jruw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741465; c=relaxed/simple;
	bh=T2QhuRW8qzDrLVEr928/p25aFyFNDixREii3ZrsHG8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZC72HB9zmekrp3D6J57rkhoke0IU0BT6bUDNXr6h+90TkdkCfo478vWFEw4PZ7Px2flsgSds6h5LR/LZHSVeCr0s0A0ECjwK0dmfWyuzND78ou+8LTuvLPt3sVb4ky4twpJCVfsxggrHmjy3Fxce43FQG4dOzZcAxDhSqDr3Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oCld/ExR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oCld/ExR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b779003fso517175e9.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 06:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782741460; x=1783346260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fi+aOF3X0XE+EnDA3NYao73z90dCW8BKgRHxnIWsmow=;
        b=oCld/ExRZ+DqEBLH2U/oGUCpLv4iqQ7NSQ90Mav6b9tqk1qMNk3y5Xr/ywWsIbX4wC
         t/1iJQgnM3teIxZYb9CJhAZcLvKXW3o6dnVDOTIlXRAJdzfIr+8iaoCvzYoHDIhpVNXW
         QN2xMry61khAuzUAVmz/fvYz0GsRKPF6CKhrZ4dh86AspLqyfssQA2lNIAN22/JRMjTv
         V1wt91L14TZ6u+gaWw6bNf6FjywwkuYyRL4ZoEwRrGitIDm/Njj8CK98BgdXhRShEavP
         zcj27Gb9Mv4d7F464ywVLc0HOZ+7Q6H0q8PbGITaJ2bjjP/5p97E+CC3wwbCpD+V/ZKX
         Do6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741460; x=1783346260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fi+aOF3X0XE+EnDA3NYao73z90dCW8BKgRHxnIWsmow=;
        b=afeLZ2cBOIBzDY/dLMuH62e2CptbUkQqlKPoMpiWYGvSiDrDybFw4Y7YBt90kSLf/Q
         5dSMFOLxvl97kpzZsQD1885TY4EKI9OjQ9iR8bNzzozlcEE/I74FbqQ29wDM+K3RQYQO
         tyKHmfdzCVN8Trk0yMN5ziQXwDQmdzG9kRGfVSwKSRl83tVk4VWtkUdedlYT/59fDO/Y
         udF523BP6PYQ4EuvPRpsu4MPr4htX1NzZUQfrCX9F4BEsT0DroUqVPfG0PBjAhrG7Hbh
         2xSyGi14CNLLILpIGZQ8mP3r9X7oK8IW5u9B/gq5Crf+5P4pH3zLeOC8VTK8qNnjXyen
         6OtQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0CV+7/zhwmxpiIIJwu1ySu4k7zgNCMP0x69aJ4yi0k/i4JuJ0ZQk2W1c2R+A6QLqtVZoUAVvEZMJ7VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgkgJrVR3OmuHf0C7twqodB83voOCdcPbxySiUgV2V9fsDIy28
	fNarRfqTHn4TsT9pi8MwpLgpfHHCyOHJbGjmXFOVApoDKD4ifS4KOXAhl7ZsxdPBPCk=
X-Gm-Gg: AfdE7cmHv1fItmyfrU6CZvNAQd9KkZKup3nry+sFhVBLiCVDvXrXfRVtXIO9M4H2wEL
	+XZkIQBb/5OE6Jzjf23N/5F4BR3BGrsFIRIwX81k3FWLjGlurpGBuCgmBakn3NvEs1jLREe1OrD
	od+214AUElrLFbiTJmVZQNkCfsHs6U0fvQjEVYPPr1ks8Yy18S+FI0ubjE+XctG7BowI0Bsv7co
	PJNb0F2aZre8s6NfTBAiK7CKFBTM/k2mr9EYLMPFi7puMN+2kdtF5bsRNedoh5hqQadg11qlvt+
	T9NCyugoys4gdEPKjAGqIo7eiOxaxp8dcevGo31iJhn9Oj6abjbSAl1ioamtdJi5uAMmpZKP7oC
	UwVxYJT3uJTmbyHVcqiPRJYeO2ZNAHrN/Nw7xPut89fx6riyXzqWqKQUtEm2ki8w0wBvKpD/hta
	vaS+IiV+taQLSXQDGlxGPeS83tc5cC0BhTwkEGVH7gOqrTpIM4TM9XH7rt5sgF1wrQrtcye8hZZ
	gc8
X-Received: by 2002:a05:600c:5290:b0:493:b7a6:3dac with SMTP id 5b1f17b1804b1-493b7a63dbdmr608125e9.33.1782741460528;
        Mon, 29 Jun 2026 06:57:40 -0700 (PDT)
Received: from localhost (p200300f65f47db04294e5bd34a12a699.dip0.t-ipconnect.de. [2003:f6:5f47:db04:294e:5bd3:4a12:a699])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49268fe949csm375305105e9.5.2026.06.29.06.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:57:38 -0700 (PDT)
Date: Mon, 29 Jun 2026 15:57:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/17] ASoC: rockchip: rockchip_sai: #include
 <linux/platform_device.h> explicitly
Message-ID: <akJ5lkLieSgkdfW9@monoceros>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
 <d2fe7dc85277b01526f9320ed5baab2acd29660b.1782490566.git.u.kleine-koenig@baylibre.com>
 <8dcfcd10-4b9d-4775-9e23-3884b896a7b9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4sshmqzaaw52uohq"
Content-Disposition: inline
In-Reply-To: <8dcfcd10-4b9d-4775-9e23-3884b896a7b9@sirena.org.uk>


--4sshmqzaaw52uohq
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 03/17] ASoC: rockchip: rockchip_sai: #include
 <linux/platform_device.h> explicitly
MIME-Version: 1.0

Hello Mark,

On Mon, Jun 29, 2026 at 12:17:04PM +0100, Mark Brown wrote:
> On Fri, Jun 26, 2026 at 08:00:22PM +0200, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > Currently that header is only included via:
> >=20
> > 	<sound/dmaengine_pcm.h> ->
> > 	<sound/soc.h> ->
> > 	<linux/platform_device.h>
>=20
> Acked-by: Mark Brown <broonie@kernel.org>

You're too late for the Ack, this patch already is applied and part of
v7.2.

Best regards
Uwe

--4sshmqzaaw52uohq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpCecwACgkQj4D7WH0S
/k4QuQf+IZ3MYAOoCiX56AcddT2ysdPwmOlVVSv/6YS6KhChCyJRk6ZSdHoDg3Qn
xGnj118aX3gekqAPdZGK+3E7fkhwmSCRh9y3c2QgmPZlcwdJqeHrsMbthgmp4+r+
0GSSh+LTi6ndwo1JU+dP6aUhpyGk5AuRGTvL4ZMA7yuTmVfoSAFk/UrzBqtRXfV9
PeNnlWg92EyYbL4HQeH1S0xzB7O3KQoB4ni2q4wpQYbFSoQN+FpNRe4oNzkUlXuc
BBZDGFl7zH8/laFhRMpvfQPxXpksv5JxWWrtgcDINgpwz3+Zm7nYtVuG7r402M8T
mg//pdx2TidvXsmJe3CMWgTmnZlBAQ==
=Ojc5
-----END PGP SIGNATURE-----

--4sshmqzaaw52uohq--
