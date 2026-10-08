Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF72B3914E4
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791454676; cv=none; b=bx0kg1uQ8dFjUqUqWBZYwsJhK19haaek0sJsseC+78hMeM6TQ8/Y/UdcglJOlPD1YX3RDrsZ/h/zdO4oz9ewcE877cVUWt7GcSy4jRAdpU/D6NnNdlwM2GCZAsZmWERlXiuVFM0pArVWRrk3lFWoWQGYuz+KNWj3Juh2r0kr7Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791454676; c=relaxed/simple;
	bh=MhF/N4eVz09VkeXj8JGypXcHNtmpMdG9+aq99+u/QRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pv3QydSmTroXXdPRX6mas4foHgSwD/S4HSKngb1xFzxNo+BiXFAPdLLMhldtkMkV861jgKjuzwDjlyU/iW3nmNja//kFORrkjt+g58dG9DfZDVjjJheefqWNZGNSA3kfWnnOxr1Kptn4bSxVFl5PYB9mLDV1JYZWJIlyRTJpsYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dR+SC9q7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dR+SC9q7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394A11F000FF;
	Thu,  8 Oct 2026 10:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791454675;
	bh=MhF/N4eVz09VkeXj8JGypXcHNtmpMdG9+aq99+u/QRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dR+SC9q7pkgEqusK2+T4qJBXqRbBxvmzTEnKoJxGPGdqCDJyQy2kCPt7fUF3z7CQ3
	 2p54ABoXf0LtE+58LX2IwHyIvb3oLVg6FHKjddM3phoSIrUzqYk3vE6U9lhicGdQ+O
	 vyFqlkxyep4GWfhYtEVnd2H0xorQHuCHUxqzLI1TZ3tHE7+1LZ3WqBoS0Aa4Qoc/cy
	 v7VRxioJyktOYl3BaRk6eRTT/UgmP1NvuQmT1sNE5QNoNxntDWoPq3ZQ/PhO9zP7E2
	 ytRleb/zFMizhnGp320mET2D6vJXbmM/dxEgn5bgLy39zFAU+6VTyzx9plmq5MQeyR
	 eC1b94XOSmegQ==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id AAA0D1ABD346; Thu, 08 Oct 2026 11:17:52 +0100 (BST)
Date: Thu, 8 Oct 2026 12:17:52 +0200
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: Re: [PATCH] ASoC: SOF: Intel: Make sure that link and host DMA is
 coupled after use
Message-ID: <asdt0K3W_YqErRUa@sirena.org.uk>
References: <20261008090045.15008-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SKcVXW7MC28nOMZq"
Content-Disposition: inline
In-Reply-To: <20261008090045.15008-1-peter.ujfalusi@linux.intel.com>
X-Cookie: Use the Force, Luke.


--SKcVXW7MC28nOMZq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 08, 2026 at 12:00:45PM +0300, Peter Ujfalusi wrote:
> Couple the Host and Link DMA when the stream is put.
> When the hda_dsp_stream_hw_free() is called the Link DMA might be still
> locked and we would leave the DMAs decoupled.
> hda_dsp_stream_hw_free() is not called for code loader use or in case of
> probes or trace use for example.

This looks like it needs a rebase - it doesn't seem to apply against
anything I have.

--SKcVXW7MC28nOMZq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrHbcwACgkQJNaLcl1U
h9C7Bwf/c3ht3cfJIyZ9zHDB+35EIpCGAE1QnJ8hXRnniF2VwYFbvmE+FWZh5joe
ya+q2Zkz3SHwOx7MViwJrXiYvF/rvHJ84Bh5A/FV2uULMxvZrmq4+8JH3MwBd9cf
igRL7IWs4ttNbjVlC/OaRGycyOho/aoOCdl9OSA/GoOLE8qrLs6I4PotUWDlggkA
MqULJn0NMCcFIILGN9rAKZWBwNLX+TDdZK+/CJgSNxXNk86f7WtItvLIejaOYBj2
qny+1PvaNxHj+1NfP/C4+1LXdGKu3LLWKj7uJo0dcceiql1uLenR2GSh1mIU6AgE
uCPW3Tz6dOQz+80nFGB+UJ+9mmmphg==
=Qtq7
-----END PGP SIGNATURE-----

--SKcVXW7MC28nOMZq--
