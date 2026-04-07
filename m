Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DFF398919
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575570; cv=none; b=e5f/Iyu0A2OE/d5VTHDfyUaKYKAhLJ/T0N8Mk+etiuSi6C1rjUUkiVfO/Au6FNyiPCDPk5vEcbZatDy8ZCAfAYPRbmIRiWr1ys5B2OhJ54gHtsLU0Ie2R7x2noJWc4efvbsdWL2XHtbPBIgrBPELWJqUPifB9ZzYDHJldLSh+DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575570; c=relaxed/simple;
	bh=UxV2PnmL5HF7Kug7WlffSXEx0XVMXV1rwTOcNz8bA2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KVb49ErFgEFaEThx8ic1etAf/Me+/xlTrSkOe6wGbS5F2kXsE/2hgFCv1aNNIPMNvZJPlXrrWEp8IvUFHg+OmRZRZDQkhC/y5K7QQYioWyvNpGUWJ/fHQV9K1IO/FhcQwIZAzp5S76N8Q7qxg60T4i2bFY8U0vrVtAp2bFiellQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akVVWRwX; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akVVWRwX"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c0b72daf7so1430194c88.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Apr 2026 08:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775575562; x=1776180362; darn=vger.kernel.org;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hDTbVKLUtcCyOUAHUxfjAMCvSrcLPspgsDz8jLS/Ss=;
        b=akVVWRwXK8Ga/zUZKwhWkirXBTq5XhN6fsGH21U4ZcYMxqY8Bc2Bey/8M1YN0IFQ+w
         q6WKgu8G+10m7+h1nZ+/XiUogJFXOxAQIhy22V66uxbJCuSJ/32ANw25umA8R66RCvYl
         06eKwdTCLyNE0RnqI1gFJVbkVITmWA1CZk7ESPih8BVmAR3+UuGCIKBR8YJKasipLHwN
         4p8mUnvkzZH+nc1Qw8HhyT0TFk07afQQJEbrIaRCwZjDOandTpNCbb++RlFU8Y6ndLth
         VygGnMJk1KY/wtJHSNBbt7PqQHowOrM2e18F4KXuwgC3iYl8fgSX8H3nTLshRiz+MmPf
         3hWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575562; x=1776180362;
        h=in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hDTbVKLUtcCyOUAHUxfjAMCvSrcLPspgsDz8jLS/Ss=;
        b=X7sF165ONtEPAWc+sMArVTHrqM0dFqACG1flJPpu6N9WLh9bS/0nqW9vS8FHS1UPUF
         dQw9YoyTeGVV7QdoiiCTpriTxm/XAyrl6nylxT2Jl+Oco2FiuzQYYgfkgSvaMQqBNtOB
         DfhXlqpD1mBOT3E7X7lc37YNaW8/OgIk1xUpDjqz1UFjBMv7rB9PJePMY5BDAisBDc8M
         zOt1Q/XVGceQmUAegW7meVHfqZ+xLAEkZGozIB9JmjP7k7i9lr+wnnCE+7Gc6dBAGCeS
         /BigQQlNH4idW98QuglK6cqueZGCGq/0d4Mo83DG76FVBe2XfsLFqTLMzZ7qj2JK33XE
         BRig==
X-Gm-Message-State: AOJu0Ywqp7sYDoSP3icNju7nB+Bu1wEo2m92zAyzf90Eyohxr/341KpV
	HkOLh3rj6onsHDuZEYsR3NtlVhwTMfI26xZJ74jH0tlc07sHtCTcH2D7QrFmvw==
X-Gm-Gg: AeBDieuru4fD/HGb+Ek3bUoZb6oPMoUZQESlKUDm2364L5S6yyax//Dv/pMXqpcDdQH
	gRmnKoEORnjRfIGUZAzAak235gmCn0oynyrhDbY1EatNXL4kR0fyotUz2pmC9grVF9eenFpB9fa
	ysEki9JQTFKvt07yKthMEsFXEe3+US4mB/F8PriPkGeROZJQK6mbcOo5U49ZtYqjfak3OAnx9Vc
	cEEtgN5jOgHfqhXlz+ELK2bIeGhdlTlypFbohKu4H2AJcKJ3PegQLuMYQpGkEj0yAbx//M6rq9w
	atsFBMs2GTIWRjwcl/dhg1Z1+b4iXFmrXNzDiZf390b4jo2vX9xlyVr8fWRFC0c46G60hKUeL9C
	Ilby334X3uS0/STFLi6+/GLRhp0w+t6Cq/H96ylnWuG3dLN35Ki+YLaScDZLqkEHbGRiqaB3f5W
	CPOBacS4WOA70Ry9jArksyPOoiL91CJnILm8+lVwaihQVZxsaxkwoG3uNnZL8rGR6k61Vl3y+zj
	VF/
