Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754321;
	b=nWHdQaVInL7Bl3wb5LPcZjp/e8ALULfINxdUM0gkyGsZZrHcsKR2Yxnwo1cINcF0LNpL
	 wY57V9OpmU365YeTphjEhfE2hs/7VUXejU6p482QXbc6SQj2z2vHMWmWOkYVOtz6nGi3k
	 X27ocagCQV+YkB6kzc2oW9r2Nf8jSGL6QVqSeMSc60D78Yi10Gg7NAk4jM5QS1QMuErVj
	 xRzF0ZSHDoZh+FopP83eOKrGSxvURnsE6TQqGzWG0gG6v6zavVD/KjIu2d95ojBOQ7W2i
	 D2Pyf+u3n3oMvoo6j3Mf3qJ0ZNXqEPZgHrNSkJMm/cCoGvwMm2+2CCYZvRrD60X8hIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754321;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=N6f0q/m2/lfkqNbYCfejkr2mFILT4Qpq3j3uquKUdkk=;
	b=tt2P4268OIpxZFk23QprGuU/zENca2CVAJLiVHvgkNrXUPVUiEyNlV1kmpTwVftGb+/C
	 W1M3HtcnRObFQpZs1pkTKIfNC3K99ejVNrbw0DQXlPrykqTcOiXzkDxSenyw4A1dC0bNR
	 0zkunN6mWj2fxApj0Rzc+g8R0JAYjEHVY1d6lIoepwkm/Y6Cmnko+RYUQu0QxNopleZTp
	 kisvXTlXsBOQ5/FpyXkKz9VehKL53rjIKxmySAgNjyyhFJerFvXz6Im7CLuHWatXUeU5U
	 HBugwcedAVGwCn/tYS+7EhHjyj4NCG+hj+uInTsjGY+yJLdQRcTSSZzaUDjwW8UD6vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NI+N7s+C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE466606A31E
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 04:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NI+N7s+C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435EB1F0092F;
	Fri, 27 Nov 2026 04:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795754320;
	bh=N6f0q/m2/lfkqNbYCfejkr2mFILT4Qpq3j3uquKUdkk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NI+N7s+CRdZIpI7YVaDWE8pVEWMeaoUbCoOZY6apQE6EFpN27rrt5PTTgVHfcGtMh
	 3N0qrY0+m3yPOzGsedZg6dYooFaPh5xUz2PlObVuyhB7SjwY2mp23TXI8LzPdWEAhq
	 oNYLgvnXqa+PZE7pkoDVdDyCYTUEWGqrcmeIppvqVvBUnXFSRS86Iu1YJWW+cupPgX
	 6S8zmckdMomP4VY5io1F7f2F0lSbmqHw4cxJMcL3TG6jqneIXh3ZcDbdgt5/88sqlg
	 3zxwEEceIaXjnSJ+Xc5lh+aOUW5fGliIknbzkUr8Yz6xsIacFscq7AMUOtWpJANix9
	 0VI+/LPrKvlNg==
Message-ID: <sashiko-outbox-236601@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] ASoC: tas2781: read TAS2573 status registers by
 entry length
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shenghao Ding" <shenghao-ding@ti.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261127042856.1672-1-shenghao-ding@ti.com>
References: <20261127042856.1672-1-shenghao-ding@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 04:38:39 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ASoC: tas2781: TAS2573_FCT_INT_LATCH uses 4-byte entry in
  fct_status_regs
- [Medium] ASoC: tas2781: wrong 1-byte value offset in
  tas2573_status_get_common()
--

commit 01ec8dd477ee424fc19c367d085a8a14cf238238
Author: Shenghao Ding <shenghao-ding@ti.com>

ASoC: tas2781: read TAS2573 status registers by entry length

This commit replaces the TAS2573 status register address arrays with
struct tasdev_reg_entry descriptors that carry an explicit val_len field,
and updates tas2573_status_get_common() to choose single-byte or 4-byte
bulk reads per entry.

