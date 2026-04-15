Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5469334CFDD
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776251217; cv=none; b=J64vo9a6K8qCEwo7iti/HAFggJs5GzpWgKSE5EK3ykQJFqsqy/FzWOcqBUQmFGh5Xz6v2QvkJWOHC0I+GFcOI6ZYOISJKEQ2SvFoXi4wBKfvNe/jczTLyNlSEmmdTtakUbjccoSw+dQb2JIjBxcta+PMxNfGZcQPW9y8gshsemc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776251217; c=relaxed/simple;
	bh=LDI3mtUhr2Rd5w5ikgiCoRnemB42IOlavCohdIScs2s=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=mKqslkq99HyLNsF0l4yLSCxeyBFTzOHWPhHpcTF9/cTKxQzvgjUnk03UaUEtvWpTQArBrPNrq7bCZ1evhjk11rr1zKbEoGDL8ULE5C+2bvEJeajr/YJPJHl8xoswlyDKX61Wh+XhlRjeDObxBFr49jnKwng3d9nPMOBWqkubqMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FC1dNizW; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FC1dNizW"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so5235757f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776251215; x=1776856015; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rw116FfYB2wR32SWs/TCFerpwP/9uG3dqe/oInwd9Xs=;
        b=FC1dNizWonp4QpzI2N3Rq2W2xJ4iMmgVfWaMZPlRlepTj+O46bHcZeMyOvzm+f4p5B
         0uL6aFM3ptRN6stlO+7R8SL3cN4C1leb1oZKGUZqvWTFFrL+9ofe30xrw7dS1bEepTjQ
         J0ADmXh+JsoVhe2SX/nQRIjjwzpx/zqWnrwl+GJAsYiUS0ZzXbnZwadHVOurA4W8rzRO
         9qm1UgBqRSE9VOZzXNUgmlPQxITuvHMnnuGTsAUeT7wZ700vKzw0QCgtOVH2VY4mS9Kr
         klEEn4HbmUjn44Ac0GBJAeenFRV01M79S3CFRgUHuQKuQYuVeYJmzUFydARFzyqUq7GD
         Uihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776251215; x=1776856015;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rw116FfYB2wR32SWs/TCFerpwP/9uG3dqe/oInwd9Xs=;
        b=Lm6mi0Ew/Eq/qBiWAlCsRAQMbxEqmgZ0J4o9qPJO7MKcRQp3TPpuLTYK4y6O4DFTnW
         HGmBSATARQ1+fSvq0vp0Zc3fzJFbZ9y7eQZj5p6Qox+kIRmsxChQgr9LDAjaRLqGDo4y
         zW/wM2bwqtnaK5+2I8GAwQ65TEuYvw3cxSnMQI/r91LtFCwbIxdfsB6EQF90cyWITU5B
         cm5gcwni7XA1ff36NxPkiJnAdrnks5AB8Dft3LoSAEXsxFMyu5ym4dgDSsYF9IDWnPQ+
         A1UKzyY8VylaS6IAjgTnXAf/Xf1k54QGnPf+RdP3gJvIl+mHNFV2agHIRNovx8ovTBbw
         JBeQ==
X-Forwarded-Encrypted: i=1; AFNElJ931SQdiv1KNa0EXUT5z95+LOfcM1NvGPKlN1+qS77wUpoyE6yiZJiWEHBIBC6XiH/BFSBkNjI8w247RA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6FQG8XW/dvzIoKwNobsZs0GDxYCXuhaiJTaXZg1NUy7P2sraV
	4b6yMi9+Y3Tt4NSvSwc4Q6qabp0Bi3HW37hgx9JvOwAlbvoiIE1I3rnhDA6Mq2q3194=
X-Gm-Gg: AeBDieuGPXT29FPMWHNvKGtsj5LX0pOcYJGeGCcwc518J1FEdcFU3THu83Uglt/9d5S
	MI5/7DEk/H+xe2sglRDZxu8bHwGcTzEXNqmEVcca/z7+EEn1eOZChmtVekq1M/3sksbc67ftCA1
	N+jkniB5sATy6slxF/qyx5JTC+qO6+q5exSKD7TJYPIhazTMYX3eP0BAWRDIjdQ04TxzIquaMOY
	glQJhEOzSBGkathwrkY7Ob/PeIueX8fI6stGbldOn6E2x+60KYkxFrPLquUghj127gecRakfUuV
	W8/pHCINzrH6EC5PUPbmV1TKPKRGjg/xY5Me7pSQ1ZrG1m6/NHVV50a4xQYbteEw0FW4nPlzceP
	JMMX07qTmQ8kWPdXQpNGPhPXXS3t6P33+9YxnB/WT0gRimrtn/zASra3AUSNEWsdnv7TxrJ1kff
	kEZ+XECgNxJCDl7TNCaE67APMFztNhIEPzDElHipePCv0ddSBLyAYM5QGyopkel4TeEDl0fxwmN
	gz4Z/6D1FzM21scoQ==
X-Received: by 2002:a05:6000:184e:b0:43e:aa88:f1a6 with SMTP id ffacd0b85a97d-43eaa88f2cemr4326833f8f.45.1776251214558;
        Wed, 15 Apr 2026 04:06:54 -0700 (PDT)
Received: from localhost ([212.187.182.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3e0091sm3867007f8f.25.2026.04.15.04.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 04:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 12:06:53 +0100
Message-Id: <DHTOI6CA1PS0.3JFMJ1VE6OJJZ@linaro.org>
To: "Kumar Anurag" <kumar.singh@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v1 4/4] ASoC: qcom: sc8280xp: don't force S16_LE in
 hw_params fixup
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-5-kumar.singh@oss.qualcomm.com>
In-Reply-To: <20260413091937.134469-5-kumar.singh@oss.qualcomm.com>

On Mon Apr 13, 2026 at 10:19 AM BST, Kumar Anurag wrote:
> The machine driver was unconditionally forcing S16_LE in
> sc8280xp_be_hw_params_fixup(), which prevents links (e.g. HDMI bridges)
> that require 32-bit formats from working. Drop the format override and
> keep only the fixed rate/channels constraints.

Why the format override is no longer needed? Please add it in the
description.

> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 7925aa3f63ba..c00eabf200b7 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -75,10 +75,8 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_=
pcm_runtime *rtd,
>  					SNDRV_PCM_HW_PARAM_RATE);
>  	struct snd_interval *channels =3D hw_param_interval(params,
>  					SNDRV_PCM_HW_PARAM_CHANNELS);
> -	struct snd_mask *fmt =3D hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMA=
T);
> =20
>  	rate->min =3D rate->max =3D 48000;
> -	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);

Does compressed playback work after this change? How did you test it?

Will it be possible with this series to have compressed playback via
HDMI (with 32-bit format, right?)? You might need to add some
functionality for this in topology.

Thanks,
Alexey
