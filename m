Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B6626FD97
	for <linux-sound@vger.kernel.org>; Mon, 20 Apr 2026 13:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693296; cv=none; b=Upx+vE/vI/0d0VhPnYLiHBsUpy1rOoyesF9Pm3v/3/mF2J1rz9RFavmymh5TmT4z6m1KCCLKJAjwXJOtu9ta/HBQRWL4jPKEXUwohJf3oEnT/WHKRpCcll5Ym2sqsCZUfGYBiFGIcmoLipM4SZJUxq2JFZgbuTVE025CX6uT2UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693296; c=relaxed/simple;
	bh=NJTAykTw4+1S123nPNn4vupaPIlfVHsCjB+fIKMfz3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iqad5dd+99J24rkUb0mC04RaugsJdBSJKgcIWjXVQlYAaH4Bs9/mjF4ZbcJr9+nIaNlS+/ZUqw7l6XTwGhRQ+zTbsGpmkfmDrouOeruBm3l+hadqVjipipuKzCMfkIku9Sjvp8uKzNmePskIP7+MMxB8tGwFXzV6mmICrq9jpXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+YZ86g8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+YZ86g8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0F4C19425;
	Mon, 20 Apr 2026 13:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776693296;
	bh=NJTAykTw4+1S123nPNn4vupaPIlfVHsCjB+fIKMfz3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e+YZ86g81N7BYUK3KX87qLMMrtzwvcBTl92acSEoVTs1Fkf21IpQkIQF2Xm4NtCAW
	 yljMjZhdar3ba+pqgmVTMq8Yjz+Wv0BMbLRiA8/zJOW2/RbLlX6wIfbKyKYeacGK8y
	 mwkq4/BDgHquhMjoKr8ZQPUQArYsmaOIZxRnMwlAfNBV7eSoZnLosOzxMYWhjiJZYt
	 tW4bPn5OBPyGM9auxnJGhKwH63o2CBR5CKRF3+c1jU0/k1G0gvi8dh/ZJeo12EviCc
	 ZB2upFTWq0/vEj/jfxzsLzqSw0URrsG5zlh9ebqniX5v4UqTXyO+vZLkRQm7oh3bH8
	 CgekVURtahVaA==
Date: Mon, 20 Apr 2026 14:54:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com
Subject: Re: [PATCH v9 3/5] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <d7cf33a0-6740-42da-b584-11d0f738e301@sirena.org.uk>
References: <20260420094349.14197-1-zhangyi@everest-semi.com>
 <20260420094349.14197-4-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gGNLG4Q+yxuVLELn"
Content-Disposition: inline
In-Reply-To: <20260420094349.14197-4-zhangyi@everest-semi.com>
X-Cookie: Sales tax applies.


--gGNLG4Q+yxuVLELn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2026 at 05:43:47PM +0800, Zhang Yi wrote:
> This is the codec driver for es9356-sdca.

> +static void es9356_sdw_shutdown(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct es9356_sdw_priv *es9356 = snd_soc_component_get_drvdata(component);
> +
> +	snd_soc_dai_set_dma_data(dai, substream, NULL);
> +}

We never actually use es9356 in the function, I'm surprised the compiler
doesn't warn.

> +static int es9356_sdca_dev_suspend(struct device *dev)
> +{
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
> +
> +	mutex_lock(&es9356->jack_lock);
> +	es9356->disable_irq = true;
> +	cancel_delayed_work_sync(&es9356->interrupt_handle_work);
> +	cancel_delayed_work_sync(&es9356->button_detect_work);
> +	mutex_unlock(&es9356->jack_lock);

Don't we need to mask the interrupt as well, and/or do something to
ensure that _interrupt_callback() doesn't reschedule the work?  If the
callback and this race then the callback could be sat waiting for the
mutex while this runs, then when the lock is released the interrupt
callback runs and it could reschedule the interrupt handler.

> +static int es9356_sdca_dev_system_suspend(struct device *dev)
> +{
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
> +
> +	return es9356_sdca_dev_suspend(dev);
> +}

This also doesn't use es9356.

--gGNLG4Q+yxuVLELn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmMCsACgkQJNaLcl1U
h9AdpwgAhnpzF/AQriG+QKaK2lJVxjCuqZvy3M07FUTgHxVNoW9a/jTFZUM/AvDh
f/OcXxcc2U6NyaaTY/H44EnodzDvz7eA4dN2J+JKHUkNDfFOtHs70NabF1+mB9ZL
iJdWPRsK8trTWAMEt575ndS8Fo4MNbS35CA2LE+ke9Ab8w5JI1lMY3tuvETCwacT
Qt8joo7w+sGzPXkSfemG1upALf41i7+yY4+6d7OcZPb5AkDUS4BbbLO2nilpHJuK
PSgi2rXHBh1U3yqEtFOmGa0jhqZXTBfi2JLKqMVbNbbcTLYLw8Wirn8yfMZNErEL
uvbytob7+g5DNA9R01rEDyt0Cgxk3w==
=ir0U
-----END PGP SIGNATURE-----

--gGNLG4Q+yxuVLELn--
