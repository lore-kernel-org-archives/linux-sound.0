Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7046F19C566;
	Sat,  7 Feb 2026 12:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770468330; cv=none; b=RhEpA2vvpfTH2KOQ0yBZfClJs+wkXJ/ToMbOIk2o8kD3W8Bl81mQeZxoR5Nx5/QZbtrgCF141ntSlk6KuNqB/wvl8Tkujyz5DH//7VvWu7hQ5tNQo24XfqADNXpvoYMX9nK2E6oZmizz1F1+LJmn4sYu2C0TduTVlV8tf94wlbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770468330; c=relaxed/simple;
	bh=2oWqSngRhw9nm4i16Bb+u68AulY9JBFAqsmQNlTLjxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOVfMx7H0Ow1sFZUSvoo8AqLLArFdGNwBa8tnEEoTYU3tvH2YZNY+RBP25+4h1w1dq/Cq67NkG1C3NGFdXm1uhNvj+aZeySNrTnBRAJmaco0WchQDeIpCH1WItrZ8y1Yi4IRzKNJKziLdte4haYoUKKtAtU7xzMYS8SeWt1Aj1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Je+jP8mi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Je+jP8mi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62EFC19423;
	Sat,  7 Feb 2026 12:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770468330;
	bh=2oWqSngRhw9nm4i16Bb+u68AulY9JBFAqsmQNlTLjxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Je+jP8miCYMNUTdN82zvzPT0/U223PVoRZWC960P+yyNxCT1RSgVMyaoqME7/NMht
	 brmbbUnrBtzDoUIdTqURP2gbNlEnq/HV/JrKT4u7Fdk7/oZoCTA4eBwqtkUppB8Q7G
	 wlG2C8KbQMw4uKGrgRmENHYcsf0ViGVi99JLxuKq/YOwYNdWOzhHHC30xWU4fHv9b4
	 NYqmm6AOSspdmYxjjn3Gi5SPjww5/TR/gCbQtJzEX1jNg8Sn7iarBYhdxDYG9yZnX8
	 Ql6uoCCK7PwpQTBDKjw8D8oattzkval4cPqMp1e8xw6MWvozYni7Har3ar0ROZmrgM
	 oH0BhhOV+dEjA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EFC751AC57EF; Sat, 07 Feb 2026 12:45:26 +0000 (GMT)
Date: Sat, 7 Feb 2026 12:45:26 +0000
From: Mark Brown <broonie@kernel.org>
To: qby140326 <qby140326@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: amd: add DMIC support for RPL platform
Message-ID: <aYcz5vlgbtpnMooB@sirena.co.uk>
References: <20260205020706.29058-1-qby140326@gmail.com>
 <aYYqIjmPesB_bo7j@sirena.co.uk>
 <6967305c-baed-4f0c-8201-b1610bdefd4e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vi+aypO2onYTXRhp"
Content-Disposition: inline
In-Reply-To: <6967305c-baed-4f0c-8201-b1610bdefd4e@gmail.com>
X-Cookie: Think big.  Pollute the Mississippi.


--vi+aypO2onYTXRhp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 07, 2026 at 09:44:28AM +0800, qby140326 wrote:

> Since I don't work for AMD, I'm=A0not in a position to decide who should =
be
> officially responsible for this.

That comment was addressed at the AMD people I was copying in more than
you.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--vi+aypO2onYTXRhp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmHM98ACgkQJNaLcl1U
h9CLigf/cmlV1lTo8pO4Size7YH9YCc08lZTi7ZAWCFTJQx+2ZwP0JeOrTy4GnFQ
d9sK5tvE5vjg3C8TJFKXF6uFbahguvrSFCbnTd5FtrbgrmvZTHpLLm98fFMkRxsb
upD9AYTzUIiDWD1HJaxrCHv+iwT6VJabJh5ahxkMssa+GvejpYUWj7B+DnDY7pky
CtdiRSE75I/xaerpOjU6MUb6aI7vaL9obOslmTK7fH7D1hHQ2/YraC7wJDfpwjP0
IBmdYaYR314SM77BA8nFpNdUR2s2rfkH/IGl92VRX1LVstEI1tQ5qtCOvre3apog
SdvmWwtw5xzAlM+/eEIJSbHY8RehOQ==
=QIVk
-----END PGP SIGNATURE-----

--vi+aypO2onYTXRhp--
