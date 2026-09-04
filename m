Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3DD426692
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 19:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788551144; cv=none; b=VSMbZFdnJ5OAAkWjX/yvjjlgnz7r2fgISzkPvONDLoqQdspB88Hw7TOLYGpawdNDM5xlRR5pJn6/3CoduJswPLL5JYeVvVP5TvsN1wOgnAgCyfeWwWyx6ZfEQXcov0q58yC4eN+HK4XMyZtiOYD6fymXsSvPqnUWPz3U+M6YmW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788551144; c=relaxed/simple;
	bh=DoWyGvrH8T+BMUmKnteBJVvqI769OmEKzOhaqNkgcAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1jzI0oy2DUnnhQrp9CrFuzniCLmUOIkNwFNS7EvL3nDCmZuY7tV/14s7M4n5Ig4i7bBJ9JCqEGxX5q7seezgtAqmkkAthArLSw36D2v1j1ktUgq6hI9OA/Xf8mqvnmpuFdMREMnQ3wP+HGQCB+8EFyqQ9dyVOqnB7ezouj1m5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGPwHUQc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGPwHUQc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3BA1F00A3D;
	Fri,  4 Sep 2026 19:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788551129;
	bh=HCY9VGAqhzJ9PPUA6uDYuCpDUnSnfB58EIDAVhpRUjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dGPwHUQcY+YtK+ZsfHZQLwSc9io5SQegfhxfYPu1e2uk0w8qB+9HhzomHK8WVdDvN
	 GSz6KDTl7cZmfDnXacirsdptktG+4nZZpirdeRO9ULEo+izj7LZ9HynSii41klbEml
	 hgkaj9TCGcPmHyUxQSKzeoJX8VRfaGJrg82zI9U+Rfbf/C/CJJq3Vz0phEF8zBVfS6
	 koGOf8T0srsSo+hYjtHpkuLDROpsvD9WLitYLK1oTQ/ebOP1KVSSDD5IFFmanv2vbi
	 HbFd8fLur9m1qvrdfZSG1tyEgX14oC1iCWjPt25Ql2NJgt15aoiihfpt2yNpMSb4GZ
	 fmaDmAFp6NtSQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EBFD01AC52F1; Fri, 04 Sep 2026 20:45:26 +0100 (BST)
Date: Fri, 4 Sep 2026 20:45:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: Re: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
Message-ID: <apsf1kjaFG71NpPd@sirena.co.uk>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gaapBVWbjYR4hDFr"
Content-Disposition: inline
In-Reply-To: <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
X-Cookie: My vaseline is RUNNING...


--gaapBVWbjYR4hDFr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2026 at 10:31:15AM +0300, Peter Ujfalusi wrote:

> The FE-BE trigger sequence should be dynamic, similarly how soc-pcm.c
> dpcm_fe_dai_do_trigger() does it.

> +static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cm=
d)
> +{
> +	struct snd_soc_pcm_runtime *fe =3D cstream->private_data;
>  	int stream =3D cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV=
_PCM_STREAM_xxx */
> +	bool fe_first;
>  	int ret;
> =20
>  	if (cmd =3D=3D SND_COMPR_TRIGGER_PARTIAL_DRAIN ||
>  	    cmd =3D=3D SND_COMPR_TRIGGER_DRAIN)
>  		return snd_soc_component_compr_trigger(cstream, cmd);

What about SND_COMPR_TRIGGER_NEXT_TRACK...

> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		ret =3D soc_compr_trigger_fe_be(cstream, cmd, fe_first);
> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		ret =3D soc_compr_trigger_fe_be(cstream, cmd, !fe_first);
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +		break;

=2E..otherwise it'll end up with -EINVAL instead of getting passed
through.  Also a switch statement would be a bit more idiomatic.

--gaapBVWbjYR4hDFr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqbH9YACgkQJNaLcl1U
h9Cw+gf/e7w9PkLTwIyCrLnWwTrjiGaiOfZ/73VCS/VR+BI/YokZz1cTKWZCklB+
ljjZtFTRq4Z2qBk5h9VpaWYmG4DebmacD6tnNCPcb2nPdCm5JzID524OYFSPBbAM
BdemcWlamRjLaJkYTKnVQ+KUm9ubItDImUp3rjt2HLfjKMtAkrYsUv4BBHwfJl+S
EZMmGYVHhKXbp0ScMzlzLrizsv3vC+VJo9qBQc6EpKW61FIVmN5pT5m+hyTPCJow
iJEnoLHhDIgVbQeF03ZyDsaLR/p/3Mdd74zATSwxieKt/mGmLVMM2rc3A9SHyvus
ggexfa/tuW7Ajxja7LnS0ijvkwCveQ==
=BHIj
-----END PGP SIGNATURE-----

--gaapBVWbjYR4hDFr--
