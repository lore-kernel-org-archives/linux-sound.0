Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B2A40DFD5
	for <linux-sound@vger.kernel.org>; Thu, 12 Mar 2026 13:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773323725; cv=none; b=fwSKu7lNEg6IJI9kia3hzg5bJbkIQgrCOfANMkKJwjWSDGoajai2k30/jZXefnNOcmiHxOfXqKrr8ypV+taM6EpQ9QohxrY3W90y79BBUNcTEnWRdKzasdfaSNmZABTD9Xae1BrNlKhV0Jk3uhPACWea8nDKwnD/Q598QSayzTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773323725; c=relaxed/simple;
	bh=X0hulSLDBK/Z8MqdxjpGmmKdK13rSme4U6aRgv4Qgz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmVtBZd+c6sN/F++XQ5n4Tv0Fo9s+Vcy8XG+qztixB2+bUuMaMxzx2OAfZPw0sroOus9F/aRW3tbuMNAlHnmGW4UKTmRJGcS7PJfKJNvvQT0y7p/CxG7d+UgNhQHZ5KnAu8cxv75fGj/pX439cIIvocqJ5anCrQzpHe6EbngGsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vBr9DUTn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vBr9DUTn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A182C4CEF7;
	Thu, 12 Mar 2026 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773323724;
	bh=X0hulSLDBK/Z8MqdxjpGmmKdK13rSme4U6aRgv4Qgz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vBr9DUTnR6vCkR4fzXQxXAYfluBxqi1mB7ROt+wxGRs2x6OTED4mNGOqohRw7fkd7
	 enF+9j74MmwPsOlKKGkfUEH2uSZfqzSaZPasmhia1khim7DNZWATI3c70cZDVw+Amn
	 jQWfV/5hvZh/ZUUDSkKpljpQR9Tp9PEwfXwIeW9aoOZF29EBNGm+thxLr0t29CuBF3
	 sEDqNZh4ABJUwwiO8XYy9OJEAW4gTHc7IPbebFGSQ7mQnfj7Ebw4Ix78q9b1qghzm1
	 NZhsoGvzpVYaegjRZA/Qg7XkhkM/G/XOPeaTGFZtr6fc8bdbvU514RG47Kxd7zerTE
	 eJr9/w6CIY2Ww==
Date: Thu, 12 Mar 2026 13:55:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: Re: [PATCH v2 4/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <73f1acf1-d628-44cf-8487-df3ae73ed147@sirena.org.uk>
References: <20260226073534.3347-1-zhangyi@everest-semi.com>
 <20260226073534.3347-5-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J/2odiUieNnUk1Rk"
Content-Disposition: inline
In-Reply-To: <20260226073534.3347-5-zhangyi@everest-semi.com>
X-Cookie: I feel better about world problems now!


--J/2odiUieNnUk1Rk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 26, 2026 at 03:35:32PM +0800, Zhang Yi wrote:

> +static int es9356_sdca_set_gain_get(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{

> +	ret = pm_runtime_get_sync(&es9356->slave->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		dev_info(&es9356->slave->dev, "%s:Failed to enable clock : %d\n", __func__, ret);
> +		return ret;
> +	}

pm_runtime_get_sync() very helpfully leaves the usage count for the
device incremented even on error so this leaks :/

> +static int es9356_sdca_set_volume_put(struct snd_kcontrol *kcontrol,
> +		struct snd_ctl_elem_value *ucontrol)
> +{

> +	SOC_SINGLE_EXT_TLV("FU11 Capture Gain",
> +		SDW_SDCA_CTL(FUNC_NUM_MIC, ES9356_SDCA_ENT_FU11,
> +			ES9356_SDCA_CTL_FU_CH_GAIN, 0), 0, 0x03, 0,
> +		es9356_sdca_set_gain_get, es9356_sdca_set_gain_put, dmic_gain_tlv),

This should be a Volume control too.

> +static void es9356_button_detect_handler(struct work_struct *work)
> +{
> +	struct es9356_sdw_priv *es9356 =
> +		container_of(work, struct es9356_sdw_priv, button_detect_work.work);
> +	unsigned int reg, offset;
> +	int ret, idx, btn_type = 0;
> +	unsigned int button[3];
> +
> +	regmap_read(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_DETECTED_MODE, 0), &reg);
> +
> +	if (ret < 0)
> +		goto io_error;

ret is an uninitialised value here, you need to assign the return value
of regmap_read().

> +	snd_soc_jack_report(es9356->hs_jack, btn_type,
> +			SND_JACK_HEADSET |
> +			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
> +			SND_JACK_BTN_4 | SND_JACK_BTN_5);

This reports SND_JACK_HEADSET but we didn't actually look at the headset
state in this function AFAICT, only the btn_type (and that'll be 0
when reporting a button release), so we'll misreport the headset state.

> +static const struct regmap_config es9356_sdca_regmap = {
> +	.reg_bits = 32,
> +	.val_bits = 8,
> +	.volatile_reg = es9356_sdca_volatile_register,
> +	.max_register = 0x45ffffff,
> +	.cache_type = REGCACHE_RBTREE,
> +	.use_single_read = true,
> +	.use_single_write = true,
> +};

You should use REGCACHE_MAPLE unless you've got a specific reason to use
something else.

> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL_MBQ(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_L), 0x00);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_L), 0x00);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL_MBQ(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0x00);
> +	regmap_write(es9356->regmap,
> +		SDW_SDCA_CTL(FUNC_NUM_AMP, ES9356_SDCA_ENT_FU21, ES9356_SDCA_CTL_FU_VOLUME, CH_R), 0x00);

You should generally leave user visible controls like volumes at the
chip default.

--J/2odiUieNnUk1Rk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmyxccACgkQJNaLcl1U
h9DwVwf8COZuga9LaSlApJ4NcNzDK9e6c9wKstNt1l6H18pOd2u141PgbfeKyAbt
QG6Haz6WiePCMLkh24kiAxDrvvIFuLatvhXn4bqz4nvPzGYRj1RAar17VAzNkDlQ
D18wTxsfZiteGv8K1gNadyVT1XcaZOc+Zr+2ULYBarTi/O+IgJMobNK4VgC5RkE3
YsQQwg2Tm3vHptSp1LS79u+ZMI6YWVi3W8gHlCcgHvAeCDTCpn72PwGF4Uooh3bG
5dGEPD4P+zAaDWalX/O9qopKQRgR8oSC0JTe5tMETJTBGlQ43F/z4WUPEhiAleMC
pi2XSshMcKqXcOlg5LiRV34L+j4wow==
=sBi6
-----END PGP SIGNATURE-----

--J/2odiUieNnUk1Rk--
