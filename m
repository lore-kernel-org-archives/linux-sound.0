Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF56D35FF66
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 06:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777359375; cv=pass; b=kYqkeOpX17omk+ZzUzC+NZffWbQRr3QiledyKwwnEeBZ7KyKzjYaUei3gtbIO8wPsGCTjjIzsKQOvqoZA+uxE3Fx3pvJ5r7jiaPHTO4NCAUDjkdPcuLnXB5NjizIjN498n5oK/KDzfojL6llZchiKn6hS1FvJnmJxrqR2YEf1k8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777359375; c=relaxed/simple;
	bh=nwuWT1phn1en8n18dvBdTOTEU1b68JKoOn1+J+UbF4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GgIGPPbmG4iQzFeWbjjm2fbeCmNN085tdCn/3AaCZA43SRtT7G7oTLXWC1lFR0FM2XR6GQWHYcM40gqstBhu6CJ4YzJTuvmrESe5n4oew5tMaDV0VffeKuerXOzNNRlCn12JrrcaUFkoDUR4M02f0i2CsnIksc8I4C9kwV47v0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HY/SCFCU; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HY/SCFCU"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ba5b107eaa2so1178539666b.3
        for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 23:56:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777359372; cv=none;
        d=google.com; s=arc-20240605;
        b=EIDOzrqdFN/0ICFUczEuuQ7281vm8wVcuuegnghMyzFq9MGY3V3REigksuL/Lwb71V
         ZNBIzyt5qswZJNUbN1lH3vPBPZ5V6e9VEBEpKZZ/QonethSTj8/+BSDlIEqcCsR9f0H0
         Re4s31I/5nACDCaciKJATmCJ6DbdAY35p1D69LPWzfIFU0xOTe/DIxBmIewFpIVt220h
         1J4xKSjBP6Bt/HwEI3qwedevA1Tds0U8xA519fAqtfwxqwmdpj5JWEQPS7cDAIhVFvxg
         tqnYmrTmWFicHM/2C45UAqGOlwRkWD/GUon5MXz0NyGmmu4X2+wzn55ajb/ITNINTLTT
         Fgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nwuWT1phn1en8n18dvBdTOTEU1b68JKoOn1+J+UbF4Q=;
        fh=x7s0OZqETT+4AopVny9CmPyQd3m5wYAsqzRqz1kaH20=;
        b=ZwwjO82CwlVOTzRDiNBDLB85ce6jImC49zjDJU4nanaebwf611H4ioxf28xTkziAKw
         nRdVDnfCWu+ycbwIbtsI/CYhiFP0Gp+RbjRsLrUSB4s1Tv76M4Ef3Hwf9ZSbrhXyVCsE
         wURQYK06hO2nejvPHYqeu8ymuAPGXNG1gAlm9NiJl/VMGQnh8qdToLl1G3CinqmwUfSd
         LqTwo2l9eFQ1OFem1r0664882+sqYoY+39X6AbvWMxoDZjf8Xc2fcYm4HHFOlP+Nt8E5
         7UGQNxRJf70ACSYpPigUg0F7isDpzApIM7FSWnwz37KkN4MSAoP1oNJNCaKRf+1oruhi
         Rh+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777359372; x=1777964172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nwuWT1phn1en8n18dvBdTOTEU1b68JKoOn1+J+UbF4Q=;
        b=HY/SCFCUJqSLwk/PTVSoGSsKtPrgm4b8CjQqU7pEFzLvNXDeGq5NzgFnhJ8ooGZSvI
         ZvKAvPU6l5FqcUp7fmGFO7idXCRolIUehNtMmt/UJW+B+G98RyrSLqh7HJCJkIgA8ZOA
         rZNtMPxgU7spdknNmwCdBBFDMi8iD5EsSEpXgChzprf2OXoEpO01PzvZmKIjrwGZ3eQs
         8hhqWr5Ln9i18sy+D2+U3e5lGlqLLzb+Dq/jHzBh5Ek5Kzf09Qi+btCD8NbBrnGojvTX
         r8X/4IGdZwtTwd4qeI4gd2RljWL/+T5TLM0T5FobAZL4+HDRjdXAR4L37fhJIfPYbZhQ
         NpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777359372; x=1777964172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nwuWT1phn1en8n18dvBdTOTEU1b68JKoOn1+J+UbF4Q=;
        b=MfT2gKyILNLYpEA0ROYGoL2H+UM+sM0s5kZAjR8aRPWIg6ygOLLoR5xjWPQlFnBBWj
         8+QKojuurMS5WbW5CHhLc4vSZmx8rCjxO6SGI1vDNuZjI9iMYv9FOPsfvA+x9lykM3I+
         I2IwZq6x0LNySUMBm2sbJEn8P9FCY1gZ7pRVbjzH2x1CJKVd9DgIIKmW3h700i0xDWbp
         UiWtPDHKUdMeq6ra5TDBeX1PMiR8e7AFd5WdM+1q7M2w9v4FFN/smzYbRNHBJtsUVvXc
         AKs28jPgfpnav7f7ThNbqHQIu6enCkuXPEWj/97Ww4s3l63JmEqkHiAzJ2r8+qolYuxj
         +MLw==
