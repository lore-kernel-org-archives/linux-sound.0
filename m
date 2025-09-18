Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E87F31D37A
	for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 20:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758227130; cv=none; b=egnRonSb7tfJNCWCt8I/hgQy7THXQbh96U7m0lNspjPgFFdv/MsVHJXLQOzgX1JJh1fUkeQKob5+wHNIYGIJgHpLOBFoNkllLO1Qa33kYtVd3RAiirv7P9AQ9LhCqmiVruIOLtqViz9YmC/vFJd5xN3KsRTtF387Jyq9T/CevaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758227130; c=relaxed/simple;
	bh=4Bs1QqF0meAabFf02vUNA7NbMeFzxtdtzw4fmhlAu38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnHzIQLgejC0K0tjmqEXaA9JCnKgK+UwoqUdjQWc8bh/BiWL8Iak0u7B7nDw/jyrBVsoS4iG0xBsXnbpVkQL3tA9p2mzjissuYybqcl/7VN+ytMMR5LRm37otjxOahmHLQ+ft1tQKaORjpnYdoU/VAyJwoRQ4+fisWakicyGKI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hzo1MeDS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hzo1MeDS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DF5C4CEE7;
	Thu, 18 Sep 2025 20:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758227130;
	bh=4Bs1QqF0meAabFf02vUNA7NbMeFzxtdtzw4fmhlAu38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hzo1MeDSmUwMB4TL2E/lLNNgjwSlqss3emHh1AbZLEMqxEkuNCKq6simY83P8BNC1
	 MPKWZZUkzCicRa6hAjhIDD1TePnsFRXCBJJTTUejcYFOUF1E878ad6P1fiW1kuYvB4
	 Ep+0MlwiQUufzMTqP4OMyCJptan/65vF5YzATN3u86aUh3qm1QQT3DFLImvTxsHacH
	 KsjW+D1KqOib0STWpZ4gAJN3HELalrz0EOUma52R7iU6TEXPHRvOedch8KWnbEIA01
	 L9y9cxwES+HJd4W0cbHNNIn5pJFXYYtbXrBs2UOQaql76zMiShpE+3+7BU9lDOi3qE
	 fCetuNTgZCr9w==
Date: Thu, 18 Sep 2025 21:25:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	shumingf@realtek.com, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 13/19] ASoC: SDCA: Add SDCA FDL data parsing
Message-ID: <c8a316c0-6b91-438d-8540-4d59d934244a@sirena.org.uk>
References: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
 <20250912103504.2679226-14-ckeepax@opensource.cirrus.com>
 <06104715-5d1b-4d3b-8846-be7b5daec996@sirena.org.uk>
 <aMlrfFqcS8gu9XXj@opensource.cirrus.com>
 <ea3cadd8-95c3-4b4d-b1fb-c8ee23f36804@sirena.org.uk>
 <aMrGQNYkoPR+QDtX@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LAw5CZhw0xaFk8cB"
Content-Disposition: inline
In-Reply-To: <aMrGQNYkoPR+QDtX@opensource.cirrus.com>
X-Cookie: Victory uber allies!


--LAw5CZhw0xaFk8cB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 17, 2025 at 03:31:28PM +0100, Charles Keepax wrote:

> I think that is probably fine, would be good to get at least
> one more Pierre look over before we merge anyway. Would you mind
> if we fired up the next series early (likely in a week or so)?
> Suboptimal to have two in review at once but it would enable us
> to get a head start on review. We are starting to get a little
> pressure from customers at this end on supporting the part this
> is all in aid of.

It's fine by me to have both in flight at once.

--LAw5CZhw0xaFk8cB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjMarQACgkQJNaLcl1U
h9BKoAf/WsGrZSZG8nkwHlW3up6fpWBJaEj41ePsPP5Gxcol7frw6FhbNxcMOnWu
Uv2htZZCOuXOTGuJECYownpKvJ6DYCCUE1P37HI+NFwhxwaJgjNI8GSaOKzEzRCD
8AJ5kcYqts9Kw/C3Pzf3RazxhEjaMa5OhGO+VrDX90ew5Ig07uNu7OnHJm7xWfdI
QqSAMk1YNT+HdembJ2qYOEmi6+gVdos29XkQhiJQ4KF5knHurSe2k6IZBx2GZ0md
Mpd8Mx/jwnb1N+bf1xZcWaBvu0I41PfRb0//ubn/rjQwKWaghrkfqEKktpQXQ8N3
0uX84z0+MoFjThqof5Pa/nt54/rwqw==
=lyvt
-----END PGP SIGNATURE-----

--LAw5CZhw0xaFk8cB--
