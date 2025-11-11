Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9C12F658F
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 09:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852291; cv=none; b=K91O1f9N0rUBNNVGhkAgnHYkvONVZi2lzBYHKvtAOCwaTNc2ypq/7/sTxr+lZFKrpwKgPPk+Z8GWonk7Re7L19+VEgYUGvNqLM1OdvVxdqZUAkxGHU7py2MkmQGm9aaYsOTmGDQp39AXRAOFPqKDnEd6AERn8G3XzU4wDVL9v0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852291; c=relaxed/simple;
	bh=HJp18mybMQVEdjMOspUNK8nwt2+5ltU5dsvjcBi8YeY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TClMKtQd35z2BhxqAliNID06bVDguF+71KJVT+D+WfGhzakF/WDw1gx6iljHgiE+56c5w+/D4ifwMLJRJBYOyxtOWUiCudVozrBoCbnq+kl09L9L3WC8scLurfOv27VZ3GNQnJnk3h79PEIlgHsykS3u6J56Lz5tGS1gkR9wQg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PceS8xu7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PceS8xu7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47117f92e32so34366805e9.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 01:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762852288; x=1763457088; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gspS7bVGtmy0QmeilOZbymNkT3AIZdK8Re80Gv4yYws=;
        b=PceS8xu7VZ0shcod8SIdtqXUt5v+Xlz8c/MNhRjq4zfV6YJYbJAOY15e7OVDM31iYC
         qszRkOjGQ7dEWCGP/jh9JPYmNTiMzYTltMvMFefjAmwfhA9D47jeR2d2IA3nuF0vHYmv
         Q8st+6s5nPlySJhQgs8POQQWC1v61CRPZJwFHxis/1QpvGM2kzyl1ptM70K7r+1DP2Ru
         Jh29f557ABHjFnD0WuWyH27K0Eiv1YVSMfze0u6x/bIhdrYei983/uLS3w0lqHdYtFJK
         vwLsvQtzPbZIwPJyQn/lvQ0qFLSeNd095ZjzDxExRFaYyAQMs7nkD2ujtafTgg6EHD5v
         /YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852288; x=1763457088;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gspS7bVGtmy0QmeilOZbymNkT3AIZdK8Re80Gv4yYws=;
        b=PTM+NgKuhOMNs/are1UqVN4N7IJAzxxn+naCIt0WKEhGsmbpuzxx1Bg8UBiNTLRbBR
         rEVGu9fMrbE8dL7UPAtY8etn0BhpeD5e9mMfpD20uygrJuhdYGNXyTcZs9ZweX9XjUBk
         B1HRoI7v9/jWivTvmZ3yX50WISKC6Ejdsh6fubjJVUUMskn083yLtOzldXQ/GLftGqaX
         XuTIrPMWHE4poTD6sIur0GbovHyCB36E7zCHdB1op11xMgklqIEg3Zs7Ob7W4gb0C1Oq
         r6pwrSlHvFQr1dwL8d35QpbftuDAhvM0+Tdecy/f50mdaIX1qurxnF5eOGj+0s5OgNZW
         yuYw==
X-Gm-Message-State: AOJu0Yyl96nz4OE3wQQxOxJlAULokMeQMfpJ0/1PtwhWMS84EYfSf73u
	TZFUdViyp71BsCO+KkjMEsCvDtaI2GUlPACB9OWC8v5ptNLMK7k77C5k
X-Gm-Gg: ASbGncsHk6xLU3eD5lL8OTlj3bHQSMtW0dcnTZotGcIvUtoL1hNg3wKSOvW9T126xkz
	rhGzp9YXlnrdCv4dJMrdQ8RC664Hs4Qn42pxhOTReeqbEDrW6NMKWNs19/3rH9ZGWHSOKsXD+Ua
	YkPjwbEOoBoo/3mq2FnevoXT+25PCl8W0vEbVLMANp+PXllJM1ngGGgxh3OVjpstg18HC6gZFaI
	+U93DZfQouYXWrALKDCzQqB+vDN6TmCED3u1pKTDFwp1KWe98rk084YNXt7EhzZ1ultHtkSV++Z
	YNie4HT9g26vS8eGGNyf4Ec4Br3YuyvcCodyFy3VnHtkXrubuIuQ/O6vjzXkrsFIML3EFbdAoBk
	oFjc0/0d3oNzH+Gp5j5W66GGK4Drja/WuaQ5zbyLjGSQ1fwlQDQTItNvW+ZLo1aTRoUMUuMrE3C
	ViU1dlMEFC8rJ47u45z9E=
X-Google-Smtp-Source: AGHT+IHnmnZ0pbr43+eyRyGQgnKBUk8cq3XkvKnnQJuWA8AFE4oJYpOidKWreeeIphouiqFBZQXsug==
X-Received: by 2002:a05:600c:c4ac:b0:477:55de:8b22 with SMTP id 5b1f17b1804b1-4777325abafmr65810965e9.16.1762852287696;
        Tue, 11 Nov 2025 01:11:27 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdcc528sm371879575e9.7.2025.11.11.01.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:11:27 -0800 (PST)
Message-ID: <ba899a780bfd7cc9beb7a8287c6ef4451b1f1a81.camel@gmail.com>
Subject: Re: [PATCH 021/292] ASoC: codecs: adau7118: convert to
 snd_soc_dapm_xxx()
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	 <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Date: Tue, 11 Nov 2025 09:12:04 +0000
In-Reply-To: <87ikfh8lr2.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
	 <87ikfh8lr2.wl-kuninori.morimoto.gx@renesas.com>
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

> =C2=A0sound/soc/codecs/adau7118.c | 7 +++----
> =C2=A01 file changed, 3 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/codecs/adau7118.c b/sound/soc/codecs/adau7118.c
> index 14259807c8725..5ddea63a6612c 100644
> --- a/sound/soc/codecs/adau7118.c
> +++ b/sound/soc/codecs/adau7118.c
> @@ -335,6 +335,7 @@ static int adau7118_set_bias_level(struct snd_soc_com=
ponent *component,
> =C2=A0				=C2=A0=C2=A0 enum snd_soc_bias_level level)
> =C2=A0{
> =C2=A0	struct adau7118_data *st =3D snd_soc_component_get_drvdata(compone=
nt);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	dev_dbg(st->dev, "Set bias level %d\n", level);
> @@ -345,8 +346,7 @@ static int adau7118_set_bias_level(struct snd_soc_com=
ponent *component,
> =C2=A0		break;
> =C2=A0
> =C2=A0	case SND_SOC_BIAS_STANDBY:
> -		if (snd_soc_component_get_bias_level(component) =3D=3D
> -							SND_SOC_BIAS_OFF) {
> +		if (snd_soc_dapm_get_bias_level(dapm) =3D=3D SND_SOC_BIAS_OFF) {
> =C2=A0			/* power on */
> =C2=A0			ret =3D regulator_enable(st->iovdd);
> =C2=A0			if (ret)
> @@ -393,8 +393,7 @@ static int adau7118_set_bias_level(struct snd_soc_com=
ponent *component,
> =C2=A0static int adau7118_component_probe(struct snd_soc_component *compo=
nent)
> =C2=A0{
> =C2=A0	struct adau7118_data *st =3D snd_soc_component_get_drvdata(compone=
nt);
> -	struct snd_soc_dapm_context *dapm =3D
> -					snd_soc_component_get_dapm(component);
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_to_dapm(compone=
nt);
> =C2=A0	int ret =3D 0;
> =C2=A0
> =C2=A0	if (st->hw_mode) {
