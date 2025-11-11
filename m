Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD94B2F12BB
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852509; cv=none; b=CPMA46gCBF2eAAwQJ9Bsseve00EkA4uAE8Zy1NzmuxpFUIKWYebKWdB4M/mv3XKQNLXZ4zHgjmasQZw61Rbx9jMMcanh5qK8mXj+m9DtJxhUyMT/jdl7mll2otuGVV2It2W1h4TjA3rt29sgFVgZhe5KTRq6Obo54PFgsBpr4KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852509; c=relaxed/simple;
	bh=dPrrrQYTKzZLC9caMb7kwRpwWJYFqNtSax5Ba96u8xE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W4h3dl6sElNvmzloSZc2cWDoQ93K0mE1bMboSJf4wbLvf3hdrSkMrI5fU8Gy1yoBgQTlpVyfpcKStL0qwCYjTFBz9O10ez/vKyQEZw0rkbhpqQrsywwtKrpc9YhV+2WNg+3TjSBQaWP7iaBLOkhm8MQ6IWPw8U90Pj5zb2NcFrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXrBuwsi; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXrBuwsi"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3720e58eso1997579f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 01:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762852506; x=1763457306; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OQT+2FeSgXmCjbb5wL0ovnO5D8B4DY8Tp7V+oWLWO8s=;
        b=cXrBuwsiEhwUOzpUfOYBf8MUKOGdE9sfCnk3VZ2qZDrJuEg4syRKR9VizE8ARGpiMH
         VRFXVIwLvjOpwhaRQYmCEa36hh+9KcFspYb1+iiKA2kVvTvSA7+FJNXZSHBTmI3FV+JB
         Z6o1le3e5zrjl+8vr9Qno5MpBoZPq0RoXcBVWMphDCq971vgomNOufdMafrwwXtQSt2w
         Y9nwnWil7/g8yDSHHMdgEWUvQefaFz0x5qxz0/ofOKO9zbfke8wH4TfsW28M1F7ktbTQ
         wg70sXt+TaHG4TNsorAIJTitL10MnQiPxbHk7SP5GfTbFcb/oYO6yZTZTy9SJwbfvcnN
         NrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852506; x=1763457306;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQT+2FeSgXmCjbb5wL0ovnO5D8B4DY8Tp7V+oWLWO8s=;
        b=KLyPGFFZoZYIjD4jJ4az/O0Wr9ghlGlPgs+68UHyWPj0Qo4/cvv+D4z06u0kVj5fRd
         Cpfm0oJ77j8FdMQxdJIEBcQFPOFjPZ4MiTsTaZS3m2lhXjxyZQqKrS7R+KiyfbGGNEsY
         N2gNW9RnD/XozjMQrFZbB+5PiwV+a8/gKtA6jynTBQQQ8eNoF6WdG4tB30v71Xpry6ar
         lguQNZfmx+GFE+/amA+nep3LuIs606ZEc4cWZb7Vp+owuTFAu1GlGW2Fy+ZhKq77fmVn
         MTAINy1XszsOc6aTBFaclISnru6bFubYLJvWtaj8RydGcFCVlkaVkXTDEzm6pp9FucoS
         8Plw==
X-Gm-Message-State: AOJu0Yw4mWt6PTj5gpdzQPi4PVr58iDqLCwXZioY/+3oCJzYkMxbc6No
	FFeBPU7Ccq9ThqOUTFfTfV/hKyQqUhN1n66AdkcU2qeGUfYkH17EqtpWZccS6nR9
X-Gm-Gg: ASbGncvhqLg10PLdf+2VIYepap3dNfJCVmgUPeOmIxLpr/nKoIZweRLHq9HpX2qqjEG
	UINIaHtoQe/7EXpkghEG0KW0KWYK/MIKBMT8nxYYnA+7uBkyghoKUVjgoD1Vo5obFftMyCCWDJa
	robvxw0XoZjnq4jAC7IR/8rX8+qncJdSDOGjNgoUX8sNZvGWcSmRYE7f6p4xEeC+onqOVwcMEXr
	hu/4+85t4NrSROnDEUj5b0QuB6G6BeEduSRjhD2oulGxpPHkCEexkQbVcm3cXG53ikMaPzS4k0E
	aq0+NWz8x9DzoR+6p00Yyf/KoVYNKIGhLyYhk4jtRFEpqzeihDDOe42+ZA9J/CCQCibXIgSQbGt
	uqSEVMyqfDWWwqTs8+a9Rgp4KY0H37Ekx+v29Zx1lNFRa1y3nifA6Bl6xiH9WDHz7GPEMRyqUvT
	hnabxt2NzS
X-Google-Smtp-Source: AGHT+IHFbqX5FAgeUBdbm6+0MLFQ8daoHPl0eMu2OzMO6f9NOPiwdhfekxNdxtTc9DVj4AQRU1noJA==
X-Received: by 2002:a05:6000:2187:b0:42b:394a:9e0 with SMTP id ffacd0b85a97d-42b394a0bddmr6041913f8f.32.1762852505592;
        Tue, 11 Nov 2025 01:15:05 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63df69sm26998951f8f.13.2025.11.11.01.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:15:05 -0800 (PST)
Message-ID: <b15e7a4ee1752253b7e2f93c174cfaac9129b606.camel@gmail.com>
Subject: Re: [PATCH 022/292] ASoC: codecs: adav80x: convert to
 snd_soc_dapm_xxx()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	 <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Date: Tue, 11 Nov 2025 09:15:42 +0000
In-Reply-To: <87h5v18lqx.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
	 <87h5v18lqx.wl-kuninori.morimoto.gx@renesas.com>
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

> =C2=A0sound/soc/codecs/adav80x.c | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
> index c9c41496c17dd..8a89187f9c782 100644
> --- a/sound/soc/codecs/adav80x.c
> +++ b/sound/soc/codecs/adav80x.c
> @@ -539,7 +539,7 @@ static int adav80x_set_sysclk(struct snd_soc_componen=
t *component,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int freq, int dir)
> =C2=A0{
> =C2=A0	struct adav80x *adav80x =3D snd_soc_component_get_drvdata(componen=
t);
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0
> =C2=A0	if (dir =3D=3D SND_SOC_CLOCK_IN) {
> =C2=A0		switch (clk_id) {
> @@ -622,7 +622,7 @@ static int adav80x_set_sysclk(struct snd_soc_componen=
t *component,
> =C2=A0static int adav80x_set_pll(struct snd_soc_component *component, int=
 pll_id,
> =C2=A0		int source, unsigned int freq_in, unsigned int freq_out)
> =C2=A0{
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	struct adav80x *adav80x =3D snd_soc_component_get_drvdata(componen=
t);
> =C2=A0	unsigned int pll_ctrl1 =3D 0;
> =C2=A0	unsigned int pll_ctrl2 =3D 0;
> @@ -802,7 +802,7 @@ static struct snd_soc_dai_driver adav80x_dais[] =3D {
> =C2=A0
> =C2=A0static int adav80x_probe(struct snd_soc_component *component)
> =C2=A0{
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	struct adav80x *adav80x =3D snd_soc_component_get_drvdata(componen=
t);
> =C2=A0
> =C2=A0	/* Force PLLs on for SYSCLK output */
