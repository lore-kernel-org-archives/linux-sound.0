Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEAE3054EF;
	Thu, 15 Jan 2026 19:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768505229; cv=none; b=SmmwekplTYC4lCDvhgHu63+kJCfcSwA1/4ivvbBUyYM8ZtCfhZ1vv+FZJ41nQSOW4pwIlnZ22ecJbZFUyBmZPjmxL9pzfHlOCPulVfDi/HGoEkQCjQMudhZaqa6AL5ZKjWRJC/zLV7oUABiNJp1dyxZHqmug3xWmTtQLJ328hZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768505229; c=relaxed/simple;
	bh=t9OemQq7qyjaUCD1L7uG/Zy02fXn7C48Q5H/K56TE5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ai2Q5ZjDp7mVChlF8CQjWUNKgGsWDI6D/hH2MTUzTvny+jSGBCeCZ3y2XD2vVdyAvoX5htfG3lDYqqy6aEM4KLsgl/xV+5gau/9Oe5aomRx12fwoN3KGM6Exmm4pX8T9buhSOXYqOun2//JNvrTZmbhSOBS8ayprDAggEWY5X8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vBclFeoe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vBclFeoe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABE2C116D0;
	Thu, 15 Jan 2026 19:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768505228;
	bh=t9OemQq7qyjaUCD1L7uG/Zy02fXn7C48Q5H/K56TE5o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vBclFeoeus3pEfedN5WdmK/oqqr9ay4ZFsxsprZ5jQqW3ZYq6JyxETxA9wNf4j+vL
	 Um2hii3T/QrjkOrUEKYvwsaOp3ABfEWzSJA9FzeJuHNtEI9XVuMXZpcHDVdCRRp5nz
	 AH5cCW1cUUhv+PAbBdtPTb9xBvetq+FkTF0xspcHdZ/KgR9J+sq7tQ/1y+KxaRQjBS
	 bgRvNn+haS277bvSFFQhD58dAboTClsovwq4HEUB2rrVQ1RpbsBgIRASs2VXJXjPQN
	 dFv1juJdUVKrSRZcYI8HPgnPuBMudSOu1njqH3Pk4zwv5khJifxvPE3VOodZPazmph
	 IJ2wne0x6y7PQ==
Date: Thu, 15 Jan 2026 19:27:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] ASoC: Corrects ASP_TX5 DAPM widget typo
Message-ID: <37640d4e-920a-4968-8b49-0eaa6448a0ba@sirena.org.uk>
References: <20260115192523.1335742-1-rriveram@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tD4hwbZI1UNYAPzi"
Content-Disposition: inline
In-Reply-To: <20260115192523.1335742-1-rriveram@opensource.cirrus.com>
X-Cookie: Are you sure the back door is locked?


--tD4hwbZI1UNYAPzi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 07:25:09PM +0000, Ricardo Rivera-Matos wrote:
> This commit corrects a typo in the channel number of the ASP_TX5
> AIF DAPM widget.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--tD4hwbZI1UNYAPzi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlpP4YACgkQJNaLcl1U
h9CvAwf+KfB1B6zuo3qSbjaqivCVEQpQZEyVjdmTX1IU3jQLq/LiVAlCQzkCKRJy
hSpn41Ln/KjgnZ7oek0krmLrMysGrkda8by6sQg9x11q8NLuZYxqhKB6jApWKQdz
x/lrqgdgOmcx5mHNuVyILoGJNpBl32NTW9Q22CNCw8eVN0iE8rd1M5Hwalwftd/3
nf+0qMr5F/V2JFPMP9iEb9qEM6XqKD3S8+1/DimhSIQYqypNa1FGnbvxapvis4IX
Je/s4us817gePcTI+XBZ75MpXm3P5Z+hVVoVr9rL+ZgYe/XNUW5rlON89AA2z4Uv
f1Ko/yctHYSTAGH7CsluKrnh6SPahw==
=vWEq
-----END PGP SIGNATURE-----

--tD4hwbZI1UNYAPzi--
