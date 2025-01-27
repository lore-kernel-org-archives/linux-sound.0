Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4061547CC;
	Mon, 27 Jan 2025 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737993290; cv=none; b=VeI/yqLwz/4gPRwqIrFmck3OOiBrwoAfy/+Gopc8Nw7keJkoqAmXkDrgpy/4TmRvX4hgQv2N/5GjpD7Q0Xrri57HEYEP66/V/cQ1y8vtL6bkUVNA5AyEn21g4zWtyycLH3GZve0ziflcSpO/bE7dWt4p3bya8QpBHzmbVcHYQXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737993290; c=relaxed/simple;
	bh=OK+HzoLuYdd/tOGro07jI9PkS9TvvSaZjIP6Qjdid/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BIxmuJcv64civDf/yD5Y6xvslNBSKsjuel7LuUWDjA/HR+NW8LYHM4Qh15nZ4k0XwyPkgKnDcPttkd5fGSI1tMFjkIuu2bClfAfTJ+wjqVTAkQ0a6A59gwbSNG/h+37SO+lj+MRCUosGqZGx1iJCVTqHbCwm/dJdBAF2cVoWAxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S67YFIB4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S67YFIB4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4360C4CED2;
	Mon, 27 Jan 2025 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737993290;
	bh=OK+HzoLuYdd/tOGro07jI9PkS9TvvSaZjIP6Qjdid/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S67YFIB48qHCjymlmC5dow1aipiMwPCMLbORjlr9yy6u95VqzyEvUXtiya+kQoSrq
	 eb0I8YArW4/u1XfP+EsdjL9R5acsx8b2NqZlxVGRNMhb/0/1C2rxc6cyxlV5k/7cR8
	 zuegBuAKQm4nxVruBqxwK1GS14Tu2ZtXMjifdwxD9btjFg0xBMOoTQLtsft6cKBZU5
	 exuSRRk2y7PY7j5LUi0xd8kjkPh27AFJKZcSEz9WOkOUIaFb1Z07EjmFiIwsnJ9jQS
	 uVQ//qDCNrRVf87zzRGqh7qH/cKBLX08L/POK94UqlG2SVOLF4n3yYSn1S/WA8KfRl
	 k5aMukwqzwXfg==
Date: Mon, 27 Jan 2025 15:54:45 +0000
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Marian Postevca <posteuca@mutex.one>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ASoC: codec: es8316: "DAC Soft Ramp Rate" is just a 2
 bit control
Message-ID: <0fefbfe1-021b-46b2-8945-15956e75e37f@sirena.org.uk>
References: <20250127150458.1489425-1-megi@xff.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DFWlJP5SettMukvF"
Content-Disposition: inline
In-Reply-To: <20250127150458.1489425-1-megi@xff.cz>
X-Cookie: Printed on recycled paper.


--DFWlJP5SettMukvF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2025 at 04:04:55PM +0100, Ond=C5=99ej Jirman wrote:
> From: Ondrej Jirman <megi@xff.cz>
>=20
> Max value should be 3, otherwise "DAC Soft Ramp Switch" will be
> overwritten by this control.

We should probably have something to check this during registration,
possibly also have mixer-test check for other controls changing when we
change one (there will be some things that trigger on it due to bodging
things for stereo paths on some older devices but I don't know that
that's a widespread issues).

--DFWlJP5SettMukvF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeXrEUACgkQJNaLcl1U
h9AH1gf/cLiQ65MORci92Ts+dJ5+MOwTInqivVa0zhj2PkHDJq/AWE9ang/rIHo/
maXFhjKjf+BRhGrv4L89clT0ZlemdBbFi1fG0yJk45P9dOSGCeQzEOmyjKcjTsPq
xMDmFtoOzZ8eim1fPbkkBQyn7m8ljO6wzsvQEjW83vnO8XlP1074Dbg1r594kjZn
0V6dd9hhTbI8xUc7xdex6gsxheHRCnMcJfRzhaazNkEdC8r1Q5/sxuuGc3THe4TS
PjoNd81tQwA7d83wnag0nHLHLJhaSYngqGClMeqwK9C7hgxx+kZy54jgPkh0mpPa
C8tZUknZxHdBc1OCy/kjEXgyo89KdA==
=sPtp
-----END PGP SIGNATURE-----

--DFWlJP5SettMukvF--
