Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57BD42E426
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 19:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790279582; cv=pass; b=Y+XDAvUMpN7FVbAY4/OjmT6i7VwhfOomZ9R5plEkyOLVuE4+1BjPz/UBQjj9tJkuJ6WGje9fh4D4u+EgvgpO7hyz3oE8CHu4OA1xnobYdEvVwZyRf9dGGB/Tnwqo/OrWSYIZAmw8jUk8Fca5+ePBjkNIkk0knj70ZXucODHPSUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790279582; c=relaxed/simple;
	bh=QoubT9CoXhKpEUyyyBiFnbmENvqSUiUg/q8bBXketCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZvGKxLvVQcAW5oM1OUT4d9j4h9rGzgAkU2RHB8IjbWX1dBP4LIUyoDufOUQwR0mTubc7YZzetNn6SFEiRy308QQwUSp3baN1YlMvuJKkYmGO4wRiwyn8pKt2tESLoGf0AVPPUr1p9zwbyenPc1ZmbCEwvfYTriRQlE4pqVIa1m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=qyRdLfhc; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="qyRdLfhc"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982dd15d169so125409241.2
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 12:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790279574; cv=none;
        d=google.com; s=arc-20260327;
        b=BewJqBMTSyBXTEfSf/1+CNxfVi5YR3MKE28G04/4pPs2jRbhCYTzj9RZxkEiSXnX+h
         2KiJit54yNzgyfygJy3bI1GG8MCak1vrJVNWeUbHIpv2hUYyaRwpieiTOc4O7UuF1x+f
         l6Oz6+swdXQXBle9a/pJDJ1FuzFwZfD+f7SAWFGgMUyw7av+Ke6uyJydVRdbPI2U3J1V
         /cMcPIpGxqgy80kD+lJdEi+rgNBu1/rdKTRTcnSmhRigs47NaL0akZUyKwWSLRyRwaet
         X5RzDLVLt+4yscH6pLDlzeJq7FToFpiJd9Ja55t13p7qXEqN7Oiib6BrZCq9rQx3JwIZ
         Pg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UWTnqz7gHpCXSb1m9qCCSqzvyxAbuc/zoS0Ar8FS4l4=;
        fh=DBWtYck8D5ucHBcG15K+Af34kraKLBOZ83E+z4gW0NY=;
        b=U6zc/o5clx3BxUoeSu/3sSBpoc9/J/KmhAr28waV9Ty1fGqsd9c7+QLTuDPLhg1oJJ
         m98h3Wt2uHHFfc/VuBbaxxW0cVWl0zNSeHepKso/v0uvKI6XP65CIf3XRcim8iQ3fA/0
         LdUvwW48wnw3ahlZVuPeGfPdTl3R+P9Y0kaGjY5Jw6Kpr7p4oLuTr1YayyyVsXnu/rxu
         gyW39JC2J4j8oIhvLxOmTINlryNJ7dPUpHPBnCo+Lvk4U7EQ3NbJdVtle1nKaGQY41/R
         6QwWUMO8pnv52hddwX4BjKDJ8Tdd+pmBelvmOv0N2cSvP5w2LIjkHCngomguQacKnBvm
         EtgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790279574; x=1790884374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UWTnqz7gHpCXSb1m9qCCSqzvyxAbuc/zoS0Ar8FS4l4=;
        b=qyRdLfhcgyRcsb9h50M0Xs2yyGilj46mmpAW1RrzesjpafuKgEpQCxfLZXUess3oyg
         WYpiruTSta4ce4G6sFP3W7we6wx9kHBbZehNbuOYCPhmjDkqLLSI5pdElXzF6htOVRXl
         Zo57zg/nuSEZi6nbv1skbB7Z2okM7mV+BXmIc/wr2x1CBNyyob62IYe6G7CI4VwLA7jL
         8s4iADFbqGOc6et8S3HvhCmH0C8CBU9YU/Tmxm3n2cCoPgOVEWzRDBp9oiPOJzDOJIgg
         q38RtBoz9gg0hCxWQBnY0MmEgZaeDI3FI0+QMdbMI1Y4N+TMfqg89CgU3Y7PTVcoEVYw
         MoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790279574; x=1790884374;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWTnqz7gHpCXSb1m9qCCSqzvyxAbuc/zoS0Ar8FS4l4=;
        b=M3g4h17vDm5DqSCMSF3QVxfyKiK+xsKZeNynyQ1+mOsqaYRhc5KYIneyR7B4xoB4vI
         s+boBk65pUAPBNcAG0bZ6BxnBG9gf04g2rNR6ahHN+L7k5iyDOJDaKVzPHy6lAm+RZmI
         3f5hetX9Ca7vhHJsOqOhMLQP/y9I7x7LsQCUmATZGGjCrOGHHZ+8KrsLskG4VwKV78SD
         gpDfREtb131dwHo3DWYzJih0q4uUFTM9HK1X8GTg5GcsBrMUK6crKC93tGBkVcdMDB93
         Y0QCJq9kx2OOr2266yi6InaMHCteRzNngg0/QWSOjiUoAnov79ICCrjKVcdr4EE75UK0
         KW8w==
