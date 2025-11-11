Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC022594BD
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 09:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852417; cv=none; b=LhnQjFFXYFk2ntEUpAAIGZHKVEsPbobxoNHKaev2exuDXIQZ9BrtlRGMedikpavNEzBj0glPmk00ZlqNBR4ktgptKzSB7qLoDax/HJ68KY2gXdQ7C5CjNHIifJP70sdQFnp8nxBRLBjFTLUKFug9B+jUQL6iQ/4UBvszA0g2f2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852417; c=relaxed/simple;
	bh=3tQk/wUiP4Y7Q6oKRYFz8hwJTg5Jrn7cvlLZjjxCW4g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZYAmMv8lEvTg2SbSbm87/k4XSoH+tX1JCsitrQw9pbMh8YDhgkj/jJMHaKwxMro/8koAdYYSeHixLH4t1OsJYtvhSclcgcyvsjxrSRbfRmczLymB6DqD7pEBsbsYZ67NxdFICU3ilEe8Kv7kF9MHhQZyGbLvZ4rJrpy2bPxrWG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9pEOCa+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9pEOCa+"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so962386f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 01:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762852414; x=1763457214; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oyXKFJuYZB3kIx0/eSdjwog+HEBS50AzoTDoXOomErA=;
        b=M9pEOCa+F2j8uw27V6vBeemtYOOQqmLgbEsS0IKTCs7Iufxhei2TP9dFaWKgTnM9MK
         m+bXdSpg0QQgN4bMZCzj35XyDtSjYMEe/xSoM+i/3vwTfwby+ZaMaSCcaRX+P3n7XUCD
         O9APeeOdJnzPLziTKnkrpA+WEjuNmfZlIpktygNUWPm9EXTltsjf/5iiuJZ8G9tV2YHh
         dGfw5i5OasDKlDcGGHBau0MRbfIHfQaXKse+kRRWdNSWLkAhfT9106uGkBi2HaJkpKYe
         hm8N00mZWEzV9oKONLHFM0+nIrxZnqo5AvLGp7AI9KNjf+rSbVMalaJdH1QtKkG2qjGJ
         UfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852414; x=1763457214;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oyXKFJuYZB3kIx0/eSdjwog+HEBS50AzoTDoXOomErA=;
        b=b0qL1MZbzmAD5m5eFjgjRBA9902kRInMsDa56l32oeJ0c5VtHbT5gwmYiuGqd9s6xV
         DUhZjSWRAuZtdflaTQmXvR/yiO7/H/4x+5JnYnHX/PvHEvQD9olGQknAfIF4J0BK5usD
         ORCZYmdX6jV5XLD/VVEyqDY3UwV4k0NpSPM1OdEWlTuo/t57LwYq31VY2X0h5Jg5EpKJ
         SnC0qlwvge+yht2kXZlSw4xvfGy6Tnf5/0OCPLSDBZaYu76xVBSEaJa3OeDfv3/cPIQv
         ugdQd43KiHYBvzPvKgwSb5wAEdYpVXlc8QNGZecZJQ86fUQkYGvbPa+DScribUihabJz
         VJMA==
X-Gm-Message-State: AOJu0YzKGPEGQtSEsPA6N3+bLmXtGgSxbfXAYduNFmGGRf/HM1I0XHfF
	pV+EuMoWxOT6YAHhdU+IUTdTmZHDX3X/KqYy9vnSSyhw1UMGj++Odrx5tGu/9DXf
X-Gm-Gg: ASbGncuyS/qjMY+kkmDlCOkXX6jc5beQmbTeQA/FkJ19Wv16wkpmpLzrOzeLdR7G3Wz
	eicQvIky00m3MyM7NpmSW7F3/QAqTdsVwOZ0iAA+umvhlm8EdEqR2/rIe0oG8Y7KPWZRks93HGd
	yMzHI03QUay8gQuhSlcAHzyhyRpNwdvIc9kSNlfGzN+gLPBkczfl0SWYQ27jTwDpfh96rqIKIlJ
	MZ4hsPvgiA4UfI/A0HRUVdIySlKpZtQ7B5u6H2/gnHMOb5E+CoLnFixvasapB1D9L8melVk+q24
	54E9l/eRR+0AqRt0smfb+68TF5bE0opaO2VP18xIlSz2OD/46HqikLxksVyeDuKHfHZA2dLoQd8
	A1xRtrINCMV/xdjQxtQpmLQVhnVcrgQoQEWQAwG37KLyKaBrz8kDV/fVJmhmftm8MnnsTrnBlSu
	j0kdFPqRd1hk04aj9DAXE=
