Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CDD14375D
	for <linux-sound@vger.kernel.org>; Thu, 26 Dec 2024 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735201831; cv=none; b=jLL6Adi9qFtuSZY6GYaHHufpVHZesUIsDmviyIJVIwz4fUPGhFeCtKP27Kudg7BQKg+AT7PMWQYNNNZ76mnW2iG9WP3W6edjQMtwBYX97BRSpZHb2wi5HbV5pLPXqNP9WtV3yJ2IfX15yIEmI2jVMZqUn1F9smAGLA1Emf/GB1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735201831; c=relaxed/simple;
	bh=nWM50cCUl1GmCyL2kBGte515xakw9D+MA9ZwMcrxtm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdoZMoRL8/gr+ameO3QOqVArvtGbz0E7qCPm71bFGabpirQhUKObkIxLq/v52aOkycsAzDq1RBh/48nIx+bh4f9qAXo6/kpivbSWaVmyi8oWB9oDaypVIOx55gLe8uyeg3XTEpph50hF6dT6yQm8FLzcn1mU/ACZffGtY5dhPaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CBXyL6H7; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CBXyL6H7"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54026562221so6864486e87.1
        for <linux-sound@vger.kernel.org>; Thu, 26 Dec 2024 00:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735201828; x=1735806628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2S3PhJ8RakNFN2ZNGYVv9qnlRZ5AL3BC9CtYpxM3yU=;
        b=CBXyL6H7ig3JCJ79EfGox0ioZbTuGZxe2OwfPzOQf+2aYPjLIxFEvUA7C52ilQeErO
         tQVe6pcTEPLzlXw7geTp9qVntqjs+pxs9NmeN3t5ekn9Rk14vQTRvfNYfxmmB0bHye9a
         +4HXM1w/T/waLjHhTy+SQGMxAKDxgYGk9pS28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735201828; x=1735806628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2S3PhJ8RakNFN2ZNGYVv9qnlRZ5AL3BC9CtYpxM3yU=;
        b=iK7a3KtD7Jj2w7pQa6QAvofSZgbXX/FnI3x8bUubPrMPKrMmmHKohRvg3xHP+wOdK3
         ykW4tcj7IloYVBX7GmPtfOxPwPa7XiGbFz818lqJkVcgw1mrJ6ulYoY7ykGEjiNJLsr2
         KPBw1mkKnA7FGSrndaj+CQDHH4LD56R49rvw6X7hrKc0KVp+ee2bxSVLAxA/hgGlTBLK
         bHorW8jaaKYdH45qf/C0lbqzlFQT/ox+Kugy1S3OXQbyxl7GL80QZc9t0SWcag/mkzjj
         MC8TB9Mt7HSdC6LDU+0kS+JzD4iTJQOj+KZTvUzAFAf+10xw/Ie481NxHN0qv5+GsND3
         re2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRMS/K+uusWDbnDrKcaKFt4ooQ9tYV+cSv5LZSFb/XvqNiclDi4kMFGFHielHwdZApSFd+OVYuXvQsag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFOK5WpEPvpya7tsNmsCcG5GPcriCtJOy9zoREadtyxUGZyFsu
	c0uXNrnafxvpVA/XmM7LNYRaAQXXUFNJtHE0XlmRy+GNBviFNSntc3OLSscV2B0HnCSmdVWUbU4
	bXfSHuJF/kjUO3b/NmlV3hJXb0WKUdBlH+ae/
X-Gm-Gg: ASbGnctTLAZ6yD9mPa+GShBUH+h4KUpgCYVPrq8IGCQvmxhPqcPgDoQGE6BXzyM67D7
	ngB1Tm1nsmIXHVze1ovVnnMv5pbmV+Fwvq2ncQsN1e1WFrzCeM5Cz6RgPcTm/lRVYaA==
X-Google-Smtp-Source: AGHT+IGrtTwpjhhwhEtLkMigzaaB7SQidO5BfU1GsTXFJn5f4BLy579qZREaSEycCfwK3L6T9pvM3RblbNdUBiHFoWI=
X-Received: by 2002:a05:6512:4485:b0:542:2972:4e59 with SMTP id
 2adb3069b0e04-54229724f79mr7301629e87.28.1735201828402; Thu, 26 Dec 2024
 00:30:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
In-Reply-To: <20241203-mt8188-6359-unhardcode-dmic-v1-1-346e3e5cbe6d@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Dec 2024 16:30:17 +0800
Message-ID: <CAGXv+5EG8LbgaWc-Lp_KQc8Yf+m_4TRo8R7B0S7-rXYpnak+7g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic codec
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Fei Shao <fshao@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 4, 2024 at 3:22=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Remove hardcoded dmic codec from the UL_SRC dai link to avoid requiring
> a dmic codec to be present for the driver to probe, as not every
> MT8188-based platform might need a dmic codec. The codec can be assigned
> to the dai link through the dai-link property in Devicetree on the
> platforms where it is needed.

A followup question about this. The DMICs on the Chromebooks are attached
to the PMIC codec's input side, which then converts the signals to standard
I2S and passes them out to the SoC through its AIF1. So the original code
was somewhat incorrect, though it works.

How should we describe such a connection, given that the MediaTek sound
bindings aren't a full graph?

> No Devicetree currently relies on it so it is safe to remove without
> worrying about backward compatibility.

Removing it didn't seem to cause any issues for the Chromebooks that
do actually have DMICs. I suspect the only difference would be that
the wakeup-delays no longer apply correctly.


Thanks
ChenYu

> Fixes: 9f08dcbddeb3 ("ASoC: mediatek: mt8188-mt6359: support new board wi=
th nau88255")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  sound/soc/mediatek/mt8188/mt8188-mt6359.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediat=
ek/mt8188/mt8188-mt6359.c
> index 08ae962afeb92965109b303439419bc6e7c2a896..1550e56ab57d54b179ebe5cbd=
60db1660bb0bd2c 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -188,9 +188,7 @@ SND_SOC_DAILINK_DEFS(pcm1,
>  SND_SOC_DAILINK_DEFS(ul_src,
>                      DAILINK_COMP_ARRAY(COMP_CPU("UL_SRC")),
>                      DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
> -                                                  "mt6359-snd-codec-aif1=
"),
> -                                       COMP_CODEC("dmic-codec",
> -                                                  "dmic-hifi")),
> +                                                  "mt6359-snd-codec-aif1=
")),
>                      DAILINK_COMP_ARRAY(COMP_EMPTY()));
>
>  SND_SOC_DAILINK_DEFS(AFE_SOF_DL2,
>
> ---
> base-commit: b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
> change-id: 20241203-mt8188-6359-unhardcode-dmic-ba7649f8a72b
>
> Best regards,
> --
> N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
>
