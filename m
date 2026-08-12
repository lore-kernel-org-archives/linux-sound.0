Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E6B3FC5B9
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786543636; cv=none; b=lx3g5+cx6jjGcDe2RrTbZObG+YEQpQR79R2Y8V7SVcfRw6h6VIhiDshS+N65c2sQePJtF+aKbLqXJfBx95gtOjQL4SP/c8p7EokDXbNaZR3t2xt+EtyxZuhO9GqpvNITjRcMYQ4fa6V1sfBvgDO7hcwf0wYTAi7kHg3pJm/7h44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786543636; c=relaxed/simple;
	bh=rn39yzdR/nk+ZMTbpRAjUs9WIdWs3pK6FEX9wgyJqI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXr9/Pn5sZLwq4NETtrKnXWFmMpe2PaLsZenZvpUPd4kmpDYeoGE9BLJzZu2MPh9VxZwFkRm7HMG0ioIryUBx/7E9YS5fsURWvAw4OThObelt/IMlXuBtY5rabD9D5rwrj6ue+0yVyBpHpCJKwMJKHPmPlMwU/WAE91SjSa7MmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJ0RuQoC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJ0RuQoC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67721F000E9;
	Wed, 12 Aug 2026 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786543634;
	bh=rn39yzdR/nk+ZMTbpRAjUs9WIdWs3pK6FEX9wgyJqI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FJ0RuQoCiWTanGfOQ2PCQ70WYqqLrG5BgUcePU6ESXYB21kUuOYcOknKynWjwv5Tx
	 FxnuAXv5oI4JTkQjvVYSo+2vHeaBlV23qZCkamMXQMHZ6Mp0xwMTt6LSajpXkmvvyT
	 7lxZXLiaHenbQnzLauCoYBLp0Dpten5VR4Lp3fMi2idg4dosvHOhG4epCfHDKmNeyy
	 0bmHOYSZyMU1ANNVtwL+5WeKnGFKNm/jpi+zF9jBbDp1N5Met41MWFSUUbNyUHpI6t
	 jzJnKBwryVPf9wSPUmqIw7Lhsq4DBbvN0/U3C3foGdiGglGKOkvK9KfxSwlBZzW3ED
	 R69hcMb+ifilw==
Date: Wed, 12 Aug 2026 15:07:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 14/14] ASoC: meson: Drop __force cast
Message-ID: <fafc9a70-e19c-4278-a641-548cf976c511@sirena.org.uk>
References: <20260812060557.80445-1-tiwai@suse.de>
 <20260812060557.80445-15-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WmwprucuCiIfr9Uw"
Content-Disposition: inline
In-Reply-To: <20260812060557.80445-15-tiwai@suse.de>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH


--WmwprucuCiIfr9Uw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 12, 2026 at 08:04:46AM +0200, Takashi Iwai wrote:
> Now that the bitwise parameter definitions are gone for PCM
> parameters, we don't have to cast with ugly __force prefix.
> Simply drop a superfluous cast.

Acked-by: Mark Brown <broonie@kernel.org>

--WmwprucuCiIfr9Uw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8fg4ACgkQJNaLcl1U
h9CZDgf+KIOqWCwWPOkgsmYwLSRthiGFAh5XC3CfWBLmwOG+U/qsDcoCihYNzB6K
aYSm9WYD4g86LxYWCQnfmJeKbyY3U+rhEE9Oft1S2RBPHUP3fGCNtuBvkPE0cqIq
FiqsxVRwdiqTz1CM0fZSVioqHJbH3woEiN1Esa7Eq1gpIApRdkeEekCOYKy6byxf
p1n2STQiQMDUiGQmPDTIbJd4bO+9PtJBUWPPzl1XBsC0YyuXGVMGGAH+Bk9vWOC8
cdUPD5TPCtIkXRYLj/JGO5hzK6o4Qz/cs2qk4qnhRmZUpsbA2ZxLJ5xlB2Gq7pb+
00FnE2tBevlVh0G8v4nkKcD2VMFQcQ==
=ycMe
-----END PGP SIGNATURE-----

--WmwprucuCiIfr9Uw--
