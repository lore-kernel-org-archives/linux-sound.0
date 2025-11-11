Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1B927FD4B
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852453; cv=none; b=phYGx4Z5w+WdbzWCu654SIhIbiS1Wa2er58q2o0Ddz5Gj3MF0yKl1PYGQ2tlTHsJ+TWWyZNZ/U9P+l2a70Jz2UO7Y8NpX9miZXEHuN4w5XEx+FEnYFTEGlWcY9tAQBog3JE0af8r3HtmC6GeR716PGgj3nYvrbpd7DLhd03TENs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852453; c=relaxed/simple;
	bh=z2q/8dumDKVbMlC51bXrxloDY5QCakpLh7wLTr3MLG8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qo9Uth3x656wytOtjF9psME6vNlDBhLZYU0uq4+zzDsgflSBFnfnxw0Gr+cwk1Uh/w1cxBPa7XHuojDjIanzgOTci2RO9ISSTNy6aC6QlLPBxTPAMG4d9dMCWlFOGvZOJqnWlfEM+zuBNguGzp7XCoL2f5kMzR60IqcaE768mcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFJEb0FI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFJEb0FI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b312a089fso1477081f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 01:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762852450; x=1763457250; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4WMUHXLetoDJvr8ntteZTIAKGD7uebmz2jeUresXDqo=;
        b=ZFJEb0FI1qGlY6YMoOkmI3ty5pT9o1Cbccq1+3Vg6yVkOEQKtCWeKv0e0CX2HcXZjq
         ak22z9z2E85++Mw1guwRNhB7S7ZV+Y4TsyIUeEKWbCZAQbjFJwAKc7abmiZ/naQwZh4S
         heDZHfrxXPyOZNdxU983YcS4kr5FWvKQssl+NWyLThUtP4H6fshsDsUiPxZAdWUUd+d1
         Mson6GaiFlfK0CGFtHt14fxlPbX1PiYVJhGM0BloGjt+16Y0Taov+zcZXlbyy56+SUC1
         SeVglQXj3fvoDRn9qbRNKRprz/dUx6faq/X+UhE56+R0YbkOMPkoOhgtSQC1HpY8nRZm
         EjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852450; x=1763457250;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4WMUHXLetoDJvr8ntteZTIAKGD7uebmz2jeUresXDqo=;
        b=gY+nuKv8JvLht1phZHCkBPd2I7JwZco7DD53e/YtkAL8pbupJHWwIllms9HnJJMh1M
         Zx0LR/Eio2KQwsbaEr4Gs3uskHJpMyAEMxHmMjr0qP69Jpj4RK7MLryOFa9RBXXLiTs/
         2kESkh6z2eFE4i2gAdYB4nLPZNOCyeeh21zMO7Lo7FojaquzBGHvrVKJS35LsUs0C8gE
         WK1oNB7Teq+thu3JpGRhpbUbphFaM72G/I45M7q1upkmER9uBBWMKmc+qHdbSUjDcRQM
         qBtq9jULN+64yXlFiCULSY/vOZtn2/CSB+tuUVYMeTe+rSetBjUK44w7RBj6TaFwODpc
         OAmQ==
X-Gm-Message-State: AOJu0YwcX6Q39iotp0s/cDaWvJZW5395UJ4jPEzdrWlZNh3swawRFUij
	qWoj7/C7R9cQHazGE/T0XrSgxQmpRKrIPTnZrb113Ll0zhls/TBlw5k3
X-Gm-Gg: ASbGncvc+Y1HUckAWFyyG4HwpVz2nRX1L1erPOKHTiUXvxhjhncxPsXqLPEN6wx7Oe5
	gjPI2hmK6eel/lV1cwNXJSGTid7Vk01tDR2LPfXv5O+fHiL6cSNYIZM6j2liD91LRXDNSv96wIS
	zpCht+CSUv/kh9+2i/Z2yVRwrmF/ZTfJ5NedMzG8O0DwsPzVssKupCShVs021/E719c3RjEmHF9
	W/M4gCN3AcoaIPqq2Q3XKJlfB4dqA4wFARh3KpoGGFYAJvTtkWd68ZWKCejd0iNL44Mt1vjY/rm
	ea5M+fklrWknSIWPiFtSYLynbmiA7sMvodGlcrLj6ft5bmcIui9QD8PB0kX4mIpR4uddjtZFTZJ
	ZMr1VwRs1KqhlLw3AuK1dJlNaJLZSAE78cD34GC8CoJCdBCLKAULtkGUc5z41aIMAu6GrvdRzyp
	EKSfPDcHkH
X-Google-Smtp-Source: AGHT+IGcrCrJXSDCJ52GWHIcoSs84EXCVSHlle7sW9R8xXF63whSzOTgpRqLjQItDu+hh6TX/ctQTg==
X-Received: by 2002:a05:6000:4107:b0:429:c709:7b54 with SMTP id ffacd0b85a97d-42b2dc228c6mr8355969f8f.36.1762852450418;
        Tue, 11 Nov 2025 01:14:10 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675cd25sm27386995f8f.22.2025.11.11.01.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:14:10 -0800 (PST)
Message-ID: <03d6964f1b59d13db95ffe073480aabb53a1cfec.camel@gmail.com>
Subject: Re: [PATCH 015/292] ASoC: codecs: ad1836: convert to
 snd_soc_dapm_xxx()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	 <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Date: Tue, 11 Nov 2025 09:14:47 +0000
In-Reply-To: <87qzu58lrn.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
	 <87qzu58lrn.wl-kuninori.morimoto.gx@renesas.com>
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

> =C2=A0sound/soc/codecs/ad1836.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/codecs/ad1836.c b/sound/soc/codecs/ad1836.c
> index 949077108bef4..8afeadcaf8b09 100644
> --- a/sound/soc/codecs/ad1836.c
> +++ b/sound/soc/codecs/ad1836.c
> @@ -250,7 +250,7 @@ static int ad1836_resume(struct snd_soc_component *co=
mponent)
> =C2=A0static int ad1836_probe(struct snd_soc_component *component)
> =C2=A0{
> =C2=A0	struct ad1836_priv *ad1836 =3D snd_soc_component_get_drvdata(compo=
nent);
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	int num_dacs, num_adcs;
> =C2=A0	int ret =3D 0;
> =C2=A0	int i;
