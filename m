Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71863FB7C0
	for <linux-sound@vger.kernel.org>; Wed,  8 Jul 2026 21:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547911; cv=none; b=Fd614/gdqozvYWL43PYbAqmwfM4jmRZB73LOf7PLn3PdS1aKwxoXBlWY51sfeT5yrLCFljzwO3J2IqWQxomG7S9+pXA4TO3wV48+esntHaukqbnurXpKciz9KfeYwzsRWJO9PRD5yEqMqF2hHeGH/xR5sbSwC8erDLmh+VgJdjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547911; c=relaxed/simple;
	bh=b9cy0ykreZDTvDxQUGNLMXbfQLiW1OvpCZdwy+CUe24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OavWyjRgB02lkcX3pfDV42Gz1KECePtHTXrsdSQWl6QVOIwplpgOIn2T0ekD4RDTfpCYWRyz/kxg6MbosV+dmJMbuYIDht8PB0+vD3ckL5rtsz5klKu8/JO/Xcmi9TwaLKvBdMCuJYKUx+1neGcgD0le6+80K02jw5txTneGhKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbSnPVmy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbSnPVmy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002BA1F000E9;
	Wed,  8 Jul 2026 21:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783547910;
	bh=b9cy0ykreZDTvDxQUGNLMXbfQLiW1OvpCZdwy+CUe24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VbSnPVmyTsZQXfW+EnNJoCh65l08EDVFRZac4vlgJvASD4BzSJoUqgsUiYZe4fcgl
	 lZF6TU/x9iAl1e5AXFkhMmF2aK2t9Mn5FDM2bhllJftyseDTCumFaU3Z187iHTZodt
	 lwZ1/fRKVM6/4K1wQfZt/8Q5a8Ol3j1ssOy4/p/bVnEK01SAoUExKaFHK6g8nG0TJI
	 XjTxqJBWqxNyRsg/kNOpo3ShqnrDO9OSJMt/29nBmC4cCrumKVYQSP7tbM6l/gyXJ0
	 lkJhAe3Q/o+y+7c7YPG6cL+YhVSHorUB/3jqJ6W8N94NL/fDlNalpx8DQST8AX/ffE
	 xdyGITwFRgnwQ==
Date: Wed, 8 Jul 2026 22:58:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 06/12] ASoC: simple-card: tidyup
 simple_util_parse_card_name()
Message-ID: <31ad1725-1a16-4f98-bc74-43955afdd13e@sirena.org.uk>
References: <87ik6yxj0t.wl-kuninori.morimoto.gx@renesas.com>
 <87a4saxiz0.wl-kuninori.morimoto.gx@renesas.com>
 <875x2qgj6n.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2rqk93OsrsaqKqKC"
Content-Disposition: inline
In-Reply-To: <875x2qgj6n.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: The other line moves faster.


--2rqk93OsrsaqKqKC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2026 at 05:10:56AM +0000, Kuninori Morimoto wrote:

> > We can re-use simple_util_parse_property() in
> > simple_util_parse_card_name(). Do it.
> >=20
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

> Sorry to bother you, but colud you please ignore [06/12] from this
> patch-set ? It has been determined that this patch will become unnecessary
> in the future.

> Please let me know if you need v3 patch-set, instead.

No problem, it's fine as is.

--2rqk93OsrsaqKqKC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpOyAIACgkQJNaLcl1U
h9Dmtwf/Wnqfp5j+/FED6QB57RYSPDfvnRZCiGCeWXo+VdVpnjycL5X+byxb5JP4
5XnzfSq43K9w6LnprR9I8Q4GyXHkRCdTTcGutUObvbunZyvNCU+PygZV4XbMbD3f
HQdHGLMKCh15SIsAdJCKLrK7kH7PBXIOqdq+/fgg/ca402XSXFc1XUWCCO5HMxpn
uq2auEcPuF3zzJtyNg50WmzbFyEU/Y1UFs61hZhefyC8QX+FB1qAw/a6j4xdJfLS
9qPsJbv02ZLBORK3k27zn83s+DTK/e0fs0AwNKCcWNnqu4bS9811BvhVdWBUzpqm
EusB8u3y3KVJn46lH03/NIiopQWflg==
=t/WX
-----END PGP SIGNATURE-----

--2rqk93OsrsaqKqKC--
