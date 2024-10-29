Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34513621
	for <linux-sound@vger.kernel.org>; Tue, 29 Oct 2024 12:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730206264; cv=none; b=gLvd6PFJ40JTWrb5jz6EHuIu+qYw99DXD2slLQ7TQ/kZC+KrRbLWXDRo/VRX+fllycuYt9G244detfdgPrtvIWl12/dj9YRj+416c9aNs8827XKuQqlJ0FwnQNMNK3v4KB6Pa8Pk1/zH/kHVGKlemzByGJxJUAgwHZ+MR1WZ4z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730206264; c=relaxed/simple;
	bh=xH2CMMFqSLKMd0Tqh+sts1ypcYbz4BgYEKnYl4eRMaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLnYvxMqvEUCsgpPAyLufAlUefjhNIcvq5EH91t0011fHqux8D2jGTCnzk5lnsk0+8T/GlOP12yxxFYsOpx+ZiNt68JydP6v+SblUzj0+GdJMN9fU7yw82l6swqAhvKoqsr9T5+y3RDZvZ3VLTIT7FMi9fGcvr3Nh0vYopHRh3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jN+aAOis; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jN+aAOis"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3ECBC4CECD;
	Tue, 29 Oct 2024 12:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730206263;
	bh=xH2CMMFqSLKMd0Tqh+sts1ypcYbz4BgYEKnYl4eRMaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jN+aAOislgsiZkqy8L7fbHRyZz+NQOBV0qJGY4pzMJkzCJcjefelD9kwVP+8zWCnR
	 4KjNTSaizoBKtJVtw8XuCzkOV0BxYAQPJWMV4bepj/tARQ7Jhbb96BW2Rh37s3uFBU
	 y1ix+JSyP9enJMR0BHIpOHTlrT8LtGBwrxWMeYljZytRUFN5p+AFq8PxZkTApo4hoP
	 WtxAxBIFbvOxjm3Rg7wjhm5Or0nKLcODsK6GgatXr11mJFXBojsHRPNnluIB39G4MY
	 QS2yYfDWq/Azm4HEInOXntrCXH82kuOHd7Sn0NBMSyqBVR889/6kZI+MYoDrHj7AGc
	 H/vAn9ph/tF0A==
Date: Tue, 29 Oct 2024 12:50:59 +0000
From: Mark Brown <broonie@kernel.org>
To: "Shalini Manjunatha (Consultant) (QUIC)" <quic_c_shalma@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Raghu Ballappa Bankapur (QUIC)" <quic_rbankapu@quicinc.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"Krishna Kishor Jha (QUIC)" <quic_kkishorj@quicinc.com>
Subject: Re: ASoC Kernel 6.1: Query regarding dynamic dai link/dapm
 registration during bootup
Message-ID: <aa1a8eb7-685c-4aa7-b73c-640bbcebdcd5@sirena.org.uk>
References: <MW4PR02MB7266556C7EA581EB90AE81EDD44B2@MW4PR02MB7266.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b1KLVv4xEzbzkh0+"
Content-Disposition: inline
In-Reply-To: <MW4PR02MB7266556C7EA581EB90AE81EDD44B2@MW4PR02MB7266.namprd02.prod.outlook.com>
X-Cookie: May be too intense for some viewers.


--b1KLVv4xEzbzkh0+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 29, 2024 at 10:35:08AM +0000, Shalini Manjunatha (Consultant) (QUIC) wrote:

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> 1) can we register sound card twice during bootup, once with limited
> dai links and next with all required ones?

You can certainly register a card driver, then unregister it and
register a new one that binds to the same firmware?

> 2) can we register dai links/dapm dynamically based on use case requriement?
> 3) If it is possible, could you share any reference from any other vendor who is able to achieve the same?.

In theory you should be able to dynamically add controls, but it's not
something people really do at the minute.  You'd have to be careful with
locking and make sure that your userspace can cope with things appearing
dynamically.

--b1KLVv4xEzbzkh0+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcg2jIACgkQJNaLcl1U
h9Bk4Qf9ENT4rpQ4sGRuPWeviGEqMjgdAJRmCgmPktLIyvrE4O5n3RMEAKvu09Ds
pigNtDBEiFUHeAHhfWuDffWDf9G0Kb+uiriSxk09K6MGvnp/wFXzoTvgs1yIMOSO
UBye7FDFxQBZkJa/nkJmrEe0q+C1vZLPgKG++BWGKGdHtWTG4Vxv7/q/wm92xnj6
yRFgwSV9fBIfbUNe1/Ac7JMCYQfarSxuP0AtYvL6GSAG7efaV3MYQ+0N08N6xJBT
eqwpUSK7yx+HHPu8uNYf97UZRVlTH07behQcWfZ606RWUTk3PdvNj6fLeNsnHkA0
Loz2a05AxSnIG14Sl/m+XIPMonxXxg==
=YqSQ
-----END PGP SIGNATURE-----

--b1KLVv4xEzbzkh0+--
