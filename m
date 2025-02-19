Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849C5156228
	for <linux-sound@vger.kernel.org>; Wed, 19 Feb 2025 02:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739932753; cv=none; b=MvE95ICMA6qL+PAe3kR8muC3NS4oY91+dwLevwf1y1N57K+he+nXbl+E4bYXY1eH60tqiX4BUbgbG5jHkZqGmHZmDIBcoIzuzMv16kmIQGjzhOcfE0q9NHrFGzxLLshKM4ee9GK8Kd+ld9EuP3Bor+FeEXiQaVkcRbBPKU9B088=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739932753; c=relaxed/simple;
	bh=i3xh3YOUexqFy8VCWYpMP8zbkw7jXrey4/XBwWb/fPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9VQBjJYV4fw5Mg7fxXBvzRGkjVlZgn9mxZlIZPMqV9cK5/IkNclYAC3iPowr0jIPd0sc/acJE4/S5/SyefmI630V42Y26zLTp7PHMjW1E9NNjr3gsy3x9XidXgYU0+kIerKNWK1NW0+wOhGVRU9enJWZMD9WvcTg53jFrPyzLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCySQemM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCySQemM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780C4C4CEE2;
	Wed, 19 Feb 2025 02:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739932752;
	bh=i3xh3YOUexqFy8VCWYpMP8zbkw7jXrey4/XBwWb/fPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCySQemMiEOaUNfi0hJ/jy7IJa/BWNWSpOX3+W3fS7GZs7NvnqXAcESzPD4Fma/ur
	 ml9SPWOjdpixDdfuL465aROIKE0w+wnXGkD54ZoCA8aBX8VZmYHmP6sOe2WmLFXX5P
	 gnCVV7ijo8EewyR7e4bu1fVgLhLugY/klKgIvm0dNeCcjJmltEJopTR0dLNuJXwoPS
	 BUL7cVtQSwFiAXY4sJ16dJvcF3Kk4xC5unvH1WCknk234o9k2K4F5xcSJ1c8Wi0WqH
	 KCicJ/xHFg0oniMGejl8X07PgJG1fQJuPMuRE9WWfh4C9FlcK8gVbbmX//iQJheeu8
	 TcwMk+AVW9bSA==
Date: Wed, 19 Feb 2025 02:39:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [RFC] ASoC: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
Message-ID: <Z7VETTv4z4fjBR82@finisterre.sirena.org.uk>
References: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
 <Z7U6vQBe-BQcmrDX@finisterre.sirena.org.uk>
 <87bjuyvfs0.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gGyv9Pdm0cCRpbDk"
Content-Disposition: inline
In-Reply-To: <87bjuyvfs0.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Editing is a rewording activity.


--gGyv9Pdm0cCRpbDk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2025 at 02:18:07AM +0000, Kuninori Morimoto wrote:

> Thank for the feedback.
> I will wait 1 or 2 weeks to get other feedback, and will post the patch-set

Great, thanks.  I might just go ahead and apply the conversion patches
you've sent if there's no concerns after a bit of delay to make the
series a little more managable.

--gGyv9Pdm0cCRpbDk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme1RE0ACgkQJNaLcl1U
h9Ce8wf+NKkLLoyH/nYc03Y5cwJXSonX1lEuoTol5ixv9+cvGqcjfyxfZKQ4cmKE
okol+n6IBb7XHfKelD6y79hxbxwVbYtRen299pdEN356TZlVQSHKpAcjQYJErEo4
6tg3ultWYtPlXMDAgd0edw+opMhoVg37qChNEMAhhZSJ0bOOlArIuQV7RSbIG9iO
cZ33LNYBtI6fCUYUynAaM0wWoX1n/GUJSDfcahJFOTVZjeNj0OgASVmKoslCj8sc
LeCmIl/qqLtDe2/BjLOXvhD2rn7VnJRykBwyEbNoNDF2SjU0ddoBwWYi2J5LDdjJ
Bvq1/2f53D8BA06DgSNW8hGhiNZYjQ==
=RTL8
-----END PGP SIGNATURE-----

--gGyv9Pdm0cCRpbDk--
