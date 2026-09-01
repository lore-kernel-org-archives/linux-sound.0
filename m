Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F377D14A4CC
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 11:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788262121; cv=none; b=IUa3yPhz2CUtZqKGOpWXp8VGC6CR3tIzt3C5zNFPJVKD6hK1OHkcTA1m/n52YBmleZnSXfsB5WJwgzsRzRiehE+zgb7qCVmUvQ89D6OIdC85BRNBXJFsFNTrpApHxV/wwypFnJnH2TNzDKPR1zsTpZgaj+D3ze+9AknjzuW/3UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788262121; c=relaxed/simple;
	bh=H8GnqjEQTF1C+iqqMNxM9nY1RQ1TdQX5PZnnijuNA7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARShZh62aJQRdllW6VeM4bc0IkORMTWruk7MnBTiI506gKX5JaXijBj8MB9AUDAY0wiG+8S0dxETIzaCL5aBzt7L8Lif3iW1VIeLpc+wY4Eg1C0JdveJ/hL8pkN6fpiPTQ2itIaj+8YUAB6owV8Psv9UpDKRt3roQ6iXbDTUJl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTnNhSXw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTnNhSXw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9513E1F00ACF;
	Tue,  1 Sep 2026 11:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788262120;
	bh=MOzsUS+FWCw1BpolP24iP8g+BTVL55jbPovmISSlqh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WTnNhSXwKNeUowV7DDaPrhVCHfYGFXKqXd2XAY9LWBekEA4HH71h8GEZ6PmqZxIeO
	 b2gmyUjQ7y0aIGx6moTxsfwub41WRKr6RDfto95LvgofcKGFlM3pYn+eT8mDTajNME
	 tvjZs0kR59HHZw4ouWSkpjoV0yZ+fShL93ztdLX4LgX5nr2hlWMrJ3Ppg24g8L055W
	 M63l8520ECfI05VIET2iFi8hiHWoMHsuQMg0cVJJa3Hd4GDVaUnrFVMYS3Tt/DAFSg
	 8IRrfimafGTD039USaEZwuVd5Fg3k9BZDG+3JPfhXlf1Oe7FBWgUHfbiGgIfCUtoS7
	 JQsWHSAcnFMzg==
Date: Tue, 1 Sep 2026 12:28:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 09/10] ASoC: Intel: avs: Refactor and fix init_config
 access
Message-ID: <486651e5-054d-4dc5-8a5d-1f993ff8a144@sirena.org.uk>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
 <20260831164233.1487766-10-cezary.rojewski@intel.com>
 <1f928229-1c43-4260-90e9-9e1bd1cd776b@sirena.org.uk>
 <3f2c2a7b-72cc-49da-bd19-09b1d5fa7275@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dokbamCDs3AdPiMN"
Content-Disposition: inline
In-Reply-To: <3f2c2a7b-72cc-49da-bd19-09b1d5fa7275@intel.com>
X-Cookie: Prevent forest fires.


--dokbamCDs3AdPiMN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 01, 2026 at 10:57:38AM +0200, Cezary Rojewski wrote:
> On 9/1/2026 12:30 AM, Mark Brown wrote:

> > ...but IIRC this ignores things it doesn't understand so will leave NULL
> > entries behind.  You'd presumably need malformed firwmare or something
> > but still, we're parsing data from userspace.

> Thank you for the review!  Yes, the parser will ignore unknown entries
> but these are two separate dictionaries. TBH I'm not seeing the problem
> but the technical background first:

I think I just missed that it was two separte dictionaries, sorry.

--dokbamCDs3AdPiMN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqWtuQACgkQJNaLcl1U
h9BLlgf/TLU7yrdHjoxZnBWoiYs6bAMmENVqU6mzHv292pGBBUtQ1NcsE4l/5Ad6
Fw2+I1UtkaK535wCLL5kgyf3d+JaAU+RfTPeoT4bACG00woOY2DCMuvohjvDKJJs
R7IBEM2bVuTEATtRlBeJQTXWD+8ttJGhyx3OPAhaWhCzQRN1AmzJ6AmzBcKK2W5s
uwKq2b1vhVap2kYemIrKnLlaIxO7SYcJg5pt4hLJXYoJpOrA7QjD2JqIV5MGWQ6I
n7Lqe3rRutYDPJpM6DI5D5NNoXo7Hpp1h13nAM1HcLHAbdDV7qucTEBN1ASfM8Ut
1yM+zzaWlaOzz0NY8KyM8TkFzicuLA==
=yW/8
-----END PGP SIGNATURE-----

--dokbamCDs3AdPiMN--
