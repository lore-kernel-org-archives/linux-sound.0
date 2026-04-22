Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26303CF05E;
	Wed, 22 Apr 2026 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860081; cv=none; b=urtN9A53TC5VJ/mgnn+ybaQRFTfq6yWlL8KvX9PjGIyEEgwaw7zxppnLek+mRtfqaNsjY+vkIhb3SceAF6cokMZ/IGIMS235ieOENer9+t5k9jBYoFN5m9Yjtn8+ZUSZkefPjixgS/8BxGoXzi4Ik4HBr+DBLUVhK9NUWfoP8pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860081; c=relaxed/simple;
	bh=Qoxq+GO1QPZdjpBnnx/Gt1UkrPWYsIxtm0i5K0qBV9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6lQHIS3R6y7u6IRNKBXmAfB6z7/YakT2igyU0tCdZ8Na7aSocqXdHM3N39CkHpsmRF/nV10LigPl797iUajpb/E8tk6qup8C2zaI+b2Opcc72Qpe89ahgbkJ85EM1AJAWtu6kefBddmTD+Ykdau6xIUvzx4XUzM+shLqkbhlwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1XkQwNy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1XkQwNy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6ACC19425;
	Wed, 22 Apr 2026 12:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776860081;
	bh=Qoxq+GO1QPZdjpBnnx/Gt1UkrPWYsIxtm0i5K0qBV9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W1XkQwNyoRjxN6SOJtcvd7Xq6+Fn9G2wjVtCP75SwayidZ42jPtiNgoYy1JmsCNfk
	 Psb6+3pCr6FoDvcCqx1IGRUqZlnw2Ck+Hc6fjp9ZjZSURJvs2BJFN0JscInRpwpEhU
	 0U6XY3l8mXHq/vggiAnQDhTbkik4l/Zt1swkB24UCaxNix3QF3nPZLtaKiI0hc+fw5
	 bxrREBB7LkffDY/Z9kgCu5M3WacVij/gBlNqXCOL0bt94cxoH8SqvxqCh3j/pLMP+f
	 wtodi47VPWEHRrIV/JvBbn4EcybXMIMWgb3d8wDpqx9AEQoLN+Gbf6hulEOrvfsjp5
	 N0FhQAac+P5ew==
Date: Wed, 22 Apr 2026 13:14:36 +0100
From: Mark Brown <broonie@kernel.org>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org,
	venkataprasad.potturu@amd.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
	kernel@gpiccoli.net, Mario Limonciello <mario.limonciello@amd.com>,
	Robert Beckett <bob.beckett@collabora.com>,
	Umang Jain <uajain@igalia.com>, Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH] ASoC: amd: acp: Add DMI quirk for Valve Steam Deck OLED
Message-ID: <823eb16f-339a-499a-9fb1-27a166f8838d@sirena.org.uk>
References: <20260421192214.77819-1-gpiccoli@igalia.com>
 <e27dfa2e-ebe9-4cc4-a2ab-6f1f8140bbdc@collabora.com>
 <fdba7581-72b2-791e-c21b-e629d7b86457@igalia.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aOV1wwMF2OEUhLyr"
Content-Disposition: inline
In-Reply-To: <fdba7581-72b2-791e-c21b-e629d7b86457@igalia.com>
X-Cookie: I'm definitely not in Omaha!


--aOV1wwMF2OEUhLyr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 05:23:08PM -0300, Guilherme G. Piccoli wrote:

> >> +/* List of DMI quirks - check acp-mach-common.c for usage. */
> >> +#define TDM_MODE_ENABLE 1
> >> +#define REMAP_DMIC_BT 2

> > Since the list of quirks may grow over time, it might be worth differen=
tiating
> > these macros from the common ones =E2=80=94 either by adding a `QUIRK_`=
 prefix (or
> > similar), or better yet, turning them into an enum?!

> Hi Cristian! Thanks for the suggestion, I'm OK either way, let's see
> what maintainers prefer and I can easily spin a V2 with such change.

I think Cristian's suggestions make sense.

--aOV1wwMF2OEUhLyr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnou6sACgkQJNaLcl1U
h9ABTAf/Ul8JfxKg3YTA9q+XYoQPBI0CrQSC3cQAD+ZgaBwJEdGbHIfE/MdbUoay
OljyhuKrGNFyYh9D42Khub9Mecti7HIfmH7XLqQ9mHB6i8OHlpTH1oidtCYnaWq8
LLFMB4AHHrwrwjg6rELeMj+l/TFZXY7z21uLaHxKK5BxA7lUSISZwDHXlxDQMZCc
GAuJiFHBRSP0nJCAjZcQW2CpdiKWckelepRjx/sioSxrhOLjp7D6b74c/P1eBBmg
hyGam846WGUeM4C/JU09m9fwmZp/6IEtbMsfm9QArfKgubbXFWZbWJomKS9WTmci
CfQAnuPQ1DerWAqwKepfc67XJXjSzA==
=lJ9X
-----END PGP SIGNATURE-----

--aOV1wwMF2OEUhLyr--
