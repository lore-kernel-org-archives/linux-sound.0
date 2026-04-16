Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5F52D0603
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776332624; cv=none; b=q7I5Bz3kboLaYsk3p8J9iD6rJCFprKs5kSM3T0t5FjoyYDviUMtrUQW9Q3nDtkmYcahkRJNyibgVS/B43Sy09vebfTaViS3eXq4h0H0buS+UuKI5o+BPmaQdenp4mtoINjIpVPfzmzz0Bo04ylIBChfa0Te+4byDvKGBiV71sfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776332624; c=relaxed/simple;
	bh=tH0OWVL/qzib9GH31QvCRrrr2zqaznoI/R2AAxaTOO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZS9XJ2YK3c9sU2mcQGRpmKLT4esia2Wfr+nvFy+QkrA/MiuD8CCc4kkRbL6PULZhd66pcVPykB/bd0CTXHNPt0d8k7pQmFDcmSY/O3IC+YXe1rRXmeWN6dHnF3RKggFr4LsQUAz6jljimb7e/ujr1X43x4lcvnFLpmN2i+v3Lsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edRzf2Bo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edRzf2Bo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F52EC2BCAF;
	Thu, 16 Apr 2026 09:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776332624;
	bh=tH0OWVL/qzib9GH31QvCRrrr2zqaznoI/R2AAxaTOO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=edRzf2BoniM2mwfijgNNrJ6AGtOP7v4XetXGwrjdzwKDuqDrJrzQyK1yQeVxkWmNY
	 Ay6xSBCrLskfrRY5upxPczhtx4mBVmuPE9lw+nE9lplm5gKijKlTnwwXuglYqEW9J2
	 KBrLy7+bO31xPCX1CLdq7vXGO3Nlqc3a4w4hWpvQK+JSvffWpnDCvq6WuvTsuLBZxK
	 gMXJfBp+BJPB28IMpQ00kIM8PvXAVP1f42XHNJFAV43apKNhvmShQzx/GdSlWPXsTZ
	 2eRZaLp3pTEwT5miw/x6f0f0+VESQhpx7w8X7V5+Z2cI6qgOAaEcSe9jd9geZQcpZU
	 GtUw9whEKFqfA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 58AC61AC57F4; Thu, 16 Apr 2026 10:43:40 +0100 (BST)
Date: Thu, 16 Apr 2026 10:43:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev, bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: Re: [PATCH v2 2/2] ASoC: SOF: topology: allow user to add topologies
Message-ID: <aeCvTNeUh1DK68Q2@sirena.co.uk>
References: <20260416053552.3464661-1-yung-chuan.liao@linux.intel.com>
 <20260416053552.3464661-3-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LOk/Ub2B3NGrlUWx"
Content-Disposition: inline
In-Reply-To: <20260416053552.3464661-3-yung-chuan.liao@linux.intel.com>
X-Cookie: Victory uber allies!


--LOk/Ub2B3NGrlUWx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2026 at 01:35:52PM +0800, Bard Liao wrote:

> +static char *feature_topologies[MAX_FEATURE_TPLG_COUNT];
> +static int feature_tplg_cnt;
> +module_param_array(feature_topologies, charp, &feature_tplg_cnt, 0444);
> +MODULE_PARM_DESC(index, "Topology list for virtual loop DAI link");

The description here still references index not feature_topologies?

--LOk/Ub2B3NGrlUWx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmngr0IACgkQJNaLcl1U
h9BTWwf9HRV4de6g11MPnAExY9C83GTZzPF/dyx4wDx6s3vNPLgQCviQfp2KlJNB
Ad6dfrY3nFUq8ezj5pNLGtWITIjd9JC4BgqaRl7VquQ0kdKun/m2ZWrjvHI4c2Ks
Js6UbP0WX5UqJsp7wi/ZOCXxxEqjQTQBUB5lATw+VM9gaOnGD8ssHUsEXI1R3TwZ
250VvJByI/9rRI4yEvPGQpLjlKIKm8mM6v8jDsTswJHlrcPENgFOWweM3moft4cc
zbheZp1TTE8WxfcUl7naLkCmKXSHyeI3ZY21oJs+wpApFsOuD5s0yJClQeP9fgmS
PUUEV4cAJClaAipFB2agrsoH6QaeCg==
=TP2k
-----END PGP SIGNATURE-----

--LOk/Ub2B3NGrlUWx--
