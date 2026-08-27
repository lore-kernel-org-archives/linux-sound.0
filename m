Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8014E37A857
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841277; cv=none; b=pSKrW2rlPLPyMGX+chLOziC4yn5ISsVA32JeYE4qxDI3ItiaSeMFDiQOqq3NVNaUZGbpjQF/BLJL05CiE/8b9kXy6nzD8C2dorJMMH7m81cLiinKFXffea6Q7wufYPkj8eIizaJ89yE/ovRxJY70lTsR99a0wl5ty/N3QxnPmKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841277; c=relaxed/simple;
	bh=PT956BqXQ+LaFdKLwetMKeJern1EINNlW5kVON1XvO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgSbPpS8IlLQfWuZP6WjpLHcjQBsmU7lRD9ACrTkAKUsxksRpv5qHWm2xCxvxCnTlb92Yte+3aZX66ABJqmMoMOe3xGYej+BNEUK/iwGvV5atkvqojmyPuLu/Gejo7NEljWM6rAoJPBGx5AwUCgClb4Nk/RH9NCFlfYQs4hEtfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bx390xNW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bx390xNW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B391F000E9;
	Thu, 27 Aug 2026 14:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787841274;
	bh=UCEr4eNZlTfY/W6fag0KX06fsD5CfwYi7jkoqhrMwmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Bx390xNW0grnSajaOzhIj59zIn1+YEJVp87UHGjFfz9+vFZ1Izm4MV8s1X0okZBOx
	 yNBxn9awnk/h2VhxWNA9vwJkfQkuYFceweBGEeDF7Nim5gmTw7rNMwJ4y0j+scFM2o
	 mP7AkzTKy+jq9y/nvnUv53viNhFGMsvRysTAJflOub6KEd9PyG66NCvxRxTENfMr0Z
	 5GhvR7Wa7lb0Xm2QXECvRqfZuD4OofbGAnef1ur+pZa+3xosXosh2P7cxhRDoaMiDK
	 Aa3+cReZwzOgZgWEI8pd0fKzecoxa8bX0aRvKtBcBlipRmvKBS9ofYmdKeiY3RP/Da
	 3wJnqQi83EW0g==
Date: Thu, 27 Aug 2026 15:34:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 05/10] ASoC: Intel: avs: Clean up streams if their
 initialization fails
Message-ID: <8537fc06-7d8d-4a25-a111-5fb6e6121253@sirena.org.uk>
References: <20260827131510.1014084-1-cezary.rojewski@intel.com>
 <20260827131510.1014084-6-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y7+uiWV5wNat9B28"
Content-Disposition: inline
In-Reply-To: <20260827131510.1014084-6-cezary.rojewski@intel.com>
X-Cookie: Alimony is the high cost of leaving.


--Y7+uiWV5wNat9B28
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 27, 2026 at 03:15:05PM +0200, Cezary Rojewski wrote:
> When streams are being initialized the memory allocation may fail.
> Have an error path and return early if that is the case.

> +err:
> +	snd_hdac_ext_stream_free_all(bus);
> +	return ret;

I think this needs a snd_hdac_bus_free_stream_pages(), or possibly that
should be pulled inside the cleanup.

--Y7+uiWV5wNat9B28
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqQSvYACgkQJNaLcl1U
h9Bj4Qf/QH37A3PvVbGkYcwtyfozPxPBqcjMGPZIzkmqXKio+chUjk9fFoXMxj2A
v1lkyYMcHpE+duaCaD5/FFFVPA2x5cDgAolRD+b/AHu7fQzAK43oCZLahEwGEXva
gqgETPygPwC6XTp4x5AC09YtHBVZ/SlG6C1uAMgMxqxJfuzFGj3IqHcIJnDNymHP
7xAwp37o7t4B1CcH664zE9sr8LXUNfiykzwPZdgnPeRywUtMQzXJq/4xdnOl6RRJ
odtp05rrzB9JKihsKQ6UwoU4nb7DFMWkCYFGfnFg5EzJ1Ybj/8T+a8Xl13IAHE8b
rAn6HUTL/itewgW/kA2CgfPr1FZFfA==
=S16j
-----END PGP SIGNATURE-----

--Y7+uiWV5wNat9B28--
