Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106894;
	b=rQ7xEGQJPxyU+TJDIvzT9HTusuCD6Q0wIXEe3SvntevZbBInpgS0Ga89vZc+qCZwk/mf
	 JsBmMNMTJmB/FWiO15LbvhuB/lznsgf7v3fpiUoUj0GFwIkCjrlsp1h6b1H6ROU+4wRH7
	 iRtN8fgHVnroelLmCIJY1XOEQlwZhJxZyrbTjwTRy3+WC9twI0nQihzqPgRPPb41pRLuO
	 ijAboU5rlzeTNA6WgiceDDDMAqAXQPnll4dk5kW2CTi5ACKRUI5LfjfHFn1LhjNOQzp9b
	 yFc8CVIB0/ThtIbjmUEAs5Q4BfxTV3ccdxRpioQ76LwjobkOKKLz7Z3ueHCV4t7yRjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106894;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=6MTeeMjiKvPYEiHar5SJs3Of2rVy0Wpc92pv1HGMRUE=;
	b=G1vlgjRFLF42RH9rcn0xpx29ANReW8HXx4S0WdSMAn8lkeqsxLSgTC9JCZCoootaackG
	 7gXxPA9aTrvJtuixVG6xpkbcb8X3lS9OcQn8fB6IP6pZDpm0GSMklHJtE0zEOSB12j7iO
	 64mTyum5sOpfxfIZhKsjg/kKGMe9pzHB1YZXT6DgvzUqA8rx4DZK1mlnkaXxhso0/SzaA
	 lEgQ1wdhKz7UyAKZglPsQ5mehwOaEXTfGt+Uh1pc4qg+eIOgLfViG9FgOjexoJc5yIiqr
	 0EYuoh2dLMnWyp2AagiHu9rYwJLeLLzuFc5eyOzwkMBt4B8pF9fiXBqJAOruFWok9bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GfPzmix5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784E9606A33C;
	Thu, 19 Nov 2026 16:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GfPzmix5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7091F000C8;
	Thu, 19 Nov 2026 16:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106894;
	bh=6MTeeMjiKvPYEiHar5SJs3Of2rVy0Wpc92pv1HGMRUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GfPzmix5+ZgeKSMhUaEBQy6CtEhNStpxk/1x6t29PxiN8M9q+VEv7T/EUB2yRLc3Q
	 n2ND0wF6dAS2OMxYfGrV+PMEGeKBTr12J8mwzwSWJpiIgSeIUPo8Fv+zCy77EupFCC
	 m07y4CD5eCpUQGRRCRGO0pW24a7bP/gk//TD2AsRlmoomCzxd2FHlfsvABwFnGyFRC
	 pG+t4a2zYPtJbsVe9QB39FjMQnyupIT0RbG/ouHMF5g2QafoIPETTRLESDHQVl7jR5
	 vWgJfWlVb0GSNaJNy5NjaiC81y8YIntG/s5/YhJu5do2+yRAzUgLOnZ2eEcZL9zMTn
	 JS/6r/8TGb0dQ==
Date: Thu, 19 Nov 2026 16:48:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, patches@opensource.cirrus.com
Subject: Re: (subset) [PATCH v2 1/2] mfd: cs42l43: Add load detection
 register needed for cs42l43b
Message-ID: <22f5f813-79b1-41f0-849c-263224c651c9@sirena.org.uk>
References: <20261112141650.1931348-2-ckeepax@opensource.cirrus.com>
 <179510674408.77674.4732953853855712916.b4-ty@b4>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kdJNOwK6aSR4xlgG"
Content-Disposition: inline
In-Reply-To: <179510674408.77674.4732953853855712916.b4-ty@b4>
X-Cookie: I'm into SOFTWARE!


--kdJNOwK6aSR4xlgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 04:45:44PM +0000, Lee Jones wrote:
> On Thu, 12 Nov 2026 14:16:49 +0000, Charles Keepax wrote:
> > The headphone load detection procedure on cs42l43b is slightly different
> > and require a register that wasn't used on previous versions of the
> > chip. Add that register into the driver.
>=20
> Applied, thanks!
>=20
> [1/2] mfd: cs42l43: Add load detection register needed for cs42l43b
>       commit: cc29c6e45db7b4306efc7a76e7a64d549229d4ac

Can I get a tag for this please, I need the register definitions it adds
to build patch 2?

--kdJNOwK6aSR4xlgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/KEkACgkQJNaLcl1U
h9C49wf/R6Ww/DGkch3RfMGR3hcVhhzRqx2ng64kjDWw+E551DEO7XxFcAWExoO0
VP61yVOOLa+81gnAbWmNQlbz2509qa69dxiKllQoRLU6v/Fwab8su1rGdHKoOBrc
jzdAQOM6xtrkQhEDVF+Or/VrtVmAjDTd7pS3T2rcu4N7j25b0/M3ZmrsoiwQesf/
hYgD2Gq6fyl/98YTTW3FLWJPl2kwrKidwSTopXqwNcxbvVABKmaVBcWYrEZv+XaR
1KCAIz73rGE/KDYVS3goJRNq+dyC3OENtnBsUggLg9L3CZ+DfNQHCV3BkczTrqoI
u59Rku4wYWNolCET94kcOVobMRH3ww==
=pkNo
-----END PGP SIGNATURE-----

--kdJNOwK6aSR4xlgG--
