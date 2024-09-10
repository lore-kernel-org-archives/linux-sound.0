Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BCA192B61
	for <linux-sound@vger.kernel.org>; Tue, 10 Sep 2024 20:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725999297; cv=none; b=jCHXicANUhdHzVQW7OlSQPRET8AtVnMuWcpuE2jWrsCkbdxuJLPm04P55GJ3wM+I+HahIzyz0jF2RfSmV1LM+rLvv/TEg+gh+fbOhuhysVfWeQMNNm1gtiTB1LYh0gzjEm/U4KEHdebOkx74bJ7CXAy4LiupYNwXEpO/6LYrBZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725999297; c=relaxed/simple;
	bh=q0BHlKkxefI/en01yPsEML05pTpWpy2MQe65XKp3SII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnufQNpbDD6s0Ey6AK6fBinLXssK7BoKjI+Lt9rRfQ/y8gj9HUjMUj40TM/hkmzDvSyosjZxAN94qssLbFbhWteOhnCckLGsto3Wu/IjPaZL1pQgQMx9ZJLDVItXiJ23GCQaqF2js3d1EruHF4q6Ili072xPx1gNq/qcHqZgCQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Df2OMi8B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Df2OMi8B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF15C4CED0;
	Tue, 10 Sep 2024 20:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725999296;
	bh=q0BHlKkxefI/en01yPsEML05pTpWpy2MQe65XKp3SII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Df2OMi8BFOPvx77fkOCl906XuTTjMThbuaMTfrhuMl9j3qdSkg5+GHk8TgR7qHI3m
	 ucA/TWl9jnbvc4Qkuc/nz7/UVIwSX4OLqeUfmblR+X6N94bobqu5wdEbVZ77ifkhwF
	 wVLrzSCXXX/vIDssVEIy9N3jUb7uc7iajJOGzMOZpqQKl+CD3EprAKUYLbPLoDP48Q
	 bypQZ7kCwF+t9VkXaAruOSrnY604kS8lZxqqrrIPzjeXMocDQahojLPCRM3DuT6tM9
	 uthA8WL5lATZXAgx7sVeYohfVze7ykM5F1D3gS7Wu4shcmGcGxWMp3oI/XMTQjZFzN
	 xHczZIzSnA8NA==
Date: Tue, 10 Sep 2024 21:14:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] [RFC] ASoC: Conditional PCM support
Message-ID: <2ac45376-5df6-44e9-83d6-cdea49eea916@sirena.org.uk>
References: <20240821101816.1494541-1-cezary.rojewski@intel.com>
 <83f81553-6dfa-46a3-9ca2-d42f54295eb1@linux.intel.com>
 <d5db8a15-64c9-45be-8f8c-977fd5ed282b@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eJdWpfEZhmbyELWN"
Content-Disposition: inline
In-Reply-To: <d5db8a15-64c9-45be-8f8c-977fd5ed282b@intel.com>
X-Cookie: You're not Dave.  Who are you?


--eJdWpfEZhmbyELWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2024 at 03:57:22PM +0200, Cezary Rojewski wrote:

> You've shared many scenarios, I do not think we can cover all of them here
> and while I could agree that current FE/BE (DPCM?) design did not age well,
> we're entering "rewrite how-to-pcm-in-linux" area.
> If general opinion is:
> 	it's too much, we have to rewrite for the framework to scale
> 	into the next 20 years of audio in Linux

> then my thoughts regarding current review are:
> 	if the avs-driver needs sideband interface, so be it, but do it
> 	locally rather than polluting entire framework. Switch to the
> 	framework-solution once its rewritten.

On this bit as I mentioned in the prior reply there's been ideas for
redesigning how we tackle digital audio which I think there's general
agreement would be the best way forwards.  DPCM is very fragile and
creaking at the seams, it can't really represent scenarios like the
sideband case you've mentioned well.  OTOH a redesign is a very big lift
and there's never really a point where it seems constructive to actually
block things on it so long as everyone involved is OK with what's going
on.

The upshot is that while I'd be *really* happy to see investment in the
framework side of things I probably wouldn't block a driver specific or
DPCM solution simply on the grounds that it's messy.  DPCM would need
buy in from other people using DPCM of course, and hopefully at some
point someone with one of these issues will find that the cost of
maintaining a bodge is going to be enough to push them to do the work
(or someone will have free time to just work on the issue).

--eJdWpfEZhmbyELWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbgqLsACgkQJNaLcl1U
h9DTPAf/QERDaVkcoi0cdYzbXQ/wunDDdLU/10RHb54n3ESqidIT7WqJibSwCQap
2Sm1AMpmyXBxVEFWYBSu7dnE3Os0t8bkZ8HpHpyy4qdrFc9cfcdseg16fRJ6BPTU
el++ORYkEVIz/mHQTeLNPiUd5oCslAK3sWHj3aJfx4/plTJVDhIWyl82AfCJVenz
nCdizZbvmjTR8/cpB5Ji0Q6nKHHiUXpM6CfZe7nMGMOhS9qrZpwK/HO2iJiHWNsR
q9Xmmcz6pvh0m09lVzxU/GAFoUbgH6cs/ThhuuOooAg3TedxF+WrA+2YGOwUPezn
+zWLy+clmgu7Hm2Ov1kz27qbwCLfLA==
=lcez
-----END PGP SIGNATURE-----

--eJdWpfEZhmbyELWN--
