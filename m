Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B29917557E
	for <linux-sound@vger.kernel.org>; Tue, 12 May 2026 01:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778548553; cv=none; b=FenbBqemMT06UzLDusZwaij6YLNaTEBQMdYdnpiP3ZWSaVbtiDJw6qHI9bRl1Iazu62wqlSBjfpdBEUbqkLxZaP3e92HyGcBmJf7Yb7lJOxiKREIPoueHrDTmRn2tsR488GPqyoVMbb8uneuc4igsHd9zEFYEsjK4V3H75WnpJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778548553; c=relaxed/simple;
	bh=GVBnifAlVXSppIoy1/5SIHLfqTxnkXtgNOXlgBcA53s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YU2JmsCC/xWUNZzMqCTxh9CGTS7SBJ+IRVzOOGpt2HMF1rhlm9VPmSFHt3xgy7WohKw225ZK6CxPYbC/+pON7aNsliuEs4orluJqkMxi9PRSdiVTTXpD9IufuxPIHfajouo3lZuoEvDOsnoUq69F0NWR7uLYEQDNpYVrUMSnWDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fIb+u+eq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fIb+u+eq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C68C2BCB0;
	Tue, 12 May 2026 01:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778548552;
	bh=GVBnifAlVXSppIoy1/5SIHLfqTxnkXtgNOXlgBcA53s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIb+u+eqdzK1KEzMH3ocKg3vy9XgH+g/fFNSoOfUf9mdQLwb7XtOs55cdeKqU/xqd
	 ahM/kS5VwsZpZT/WTcN58CO58jw1emzMF/P2Y9grR2XsYSiY0bPbTA2e4h7AIOR5kp
	 rpdfkmBfOeIsmwYpkGFOvbc0ufWkCI6BySIjVqlWtxCq1tpoQR6gSOjh1InZwxvFAN
	 qO+FwZrmuXuQeHMbO7Se0jxcXVieueMoGGJoDq1z8JIYYTMpUBirIe4ze2fKeW2tQI
	 3P5A/hctMoKMeLjUVUKOxYR7zeYO2cC3E6isf3F55+9QFvZfGJWOuAJzXXhk6Ui2+d
	 4noJDUGOibqlQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 2C9E91AC58C2; Tue, 12 May 2026 02:15:50 +0100 (BST)
Date: Tue, 12 May 2026 10:15:50 +0900
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com, vkoul@kernel.org
Subject: Re: [PATCH v13 0/6] Add es9356 focused SoundWire CODEC
Message-ID: <agJ_RuRxHIEgF0tg@sirena.co.uk>
References: <20260510132321.14687-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lgllY2gxRriK1YSg"
Content-Disposition: inline
In-Reply-To: <20260510132321.14687-1-zhangyi@everest-semi.com>
X-Cookie: Truckers welcome.


--lgllY2gxRriK1YSg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 10, 2026 at 09:23:15PM +0800, Zhang Yi wrote:
> This patch chain adds support for the ES9356 PC focused
> SoundWire CODEC.

This doesn't apply against for-7.2 (or for-next), please rebase.

--lgllY2gxRriK1YSg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoCf0UACgkQJNaLcl1U
h9D4RQf/dIUSlzcSqCVwNecWht85HlIexTLCI6wX44DJ1bLWA6tEw1Ef/bO/lt2n
D8oCCzLn8kQiO49BeXgbEC+5wl1jnJae5DHuzQpMrBXvUZuntLAZcE1ruJPJrW/M
q2dYEwT+0mFKlMI3PPeF2gjrvLo1UIpU2llZ9GmL8/eySuSRrELIiSF6KlHqcOIG
Bn8AmsfoTRQyJ92PJN6V0RFnYIEVSO5XKbP5kyRYBzoibS3mqZSUx5mFjZZ1c0aC
00ksSYkd5k3LeL6HFhgNzW6WRXIhcRF2PSjbd2sptZdVR/3/412fNmx8QIYjIdE1
hPzcsSrVayvdjZcXmLKKIGJDr+nXdg==
=9sSl
-----END PGP SIGNATURE-----

--lgllY2gxRriK1YSg--
