Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178900;
	b=mSP2UBtBd1yvsdA2T+kccmJlq6t3QzMHf/tp3D81ATYfpQFJv8a9kEKxZaMcPCUbeZqy
	 xhIBXJ3pw9cRLsTc1PJ4cFAaNFRsF9msZT8vv8GxIEKYrXgj5UnUyksW8n9LfuT4OVzAz
	 k7F8JuxKLRfIwdQQkIivbAvLXW4mce4i5pamGPDFXJmN8QEmyOTnWVkeCeMjYiNmRyYmt
	 GV3ZW9fOe7bC1N2xeKbsPo6+sq0qOB6AFpUYfcxA3TQrDyBOqxXJINGAKEOQwoKUWPj/S
	 Z8VoyNfd+XZWPpfwg3ThBNTiPXAZgZEqQOcwupgemmauPK5MCmv2JlylJSpcMXYHmLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178900;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=Cg+yXYoA3oibNedrGmE7N4FdC6+zKg0DLBg8pWT82MY=;
	b=VWhZOpekcUdwN+7Du4pU9sQB5ftuGT2Hf6nXZymcKiCxK5f8UGED3CRcvHXoOQL23qFF
	 qJTnmdMAsv4MRZkatgXom3vUKUoMfdhJWO9lL+ZWPK+eSKdnpvLPZFvW8j3qVdSXL8Dp7
	 i6Ani2EQys7hamxAR+zbWdwI2WBVpRkK3zI1IK60NY3W0YCjq1R7pmJc5zU97B1Ig7oyO
	 dkTFCIf8dMFEBPHmiuBNFV9zfIwZLJpxypk14jUNpRgnW+5jP8c2GpsE5T1ugcTtweBN0
	 UphUv2X7kmW2RV1Opw8HNU3ZFra44CCl+6xgPHS7dyXQQESRmoEFu/Mv7KLMqRffdXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YC6ZNfva;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68FB60A2606;
	Fri, 20 Nov 2026 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YC6ZNfva
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312651F000CF;
	Fri, 20 Nov 2026 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795178900;
	bh=Cg+yXYoA3oibNedrGmE7N4FdC6+zKg0DLBg8pWT82MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YC6ZNfvavCAAyqRXdeOXOCabwgg3Xkez+bjA5m1MdYWJ1DJ9tE9adI2MfgaLQkQB8
	 Wj8/5GTGeYenMYFTOMwnodtMWsZ0yYxNij8l4QLVE/Yt05ZpKgpQIoj+56XrvW/miL
	 aaTuy2nZoJOG2zrMarmA4jkCnEjS7GddiFVcy1/vub2v1IsQEJdqbZQZFfHYvbY+u1
	 rJazQlT1WoNMcEzIAGhO7CtiQ/Y/w/n4YJKsZDhKTg1oxVE86nAcV0Px410vZKPR3q
	 f5RhgcjzY6XnJfVHzzDZGiVjO2bn4rCPPf9vHAz3j6kPTj79ts9STaGkA2KsFf0WbR
	 f41hj6kd8tlqQ==
Date: Fri, 20 Nov 2026 12:48:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 0/4] ASoC: cs35l56: Prepare for SDCA Companion Amp
Message-ID: <0315d02d-1d6c-40e5-840e-36d23eefde5e@sirena.org.uk>
References: <20261120110441.2163567-1-rf@opensource.cirrus.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+/kmc2Pm4ZCxV7zZ"
Content-Disposition: inline
In-Reply-To: <20261120110441.2163567-1-rf@opensource.cirrus.com>
X-Cookie: Error in operator: add beer


--+/kmc2Pm4ZCxV7zZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 20, 2026 at 11:04:37AM +0000, Richard Fitzgerald wrote:

> 0004 is KUnit testing for the changes in #1. This patch depends on code
> introduced by the previous pending patch:
> "ASoC: cs35l56: Add KUnit test that widget init doesn't write ASP registers"
> https://lore.kernel.org/linux-sound/20261117154700.840631-1-rf@opensource.cirrus.com/T/#t

Do not send me patches that can't be applied, managing stacks of in
flight dependencies gets very unweidly very fast.

--+/kmc2Pm4ZCxV7zZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsAQY8ACgkQJNaLcl1U
h9ANbQf/T8qDs25KSOzdxQAD53gdQOe3fckIgrsBxVbqQ1fMPTcVntZ2n5I4NG8Q
ihHBVbmEbKbEgNZrWPjpIFS3AApCYKlFMYZFegnM5EF2jcRqRJ+UJ7lh55vC2R9A
fUW4HTihqj9DIOtgpQge9yuy1ppWvmkBGhBJ6wPVJXf23Z9yNGOJgbcwF2/PgOo/
SXDdunQ/hYaQCTGatofY8uVMdkkmqpmep53pT0GXywzMN4EKOXH3gQMbMiIjlQoW
Jkn/QMwOZUACUJG2n0mZMnbncytyqLnkaU4AjUuW6M/6aXcmqzxuu9LeDOtHsR6G
8g0D6KWm1DWky2BVxhqQmWQuKRbrSQ==
=6NMn
-----END PGP SIGNATURE-----

--+/kmc2Pm4ZCxV7zZ--
