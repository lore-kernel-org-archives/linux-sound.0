Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2CC35C6A3
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 16:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057562; cv=none; b=k1Dp0PpofZs4TdTODRqwmRa5Zeys2qNHWDd5XLTwufD0IzchbsSutoqz/UN+oB880C0n7l8d5HKgk1LssSlV6xTiXhAQxhO3B8XXxk5lUQDRDgJWKUClkpMav9liCt82SPpe7tZqmRkLu22hZQnHPvR33e/H0s58ZhL9SZEC6fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057562; c=relaxed/simple;
	bh=3EztzNKg8dxA7Qv30/rY5/MY1WFoIyUsnX+tkn6mPQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eur/5Pvqjm2aE+trC8RQUaZtCFQIa8tRdKCiT1DeUp8OQIwJ1XF2FIw0mKrGqZYZgNV2ZKdWIT0or+1tJh77Ap0xJzK1I/HX79+KE28NJhIaKjIefQ27+YMvoZhLcAqXG94btI+j5Jn0afqUERyzQiX87wNI19yPGTFteBuMPnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=INRfr9/9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="INRfr9/9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5AE1F000FF;
	Thu, 10 Sep 2026 16:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789057560;
	bh=vIdaBic866LOa2MRIKQFCY1TH0/PBHVUlMlX69r1fmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=INRfr9/9T+lQya2wr/Pd+TpO5j6/hOiRmKs86slEW8FphPzdAF1ZyBxgIDw8rp8ZO
	 4O5jAwr+V2lLPeul6MPGkb3QF7rNtLrfFGg3yJSOWUOcOgCChs7mrUXbkCW3wI+VOD
	 rxgbmDrUJYlSoedqF4bkpULVplckORNW+hEN8lLycEYQiIjIg7ZTFhJ3ggeJQ8tBnI
	 Vab7IaYv0JCvdJMatJExxWSNdqJzX+s0q9HKtHLBB6pl60XIDRXFFf9Yc8J5HLTnv4
	 MNl0tD6HArckZuoaTmwRoqFrX2eoPCkjNLYK3JVut8+tb+PU2AlwnajPYGnZgnpTz0
	 EhfGtBNjFroMg==
Date: Thu, 10 Sep 2026 17:25:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: linux-sound@vger.kernel.org, tiwai@suse.com
Subject: Re: [PATCH 2/2] ASoC: codecs: ES8326: Adjust the standby
 configuration
Message-ID: <e008bc53-559e-44b1-ba0d-4dec50cc9336@sirena.org.uk>
References: <20260910111828.28027-1-zhangyi@everest-semi.com>
 <20260910111828.28027-3-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LreYeKJn6TuBeEfj"
Content-Disposition: inline
In-Reply-To: <20260910111828.28027-3-zhangyi@everest-semi.com>
X-Cookie: Gravity brings me down.


--LreYeKJn6TuBeEfj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 10, 2026 at 07:18:28PM +0800, Zhang Yi wrote:

> Adjust the configuration in SND_SOC_BIAS_STANDBY for better
> power consumption performance

> @@ -1078,14 +1079,19 @@ static void es8326_jack_detect_handler(struct work_struct *work)
>  					SND_JACK_HEADPHONE, SND_JACK_HEADSET);
>  		} else {
>  			dev_dbg(comp->dev, "Headset detected\n");
> -			snd_soc_jack_report(es8326->jack,
> -					SND_JACK_HEADSET, SND_JACK_HEADSET);

This report removal isn't explained in the changelog, and I'm not seeing
what replaces it?

--LreYeKJn6TuBeEfj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqi2hQACgkQJNaLcl1U
h9CnIwf9E6CS3IncxBfQ351lOFRMxaHUW+pxyrRecc4GiO52ONi9IKy4+PwF3QCU
YvMzuJUYR5wJHAAUC5BbPzmmkoY7VBcuxES2u/1IAtEdY/Dzg5M3W4P0OcRurxvd
8adWYIRaoGWgHgAA22nPBUuwv+Wn1cKjKxO3ZD+NxR0HJet1hRNXGGnsw6ClSwiE
yNXkRnW/ct4MniwfAIh39aB05tLbdw1sREk37WdxFx/vP7iYRET6oK1NnU2poDtB
af+l2B3C8pTsO2z7sywyqf3UvsQtFzYsl7cqETyzppmoYPcLsOtnkLPEd/WZamXQ
CnMCDu7dqfzDHtJD/XKJ/vHgfngs/Q==
=xwni
-----END PGP SIGNATURE-----

--LreYeKJn6TuBeEfj--
