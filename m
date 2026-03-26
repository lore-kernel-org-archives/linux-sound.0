Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7494D388378;
	Thu, 26 Mar 2026 10:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521435; cv=none; b=Tokv/J7RnIeQ/dxbTYK19pob8vS4+LXptEat93Vhsu6t5w8w7nzabPaxNkwc6+GKNADTDJoJDDGJpgpgoEzG7XkalaKVsMSE7T04ERXlBu/WtP8MEibqtFYUkYRyyU+GoN6YLW/oG/+GfpGYlmrbExz68E6UOrGcGFtzJALknTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521435; c=relaxed/simple;
	bh=AyzmiN6LKippSd5OBSqPKjR9fvCa2ikOvedmAG6uJnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZY1L61JB3hWZs7dkew8+5zmhtz/fI0MVLrn14VtXTq5zaspIalh7yzZL37pbFyPE9AT+AqxZb4Y6I8v8144qQ2DChZi/khY6jXtecXsK9eOi4oQS+D/SZOH/hrzxS8/eu5Hq/+MmNori56UMWiQTwYknnI3JemQxj8Bgd4J/6As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6jcppvO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6jcppvO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E43C116C6;
	Thu, 26 Mar 2026 10:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774521435;
	bh=AyzmiN6LKippSd5OBSqPKjR9fvCa2ikOvedmAG6uJnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6jcppvOJSbNkfM1LRmYKl3oxfxkwCOKckihIpA7c89xj1R9UDKf0ll2+K+SwF6wB
	 cnxnLWpv+Tw4yAvZ2NcfZLlTp6MlsLluP9MCr2QaCU5gm0L6pMQ9rjssnRPM8QgcrG
	 T5aRcuB5ELQLGBpWqdAu0YFwKIEJeymQ4tprOiNk+kbwSr1/Xfq0m7izlIHgasHXZs
	 LB7vjjbJHF+Br5b8UMN34RElOHIxwLBh9Vha63N9LSFRCmSOaEi/eq2NzwN1Ri2DVT
	 wRwcJbt2idoXvs2BRrFUQMfj6QoyrGrbtR3oHDpRquRsVMXLWYgc5rQgzMvq3qQFTM
	 yKrPhoaq2onrA==
Date: Thu, 26 Mar 2026 10:37:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: ep93xx: Fix unchecked clk_prepare_enable() and add
 rollback on failure
Message-ID: <ca5cb146-8313-43c2-80ef-cb0c0ecce240@sirena.org.uk>
References: <20260324210909.45494-1-jihed.chaibi.dev@gmail.com>
 <CANBuOYp6AB=xpOeAWimjb6mBoZAEw+fnXmYa9+VyA0vtjwtUuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KB4HATxlNed++3fY"
Content-Disposition: inline
In-Reply-To: <CANBuOYp6AB=xpOeAWimjb6mBoZAEw+fnXmYa9+VyA0vtjwtUuA@mail.gmail.com>
X-Cookie: Here there be tygers.


--KB4HATxlNed++3fY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 11:02:35AM +0100, Jihed Chaibi wrote:
> On Tue, Mar 24, 2026 at 10:09=E2=80=AFPM Jihed Chaibi
> <jihed.chaibi.dev@gmail.com> wrote:
> >
> > ep93xx_i2s_enable() calls clk_prepare_enable() on three clocks in
> > sequence (mclk, sclk, lrclk) without checking the return value of any

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--KB4HATxlNed++3fY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnFDFYACgkQJNaLcl1U
h9ACrQf/ZY0RkDChsprCJdJsr/Q1bsjJA1vGCyu402u1XB+ysXVSyYyP0P9I9c2r
nc1wsw2EnLkCk1UTKUA/TbqN3Ubqqc/W8ju1sadvNZ/M06bOEbvM/L8mdpnndFy4
G+56l86cLuzG193xoZkAQ5Chku3xKeaVk3jMOY8I3j7Oi0YPhI1KJP50G2OGtrei
x5GqYYs0camSPpSNPvNzHZP54GDwy4X8MgfJAgRGUWg6Jb1T73fv8VoieQJ+Q0xO
+zkJYGEuh9n/wcCNyF5IVif5CHA/XGZ4C2H7bq2THquPIcN5S0l0Hem65LMNCxy/
rf/GtKyUPazutZMF81ZL3HacFITdTw==
=vpc7
-----END PGP SIGNATURE-----

--KB4HATxlNed++3fY--
