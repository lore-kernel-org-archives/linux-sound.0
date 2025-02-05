Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65427376
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 12:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759873; cv=none; b=t9eQI8F+9EG8NEQW6jt/4ggWPUvreFjzza6h79zARY5zJsagnZYt1z9cKSwcn0BfsjfmoBwCOQr0ExizJguGxw45eIhpjvEw9QHgGYgza1EV+hJ9kOI9hSXElTZHUw0OWFRnwvnPiNlMhH1mQ5nByySCL4WuQlB9bUPV8HO7Adw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759873; c=relaxed/simple;
	bh=oUUsmUBWwhvCtt2RbuWKoUtugRBR+4aCKf0uDPiPXRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioKT8Qz6T41vYj6yiSKK5hOcGM+LYUkn4RPUoUDjwe0N1DyYid4sh5p4SbQVndij4zOovfDVpF9wULSB1nanxrP2IspjizKICQDfAZzkriOzITVlB9kJdWzscLz8RqBuMWjt/Gvx4EXg6L87UsUSLEwjgV+i3bT88kbHvzo5RB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JorMlL7e; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JorMlL7e"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-543cc81ddebso7697639e87.1
        for <linux-sound@vger.kernel.org>; Wed, 05 Feb 2025 04:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759868; x=1739364668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUUsmUBWwhvCtt2RbuWKoUtugRBR+4aCKf0uDPiPXRw=;
        b=JorMlL7efjnrIX4wZXVqb5PMaUn5MQXXUgSXZV1bJ7gOaHIqXl2hOJti2G0ZgziUBc
         +rmKJkj7rwWvao0p2jAVkfkJWu3qOPYuhH8ZUlZeORJCXNmF8cEvvn3Cav287eLZ2KlD
         fHNsaAYbSbIbvk0JDa8FmARw5dZJDGcaoDqq1ZCoJmcuovC91EWIrmQKUxiapN9ld3uo
         c8boWMarxlrFexCSO0b6pkoyajrth+JiToMAlf2MEe/8WEmAtyUMldSAjGrg8ec2uDsJ
         hmw2kBatiQ3EfRrb1KWDdDKYoFRZpcmDbKBu2Tjhw5Y98DTcRiVNGJVF2/AMZUfBY1qy
         uUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759868; x=1739364668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUUsmUBWwhvCtt2RbuWKoUtugRBR+4aCKf0uDPiPXRw=;
        b=SR541ZE8fSv7FlRB0qaEZuM2nF7Y5dJW6iHVyH2dxeWxD/lKOm1qGupSm0qJo0W1dx
         dWB+gKhOo9pSwaELtCK6LZlwZFQuvo4l6e54G5IZAKCtp2zFJw1kn5UzRlWymEkGpjHN
         xACA53UApLZEmJwClUEcWmLgJBhP4AEuTQKzUw2srdSGgn4gE4S2C6ZSdzv2lznAJaiq
         vV7g3n30asGPGq5a2vSEpzTBMeL9cRO7sFjsyp8ZluiihypwsZTNZIbuCxkgv4IOGbC8
         z9CBSBF78ZDB0tykjIqm/CQdy0E1LRKYVi0HdfiEkGVggbiBO1oA/P01vb7SSx3cv2iH
         mXLg==
X-Forwarded-Encrypted: i=1; AJvYcCVXzmarWZprtqWtlrfZ66sRO0ay5zQf/twSHW/vSj40uZArWVoLeVp3sqcjS3OPb+eY4/pVIiu7bT8acg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa0hL6AoqDP5ldxwC2i5iDFQeyBUBMbB5LcB8RyBWSYPGWqfBi
	k8t3x1bgNpeYqotseIGghEtYtxUzJVunHCVjmB5A8XG+LhIG2Ro0Gko2LQjxk+DFAtFV3ykNPBL
	cBHQMvbOA+FYpFNwNtiazlOJaROM=
X-Gm-Gg: ASbGncv0zviPEnfmNoY6+b3rr9ybBQt/zhyEyTSX5ggMNnbosMlAwKMfhxbtEvuri+q
	TIH0AH/bK1wFBBAl1qz3ms0d2GujJx3gphk7DPFJtRkE7JlD5mBn90ZdEpNPLus/HUOzAX4Kkvx
	53Hbu7YbQ7zSp5N/00I0z8l2uoFhZy
X-Google-Smtp-Source: AGHT+IE7ftTKhjAYBm0iPMWSRt20tjZHpboeBBVPamZ8h9Ovz7UBTX3Hs9TpfDLrYE4ihLk7N7C9dT+JWCajYnpdGv8=
X-Received: by 2002:ac2:5e2c:0:b0:540:1c6e:f046 with SMTP id
 2adb3069b0e04-54405a7a440mr629579e87.36.1738759867999; Wed, 05 Feb 2025
 04:51:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205120128.1080295-1-festevam@gmail.com> <7f78ee88-e33b-481f-9a65-88d67451d95e@sirena.org.uk>
In-Reply-To: <7f78ee88-e33b-481f-9a65-88d67451d95e@sirena.org.uk>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 5 Feb 2025 09:50:56 -0300
X-Gm-Features: AWEUYZmk5r56GRrxxrZo0WMxne09RJ3QAUSkb-ooYSLPPdeP5Iu-qI0iedzOYjU
Message-ID: <CAOMZO5B0HeMbqu=uj9Eh8zh73JMnpPQ3V9m_NFeajbxKj4yVzg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: soc-core: Use of_property_present() for non-boolean properties
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 9:45=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:

> This doesn't apply against current code, please check and resend.

I used today's linux-next. Which tree would you like me to use?