X-Forwarded-Encrypted: i=1; AKwUvBwPlODeb9G0azTU8NPk2orMTraZOwL1Djh8XgcSG+k70jnmb4EikkXuaSr4ZLQdZlPJwifDkjIuWP/nyQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lLFAM5cpgZzjXum2Wp73/ZC5H8N6MFiZ4AtjH5fvUslzHFqwFu
	FznelVQC4ROk/l3Ja9JhDganObKILTL8IPuApFC5tmjM1iqr3twCnFGzqZK7bcl+eAoR1A/5U0e
	wnqJpBh+qphbSOIgy7c3Qbv2eGKgLEzBj0CyEEmzUPQ==
X-Gm-Gg: AYBFou0hr9PSTkvti+388D7bEBYs93UX5TZ+KC/9Fe/v/1Xkegyz7YlertyOLvTvtlR
	B5du7jB0MLJZFRZ/RO9vAmW4IZu9VQHoeXfeg1MEdHNvFXcqxG1ivFK9IG1Fk/mu7LE4jdqCiHH
	PPiNDXGnv8gwg4+Y3Vh7YXgTqIAPUsXNn5REYEAjpu8EIniTLNZf2KnoNEAcUFrsyprQzWrAc0x
	0UKOXjp3pIbn4Nt5syZJPFlNtDHYMjNBMZG9GDu7pWo3RYdf4U5aAzOgMLwyxgP/MdOcBr9GIiO
	ZH75BMT3+TGBGZ5iodLianhJJ1Lhg9y0iCqE8qzjAy266P0DsZXodMI+/sZWaAUiiqU=
X-Received: by 2002:a05:6102:6a83:b0:7a2:2068:6b67 with SMTP id
 ada2fe7eead31-7af1dddb820mr1606892137.25.1790279573796; Thu, 24 Sep 2026
 12:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924125940.22665-1-lnicoara@thinkoid.org> <54f8af3d-a01c-d1fb-36b4-7eac71174f92@marek.ca>
In-Reply-To: <54f8af3d-a01c-d1fb-36b4-7eac71174f92@marek.ca>
From: Liviu Nicoara <lnicoara@thinkoid.org>
Date: Thu, 24 Sep 2026 15:52:43 -0400
X-Gm-Features: AclHuK_leAsQLblHRxuOpdcET2NRKKGqkd34mCi1ubZfnnfcE3YhUz2hrAzgGrU
Message-ID: <CAAhq3a6OV6+Z0p=qVqpUiL-QoP92fYTsf5MBQL-f2oedddW=Dg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: codecs: lpass-wsa-macro: rewrite the interpolator
 volume after enabling clocks
To: Jonathan Marek <jonathan@marek.ca>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Johan Hovold <johan@kernel.org>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 3:02=E2=80=AFPM Jonathan Marek <jonathan@marek.ca> =
wrote:
>
> this is just papering over the real problem, which would be the regmap
> cache being out of sync with the HW registers. there's no requirement
> that the volume register be written after the int/path clock enable
>
> (fwiw, this problem doesn't reproduce on my setup, where this driver
> does not autosuspend and the regmap doesn't go into cache-only mode)
>
>

Thanks for looking. I checked whether the cache and the hardware
disagree on this machine (v7.2.6, where the macro runtime-suspends after
3 s). With the macro suspended, I changed the digital volume from 81 to
69, which updates only the cache.  I then forced a runtime resume, which
runs regcache_sync(), and read the volume register straight from the
hardware with the regmap debugfs cache_bypass: it held the new value
(0xf1).

However, on my unpatched driver an idle volume change did not take place
when playback starts (changed it from 69 to 81 and it played at 69). A
change done during playback though, takes effect at once. I don't think
anything writes the register in between.

The register holds the new value, but the path does not use it until it
is written with the interpolator clock running. The read/write-back that
902f497a1ff5 removed did exactly that; Johan kept it deliberately in
46188db080bd ("Note that the volume registers still need to be written
after enabling clocks in order for any prior updates to take
effect"). Unless I am reading it wrong.

On your setup, does a volume change made with no stream running take
effect when the next stream starts?  If your changes land while the path
is active, that could explain why it does not reproduce there.

Thanks again.
