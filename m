Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FA72EC0B0
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 09:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852317; cv=none; b=co4/C4wwP+DviHu26Ufin3l4d+UuB8tSWYL0S9jzYMpBrQk6gY8eymEWAO5PIBqcShTtf8iiTYEipKgVUdPa8nLFbeXafibDTLCEu66jyTTZ4PWwx22YvcktaAGVxv/v4vok3yuoz/HER0yg+UIXhlYQDXmcoICdLraDFVxKIWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852317; c=relaxed/simple;
	bh=73bZkk2d2L1EpN1hiyKWqPggf3BUaU7oY44AoI6DGVA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dnt2sL86aJXKqN4N72lcyASfG2Y7wLF4Mzq6/1oLXW5zlM3htcfAyewu6jrVnv63nebW2hAeh+pzPgVyMMWF+5YMk2pa4a0XK1pdRn/VyBlYy5brV+SQJf0q2IFVwTURzRv44v224tTmO8d5w6fSufrTCmweDJhRvtvuWb3okdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RprkwbmY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RprkwbmY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4710022571cso37773055e9.3
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 01:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762852314; x=1763457114; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aAHO6s4QsEywA5Nkub1hKtjE+x3g/RJ0mQDR4+IhVZo=;
        b=RprkwbmYAtUGtN4uguPzplOKXB7gDf+hd/cdFso4W9tVJJbal728tVT2wR0ngOPgDb
         Ccxr1HecQ2UoXNdbEuwAf/RJEAZlhcp0iVCJL8kA6RWsPISfDhigevb+EYrvaH/XjULR
         SkTItXHDcIzuuZ/641+tCh74iCuYrD8kvbKK2fTld9XId2aSI8CQQOCm5L4Mm9eDVLM7
         YxKOHxlPUeIXbp9AYWSH2KQBanfJCRBgxIdYLADN+W/b58Uy0nMa2JSHxHxaqNHcFEeU
         6QDwKPgasKhZHVTR582gIAH2YG3nwjfWJZb5/ahSp4SrzYROhj5EI6nK9vvL1vLiSNd+
         uAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852314; x=1763457114;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAHO6s4QsEywA5Nkub1hKtjE+x3g/RJ0mQDR4+IhVZo=;
        b=OE5sr8Vqj2rJctIFDdM4JPL8yrLYjhDLaRiHGsTScHMFaO5vnOmRmYbwW/jnEELoII
         +y7B2qKlMpQqnS+R1POVCetsuB/d3mZdpcV6wJwf2nvBcDVmbYxZxiDZUZwifEfMC8bh
         io7cK2T4UJdmczSAXeKqQ6QpVfKukXC7jEilbZg508+LrRBsnsuh7ERVTiS4cOYEB8EI
         8U+8y2wRHHL1thC55xQoS8OD4nh40/tqSVJHOmrOSKZDOVZpsXtSJJEiAHjO7tBLUbLF
         XWkBud6F1UxPX2wgbuO38Rt4wHW5JW6iL6jnmehNjyjOn8zGsnGUXHZMyhFm7Ktm5X0G
         bCTA==
X-Gm-Message-State: AOJu0YwfZ7hTxRNndm7WFXnXsIOVdyf09dZqC4ZVDS6jxDPk0ZIa82Cq
	aWFK2Lr+qre7G5e4Modcn2hnkGJoJYCUcMR3xHTShkoRW57Vsr2OgKW4
