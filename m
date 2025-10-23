Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E2C30DEC5
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 11:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219165; cv=none; b=k3R8MtiW37D8Zc4cKWlwRyY+RiakOavqLQLNt+37bEPs6OaZ/VlG1xkveFCxyDVp34/HmOtpUq1Xptm1M/02mOQoQI9z7RmiKIpHtCfUym6sP1OpiVqA+/WNo+DnooHNqwCryLnSEvEUW49la/6t5o4UvFF2ACmNz3OpPDhBfzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219165; c=relaxed/simple;
	bh=xW5OUG8Q8l7Lz4izuT+s8bBaC4n+K0ztT6HLKvlm7V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/6iGo7WZjfusREJo88eubMAOdmf/g+5gcYurAwVUgzo8ZvClnGzuzhr8YaIzhJrKVawAJB5F7aTaaUd2o7WqqVnLLoq+fNx8LZznt7drpl+qVDVwr3b7dKOyZ6qGZQlYGQMZPS9Pn7oUGrdL9WvQoqlIEhWAIMu9khaF6FJ2QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYmHGocV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYmHGocV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3547C4CEE7;
	Thu, 23 Oct 2025 11:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761219164;
	bh=xW5OUG8Q8l7Lz4izuT+s8bBaC4n+K0ztT6HLKvlm7V0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYmHGocVNhwt810V4M3tskJPptl7WkO9wS2T351JFqvo8PFUTZKV5WD0Z1hg7XrnY
	 Bh0LfrwVRWDvtJY+zo3u0DrU6FkkCJ2uMaq/xJxVubxY0TxSht+HRGkWTGYbSQvKbc
	 6pnE+qxaY9E/rgiMC1LadfMR6biqgVdL8uJaJQdWdUj3TFc/T77WmnC1fnvvYedNd8
	 +aiqUBMeZH3QDbaRfZvjxq9//ve2bDUkezeY4oEZcS73bJ/98K3BIryU/xaO5noWTX
	 kD9uh0EG7n93BLKpqdSU8oPi2hIB0ZfsnkWeBwe1SDnvG8b0EzUm1oB1Q+Qw9zW9p9
	 1yGyhyNwQddTQ==
Date: Thu, 23 Oct 2025 12:32:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Sharique Mohammad <sharq0406@gmail.com>
Cc: perex@perex.cz, linux-sound@vger.kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH 4/4] ASoC: max98090/91: fixing a space
Message-ID: <e2d5012c-be80-4b5f-a955-ee026d8c4d3a@sirena.org.uk>
References: <20251023070347.1936838-1-sharq0406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ek1LAPCOQ077uUrL"
Content-Disposition: inline
In-Reply-To: <20251023070347.1936838-1-sharq0406@gmail.com>
X-Cookie: I've got a bad feeling about this.


--ek1LAPCOQ077uUrL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 23, 2025 at 09:03:47AM +0200, Sharique Mohammad wrote:
> removed an extra space

This is numbered as though it were part of a series but it's just a
loose patch, patch numbers only make sense within a series and create
confusion when included outside them.

--ek1LAPCOQ077uUrL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj6ElcACgkQJNaLcl1U
h9COywf/biKYX0iUOc/ktLle0lhgZfVffynt4igSjaV6pX2jbBgDbegCGktgbh3l
7y2lxmKKAbOxClbV3AsPcQKDdhMDgPbjBmVmHdu6KzloLB1ByoJcqJpXstjzIA4x
/MQ5DbWZXfvOviWn7aOKEBI0ks67F3KN1gWYO4dP/JVUzthtS0bAUOPqcn67OpTQ
qn5BzGcw8kaLqtZ1i6cxjuqIHdPARGGeG0+Gv4EmT9W8DX/izh3BxbeB37fFXpAn
UJ11DdVKv/6ofXR5W3sRdzfNQQHdSEpx1+yge5CBSmVXbWWunG6dS3Z9ujSOwAJD
FOMv9SbBMra4RhYKZG+6z9HErUzCdg==
=2MrI
-----END PGP SIGNATURE-----

--ek1LAPCOQ077uUrL--
