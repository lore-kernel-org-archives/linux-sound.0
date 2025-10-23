Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC1C2D5955
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 14:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761228808; cv=none; b=sIBcdRWx6/IpGGzCl0OXPWjNeiTzRSVUaRJZgXO+yv4gVH3MBtX80kGFe7BDucXeSMzq17/tEgOX1i6DD5SdMke515igafb7WmnM0DHSf2YBMNZ71pUJI/mSADX2JvsOxT0XQXiCH0+aIgTwsvkC0kBcJzUn0m1Goq6DN+uOy0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761228808; c=relaxed/simple;
	bh=kYjh8DSjSx6ZWe+8LDEJ668FAOCHysQaImJKgj/p64Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtfXG0Fo91cB0MhGbNbkgUoQX7hr6UpGGFaYnj6/+CBmBQfXdvyOVl9Zdz0q0w6P1Kx4rXyx6ltgwev4syTBK0CRJ2+Ov0LSsnTt4sCQngSSlgQgU7m7t+8dzwGPlQcw+Y9CE4qZwKJPqINhqb43bhhgMxFvJSDqADfgyThXxik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rikYWS5C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rikYWS5C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9BBC4CEE7;
	Thu, 23 Oct 2025 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761228807;
	bh=kYjh8DSjSx6ZWe+8LDEJ668FAOCHysQaImJKgj/p64Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rikYWS5CjaTs2u6Vqp9IXID3hQ8S/OeDfRpM84zhanvk6gmnkcPNYEVL1AJHaau8r
	 LuZpFvFm39zF6Ml9t/iWpfqA8rivtnmrxQvA3ZGKorNVy78djg+u6oHlNaJWXGxFPE
	 N5Axeev6vZ1ZIt9gCjqeSBEnYd53kNm/ottvJeTU7LKqbFPTtNgWW2oj7EY2OmsX7H
	 HVQiaGOllcaJKgEYg3fiwGuaGu/qjsnP5Px53+3+T765m7d9NyZCU6PCFI6eYBxUM1
	 b24dkG79ZkYHkfGLFS4GbXPetkxO6dWT6Dws3zVj5jmT97P0HAQOKEpeqe8jHP1ZFQ
	 FXq6KQKPDp7fg==
Date: Thu, 23 Oct 2025 15:13:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Sharique Mohammad <sharq0406@gmail.com>
Cc: perex@perex.cz, linux-sound@vger.kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH 4/4] ASoC: max98090/91: adding DAPM routing for digital
 output for max98091
Message-ID: <82f0d07c-f10e-46ba-9caa-45c264ced5bd@sirena.org.uk>
References: <20251023135438.2245693-1-sharq0406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BBtM6gtYeVQB1+Mi"
Content-Disposition: inline
In-Reply-To: <20251023135438.2245693-1-sharq0406@gmail.com>
X-Cookie: I've got a bad feeling about this.


--BBtM6gtYeVQB1+Mi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 23, 2025 at 03:54:38PM +0200, Sharique Mohammad wrote:
> Each route connects two widgets, so in this patch, the widget "AIFOUT2L"
> audio interface output left secondary mic and "AIFOUT2R" audio interface
> output right secondary mic is connected to "SHDN" and also to "SDIEN".

To repeat my prior comment:

  This is numbered as though it were part of a series but it's just a
  loose patch, patch numbers only make sense within a series and create
  confusion when included outside them.

Please don't ignore review comments, people are generally making them
for a reason and are likely to have the same concerns if issues remain
unaddressed.  Having to repeat the same comments can get repetitive and
make people question the value of time spent reviewing.  If you disagree
with the review comments that's fine but you need to reply and discuss
your concerns so that the reviewer can understand your decisions.

--BBtM6gtYeVQB1+Mi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj6OAMACgkQJNaLcl1U
h9BRWwf/fVNs8Xi6y8ZbkRSTiHnLEftX3QhNJBqydQqGP6i3zA2qtREcvybl7KZ3
VZeR9MyhRjOG+Bs/UbbrQ2V5CCr2tIc4k0Yi5Fa6rqcOyCplGAMk3F456SwmN9Bm
p8CKYeuaZQWqvQzIOyWg1EN8df86MvJtrgUmEunUAu12wDkIcYisZvX77OJE6Rcj
ddC1tth5JCv+Yst7fnuVl0ejg5UVOWQU0rXCOJWHwj7IOY4I0Yak3btMmbHsY68k
KN+5QwJGLz2qE8XgG5KyGMRWDsUB41Wo/4WTdHjYfjSx60wTywhbwWzwfMHYlDwP
OrRQWw3wL4rSmAEUgb5XtM0Ar/0wnA==
=MkJ3
-----END PGP SIGNATURE-----

--BBtM6gtYeVQB1+Mi--
