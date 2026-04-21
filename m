Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1912D7DD7;
	Tue, 21 Apr 2026 13:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776776462; cv=none; b=Gx+CZUB3btJumP16SBYqPnn8i1/YmG89/sSCPzfj9BPGLOY9kLyoxAS+qMJt+m9YM5aWznGAo9KLAc6OUa2F1QZKAZ/TukGfy1/UXb/7UmH9WCIP2g59FCeLcEMzH3FEq9/qdRFeCBlWBZoVqf/Y+czQKSEPLdai6gS6NKhJzTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776776462; c=relaxed/simple;
	bh=8r0ZFydET/AAmgi2IM70w+skNgAL6Sai3o0ra7HDchw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHox0XULNm2EPC8sU8So+Zs0riFQ32GNrDmoZHJrGBpOHiUV75sQVcMbyWvZipy11QbQOMaUBr2YDIxLp/2fOs2aeaWjF2tg6sQP0dzYkByTAP7vZWBZws+6Z4auJKUncyTDsrIRbKgqloWknjGYr/WLvBRjS06NmVwB2vWD3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b7oDuzYl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b7oDuzYl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7484BC2BCB0;
	Tue, 21 Apr 2026 13:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776776461;
	bh=8r0ZFydET/AAmgi2IM70w+skNgAL6Sai3o0ra7HDchw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b7oDuzYl6g7/X9Rlfy8hCFWbnBxptHemsqSWOeG95T0xf64RZKh9Z9UEFzgX08Ip4
	 yHywN4KWWTFyTTxIpPIpj7JBl1Z0yEY4gXosqekCaLrybxRxwDGAvkS4SLJaC0xO17
	 KsOIamAcNUuKj9HkUv8gGejSO1Ld30u3GjVKtgO3TxVCje36oKnePnzgoVYV/0GGtL
	 xm7d2moJt31XHKwNxeb+bySQnJQHuLTclcvrr+Qd1cFCTuPK4gYcLscLs7MIAGhKVX
	 f0RXacEl7JcMcI1uRNvK+j4QfSW5LJN42SX1X/htMYxByewVtDkPPVIcO7RkazKsKG
	 p79g+a0dj25Sw==
Date: Tue, 21 Apr 2026 14:00:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com,
	festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl_micfil: Add DC output remover control
Message-ID: <2b26c51c-d90b-4a47-99ca-652edd7f1f4e@sirena.org.uk>
References: <20260420085344.2081805-1-shengjiu.wang@nxp.com>
 <6c6f94b1-a4fa-418a-b471-8e3c82305233@sirena.org.uk>
 <CAA+D8AN3kmU-FDHF-kb47=ayXbypka+Q0vO-i2Bpzq1GSABuQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+1FrIIXGICkEe5jg"
Content-Disposition: inline
In-Reply-To: <CAA+D8AN3kmU-FDHF-kb47=ayXbypka+Q0vO-i2Bpzq1GSABuQQ@mail.gmail.com>
X-Cookie: Jenkinson's Law:


--+1FrIIXGICkEe5jg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 03:40:12PM +0800, Shengjiu Wang wrote:
> On Mon, Apr 20, 2026 at 8:50=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > > +     /* Update DC Remover mode for all channels */
> > > +     ret =3D snd_soc_component_update_bits(comp, REG_MICFIL_DC_OUT_C=
TRL,
> > > +                                         MICFIL_DC_CTRL_CONFIG, reg_=
val);

> > This will return 0 not 1 when the value changes, meaning event
> > generation is missed.  The mixer-test selftest should report this.

> snd_soc_component_update_bits() will return 1 if the value is changed.
> and the mixer-test pass

Ah, so it will - I'm used to the regmap one which doesn't do that and
instead has a separate function to get a bool back for changes.  The
code is fine

--+1FrIIXGICkEe5jg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnndQgACgkQJNaLcl1U
h9BfXwf9EIHXZF45DCvVvzP1/vi1cTYydgcXJNFJM5eaWCZmqDo0/VRdYQsvs+ol
oEESYdommHtdvNwixhbsuNFKo9lD9Ogl5/zjpbc8a+jMyDDEoEMjp6u5/MELoIR9
jzbAZwgp/0Zty8QVtJO7ekoqgdUrboK+SrQMubUWKkDbaDN2UxtdBBLmZOIcn6Y7
TCW6XItCTcCmjE8vE+T2qtVlZl+4L426lc3W+57SBTgN7eNQ+B3LVF/LFXgeFrcO
gX0CGRa1KQzsmM31yxYqRMuYM2+OMjlw3BpkGDJYlr3UayT5Ymj5AlxKW3YLpakz
CSOVn28QgU7w6DPms4qftxKPhzkBwg==
=8E3z
-----END PGP SIGNATURE-----

--+1FrIIXGICkEe5jg--
