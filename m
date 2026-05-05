Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78D82F745E
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 23:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778024106; cv=none; b=b94oe6nUT9/J8OqMJT4O4UW4iqd+brnGifTO+s6lvaaLVELafVrP22z55annI8St5ybo5boXqdrWuwEeuP2UXKDUR11NPNuz6MBAQataM/BYNFmQwFGlTABhqqt74Ryiya1XHZqXm1EF1skCujxZoat5AIbWtf9jwMQLSO7R4iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778024106; c=relaxed/simple;
	bh=6OIipeJObnXyJhOtTc6fvY67AcJNJW0CNfNFKe8vqt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfzngMwxjKbGn8YtvWrxmk6XejbiakQ7PhSYj0W7QS7bZnS58AF8wYLnVYGYspo/Slq9QG9nGnnOvuY2lMUaQT5ra8d+6RhuI+GCB3SRfTgwk7yviGzUKvuQTSAhQi1YWk2OUdeLvSFoB9dS3NGFN1r+KAWUucCqZ+Itm1HTBdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqLKDs9l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqLKDs9l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34369C2BCB4;
	Tue,  5 May 2026 23:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778024106;
	bh=6OIipeJObnXyJhOtTc6fvY67AcJNJW0CNfNFKe8vqt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bqLKDs9ltMmkT3yckaFNQMT1PVg47zS8ADNSDmb5CNvzVtzOiJSLL7pDt0mRXkO6z
	 nQANeg2zzrH2vACffJlqffLW04UFiMSFmWNAFl5mpIpJzt3tYaIWrPzf5pTMK3f8EN
	 1eferbZcvkRHZdVnVd+AvvCC+400h8F/YjdyNCZU+lxY/G1/1PyRTDLQYDCHKi0v0A
	 yvHT0yl+2FnieOMlh6kh9cZY5PtRMelqs0WqlHvOHba1nw6odjIZ9xE5ueXDycWROg
	 mMWDnjf3h89J3+tf+SXVXH2gyFFvYL47jgqVjH6tOe2ot/F3MhpI3h5PX/r/K8vMsY
	 n2tO5nEV0eV9Q==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id AD3E51AC5877; Wed, 06 May 2026 00:35:02 +0100 (BST)
Date: Wed, 6 May 2026 08:35:02 +0900
From: Mark Brown <broonie@kernel.org>
To: Md Shofiqul Islam <shofiqtest@gmail.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com,
	claudiu.beznea@tuxon.dev, andrei.simion@microchip.com
Subject: Re: [PATCH] ASoC: atmel: Fix typo in comment
Message-ID: <afp-pkSxJ2WCf0yb@sirena.co.uk>
References: <20260505223330.5678-1-shofiqtest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K6Yt/9eDEKckkmeK"
Content-Disposition: inline
In-Reply-To: <20260505223330.5678-1-shofiqtest@gmail.com>
X-Cookie: Alex Haley was adopted!


--K6Yt/9eDEKckkmeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 06, 2026 at 01:33:30AM +0300, Md Shofiqul Islam wrote:
> Fix spelling mistake in comment:
>  - occured -> occurred
> ---
>  sound/soc/atmel/atmel-pcm-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--K6Yt/9eDEKckkmeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn6fqUACgkQJNaLcl1U
h9AoMQf+J3z2DRESDMOb5vYAGDzHUrcE6Xo6cjB/GP23PDVpvQ4IP5ZGJMVnyAQn
Zt4XW4R3vo1ccMSzq8aTF+lkS9tf+ByWtQoCgCWz5atuijuWCGB/fN//wneH0KBi
Z5Zb4A+BMTdShtGJ52NOwnfn9DvE2aIoldAqSrWRXdtDqmkMxdrSji64sxdUEU31
QpbaehK0TXcgUFRGLPqB7BZY00K8tOndJbydfTMGKRs06giIutIH2qXspQAPThZX
R+8KlOav2B7dm4m5uZt6iJYjf6n9ZbWuMr+RSZKjmXBPZZuShuHtW/aW5q5+WUpx
mU2VTWXOctbaeA42s4ZeYXniCDv0iQ==
=C6sO
-----END PGP SIGNATURE-----

--K6Yt/9eDEKckkmeK--
