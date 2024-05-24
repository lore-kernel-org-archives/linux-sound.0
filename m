Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6929D84E19
	for <linux-sound@vger.kernel.org>; Fri, 24 May 2024 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716542371; cv=none; b=DkWLYWdkRkKO7NgnaGRwzUCO/11zniPMmDEdSmwZmYlVwGrv7/6BsZJdRzEif81l9yRwDJgrhKFW+/oEYH3NfLh/gxWKBj0PKUvmTjUGGjwbBQygUym5vFWhbkTmnkFiBa2QtfZjU8e8ynu7uSnOC2y+TmsoM1KQ0ag1nRvtYvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716542371; c=relaxed/simple;
	bh=S5WIHfo/GVVFuV2a8N3J3V/bskkP4vgyxo9cxv7VQAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHi22atNYCwrMhGK+JFV9aLz16qhFParr3xTmcMc78TZeWDqVHLb6823MOQqK2p+aNfJzLLz2eTGnf6wCP1MIGbpqig2Jl/M4SdXuEvRiPmMxnBC28kczDYlJTgAxy/vfVscSl1JF6g2KgASjKwrCaD2ol63rSAiniCugi2Sz3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AasbsFK8; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AasbsFK8"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-df771959b5bso776678276.1
        for <linux-sound@vger.kernel.org>; Fri, 24 May 2024 02:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716542369; x=1717147169; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BFC/Wq6r2ZnocxgGVbxbRurbvlwJyoIDrYIsqw3lJqc=;
        b=AasbsFK8Mt/PBkyaFq4wDhGGCDNTzpxMQ1Mwa29niqtT3epguk2PVIEfb9sc3EadZP
         FklJq+xk0xVWrT4Oc7bdebK+3oHdLd0476OGs+6I9Tl6C+tslihGZZjAA8jurcuO7S0E
         WPvda+m4XLP+XP4E9CGlLt2qTM6nthiWNjd8k4HVi/EnK7Ouf4dywmuElXhqbyHKgqgs
         BUb67NX40RL9ApGWYisP4HvOAocfawqNpguvbSGYvgJerlevu1vlxKAUyD8qsV7wkU0E
         jyrJoiGUNr/PyPc0Dqu6L/MXrvX11cdH3cpGY6Iigvu8GwMDeViM8r3Xf9bF9E8uIvGv
         e7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716542369; x=1717147169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFC/Wq6r2ZnocxgGVbxbRurbvlwJyoIDrYIsqw3lJqc=;
        b=sAmHRVCjD/Zd1AZO7QnycOsEsGDjBfOyDd63pcBZ07tklPGJXummNrmRb40aOEtAW9
         E1XCuW3pLDWZKfCw9ExgmT1iWWJc6/glRwuFdsRJv4f1UC/bS08AUYX2JXar7Wnei57m
         sgKIA2aIO1KAczetlcnUtT9YKnKsRGwgYVs6/kfZi+MejL+F4TNBezvFDNJa2TZrvIAn
         Ror3PpIcndcEOtH69Ei2tcbaAq2k+/ERAeG9/KUsSQJyV2Gp5BkXMDetZhXYZ6wR5uSg
         pWQjZEJCXNwXAUK2FE1VOtJh0EsCHDUkQm1+VPQULlbJKxj6M2T5iutNnZ8xY/9Guuox
         WnnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwdlEeRatBmsp/x4lSFpVfj3LcX6ZF/ZgrVBX5SIOdgkUL4nNd+vgKXZFK3RQ59+v24rTWmv75BTX1sv985OMH4lYqhtLCSyS8cSQ=
X-Gm-Message-State: AOJu0Ywv+JOVhD9759YJO4wzi25zi/q597GmM1s3Uu8Nby5u7uG2qaXI
	2mLImYztU2hHA67Xh5e0hIN1LCpHkwFxvQIXIZGFb4OF1xNiVUxHvytJoj4dBdN9JcoPoG93Xo5
	37Y7S4Tg65Ae8xnbMkxAgzaGQbKMJmr2kvEwmpA==
X-Google-Smtp-Source: AGHT+IHQOGkX6tTv+H0dG9M4HcslJIDthMVJK/fTaxTSoTTh7UEYLllN3SvzcSDRZhpNnspLGW/VvYGgTEt21HlMSwo=
X-Received: by 2002:a25:adc2:0:b0:df7:695a:1cee with SMTP id
 3f1490d57ef6-df77221c3b5mr1532190276.50.1716542369346; Fri, 24 May 2024
 02:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524035350.3118981-1-quic_mohs@quicinc.com> <865adb41-fd27-d303-5f0f-a68a814f41ab@quicinc.com>
In-Reply-To: <865adb41-fd27-d303-5f0f-a68a814f41ab@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 May 2024 12:19:18 +0300
Message-ID: <CAA8EJprDb0fk0G1wrzB99EG=HAm5tw1Mz=mSd5mDMptDOoUb2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add support for QCM6490 and QCS6490
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_rohkumar@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 May 2024 at 07:06, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>
> On 5/24/2024 9:23 AM, Mohammad Rafi Shaik wrote:
> > This patchset adds support for sound card on Qualcomm QCM6490 IDP and
> > QCS6490 RB3Gen2 boards.
>
> Please ignore this abounded patch series. No need for review.

In future please use a logical prefix for the cover letter too. This
helps other developers to understand whether they are interested or
not.

>
> Thanks,
> Rafi.
> >
> > Changes since v1:
> >       - Use existing sc8280xp machine driver instead of separate driver.
> >       - Modify qcs6490 compatible name as qcs6490-rb3gen2.
> >
> > Mohammad Rafi Shaik (2):
> >    ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd QCS6490 sound card
> >    ASoC: qcom: sc8280xp: Add support for QCM6490 and QCS6490
> >
> >   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
> >   sound/soc/qcom/sc8280xp.c                                | 2 ++
> >   2 files changed, 4 insertions(+)
> >
>
>


-- 
With best wishes
Dmitry