> diff --git a/include/sound/tas2573-reg.h b/include/sound/tas2573-reg.h
> index 6f8411c695ebc..b23d14b933198 100644
> --- a/include/sound/tas2573-reg.h
> +++ b/include/sound/tas2573-reg.h
> @@ -14,16 +14,25 @@
>  #ifndef __TAS2573_REG_H__
>  #define __TAS2573_REG_H__
> =20
> +/* Descriptor of a single register field: address plus value length. */
> +struct tasdev_reg_entry {
> +	const unsigned int reg;
> +	const unsigned char val_len;
> +};
> +
>  /*
> - * Register map descriptor: binds the register table, its length, and th=
e log
> - * tag together into a single argument.
> + * A named group of register fields accessed together. Each entry occupi=
es
> + * a fixed 4-byte slot in the userspace report, regardless of val_len.
>   */
> -struct tasdev_reg_map {
> -	const unsigned int *regs;
> -	unsigned int nregs;
> +struct tasdev_reg_table {
> +	const struct tasdev_reg_entry *entries;
> +	unsigned int nentries;
>  	const char *tag;
>  };
> =20
> +#define TASDEV_REG_ENTRY(regid)		{ .reg =3D (regid), .val_len =3D 4 }
> +#define TASDEV_REG_ENTRY_B1(regid)	{ .reg =3D (regid), .val_len =3D 1 }
> +
>  #define TAS2573_TDM_DET_REG		TASDEVICE_REG(0x00, 0x00, 0x14)
>  #define TAS2573_FCT_INT_LATCH		TASDEVICE_REG(0x00, 0x00, 0x67)
>  /* YM57 */
> @@ -59,41 +68,42 @@ struct tasdev_reg_map {
>  /* YM955 */
>  #define TAS2573_SHORTCKT		TASDEVICE_REG(0x00, 0x83, 0x6C)
> =20
> -/* Registers for the speaker calibration */
> -static const __maybe_unused unsigned int fct_status_regs[] =3D {
> -	TAS2573_FCT_INT_LATCH,
> -	TAS2573_FCT_STATUS_CTRL,
> -	TAS2573_FCT_STATUS_BINNING,
> -	TAS2573_SILENCE_DETECTED,
> -	TAS2573_OPEN_CIRCUIT,
> -	TAS2573_SHORTCKT,
> -	TAS2573_FCT_OUTPUT_R0,
> -	TAS2573_FCT_OUTPUT_R0_LOW,
> -	TAS2573_FCT_OUTPUT_INV_R0,
> -	TAS2573_FCT_OUTPUT_POWERTOT,
> -	TAS2573_FCT_OUTPUT_F0,
> -	TAS2573_RE_OUT,
> +/* Register Array for the speaker calibration */
> +static const __maybe_unused struct tasdev_reg_entry fct_status_regs[] =
=3D {
> +	TASDEV_REG_ENTRY(TAS2573_FCT_INT_LATCH),

[Severity: Medium]
Should TAS2573_FCT_INT_LATCH use TASDEV_REG_ENTRY_B1() here?

Before this patch, tas2573_status_get_common() read fct_status_regs[0] as
a 1-byte register via tasdevice_dev_read().  With TASDEV_REG_ENTRY(),
val_len is 4, so reading the "Calibration Status" control will perform a
4-byte bulk read starting at Book 0, Page 0, Register 0x67 and include
three adjacent Page 0 registers in the slot.

[ ... ]

> diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2=
c.c
> index 2dbbd13f5e814..f59be9d7ac313 100644
> --- a/sound/soc/codecs/tas2781-i2c.c
> +++ b/sound/soc/codecs/tas2781-i2c.c
> @@ -1565,40 +1566,45 @@ static int tas2573_status_get_common(struct snd_k=
control *kcontrol,

[ ... ]

>  	for (j =3D 0; j < priv->ndev; j++) {
>  		dst[i++] =3D j;
> -		dst[i++] =3D 0;
> -		dst[i++] =3D 0;
> -		dst[i++] =3D 0;
> -
> -		rc =3D tasdevice_dev_read(priv, j, map->regs[0], &val);
> -		if (rc < 0)
> -			dev_err(priv->dev,
> -				"chn %d %s[0] rd err =3D %d\n",
> -				j, map->tag, rc);
> -		else
> -			dst[i++] =3D val;
> -
> -		for (k =3D 1; k < map->nregs; k++, i +=3D 4) {
> -			rc =3D tasdevice_dev_bulk_read(priv, j, map->regs[k],
> -						     &dst[i], 4);
> -			if (rc < 0)
> -				dev_err(priv->dev,
> -					"chn %d %s[%u] bulk_rd err =3D %d\n",
> -					j, map->tag, k, rc);
> +		for (k =3D 0; k < map->nentries; k++, i +=3D 4) {
> +			dst[i] =3D 0;
> +			dst[i + 1] =3D 0;
> +			dst[i + 2] =3D 0;
> +			dst[i + 3] =3D 0;
> +
> +			if (map->entries[k].val_len =3D=3D 4) {
> +				rc =3D tasdevice_dev_bulk_read(priv, j,
> +					map->entries[k].reg,  &dst[i], 4);
> +				if (rc < 0)
> +					dev_err(priv->dev,
> +						"chn %d %s[%u] bulk_read err =3D %d\n",
> +						j, map->tag, k, rc);
> +			} else {
> +				rc =3D tasdevice_dev_read(priv, j,
> +					map->entries[k].reg, &val);
> +				if (!rc)
> +					dst[i] =3D val;

[Severity: Medium]
Does writing dst[i] =3D val place 1-byte register values at the wrong
offset in the 4-byte slot?

Previously, i was incremented three times while zeroing the leading bytes
before writing dst[i++] =3D val, placing the byte at offset +3 ({0, 0, 0,
val}).  Since i is now advanced by 4 in the loop header, dst[i] =3D val
stores the value at offset +0 ({val, 0, 0, 0}) instead of dst[i + 3],
changing the report layout seen by userspace.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127042856.1672=
-1-shenghao-ding@ti.com?part=3D1
