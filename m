Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7601F286D4D
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 20:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552510; cv=none; b=Ga5+a5sFOvrz69URRWoyxxLFJlCqdVKWzB2dNa2+8br12HRhdeuJ3SpzXkx0fWY0WoWTnh8ViWgUaRQkOXcVsuQkVaAklgNwGOUmrrQl4F1dsQoKR9E7KsXO/RRHOgtYhNeKMgDU3wQtwiG+pmfmrPxAj/ZpSP+a5eSPjKd1uRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552510; c=relaxed/simple;
	bh=w7XwJFem+DyMLVL0ZG/u+v7WGT92YCBxSlW9d/JX9sI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXijiIvwJl6tigOzPzBTCDOhyJ/uBMHUGTm1a/1qqW7ymXKKcg3+VSLVfNbESRXGGGGm+sYlyzsOgphXSaq5Opgv58D2ak9uKD5wC8QCWR9p/5OOl1mCVFpvOXbgO26htYL0jisTkVK2CUcbKunijNTrnI+ckAa6lJTmGIp0n5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+IOi/ox; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+IOi/ox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD151F00A3D;
	Fri,  4 Sep 2026 20:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788552500;
	bh=xcdZy4hTZ5SW/Ie0lY6bqTJbRxHMB8ZSo5iMeR05n/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T+IOi/ox9ifhdzMo0zrwOlRcbVn5eaI/gCrK2khZCx23uDcmkW4Z6hNe7MWjuRVN+
	 vI3tMRh6T3CB75tFChjlgqq1jTCaPQZt53MR55hPI83IENR5FSbT+pn1wn+tVCUNJQ
	 kPg6NVtvhv+autgUA0i9+Sqbfnv9+mUETu7aLKV1Y9rWwirqcOmuABW/YND8nr/M1l
	 +v6iwXN9sHs6plYt00oILA5ziwqXtkpirinPGJUE+AY+QZbwgWYGLwSrRuVER/8dMo
	 e9CSFcGK3Ot/aDdTWqcyfgj74fZ8OkVMIG0oDI/3diEVbuLaPYb2RZJqxEL0Rvlsfq
	 ec5wFFqoTTM3Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 38C6C1AC52F1; Fri, 04 Sep 2026 21:08:18 +0100 (BST)
Date: Fri, 4 Sep 2026 21:08:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: Re: [PATCH 19/23] ASoC: SOF: Add support for IPC4 compressed
Message-ID: <apslMqkO9eXK0RL5@sirena.co.uk>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-20-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wzLuxTowNF1imiBp"
Content-Disposition: inline
In-Reply-To: <20260904073134.29648-20-peter.ujfalusi@linux.intel.com>
X-Cookie: My vaseline is RUNNING...


--wzLuxTowNF1imiBp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 10:31:30AM +0300, Peter Ujfalusi wrote:
> Set and define the compressed ops for IPC4.
> The initial implementation supports basic features: PAUSE PUSH/RELEASE,
> DRAIN and progress reporting.
> Tested with PCM, MP3, AAC and VORBIS codec.

> +static int sof_ipc4_compr_set_params(struct snd_soc_component *component,
> +				     struct snd_compr_stream *cstream,
> +				     struct snd_compr_params *params)
> +{

> +	/* Use correct format based on the used codec */
> +	switch (params->codec.id) {
> +	case SND_AUDIOCODEC_PCM:
> +		snd_mask_set_format(fmt, (snd_pcm_format_t)params->codec.format);
> +		break;

Do we validate the value supplied by userspace here?

--wzLuxTowNF1imiBp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqbJTEACgkQJNaLcl1U
h9AqywgAgJiMuu0d+UVWQhensoRy6g+NZX0+pSfmIV4BTbDOfSqkbl8qiDI80sY9
JdCLcitJSGQ166rE9TZUOHenqR9qkh7QqsQKNOBjIHFZlAtCDpla/JRdLtqxU3aB
Pbl7G3/XGS6kpk5WMPL+CN1TRuVrcyQF3nGoBPx9HRCJ8fJviULci3W9QgePGTac
DjTbumtsalrE2Dhs7u7N+58gDl/BgSUyy/yyvh2vCtPSPqTlLE8lzM5d8SeglIS/
eaLjuhTueDPlxZ8qfE4NbKz9AznGDTI0xGkBTXVWI8/BJWOhuezbmPztd8zvpAU6
YSLQ/TF4FUUHARoix7bipb6PkZ5PRg==
=z3fi
-----END PGP SIGNATURE-----

--wzLuxTowNF1imiBp--
