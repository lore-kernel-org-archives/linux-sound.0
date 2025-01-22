Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623492144A1
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 14:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737555876; cv=none; b=VTspM8qSF7ybhgMNq7YBai9rsgpxCYlxtkq9MxRcN1RYB+XFd469/HjZIAhDF6Qc77N6+LWCen1/8guTUNDw/Bo4pgxa4qPupUqVTnH2hakLQshkMJlWBBchTRHhr+xHNtmZKO4OgEVGRa6kpv6dtuK8Awl7t6EhDcBla79l4lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737555876; c=relaxed/simple;
	bh=XOja4YaEqhIdmJVIFGypf9qBtVFFj0ubOQhNXqHDAXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwBlW4Xj2wlZTB6UwUenWHLC46nZSboEzO1tnX3X+FiThatMpMTjaWn0rPIdnMfmoeNsaJ61a7d0UhmtGWDTTfwCBKjAizCqc7Wz/nnOhOmMnESRTtIpf89DjJgam1sx2JziyS6pAzpmn+7vOsBKkRoaUEnMHaDe3VUcX0rBvSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJ5jOiAj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJ5jOiAj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB163C4CED2;
	Wed, 22 Jan 2025 14:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737555875;
	bh=XOja4YaEqhIdmJVIFGypf9qBtVFFj0ubOQhNXqHDAXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJ5jOiAjcyNNzOZda0YyXY4EuwPecDVRqC4aalY87vlCPFVnKS/GaUyY/isO5pqOq
	 t7p5Hw1HJhUoXvjK2dnJyvjICbdLxP06FZtwFW0teUZbSMaD0yK50Gfa195F2H+p6d
	 5ajjDiVSp2+KVO9GQTnHCAP6kIaePteZc2DteQeb7hGRBFpDX+479YQnynl0PclumA
	 AYsZ/4bggAJVD5B9YCiGDU56qZOKx4xCISE1EACPsZ9G8ItxnyBfw07LRjl/PT7ASe
	 +TehL65XEw47HXVHYl++Fgiq8rFkuPX/bUpjLlUbxXegAXCahOE0Sdic3EyoeqrOiX
	 7YbPYpcNrbHhg==
Date: Wed, 22 Jan 2025 14:24:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Nikola Jelic <nikola.jelic83@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	rwalton@cmlmicro.com
Subject: Re: [PATCH 2/2] Adding support for the CML's CMX655D audio codec,
 both i2c and spi connectivity options.
Message-ID: <3f439018-4b3a-4a01-8afb-19f15c6e53f4@sirena.org.uk>
References: <20250121230903.89808-1-nikola.jelic83@gmail.com>
 <20250121230903.89808-2-nikola.jelic83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cr/y0v98CK9UFQsi"
Content-Disposition: inline
In-Reply-To: <20250121230903.89808-2-nikola.jelic83@gmail.com>
X-Cookie: Star Trek Lives!


--cr/y0v98CK9UFQsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 22, 2025 at 12:09:03AM +0100, Nikola Jelic wrote:

There's quite a few things here.  In general the majority of the issues
are ones where the driver isn't following common patterns that other
drivers in the subsystem or kernel at large aren't following them, a lot
of them are stylistic but there's quite a few that will affect operation
too.  In some of the more widespread issues I've highlighted examples
rather than every single one.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

> +config SND_SOC_CMX655D
> +	tristate "CMX655D codec"
> +	depends on I2C || SPI_MASTER
> +	help
> +	  Enable support for CML CMX655D audio codec with a speaker and
> +	  two microphones. You also need to enable at least one bus
> +	  adapter, I2C and/or SPI.
> +

There is no point in making this user selectable since it's unusable
without a bus, do what all the other multi-bus devices do and make it
selected by the per-bus options.

> +obj-$(CONFIG_SND_SOC_CMX655D) += snd-soc-cmx655.o
> +obj-$(CONFIG_SND_SOC_CMX655D_I2C) += cmx655_i2c.o
> +obj-$(CONFIG_SND_SOC_CMX655D_SPI) += cmx655_spi.o

All the other ASoC modules are snd-soc- ones and we always use - not _
as a separator.

> +/*
> + * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> + * Create Regmap
> + * +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> + */

Please use a normal kernel commenting style.

> +/*
> + * Define volatile regs with function
> + */
> +static bool cmx655_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	bool ret;
> +
> +	switch (reg) {
> +	case CMX655_COMMAND:
> +	case CMX655_SYSCTRL:
> +	case CMX655_ISR:
> +	case CMX655_ISE:
> +		ret = true;
> +		break;
> +	default:
> +		ret = false;
> +		break;
> +	}
> +	return ret;
> +};

Please just directly return like other similar regmap functions do, it
*probably* doesn't make a difference to the generated code but it makes
the code look less standard.

> +	.reg_defaults = cmx655_reg_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(cmx655_reg_defaults),
> +	.cache_type = REGCACHE_RBTREE,

Unless you've got a strong reason to use something else the default
should be _MAPLE.

> +EXPORT_SYMBOL(cmx655_regmap);

ASoC and regmap are both EXPORT_SYMBOL_GPL, this is unusable without
_GPL so you should keep it and all the other exports _GPL too.

> +/*
> + *  Get the clock setup the system clock based on clock Id, DAI master mode
> + *  and sample rate
> + *      clk_id      - Clock source setting as defined in cmx655.h
> + *      master_mode - Non-zero if the CMX655 is the DAI master
> + *      sr_setting  - Setting for sample rate 0 to 3
> + *      clk_src     - pointer for storing clock source (PLLREF, PLLSEL and
> + *                          CLKSEL bits)
> + *      rdiv        - pointer for storing PLL's RDIV value (13 bits)
> + *      ndiv        - pointer for storing PLL's NDIV value (13 bits)
> + *      pll_ctrl    - pointer for storing PLLCTRL register value (8 bits)
> + */

