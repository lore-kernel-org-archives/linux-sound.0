Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBE025B0AF
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 23:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454626; cv=none; b=E5KWWSFGA7myaer+gRmbzN4wUibs/muyBBS4Bf44sGXRrk35SxM+QHNP2TBSXBF98BlJlf0lbIupk/AKHqp09191uBI4gR+1ygQ4dCv8w40eR3NYBcSqra6HQHCVnAPF6tZa4c1CdRCAHeXwU1vu2p1nbiQrWVTdNHMzDSUs//I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454626; c=relaxed/simple;
	bh=deIKCt17iFdNWC9qoZK357cYymrUBIP/qli12WLqnbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRYAG/ufR+GCx8CJnudSGIPXq0FBZtNGVu36jcuCGJEAXMkavvO6jHGL+9ekLRxuK5t+VTVv2bxIh8D0aWNvPz38G1xc/+xboP/v7n5nvnhW15pU8qvLd99SSgbsjQd/0kALBf7nOkDfiQtNhJFxyCSU6Ux/CmwFhQgQuXgBsxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/gfdm2q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/gfdm2q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5771F000E9;
	Thu, 30 Jul 2026 23:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785454624;
	bh=F90BVI7LBOYQvLEGK9gzZgpY8yRevawHJDMkuI+msPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F/gfdm2q7IW+84FRTQ/scrxoNtf1HgrS2y5tqQzdfKCRqa7yYxJsRxMxAsKMMiiE9
	 zBYmO91ZzHGbuF+dMd9VU9j3tboJKtXnEE55y09FzO5BEg5pEuML0jTkDoG1rTJOQ6
	 rWXkGKYxNsvnm2s5xAZ88+w45A3cIJAc02S28/N67W/mKkR9F7LEqfHwHExKcSu9wm
	 XVZ/Fmziz/aoV52nyVbBmtjmfOOjmb5uZik+Y0hz1nr33pSLeWqbILbLmOjxheWAwT
	 c6FoYFDWIlAg0fTZSFVUWVG1qj+RuglrnGiEVoIcl/jBr8KPdrt8klSOYP1z+1zNPQ
	 SEGLz5Of31EFA==
Date: Fri, 31 Jul 2026 00:37:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, jyri.sarha@linux.intel.com
Subject: Re: [PATCH 4/6] ASoC: SOF: ipc4-topology: Add payload to pipeline
 create messages
Message-ID: <13cce21a-d750-46a4-8072-7a40863ca04c@sirena.org.uk>
References: <20260730104141.14817-1-peter.ujfalusi@linux.intel.com>
 <20260730104141.14817-5-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nFh89dfvhnNN9tDt"
Content-Disposition: inline
In-Reply-To: <20260730104141.14817-5-peter.ujfalusi@linux.intel.com>
X-Cookie: In specially marked packages only.


--nFh89dfvhnNN9tDt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2026 at 01:41:39PM +0300, Peter Ujfalusi wrote:

> +	/*
> +	 * If this is not a Data Processing module instance, add the
> +	 * required heap sizes to the sum of all module instances belonging
> +	 * to the same pipeline, and find the maximum stack requirement
> +	 * among all module instances belonging to the same pipeline.
> +	 */
> +	if (swidget->comp_domain != SOF_COMP_DOMAIN_DP) {

Does this DTRT if the comp_domain was read from the manifest?

> +static void sof_ipc4_widget_pipe_ext_obj_memory_data(struct snd_sof_dev *sdev,
> +						     struct snd_sof_widget *swidget,
> +						     u32 *payload, u32 *ext_pos,
> +						     struct sof_ipc4_glb_pipe_ext_object **hdr)
> +{

> +	mem_data->domain_id = swidget->domain_id;

Do we need SOF_COMP_EXT_TOKENS in pipeline_token_list to parse the
domain ID?

--nFh89dfvhnNN9tDt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpr4BwACgkQJNaLcl1U
h9DyLAf9E2eodQBQPtSWpp/oQeX66mKXY9Miuz5trwlH8ULc/aDqCZr2ldZNAyw+
/nbjIw6qj/6AgTMSPMQ2AKav4oScFLHYL3VJz00dNm2TPJJ2oSkoQZvUsoO1kk2m
tnpNEBkUaIgvfGZuCM7axtiyO+tDa+nrifiPxb8mLWRNU7gGekB+1gYjPx4BgbzZ
INhwDq2GgnuF0JRzbaGWM8JNdYx/0qQljcfZkjVpZN25WhiCs5WJhYsaj9ug8C2W
MPbs45jyBC+IDIHQ3zvwsVSdUmd5t+EZFvi6zO4rGEFvzbJExTw6f2C8XB09GkJl
CD0JLBzOlMcRJzQiqvj+1d6s/jq70A==
=o/zx
-----END PGP SIGNATURE-----

--nFh89dfvhnNN9tDt--
