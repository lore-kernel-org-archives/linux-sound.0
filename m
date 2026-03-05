Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34393A9618;
	Thu,  5 Mar 2026 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772723521; cv=none; b=orQ+AVOPD9QmAnEp7GaB19BCYRzwVF8p8CTrfjHYt2sbq9zSa6u+NaNC5JGeYt/Djp3wsm0wBwkoB8+ZQwIcKWvz61i5h779RWs65Dxx0xLAMoZhSyTHz+k3y4jW5s5V6zoGiGPtSodF0c/tnzJXNi5F3aFve0Lgi6GH44P5WxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772723521; c=relaxed/simple;
	bh=q1buLjmzD5jbK93Cjaihu7DOmq2FTMtHLYbDWWbjkHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swNylELogWCjY/dYyLHcCzqdFyaiiykTpGlM8ixkFvWzs7xZ1jptuj7odBb85wSKsjYkeikgVXieyP9ezfWWC0IOarEuIupUJVYDliSxUJkYVeBnbiqQSAUCBjUXkv9O+FrXFNT9vu31bi2SGiWpPsEU0CpdUAvtIjvggGZTCLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ex3wCC+J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ex3wCC+J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578C9C116C6;
	Thu,  5 Mar 2026 15:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772723520;
	bh=q1buLjmzD5jbK93Cjaihu7DOmq2FTMtHLYbDWWbjkHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ex3wCC+JaWlFApWmQC1RpIrMzQdZ5NuE1BkNO9eSb2gDMStp0cduTuMmGASi+XXOB
	 hlQICsyFRIkfjXYEzIACShBO8fmdzIzB2yGTqVJHhJYLHstIredee+wI/nti5JlRit
	 dEl/2+yuwEgVTPOopoUYST9Ai3149HUVFuIivMmkks7aAEmdAsz8TvUwo5M6/dEf7F
	 BZ/oAwTofzldPDt54iqsSicV2lO6Yw89HM1uk87FiXMxpR5NCKFilbpoRVPH48l/Ts
	 pmyTyICj0Nh6K7yZ+o+U3zz90xD+xhlkr7EW/U2cwe6e5QpFzWOmXwIif0tEKwhzyL
	 FRklqZgQXl4NQ==
Date: Thu, 5 Mar 2026 15:11:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] ASoC: fsl_utils: Add snd_kcontrol functions for
 specific cases
Message-ID: <7665641b-1cad-4a65-94a1-771701363bf2@sirena.org.uk>
References: <20260305031031.3808182-1-shengjiu.wang@nxp.com>
 <20260305031031.3808182-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UC7QFUi5U5Qdzx8l"
Content-Disposition: inline
In-Reply-To: <20260305031031.3808182-2-shengjiu.wang@nxp.com>
X-Cookie: Onward through the fog.


--UC7QFUi5U5Qdzx8l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 05, 2026 at 11:10:29AM +0800, Shengjiu Wang wrote:

> +int fsl_asoc_get_xr_sx(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	bool pm_active =3D pm_runtime_active(component->dev);
> +
> +	if (!pm_active) {
> +		ucontrol->value.integer.value[0] =3D 0;
> +		return 0;
> +	}
> +
> +	return snd_soc_get_xr_sx(kcontrol, ucontrol);
> +}

This is racy, what happens if we race with runtime PM disabling the
device so it gets powered off between the check and the call to the
generic function?  I think we need to take a runtime reference here,=20
this is annoying but I can't see how else to do things robustly and
probably in practice there's not much performance impact.

