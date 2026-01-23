Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EB722D4C3
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 16:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769185646; cv=none; b=h0kPu/IIdi0jdeWEsI9JE9HRRqqZc44Yoe4dqX3EonLzYiGqPy6oUsBvk72o4m2EY84mbdKlS6zXioJPXMU6Ucp6krk71ABjb7rkrWyVIK8ufWgHtN3Mi5Zd8re8V90dWDqdiIdAFBJEwX0/3Uivb2IT557JEdiyRIPAomlXikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769185646; c=relaxed/simple;
	bh=6XIilGZjJs0Ey65Kp7afVIn9czMzbkPNRf79WUrVZ3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8vEQQvS4PvkO5K9FLSlsbZs4kjGe7C+CK7CNH+OoB8Xm1n9lErXQS76geh4pyskovXNyv/7Py6gzLO7uXGlp5JXk6kPguc2DHRnKdSbAf6qIgqdCRxsQyeLogDRVIDfNRkSp4SheM+XpwGtjIMq8O30DxxVJWelTPRxWn8/QjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJJNUtVe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJJNUtVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874F2C4CEF1;
	Fri, 23 Jan 2026 16:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769185646;
	bh=6XIilGZjJs0Ey65Kp7afVIn9czMzbkPNRf79WUrVZ3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJJNUtVeBfxJveYpAzsvtipweOns10DYwTmU/YC6SOZgCnFF4OR+7OMma6bsQGrov
	 PcXb7iTGPnH79KPS95Y1JH3ifpe1lJvcEM14To7Zv4DnTVtp8SCTgh9q7WVw3vwrXO
	 RFhcejDkIJBIh+K1UcgmfABBIupSE/20GicK3L9VIoGyt3RWgaXP7WLRCyfsayAx5u
	 ZzDzYQwEBjJwY3O8zFaJ5dWUUIchUjHWSgM8y9Q6u9MuGKi9OPNJBwB9FxshonfPvy
	 uSBwqgejXqZmuDKCBz8orMXL8AKTgaMDLaUTbaRTEJRlh5VhaIPSdWEoiOWXy8GtAW
	 bi1RB+I+RApUg==
Date: Fri, 23 Jan 2026 16:27:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.19-rc6
Message-ID: <b0b9125c-e5d1-4fed-9092-020cb24652cd@sirena.org.uk>
References: <b9a26fcf7ebc08d3deb132f538a592cb@kernel.org>
 <87343we1n1.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aW3ihZDIyNwCA50D"
Content-Disposition: inline
In-Reply-To: <87343we1n1.wl-tiwai@suse.de>
X-Cookie: HAIR TONICS, please!!


--aW3ihZDIyNwCA50D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 23, 2026 at 05:26:26PM +0100, Takashi Iwai wrote:

> Pulled now.  But it slipped from the PR I already sent just today, so
> will be included in the next PR for 6.19 final in the next week.

Linus said he's doing an -rc8 FWIW.

--aW3ihZDIyNwCA50D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlzoWkACgkQJNaLcl1U
h9A1HwgAgJIX8dXbiIQ35u2kmzquQVNFFG5doq1GqpXelAx5Y4xBp0U/U0GbrXBw
v56bhCg8wDIYaFN1F53+csmulUIzMOearM4oRYNVuC7evekHm0MEAz0dQrFWzuth
mKo8REup+qRtJ9Y7WtjRjFW9X5t0DPVeFacVWPpBUxlmvpKSqSRdh5wpQywkgCSV
nQgO8LPP+kutfVnREKiCJzn3WqCfaNwfCSLKPQMpK+3ymIVDtxDmvLhkZFKN+GjO
0vIkUWgBAEZnyJrzqif4hpnFtn3WLoy0gnwZWSTwJH/aXYy+mrWfSMKdIKNQgxBC
MjTH8Q2nOj0pq7jiptc1XTPJzhSUVw==
=R/Zm
-----END PGP SIGNATURE-----

--aW3ihZDIyNwCA50D--
