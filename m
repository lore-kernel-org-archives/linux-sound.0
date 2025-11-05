Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A150E32D0C8
	for <linux-sound@vger.kernel.org>; Wed,  5 Nov 2025 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762353024; cv=none; b=Lu1Z31OFXtMHyX1EcWhvHJzbstN9r8X1egsvHQXoeDhxwfLQnfdtZFrbgCkH98jmP/nj86RbxTlfY2zbZlP9saSOPzmAQHJHsfY4aonoJLgrJ+dl+CvlAZnxesRT7duwt0FS6DYo279L7MbankT1v7cE91PE5tAyiNe31/qCPiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762353024; c=relaxed/simple;
	bh=ljb0g2FNn/AR/j1a+fmjpfEF5scj/uG7geZzs6ISrq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oc01HgDVGHhEZP2YU0rzoq0jiaVGnsRo2H3jwzohKW9Gf1NJn3l2afbfQggBq6pmFQ8oZ16fkRHXEyPVP+pC3M5Cy2gC5+Lp3oSgxn6fCT+rwRGfJxQ7udVD1/wsFJJx/8ZWG1ONV0QM5ePypdnuxcaHv9TfnduLuWDnICbyRpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqUB2pVM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqUB2pVM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B59C4CEF5;
	Wed,  5 Nov 2025 14:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762353024;
	bh=ljb0g2FNn/AR/j1a+fmjpfEF5scj/uG7geZzs6ISrq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JqUB2pVMrVT1EYls8PQuLomOAm5WwZhXMWJ7CF2XRRf1zLRgAqVfyKoAAhM2Mx/ev
	 ztdzs+U1SyUGEh6LyA7h646Tc3JUhK3msNui1cv+B0/64pb1iJEcWs9uH4ZgDeXJa3
	 cHYaGYLm5kHp6RJ0OkQz/RVlfvltk2BT2c2xJ52AtaXtyKcqkR3W1HsBOloqtgtF6m
	 JnQWz2acxwsCiGb2AP3twzhNX4F4oKZzBejVxpz4vgPw2weapU0nrE+/v/ZC293vV5
	 quNQh58cTtuebxK2qqBjgrf3JRWwTRq8+fe1YRlWqy5IY9JqJXWvb//Fnqzw78xjSH
	 50Rk75kjPKGTw==
Date: Wed, 5 Nov 2025 14:30:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	lars@metafoo.de, flove@realtek.com, oder_chiou@realtek.com,
	jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH] ASoC: SDCA: support Q7.8 volume format
Message-ID: <aQtffW2UXxAgeAA9@finisterre.sirena.org.uk>
References: <20251105091122.495561-1-shumingf@realtek.com>
 <aQteVxu1gLyzbfLs@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rlw6mgZp4jp6rsmY"
Content-Disposition: inline
In-Reply-To: <aQteVxu1gLyzbfLs@opensource.cirrus.com>
X-Cookie: If in doubt, mumble.


--Rlw6mgZp4jp6rsmY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 05, 2025 at 02:25:27PM +0000, Charles Keepax wrote:
> On Wed, Nov 05, 2025 at 05:11:22PM +0800, shumingf@realtek.com wrote:

> > The SDCA specification uses Q7.8 volume format.
> > This patch adds a field to indicate whether it is SDCA volume control
> > and supports the volume settings.

> Mark, how do you feel about putting this in soc-ops? I think I
> am good with putting it here, the code is definitely a little
> smaller than open coding helpers in the SDCA code. However, I
> do have a slight doubt that this doesn't have great reusability
> outside of SDCA.

Yeah, it's a bit unclear but probably fine.  The functions aren't super
complex so it's not really a problem other than the small extra code
size for non-SDCA systems but there's already a bunch of niche helpers
that aren't used by that many systems so meh.

--Rlw6mgZp4jp6rsmY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkLX3YACgkQJNaLcl1U
h9CSmwf+N27rbBos2VddE77rvjuNsdL+T8qWgbtpzyBzSznzNIqTs5X0h1szUkz6
rvGrqgbeavvNhFsePUYaHJPcyde3olcQQyeXbe3xjkeA9yRWF0f4pEH8MxNiFupK
SxwGSPYsIimXwPfo3Uye6Gtt+6eVVUod6UNYn7drw7+kQsurj5JSCctVuU0mykxN
BfVruxJjo6BrF5O91jd07bkAZGcHBj3yiwQhsRq2ohdlxgg7TOWHWiQVNuLCe+kC
d0bzdzxnB1Mp/gOTSE6104oo7ujY5E9K6ikrg4FjnyfSSIS6Fcq0GvgfOFdgWyxl
wJmBw69wdF6nsv/kY5jb94smaKOFOQ==
=SA0o
-----END PGP SIGNATURE-----

--Rlw6mgZp4jp6rsmY--
