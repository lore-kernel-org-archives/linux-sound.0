Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFC3262FC7
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 09:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852383; cv=none; b=SefeIo1eKL+za6ZMQjWXBsPG8vUPeTYUARbg/NJ2+9Q23Wd2TItS/+5I9hGUx0K9vG0y5MgWRamBENLrOhcKJA9egqrAXb9AxTJWpHEFrsy5JR2wFauCkc44uM5pdkEdu/izsyxPeF1CxziSHORpSq09GoALQrKQo/rHuOTFVGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852383; c=relaxed/simple;
	bh=iURxM+Kru3yKVcNXG3qZK+grW+Uwxs8g48QURqWE+Dw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aQMz0ZErN1N3z9kBpF2nGMad8X8z0dwJKRtBFmpb6s63fYFMi0uGHYFoWYPUWMxBW9EGtC34QOFHP6THEIFyQfuLHyf7aKx1neknrfaLZ++KTBSdeL+yRw7aMjADVWQ8VNs2BkeHRTRNH1DZoJle5R8Y1zda/9rQkaeJEUm4L98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1MlTS3X; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1MlTS3X"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47721743fd0so19484435e9.2
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 01:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762852381; x=1763457181; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XrZGrLeAnfxS3xhIdFqspv3Tf/8B+JAp1NJ0Xu0qEgA=;
        b=C1MlTS3XUz5wY8eQQkD1jUb6RJiLD9epBnuQqYYu2pKUlWKl+rPEzKtmPmAQ6tVror
         2O9mx1HPmrIJxsYAiMsh6wZDm+eGYxzvmY/nH8hYju7jIkiO0bpMQkf23V1PMwS0eCrn
         IXkntZJjMLaYagi8+dzbsMCzY8xdF3IsV+sIJA4xVw5drgtptmAVoyw9SOw33fig3isQ
         Uqix75uPffcNzqwhcsjYwX9Gyyyqx/icBBjZmHCnMUGaBbfFtN0ivqTwyoSTvBoXfLbW
         SgESu/VNEqyR/A/qr1kX5PFPuwfpLgNDEUIMj0qNYaa3emaB+y+2Po9baMJlb+1L7w0A
         pYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852381; x=1763457181;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrZGrLeAnfxS3xhIdFqspv3Tf/8B+JAp1NJ0Xu0qEgA=;
        b=n4oUA+q8V/0/pyMTCrelX9fDlKCgdyyT3SvDAvNoAf078fE/0xtiCfWspbykEX7Ti9
         y+nH7JEsMn+HuXAKP35M+ElDYvZmEamQ9SXerO5X5Da2fpPfujo2WbKYm5JYUhMpEZHE
         bsNKxiWCHiWkCV6h2dFq5eaJMK6olF2KFO40OV/fehQNXPoMFxf6ebFkYSNXMnlhn1Ad
         IE1RF2v5UFVCOB7kL/TXSFMot/okq+LklnDaBOHhZD8hRdCCHj1Z+DICW/zbmXSq4VTs
         bN03pg9A+E7zuEAM110qNLhKsW9Lgd4CH/sBFSq/GEZuSjv7sHjJPpbZIAXuYDjFjb1+
         lCiw==
X-Gm-Message-State: AOJu0Yy9AcImFSfioUwyqXV7nv/OoCN/GagdKgQIimbRxRLpzQr0GYXn
	rRaZTKdZhudepusOM8hgiGdWdawNsoL3awMyX9vOXnpaoSKRqI63myGR
X-Gm-Gg: ASbGncs214ApsjnJd446ffU+Wgkl+c6mBKJEY4WwMP0pNJoCqzFS1/4NsDfEyxZ2RKJ
	pX5aMWPF0RomVYtgWMZiJAaiKNYInYR9pFYEtdPlgPwIQyXsha7cQRslJ/2m2HSsJJhWTO/LpQs
	ZDCBtCdesrvnyUBJ7D9VNkKaVNztJQPPlLbWQm2OxDviWcJLw39cVLlzMJzqeBvHnUrpNfvXmed
	7SPa5eIrlkjePDAFQlOcs47pWjnMzha1YX9UeCp8DFsvXy0Y2B0+Amh+vpYa6uPVWvSK99/3Lds
	102Ok9zXixW6qo16fWpfADiGk5E2lBo/8X2yvMLq57fjqCrzvh69FYXuXIDoYS/cFq1JvxdbAKV
	25DHBHIpSGqV8yn4CX2BX2Wp41yezFDcc5Dgj6qS0rbLlm+6b0CkzwZeADgGspym8DDvsfVBTi/
	RrymUiOODJ
X-Google-Smtp-Source: AGHT+IHSTTzqNUkLp0zPv4NGTvCdW5djz9Qh/4opHg1aueaPa66Kq/Qb3xhgp/iQ4s5IVt5zGoys0g==
X-Received: by 2002:a05:600c:1381:b0:45f:2922:2aef with SMTP id 5b1f17b1804b1-4777328f2a6mr110366435e9.28.1762852380476;
        Tue, 11 Nov 2025 01:13:00 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47781bdfa8esm27756505e9.4.2025.11.11.01.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:13:00 -0800 (PST)
Message-ID: <5fea3bcebdc0aea3827bdbfd36e27529a6de9115.camel@gmail.com>
Subject: Re: [PATCH 018/292] ASoC: codecs: adau1781: convert to
 snd_soc_dapm_xxx()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	 <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Date: Tue, 11 Nov 2025 09:13:37 +0000
In-Reply-To: <87ms4t8lrd.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
	 <87ms4t8lrd.wl-kuninori.morimoto.gx@renesas.com>
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

> =C2=A0sound/soc/codecs/adau1781.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/codecs/adau1781.c b/sound/soc/codecs/adau1781.c
> index faad2f9f8dd2b..38cc0b6e41227 100644
> --- a/sound/soc/codecs/adau1781.c
> +++ b/sound/soc/codecs/adau1781.c
> @@ -381,7 +381,7 @@ static int adau1781_set_input_mode(struct adau *adau,=
 unsigned int reg,
> =C2=A0
> =C2=A0static int adau1781_component_probe(struct snd_soc_component *compo=
nent)
> =C2=A0{
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	struct adau1781_platform_data *pdata =3D dev_get_platdata(componen=
t->dev);
> =C2=A0	struct adau *adau =3D snd_soc_component_get_drvdata(component);
> =C2=A0	int ret;
