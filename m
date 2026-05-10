Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD6C2F8E81
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 01:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778376324; cv=none; b=rWivOSnpiNjVC40kUrRqUMNklythxsu8RnvffCjuOMF3AkFLEX3xVhioRRpu0VfWWZJYCA5+O9oO6pqTtPvNLst6Ihc3ma+YnFFJDy0lH5k3ubhdrrfA3P1MU6yVbK569LujThvHZKKAZf38Jw/5Pdvymz8N8CTIK1K/7r3X8Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778376324; c=relaxed/simple;
	bh=+fSTWzSgvZHZRTkQMtfK8BXd/rdqxNY7xJPVCHohYaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaJwEd77xBG31mFsI9qiqt45Vl4j3Ebu8b+fVWar9QMHHDanjvaD/xqi4EKh7yynYU2ekkgy8maG85FoPgPCvv/8acNw0H0UqH5iz6t0WjfjUYb7Ds9NjmWXDPTQ+zNm8oDzjuQDsOMqmJT3zC9q8eTuLWQ0hQ+j6qfgrMEwWpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVHtxyvZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVHtxyvZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BD42C2BCB2;
	Sun, 10 May 2026 01:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778376324;
	bh=+fSTWzSgvZHZRTkQMtfK8BXd/rdqxNY7xJPVCHohYaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVHtxyvZZN/lPxtzS89qAvrTwsrWkagV0UXsIHOWpQLcdIUya6YyCss6wRwSSgRH4
	 CBkcYf2MWg2ej+QBnMseCQH2ctpB4Vw01WpjOeMiHiaSPMeMEt4LLdounV5Y/MOKtS
	 2AAvJMxHw69r3+uq58ISBONcnUdctz4z5cbH8R0LtuxOc8ru6g8JraNg+q8PlD3IKp
	 HzZZY89u2dB6BmcqZOJZ44ecvtdsB7in2IqbekC2Z4aeqF8j5Ykd8ElF+j9cagOHRq
	 YZ8EENDGJ/oqEWY6Fazl3h5cKE3W9+ktM8XUJDo8d6TTj9Wrt2xqL/pnhyDDxrtqm/
	 LI84R6/1Ti+/w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 375C81AC5897; Sun, 10 May 2026 02:25:22 +0100 (BST)
Date: Sun, 10 May 2026 10:25:22 +0900
From: Mark Brown <broonie@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] sound: soc: fsl: eukrea-tlv320: update board checks to
 use the DT
Message-ID: <af_egt2d3xwOJg8G@sirena.co.uk>
References: <20260509214622.38319-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wQR79ERn67QPs7uj"
Content-Disposition: inline
In-Reply-To: <20260509214622.38319-1-enelsonmoore@gmail.com>
X-Cookie: Truckers welcome.


--wQR79ERn67QPs7uj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 09, 2026 at 02:46:19PM -0700, Ethan Nelson-Moore wrote:
> The eukrea-tlv320 driver contains checks for ARM machine IDs via
> machine_is_*() macros. The boards concerned now support only FDT
> booting, which does not use machine IDs, and therefore the code should
> be updated to check the DT compatible property instead.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.

--wQR79ERn67QPs7uj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn/3oEACgkQJNaLcl1U
h9C6Ngf/VgpL6/dY6oe9kbIkiwzw7zZb5+n21tUveYgzPidX0a4toLehfaAR+hTS
4FJcIwVvXbleEDcEIkLVZQCUQV1FvUCz7HVW5wubSRGSRtd7UsQ5WANT95sjdBwe
xrrXCQuF4HEcQnVuyEI2Rt1CSqfwqPvMVje+aMVwm0I2F9/4rzMwSYbyNrC1i0Oa
ODWObnHyeFqscnD4awYCTj1LpwwMZ6Cu2NwbO5Ub4W9nAijkDJYQ9cHDw5t0SZYE
sXsDdxCz47BiTeLIFvgwmQZ3WFy5kce54ceig/KpYkFDaFDyYltxO5DNaLn+PvSy
am3YpHjAz2qx0CGRSWdpXdoHmLNp4g==
=c9YV
-----END PGP SIGNATURE-----

--wQR79ERn67QPs7uj--