X-Google-Smtp-Source: AGHT+IFONgd61Njl6IAvi+9UjJUNoZ2mc17oZOqaoKVRL3QHO3VG5g54pc4kPgYrEG9vzw4D3Pbt/g==
X-Received: by 2002:a05:6000:2f82:b0:42b:3131:5439 with SMTP id ffacd0b85a97d-42b31315c6cmr7792428f8f.21.1762852413540;
        Tue, 11 Nov 2025 01:13:33 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b3123036bsm18679754f8f.28.2025.11.11.01.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:13:33 -0800 (PST)
Message-ID: <1273b10b3aaf98d05a4c50747adf8e2376d68303.camel@gmail.com>
Subject: Re: [PATCH 017/292] ASoC: codecs: adau1761: convert to
 snd_soc_dapm_xxx()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	 <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Date: Tue, 11 Nov 2025 09:14:10 +0000
In-Reply-To: <87o6p98lrg.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
	 <87o6p98lrg.wl-kuninori.morimoto.gx@renesas.com>
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

> =C2=A0sound/soc/codecs/adau1761.c | 9 +++++----
> =C2=A01 file changed, 5 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/codecs/adau1761.c b/sound/soc/codecs/adau1761.c
> index 1f09ea385f8af..a70c46dd5d76f 100644
> --- a/sound/soc/codecs/adau1761.c
> +++ b/sound/soc/codecs/adau1761.c
> @@ -621,6 +621,7 @@ static int adau1761_set_bias_level(struct snd_soc_com=
ponent *component,
> =C2=A0				 enum snd_soc_bias_level level)
> =C2=A0{
> =C2=A0	struct adau *adau =3D snd_soc_component_get_drvdata(component);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0
> =C2=A0	switch (level) {
> =C2=A0	case SND_SOC_BIAS_ON:
> @@ -632,7 +633,7 @@ static int adau1761_set_bias_level(struct snd_soc_com=
ponent *component,
> =C2=A0		regmap_update_bits(adau->regmap, ADAU17X1_CLOCK_CONTROL,
> =C2=A0			ADAU17X1_CLOCK_CONTROL_SYSCLK_EN,
> =C2=A0			ADAU17X1_CLOCK_CONTROL_SYSCLK_EN);
> -		if (snd_soc_component_get_bias_level(component) =3D=3D SND_SOC_BIAS_OF=
F)
> +		if (snd_soc_dapm_get_bias_level(dapm) =3D=3D SND_SOC_BIAS_OFF)
> =C2=A0			regcache_sync(adau->regmap);
> =C2=A0		break;
> =C2=A0	case SND_SOC_BIAS_OFF:
> @@ -658,7 +659,7 @@ static enum adau1761_output_mode adau1761_get_lineout=
_mode(
> =C2=A0
> =C2=A0static int adau1761_setup_digmic_jackdetect(struct snd_soc_componen=
t *component)
> =C2=A0{
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	struct adau1761_platform_data *pdata =3D component->dev->platform_=
data;
> =C2=A0	struct adau *adau =3D snd_soc_component_get_drvdata(component);
> =C2=A0	enum adau1761_digmic_jackdet_pin_mode mode;
> @@ -721,7 +722,7 @@ static int adau1761_setup_digmic_jackdetect(struct sn=
d_soc_component
> *component)
> =C2=A0
> =C2=A0static int adau1761_setup_headphone_mode(struct snd_soc_component *=
component)
> =C2=A0{
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	struct adau *adau =3D snd_soc_component_get_drvdata(component);
> =C2=A0	struct adau1761_platform_data *pdata =3D component->dev->platform_=
data;
> =C2=A0	enum adau1761_output_mode mode;
> @@ -819,7 +820,7 @@ static bool adau1761_readable_register(struct device =
*dev, unsigned int reg)
> =C2=A0
> =C2=A0static int adau1761_component_probe(struct snd_soc_component *compo=
nent)
> =C2=A0{
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	struct adau1761_platform_data *pdata =3D component->dev->platform_=
data;
> =C2=A0	struct adau *adau =3D snd_soc_component_get_drvdata(component);
> =C2=A0	int ret;
