Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D451B3090CC;
	Wed,  1 Apr 2026 17:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065606; cv=none; b=hSoMDMbLSPFYwzKpgP+5MTYV7qOXlDMaQ2MKJWDjeTP9LcjLF7kIPc3eT2Xbp/fxXkbpNHgL4BOqWp+k30acMUT8IIZYkL3INHmegwcye/UMcazvd9IMhNWmLKMzTlniNowjHfC0fY7hdIpJLEFkSlNh20CDzJScvRFRi+AaqG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065606; c=relaxed/simple;
	bh=hOOWiMppMXCZ8GKZqehIq8iW8PfOxO/tEhHKrQlrBdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B6ttLDAYS75vKHNUTAKAjrcHNhYJZTtGJvgpJRrTZzq8JkUVpBQq86vZldye5XPRhK6XehMwWUc7MzFG7F2NmCE/9o7/zTP7bYgqMzknooBwuSi0vek66DBJKLJYKL+Bg9Ao+BBciYcUM/zay5R2m43F1C4YW8NGSlqhx9FU3yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkIMg8kC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkIMg8kC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B30C4CEF7;
	Wed,  1 Apr 2026 17:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775065606;
	bh=hOOWiMppMXCZ8GKZqehIq8iW8PfOxO/tEhHKrQlrBdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bkIMg8kCc8XMbcJaZUuKjMlunqSk8NuocMD9nRc4ML2B4KNYrn5yn2wymSN/ruwlF
	 m87ccQATMIB6omY11XTkoF0eX9h5xeZ66epHHNJnTx6+iJqeleos3hde/Cr+64jtva
	 O+lIXFG7G4wsGYKSwHgcnhZyHOgsgXsGfganNEXspN+ZjmzQxlFIxqmyQmJIXuT7sm
	 Uu2Z501eKMJA0boKoWCVyKiOgFKRkY0XDH22U7CCrY4g/DsZd+SUWiIdCFNdB06juR
	 VIqaJLnUvNp1woCI/5GoxVQyoVfjwsZyzjkaV80KDbEnR/bkZCmV2F4FnMElXOaRGh
	 rcfAVTc7rPg6Q==
Date: Wed, 1 Apr 2026 18:46:42 +0100
From: Mark Brown <broonie@kernel.org>
To: aravindanilraj0702@gmail.com
Cc: cezary.rojewski@intel.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] ASoC: Intel: bytcr_rt5640: Fix MCLK leak on
 platform_clock_control error
Message-ID: <3a18ef91-08d3-4c7c-b726-a78a631e6913@sirena.org.uk>
References: <20260331163636.15238-1-aravindanilraj0702@gmail.com>
 <20260331163636.15238-2-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+Wah3DSRLH3mjlLo"
Content-Disposition: inline
In-Reply-To: <20260331163636.15238-2-aravindanilraj0702@gmail.com>
X-Cookie: "Yo baby yo baby yo."


--+Wah3DSRLH3mjlLo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2026 at 12:36:32PM -0400, aravindanilraj0702@gmail.com wrote:

>  		if (ret < 0) {
> -			dev_err(card->dev, "could not configure MCLK state\n");
> +			dev_err(card->dev, "could not configure MCLK state");
>  			return ret;
>  		}

To repeat what I have said multiple times:

| Please don't ignore review comments, people are generally making them
| for a reason and are likely to have the same concerns if issues remain
| unaddressed.  Having to repeat the same comments can get repetitive and
| make people question the value of time spent reviewing.  If you disagree
| with the review comments that's fine but you need to reply and discuss
| your concerns so that the reviewer can understand your decisions.

Please pay attention.

--+Wah3DSRLH3mjlLo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNWgEACgkQJNaLcl1U
h9DqVwf+IPpUx1BihRFEwOXJA+q+9zeRYMlGTFftWsOzxb3KI84fBhuIJHCWFwoy
xYzfbOh2PUgyOfO8SK3jCexoMG/d2M2kUXbg5ujufgFNE/csVTEyxHjdyycSsQbx
15zD207uQlVDqemCG2QeCJhonrWtOsyadFVOgIK/sMbxO2S4vU9yQOLiXrRudrMf
4ymuri0fCw2ALweFV8rUaSxb2fRy0GIEp/eMrP3YbkO0owJPSPq2fmFzOmqPsJDN
yZNS6eaNqw01EtSrA65XD6p5nDe/ah9DiTWPEV5ZTU8GmkXgmMaBScvouKcTLCCC
2fIfJUixTj/zM0cI1yGZ3dJ6mXe6nw==
=UiUT
-----END PGP SIGNATURE-----

--+Wah3DSRLH3mjlLo--
