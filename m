Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26603ACA59;
	Thu, 11 Jun 2026 10:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173287; cv=none; b=W3F2F/YjtDhtECfpiaZ35mrtIqchJJio56n5PIfsTPxAbjEPmZps0GlR1e3NvoBAHiKJrjMUSQI0u6yTBEd8VywMdWRwkirmExHvBVxS3EsJJJALb21frrYcvMHFM8OzcXeVUqdXyAwVVjq6GyHpBTPr/bkZ/VYLbRkxNCQRta8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173287; c=relaxed/simple;
	bh=s28oxA185EbP3iCcOMDczCIuxnixbz7tW7J1IgpaELo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmJNOmgo93Is5gzi5dhAAJLYijvopKwZ3mgLVq5sItmryvs3tFazwZEem21+JKn/ZAyWMjebiCmzINXQ9VMbXEtDh2GAX+X3XN4xRC3uevYDI6VnjQZPgrFZUnPY+KsFlbrS0x/1WnIMQjT1sn7cV2Ai0EXtlep3MhzgvdF3DeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jP+7Ploi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jP+7Ploi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529411F00893;
	Thu, 11 Jun 2026 10:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781173286;
	bh=FlyYJaEQuF6FxGm+1gu6fL94QSNuO0HFiJ4u7Vpwv8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jP+7Ploi7y7cgeHuHvQa1aoTn3G4p8nTHe2dAjJnw3yk4SaMokIRbtVsB3CDM8Nkq
	 2yNzfcPqvo5Fp9+0E4QS5IBgXoE+okVU1jBj0BAM2MdexIGieKBTf91kUEzNENdsx7
	 1QG7rUrIyYi0VbP4aGiCH0XZPXHYtJnW0WS2ouFXaJClTeLj5ek9K7INSJEDINg/Yt
	 rlvAU8oC5LU2/nXFSYcgVaDL+PhBfQJHTg/Amx6+6geammMnk3pftKeKCcChjtOkr9
	 YJ0ynJ+ASJlpUPOSCTnIXQ8J9BIyc9rCquIhTRHtLa5drfG6B29A4foGY1OeSuUu3j
	 gfAaRYt+7S+sQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4C8841AC56C6; Thu, 11 Jun 2026 11:21:23 +0100 (BST)
Date: Thu, 11 Jun 2026 11:21:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Li Jun <lijun01@kylinos.cn>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] ASoC: loongson: Fix invalid position error in
 ls_pcm_pointer
Message-ID: <aiqMI4Aejt-cUZMh@sirena.co.uk>
References: <20260611010045.3668574-1-lijun01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AEwz7Ppn2ti+CNa/"
Content-Disposition: inline
In-Reply-To: <20260611010045.3668574-1-lijun01@kylinos.cn>
X-Cookie: Leave no stone unturned.


--AEwz7Ppn2ti+CNa/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2026 at 09:00:45AM +0800, Li Jun wrote:
> The "invalid position" error occurred when the DMA position descriptor
> returned an invalid address value (e.g., pos = -1048838144). This happened

> +	    addr > runtime->dma_addr + runtime->dma_bytes) {
> +		dev_warn(dev, "WARNING! dma_addr:0x%llx\n", addr);
> +		snd_pcm_stop_xrun(substream);
>  		x = 0;

Sorry, I shouldn't have suggested adding the _xrun() - it'll deadlock in
pointer().  I'll fix this up myself, no need to resend.

--AEwz7Ppn2ti+CNa/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoqjCIACgkQJNaLcl1U
h9BQ9Qf/a5Y5JXXzbepUcyyCIUetRO9fTOSMgDg9ESL7rJxx4YtKJofw8toeIkcy
WstdsDObpHeIFF+ELB5aagTxjbY+IZh5B6Q6PU+jjP0a0vRVuMX3tDrHH93lV/K+
/BFIi0cVngp3jfzP/hHJ9KEead/DouIZvyNO8AeaG8cRmsxbQd+3jNwJzajf6InQ
W6mc4xf1Ylk1Olj9awJcEspomX8IFWvZNgA3vQYqQUyScsgJFP8A1g2M0kWqFSrW
ie78GV4X8pu/zKp8GTrpDj+WE8pD+SxWXUuQg3Z0tr7SxiCuQAl2HSUI0xT390o0
QtNKe+IC27CoKsRhBG6uIPTKGlcm0A==
=nviI
-----END PGP SIGNATURE-----

--AEwz7Ppn2ti+CNa/--