Again, we have a style for this in the kernel which you should use.

> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBM_CFM:
> +		reg_val = reg_val | CMX655_SAI_MSTR;
> +		break;
> +	case SND_SOC_DAIFMT_CBS_CFS:

Please use the modern names for these that avoid outdated terminology.

> +static int cmx655_hw_params(struct snd_pcm_substream *stream,
> +			    struct snd_pcm_hw_params *hw_params,
> +			    struct snd_soc_dai *dai)
> +{
> +	int ret;
> +	struct snd_soc_component *component = dai->component;
> +	struct cmx655_data *cmx655_data =
> +	    snd_soc_component_get_drvdata(component);
> +	struct cmx655_dai_data *cmx655_dai_data = &cmx655_data->dai_data;
> +	unsigned int enabled_streams = cmx655_dai_data->enabled_streams;
> +
> +	if (cmx655_dai_data->best_clk_running) {
> +		// Will get here if the clock is in use so don't go stopping it
> +		dev_dbg(component->dev, "Clock running. Skipping setup\n");

This is going to result in us just ignoring what the user asked for if
the stream is already running.  Like with other devices if there's
constraints that have been created at runtime they should be advertised
to userspace via the constraints interface, if userspace attempts to set
something that violates the constraints we should error out.

> +static irqreturn_t cmx655_irq_thread(int irq, void *data)
> +{
> +	struct snd_soc_component *component = data;
> +	struct cmx655_data *cmx655_data =
> +	    snd_soc_component_get_drvdata(component);
> +	unsigned int status;

> +	status = snd_soc_component_read(component, CMX655_ISR);
> +	if (status == 0) {	// Event was not trigged by CMX655 so let the higher level know
> +		return IRQ_NONE;
> +	}
> +	// Thermal protection event ++++++++++++++++++++++++++++++++++++++++++++++++

Again, please write code that looks like kernel code.  I'm not pointing
out every issue here.

> +	SOC_ENUM("Cap_HPF Capture Switch", cmx655_hpf_capture_enum),
> +	// Noise gate
> +	SOC_SINGLE("Noise_Gate Capture Switch", CMX655_NGCTRL, 7, 1, 0),

Please don't insert random _s into control names, write something that
looks like normal text.

> +	SOC_SINGLE_TLV("NG_Threshold Capture Volume", CMX655_NGCTRL, 0, 31, 0,
> +		       cmx655_ng_thresh),

Please consistently name the noise gate controls to use Noise Gate to
help userspace group the controls.

> +	SOC_SINGLE_TLV("Pre_Amp Playback Volume", CMX655_PREAMP, 0, 3, 0,
> +		       cmx655_pre_amp),

Preamp or Preamplifier.

> +	SOC_ENUM("Play_HPF Playback Switch", cmx655_hpf_playback_enum),

Play and Playback?

> +	SOC_SINGLE("Companding_En Switch", CMX655_SAIMUX, 4, 1, 0),

_En is redundant.

> +	SOC_ENUM("Companding_Type Switch", cmx655_companding_enum),

This is an enumeration not a Switch, this will confuse userspace.

> +	// Set-up value following the codec reset that will happen in a bit
> +	cmx655_data->dai_data.enabled_streams = 0;
> +	cmx655_data->dai_data.best_clk_running = false;

You kzalloc()ed the struct.

> +	if (cmx655_data->reset_gpio) {
> +		// Hold reset line
> +		gpiod_set_value_cansleep(cmx655_data->reset_gpio, 1);
> +		// Time of reset pulse must be greater than 1us
> +		// sleep for 10us to 1ms, speed is not critical here
> +		usleep_range(10, 1000);
> +		// release reset line
> +		gpiod_set_value_cansleep(cmx655_data->reset_gpio, 0);
> +	} else {
> +		dev_dbg(&client->dev, "No reset GPIO, using reset command\n");
> +		regmap_write(cmx655_data->regmap, CMX655_COMMAND,
> +			     CMX655_CMD_SOFT_RESET);
> +	}

This could be factored out into the core, as could the DT parsing.

> +static void cmx655_i2c_remove(struct i2c_client *client)
> +{
> +	struct cmx655_data *cmx655_data = i2c_get_clientdata(client);
> +	// put codec into reset in GPIO given
> +	gpiod_set_value_cansleep(cmx655_data->reset_gpio, 1);
> +	// unregister codec
> +	cmx655_common_unregister_component(&client->dev);
> +};

This will reset the device while it's still exposed to userspace which
could go badly.

--cr/y0v98CK9UFQsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeQ/58ACgkQJNaLcl1U
h9BZNwf/coXyZD01QZUS4tLVCu1ulFGxB0pUYn1eUt9OHv3VXfPSyq2O8BP3V90F
1zwQ6bsru2171JC8z7SYOrhX44uB4cGqWD3gt0IYCNvqgi5WPNjBO6ngJH2Ar1R+
1jathnLiVuI8blSNszcwHWH/CAbRgaet3NwvaH05FlqbPMc0OsZjUj8F1TpxlK/a
qFsm/KrpfACwTR3Y8nsXFRJrNtqXJLscJb48r0xRQQN6gJ3VsWNXTbEFZ3KjWrSR
v40kUNdweyX6U4B2WpEpiJaWZOr/Me2PM6ICbPZcqjVvhOIwCVGEKY4ooY8jhSJ6
56GAkC617fHvth9UiRrYKcf7ycXeqQ==
=tC3P
-----END PGP SIGNATURE-----

--cr/y0v98CK9UFQsi--
