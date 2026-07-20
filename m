Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218553D6CC1
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 11:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547183; cv=none; b=r/sInk9kXTgFAPp9oNbrY6xzO+bcnTG1I8bTFYz/j+DzO3EWYVxyfslobwmiD4V3ANEtIkdoSLkbARh1aYuc9O9E4eg9Eo3OA8/3DXbBfTdgXXSErwbv4GHnUJCpJcCljGrhAeBK/Mj7UooxLeYW3TqzLPy1hdZox3ql1fRX03I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547183; c=relaxed/simple;
	bh=Yznhadivjd7NFU75HJGOWRUsZ3KwHRNsJTBuan2bOp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJwQdx0TH54pIoItp6ZQ8lpZUeG+kblKkAQ2psb46+TFioMIJrQBRngygsL7DG50BMgrRvoZ2nnW/aTD1VA5ZiJUAZLHU3r8G46Z7V8e3bYY+BhU70mlcN2+3dgya8dQbfvEc2hAPYWGwqp941D2HG1iKcA8CGUX9erx45BCWIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Xq6x5u8A; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Xq6x5u8A"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f7444576cso752245f8f.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784547179; x=1785151979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SGSmRk6GO59zW5cwrMRLWq4LSpqTE+FzGIdc+IW+ji0=;
        b=Xq6x5u8AvwvR7vmgOYuH3mKPky7iZxB0EwEeGheqElnt3UsNnq0+zr8Ke8z9T2p71j
         VEzmkIICHiO/qJCq4nV52kWhcRr0a2saUhY7BFAkuOdWa5rS6AQnGvAd7AeWkfyZiHyQ
         pt9kZIJQOf9z2PmC0UmthMSoJjBfZbsrBudVQRHDyqW0DPUqX3yKsWQh9xoCeDMU+mHd
         KmpjijBGiUXuRRoFNsSv+tkQwLfK+qHLUg6v087sqtnxsJ3Woprulkk23M0xP5PA0Za0
         TLinEI8ptWoxJm+5QPfLRUN6f9A36vhfUYAW9Tw3WfCt96MrwpuemDXzZXXyG/5hvuMR
         w7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784547179; x=1785151979;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGSmRk6GO59zW5cwrMRLWq4LSpqTE+FzGIdc+IW+ji0=;
        b=YM2Ufy2t5t6i7xHBycvuvwx3ciSFP8W2wQuNf0bwmy/OnaOr2RwYHqzpcXuKL6fUDV
         Me1BLjIp9XZDh8sj5U1jWYdbYqF0i1V6IlnQ42pdF9mVu+oLPCXO7Mp4P4dvWtBI2sua
         bIf4B/v2vMJ6z5r781SzCqBaw7ZId7NGID/zrJkMCf+KW7rn6avAZhIuCEF5d7bFt5s7
         nAK1bnquWTuX8bJwinSXYZ1l60RhpZcQ1UE2xnP8j3YPTj4p+HLO15u17MDiMmFMGHEk
         v1x0vQvvdRXm73zXsh8oisfilZdBJMkU9EXuFI3bdk8jFVgkYT3CyURKzslYUeCKxpUF
         cTZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNl9qkOX1BoYh94zcEMrrgCb/tZLC9uu8ZktQkBZ5UBykg1S0vBLfQDpnL14rO+mCjrYdMq3xP080Sww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6lY8jS3ZYPACDJeM/AypzyzkQN0M4VsDglR5WFWfdkP4p2y8d
	OBNQEVTgI2JD2/VE9/GLwnl1c7YLk34i2zS/YtMg4wdlkb4bWepu9FHa1VJakbQ7dh4=
