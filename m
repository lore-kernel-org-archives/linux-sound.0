Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B150B54673
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985057; cv=none; b=ams/15so476Yd42WU73suGzJUtZKHjFmoeZuEWPGSpSdIIHfOVCYkQDnOFd+vG3PeYw/5Fk3GTB3vjFNlLQAq/WpbmIFXzr8hvZpLCPI9LDcnPA3QaC/3suXQfC0wsTWi3vz40ER6sErSBfKj4r2c4UqmYkI2heMdrRt0KV2lHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985057; c=relaxed/simple;
	bh=N1woblATN/7banZGoORXwFf/ncTfvuXekdNBzOt7kLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kp5Hlwt1YSgI5ZmMzywPB8qqAxjzvcfeqPv3RS1KHzJkaJFEQr6b1tqfK1opSPJNVSRH8NSr9y41Aqkl2tBGbnvuee3OW7fWGhbMD0tyI7QFszzlkPgbCshsPNKOxKe+Pwx11hlCT0C4ScQYkiZJxF49rBPXGI03gtaeM7LeZkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXFK27lS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXFK27lS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D3FAC2BD10;
	Wed, 29 May 2024 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716985057;
	bh=N1woblATN/7banZGoORXwFf/ncTfvuXekdNBzOt7kLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HXFK27lSbQ5/U47znzYh6LjXDUwAH5jHy1uF1KK/9T3uan67/4RPQhmlA9lWuq5jp
	 yfKbNSK7wabuDCoT/PiKd6cNGo4Wnmk960mfg42gGv8LsnHcWtmDS3ONV0GbsGxwVK
	 ujw1aqlbshlfQNVr7svpzTfvidmTKYT37kA6clnhtQevkjSJVwJHUfG5W9x9F+ZJA2
	 PZ3LCIHNtctSh//u1RieO1Luhu9ANZ9kK7GYr40iMKie/hOodNuspxBifQ4vlSbFOT
	 vu3PBY8FB2Y5Q9S+27RYK+hgeyBIWJ6kBZavMPOGVNe1r8DeuXg3UKtqwd5ujtCPNN
	 kzwS3cbpJ6U3Q==
Date: Wed, 29 May 2024 13:17:32 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com, seppo.ingalsuo@linux.intel.com
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Add support for NHLT with
 16-bit only DMIC blob
Message-ID: <cc7fc8b7-d470-4330-8cb5-6ba85065c74d@sirena.org.uk>
References: <20240516075611.18018-1-peter.ujfalusi@linux.intel.com>
 <d4c5e7a3-710b-4ff1-95a3-395dd780fed3@linux.intel.com>
 <3a7fa9d4-dd14-4b29-b977-3ba9c5b4ade7@sirena.org.uk>
 <53897d0f-1796-4823-9090-a51320c655a4@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jsSzGp+0S5TdCSaw"
Content-Disposition: inline
In-Reply-To: <53897d0f-1796-4823-9090-a51320c655a4@linux.intel.com>
X-Cookie: Everybody gets free BORSCHT!


--jsSzGp+0S5TdCSaw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 02:57:02PM +0300, P=E9ter Ujfalusi wrote:
> On 29/05/2024 14:48, Mark Brown wrote:

> > Sorry, it's already been applied and published with more stuff in CI now
> > based on it.

> Right, I don't see it in for-next, for-6.10 or for-linus. This patch
> should be sent for 6.10 and I can prepare and send the rest (4 more
> patches) to close the remaining holes regarding to NHLT blob selection
> logic.

If something is a bug fix it shouldn't have a subject saying "Add
support", that is very obvioulsy a new feature.  Have these systems ever
worked?

--jsSzGp+0S5TdCSaw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZXHNsACgkQJNaLcl1U
h9CXbQf+KdYE9JNOiHWo7W6FnvuePk+4nSXH81LG5uI7L5cnX7XJqsRyUc0a77Gr
aNpT4hIELyQH/7nf+IGi/989IG4bhI6t8jRgdF8sIR+AMfhc+pkE7L7K20i45m0z
fGDDBklxRz+tH/hDwyrUayK21eYXE9SdVW9T7hOyCNNFLrbzKttHsx6KA0YyjOhm
5YC3qgdJ4C69pBPTvN969CJ75/pfh5AzyDuvK/j02Tpb0sY7964NKUBA+gFr0yk3
D3fx2nJjvqy8ICH+CORpeIHzJPrTjaG58xMySDTtQdND1NGqFjO9tCCCh+vSncv/
L6wPnbery/1cSyYysEZyWqnDdgmW1Q==
=rRrE
-----END PGP SIGNATURE-----

--jsSzGp+0S5TdCSaw--
