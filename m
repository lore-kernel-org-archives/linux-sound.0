Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2774E405ADB;
	Wed, 25 Mar 2026 17:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774461244; cv=none; b=bjpH/M+8oJ3C7bSPZOUWHv+Q8mN0l5sX9CSIJAtUmCVSiJB/HNL73MBpDdchV9jAnFxxTen8RLzz89f/laqACk/v3Awan7w2KTQeUj0yBi4p2nfYiidYQtLyH75v8pyGz2CVXG435dg1r0ObwBGVS9wkp3V/J9hCENcRNPzSKfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774461244; c=relaxed/simple;
	bh=CC4XELPodkPOSiwJ/s07D9Qy0JlprIg1eEB1OIR1Ey4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VpzmKpcizzbxn3TUtC7Yj463vp+D+k/AoJ6egHM3cnfe5S7GqJBy7diovRKbkHx4rkstQm+KQM8D4OjNehpXLw/xH1Hmd+SvlXc77A9EhyJe7Cnrx4umPdqNAWtTevFiGBB+6wMKp92YLXxpRJ0cUQbgjHGUbqGtdM3lS10h34M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uU+uIh6u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uU+uIh6u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB981C4CEF7;
	Wed, 25 Mar 2026 17:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774461243;
	bh=CC4XELPodkPOSiwJ/s07D9Qy0JlprIg1eEB1OIR1Ey4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uU+uIh6u9KCBFKr/pixP2Y7hc5mWnebrQF0Co4PtkzeXldHkWlYRz2CIjoNTonvRM
	 erG+CyK7j0ny2vltuJ/HALsbuEqUhFt+dSh0cz+5OnVdhhHWHGGdpy+SJ/ecncoxUt
	 8l+SoIn8dwXlb3pYd6MGj0tBL6aitc2yNUjowJE+geylzy9fQcSgc5QaMJu7v63wtf
	 PqQhTZ1WOo8PRe2LdksD4OTxhQVSPRU0B9sPv7LC56BMCgFAuqw64KuNoj0/w3KaiN
	 WbtdtG8cqrGtG6UPwOcvXK1yS4Z4xtDvhvIH17QPyWDya98fmybd1FR0ETx2mJZZ3Z
	 wtXWxaX8zlo+g==
Date: Wed, 25 Mar 2026 17:53:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v2 2/2] ASoC: cs35l56: Allow factory calibration through
 ALSA controls
Message-ID: <6e2d8ded-00ce-4148-bd93-aded513b9f30@sirena.org.uk>
References: <20260325170841.1405368-1-rf@opensource.cirrus.com>
 <20260325170841.1405368-3-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9Z27EpoB7Jwmgw+m"
Content-Disposition: inline
In-Reply-To: <20260325170841.1405368-3-rf@opensource.cirrus.com>
X-Cookie: -- I have seen the FUN --


--9Z27EpoB7Jwmgw+m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 05:08:41PM +0000, Richard Fitzgerald wrote:
> Add support for using ALSA controls to trigger a factory calibration.
> This is protected by a new Kconfig option so that it is only available
> if explicitly enabled in the kernel. By default it is not enabled.

> Factory calibration is normally done through debugfs files.
> Google have requested that factory calibration can be performed by
> repair shops. These repair shops only have access to the standard
> "user" kernel, which does not include debugfs.

AFAICT this doesn't have an EFI write command like the debugfs code does
(when you write "store_uefi").  I don't mind, just wanted to double
check that this is desirable?

