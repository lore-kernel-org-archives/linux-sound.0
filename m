Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0500642087C
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 23:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783467101; cv=none; b=PEPXSJSbiT+r2cQYSaAsa5Uk3B6sqCJI7brnV3yIYQSNzsQztO8sLYk5s11f7x8MPnp/qDyu5MNnviBIJZKrjSxKvddrad4mjmhFz6qsTpc80tA/eatu1+1FEeWcHffaPqblokfWYMraQ7VZUy0U/E54ci7T60d8qI5Xkj5NHhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783467101; c=relaxed/simple;
	bh=aw1kIQVnlf38cKPTISFyfQsBrrmdIXwoyEAS8g8pAjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cw1/JOg8jz3TRIT0B0ekRGOrwnhzyupjKnxinDWIhrawG9tbDELsWESrSylVjwBNhYtHUalPOuRg57tZmdBX50KvYy3LZ6RJw3dxTGlMcslpgbVEetxfPKZi1FeovSAd49lpTtklmnJka6ntmfDsWq3TtGYopzbniVD072O5M4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkeBGegK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkeBGegK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9261F000E9;
	Tue,  7 Jul 2026 23:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783467100;
	bh=trSFYpVv2VNiBf6lje5Vz5qpO7EleOw0yV7cl5hjdUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FkeBGegKjAfatOQq6SqrsJ3h18oUXTPdZ1tL2F0dUfQF0GdOP0+/mz9szP8SC857H
	 OMzV3hIiyJV5/N/eIpXfcF+Q+BrQfFSo0ZGcWG1Rhg2i2b7DUUisn/F9IdZudKlhMv
	 EjISh+8M8jqkFz+e6WsP8yT76N26dstjees621SmXUpOMVQpbMhoQa+X4Oow2zGO5D
	 GAoxkznIHLknrGbpNnK07+mNpkKI1B/L2GWbOwJy6I4OhmKtxkd3yYzI/W+YpnAFof
	 NQLKxwQW4a7z+q0iHem4mW6xRXOpg48SEF8E0Cx60Mo5ryeokyOnwT6N+ID0PJQN5Y
	 BjlpxofUTxc4A==
Date: Wed, 8 Jul 2026 00:31:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org, bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: Re: [PATCH 2/2] ASoC: SOF: Intel: Disable SPIB in both direction
Message-ID: <a8bace18-e805-4102-a744-0d3be38290e7@sirena.org.uk>
References: <20260707131945.3641663-1-yung-chuan.liao@linux.intel.com>
 <20260707131945.3641663-3-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pwOfsZ75UJ4UuVMZ"
Content-Disposition: inline
In-Reply-To: <20260707131945.3641663-3-yung-chuan.liao@linux.intel.com>
X-Cookie: Walk softly and carry a megawatt laser.


--pwOfsZ75UJ4UuVMZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2026 at 09:19:45PM +0800, Bard Liao wrote:
> SPIB was enabled in hda_data_stream_prepare() if is_iccmax = false.
> We should disable it in hda_data_stream_cleanup().

> -	if (hstream->direction == SNDRV_PCM_STREAM_PLAYBACK)
> -		ret = hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_DISABLE, 0);
> -	else
> +	ret = hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_DISABLE, 0);
> +
> +	if (hstream->direction == SNDRV_PCM_STREAM_CAPTURE)

This doesn't check if is_icccmax is true but upgrades any error from the
teardown to be propagated to the caller - should we either pay less
attention to the error or have a check to see if the cleanup is needed?

--pwOfsZ75UJ4UuVMZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpNjFgACgkQJNaLcl1U
h9BHTAf/SIvznhUNOqpBPc3GzVGmgFWyS38QIDt7b2vxW+rzsxK4viBHet/3pAev
v6anPUjo3bOl49MFPCMFZkyHywmiR65eeP1xaB1IOnXXn6XitsUB9Dvn/9GtaJXI
Riq92XZG4GDELVzR3s+7NrafEHhpeDteMRbwobbsOUp/ERRSt12kOQ+PTM6lMWJh
mp05ELZHLVvUntOzlCTYxZ0WBqY2Po+jVgeQ9Cz+pYAFjJDRN0Hor9MpKevF9dJZ
X+CydM1QkYG/vU5BjculsBWYxIeGblV4Bqe+OObU2RzgEE49UISOKJnGqn4riKwp
1AuCobVqBCf1IEZ4VRGFamFwxvaROg==
=wiyR
-----END PGP SIGNATURE-----

--pwOfsZ75UJ4UuVMZ--
