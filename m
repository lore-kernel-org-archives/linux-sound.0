Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C58125A9;
	Mon,  2 Feb 2026 12:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770034772; cv=none; b=ua/Fjs7oYHk9UfOdIME3Ty/Z6cGp/2E3b3531Rh3NlkfCzqhjOtdtWlCYDWlV1/RBQ9r3t29nCeMZLvLx0RJCqjoBrqGSiV0Kpc0sASrjvD8Pu1bUhCGsivoR3zm61kcq+1bZYWiNlfRakZZ+6O4Qu5QZJLwtpBt4uGZsCCzR1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770034772; c=relaxed/simple;
	bh=/hmv34PWXh9ty0t21+ufUJZxokTcGfGI0S3tTCHPhbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPxBpeTjo9XJeOCUzOIDhsW5ZWKZUub93FY6xZKl9lC1NPaw5QS0URRCiSFxZlZmhNOXpNqTH14d4ZP0gliS5nbRiSkz1H5eIaM25BesOl9uWpPAYu0lY3wtIa63dRDwgADqZzA0PwxVcoqJdvVHaeRsjI5/gY2ivPyTdox8ruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAC++Wds; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAC++Wds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E99BC116C6;
	Mon,  2 Feb 2026 12:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770034772;
	bh=/hmv34PWXh9ty0t21+ufUJZxokTcGfGI0S3tTCHPhbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAC++Wds6MRJ3x6vYXYIx5jOPJxGSTP3BTbmZkOY94TSDojSNJGuDeceifxhPsKq5
	 ruYGR5cZp2DYW+4v66LJMc7RwQoxs/F4FDC1GKknprg8GdyWVRpa7TRibuunLKnZA/
	 /myg4H10LPIxinQdfoZbgv4XUSFw3Mdm/2z/sBFikNeGqDQQ1ripEezk/KM/HTCrxB
	 P2boRDzmDHuKI131G+uf+D5f+O7G6bNPFBcRXIcpCo7g92hlIWm6uwlPfmjCruRmi9
	 HlajUKgRAzsd/asZTwaQ/4dn8qD0VONJVTk1ktAhGtFr+W1yLl8WeLpAVtTlzgRZCn
	 yP3XwrNB3T5bg==
Date: Mon, 2 Feb 2026 12:19:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] sound: wcd-mbhc-v2: remove unnecessary module_init/exit
 functions
Message-ID: <424e565e-d789-4da1-addb-e6b12df0e67d@sirena.org.uk>
References: <20260131020111.46108-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w8ZW8sU4UQK/lEhm"
Content-Disposition: inline
In-Reply-To: <20260131020111.46108-1-enelsonmoore@gmail.com>
X-Cookie: Bedfellows make strange politicians.


--w8ZW8sU4UQK/lEhm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 30, 2026 at 06:01:10PM -0800, Ethan Nelson-Moore wrote:
> The wcd-mbhc-v2 driver has unnecessary empty module_init and
> module_exit functions. Remove them. Note that if a module_init function
> exists, a module_exit function must also exist; otherwise, the module
> cannot be unloaded.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--w8ZW8sU4UQK/lEhm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmAlk8ACgkQJNaLcl1U
h9AIyAf+Phlqw6pW+O52YGjk23DkllewJ1tj2QryvbZSV2WL5EE30eTiisSzS8RU
TC/g7WoF8siU1r2mM5P2nRctCzGnpcXR0yZcr5iqZ0iuD6MmNruH1m/0Op6NqH1C
QzBYhcF4xUSXBc+7dxOsB8A6VDpK3/Hnv8soDkaDI4T6gRt/LpvppAhyYWKfOEXV
1eFjkqzjaCzWQQ6208oP8Tm1WEjqRPRQcP/q0DzN2pYY6wHKN3XyP1/Co/b3Ak4d
aaDhy860dlfwBfu/Degnn3V35jwRNtlqtK0K+OEHuJ5kxKSLCmQi9LBl4/iayBVU
W+Dgz4WhE3K3Zi3UJdupjZ176q7QoQ==
=JItj
-----END PGP SIGNATURE-----

--w8ZW8sU4UQK/lEhm--