X-Gm-Gg: ASbGncu9a8seSvX6CRiU4sDRW3AZKFKG+Xtb58HBBVvZ591kUiBfuIY/yiyhlb+M+wE
	Tahm6klRMJXu9PRKGN4dLO7lxI22hzd/pJu4jPHNuPJI5O9ofbYYFxZAuBq6wgEUtIBc07jTCNg
	VxjZ+G76I8SoXqRBiS+aQ9J9TdKs5hrdxNzQD8K2AzQt8LLB1A2VBbL4EkRcsdGN9/GKcF+qY1Q
	HWbEFObk/ObzxSsh+FbcY5vlVh4FW4FfXopiclIBdeaEXREirKH/qbMkkDmgMtksB8Q1tjNO1nv
	29TzigZEHBkqT3q5JpgW8Hx0J9PvF1avW3JFJMVppRYzbVDkUmyZJasFt9Opdc+BlvQXXagU6T+
	PDrTOX3Q9r6YFIPUGGJyLfbQHESWeGreIP+aLjIowWecD3/mdI2iVEyk9qFuSl48nIKANJl8dzo
	+IRr+anapf
X-Google-Smtp-Source: AGHT+IHOJCm+tydJ8whB/8bepr7jrhybFmnC6quRW9k7hlMB7wHeDe7oBQM1IZLVLoMq4t4mNHCSOw==
X-Received: by 2002:a05:600c:1f90:b0:471:989:9d7b with SMTP id 5b1f17b1804b1-47773271adfmr130162805e9.21.1762852313777;
        Tue, 11 Nov 2025 01:11:53 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdcc528sm371902885e9.7.2025.11.11.01.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:11:53 -0800 (PST)
Message-ID: <ab5e06ece1346f33c4ed4f66b13e8c7e25d23310.camel@gmail.com>
Subject: Re: [PATCH 020/292] ASoC: codecs: adau1977: convert to
 snd_soc_dapm_xxx()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	 <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Date: Tue, 11 Nov 2025 09:12:30 +0000
In-Reply-To: <87jyzx8lr6.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
	 <87jyzx8lr6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-11-11 at 00:18 +0000, Kuninori Morimoto wrote:
> This patch converts below functions.
>=20
> dapm->dev					-> snd_soc_dapm_to_dev()
> dapm->card					-> snd_soc_dapm_to_card()
> dapm->component					-> snd_soc_dapm_to_component()
>=20
> dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()
>=20
> snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
> snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unloc=
ked()
> snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
> snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlo=
cked()
> snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
> snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
> snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
> snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
> snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enabl=
e_pin_unlocked()
> snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
> snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
> snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
> snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()
>=20
> snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component(=
)
> snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
> snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
> snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0sound/soc/codecs/adau1977.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/codecs/adau1977.c b/sound/soc/codecs/adau1977.c
> index c193a9f22f590..b42f35b1a6036 100644
> --- a/sound/soc/codecs/adau1977.c
> +++ b/sound/soc/codecs/adau1977.c
> @@ -473,6 +473,7 @@ static int adau1977_set_bias_level(struct snd_soc_com=
ponent *component,
> =C2=A0	enum snd_soc_bias_level level)
> =C2=A0{
> =C2=A0	struct adau1977 *adau1977 =3D snd_soc_component_get_drvdata(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	switch (level) {
> @@ -481,7 +482,7 @@ static int adau1977_set_bias_level(struct snd_soc_com=
ponent *component,
> =C2=A0	case SND_SOC_BIAS_PREPARE:
> =C2=A0		break;
> =C2=A0	case SND_SOC_BIAS_STANDBY:
> -		if (snd_soc_component_get_bias_level(component) =3D=3D SND_SOC_BIAS_OF=
F)
> +		if (snd_soc_dapm_get_bias_level(dapm) =3D=3D SND_SOC_BIAS_OFF)
> =C2=A0			ret =3D adau1977_power_enable(adau1977);
> =C2=A0		break;
> =C2=A0	case SND_SOC_BIAS_OFF:
> @@ -845,7 +846,7 @@ static int adau1977_set_sysclk(struct snd_soc_compone=
nt *component,
> =C2=A0
> =C2=A0static int adau1977_component_probe(struct snd_soc_component *compo=
nent)
> =C2=A0{
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	struct adau1977 *adau1977 =3D snd_soc_component_get_drvdata(compon=
ent);
> =C2=A0	int ret;
> =C2=A0
