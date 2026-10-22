Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792674627;
	b=4+9TYXmiDfKX/zSnhhq1EDBO7pEUpU9/fMbcl9XgXFFXSMRpMnYCkMYd7QrpU0pcQVyO
	 7qq85b3m9u3R66O1W0/5w9N1L0bJaAlQRwoDX54VvVxjOW+5H40C7KCSiJUycqnNuyAfP
	 /8fajrYHuIgEFguklUIDllnwIAHFOU43blMzlt4a9S2RzZkROGmus+LzkrLhFlKCK2E27
	 kdtWxWlMJCW7pNwjYxvlN+/rJ+LVo7ZhTIl1ECAVLmpSqNdJvWjmdJFRpV8KbsbASKIqG
	 1oKthln1lEYjGu7L1xOmx+C/T1vZGjPsjVQVrmKs1aXGXDDOzG39VgUwRq41ak51JDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792674627;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=3ft8KqiPscFaoEsUO2OiSYiU8eHa8g9BGqX7LduNgbg=;
	b=UtiwVe+TTQAEu92Ytzs8CqhYF7f5wTiWmqbv403ce0QCb/vO0wfg1syI3tgt1RrB1bni
	 wNBZMztSKEbze6W4oXTZwjVxc1NlvV6fuIahjxBIa4j7Mgu27dpwNOiA7X2xqhblMHqcP
	 FsZ/mNuyHCTwt/TnUI/+9q4rMXarOZaAbkwNR+EB1UO5g9wRRjDZy084wlBfInCfpsve/
	 F0n2FHGbTXm2wjTMj1SVtTOYUQyrEWfkPsBzudiCFhC3BnTXJWxRyYZUh5T2AZ7cbYsOI
	 ijd+bunyvACmLqi0XaLDXlr52clhCWp6BWKMDf6js8dC9YmF9a8fsiwfiiPp2cKEr6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="E/swYxkm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55563606A319
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E/swYxkm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBD11F000C1;
	Thu, 22 Oct 2026 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792674626;
	bh=3ft8KqiPscFaoEsUO2OiSYiU8eHa8g9BGqX7LduNgbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E/swYxkmfqRqgihqu/FayNKlpR0/lZzDHsH8FiXpNafjqusPLPq/IJpl07xroVKHm
	 ACnmRRQiq2VCMktnFW7kpSo3UEerFrZWyCO42/AuqNhQqF6IboibQtz2IAg1qzkQQk
	 zJmnq2H3sPuKt+QmSTMvDGqQVPxScjAjzVaRSAqLHL0WNJUvT++B3ld3Snmx6mS04e
	 714KvBeMGNZAgu3VDxMW+IEBc+ub6DnEPrzNYumcLNayzFtUL/SzZWIXFfj+Uvrjwj
	 6mNQwoufD0uS8CoLX/BSDjtTUkdOOv1PP2qRiyBpRJwMn6c6F+XP2OQnIRfB2E+uzC
	 uOfuVb72J6fKA==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 9CF3C1D0A566; Thu, 22 Oct 2026 14:10:24 +0100 (BST)
Date: Thu, 22 Oct 2026 14:10:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Artur Weber <aweber.kernel@gmail.com>
Subject: Re: [PATCH] ASoC: wm8994: follow AIF clock source changes in MCLK
 gating
Message-ID: <atoLQOlXNk60Sj9B@sirena.org.uk>
References: <CGME20261022101551eucas1p2c70c5e2a5e70d8c157a11f9a6df3c7d8@eucas1p2.samsung.com>
 <20261022101531.775891-1-m.szyprowski@samsung.com>
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
	protocol="application/pgp-signature"; boundary="MRA6yih1QCPqYUqG"
Content-Disposition: inline
In-Reply-To: <20261022101531.775891-1-m.szyprowski@samsung.com>
X-Cookie: Whoever dies with the most toys wins.


--MRA6yih1QCPqYUqG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 22, 2026 at 12:15:28PM +0200, Marek Szyprowski wrote:
> The AIF clock source can be changed by configure_aif_clock() while the
> AIF clock is running, for example the Midas machine driver switches
> AIF1 between MCLK2 and FLL1 while AIF1CLK is kept enabled for jack

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--MRA6yih1QCPqYUqG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCatoLQAAKCRAv73Ows9A4
iYDaAQDTHG0vhLAs+WVM1XtmZUi7UiWle0lmvi7TT9vRUfMhDgEAqIBXkE+DFRjF
F5gRoVj5IBcH2jrWAzKNM6ElgPkPUgM=
=AYXZ
-----END PGP SIGNATURE-----

--MRA6yih1QCPqYUqG--
