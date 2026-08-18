Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E66F2D46A1
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 11:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050975; cv=pass; b=CVRs5po4XrOj3O5vUXG7GTSOBOeoTpI8IAHaq2XS+pJbod1wRCS4wuSlRZvsFQk+ALL4D0aVKk9Suk3nWI33dFv3WyJU/AYq9vAsuyJMjDDt6F1Ggfx9UPXJEswtHXkmEtw3d3KtHR4X2RPBx6G7U3Md4XXVp1OWo5KzxOnRtA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050975; c=relaxed/simple;
	bh=BPjS6YWQ/poakltSjvNSgNnRZjwLe6wcNcWXaxoAgLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QtuyozzTQII1Fk73zrlBZWYkhL9r1Ow+9x9FPSLSvG1wAy6b4hZpcc4sAVX3B2NsfyS5BjlgFgOhnBoWkDVHs35+UVpES+JhZ7SR4YNAuqOKm+F1aDJ9+EqhCCXHdZGpOxDSls2Muzk5XepqunZQskji2eprkmJUrEJHl+jhO+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8BWU+7H; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8BWU+7H"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cace91f112so52887055ad.0
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 04:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787050974; cv=none;
        d=google.com; s=arc-20260327;
        b=klRWqGTrvAh9EiJov8DyaD6hktJHZ4ZXwhwbDk/ST0JylrV2r7pKuXMyGfLroLQoLY
         LhSLdm4WSwkqOOwUuD1/ipHBbZ6bzAR3IMGm7C5p5AeYAFyuLBclQ9AED1H+Z3AC4aFx
         zagHBUDJV89IavKohX2yGGTh2HIgDzbpU5ZeROEoBW5DoFXyW8UdzFKLk/YbSl7CWNre
         3FvY8rxvwfYZqEh7heme5uUKQV9WMppY7UMCuNIDwF6SIMJ9bXTAnPiI88MDhNwWOHjM
         enyg18aXTPVktGaFKWU6ty9S9k28jzmxzsjBIsuaRQDT14imQeBGHxSIwqZqgT9bv8ok
         LHRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BPjS6YWQ/poakltSjvNSgNnRZjwLe6wcNcWXaxoAgLk=;
        fh=3t8RJ6FB9Vkwmj0V2X0HUeNywuwwPi92jHYzac9nJ90=;
        b=oiNI+TUG8O0/fYXVsHBvR8ZpscJuofKAMfQNW0ggp/J6EKbRiOBS4Wf76OayUdnB7Q
         Vy8hazfsmPcwi1EPDitY9w1j6WmqIouwRAeGE4zMtzjELQY/PMtIyvo2KuOR61DS9SdY
         eI70TYZAOiPqV4hByyb2qiuj/GVtnb77yG3p6/y8Tg2i180JgFa8+G3zXtQlJVlYGTVh
         WlbtL6ushATKViMSI2xHZOsmmwtqwaENYAWF7FwjvEO78ZX3Hm43hCmAdTnkP+GuD37l
         1+HAktax4BX2XU2SqOdZaZWDcaD0NrSJnku+03WXmImXz8kK52/1ye2sW6U1POGM5ysS
         IQAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787050974; x=1787655774; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPjS6YWQ/poakltSjvNSgNnRZjwLe6wcNcWXaxoAgLk=;
        b=s8BWU+7HoLQe8K2VFzAWH+8FUN9MZ9HNYmYKFxTtc36zRCbZuCnQQKYENAPRlpyb5h
         wqnO/Pwx57Wo0J1YUiEBeKI02OZkhkyJj/GzRYwx8EqoZnnhVSDZNqrTiG5URfTWE5WQ
         0s+LI+KJBOylRuXv3ty1HfBmCDmCYwE6DXxYhU2LuyeLXoN15d4k18kRMEsT0JB0URE4
         xbEuTrfPH6JQSr+0rvQN5PIsuLG9UIwoY9mj1vINvOgo+R/zUeoK8tV/Nl9934ROm001
         5uXaHl9Dn/uXNWvVO9iXWWOcjLeG3fE/5prFqMnqQq+tL+ZD9CjKYc/8HBR02cmtjWnJ
         BugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050974; x=1787655774;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BPjS6YWQ/poakltSjvNSgNnRZjwLe6wcNcWXaxoAgLk=;
        b=ZOc5odI785yCIptpSl2fA8BUqDGRRumrpW9/TsvqXQfORy396bNpcfuZxDLXXWEHJD
         gEPcFESTnJLC9mOt5/y4+RshMVMGp7ypdVWQCdmQVaXT9lgSWS1xWN3IDvQjluPML+/g
         aYbpSnJovnmuv41XEB/sp/87iIAsOoH4/AU/I5SQUc7jKGzCsSBAQKV1T7YkA9ziGh7g
         DevaOLlrbG7nkCQwW5BpEJLx+X7C9GEuI4fb0jG7Ackx8D/+eYmN3UemFGS921sgBP+N
         1TU9xquIEHZLfB3jktNmyxHQWU7yIrqAU8nCowMiV40qU1/mFmRRN+DTKqoj4QkPcuSJ
         5MKg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9mKyLj5P2akFKpXRWMFFc+5jeBY9r3qu3zBadlWrqKBbc2aMYnuJLstMODZYZx+FvfqFHypRrkl9bpw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0TJ71g+pa51emVnVy6qDgKkHXgLuYA6rHTPZa8jKG4iI6G7y2
	fNVGqrhpL/Hx7iegMdJgn2T5fm1W3ZubIGZn8HUdlfNSxE7g1JvWgkbIGIA2ShYP+Lh6oMJzm5U
	+6hzdCBRAwGWh251OM6TjjOqQ0Zb4djA=