X-Received: by 2002:a05:7022:b81:b0:127:33e0:ea44 with SMTP id a92af1059eb24-12bfb765444mr9016171c88.29.1775575562218;
        Tue, 07 Apr 2026 08:26:02 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-167.user3p.v-tal.net.br. [177.4.161.167])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd4e4e3sm14233555c88.1.2026.04.07.08.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 08:26:01 -0700 (PDT)
Message-ID: <d19ba2fc-910e-4ed4-a11a-2760de74a7a7@gmail.com>
Date: Tue, 7 Apr 2026 12:25:57 -0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ALSA: add suspend/resume support for InterWave ISA
 cards
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260407-alsa-interwave-pm-v1-0-80da1151f59c@gmail.com>
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
Content-Language: en-US
In-Reply-To: <20260407-alsa-interwave-pm-v1-0-80da1151f59c@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OozB0Qf3eT8TF7O0a0gDkCKe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OozB0Qf3eT8TF7O0a0gDkCKe
Content-Type: multipart/mixed; boundary="------------VW8tf87UVIxt5g5Pj5ecZ0Tt";
 protected-headers="v1"
From: =?UTF-8?Q?C=C3=A1ssio_Gabriel_Monteiro_Pires?=
 <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <d19ba2fc-910e-4ed4-a11a-2760de74a7a7@gmail.com>
Subject: Re: [PATCH 0/3] ALSA: add suspend/resume support for InterWave ISA
 cards
References: <20260407-alsa-interwave-pm-v1-0-80da1151f59c@gmail.com>
In-Reply-To: <20260407-alsa-interwave-pm-v1-0-80da1151f59c@gmail.com>

--------------VW8tf87UVIxt5g5Pj5ecZ0Tt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4/7/26 12:22, C=C3=A1ssio Gabriel wrote:
> This 3-patch series wires up suspend and resume support for the
> InterWave ISA drivers and their PnP front-end around the shared
> GUS PM helpers.
>=20
> The first patch moves the remaining standalone
> snd_tea6330t_detect() EXPORT_SYMBOL() declaration next to its
> function definition as a requested small cleanup.
>=20
> The second patch adds a small TEA6330T helper so the InterWave STB
> variant can restore its cached external mixer state after resume.
>=20
> The third patch adds ISA and PnP PM callbacks to snd-interwave and
> restores the remaining InterWave-specific state that the generic GUS
> resume path does not cover, including the GF1 board registers and the
> detected memory layout.
>=20
> The resume path intentionally does not rerun probe-time DRAM/ROM
> detection. As with the shared GUS PM support, this does not guarantee
> preservation of sample RAM contents across suspend.
>=20
> Signed-off-by: C=C3=A1ssio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> C=C3=A1ssio Gabriel (3):
>       ALSA: tea6330t: move snd_tea6330t_detect() EXPORT_SYMBOL
>       ALSA: tea6330t: add mixer state restore helper
>       ALSA: interwave: add ISA and PnP suspend and resume callbacks

Please, disregard this patch series.
I do not change the header to be [PATCH V2].
I'll resend it correctly this time.

--=20
Thanks,
C=C3=A1ssio


--------------VW8tf87UVIxt5g5Pj5ecZ0Tt--

--------------OozB0Qf3eT8TF7O0a0gDkCKe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSrYqI5vIrg1X9eqEjQXT8aWv/ugwUCadUiBQUDAAAAAAAKCRDQXT8aWv/ug6EI
AQCgMwqkJnkEiLHKrs3UX4hlnKO1FIvYebzAtwKec/9phQEA6ZZJ1bEGUv5DNvuBBXllknF8PIiP
V1uAl+Sv+LCcPww=
=kewu
-----END PGP SIGNATURE-----

--------------OozB0Qf3eT8TF7O0a0gDkCKe--