>=20
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
> Changes in V2:
> - Rename "Calibrate" control to "Calibrate Switch" to conform to naming
>   convention for boolean controls.
> - Mark "Calibrate Switch" control volatile.
> - Cache the value written to the "CAL_AMBIENT" control so that a read will
>   return the last set value.
> - Return 1 from writing "CAL_AMBIENT" if the value was changed.
> - Return 1 from writing the "Calibrate Switch" control to true because
>   that always causes some activity in the amp.
> - Replace use of the confusing in_range() with normal comparisons against
>   limits and make the limits the same as the control definition.
> - Simplify the code in cs35l56_calibrate_ctl_set(). It's a boolean so the
>   value written to it is either false or true.
>=20
>  include/sound/cs35l56.h           |  1 +
>  sound/soc/codecs/Kconfig          | 13 +++++
>  sound/soc/codecs/cs35l56-shared.c |  9 +++
>  sound/soc/codecs/cs35l56.c        | 96 +++++++++++++++++++++++++++++++
>  sound/soc/codecs/cs35l56.h        |  2 +
>  5 files changed, 121 insertions(+)
>=20
> diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
> index 7ca25487030a..c3b10587cb4c 100644
> --- a/include/sound/cs35l56.h
> +++ b/include/sound/cs35l56.h
> @@ -435,6 +435,7 @@ ssize_t cs35l56_cal_data_debugfs_read(struct cs35l56_=
base *cs35l56_base,
>  ssize_t cs35l56_cal_data_debugfs_write(struct cs35l56_base *cs35l56_base,
>  				       const char __user *from, size_t count,
>  				       loff_t *ppos);
> +int cs35l56_factory_calibrate(struct cs35l56_base *cs35l56_base);
>  void cs35l56_create_cal_debugfs(struct cs35l56_base *cs35l56_base,
>  				const struct cs35l56_cal_debugfs_fops *fops);
>  void cs35l56_remove_cal_debugfs(struct cs35l56_base *cs35l56_base);
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index d6104796db4f..ca3e47db126e 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -921,6 +921,19 @@ config SND_SOC_CS35L56_CAL_SET_CTRL
> =20
>  	  If unsure select "N".
> =20
> +config SND_SOC_CS35L56_CAL_PERFORM_CTRL
> +	bool "CS35L56 ALSA control to perform factory calibration"
> +	default N
> +	select SND_SOC_CS35L56_CAL_DEBUGFS_COMMON
> +	help
> +	  Allow performing factory calibration data through an ALSA
> +	  control. It is recommended to use the debugfs method instead
> +	  because debugfs has restricted access permissions.
> +
> +	  On most platforms this is not needed.
> +
> +	  If unsure select "N".
> +
>  config SND_SOC_CS35L56_TEST
>  	tristate "KUnit test for Cirrus Logic cs35l56 driver" if !KUNIT_ALL_TES=
TS
>  	depends on SND_SOC_CS35L56 && KUNIT
> diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56=
-shared.c
> index af87ebae98cb..e05d975ba794 100644
> --- a/sound/soc/codecs/cs35l56-shared.c
> +++ b/sound/soc/codecs/cs35l56-shared.c
> @@ -1185,6 +1185,15 @@ ssize_t cs35l56_calibrate_debugfs_write(struct cs3=
5l56_base *cs35l56_base,
>  }
>  EXPORT_SYMBOL_NS_GPL(cs35l56_calibrate_debugfs_write, "SND_SOC_CS35L56_S=
HARED");
> =20
> +int cs35l56_factory_calibrate(struct cs35l56_base *cs35l56_base)
> +{
> +	if (!IS_ENABLED(CONFIG_SND_SOC_CS35L56_CAL_PERFORM_CTRL))
> +		return -ENXIO;
> +
> +	return cs35l56_perform_calibration(cs35l56_base);
> +}
> +EXPORT_SYMBOL_NS_GPL(cs35l56_factory_calibrate, "SND_SOC_CS35L56_SHARED"=
);
> +
>  ssize_t cs35l56_cal_ambient_debugfs_write(struct cs35l56_base *cs35l56_b=
ase,
>  					  const char __user *from, size_t count,
>  					  loff_t *ppos)
> diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
> index 9d35797e000a..378017fcea10 100644
> --- a/sound/soc/codecs/cs35l56.c
> +++ b/sound/soc/codecs/cs35l56.c
> @@ -1109,6 +1109,88 @@ static int cs35l56_cal_data_ctl_set(struct snd_kco=
ntrol *kcontrol,
>  	return 1;
>  }
> =20
> +static int cs35l56_cal_ambient_ctl_get(struct snd_kcontrol *kcontrol,
> +				       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct cs35l56_private *cs35l56 =3D snd_soc_component_get_drvdata(compo=
nent);
> +
> +	ucontrol->value.integer.value[0] =3D cs35l56->ambient_ctl_value;
> +
> +	return 0;
> +}
> +
> +static int cs35l56_cal_ambient_ctl_set(struct snd_kcontrol *kcontrol,
> +				       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct cs35l56_private *cs35l56 =3D snd_soc_component_get_drvdata(compo=
nent);
> +	struct snd_soc_dapm_context *dapm;
> +	int temperature =3D ucontrol->value.integer.value[0];
> +	int ret;
> +
> +	if (temperature =3D=3D cs35l56->ambient_ctl_value)
> +		return 0;
> +
> +	if ((temperature < 0) || (temperature > 40))
> +		return -EINVAL;
> +
> +	dapm =3D cs35l56_power_up_for_cal(cs35l56);
> +	if (IS_ERR(dapm))
> +		return PTR_ERR(dapm);
> +
> +	ret =3D cs_amp_write_ambient_temp(&cs35l56->dsp.cs_dsp,
> +					cs35l56->base.calibration_controls,
> +					temperature);
> +	cs35l56_power_down_after_cal(cs35l56);
> +
> +	if (ret)
> +		return ret;
> +
> +	cs35l56->ambient_ctl_value =3D temperature;
> +
> +	return 1;
> +}
> +
> +static int cs35l56_calibrate_ctl_get(struct snd_kcontrol *kcontrol,
> +				     struct snd_ctl_elem_value *ucontrol)
> +{
> +	/*
> +	 * Allow reading because of user-side libraries that assume all
> +	 * controls are readable. But always return false to prevent dumb
> +	 * save-restore tools like alsactl accidentically triggering a
> +	 * factory calibration when they restore.
> +	 */
> +	ucontrol->value.integer.value[0] =3D 0;
> +
> +	return 0;
> +}
> +
> +static int cs35l56_calibrate_ctl_set(struct snd_kcontrol *kcontrol,
> +				     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	struct cs35l56_private *cs35l56 =3D snd_soc_component_get_drvdata(compo=
nent);
> +	struct snd_soc_dapm_context *dapm;
> +	int ret;
> +
> +	if (ucontrol->value.integer.value[0] =3D=3D 0)
> +		return 0;
> +
> +	dapm =3D cs35l56_power_up_for_cal(cs35l56);
> +	if (IS_ERR(dapm))
> +		return PTR_ERR(dapm);
> +
> +	snd_soc_dapm_mutex_lock(dapm);
> +	ret =3D cs35l56_factory_calibrate(&cs35l56->base);
> +	snd_soc_dapm_mutex_unlock(dapm);
> +	cs35l56_power_down_after_cal(cs35l56);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 1;
> +}
> +
>  static const struct snd_kcontrol_new cs35l56_cal_data_restore_controls[]=
 =3D {
>  	SND_SOC_BYTES_E("CAL_DATA", 0, sizeof(struct cirrus_amp_cal_data) / siz=
eof(u32),
>  			cs35l56_cal_data_ctl_get, cs35l56_cal_data_ctl_set),
> @@ -1117,6 +1199,14 @@ static const struct snd_kcontrol_new cs35l56_cal_d=
ata_restore_controls[] =3D {
>  			SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE),
>  };
> =20
> +static const struct snd_kcontrol_new cs35l56_cal_perform_controls[] =3D {
> +	SOC_SINGLE_EXT("CAL_AMBIENT", SND_SOC_NOPM, 0, 40, 0,
> +		       cs35l56_cal_ambient_ctl_get, cs35l56_cal_ambient_ctl_set),
> +	SOC_SINGLE_BOOL_EXT_ACC("Calibrate Switch", 0,
> +				cs35l56_calibrate_ctl_get, cs35l56_calibrate_ctl_set,
> +				SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_VOLATILE),
> +};
> +
>  VISIBLE_IF_KUNIT int cs35l56_set_fw_suffix(struct cs35l56_private *cs35l=
56)
>  {
>  	unsigned short vendor, device;
> @@ -1290,6 +1380,12 @@ static int cs35l56_component_probe(struct snd_soc_=
component *component)
>  						     ARRAY_SIZE(cs35l56_cal_data_restore_controls));
>  	}
> =20
> +	if (!ret && IS_ENABLED(CONFIG_SND_SOC_CS35L56_CAL_PERFORM_CTRL)) {
> +		ret =3D snd_soc_add_component_controls(component,
> +						     cs35l56_cal_perform_controls,
> +						     ARRAY_SIZE(cs35l56_cal_perform_controls));
> +	}
> +
>  	if (ret)
>  		return dev_err_probe(cs35l56->base.dev, ret, "unable to add controls\n=
");
> =20
> diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
> index 36d239d571cd..cd71b23b2a3a 100644
> --- a/sound/soc/codecs/cs35l56.h
> +++ b/sound/soc/codecs/cs35l56.h
> @@ -54,6 +54,8 @@ struct cs35l56_private {
>  	bool sysclk_set;
>  	u8 sdw_link_num;
>  	u8 sdw_unique_id;
> +
> +	u8 ambient_ctl_value;
>  };
> =20
>  static inline struct cs35l56_private *cs35l56_private_from_base(struct c=
s35l56_base *cs35l56_base)
> --=20
> 2.47.3
>=20

--9Z27EpoB7Jwmgw+m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnEITcACgkQJNaLcl1U
h9AxpAf/ZjjTYsv5WHA1fsSh8UwaT6EF1LnZ+S6TaKz5PENYeTVlnJDKwe8zrxVe
cnXzPsU/iUb0cPrtq5XRWGquosvrHJtL7rChfNR7YVSIdlk0EAQHU/7zxkvCnkcd
Eqhhf7qs3c3K5idVEon2JQjvmFkvGKtAO7aed6/yZhzhmLBzec3v8Kj76ukZEj5x
qgEQLcZM83Fn1J4r89qfBMxdROMmGYAcMAqYpI1TBNx0zlhs3D1ikfJrIPLzxnTR
mcn0UgTjhJnGUFDxDhN94uXsTMjbQJ7zxxTZLFXwKXrj4PsDo4l0PtKaDddtm/RZ
d9/nKHLOlTrOmYYwRwYGU4pwZrySwg==
=jlKp
-----END PGP SIGNATURE-----

--9Z27EpoB7Jwmgw+m--
