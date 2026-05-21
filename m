Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAA1322DAF
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 14:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375410; cv=none; b=ixnXtNbtN2+74AbXvAGE93XRilvM5gJ3OKW6pD08zr/Qdlkt9ZnYI1D1JBsoRm1Gz4DDACECZH5Ah5MnWQ+0d5bfNdLj5y06vZYhda00myQQzUJDJzCIp9ehkgXQ3iSjSHleuQY1aM8mog146ffghJxntetbVHOlnexFD1gN2oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375410; c=relaxed/simple;
	bh=Gwz1+JKcWxkIuD8/RtmK71Ryyw7X/KUOxSclm2/w6qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TW11BSLUivK6BDHS3DvOmFrL9hebrt2845H3FDUDVhw/iHec244xD5xUR3CRzhoNpjkUF+u9xAkGZFUIqXtb7+iD4x8/yYMUCc2JM05cqm8hAaUN5OQN0i0XJr30bmxy2AuuTut07x7AV6JH1C0Vzf8oN7Uys9Ut5n66OlO6poY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFmxB3TI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFmxB3TI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3D71F00A3D;
	Thu, 21 May 2026 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779375408;
	bh=Gwz1+JKcWxkIuD8/RtmK71Ryyw7X/KUOxSclm2/w6qo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mFmxB3TI64vrQQhmJrscxv+P+R6r77mfhK76ugSVXaTh6BP4n4aEKnH+CKwuEpf9y
	 8OE+eqWm6hNxRxNC2BHd/BLqPtPZ/ZSCawwOFGn9h/YmN5IcgQRCV83VJejz8b718t
	 TISIb+J+1OGqNfwdgHCNULS/5MIwLz8RgisU1GQraVxlxSZTHbpUTjlnoHdy65DrHl
	 sRCgVrw+e08LVCMEJqrQXTij9GET/8m8+jZEFdCfBzS18BLud2uP9qwNBNOFfogooG
	 AB0SAU4iPz+quF4yF/H5R9a9g/+onfVHVN7Sl8sIqC2kI2dkNk9nBT0nLIKKjPS6Iu
	 XZ24NfQj06I5A==
Date: Thu, 21 May 2026 15:56:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, seppo.ingalsuo@linux.intel.com
Subject: Re: [PATCH v2] ASoC: SOF: ipc4-topology: Enable deep buffer capture
Message-ID: <ae7db8e5-9446-4f47-b631-67c1fccecaa1@sirena.org.uk>
References: <20260520142250.13803-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jYsrOGOJqZce0k68"
Content-Disposition: inline
In-Reply-To: <20260520142250.13803-1-peter.ujfalusi@linux.intel.com>
X-Cookie: No shirt, no shoes, no service.


--jYsrOGOJqZce0k68
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 05:22:50PM +0300, Peter Ujfalusi wrote:

> Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
> Reviewed-by: P=E9ter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Signed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
> Changes since v1:
> - added my SoB tag, sorry

Not quite!

--jYsrOGOJqZce0k68
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoPHR4ACgkQJNaLcl1U
h9A/Igf8DGUGTql/61PAfnMF9Oy/+Ulg1WkqeMWRLBiKm1TEq29tlEz036jaXvw3
5FJQEbyVQNDzAFx1X4kbpj5OK+wTHBI/73d96I5p0q4oLGGFgIXQEedezljClgOy
l9maq1hw+Rc5nug6jePYSAdGpACsTg2RiCBQAkR1yRgXsQqd5DV9oXTFcETiHptQ
TPlneYkkt23lce9/kgBAh2be/OeyhEZ1+GUY4BcDO/vd6zSba5SyyAZA3Z8b3Pmt
4AUPyedKLRu9dpdVyyXMYBsrv8QfHm8khfRV2M9KKzNvdBHYVURCmF+adHLHFmub
aTuxL3JM2MTo9ZlfuAokIYcqVb9dxg==
=G6Eo
-----END PGP SIGNATURE-----

--jYsrOGOJqZce0k68--
