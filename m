Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA18A425CEE
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779461888; cv=none; b=lRzt2DkIMBdruy4niMcMKU0g6SxDKzkccDXs+flSU/fWsOjLFBZgSn/kfGtZzz6qUZDbyhCuRD15gB5mdASwGKddXQ+B2bfPSOOjPeeasOe8kVtp6uOa7VfGj5elFtUeEqlELip7hn3EnNkYeoEmyytmofkXNSyPFn9jwhUqfIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779461888; c=relaxed/simple;
	bh=8NoFiNDArIHGFqiG/84hpl4RlSpwWqXOPmO0Js7GuD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQLDkd9Zi9qIQhuMseEeZddTbR3YFbO3ILN2phunKEpTr1xF2Xnc+dZbUBuhNUYeCABAwY+VedPaNYNViLFGUFn8JTo/KJOc07067fYb6umhIihTqEGp/bHvnNkr/PHYM8Vx42EcYiHym21/lMzDuyRTautQDcgN1h1wohb9/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eiwMHlUV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eiwMHlUV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F82B1F00A3D;
	Fri, 22 May 2026 14:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779461885;
	bh=K6igkoHvN1i9AXgLFyjo2XFn+lmhSOVvO28r/LYowks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eiwMHlUVZX/4KM3r/Nq2fUfndk+jDiyuRVSb5syPRHh0+cNohgGY6kCtdgzxeo++3
	 ALeEHtTTF+a+mW1DiebB6dRbk9/8ffbYjcrXjAjoXVn+nOrllnh/S/kJ4SzRjlZN99
	 7VrBjiyUEJ2SCvEJz6yPZm/UaLVBP2XcY95gEgPhn55LNBEUv74qgvoRiFHy/XIqHf
	 5Xn//4WbAy3lR/a9u6G2UsPuwWJYQ0dJLF/AoEo122QiopsfPV0IxzlUyk9/j6kqiL
	 4vozNquOD3Yr+YewJKOeJVjMnHBEjJ7x4jBG8RliIBSebEu1pguxvGaX8g6jCXaTjc
	 io2C+EOFHGovg==
Date: Fri, 22 May 2026 15:58:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org,
	"Liao, Bard" <bard.liao@intel.com>,
	"Vehmanen, Kai" <kai.vehmanen@intel.com>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
Message-ID: <85045e51-e09b-44c2-9266-3e7ee72c4eb0@sirena.org.uk>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
 <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="17phxgJY+3tKnCM2"
Content-Disposition: inline
In-Reply-To: <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
X-Cookie: Celebrity voices impersonated.


--17phxgJY+3tKnCM2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2026 at 04:32:03PM +0200, Cezary Rojewski wrote:

> The question on the table:  Do we revert the change temporarily, fix the SOF
> first and then re-apply the patch again?

Given that there's two drivers we managed to turn up bugs in already I'm
inclined to leave the patch there so it's more likely that any other
issues get found.  It's a bit annoying for SOF CI but I guess a revert
can be merged locally there?

--17phxgJY+3tKnCM2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQbvgACgkQJNaLcl1U
h9BpYgf8DlyHb20YcCFxYBg4OqPEJubv9Nhc1B39PvfPj6xnWt4i8atZqpIq55hU
M4oToKLlfaAy2ydcT8F7MW6G+gznjrGAYM2guRgKjKBP2W2qx2vf6opC/H/UswsR
8RkNKPVvRvcHIcGsje9h4nrTE2La2ljiCON/YydpxnjZVVy3olp/Yz2dQ3UOY3WH
Vb23NltM1vnhbzD1mbsmc8HTCvKU4KtZ7QGmDioOQFp0Q7GU+KvtZIW0jhqu9Bc/
U+oN9HwpCPI9a8xK05B0CdUwIZIObVgSVEoZ14yrZSQdgDJPlCmCyn77GRIroRwI
7/VRMd6tr6SAgBRIphJf8IIaR3sP6A==
=mh8M
-----END PGP SIGNATURE-----

--17phxgJY+3tKnCM2--
