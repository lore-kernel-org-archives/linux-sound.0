Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C32A395D9F;
	Fri, 13 Mar 2026 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408508; cv=none; b=qv2GP6SNMa0SNNVzp+6IcsW5u8+zB0NzSiN885mA3hioXVpM8C8n7toxdXGr/OY5BoQm1BEqFuSE1OY81PXqiQiEho5j3ASQgiqqDIcBYZOYKmUdes5ArzobGRhD/Qzoyg66Zret5e6kabvCIdNY72KKS3VHoELalpvsQrq56Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408508; c=relaxed/simple;
	bh=/0VBi5Wwz6vsthgir9V+3hQMtcGmrcgFAwujd7pf6As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bvsg2HGutNMlIsC8Om3rsaXBLP/r2a9Gmb5JkoxPDi4mo6nYC1lf5yEEwQ91Qj3sGHBTdiI0IF0SNNxrOX7iRm63zu3tC+d2w3gsSc26k0ZYM3BbM5mTud2J/vA9bvcFUSQwbta1iofYyXXKcFhbACKHcJ4viUM5yre9jBm971I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ol5FYnkv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ol5FYnkv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83667C19421;
	Fri, 13 Mar 2026 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408508;
	bh=/0VBi5Wwz6vsthgir9V+3hQMtcGmrcgFAwujd7pf6As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ol5FYnkvuKxyeyGnnuBZ1S+KBVqK+/PdX5vcFsfojNUWfLNK7chwPoaNU4ea5zJSi
	 t95wfi8AsQsJwWP5MGJB2i3ekFe14kB2P3E3cwQVBqJHBQaUuEu9H05my4sVJ2OMcs
	 7bZ3qYexZsQ/TIFNiBfMFfI1UNl+tkp3nTNZL+TJVXw9j59wX7d6wLANKA5gBLbPti
	 FdF+I7gzhki7zX3GSTVEpMKAjDR7peIVsof3r6/5sonj1uQG6jxJ+sfIN1DyG+2i08
	 IZ/8jyN0dEotGO/in6/H6IIH9fT32M3Ge4KUne/jR1SlpzG4jHwyAygRoIkZEbRz9M
	 gCKPSl1gtBBBw==
Date: Fri, 13 Mar 2026 13:28:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: gaggery.tsai@intel.com, linux-sound@vger.kernel.org,
	mstrozek@opensource.cirrus.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: SDCA: Fix NULL pointer dereference in
 sdca_jack_process()
Message-ID: <809fbe87-2154-46e4-94ca-da75f8d4b817@sirena.org.uk>
References: <20260310183829.2907805-1-gaggery.tsai@intel.com>
 <20260312143218.2008222-1-gaggery.tsai@intel.com>
 <abPe1EUHUX9ZRZJk@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qxUcPzjMXJw8xAcT"
Content-Disposition: inline
In-Reply-To: <abPe1EUHUX9ZRZJk@opensource.cirrus.com>
X-Cookie: Genius is pain.


--qxUcPzjMXJw8xAcT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2026 at 09:54:28AM +0000, Charles Keepax wrote:

> Let me have a look at this today, I think really the problem is
> we shouldn't be devm'ing the IRQs since they are not being
> handled at device probe time.

Yes, or just request them on normal probe.

--qxUcPzjMXJw8xAcT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0EPcACgkQJNaLcl1U
h9C5hgf/Xdd4vl3EyCVQgbiOIEPxvM66Q5duSNPPMSSDlMh7XtZp0Z9De0QQ/lqi
tHbiVtT7vsGoSC/bswvRa8bylCUbg9CpO8tfPvdyLZXJRjEDxAyEE+d4ZYkz92aZ
mL9Bb7/e34x8/dJGkCSR99wnYsF2fd7V3MBi/+aCnpax65IzSEVQf58ZD8uTfb/t
ByNxYyBeCEHNw2SRRYf8wmW0DPYPkFQXmEkCJTOSH9YKQUEpucRemTYHfq6JcSdV
2/f8bb/iVF1ZRalBwZVZ1rmZ2dWGbNJgtMchElYDjFAVDq467ikQEXJiylRBZKkO
15ZzucaW3OSTp7ow9K4B1Ub7wXT1ZQ==
=fOz4
-----END PGP SIGNATURE-----

--qxUcPzjMXJw8xAcT--