X-Forwarded-Encrypted: i=1; AFNElJ/BX4cGvnf2KiPd+891cQS0cHVT5XpFsRh/mtdVe8nfmZf26kF/MGLvPvvXi+qQVd0dtzp3ILduDUiVGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9nofKMQb3+tMcMmShx9yJE+fE5h/FZp169qKaGP8xngBmZSWt
	fPlcoPSrcdrfYtUzJMECjH958R/D/LdgqFesejx7RHVSaybZn767Q1ona3uIipqhfzXPfM+Z2L3
	7nhPsXKcjG9eJ8AiZRt+09NVrV1qzsxc=
X-Gm-Gg: AeBDiesGAudduO5V/QYqMnw68BpaRXXS23ouIUuOjYFUUrcEQT3Gv68SbG6yR8crGBG
	ykf7Qrk3rYwm+0Jn6qOojbgj40k3alqGFWMV98zUFN2OGFQ+Na191NucUt++Jwv0cMjaGDYC/5Q
	a6nJlgvtXnAajMHNZxtp7yLPxfAHtzkN60nL166VemGogwlrgbxPasKj/kBjFPNXETTCWP2BHpV
	GMml3BsX9sDLcRO1iQsV/OLMMhuJ+4eCMx7k60PqPOtUl2XLc0+IBJ6UOKUEG86cZM4+fBmXeRF
	otikMWmQ52QOIE+DC/9q0fN/u8TQAfG4wk8ekYN0Z9r1HmLIH8pgBSC7fiEZLNLup5HC1jLfw1g
	q4BHbt0Gu3JbOBBDWiw==
X-Received: by 2002:a17:907:7fa5:b0:ba5:7cce:979f with SMTP id
 a640c23a62f3a-bb80404ed9dmr96050166b.40.1777359372038; Mon, 27 Apr 2026
 23:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-bytcr-wm5102-mclk-leak-v1-1-02b96d08e99c@gmail.com>
In-Reply-To: <20260427-bytcr-wm5102-mclk-leak-v1-1-02b96d08e99c@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 28 Apr 2026 09:55:35 +0300
X-Gm-Features: AVHnY4Jcn3zCFVDK1JOKYf8q6o4hYCT_F_LlxJGQ6NfjTnUM3Zm0SmcR0HK3ynw
Message-ID: <CAHp75VdMEXag0oeRd620YJn5TpgqGy4YProDcR7EZE__cwwC2g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_wm5102: Fix MCLK leak on
 platform_clock_control error
To: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Hans de Goede <hansg@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 5:38=E2=80=AFAM C=C3=A1ssio Gabriel
<cassiogabrielcontato@gmail.com> wrote:
>
> If byt_wm5102_prepare_and_enable_pll1() fails in the
> SND_SOC_DAPM_EVENT_ON() path, platform_clock_control() returns after
> clk_prepare_enable(priv->mclk) without disabling the clock again.
>
> This leaks an MCLK enable reference on failed power-up attempts. Add the
> missing clk_disable_unprepare() on the error path, matching the unwind
> used by the other Intel platform_clock_control() implementations.

There are 6 drivers that do the same, why is only this one special?
Have you checked the flow on the error path of the caller of this
`platform_clock_control()`? Maybe there it calls with the opposite
event to shut the clock down?

...

TL;DR: If it's a real issue, it has to be fixed for all affected drivers.


--=20
With Best Regards,
Andy Shevchenko
