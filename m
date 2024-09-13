Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134EF47A6A
	for <linux-sound@vger.kernel.org>; Fri, 13 Sep 2024 16:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726245138; cv=none; b=YqmS9rioVk9R/fLtGn8rU/LjK1ELdtbmLsIj3W2LWOIqzHcUx/s2pEfKC2TNAe8EH4bhPvTqK+IjaUl26HFq+Kb/cO7XshJ21akI3R0bMkeEwx7FGkMDfANn+hVi2nnbJn2MtUY+b7wNQqo+gBm3lfxTWeO2GdLubLl4X8St/sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726245138; c=relaxed/simple;
	bh=BcbLsJ+E0JCcewxIt4ozfn2rIALLXnWZgLE5/Mkax7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYkjWN1iZZFWH7m6OfCXj7d1i4PprEIrw3zEThh0WI3kNHzcJAU7K1aj5NEroIf0bHFf+TUJvQ2N4U4ImFtRe4oSemlBOw6+KQjIdNrakPBMIvUNy25SGAWTBGTrSATsvFLGmbdzTJkAtL7zNyLzeGBVxMWSC8tNkSbrhaWBRjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjATxHBV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjATxHBV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BF5C4CEC0;
	Fri, 13 Sep 2024 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726245137;
	bh=BcbLsJ+E0JCcewxIt4ozfn2rIALLXnWZgLE5/Mkax7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjATxHBVDxX6BFEQdu/QTEge+COGQBoOOFhOUsAaglrBJ95DVy3eflJjZhfHpFIpf
	 uj/81u+s24kIpdQjkJ8vl2o9eROynDxKV7P7q3l2rQ+l1BC1/gA/WEAAZVPH4bx334
	 aLB2PBqQo/H4PAm7QPapKIMpkYi0e3cVBSE42+1xbSCYaJrQdogyFcg6XeSSGC2tjj
	 X7lYh/DmvbEpd4GTUNLK0oXOnszPIZhZDdqxg0yXberL+pSwGQuKAKD65SeWm6hO7T
	 Z66QSGyW989N3IHJwufPnMYt4uAI/86EKHIHCa6LsGxd98DdPFdb738X6GkpHbpUcX
	 hzvjTwchuZfKg==
Date: Fri, 13 Sep 2024 17:32:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] [RFC] ASoC: Conditional PCM support
Message-ID: <cce327f2-03dd-4c6f-9218-e54aa76a78e7@sirena.org.uk>
References: <20240821101816.1494541-1-cezary.rojewski@intel.com>
 <83f81553-6dfa-46a3-9ca2-d42f54295eb1@linux.intel.com>
 <d5db8a15-64c9-45be-8f8c-977fd5ed282b@intel.com>
 <2ac45376-5df6-44e9-83d6-cdea49eea916@sirena.org.uk>
 <b95e8c62-db61-4678-8c2d-2224dfb1dd60@intel.com>
 <67b30310-6fbc-4d1d-926b-f4cc7bf68896@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UaELuzA42Q0pL3aG"
Content-Disposition: inline
In-Reply-To: <67b30310-6fbc-4d1d-926b-f4cc7bf68896@linux.intel.com>
X-Cookie: In space, no one can hear you fart.


--UaELuzA42Q0pL3aG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 13, 2024 at 01:53:41PM +0200, Pierre-Louis Bossart wrote:
> On 9/13/24 12:59, Cezary Rojewski wrote:

> > Instead, I'd suggest to have a second, separate DPCM implementation
> > present next to the existing one and have users opt in during a so-
> > called deprecation period of the existing one. Once certain amount of
> > time passes, switch all of them. Clean slide also makes it easier for a
> > developer to be creative.

> > Do you view the second option as viable?

> Classic problem without a good solution. In practice new features or
> corrections get added to the 'old' framework and the new one is not used
> by anyone just yet so it keeps running behind in terms of
> features/maturity. And due to limited validation resources or limited
> access to a wide variety of hardware, no one is quite ready to enable
> the new framework on 'old' platforms because that would break quite a
> few devices.

Yeah, there's no idea way of doing things here.  I do think that keeping
things going in parallel is probably the most viable way of doing
things.  You'd need at least one lead platform using the new stuff, and
probably each platform would have a flag day to transition.

I'm a little more optimistic than Pierre about making progress,
hopefully things would be sufficiently nicer that once there's something
to build on it'd start to get more attractive to do the incremental
investments needed in the core to enable more platforms, and reduced
maintainance costs get more appealing.  This approach has worked for
other things (regmap springs to mind, and if you look at some of the way
API transitions are done in the memory management and arch code there's
a bunch of this going on) though it's rarely fast.

> The other problem is that the 'switch' would mean a compatible solution,
> but the problem is to get rid of the very notion of front- and
> back-ends. Existing users of DPCM have undocumented hard-coded
> dependencies on the order in which callbacks are handled, it's not easy
> at all to change the routing engine.

Each platform is going to need to be pretty careful with the conversion
and validating that things work.  There are some simpler ones which will
probably have an easier time of it, though.  There's some of them like
Kirkwood that are just at the lower end of needing DPCM support at all,
and others that didn't upstream so much stuff yet so there's less
knowledge embedded in the upstream code.

--UaELuzA42Q0pL3aG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbkaQsACgkQJNaLcl1U
h9DYCAf7Br1R0ar6NcUU7odqkM+D7kigPVpmNj6OaA2+A+yQqjOs5phzcAFsvJXG
ku4ARFeur1jhko/+VUEtnXtfmvm90RjLoGAS3VSaewUT5Yv7hHoAOCmYUsxUSJTE
Z3CeZb1sWyPkV8HRkRGiJ44Q9neD37veiDjnngebHwoMXW1eeOY7O8ESvhmw4dxB
VnDheeUpCJ8SER51whR8bou2zo7ztjeihCYJ9+wNsoElsqPVUcYUg5OOv2xboRnH
6ZGPxIrK6oWFvZq2oUs5qIdK6j52usbyZpcedvtTzOnwKURk9le+JiPPsEWwU1sf
8vhiTGJCBJbKGwqIcl17Bvh87LoSfw==
=5j+R
-----END PGP SIGNATURE-----

--UaELuzA42Q0pL3aG--