> +EXPORT_SYMBOL(fsl_asoc_get_xr_sx);
> +
> +int fsl_asoc_put_xr_sx(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	bool pm_active =3D pm_runtime_active(component->dev);
> +
> +	if (!pm_active)
> +		return 0;
> +
> +	return snd_soc_put_xr_sx(kcontrol, ucontrol);
> +}
> +EXPORT_SYMBOL(fsl_asoc_put_xr_sx);
> +
> +int fsl_asoc_get_enum_double(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	bool pm_active =3D pm_runtime_active(component->dev);
> +
> +	if (!pm_active) {
> +		ucontrol->value.enumerated.item[0] =3D 0;
> +		return 0;
> +	}
> +
> +	return snd_soc_get_enum_double(kcontrol, ucontrol);
> +}
> +EXPORT_SYMBOL(fsl_asoc_get_enum_double);
> +
> +int fsl_asoc_put_enum_double(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	bool pm_active =3D pm_runtime_active(component->dev);
> +
> +	if (!pm_active)
> +		return 0;
> +
> +	return snd_soc_put_enum_double(kcontrol, ucontrol);
> +}
> +EXPORT_SYMBOL(fsl_asoc_put_enum_double);
> +
> +int fsl_asoc_get_volsw(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	bool pm_active =3D pm_runtime_active(component->dev);
> +
> +	if (!pm_active) {
> +		ucontrol->value.integer.value[0] =3D 0;
> +		return 0;
> +	}
> +
> +	return snd_soc_get_volsw(kcontrol, ucontrol);
> +}
> +EXPORT_SYMBOL(fsl_asoc_get_volsw);
> +
> +int fsl_asoc_put_volsw(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
> +	bool pm_active =3D pm_runtime_active(component->dev);
> +
> +	if (!pm_active)
> +		return 0;
> +
> +	return snd_soc_put_volsw(kcontrol, ucontrol);
> +}
> +EXPORT_SYMBOL(fsl_asoc_put_volsw);
> +
>  MODULE_AUTHOR("Timur Tabi <timur@freescale.com>");
>  MODULE_DESCRIPTION("Freescale ASoC utility code");
>  MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/fsl/fsl_utils.h b/sound/soc/fsl/fsl_utils.h
> index 21b25a11ecda..0cf9d1e7fb14 100644
> --- a/sound/soc/fsl/fsl_utils.h
> +++ b/sound/soc/fsl/fsl_utils.h
> @@ -31,4 +31,34 @@ void fsl_asoc_constrain_rates(struct snd_pcm_hw_constr=
aint_list *target_constr,
>  			      const struct snd_pcm_hw_constraint_list *original_constr,
>  			      struct clk *pll8k_clk, struct clk *pll11k_clk,
>  			      struct clk *ext_clk, int *target_rates);
> +
> +/* Similar to SOC_SINGLE_XR_SX, but it is for read only registers. */
> +#define FSL_ASOC_SINGLE_XR_SX_EXT_RO(xname, xregbase, xregcount, xnbits,=
 \
> +				xmin, xmax, xinvert, xhandler_get) \
> +{	.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER, .name =3D (xname), \
> +	.access =3D SNDRV_CTL_ELEM_ACCESS_READ |		\
> +		SNDRV_CTL_ELEM_ACCESS_VOLATILE,		\
> +	.info =3D snd_soc_info_xr_sx, .get =3D xhandler_get, \
> +	.private_value =3D (unsigned long)&(struct soc_mreg_control) \
> +		{.regbase =3D xregbase, .regcount =3D xregcount, .nbits =3D xnbits, \
> +		.invert =3D xinvert, .min =3D xmin, .max =3D xmax} }
> +
> +int fsl_asoc_get_xr_sx(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol);
> +
> +int fsl_asoc_put_xr_sx(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol);
> +
> +int fsl_asoc_get_enum_double(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol);
> +
> +int fsl_asoc_put_enum_double(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol);
> +
> +int fsl_asoc_get_volsw(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol);
> +
> +int fsl_asoc_put_volsw(struct snd_kcontrol *kcontrol,
> +		       struct snd_ctl_elem_value *ucontrol);
> +
>  #endif /* _FSL_UTILS_H */
> --=20
> 2.34.1
>=20

--UC7QFUi5U5Qdzx8l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmpnToACgkQJNaLcl1U
h9BUtwf/SUJrv0BSLPoLx0UoPadMjZdLjMQghGYP+9ZzbYDakVCLWvAeftuYKJDA
M3IZLMBpsa6QT/hM3rQDhRK0+esTlNFhqsvRWCQW0RAnYG2Y/7tSI8enCOieuuLd
ickCQ73DSVWBdRw6TlZMzjqSxEP8ZkscW9+e35aRV66sgIttGP3fMz/g9BQYjMQj
zMDTbduWpfhrsX7T1IfjNFrhfcZLWwS8KgODp87CYw8TVMcMCJmPzlVwORx8gdmt
AHpiMelkUtbMrm31/5IZW4pKAnbg9VjHk8Fyy+6YcvlOJVZ5RHTF78gMBkL3m+Iq
MqKntiVHR6lo0PHUWsey53gTdBKKJA==
=GSRC
-----END PGP SIGNATURE-----

--UC7QFUi5U5Qdzx8l--
