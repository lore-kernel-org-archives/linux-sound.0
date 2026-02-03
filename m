Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3A3168F1;
	Tue,  3 Feb 2026 10:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770116379; cv=none; b=XzV16Uh+siqO/YJwmYPeDzAsVC8bFphosbe1YVRRtwXSErASIrnq2pXYs/fevftCjMDCDrtTRKlOpIPPVZqjaCUCg87WsLQs88zGeO7SQoaEKLVtH0OzjohirHRbbqqyKYzXG8A60cA1t7IzM07Cp5jWuee0WnMF9ebaX4oEoh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770116379; c=relaxed/simple;
	bh=MNOmP/KauS3KHh9e3UmdJXHQXsK+adKXB68WCUDXAOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiBBEsDj06BaFIea/+iwAF9uNJp2q3De+mFWlGmbkVTR4kf3os7znsXgqdjhWnrqr3a8LPk7D2BWLPjevjI27qj7pZ/VYzAVBprWC5ZROQJnCOYO2BpiUbfDwLcpYTWaCIxviIPpI9nnNmyxi5vFImNOhfl8m9sB8hQpZA9zddQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OegHMIDk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OegHMIDk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA62FC116D0;
	Tue,  3 Feb 2026 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770116379;
	bh=MNOmP/KauS3KHh9e3UmdJXHQXsK+adKXB68WCUDXAOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OegHMIDkBUHFA16udIQyGqHKzxugdy5ao67B8e9Wnr0z3Khgsc6/FK5vUKneX+yt9
	 Y97GJ5Km5RJYnEQ3ZXa30YGAdBceUSiLmLnu1j8AzfxCbXDRXJNoAXzBpY0xyhMfRw
	 Djl7/lSusp6ETNDFxTo9UzQxPuyFGS6V1qROHi3tZ+csubsjHLG8YEPw+XTKEGcgQS
	 TOmsQOOTugnATguufM601BxLtXCJAnSEkO/MVWKIP9gN/K35+cdj0b3H0WdZ7c3PQ/
	 EB6is+QjFVHzNFYYK5PZCA7rXM0PWIVkfiVtL5Xa0VlxiSlQhEcP1SJhYXeR5ng4L7
	 BSZpzjxdhvAhg==
Date: Tue, 3 Feb 2026 10:59:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	linux-sound@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] ASoC: sophgo: fix 64-bit division build failure
Message-ID: <fbf33a00-0eaa-418d-bb18-485303d2ff9e@sirena.org.uk>
References: <20260202215956.2127414-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UWapCoQ5JjHEjpoR"
Content-Disposition: inline
In-Reply-To: <20260202215956.2127414-1-arnd@kernel.org>
X-Cookie: Do you know Montana?


--UWapCoQ5JjHEjpoR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 02, 2026 at 10:59:44PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> cv1800b_adc_setbclk_div() does four 64-bit divisions in a row, which
> is rather inefficient on 32-bit systems, and using the plain division
> causes a build failure as a result:

I already applied v1, please send an incremental change with whatever's
different (you didn't have a changelog...).

--UWapCoQ5JjHEjpoR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmB1RUACgkQJNaLcl1U
h9Caewf+IAKNdK3WOEEJyBo5wyq7iR7uemOvRnnRPUS4Z2ecE4ONVGZtW2S26iOJ
05gs2R2rZEY1b5VUnBnlviwznZOU/dSbgspE7J1OvzzfSjx2rZv84knB+mQcw0Wf
J9N4BlJ44nxYpX8jHz+e9VcsdX+32a+7/JfZwQUDQ8iM8kexztDchXBcf80Uu3mO
IVMEq/NHCNTd1P5Llvas7YwEf78xCJTWARRImtwabbKaKkuQCpBM8lPmH43THzCd
JhZYvt2DWkKq0iXtl6XM3PYa9sAXw7lKu835jzzWvjtTLNyl0UNNCO6n7I6/DQNQ
b1NXkNHWsnOR/aUSP0a7qumntFyt6Q==
=1F0H
-----END PGP SIGNATURE-----

--UWapCoQ5JjHEjpoR--
