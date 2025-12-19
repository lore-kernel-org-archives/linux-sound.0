Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00762D876B
	for <linux-sound@vger.kernel.org>; Fri, 19 Dec 2025 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766135435; cv=none; b=OGNk1YeMGFda+781VMKtfyQUDTVepoaGL7byrXW6raBIgAM1Mr8ek+TVESxNViEzLsdC7fDt3g/ckSODyyBxJZbXDjLj2qv/WSs9Ce9g/pgSDCyw0/V6DJm5oRWX6PbgJaPmtt9kbzgbU2wdprx+uGGRfTaUlI3dJRVswToY1So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766135435; c=relaxed/simple;
	bh=OqrFHGtlH34SSU+bMNB/8QnzTpqYaj+tyH1M3FobZ/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jB6AnKWFPBJ0TUsaTrgCd0oGMWmlijDVGiHueTOBaTdB+hk0BwULlarhZyrvPPAGGtIsyCJdXzw+1klQbCQRqi0ZBl7Uqgc0/saoN+yhas3ZYnoIw+QzqAe8OWcjoCSOvwRhiXLITtyc9yQluyz9wQlb9Uw9MVlSK5Jkb4q9hdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XB2MixF/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XB2MixF/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7A1C4CEF1;
	Fri, 19 Dec 2025 09:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766135435;
	bh=OqrFHGtlH34SSU+bMNB/8QnzTpqYaj+tyH1M3FobZ/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XB2MixF/6O45ytQXIaYxW+sgB2KEcpVBcC0HNiAvqP97dhy+IJS+VyOf+5FZoqWKy
	 JU4HIG5jfDOSPD32K4ia8ygpYevLr1FLVkT2h7o40lhIJFdkbDEXCdAykw1h/K0tVq
	 sXC9S8u4GCBNsTl/bUiUlD0j+/FKirPxz96LU9uPhLSGRwyTFbEsyc+bxl/DleDly7
	 fUol6diZ7SvJQ8VjRQSGEEou0X6wS8XTyz6VfM0+Y68h6M8E8aWKZU/vwrrvZN2SZd
	 dLhCJUCHOlb6zOtqOKY792JFjc/wz+3tyg1L9xecOHgQ3gtAzfD66gRNTH6h6YyC3Z
	 SH4rcT5FJY2DA==
Date: Fri, 19 Dec 2025 09:10:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.de>, Lars-Peter Clausen <lars@metafoo.de>,
	linux-sound@vger.kernel.org
Subject: Re: About component->card
Message-ID: <f3e964e5-dfc7-4c76-8b98-a6bec0f784c7@sirena.org.uk>
References: <87v7i5esrk.wl-kuninori.morimoto.gx@renesas.com>
 <874ippecif.wl-tiwai@suse.de>
 <873457z45u.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6dven0ZxiL4/opXe"
Content-Disposition: inline
In-Reply-To: <873457z45u.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Save gas, don't eat beans.


--6dven0ZxiL4/opXe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 19, 2025 at 12:49:49AM +0000, Kuninori Morimoto wrote:

> One question. I can agree about "the card is the top-level abstraction",
> but what does "it'd be unnatural to go beyond that in the ASoC component"
> mean ?

> Indeed there are practical concerns (= complicate locking), but apart from
> that, above image itself is not so strange, but am I misunderstanding ?
> (= It is one of the gap between "ideals" and "reality" of ASoC ?)

ASoC really wants to glue a bunch of components together into a card, it
doesn't have the concept of a component being in multiple cards.  There
are more assumptions than just the locking issue, for example DAPM
really wants to have a single graph for the whole card.  If there's any
overlap at all in hardware the natural thing in ASoC would be to have a
card with many PCMs and ouputs rather than have several cards.

--6dven0ZxiL4/opXe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlFFocACgkQJNaLcl1U
h9Cuzgf7B40ZS01t93VHVp4FnH1KACzjueNx+kH3miaYLBdHczkjtgO3/5NS8uq3
C/5KNOgP2ljX3JeKDOdjfIlYE72qKYiBiqkV/A9xgY+q/zq9QZmQ0ukei+p1T56I
ZZoJW1YSAF4cZGWVGJMT5+nYjafuWKlOia6wcdO/z60x1gwGE+D5wXJ5PhB7DxpM
urZ+Xe2KjqwiYHsU7LQTjJk/gEJhQzOaovy2aUkU0OOnWMCSQq59ITUxq5/FRHSn
xKWJUBtAmlDxDw1B2zaNihnPM1xBhmrOhbrMdLEvEsFTSO023NblXckqaKeywMKO
dTveB73vJzQ3KhpKN6VQ/dNJvAGEfg==
=O779
-----END PGP SIGNATURE-----

--6dven0ZxiL4/opXe--
