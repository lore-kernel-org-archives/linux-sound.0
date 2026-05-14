Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FABE1531C8
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 01:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721259; cv=none; b=JisfECtsu1LVYP76ZG0Hh/yLTQcu5IfuNrVpwynvmWRL3Y+PfogUJD3owM4q0z+hMeMTdeAdtTiwiWfF25DHB1kd5+/6ULJULYBH4+xqYx7bpFDHtWjPePxJBL0lTxxAO4/8VXfuwURJZ053QFCxXnq2n0YocKbJhlWFZrDuSN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721259; c=relaxed/simple;
	bh=hDaYlWJkvlGsHmChWyRwyDqWlCiFCNO6SNMjlIL7epk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XHBfflCGNLo1JPx3K05ru5fsbUFwNDxicheBgeskNvR2Ca0WZqq2RTiUmyweNn+16A2aBSOq0bYX2ERaYRL13AYL8v99chn/wKc29kT5bQ9i26NmTWmBctnV2Xh7Wn/sGElM8q5vHiB+xi3Q9rCKRLgDFzLEVTjM0o86qrlWZkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0OF8jTZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0OF8jTZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CEFC19425;
	Thu, 14 May 2026 01:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778721259;
	bh=hDaYlWJkvlGsHmChWyRwyDqWlCiFCNO6SNMjlIL7epk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0OF8jTZsRMpTE6oVrQnC/bbcsqZkUs4BHk23y3Rb7AUy/zGOkWOjZKmB4Jhrgw6R
	 GTmiOjTZkGhP8Ull6U8NyeODuOrOFJk466e6y5o5nmQTvrXakOSy51REno5B7k9Dki
	 sUyQ2sgtD16ZPXpnzngyuP2xKEUbYqe4uy2MdZ5/8GFuTXYUr8OnTv/V6bCsz1JXac
	 lRoMHy6Mg2Q9iVdS9SeJMa8QJjCtgIhdEzduviVQkb9gJKtUjU2odMGuAcdmfjyGgC
	 ZbOCADt7Drq479jXFn3u60qlHqCOzLzTMTDiCL2Sr+zGIORKPhgyEvKbc6V/hTB4DT
	 q0Hc8KzKp8XKA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 93DD81AC58CE; Thu, 14 May 2026 02:14:12 +0100 (BST)
Date: Thu, 14 May 2026 10:14:12 +0900
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Zhang Yi <zhangyi@everest-semi.com>, tiwai@suse.com,
	linux-sound@vger.kernel.org, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, ckeepax@opensource.cirrus.com
Subject: Re: [PATCH v14 6/6] soundwire: intel_auxdevice: Add es9356 to
 wake_capable_list
Message-ID: <agUh5D5LFxanFSHc@sirena.co.uk>
References: <20260513031554.5422-1-zhangyi@everest-semi.com>
 <20260513031554.5422-7-zhangyi@everest-semi.com>
 <agSbL_gdW6og_PXe@vaman>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="01pISRidLfRK5R9+"
Content-Disposition: inline
In-Reply-To: <agSbL_gdW6og_PXe@vaman>
X-Cookie: Truckers welcome.


--01pISRidLfRK5R9+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 09:09:27PM +0530, Vinod Koul wrote:
> On 13-05-26, 11:15, Zhang Yi wrote:
> > Add es9356 to the wake_capable_list
> > because it can generate jack events whilst the bus is stopped
>=20
> Does this need to go thru ASoC tree, I can pick it up..

There's no dependency.

--01pISRidLfRK5R9+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoFIeMACgkQJNaLcl1U
h9DM8gf/eQio0v3w6qc5pKOq6b8/lxfk64Zkrlc3xJ8XEt+9tc4NA39Iepsc0QSr
kUOHsvNtNSlprzt7oEDgthNefK8yYR7KPXiZBR1+hmuvUY9ic3dpMspNDKxUJ9tY
mZzjJILgtDAByT3evrtgSRvAEbSFYl8ERBVThFj8JzLbGsWRFdq0AJE7iA0xMw6v
A6rLFye7/70TUDDhjh9a5zaK5wRMVtguaXd1/I2PDHFnruLCS/tTc4tzF8QnQ34I
lt1jSsr0F848g2dzETZvrWjszV8hSmU9IfyzwXHMsHHiTPDwfxTHz4klhfiH4A11
VP3IHTq641Vw9cYSTtb9FpgOJaLI/g==
=JJT0
-----END PGP SIGNATURE-----

--01pISRidLfRK5R9+--
