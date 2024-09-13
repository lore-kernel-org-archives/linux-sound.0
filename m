Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75144482D8
	for <linux-sound@vger.kernel.org>; Fri, 13 Sep 2024 15:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726242733; cv=none; b=DTxDnT7VJZl47//46r6JzZlatVWsh/Tt1TCtbcUxECDjXIbZ4NyrYW3sYnKVK0i+gLdEZa3kV1BOn2GR6MeYy5AOy+SXU7jOVhNIEREVj4bl39mpF8HVnimC055O3MwZv79w9iCIkYKzrjqziLfEZG9SZ9pjh49SCNM9VwaCOAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726242733; c=relaxed/simple;
	bh=Lgw167Jkbo8yaZJZHdLHMwOqPFZzODblpjCemZFVRDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VIZRAbCDDcmjcb8zPt75BQDEvhgGBANKFgsFRInxOSVCUoxKhv61gJIiwx84Cwo5ITx1j9wdUe8L+PZcwE9JRHxp6uSmkUjnwlXnaRIOiXWGkfLvLAt/GwY1IBXTpQfEgUoQwHRKu9lOnMsvQolKh1qiNcdq+HTDV07+UTHgGfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mkkJE2gz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mkkJE2gz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD167C4CEC0;
	Fri, 13 Sep 2024 15:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726242733;
	bh=Lgw167Jkbo8yaZJZHdLHMwOqPFZzODblpjCemZFVRDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mkkJE2gzgMMcNO1sbIVstikVOFZOuuTi4eoMCcV6Wt/PJyJhd9nnHpbU5Z3Wk1Rq7
	 DlYmL+RDytE9SN1fLIL5mUE7I7VjaDYUvCmmTqQNXithwFv3o+oGpa1s4h/XSswHDy
	 VRU0mt0Ra2mGoizS2JPdyupUnlXl2BNGoMX2n+Bs4vC823qGEc/TOpEkxXhrUnM+lU
	 6CQA2qcRo68cy/YbbrF+sSg8ZIpT4W13fD4ddnnA4MbuQwd7abU6ybpBMENKUUVZJ2
	 0J+SmCjmkqMW/c7HblIEZTD9vDHte3YYKGCxOZ/E+X9AHq+ThgApUpHs3U8a7tL3Li
	 XtyzK3Rl+ToJQ==
Date: Fri, 13 Sep 2024 16:52:07 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com, oliva@gnu.org
Subject: Re: [PATCH] ASoC: rt1320: reads patch code from firmware file
Message-ID: <2aa00670-d820-43cb-b479-c9aca7d0c243@sirena.org.uk>
References: <20240913082733.2189491-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="squbR9weB0+RnjT4"
Content-Disposition: inline
In-Reply-To: <20240913082733.2189491-1-shumingf@realtek.com>
X-Cookie: In space, no one can hear you fart.


--squbR9weB0+RnjT4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 13, 2024 at 04:27:33PM +0800, shumingf@realtek.com wrote:

> +/*
> + * The 'patch code' is written to the patch code area.
> + * The patch code area is used for SDCA register expansion flexibility.
> + */
> +static void rt1320_load_mcu_patch(struct rt1320_sdw_priv *rt1320)
> +{
> +	struct sdw_slave *slave = rt1320->sdw_slave;
> +	const struct firmware *patch;
> +	char filename[128];
> +	unsigned int addr, val;
> +	const unsigned int *ptr;
> +	int ret, i;
> +
> +	if (rt1320->version_id <= RT1320_VB)
> +		strscpy(filename, RT1320_VAB_MCU_PATCH, sizeof(filename));
> +	else
> +		strscpy(filename, RT1320_VC_MCU_PATCH, sizeof(filename));
> +
> +	/* load the patch code here */
> +	ret = request_firmware(&patch, filename, &slave->dev);

Why not just

	const char *filename;

	if (rt1320->version_id <= RT1320_VB)
		filename = RT1320_VAB_MCU_PATCH;
	else
		filename = RT1320_VC_MCU_PATCH;

	ret = request_firmware(&patch, filename, &slave->dev);

(ie, what does the copy into the buffer do?)

> +	} else {
> +		ptr = (const unsigned int *)patch->data;
> +		for (i = 0; i < (patch->size / sizeof(unsigned int)); i += 2) {
> +			addr = ptr[i];
> +			val = ptr[i + 1];
> +			regmap_write(rt1320->regmap, addr, val);
> +		}

Shouldn't this be using a specifically sized type in case we build on
some architecture where int is a different size?  We should also
validate that the file is an even number of register/value combinations
to make sure it's not corrupt, checking the value of regmap_write() to
make sure the register numbers are OK would probably be good.

--squbR9weB0+RnjT4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbkX6cACgkQJNaLcl1U
h9ADoAf/dw6iDYggV2jxO2hvVmiHV0gaw4oE/N1rmt5YHseta87qAqZNdL92hj53
jdfxgD6OO4aXr3bUM7CvwIASLRsngBpcrWcXywhciBKfolRUCAumi9DY0tid2j4C
T2YhaeQaaGTIfmz5LQScuyxgSTgwKzcz+epCPoGO+WW2rczThC9eiI7ZGgMTIryc
oI7XgsugMBfNsZoqhIijT06ey1KckCj0WMQHqsbxkIXm2rY50yLrca6DMVwje9c/
CfMJ0JpvOdpgbraxHdIhJigGP1aGpmQZbwqL8Oyu48wHsNh6Q0cjuSVN6HIkerDG
6WGsjyAtaAuZeqx4HqzAv3+aiji9Nw==
=C6hf
-----END PGP SIGNATURE-----

--squbR9weB0+RnjT4--
