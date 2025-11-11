Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D541262FC7
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852439; cv=none; b=YYBL0jsrqtc2E8la4Qp+vTgTZfS+bfa2V4ZPKm/fRChjsMu2aHjmlEqU5bgxEyg1l4PE1VNSFRuhHMVM9+oxesWt5nYniQFI6n2soe4h7qPNmgZRvgyKzCwUFHJz4idRlz98wIYgD4MAJArvDfIaeUg0YOIrKl+FEmjHjvxAYPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852439; c=relaxed/simple;
	bh=BLM6WODL0WJZ0TjueJ0wPF6KFlAYA6zyNFy/zwnUUi8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TML7AKLEoLBz5um4umTwT2ZG5lpRBGkOZ5iKWiQPXY8zIkOZl3Q2HrpYe0FyRO6xP0lG2BPLPIX+8tO06PLpYcJZPvDm2H/Qa3tdKYAKu/opwT+oOo9QmaJj/hlhbfrc8/S+nmJb+dbYyCeN0D3MeYTSN01XXmAOKJLmdNvTbdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDus/RfE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDus/RfE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4710022571cso37791675e9.3
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 01:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762852436; x=1763457236; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hkfvgx8qTymADc3IqoDlxe/9TxVmhKUG4H3TkRz6ZmA=;
        b=bDus/RfE83Mi1ydUuQl+ul9gWTNTue1NJT58cEuGkzhiWO8m+dRceuueZc0itrQqhE
         c06v8PdFg38sXpcAinMuV10+HPucRPghWnyBCKpQjiKw+XkKNxJfLAEG7hMFor1egcHi
         HZFVq6yqgc0Bq/FLHW/jMHiTqhJ8139sI3YHkFUbSiDCl4H1mqpJW7iXi3XRPmRFQ/6x
         pbq5/NJopmHoA651NT5NEPrv8l+CPhZtmT0HZNtBm8D0cInnnPZA9ivYCzNWJ37/lujw
         isPs4oDkt8Krmp5/SrkzLkXyD4h7jbMD9/48T3GDWqi3UzPQp50m0dzYlGObzDNHvI3z
         2Cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852436; x=1763457236;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkfvgx8qTymADc3IqoDlxe/9TxVmhKUG4H3TkRz6ZmA=;
        b=ZYSNOv1vqj8n3pZIkvqRPRaYxcYGCpKRq5Tri/QRW9cW0ftwfTv0ONb349mv6fiYgQ
         FSsjRpo2iu5CDCbBO62YxyyJZtI3lLG6U5UeJwkILLmXEbgnr0ohr4IQp2qvaDve0EzJ
         5ELb8+jVlEef31W1qF9wzEgpUP8mjKHxP0nz699hBG/c9sXeOOyd8wyYYmYrErOS/Rgi
         NlOPuc0LSIgTPFJocMaJXGFAThDyqZCLr9+aI6URjJm8+/pPScx6zTZwLnoi1w3nZPgI
         a9r3FSN36HBDhorfdv5P8rmRjLMBh730buWvspE14VyeCGnmEPhDM50x9ocawAzmenms
         unSA==
X-Gm-Message-State: AOJu0Yzvz7oM1T6bYbaJdHXzwzjtGdmaWRLXjwV8zI3Zq9cHApOevGCO
	nB+7YxiOcStdyLtMZMwdCCTtV3tGt4yNullQGpt54rLkYhcD21B9ld35HFPjI04U
X-Gm-Gg: ASbGncuWJ6Zokwe25UscREDJ7w0gH1Bms6cY4NRHD0+4FgvEAaOBGsvIxd5QA5CREQm
	qhfcqjkkso6ByK4gtgBoH8F+jOH7lCjczc9hevtOZbIrN0n7ZXXwHjonEr8BBXfcjYN7NDAiyeT
	h5atWYWZ1NitRV1v8C+gQQlzQ65n+THhQC8ges0QdwtxGqka33PqZSXpPD9iHp4/nzT731zNmBi
	dZYOTpVGjnYQG6xdlY6XNFpqCq87GPGXK+tgLGHw51aittDY9xzsjdrfQKG5sYP6AjIfYhEpvVr
	grY5dnNGqLI60wKdmwPpiqxhzTTP77eokmvQW+AKwCLqhYNNlAU99jB29EftSQYiFKXO3cqVkj7
	E+lIO+yQxYufu8eTp2m2JhTCZ53pAKI42oQBVAPCqi0cIfx/Rq8WeBljJB26mx3CaPLZT5jEjay
	kt/yuBJ16vURLGP9vrVfI=
X-Google-Smtp-Source: AGHT+IEp93yKp0gUonvU+8ZQCWEAf48ZNH5fXjGKynZuDXFDschXYE3YRltdXuTBzRoH4/nVlVvdqQ==
X-Received: by 2002:a05:600c:548a:b0:46e:45d3:82fd with SMTP id 5b1f17b1804b1-4777327e8c5mr109405935e9.31.1762852435925;
        Tue, 11 Nov 2025 01:13:55 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcdd91esm253099835e9.8.2025.11.11.01.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:13:55 -0800 (PST)
Message-ID: <663df201db296ca9f244fc422f6301190261063f.camel@gmail.com>
Subject: Re: [PATCH 016/292] ASoC: codecs: ad193x: convert to
 snd_soc_dapm_xxx()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	 <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Date: Tue, 11 Nov 2025 09:14:32 +0000
In-Reply-To: <87pl9p8lrk.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
	 <87pl9p8lrk.wl-kuninori.morimoto.gx@renesas.com>
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

> =C2=A0sound/soc/codecs/ad193x.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
> index 1d3c4d94b4ae9..b93531c3a9a40 100644
> --- a/sound/soc/codecs/ad193x.c
> +++ b/sound/soc/codecs/ad193x.c
> @@ -282,7 +282,7 @@ static int ad193x_set_dai_sysclk(struct snd_soc_dai *=
codec_dai,
> =C2=A0		int clk_id, unsigned int freq, int dir)
> =C2=A0{
> =C2=A0	struct snd_soc_component *component =3D codec_dai->component;
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	struct ad193x_priv *ad193x =3D snd_soc_component_get_drvdata(compo=
nent);
> =C2=A0
> =C2=A0	if (clk_id =3D=3D AD193X_SYSCLK_MCLK) {
> @@ -476,7 +476,7 @@ static void ad193x_reg_default_init(struct ad193x_pri=
v *ad193x)
> =C2=A0static int ad193x_component_probe(struct snd_soc_component *compone=
nt)
> =C2=A0{
> =C2=A0	struct ad193x_priv *ad193x =3D snd_soc_component_get_drvdata(compo=
nent);
> -	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(compon=
ent);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	int num, ret;
> =C2=A0
> =C2=A0	/* default setting for ad193x */
