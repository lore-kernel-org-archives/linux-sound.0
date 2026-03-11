Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25633C342E;
	Wed, 11 Mar 2026 17:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773249107; cv=none; b=jb4HfvWJVHSZJab6B6aqdv/74DSOBFXfFFYUcpbQFr0C6jKoGAgeFy44+gRG9QkexUJOXJ85dLy5bsfR4+U9hEenFFvoW6kBN36PJK6aCr/Qrpt61191SDcO7GP7NTrl5aIGLJmyjTyi1G2THCW6y4iQyadBiiS1L0LH6We18lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773249107; c=relaxed/simple;
	bh=ski3o+OlJo6Irxelj5QtHpR5K5TrGA74XLQJ2pTJjso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NlqsG4qGLxOXjuVW8+kvVMLX87gW6cuVHYfllVxcybnUCYTfOjGY5uAewv22Kcnbq0ane2l/BBKAT+zxbW0o3apXO1GQM/gmHnsp5SlxCj8zfNhRb2W/NZPnUSL/q9chkJ7HDiVkBC89wVxt9LB9r3fX1nYcOReJ25R2yTHH3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnAFO/9+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnAFO/9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D24C4CEF7;
	Wed, 11 Mar 2026 17:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773249107;
	bh=ski3o+OlJo6Irxelj5QtHpR5K5TrGA74XLQJ2pTJjso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GnAFO/9+IoEfvjuSoPkj+11TirXKJ8kwGc7evqvzZ629H8XNTjhtFzHc212NDZBVO
	 JWJMDpJcVonPFverrnm/XrvIhr2783dWznTeLXTUkAS+b/0D+B+XfB3vva0jTqoJzs
	 EFpITFBJbT7Xcvekq5qwyQLM4QSL4qQ5mc8rU7hnnfIr63fB8RJJpOnQuAMYun8fF2
	 FLix5yV7yGhfWPNjydCTsesQIT3a5wRAUXbS37M8EO7GQ5VCSnwcx9XCx+7ofLGKiB
	 Qn2f2hChT2fAmfjJRFUa5ILtC0RyOMf7fMYrLFL5d1ignl4GTI4W5Q/hKavCD0VVUU
	 VXuJTLhqXfVEw==
Date: Wed, 11 Mar 2026 17:11:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, perex@perex.cz, iwai@suse.com
Subject: Re: [PATCH] ASoC: soc-topology: fix __le32 conversion in printed
 values
Message-ID: <e535797b-2a15-4996-90e4-33d13bf5d689@sirena.org.uk>
References: <20260310094948.62023-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y8ZN+7r/KXJFYmsF"
Content-Disposition: inline
In-Reply-To: <20260310094948.62023-1-ben.dooks@codethink.co.uk>
X-Cookie: When all else fails, EAT!!!


--y8ZN+7r/KXJFYmsF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 10, 2026 at 09:49:48AM +0000, Ben Dooks wrote:

> @@ -225,7 +225,10 @@ static inline void soc_control_err(struct soc_tplg *tplg,
>  {
>  	dev_err(tplg->dev,
>  		"ASoC: no complete control IO handler for %s type (g,p,i) %d:%d:%d at 0x%lx\n",
> -		name, hdr->ops.get, hdr->ops.put, hdr->ops.info,
> +		name,
> +		le32_to_cpu(hdr->ops.get),
> +		le32_to_cpu(hdr->ops.put),
> +		le32_to_cpu(hdr->ops.info),

Shouldn't we also change the prints to %u given that le32_to_cpu() works
with unsigned data (IIRC)?

--y8ZN+7r/KXJFYmsF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmxok4ACgkQJNaLcl1U
h9AF8Af+IMzw76be/pmnlEH92RvB+UnGlrLnbVwaWAaYWA7YOTbER32c/u0a7z+B
3INt/ozUcLAYouyh1F5UsB++bB2wo9pGxW6HMOUUb6J/vE7YH4WbLztA8NJ0IVZe
f1QDjrTZP0/ObqjuWnVgPacgYg+D01RgRp9h4PW96eVYLYG602AMvTws9U9/utfJ
dmZkWhbhSBuPEr/wY7VTB5gY2ZAX7N7isk5+Wjew8FxkAI8s47vcHQVhruGuBAV4
3bRDsTkNY7EDgOrtDvszUJnJgu8NhXao9JAeG4b4ifr6cLFaywDlLRScmMF9rA3Q
HvEIilSMRa8XEZH+hn1SRdxdPjGvtw==
=it8j
-----END PGP SIGNATURE-----

--y8ZN+7r/KXJFYmsF--
