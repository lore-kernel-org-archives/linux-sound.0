Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB4E194A48
	for <linux-sound@vger.kernel.org>; Wed,  5 Jun 2024 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717587604; cv=none; b=RB0ZFaE5U14SAVrIAmwcGbjTrqLVwOo0iEK4SgNYoAi19ZxE4kNismClkUyRCPjm4hYt4uazzKt4oWyADj7z/qHqIXc2X5O02KkdBdYVYcUTZgb76nzCaHyNdNKmAIlc/uVL0sBiPGs44710d0LqKa+qJAaTOhfkXqDwbkihBl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717587604; c=relaxed/simple;
	bh=uWT+p/ddwsESNhnUWvz8Z+QaXmplVc8IRom0w/kIqZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1kj0fwp4Pmxnwi6SLhrof9X7w00xQL2mMDWKATrnn2zdBksOviArjlRhh1Xt+yI4OAXGR1+WMpxwa9AmdnEQfqqg6gwcW+GJfpXvP2fc4LlPChdLNyrclsOxRPMqmArLNP65HJh/4YLTjNN+U8SjEpOnnolv9rNuVe5S3Pg6pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hc2e/zkp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hc2e/zkp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5920FC4AF07;
	Wed,  5 Jun 2024 11:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717587603;
	bh=uWT+p/ddwsESNhnUWvz8Z+QaXmplVc8IRom0w/kIqZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hc2e/zkpZ35NT0TncvDDhiPNikDdBYn8S73W4as5O4DkPGLp9qZQnU2tlf5ykwaa4
	 VUbosOlQC563BicsM5WLp86VvzdAr0hdVh52R4KLUft93/ZBH2r0I71CTjYYCBA2gq
	 tfgRf8ZMQ94CWZcj3ZD1cgt4NGvfjXa+Mb6GBW95jKEML4n0KjtPmql7ClaYRpY1N4
	 ISKILX8q/AHdIRE21Unu+Zbt6y8Oq5NseijVN7H15gmg73p7LSntu19jysJGELixmQ
	 z0nQYptU4QjucQOXXud9a4mCnh2pWfOBZoWxLlCwZn0bFcbtrZUPAexyuBDVKCSn/N
	 LyzXjGXZDaBKw==
Date: Wed, 5 Jun 2024 12:39:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: About snd_soc_dai_set_fmt()
Message-ID: <1f5a24da-547a-4faf-b1a2-34982f1f7cf0@sirena.org.uk>
References: <CAA+D8AMoZ-DEBN0=5AjP8WRT95ztJDg_peoYFyZ_eTk1o0XxOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bah4s+twWFzc8mZH"
Content-Disposition: inline
In-Reply-To: <CAA+D8AMoZ-DEBN0=5AjP8WRT95ztJDg_peoYFyZ_eTk1o0XxOg@mail.gmail.com>
X-Cookie: Simulated picture.


--Bah4s+twWFzc8mZH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 05, 2024 at 06:17:34PM +0800, Shengjiu Wang wrote:

>    Some use cases require that the format of transmitter and receiver
> are different.
>    Shall we define a new .set_fmt_xxx() function to support setting
> fmt for transmitter and receiver separately?

>    For example:
>    int snd_soc_dai_set_fmt_xxx(struct snd_soc_dai *dai, unsigned int
> tx_fmt, unsigned int rx_fmt);

Do you have an example of such a use case?  If you can do that it feels
more like one end has two single direction DAIs (ISTR some of the
Freescale platforms were built like that?) and it might be better to do
that and make it easier to combine two DAIs.  That would also work for
things like combining dedicated DACs and ADCs.

--Bah4s+twWFzc8mZH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZgTo4ACgkQJNaLcl1U
h9DlTgf9FLN+NG8wgrwgaYIy2RVkm4UTeyHIKLm98YaNUV2zaQcPtDsTMFifukXc
47ejb0O+FVISdOzVCzSbSlPs9gyOfBgX3qWWGLM/NXIEGhdPeEhdX1evoHy8PP7K
XoWSIvC/SqQBLTJXrogqvhz9/ZP1kjbG3cRSTbAtmrWwIs+4sAMblrbhVLxNxK6x
lEpULdN6uHoHB2Hj2idu7v+Y25uk99erRkCz1d5GCqUtkezeDGRobh/O7RogIyuV
025N7pbXV2NhORs0zkgHOx7yjFSd8QccJP6Bdp0rCriLZORzb747BkgtUaoDvjB0
Ucb8Qu83wGBGIrrQStwd1XIqUYhJfQ==
=CXS0
-----END PGP SIGNATURE-----

--Bah4s+twWFzc8mZH--
