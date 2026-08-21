Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E40047CC67;
	Fri, 21 Aug 2026 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316892; cv=none; b=bkKBpqH8gsZjM970ON1o2Gw4cGGEi8oP2Jkg26xsmtuTD41Kbawf5pLSpIkPDtlOn53RjBdag4u5ydsxpXhGS/9WxS/DmkpyFP396NJZSfRdkxs6qywGJO5SsZudyv/5XEOXkLBxL0IRhf4honH/jBscoAPfSsUjR3CNS7/+SQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316892; c=relaxed/simple;
	bh=sHYk7pHFoKKRSisfLsXNJvykkpmKjHR8RmZKProaxyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZCwsXSy+/Q9NmGH0qbcgWjL+RZbwkhxhxyovW3YYVVFxK23oZCPV6YLrA6IfdNgv04yLJppLKkeDHaKXk/9kQxTbO5p8H2VJ0pToYFTwREqpJrmST4tRMAJ47hK4q23DHNiU0gq4zTSielpCGd/WUjtSOcPquSm4HMFckaGhJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8ULxmgq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8ULxmgq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632F61F000E9;
	Fri, 21 Aug 2026 12:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787316887;
	bh=sHYk7pHFoKKRSisfLsXNJvykkpmKjHR8RmZKProaxyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O8ULxmgq5ojU+YIkh3HLY4cUJcQEma3RkI66ZnxSDZ6lCZZ58doTfXpYZdTdL+0Ve
	 UislUcnOsxafNgPW99WwT1N4w08RVwL0izxk6uZdQPBEOExIhjlYpCq+J6e6ASj9Tx
	 J9WeJtSUXSC1Bph2B3ueSRaJFoZpayPHy6qTt2msP1vYHaT7/1q+Cqcgvi+39aDWtU
	 plf7j304dMo/2FtC1tglXM/XtVbdIwtftBKAXj0/6h2ww/mvRvVeyR0mVZc1M4I661
	 k1Y8+7iyIUOwR4UQdXmm5vjUcJk/7TmTzUgQ7PS35MrvOfSNB5ZRIZ4GUEQuTYlOny
	 MdpfxoFwlRoEQ==
Date: Fri, 21 Aug 2026 13:54:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Karl Asseily <karl@asseily.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M codec
 driver
Message-ID: <899f3b8e-cebd-47fb-95d9-9eb031a37e51@sirena.org.uk>
References: <20260820062626.39218-1-karl@asseily.com>
 <20260820062626.39218-4-karl@asseily.com>
 <7f2e051a-1e77-49e0-bec8-e178855295b0@sirena.org.uk>
 <CA+gvwbr4gUSU3w3PxDjSeKQ1oyXR_psScTZ1ecHTb7boZsK=2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yWrwwUvbzRhT6Pkg"
Content-Disposition: inline
In-Reply-To: <CA+gvwbr4gUSU3w3PxDjSeKQ1oyXR_psScTZ1ecHTb7boZsK=2g@mail.gmail.com>
X-Cookie: Package sold by weight, not volume.


--yWrwwUvbzRhT6Pkg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 07:42:54AM +0300, Karl Asseily wrote:

> For context rather than argument: the board I wrote this on feeds the part a
> fixed 24.576 MHz oscillator and runs it as a clock consumer, which is why I
> had the async case in front of me and the synchronous one not. That is a
> board choice and it stays in the board's DT, not in the driver.

That's a convenient base clock for 8kHz based sample rates.

--yWrwwUvbzRhT6Pkg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqISpEACgkQJNaLcl1U
h9BTjwgAgcjVE7eYtdjgNnxz9lBI4mpdlh2oVHKhc+t5Jx1vpZqptRkD+W58zlQr
F9MHJ9Y3cI/G7Gf4NIm952XGaltKcj+p7seKL1e24Foxpu+Zw7Ujue58PGi9jZ4a
UAVYeQ4XhmfCJnqmMaMvg6JLJ3cmTMTKIRTMQCw7gaefGgwiWI/HF3HVEEOZrG+V
942N+m+rG/OlDhKIjnG8cUpQ7XXfzWBOeWT1B1ExnXG5RTCHwG+VAGvVtNsVexg0
abT8WIfTEugE4QRGuF1IadhkYBqC9SWu8cG4pq9B/q0gN19gvROF1pZe9sjOP0pO
Qls/C6GMddxzmh3z71qKrP1vQAPwvA==
=Wtk+
-----END PGP SIGNATURE-----

--yWrwwUvbzRhT6Pkg--
