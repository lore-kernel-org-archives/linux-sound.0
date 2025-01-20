Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791CBC2FB;
	Mon, 20 Jan 2025 17:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737395707; cv=none; b=mN5sIseGcFfUWiUJ+tiQfO0eFfQI91RIs5BUN+UxqIhVdp1kz5F8oWnYqmrpDLOdcYoA2YJRNr0hL9TddVlYeLqiGTT2QatxHPyF8hqISIYAT8qHJw8rNxqMguzdGEeqtokAMsfxKJtkz1IKnQxSlREf/YOGMv47YdXn+igg7gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737395707; c=relaxed/simple;
	bh=DWug9ITv7rRJWC7yGTnNtYq3b9rfkbk4rc/x/UXVyLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITldLp2e4lmCxNTptAC2VfHQGqPPe5RF06gTSbfPDpuNKaZHckyOJgPlEkH9womuJvXOEcA3WKd5SEB5njuEDQTu1buZdqqt8klfW2hAXbWaszSnWoJLz33IAMYL8+SGwJ8uvj0LB5u0r63rKDHX0VPbklfPAQ3jilfcNFl0SwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDdTR7mh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDdTR7mh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988AEC4CEDD;
	Mon, 20 Jan 2025 17:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737395706;
	bh=DWug9ITv7rRJWC7yGTnNtYq3b9rfkbk4rc/x/UXVyLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDdTR7mhPr6dTlULbevWycc7Ws3FLiIza2hCqOI0vtILVb6mx5Ay1UVTyXDeXTWGG
	 L3EU1uRiQNkLSUlJDvxnY9xztUYotsrkIWOo7j0IcM5OHGkqeCtt6yWe61Gvno+vVI
	 bIJeQK9KUoCPnzpXMhUAlJPsUNyv3N8RVVl1DBHP6JIGYfDsRjKsIv3EPbDquz1E6f
	 F87tsa7FH03jQ2ZHtpARwtgTYxYsRJDeCflGNJqwFX8dKiN0UHtDnKQ4gXkrE1jRCL
	 eDxpXepMd5b4n9954HDCznmt6SBIiiDRI2RyxCiah6ZSbT4NPMX94X/3UC4KJ1X4A9
	 dNKiPMzpd6KnA==
Date: Mon, 20 Jan 2025 17:55:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 12/23] ASoC: amd: acp70: add acp ip interrupt handler
Message-ID: <4d6cf5b7-8f47-4cb8-b302-c02f3b037d6d@sirena.org.uk>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <20250120100130.3710412-13-Vijendar.Mukunda@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2DACFp3PvTQTLorN"
Content-Disposition: inline
In-Reply-To: <20250120100130.3710412-13-Vijendar.Mukunda@amd.com>
X-Cookie: No lifeguard on duty.


--2DACFp3PvTQTLorN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2025 at 03:31:19PM +0530, Vijendar Mukunda wrote:

> +static irqreturn_t acp70_irq_thread(int irq, void *context)
> +{
> +	struct sdw_dma_dev_data *sdw_dma_data;
> +	struct acp70_dev_data *adata = context;
> +	u32 stream_index;
> +
> +	sdw_dma_data = dev_get_drvdata(&adata->sdw_dma_dev->dev);
> +
> +	for (stream_index = 0; stream_index < ACP70_SDW0_DMA_MAX_STREAMS; stream_index++) {
> +		if (adata->sdw0_dma_intr_stat[stream_index]) {
> +			if (sdw_dma_data->sdw0_dma_stream[stream_index])
> +				snd_pcm_period_elapsed(sdw_dma_data->sdw0_dma_stream[stream_index]);
> +			adata->sdw0_dma_intr_stat[stream_index] = 0;
> +		}
> +	}
> +	for (stream_index = 0; stream_index < ACP70_SDW1_DMA_MAX_STREAMS; stream_index++) {
> +		if (adata->sdw1_dma_intr_stat[stream_index]) {
> +			if (sdw_dma_data->sdw1_dma_stream[stream_index])
> +				snd_pcm_period_elapsed(sdw_dma_data->sdw1_dma_stream[stream_index]);
> +			adata->sdw1_dma_intr_stat[stream_index] = 0;
> +		}
> +	}
> +	return IRQ_HANDLED;
> +}

I appreciate that this pattern is already (identically...) in the ps
driver but I'm not seeing anything here that looks like it can't run in
interrupt context - is there a special reason for deferring to thread
context?

> +static irqreturn_t acp70_irq_handler(int irq, void *dev_id)
> +{

This really does seem *very* similar to the acp63 code...

--2DACFp3PvTQTLorN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeOjfQACgkQJNaLcl1U
h9C8gwf+N+6C3TIdqd2aoAGiIgYKEQPN6HeK6pCEQWOTG2gqxPytqX7AZs6WD+/Y
wWngTrcYBQIu0pBXFZXXAErzSbwkQ/ppzRBOLxlnQEQL4rvt5mlq3o4VMCOVwpz3
EZoZpKT+0JxZmpNtYQxPwxqfk2C0ouQ2eOMi5AMwfru/7U5H81Q4HmI6SXr3+wQO
BM01lmZWw+gBUc0CyWnxjS1fOqIxjabu/C220/rRkj3d5SzoYK56xuToxNxwzu8+
Q2GmIZVoLUE/IVdG3ObFC/Rs+xxkWGgQpx1fQ1WtoApxRBCUwFmoc292/kowBt/A
/xNC4BsPgJnpjsmr9UY1RWZnrW/2oQ==
=QkFS
-----END PGP SIGNATURE-----

--2DACFp3PvTQTLorN--
