Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B988637BE85
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 18:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340243; cv=none; b=IldWgssaKwvkdyGQoJ0iayDdGz159fYqcTCqZhhdOTNFchA9m7wWptwr65XVsXZ+tF3C/HwZIE+uHAYSCt/hUm8Yvpklbsw3+MHAUy9HiNccMddjQOGZLDXqZouQZ3DIGFxh93SXoZprIxOygmg+uQZvgeB1k4Y8b5K4gGSIkrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340243; c=relaxed/simple;
	bh=7WeoIIUgiBaiPjoBYy2JCyo6fdc694VYm0aYQlDcmSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ka5KROEZFC/66nlP2X+c3oYl5MjcSs8Cn7v5w0H/Pi8T9LCVy9iTESgiIgM6ON8uAclKciNuXfOvtxxLKpwxLnTnkLZR7T5vvsojpWB/17pi0+25ndiIhCcAqWwkZCFg8e9CjesO8wl24nauFK7h4eCEIHBvDXGbNn2SF9HXX80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grcWTd7O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grcWTd7O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283BC1F00893;
	Mon,  1 Jun 2026 18:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780340242;
	bh=6emSRz1XI9aJiiEfuXGuZ1yFpatStDKVptLZJF5Ow1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=grcWTd7OJqqLEDmxezZEQrnaY6dqtQ8HRjmWmwcR4h3o3VMo+h2HV6iXpbhXQ3OK1
	 yxCrOVYI7zTjUfzE4x/v0vdjcQSs+gRou6ohcwLaQ5rurZdPaLcuwN+jr4p3eARaW/
	 ZmqLm75GPKNaTe9p3e+BQNpC2XHxLrW4yAxFWRuKhspQrMwfM/auXuOy8HAB9/nN5z
	 9MixHTB4CBuDgaoesnPJVwN7RcBdOo0Ce879R8QrN3oe/EM2DJaySgpD7Arm9zD+5e
	 fkgcEfLS93uI283kakvgIyvjaqPN+rF9RoCZdawVzWha/Sf9J6zA42BbO+WmQw4p85
	 7d0EmXwN7AniQ==
Date: Mon, 1 Jun 2026 19:57:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org, andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH 2/7] ASoC: Intel: catpt: Replace RAM-helpers with
 resource_xxx()
Message-ID: <be625272-9daf-4d38-a7df-875f89b30f69@sirena.org.uk>
References: <20260601141031.1606847-1-cezary.rojewski@intel.com>
 <20260601141031.1606847-3-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ivOEf4ZLRrEbej7/"
Content-Disposition: inline
In-Reply-To: <20260601141031.1606847-3-cezary.rojewski@intel.com>
X-Cookie: Have a nice day!


--ivOEf4ZLRrEbej7/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2026 at 04:10:26PM +0200, Cezary Rojewski wrote:

> -void catpt_sram_init(struct resource *sram, u32 start, u32 size)
> -{
> -	sram->start = start;
> -	sram->end = start + size - 1;
> -}
> -

The prototype in the header could be cleaned up too.

--ivOEf4ZLRrEbej7/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmod1g0ACgkQJNaLcl1U
h9CpOwf9FXerSOy1/msPNSniuAZCTbgDdNTwUYba7LndvzfSmgleU76X5dcrey9J
+3Gbd1/I0psnRZuXVqIRrVWX6Pf9H28BOfzuUyO9LyjHMMHLF33QotmDuLHLXcXr
WiG57KWP0VNkha8kiHh85FErPKZD+qZfclklHw+C+ejYmFVKDI66va5pz0BXwB+k
1x2GO2BqXnXH4hL0hApRbbG15QMN31JM5lUqQKGbrxYLBkOAovyZFRjAhTDWG+JU
YtiLHefwUTO3fVmuucFjjtcWohbTOYKjqpztVhDvx7TIioLki+tEAFN+MI+Bm74N
Mt9WEFZdO1RXBtN9+04Ie39Ld8Sqgg==
=SK4M
-----END PGP SIGNATURE-----

--ivOEf4ZLRrEbej7/--
