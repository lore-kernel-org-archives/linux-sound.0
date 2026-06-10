Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1428E3AFD08;
	Wed, 10 Jun 2026 10:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086328; cv=none; b=mbtCD2J4sCJWuVMPVCiRUA3ojg9GDiH3c5e8sIg14EtiZSIrDMsrSJgvew/uDNMeO/81p/0sNTcXLvxfDz/2gGeA2cPdCWRghjOAPwPPZMCH6tCUDnCSwwKMnW8C+bTAIpwVVulxhMZXOsES2Z4ITzXzwRVuzKmjbJ7znjrRLaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086328; c=relaxed/simple;
	bh=ZPB5zt/VIUn96ErRXiC4UI/BAJj3SWyZAUsYwv4z0qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaaXHoCjZuzFNuAtDUOpfhpzeg+TGHVkZpF6FmYYeZSqN3sAEl9Xvi4ugmg41pDBhrmfiX41KiyZ7nu3/FNSF8Nh+BlY18Yh0tWtCk7sTQ1zmpjakybqZzzD22xN0Ao1L8Vwc3S78LVyd/dxQQir/bGo1agFJeUz9OjTxawp3Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXbtTC2N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXbtTC2N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780A81F00893;
	Wed, 10 Jun 2026 10:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781086327;
	bh=ZPB5zt/VIUn96ErRXiC4UI/BAJj3SWyZAUsYwv4z0qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OXbtTC2NGz1oy2MDhrcOK13Pa1CQHqk7oZc9eKNz70sHDSVASJ4CBUFlFeRp0JC33
	 xQzDeIoV8T7iX8vXidR2jynyE6ZrPwdAbYraTR5edwJMZIUsrx11b5/IOYWIXb4O5r
	 pwzagDcCkfxivhi0hgmymffKfhFBJ5zE4Ks/WifQGkS59f8iLt1lTAdVjx/jS2o7k9
	 m7KHkoCcvesWczqtovPxhX+gY1TqsThgcTpdli7NHRSRBd23WfZhvUwpU/6JjbyLQ+
	 5YY5oK1oRC0WW3O6atlnlbuuuSurQuM7SJB1ng92N4mt0fwA0Sbax9IEBpnbaiTgZB
	 PBUAsK6CC3TVw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 05FD31AC56C4; Wed, 10 Jun 2026 11:12:05 +0100 (BST)
Date: Wed, 10 Jun 2026 11:12:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, kancy2333@outlook.com,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 0/4] sound: qcom: audioreach: support WSA speakers only
 on WSA2
Message-ID: <aik4dCUlumE1A-_v@sirena.co.uk>
References: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZYjR7kSW7kCH+82q"
Content-Disposition: inline
In-Reply-To: <20260610-topic-sm8650-ayaneo-pocket-s2-wsa2-fix-v1-0-18bb19c5ca22@linaro.org>
X-Cookie: Leave no stone unturned.


--ZYjR7kSW7kCH+82q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2026 at 09:41:44AM +0200, Neil Armstrong wrote:

> ---
> base-commit: 1ed783a6906ab62a54d631ff3e8c5cba0f4f4b54

I don't seem to have this, it doesn't seem to be anything from my tree
or -next.

--ZYjR7kSW7kCH+82q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmopOHQACgkQJNaLcl1U
h9AH1Af/cG7mz/CEx2dN/dY19pOPD/v8AbYOGJmBwyD5pp7PyjD8BDO8qACjwZ8+
psrI7bWURvzZI4Hvg6uzLod6CiwD/ryWWCel+akbwlo8S8e3+f0fF3McZtZOIchN
Mys+nNzPDiN+Ax8bWLOkCQkhtmYnLLmnDNVkTQ3k3Lm8X9IkFgbHcC4hY7iMxXQT
XkDjHNFEBfjC4mXkLnAWFFcyBHhLDjjM9qTH3XHLzaNGP38GhN6uf/0mNDhqV4C0
6MikJqM4BRv8crWOumukJUd58ZBOKr0IHqT7vx+SDyyexJ2ssq3wVikksQVNMbgN
PAlSbPDjWQOp+74w1DzEGTBHc6v7FQ==
=I0oh
-----END PGP SIGNATURE-----

--ZYjR7kSW7kCH+82q--
