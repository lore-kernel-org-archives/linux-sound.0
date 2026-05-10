Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4512328C869
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 11:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778413487; cv=none; b=j5QrxWpNh0yqd/GVpN7o2BTchcoj9PXJvwO5h5XAXIMHlGZWaB9Xm/Mxvx7RdyYg0Nj1zNe8XgecXlEMe0WKtmjIv5yTLrIAlipWCmURfuokciXWhDu2SQLBP+iGSBAqxgbU9LqrmPV3e7pXIIcvZpaLP3MDNupB3aHc0N3fkDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778413487; c=relaxed/simple;
	bh=6CryNRjECli8e+1OJcSOE4FvC/A/tD00g74n7hSbcq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcdq9wjJ4J3Px63n4gB+i3LxYOMVKta2o/KpRR89pYIh5vUnm35EwNRA4OR6JpKO/t7GxlvSZpHtUyRwdPADTYvsBWiyXsEVfw1vYQCVvj4sXPJOk+rWBHDWNEO2BQ5b0JKBkuRjvyik32m2t7nlvxe9zceFyYehxZC10AbMG1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yx28OPnH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yx28OPnH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECBEC2BCB8;
	Sun, 10 May 2026 11:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778413486;
	bh=6CryNRjECli8e+1OJcSOE4FvC/A/tD00g74n7hSbcq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yx28OPnH/oChpyHMpsUw3zeB6sIW2MKZteOXcGEFKDWf8hJsEpnGciyzprtbCiZXk
	 DBowcx817YGCBIyFhTSTYYU+U71rSgYZAXiaOboqJZSvipXuECuXEDkYB2Q9c8rLp7
	 CpUcDoDe031qguRdHOTh1OUqQOH0SrNXcUL2f7+5/QoVAmSkzgyhf9Y/9j24OX+YK3
	 DdUP6MkA9Qn4wNpQAuhBMi7BuVOrE2m4KpX9R4VJr/oJZD8fVUNh37QX1okFunvclJ
	 B2rP64BR6Ztxq9NrhrKzGbD0zwT8oK2Pj5K4ywLEpsyb7+xO6r5sxL1NADeqgfWx6/
	 9NC6vAVko9Q+g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 387491AC5898; Sun, 10 May 2026 12:44:44 +0100 (BST)
Date: Sun, 10 May 2026 20:44:44 +0900
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com, vkoul@kernel.org
Subject: Re: [PATCH v12 1/6] ASoC: sdw_utils: add soc_sdw_es9356
Message-ID: <agBvrGo2H6RG1siz@sirena.co.uk>
References: <20260509101102.10286-1-zhangyi@everest-semi.com>
 <20260509101102.10286-2-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PXIEOyE3rLFuFkxa"
Content-Disposition: inline
In-Reply-To: <20260509101102.10286-2-zhangyi@everest-semi.com>
X-Cookie: Truckers welcome.


--PXIEOyE3rLFuFkxa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 09, 2026 at 06:10:57PM +0800, Zhang Yi wrote:

> +int asoc_sdw_es9356_init(struct snd_soc_card *card,
> +			       struct snd_soc_dai_link *dai_links,
> +			       struct asoc_sdw_codec_info *info,
> +			       bool playback);

Is this defined somewhere?  I don't seem to see it, the changelog
references updates to soc_sdw_es9356 but I don't see it in the diffstat
or the patches.

--PXIEOyE3rLFuFkxa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoAb4IACgkQJNaLcl1U
h9CjAgf+IzgMjMbe2TVDhyRoV9RSjqabuYOFvpdQi/ULsknwRKFQTAh1torOZuDI
4skhiVmtJakHsx8EwUa0nRSyUmx3iLSxKJ9b1O0LDsJSmIV9kydnEnB+Q3Yk180r
livXgGk360B5ClLYHepTKXucYwinBfUg1vVJMbcV0IVnLcXvrKcEsX8h8tzStVG1
n6ZmwAbi69iBHM2TuvzdRieyMJ0OjHM+AIbe+GDtpme4XtDm30af+X0pavHSs2uE
5/t0mF5j/B+PYHNseyoWsRBazqpshsHLE/DBPiKpASqW1NjIcG6esSV7jFlq17hx
bedhOLe3JU9NuhQzD3DDj/Efmomveg==
=rBkB
-----END PGP SIGNATURE-----

--PXIEOyE3rLFuFkxa--
