Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5E0443303;
	Thu,  6 Aug 2026 23:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786059841; cv=none; b=qjjK2ZVDiBGKQc6YL7vJnrgW0Xu2HF7fgboFI/nYOC98Yvr9IbH4iNwgfOYmerqvzON5piZFK/SeCa8VdT58sqLskpwxxXJHgZhcjEIXQU5fdAuUxoUQAYRYmyLpkhkSDosOe0vFXhkPpHqh3D7Q5g625jLPW4dJx6OxqfKtjTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786059841; c=relaxed/simple;
	bh=8335E/halVTT6CarENa1xPJb+/dH1oqOkQAxwiyuOvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrJH6v2pmaSULoTnL+GcH1j3pcw6wt2LZqCCh1UsvfMtsRzduVtwuS/y1on5ztGUfjvZVtB46mqv8SYgGhEt4bBRUc838crwb6yyq6D1XHLjml9qIPKlyE7HCJwYu6qKMOjvh4GYjnl7SfrQmH9B6cKFPxC2kER+W4JXOppEyPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+oz6sxa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+oz6sxa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C4C1F000E9;
	Thu,  6 Aug 2026 23:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786059839;
	bh=10IfIX+rqXW9HmifgBGHYLj8pbiOaELoC1OJPRB25vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D+oz6sxa9HGSy5MHI+BM441vfRRzalEmnA5bzBcTpPD06U+ZUgy1+0cjxdLBd4Bz8
	 haXgSL/OEm52jucijCprlmmazsTfy0uuKIlDhnomTgcHH3ljxDKYDxHbNhTSFvEjJp
	 zEZ7kh/O9dLP/LeVJgXNLSPkP1p4250euaD1ovr2jRE4pTlL0pbToJDj6gTrzg4HWs
	 6H4mdQWcqdtOciWl/EBJ2lTg34UdJ9oDU6qLVvUzAJH8z6hOQ1/AtYkvCEaAt8heL+
	 +iomO0Axf3o/kkJgmG65noWSnkqPy1L0tw9CSGigyXcm+Ag+/exyZE9+v5vgxmj73n
	 N0AaDg5KA9IQw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0B95F1AC5738; Fri, 07 Aug 2026 00:43:57 +0100 (BST)
Date: Fri, 7 Aug 2026 00:43:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: xilinx: formatter_pcm: use devm_clk_get_enabled
 and simplify probe
Message-ID: <anUcPCENjlj65W-C@sirena.co.uk>
References: <20260806233812.31851-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EsmF25R3uavR+2WT"
Content-Disposition: inline
In-Reply-To: <20260806233812.31851-1-rosenp@gmail.com>
X-Cookie: Swap read error.  You lose your mind.


--EsmF25R3uavR+2WT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2026 at 04:38:12PM -0700, Rosen Penev wrote:
> Use devm_clk_get_enabled() to let the clock be enabled automatically
> and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> clk_disable_unprepare() calls in probe and remove.
>=20
> Simplify the probe error paths by returning directly instead of
> jumping to clk_err, and use devm_snd_soc_register_component() return
> value directly.
>=20
> Assisted-by: opencode:deepseek-v4-flash-free
> ---
>  sound/soc/xilinx/xlnx_formatter_pcm.c | 47 ++++++++-------------------

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--EsmF25R3uavR+2WT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp1HDwACgkQJNaLcl1U
h9AgcAf/XKL7xUSbmRRfV1Xf1pAt9hc7vV91sDkz/pszgYtTKuHK1UxO5mctw/n2
PHxst+59W3feDmAeukN8XpGW2MjtLqDKkVlLV28fSOXyWDOV7ULCUvwfKBSsQRjY
SIry+jGcn0AGaUR/FG3s2EDma4aWund8XD/qKWSmB4ZKlBD8CFy0xSGnbT4DYSMe
pyZscTpdQDZ6F6Njt13aMG37sUiBzOOCEggfkaaKfVrGhmqkdP4MBStmxBqTbO2r
gBqMtvBhrxhOtnXme/aGaWP22M1pzuLeQVNSovc+4SN5QBP3FZN13oJVYD8YzewT
skPIY8fsUS+mDy2PlnjEXx1dSs9ZuA==
=1T0e
-----END PGP SIGNATURE-----

--EsmF25R3uavR+2WT--
