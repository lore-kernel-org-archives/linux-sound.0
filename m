Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AB738F929
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 07:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778742665; cv=none; b=DhEAoYesFgZxjIbEoQG15XsDdsolcHZX6UMoIPiQ0pxv3n7PvfKtGv/tS/TYAggYmSapf7AazfyRAfP5unikrrm+FTH8xG5XOX2uhx+nyB0cJQDCJAkrmY7FCzNmIx6NAy1E+x56mAYG6JWXrK0NZ8Twn4R45dyubed+yBnQylY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778742665; c=relaxed/simple;
	bh=05wDEadtXxgS288pmxKhrK+uFtixLGYDIo1T18Y8OqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQj44ffuKcfTgHoQk6Xccv2wQeGv3TtexAHllqSyF2G6iLX36gM4AfExeWkc0TL+IRuq0E80p9PUL/lhb3RpZt9i2ut13SG25hCTrAygctMBg7KPVR5d9VyETbqlSYbUX3pWtKLDyp9BmY9+R8hQxTX7FFkfea/b+egZacEe/sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aY/7WFff; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aY/7WFff"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0114C2BCC6;
	Thu, 14 May 2026 07:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778742664;
	bh=05wDEadtXxgS288pmxKhrK+uFtixLGYDIo1T18Y8OqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aY/7WFffqIpUfXQPaRd52eXanx3jSSUAtuVO1BlaNAaU6kxvyDbB1dmh/1Xn/Zkk4
	 N28cYc/j7T8wZPXhqXW4DYtrG4fZFYfOba2k7f8BivNtFPfIo0lxYs5jf5fc/bHQAH
	 /jNnL++SLMlU4e/ib6tAWDdLfp42lEp7k8Ht4kshO3GnU85V2DjgYcfBTmv3a31Df5
	 TVSF0hpYXFF7uKhH0efxUXpDCSO2B3+sW1BIchKiWBBPtj/2DYy9bZ9rReHUWdqgy4
	 tpx3NMOvXj+IScGXAwOpehDx7M3HVXSGC2NvF4nZa7arSVyneUogAnc0vMTbcV+yHz
	 FB510+EP9d3rQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 23C281AC58D3; Thu, 14 May 2026 08:11:02 +0100 (BST)
Date: Thu, 14 May 2026 16:11:02 +0900
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com, vkoul@kernel.org
Subject: Re: [PATCH v14 3/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <agV1hrh3bY-RdT9q@sirena.co.uk>
References: <20260513031554.5422-1-zhangyi@everest-semi.com>
 <20260513031554.5422-4-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="koRjedHCL9cc6yWW"
Content-Disposition: inline
In-Reply-To: <20260513031554.5422-4-zhangyi@everest-semi.com>
X-Cookie: Truckers welcome.


--koRjedHCL9cc6yWW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 11:15:51AM +0800, Zhang Yi wrote:
> This is the codec driver for es9356-sdca.
>=20
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>

This breaks a build with -Werror like allmodconfig:

/build/stage/linux/sound/soc/codecs/es9356.c:1144:19: error: initialization=
 of =E2=80=98
void (*)(struct sdw_slave *)=E2=80=99 from incompatible pointer type =E2=80=
=98int (*)(struct sdw
_slave *)=E2=80=99 [-Wincompatible-pointer-types]
 1144 |         .remove =3D es9356_sdw_remove,
      |                   ^~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/codecs/es9356.c:1144:19: note: (near initializ=
ation
 for =E2=80=98es9356_sdw_driver.remove=E2=80=99)

--koRjedHCL9cc6yWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoFdYUACgkQJNaLcl1U
h9A0vAf9GybDMdGeAQnik4/W8xuk/q9FEfUmk8zS9zktaeVKhxML/Tit1j8phbfK
BuCTJSF9lfJ6HbT1P+F8AaQ9j/ngnFW2XuEj9AKuk97goI/rwW5iP1ICepRi/mPc
kFKapekb76DPfuVTc2jg0f8XU/xTx5k2IW2jakdvIxP48K4mESenxzSrctVREUUu
JuHl0V+OSP4ap9aBqSHRfKslwEBDXWg1d7AiLZd+gT4Mq6x1t8QmptwlNk1XBgyy
is38N3p3QuWY044ruxEXsSiJthPRjebM9mAFuem2QUy5Ypq3QF24HLsA7qivWdx0
BUeUTVE+/5lhxv58wrz1TRBjxEI+KA==
=grAU
-----END PGP SIGNATURE-----

--koRjedHCL9cc6yWW--
