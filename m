Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528DA9443
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 18:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775759970; cv=none; b=FV+aC0sMrw8QB7YrgW0yH+cU9twh1Wp7pWCSP4+ElrNIUWQpFAG7y5jxPrlhUKiIZxGZBC9m0HJp+5voHW5wxSSZL/0k0TNt0CnTda6k9bndB2Jl5l591ZSP0uONxX8CCxqi1Uk3ivwWTTi0+lNeN0dR81Zh1DzGXobCjR2O6Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775759970; c=relaxed/simple;
	bh=4mGTCyJUZlGj1C9w3s+w7dDQFri4RxqVwpt+m9Tz7aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pPo172+x5MHvF+AcSb9pLL3EXlGcfkt7BF+AudovHeFOKu1N4PCO1HDsCbgIi0iM9n0A5WnRD6g2z/HIPZuoP3sMtOgon1VhXws8f7leTKFiC+ZHi5RVLRQ9JHY/xdlUF5CaOGqItuR4bHa5RUJrIc7+Bsk47bM5vxL4NKjtExA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNYnWuQ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNYnWuQ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3654C4CEF7;
	Thu,  9 Apr 2026 18:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775759969;
	bh=4mGTCyJUZlGj1C9w3s+w7dDQFri4RxqVwpt+m9Tz7aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CNYnWuQ/gxeinPm77wNoFnhRBZJm28aFzIR97eaEsxJL7qZUSYTUdbr2QDxeuVx1P
	 VtzbW2LaadoAsMthwtq//EPEsFpyq05vsAH/DAaWEBcnzMREe1dQM72CpYOfhmar2U
	 pa+FpP+aYwd6apqnBQ6/llpzthh4qshNh0ecullCUnPJkJOCyznpMAw+7hwBtXrbVN
	 JuiqBo3SU6Pf1CGe+6eNkTV7zJd9SSYh79Z2ydyNFcqtrFEL/iG5zc1dOKhW2ubsc/
	 x7iSPLPUGODcFIVGx1v7IZ5uq7g5PGe83iQGd1ov5saE80E16Rk1k2/BHJjLDc2iP4
	 2SahJ8M+RXugQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 305B51AC52C8; Thu, 09 Apr 2026 19:39:12 +0100 (BST)
Date: Thu, 9 Apr 2026 19:39:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	shumingf@realtek.com, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 4/4] ASoC: SDCA: Update text of FIXME
Message-ID: <adfyUENpWw7xHb-J@sirena.co.uk>
References: <20260409164328.3999434-1-ckeepax@opensource.cirrus.com>
 <20260409164328.3999434-5-ckeepax@opensource.cirrus.com>
 <adfc-q2KTRLIP3q1@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ek8151QpI/xqgrEe"
Content-Disposition: inline
In-Reply-To: <adfc-q2KTRLIP3q1@sirena.co.uk>
X-Cookie: Are we not men?


--Ek8151QpI/xqgrEe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 09, 2026 at 06:08:10PM +0100, Mark Brown wrote:
> On Thu, Apr 09, 2026 at 05:43:28PM +0100, Charles Keepax wrote:
> > A couple of attempts to correct this FIXME have been sent upstream but
> > the situation is not quite a simple as the FIXME implies. Update the
> > FIXME to include a better description of the situation.
>=20
> Please don't try to mix versions in the middle of a series, that is just
> going to confuse both people and tooling.  The versioning applies to the
> series as a whole.

Yeah, I actually can't convince things to interpret this as part of the
series but the threading means the actual series gets in the way of
handling the patch by itself.

--Ek8151QpI/xqgrEe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnX8k8ACgkQJNaLcl1U
h9BCpwf/a2pm6/I6bV841j0815YQbL2lrEXB3TnxGqKw3KXc+kA9nZ6WYiy2Zsc3
DsTdc3Kb8r1HG3KBOi4tXVCkhPMNMs2ZlaqE/qp4BqjiDPGAbl832NLOcz+g48R6
h2vyWlUNPvH9e30bIHZP4CHjzn/bLxQGZSkn71be3TMwDwL/R4IPH/d5HNwqksX8
+oRFA6vcLAnsJQaQL+Jzu+VItbK/h9KmCXQOlku81cAfxpIyxaTsek9gen1GPPw5
Vt/KGjFRLibxNmz8OjvlBWXTixEy99kcsGFcLHWb03gOPbCLeT0JbmR+tc+xlq4J
Fpm2HJohNMXjSlIw5p+/6dAd1wagTg==
=QULu
-----END PGP SIGNATURE-----

--Ek8151QpI/xqgrEe--