X-Gm-Gg: AR+sD13t8cUm4U3g2ycYVmSzBzLWBAVPhLxE0xRZwqeGfmJq/uU7W+XuEJCY2LwnZc1
	ruHoorv9Ft/aFfPde/MPMG+bCwE6De1GK9/yfylUajxJBww2oIn0m5i2ZFhYFf4ptyfhoYoYx3M
	SgCavjFtdTAB3qUWxbmuCM8qpzsEKOmDVTYZhsniAaS6Jr2eVUuOdQUqnzcNIZEEDJ0yc1vJDSU
	HsGojeNbIZwjvAibLEonELEtiCasDbtf+lMiCgq6wQb9WZkEPxZhTEBc03/3ZK2OfSABqyKD/t+
	Yg4yAQxOLPR6vOCx7Lhvtreu03yZ4MNmKtp6OPgBb0+G0aNQG3DhO8gF3F5IORuZHxO8nQ84Ams
	AuiR+5MnKVBFQl52vuKb5vjchS0vfSnk0vI7ruXIHk/NO8z+29+0/d3tdcNePCOmI1Xo=
X-Received: by 2002:a17:903:3c44:b0:2d0:8b28:517c with SMTP id
 d9443c01a7336-2d3b0d78141mr373925525ad.3.1787050973910; Tue, 18 Aug 2026
 04:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817104929.63152-1-phucduc.bui@gmail.com> <b3dad816-469b-478a-b6a8-a08ac8610ac9@intel.com>
In-Reply-To: <b3dad816-469b-478a-b6a8-a08ac8610ac9@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 18 Aug 2026 18:02:42 +0700
X-Gm-Features: AcwNN1U_fcSxMy9R21C80tITgSmylcf4dSivVK9nzajAgmmuEsH3ejkqOedKKGQ
Message-ID: <CAABR9nFME5kYrLZUMn86sT1RaJiqzJeC7QJzqqxedL1NkZUYwA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: mediatek: mt2701: Use devm_clk_get_optional()
 for audio_mrgif_pd
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Rosen Penev <rosenp@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thank you for your review.


> > The audio_mrgif_pd clock is optional as some platforms may support the
> > BT path while others do not. Use devm_clk_get_optional() to reflect
> > this.
> >
> > Propagate other errors to the caller.
>
> What does that mean? Did the functional path change?
>

Previously, the code only returned an error for -EPROBE_DEFER and
ignored other errors.
After switching to devm_clk_get_optional(), all other errors are
propagated to the caller as well.

Regarding the functional path, I don't think it changes on platforms
where the clock is present.
The change only allows platforms without this optional clock to
continue probing.


> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> This should be part of a mediatek-patch-series with a cover letter.
> Yeah, the mt6797 changes should be here too.

Currently, the MediaTek ASoC drivers are split into multiple groups by SoC.
I am handling them one group at a time to make the review easier.

I will send each group once it is completed, rather than waiting for the entire
MediaTek cleanup, which would take quite a long time. A single series
covering all
MediaTek SoCs would also be very long and harder to follow,
especially if changes are requested during review.

I hope this approach works for you.

Best regards,
Phuc
