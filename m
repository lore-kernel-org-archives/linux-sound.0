Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE484288C2D
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 09:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279468; cv=none; b=liXOB4akrXVYSfMOCITrgo3JDjywoAhp1g0iiwahofPIvUhc7Fgm3hRZdSd0+R9w3ot/VwxmZWf91/5VNW45k+TyXsDd2/NWWPfD+HPxCk7+nh2rcxKEfCqDwhoS03pGEbUaUJVOOL7Lwp/uDvpwqjWJLD8N9XC8CQA5tQAe4vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279468; c=relaxed/simple;
	bh=41ttK7uj/ZU9SUufgbyDI+tDS0RvG4Pgrg5Mj6GFQUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AULTt4L42xbZ15fRlXccrM1qC1U9av1Njq9R0cpADdqUwrtqsqFGdUicqK4BqMbRuzC6DXWDTMil2aJ5hrwLASsQzB3U4HjwVSpzozoL/fRhfNfmHHEfrBglGuIt/RjScfWPLmKS3RX5bQ/rBETTgZQRnLCGJYcEHCEIuetGh4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U0GmNrjm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U0GmNrjm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE631F000FF;
	Tue,  6 Oct 2026 09:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791279466;
	bh=rIwctoG1s0IBrUTRTZ8itlsSKJ87OYxMf6QGp81aauk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U0GmNrjm5wC8ZIJ3bqjUyKP6qx+sTzq9I/3XIPZpf1C8y4afWTwG3+gcIilxkTZu1
	 DEsd3MApWqdgwRQEpULgB4KDlWx0lYMZhd1lKf9bWPEBTnqwFTCOIdJxieHhrdzUSm
	 GFYjRYEQVCfgc0acNnBUve73X7gsyvo4vxc7tqv45c4pUCAeh7vtZ5TtdTEmKX2Q/N
	 1Giv014CZ5Luum+SzRfUC9dIBjixFte+Eb+rH03AmfXQvRw1D9ei/a406Ge9L4yfkP
	 HkSbsOvHt9EoRLH4tIO8eOD2gCfUZaZ0trOGwrkLpHF/w/BgGEJxpoc7RlA2q7mcQD
	 x5PaPDP9Tzlsg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2E1F71AC57CE; Tue, 06 Oct 2026 10:37:44 +0100 (BST)
Date: Tue, 6 Oct 2026 11:37:44 +0200
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
Subject: Re: [PATCH v4 22/26] ASoC: SOF: Add support for IPC4 compressed
Message-ID: <asTBaMNMC2UlWaKC@sirena.co.uk>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
 <20260916120320.18318-23-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gCkDPuH6FDVolmHl"
Content-Disposition: inline
In-Reply-To: <20260916120320.18318-23-peter.ujfalusi@linux.intel.com>
X-Cookie: You will forget that you ever knew me.


--gCkDPuH6FDVolmHl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 16, 2026 at 03:03:16PM +0300, Peter Ujfalusi wrote:
> Set and define the compressed ops for IPC4.
> The initial implementation supports basic features: PAUSE PUSH/RELEASE,
> DRAIN and progress reporting.
> Tested with PCM, MP3, AAC and VORBIS codec.

> +static int sof_ipc4_compr_alloc_pages(struct device *dev,
> +				      struct snd_sof_pcm_stream *sps,
> +				      struct snd_soc_component *component,
> +				      struct snd_compr_stream *cstream)
> +{

> +	ret = snd_compr_malloc_pages(cstream, crtd->buffer_size);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = snd_sof_compr_create_page_table(component, cstream, crtd->dma_area,
> +					      crtd->dma_bytes);
> +	if (ret < 0)
> +		snd_compr_free_pages(cstream);

sof_dai_load() allocates 4k for page tables, the limits we have here
allow for say 64 128k fragments which gives an 8M buffer that on a
system with 4k pages is going to make more than 4k of PFNs.

> +static int sof_ipc4_compr_trigger(struct snd_soc_component *component,
> +				  struct snd_compr_stream *cstream, int cmd)
> +{

> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		trigger_platform = true;
> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		break;

Do we not need to do something to clean up/reset DMA on STOP?

> +void sof_ipc4_compr_drain_done(struct snd_sof_dev *sdev, void *ipc_message)
> +{

> +	spcm_dbg(spcm, dir, "Entry: EOS done\n");
> +
> +	if (spcm->stream[dir].cstream)
> +		snd_compr_drain_notify(spcm->stream[dir].cstream);
> +}

More of an issue further up the stack but snd_compr_drain() triggers the
drain, then DRAINING is set later in snd_compress_wait_for_drain() and
there's therefore a window where the DSP could reply to us that the
drain finished before that happens.

--gCkDPuH6FDVolmHl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasTBWwAKCRAv73Ows9A4
iSQ8AP9v5itZR/ycxwWouF7/JcRaECDH9M1lglTUmjZ63KoySAEArRueJ2y0t3bZ
znERF9UxpW1ttyuZZAIJCWIZihX3BQI=
=PljT
-----END PGP SIGNATURE-----

--gCkDPuH6FDVolmHl--