X-Gm-Gg: AR+sD10SXsPIwynPvS4kvwR8od7MIBWNVeNJt90DkpappcSr59Wv5lfVLo9+WXDSsmf
	0P4hb9f3dKGpB3jWfmFik0JpSPxiW5RjHvz+LY4enxVI159TSYU8wm2GTHHC7glkngktMlYqXBd
	IGQYYQZN/d+8U7oxzABfpowh33ltg4iLqpb1vTR9252BLHUhz7ftpjEq5Sl7N/QOTCvkAwGC15Z
	+3V5bTU4yhM75MfNc7YPqmHstaNSqQyuwB+fte1qJ0r287z95dQqKaMKZ67YsncPSUtXYkfT2yR
	MkHWmYzFObKpn3+8u7A29K8FPXhcesuUOYb1HD9DF4UnAJB87yNVoZC/amkNOJ1GI9Y97rSNV6G
	ePz3bMFRVVByeJEYib3+qiV4vfA1bmqPmgLPsSlZY66Jm5qECdLatSFfUHe1QFzgyYmwveI4/AC
	P3o4snnF2BlgX+o+23a+v8PNGYe5CQ7b86/MnEypJQm4QGKnEXqFr76L6OBhEE5TggOw==
X-Received: by 2002:a5d:5d0a:0:b0:475:f100:3603 with SMTP id ffacd0b85a97d-47f62338f82mr15003488f8f.50.1784547179229;
        Mon, 20 Jul 2026 04:32:59 -0700 (PDT)
Received: from localhost (p200300f65f47db048587886ecb5b26b2.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8587:886e:cb5b:26b2])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e51c33sm25266574f8f.12.2026.07.20.04.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:32:58 -0700 (PDT)
Date: Mon, 20 Jul 2026 13:32:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 4/6] ASoC: amd: acp: Unify code style for
 platform_device_id array
Message-ID: <al4GgA4rS1t7BjG0@monoceros>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
 <08137cf5b3cdd0cc2e00da32256664f3cb9b1e4e.1784528081.git.u.kleine-koenig@baylibre.com>
 <438e48da-b559-4f08-b12b-078610135550@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="itdxyorayyqslhsz"
Content-Disposition: inline
In-Reply-To: <438e48da-b559-4f08-b12b-078610135550@intel.com>


--itdxyorayyqslhsz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/6] ASoC: amd: acp: Unify code style for
 platform_device_id array
MIME-Version: 1.0

On Mon, Jul 20, 2026 at 09:05:35AM +0200, Cezary Rojewski wrote:
> On 7/20/2026 8:23 AM, Uwe Kleine-K=F6nig (The Capable Hub) wrote:
> >   - Add a trailing comma for initializers unless the closing brace is on
> >     the same line and for the list terminator;
> >   - Use a single space in the list terminator;
> >=20
> > Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
>=20
> Perhaps I should have been more clear in my previous response [1] - I
> expected the sound/soc/intel/avs changes be separated and then ACK tag can
> be freely added _only_ to those (avs-driver) changes.  I do not ACK
> non-Intel patches.

Ah, I didn't revisit that after collecting the review tags using b4.
One way to express that in a way that b4 handles is to write:

Acked-yb: Cezary Rojewski <cezary.rojewski@intel.com> # for sound/soc/intel=
/avs

(typo made deliberately to make b4 skip this example).

Will adapt for v3 (if it comes to that).

Best regards
Uwe

--itdxyorayyqslhsz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpeB2YACgkQj4D7WH0S
/k5WJgf+P7mZ5TqEMnI5mX8rk0fuKWMvdNbeiPfdwQRwUXOB3I0VGS0jcGQSKecG
GlEUsA8uXco697l+nU68bKO9MpbebQo/VpIIy2Fp+HXjiU/Z/J9LIt9Bc5Qjw9Jz
cX5iFWKcXM/PvuhqABcVxot81QgbNDWQxdu8UA7APL4lYYUx0KRHKDmqPNhvH4s4
lTQHAQGmrYC0fEFmXgDFW7eszUtrvHfJTnzbbx6lTUUuN8Ucu1Q8bAmJsdRyldxJ
Ys3VsAG5tk7WoLiG22MU7V6r+4l2k/AEosT2Wj2RQ5WBYIc/04pxjbWaApu4Gnd9
2TdtK3Sud2C+8q489tSiODA3iYePOw==
=RyQ9
-----END PGP SIGNATURE-----

--itdxyorayyqslhsz--
