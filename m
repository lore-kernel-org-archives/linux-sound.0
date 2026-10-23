Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776052;
	b=wEdC5GQ4MMKpJbdS3JUoEMJguteFKDvTdCvinMlboFv6V1zc6K3udfpcPqvV5sX2/DFb
	 JwOnnFG2TMUEPY/eM2i26wlbqtX/3K2+Dqn9GNkrkUbcfygqqATwtE6S2lExt4fvYVvZ6
	 1Z7jqBIEWyqxS/jw2p7l/xeSLVzYIfoJKXco9xuEXE776Nctq2xe/pWqreJjpWf+wV8YT
	 oXa4MrqFPTdPvWMqB/rgniUMW0UyL0ECR3VuEVaVrmSkTm+3vW8dvWekCvu2zBPTM7i3q
	 YJRgwJsVBtsSt3ZRW7sV1GlG1BXBMyvqQKAzT6J9mNKoTwHVooeBwRvVOa2HrenvPhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776052;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=6WK+5SHDOrT0bCUllfMVaacib/bExx+4xYDbxY9/7Yc=;
	b=n5YignN8B4j45/29SFEvtsi+B+wSrUv/8GQN7RLDvn2FKxwWEj2lrU+Anx8qdN+zDpv2
	 +mTZhps3GlX56u+XGRZa52nagE5g+aBkFvRqIhkcpols9p6bLryiffIN3FmeVA8HO7fDF
	 k1P2IcbLjoq3hzpV4I1PTihSspqfNndKrKqt17qmBDOOjXKcOZN4Gyw9bVV1c5FsPxJ3V
	 oATzJ9Iix8eclkgWWGI7jcl9BZAWI9vBYRj7c2zxJXvq2YAbPKn1g6qNlGgtRB++G34hx
	 Mj7Bks0KYUyOiRT39IeRm2Ty7sZW4c6MvucXUt+N6wH2cGvm2M5sZgAbs7waEQj6jpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZFhXdGEx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C27606A31D
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZFhXdGEx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF1F1F01825;
	Fri, 23 Oct 2026 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792776051;
	bh=6WK+5SHDOrT0bCUllfMVaacib/bExx+4xYDbxY9/7Yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZFhXdGExwjj+NW5sxl2nGQq7aC6IcWSsjoW0uny3ACDMQyiYmq2NwLpTeaTuajUE1
	 aDuZOc9SZYyWC8+voS5k1HY31zeJ7Z+59+m66KD0xLfJrk9Q3iPgsmyrIngCsWNMvh
	 QHcKwTHHPzLtyO9pm57HQalAEIe4Bt163aecF7GPe+UU4mJ7ueRYk286Ej0zwE1qSD
	 CSACv62IxPIxF596aOJugcLZ+bBqdzEP7/hj27NG+MQCodOwrl6BOKj6w/gG/O8rM+
	 t4AA9ML7Pqzh9qjeAx5MC5w7wKmOE6XMT1O3rlcFY0iqO6SDNk6jmpF8nJN49JPU+M
	 mE4/M9cLravHw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 159C51D9ED7D; Fri, 23 Oct 2026 18:20:37 +0100 (BST)
Date: Fri, 23 Oct 2026 18:20:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Olivier Louvignes <olivier@mgcrea.io>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/2] ASoC: cs43130: Drop only the clock reference
 hw_params() took
Message-ID: <atuXZMsTBh6OgKQi@sirena.org.uk>
References: <20261023152722.15912-1-olivier@mgcrea.io>
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
	protocol="application/pgp-signature"; boundary="sXrdRTvYGL7hgiwb"
Content-Disposition: inline
In-Reply-To: <20261023152722.15912-1-olivier@mgcrea.io>
X-Cookie: Whoever dies with the most toys wins.


--sXrdRTvYGL7hgiwb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 23, 2026 at 05:27:21PM +0200, Olivier Louvignes wrote:
> cs43130_hw_params() and cs43130_dsd_hw_params() take a reference on the
> internal clock (clk_req) and cs43130_hw_free() drops one, but hw_free()
> can run twice for one hw_params(). When a stream's hw_params() fails,
> soc_pcm_hw_params() rolls back the DAIs it had set up, the codec DAIs

This doesn't apply against current code, please check and resend.

--sXrdRTvYGL7hgiwb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatuXZAAKCRAv73Ows9A4
iSAJAQDP4ViNoHIn1/hWM7mgwJGqWZ09DHVdwB/UOD7kkuDxQAD/QCR9OMWQXkT/
+d/Zob4bUKCjICWzbFivp5it1X9HMwo=
=L0UC
-----END PGP SIGNATURE-----

--sXrdRTvYGL7hgiwb--
