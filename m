Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFBF3FDC1A;
	Mon, 27 Jul 2026 12:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785153607; cv=none; b=eoWjPcYgE2vhiPPrHjVk+3JF0SFWMx1lLY3nY2V5W87QZR5U7uiCNyhk8/UwSInUww0ySbl+oqEhAeTex53ucuHP8MEGdJF5kYiZ59W/Q7/jq1HweYrJPAengunIz5OztJ5Af5oDcBKkp3y+9ds51fWcBiMZqEa+7flC3zCTZwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785153607; c=relaxed/simple;
	bh=FoSeZDGTp7W7A9xcJ5IP/2ZkkTTLuoU9iQNGrshyMtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7Gued6GNbchyzPEs6Hounx0JrTaIXGdI8lH45bc5qDoiPhaH8b1Eo+eAIkMc8wd2otRF1XUh9fclDiC4RHFK2CzWfive8m0AVSrIq7GWqqYvw2vHPnQC2DcYBKTV9gutGeq1zi9je3NvoCa/6KgjC9RcSEFx7EfjMP+B80y4i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eh/TY22q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eh/TY22q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFEA1F000E9;
	Mon, 27 Jul 2026 12:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785153605;
	bh=FoSeZDGTp7W7A9xcJ5IP/2ZkkTTLuoU9iQNGrshyMtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eh/TY22qyDWZXhkrs1RE/qoJ8zBJSM4mS/KQ0dS0HO4sNk9+Le47TQZmda0OqIoMy
	 0r/ys0S3oBwjeGE10rNK+S7q3iHeU59Q3mPvtrRrZidUwTXAZtusHij3HDdR8umvFS
	 Lvz8PXkHhh+S1oP5owtTQWJ77Jf1LCzDBGVYJn+2PDI8S5+G1cxz0yADiJc7YWpKxV
	 y5GhYLE6RflsvmswdtdLHRjYT5qSrfkCLkgcn6TT5HSVFQf53riv965KFseKRQUC0r
	 WDx2r/ByWe8wDz8wG4oa4bIEkv+fGi0rJH1Foc5YND/V/ZYnpPqwVAwIGqrt/FPmSx
	 C3l6v6g/A/wlA==
Date: Mon, 27 Jul 2026 12:59:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrey Golovko <andrey.golovko@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Antoine Monnet <antoine@montane.tech>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: tas2783-sdw: drop stale regcache on
 uninitialized re-attach
Message-ID: <6c8834aa-d53b-40c1-a8a5-e67147bd21ce@sirena.org.uk>
References: <bb5064629ada99fa5163621f72fbd27f@gmail.com>
 <3e2751d1fb027bed0f09c88e5e56da8f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/aMgU4zLRQ3FIdmg"
Content-Disposition: inline
In-Reply-To: <3e2751d1fb027bed0f09c88e5e56da8f@gmail.com>
X-Cookie: It's OKAY -- I'm an INTELLECTUAL, too.


--/aMgU4zLRQ3FIdmg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 27, 2026 at 12:33:09PM +0300, Andrey Golovko wrote:
> When the peripheral re-attaches after the SoundWire controller was
> power-gated during system suspend (s2idle reaching S0i3 on AMD ACP), the
> amplifier has lost all of its register and DSP state. tas_update_status()

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--/aMgU4zLRQ3FIdmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpnSD8ACgkQJNaLcl1U
h9BwrAf/fHTnxYimio00KKrVIZOya9maY1G0EyToRDpgElfOaHUhlp3Gswnjqrql
9lDJD+uZfPShsq+E67Mmp+7Fr9llo3PLAYoMODyaA57QAOe0asiLGzczJg/LuCSg
m+vJ4DBb3gv1fbZVUBNqA4x6QXh9uHB2K9MPCbuk661sERmFYpJU5DuWtF99+6eT
XjQn772lq6oLqfOtsT+dC28GzF+ZN+HBuqdcruN4jtNuCqBEAol7Qkn55lP8DLz5
p+vOfdefYdco1CaH7+sdD15S5jZzhuYHzytfsQoSa5Ijg+8LPwJfyHrYSCgIwUA5
QQcMWtymxybRvABzlXX0t4S2r4pPYQ==
=2vSq
-----END PGP SIGNATURE-----

--/aMgU4zLRQ3FIdmg--
