Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24112C028F
	for <linux-sound@vger.kernel.org>; Tue, 16 Sep 2025 04:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757995984; cv=none; b=NX6bgUhuLHA0oSPsS77zGz8ou/o3H/Lp1Gk5NhEdPmO683yO/7VbkE+2PK8Ro9/J14g949kgUjCSSMOLYYgJqMojXhAL20QBqCzr4Nk/pJf8YhdVtVXmmdiF6Zn5LJ8DrkQ5RJzjvR2V+PI3wAxxeplYU9j6a2Zp4vnAYpKr5dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757995984; c=relaxed/simple;
	bh=/eaFqfjS5AzkFvGaHuw5HluS1OrzKBGI4k7j6gBXfz0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=u5EjbLPQpRB3JQBcM4JOldGWAbrnGtOe/0zkcgPW80pjpl8OoL0jtBxUwIrxM0cPc6qdxwLwNLVQ66lL1ooPaVxledDR+vh/70JkR2tlVqOhNNeiP+LPIfwzs1/Zyad7LzZhbk6Kt7WsFObBHA6cQ7tNrn4go7FoUSw5+p9LuWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j/kE44zI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j/kE44zI"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3eb0a50a60aso1213312f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 15 Sep 2025 21:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757995980; x=1758600780; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyuXm37795WaH2EuOl7F11aAWWFTKDHYiHZFqXZZVVQ=;
        b=j/kE44zI8RWIE9ao7NeiJRNOy3l0iZQnc5oCa6t/Z1emESLXPJi2wwlnpwd5GrWI44
         IRVtyxRDDegOZuXZK6b+GHwnxEz2nMxbiG79BZ4XTnh6M5Fdl+g+H4LNQf029mUuXjcS
         dHUcFPLgUFGvWATA7Rv2oY1uTCvFyTDR8GQPav+Y8PFRTWMpyD5azmgCI6sTuNfknCGB
         8/tILbnharDxSs/72HG+TB5VznW0tYqmTlYZ+Uyqcyro2/cJHmuklP95lyHbpnUYcc/P
         J3j2IZx7qLCXx5gKgCgyNdUop14YxXaC+McCoWQbR6tNOWk2urK6ZLcpTMjiul0e00In
         lCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757995980; x=1758600780;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OyuXm37795WaH2EuOl7F11aAWWFTKDHYiHZFqXZZVVQ=;
        b=Z3QqPv9cnQ10OMV5grit/l+Ftnt4674l4HGzOhc5ztrWlN1VbKjnkWCiYEYjs9rbMH
         gSu9C+PZRoSBue8MoZLZpBwKvVB2qfudo+sQMA5BIU9il659CdZtKiJ1iXNdquD1Aqkt
         hCfL8mWNgMXIWVeTf0w7pfg+o4uBW2BRLVWodBah53YmeYz/vgoZIfGIPvwPn/k4WVco
         s0Mcj8KH6iV2K+vTh+jAMFNCkdcMZ6uQ+QfzajiqmqXzkK2YkxyPWSdodPeN8riAvui/
         Fw3SVvWbVK/pceCjkppOXnCtOpVu+BuWlnQcZutuzvmQcdmJI7icpAbTuDhDYR3Akq48
         ulKg==
X-Forwarded-Encrypted: i=1; AJvYcCWX+WbtkvAgEV2u4RUVc8jzL42EQvTZHmIy0q4RVuAC4UUb69dzbci7hEIe/lYaqgSH2ZOO+t6PMuLaAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNY7OQplCIa36TcLrd6DC9j0cWlmSFTC8fU+Hq+X/Ih+VvZZ2S
	RnaFU4WcsmBW18bs71G5EoZF/K5mjuwYPuROqCue7oJfRvVaM94wR2yYMH3r1zOaVnk=
X-Gm-Gg: ASbGnctWC21gN667Qx+a2yezxCEKFeGEUbzwuldWgLZ/RQWfqQc/NbbdoPOV6tTUhd4
	qJDpflOMTzPMqdTEyEdYqHSaI5AbMa+M9xlRoVjYiHCF/CnptCG3ACdohzS4gk+76sZfFMdndjt
	dFeGNamTJCt10RYhOC4lsyWyJv30znu5ZTLpWIBExXb4p0tFKm5i6ZjTs4KvuRWpmsqDjm/D/1f
	wiHgYZ8r5uZ7vlkEphptSZa761vxWmf+YE46SrJ0Ej3I5PNf3r2cMBB2a6TO9wjk0CLaOjqij4m
	YKxEApTgBj0lRvEBcIqx58pfJJ3RI3+rT3GtJOb49vYy1Z65Ccd3sXFTeXCwjLL4bSI1kAe5drE
	9b4ZAZofoQiDUwcqCUwrhQidNAlGURpSJZ2uYYOEI/AzSpjW4GfGF2Xju4Q==
X-Google-Smtp-Source: AGHT+IGouhffCRGm0t7KfqX7cj13uvy8MWvPOWCTw8LtRQUH3MFmSAZ44+x0vNiLzpzhIJVCLJAB5w==
X-Received: by 2002:a05:6000:1865:b0:3eb:9447:b97a with SMTP id ffacd0b85a97d-3eb9447bb52mr3933877f8f.54.1757995980264;
        Mon, 15 Sep 2025 21:13:00 -0700 (PDT)
Received: from localhost (054722ac.skybroadband.com. [5.71.34.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7d369ea3bsm14796545f8f.0.2025.09.15.21.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 21:12:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 05:12:57 +0100
Message-Id: <DCTXKAW0DYZW.1P7UG60C8GRO4@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>, "Srinivas
 Kandagatla" <srini@kernel.org>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel@oss.qualcomm.com>,
 <prasad.kumpatla@oss.qualcomm.com>, <ajay.nandam@oss.qualcomm.com>,
 "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RESEND PATCH v4 3/3] ASoC: qcom: sc8280xp: Enable DAI format
 configuration for MI2S interfaces
X-Mailer: aerc 0.20.0
References: <20250911063612.2242184-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250911063612.2242184-4-mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20250911063612.2242184-4-mohammad.rafi.shaik@oss.qualcomm.com>

On Thu Sep 11, 2025 at 7:36 AM BST, Mohammad Rafi Shaik wrote:
> Add support for configuring the DAI format on MI2S interfaces,
> this enhancement allows setting the appropriate bit clock and
> frame clock polarity, ensuring correct audio data transmission
> over MI2S.
>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sc8280xp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 73f9f82c4e25..3067b95bcdbb 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -32,6 +32,10 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtim=
e *rtd)
>  	int dp_pcm_id =3D 0;
> =20
>  	switch (cpu_dai->id) {
> +	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
> +	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
> +		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +		break;
>  	case WSA_CODEC_DMA_RX_0:
>  	case WSA_CODEC_DMA_RX_1:
>  		/*

Out of curosity (I am not trying to block this patch), is there a differenc=
e
doing this on ->init() rather than on startup?
For instance, in sm8250 and in sdm845 sndcards this is done in ->startup
method. I suspect that answer might be that both locations are fine and
sc8280xp sndcard directly calls qcom_snd_sdw_startup() on startup.

Thanks,
Alexey

