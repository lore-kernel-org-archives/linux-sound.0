Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051391;
	b=1/FmKRB/VDlATPlAzcG7HuFjiNK5Tceu+CJmqvAJtZJWUHeZY9+o7Shwh98hF4zt81Bn
	 2C5qXe64pCl32KCEQB3eVLTmnAXa2UmrbKAhJ2rNgsSaHJL4yb9IHKgcY6GnkbvXN3iSV
	 dwulkLKiuEK9Q4AgmXHcosf2Du5MXWdbggKOEDePHkNOHdAMCMvQQjPzZlVlLwd6A6cpf
	 rtZpMMJTZGkf0SnxhHwhRKfDws0rpqPG/k/yzKJIgVQXJ1wV9WCPXPig/yvpWWzMmkmvr
	 W17qvW6y38FIKiNugmLAqftUinwTudyRZeSub9f22K09CGK+NrjPMyAaVlnZM0D+h9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051391;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4uLrLp0fki5ghus0ruvn5fMgdpiAK87HSNDgQ2Gt3rg=;
	b=Hp/p6n8EmP6klW6Cw4DYOuEJfbZPzWSzhqxD2ZizDNNmt8P8DcSAAusCtSFeSHNNE8MR
	 4hicqIQOnv6j/h3+V3xt/UdtLBQNzawbvbGWuTcy7oEkgj3Y5+5JM+OW7tHlK6aF1kvTN
	 g4dlUoOKJxMJsN7MAx3M0wrxww600/7kJtv3FsNx9bV7wrGoO3/pP/fmQHygUhhuVG5Xd
	 8PkK0P/2FoipB+CH3m0LNuO0DKdIZ44ONcFasnkrED/0FIapnrYG2PCSoHW9ZZZr7A/P2
	 PG9ekmAfab6UMJjv/V7hkhzuVPDcWH8u7qEA7t04beAQOjAFKjvcmDb2E1nadx8ppEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RUPsTjlj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CD0606A33B
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 01:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RUPsTjlj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B36F51F000C4;
	Thu, 19 Nov 2026 01:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795051390;
	bh=4uLrLp0fki5ghus0ruvn5fMgdpiAK87HSNDgQ2Gt3rg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RUPsTjljuiYFTRjou7UH9MXhfpl1iHgxWQcH9Zn9m6r4nwKm/Elg6NrZxnyJ2LAUr
	 LDgD+z0yGZnKDNpvxJzwRL173o8O+635/zN2vipljvqu6AAR/47xqyOsIf8m4kwD7w
	 83vk5R5bzT6OM2CYGJOZw2bEMGMMCSWsQ2S/izCrx9Y7j2qUpazZEvO/oZIVGruGKw
	 EK69WIx3oUC6w+hu0KiVMr7Bk/rmQafaxXAKDoo7MUCmERR+lyxj16XVSfNiRKmAh2
	 19uSCg7w/1LhHlR1q5ucvlOLiwbdtce3J8BAOjy+ry/W1F3plnJDFNF0HrxW61ZF7W
	 ddYkZPCS3cx0Q==
Message-ID: <sashiko-outbox-222281@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] ASoC: tas2781: add realtime speaker protection data
 control for TAS2573
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shenghao Ding" <shenghao-ding@ti.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261119011102.1790-1-shenghao-ding@ti.com>
References: <20261119011102.1790-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 01:23:10 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] ASoC: tas2781: buffer offset shift on error in
  tas2573_status_get_common()
- [Low] ASoC: tas2781: duplicate report logic in
  tas2573_calib_status_get()
- [Low] ASoC: tas2781: use devm_kzalloc_obj() in
  create_tas2573_rt_spk_data_ktrl()
--

commit ab506d198e775a76f5fde0b4b1d45d99fc376412
Author: Shenghao Ding <shenghao-ding@ti.com>

ASoC: tas2781: add realtime speaker protection data control for TAS2573

This commit introduces a common register-map report helper for TAS2573 and
extends the "Real-time Speaker Impedance" control into "Real-time Speaker
Protection Data" covering seven protection registers.

> diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2=
c.c
> index 984cb67476a53..e44a1d460c703 100644
> --- a/sound/soc/codecs/tas2781-i2c.c
> +++ b/sound/soc/codecs/tas2781-i2c.c
> @@ -1544,37 +1544,62 @@ static int create_tas2781_cali_start_ktrl(struct =
tasdevice_priv
>  	return 0;
>  }
> =20
> -static int tas2573_re_get(struct snd_kcontrol *kcontrol,
> -	struct snd_ctl_elem_value *ucontrol)
> +/*
> + * Common helper: shared by all controls that read a group of registers =
and
> + * pack the results into a report.
> + */
> +static int tas2573_status_get_common(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol, const struct tasdev_reg_map *map)
>  {
>  	struct snd_soc_component *comp =3D snd_kcontrol_chip(kcontrol);
>  	struct tasdevice_priv *priv =3D snd_soc_component_get_drvdata(comp);
>  	unsigned char *dst =3D ucontrol->value.bytes.data;
>  	struct soc_bytes_ext *bytes_ext =3D
> -		(struct soc_bytes_ext *) kcontrol->private_value;
> +		(struct soc_bytes_ext *)kcontrol->private_value;
> +	unsigned int j, k, val;
>  	unsigned int i =3D 0;
> -	unsigned int j;
>  	int rc;
> =20
> -	guard(mutex)(&priv->codec_lock);
> +	/* Report header: max size and 'r' marker */
>  	dst[i++] =3D bytes_ext->max;
>  	dst[i++] =3D 'r';
> =20
> -	dst[i++] =3D TASDEVICE_BOOK_ID(TAS2573_RE_OUT);
> -	dst[i++] =3D TASDEVICE_PAGE_ID(TAS2573_RE_OUT);
> -	dst[i++] =3D TASDEVICE_PAGE_REG(TAS2573_RE_OUT);
> -
> +	/* Emit book/page/reg triplets for every register in the map */
> +	for (j =3D 0; j < map->nregs; j++) {
> +		dst[i++] =3D TASDEVICE_BOOK_ID(map->regs[j]);
> +		dst[i++] =3D TASDEVICE_PAGE_ID(map->regs[j]);
> +		dst[i++] =3D TASDEVICE_PAGE_REG(map->regs[j]);
> +	}
>  	dst[i++] =3D 'D';
> =20
> +	guard(mutex)(&priv->codec_lock);
> +
> +	/*
> +	 * Read each channel: first register via single read, the rest
> +	 * via bulk read (4 bytes each).
> +	 */
>  	for (j =3D 0; j < priv->ndev; j++) {
>  		dst[i++] =3D j;
> +		dst[i++] =3D 0;
> +		dst[i++] =3D 0;
> +		dst[i++] =3D 0;
> =20
> -		rc =3D tasdevice_dev_bulk_read(priv, j, TAS2573_RE_OUT,
> -			&dst[i], 4);
> +		rc =3D tasdevice_dev_read(priv, j, map->regs[0], &val);
>  		if (rc < 0)
> -			dev_err(priv->dev, "chn %d bulk_rd err =3D %d\n", j, rc);
> +			dev_err(priv->dev,
> +				"chn %d %s[0] rd err =3D %d\n",
> +				j, map->tag, rc);
> +		else
> +			dst[i++] =3D val;
> =20
> -		i +=3D 4;
> +		for (k =3D 1; k < map->nregs; k++, i +=3D 4) {
> +			rc =3D tasdevice_dev_bulk_read(priv, j, map->regs[k],
> +						     &dst[i], 4);
> +			if (rc < 0)
> +				dev_err(priv->dev,
> +					"chn %d %s[%u] bulk_rd err =3D %d\n",
> +					j, map->tag, k, rc);
> +		}
>  	}
> =20
>  	return 0;

[Severity: Medium]
Does an error from tasdevice_dev_read() leave i misaligned by one byte in
dst[]?

Unlike the pre-patch tas2573_re_get() and the bulk-read loop below it, the
rc < 0 branch skips incrementing i for the fourth byte of map->regs[0], so
the remaining registers for channel j and all subsequent channels are
written shifted left by one byte in the fixed-layout report buffer.

[Severity: Low]
This isn't a bug, but tas2573_calib_status_get() right below
tas2573_status_get_common() still open-codes an identical copy of this
report-packing and register-reading loop over fct_status_regs[] instead of
using tas2573_status_get_common().

> @@ -1682,37 +1707,48 @@ static int create_tas2573_cali_status_ktrl(struct=
 tasdevice_priv
>  	return 0;
>  }
> =20
> -static int create_tas2573_cali_re_ktrl(struct tasdevice_priv
> +/* Realtime sp data control */
> +static int tas2573_rt_get(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	return tas2573_status_get_common(kcontrol, ucontrol,
> +					 &tas2573_rt_data_map);
> +}
> +
> +static int create_tas2573_rt_spk_data_ktrl(struct tasdevice_priv
>  	*priv, struct snd_kcontrol_new *cali_ctrl)
>  {
>  	struct soc_bytes_ext *ext_cali_start;
>  	char *cali_start_name;
> =20
> -	ext_cali_start =3D devm_kzalloc_obj(priv->dev, *ext_cali_start);
> +	ext_cali_start =3D devm_kzalloc(priv->dev,
> +		sizeof(*ext_cali_start), GFP_KERNEL);

[Severity: Low]
This reverts the devm_kzalloc_obj() conversion from 4dd10fbbeb9c
("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj()
family"), diverging from the neighboring kcontrol helpers in this file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119011102.1790=
-1-shenghao-ding@ti.com?part=3D1
