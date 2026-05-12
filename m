Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1933F30674F;
	Tue, 12 May 2026 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589238; cv=none; b=AH+xyjEaMyuaJn1bWdZ9k4ObsutOE7ViYqs0YF3JJHDyMyncnmc+j2o6S9XqbPLPOmBeUAlK3hvslK0K6N5r/Fe6dQFq31zw9PNywmoUpx4EDXnwDOtDGKzmFAzFmwAZbhGtAC584DFBvlW9g1HnOaoSZkj3G70zYOJqcE/43QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589238; c=relaxed/simple;
	bh=YzaflYOt3B1y/ieVJGNXcRzeXJlFpLakla0BONWij0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6zLQXKfDZq4umLZzhK86rniX5wm/YMNLkeZX/77ig51C1EtDNuz+YdyeFbq18zPztJa1LOImsZT53v04a+OBv5F7rQPdPqMJ2SB3cW4ljX4Kfqti2EeD8eBdQCk+F94DuHYOo6eDqOUFS+FtJ+BNeIkhOmiMnYNT+sP5x2LWhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dl1ajdUb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dl1ajdUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F79C2BCB0;
	Tue, 12 May 2026 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778589235;
	bh=YzaflYOt3B1y/ieVJGNXcRzeXJlFpLakla0BONWij0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dl1ajdUbZ/RdxdI+6AB6b2zu49n9TdFHJ/Gu5Pr8HXEF0OGb/FaCkEijXd9Y4HKAp
	 h6quUrS5wQlFWQHDA3KbA9PjVAXuSLLgLlv7i7eHDm/0nlqOZBB7EHhydkmGMCqGIi
	 aV9Enxyj0zEk8mf8DpAgV4neOXBPi+2JUJYCrcGF7VNhAz1i6fh3vqg7I6hUugA9Lq
	 2+7TDgn7dtS4JeZunjoYw8isiY9XGbJoQ1fV0LEaHYYFQnLbFiWFEUavKbxT4uiy2l
	 sigFA+j3dZRvYivn50XF/yWxaVm/C4ujc5B0oIDhS3EMPGFotJmTYq0lQZt2X43YF6
	 uKAffF32YEMbQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6D0801AC58C2; Tue, 12 May 2026 13:33:53 +0100 (BST)
Date: Tue, 12 May 2026 21:33:53 +0900
From: Mark Brown <broonie@kernel.org>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Nick Li <nick.li@foursemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: codecs: fs210x: fix possible buffer overflow
Message-ID: <agMeMXwKVrjJZ8Tw@sirena.co.uk>
References: <01092e5d-7cb9-436b-82da-fe23bb68f530@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B23FWxdCCJ7G1Fdm"
Content-Disposition: inline
In-Reply-To: <01092e5d-7cb9-436b-82da-fe23bb68f530@al2klimov.de>
X-Cookie: Truckers welcome.


--B23FWxdCCJ7G1Fdm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 10:35:30PM +0200, Alexander A. Klimov wrote:
> In fs210x_effect_scene_info(), a string was copied like this:
>=20
>     strscpy(DST, SRC, strlen(SRC));
>=20
> A buffer overflow would happen if strlen(SRC) > sizeof(DST).
> Actually, strscpy() must be used this way:

This doesn't apply against current code, please check and resend.

--B23FWxdCCJ7G1Fdm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoDHjAACgkQJNaLcl1U
h9DKJAgAgeVgsPqnw7sCrvjoh0+vEihgdrRbaUQD86hs7Py07qj+8LSb2s5Uva7y
eHiD7lNIAc3+lpL5mHHYs6ASRdt3/OJnudCDIYXsL2wDQvA27Tp/SOaryE/72xU6
O5pXeFJLs0uo9MUra3+DK2X6ir6g3Jsn/bYOBSDUQOS/MZJUHud54z1ltIVaI4Ry
kdy0nK2tua1/HHkien4j9h7AbJZBt3Rzj/JEbCDuV9i0+mQ3bcX7U/clCa3e1R+u
Ok73/dp1yNWbxbIrqo5xcw8g9dtk2t5Ta9OJe4tzf0YhpAQvlq3y7vi8oIVenylG
GS0zNpSd3q1LYUK00shI/YzrdeqNeQ==
=NU3G
-----END PGP SIGNATURE-----

--B23FWxdCCJ7G1Fdm--
