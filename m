Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91E8367
	for <linux-sound@vger.kernel.org>; Fri,  8 Mar 2024 21:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709933875; cv=none; b=tl3QdQKiVB1SXS+icVvnnPXasASp8MsaHXgY/j/VR/JKzEeFpdRUyor+qAHgtU5mpcGYCfcfXXvaL7QwbgGsd7/htKMKFh+Hwb14MqaD1BcxvaDyky6zmeFOiYw755aW8wFBelDwKVQDsKIkpYWCgJtpQIoiCgBcsnmaCFu3rjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709933875; c=relaxed/simple;
	bh=Nl774TonQ/EPbh/FBsB5DbbJy+7y8vGjygHTLin3/iA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g50nAK7g3xDu6jlYUyU1Pj8eavTwS9ydL2t4wu0/HhrrMV5pU68RNFBfSe+8k/xIbO9tFvUxz8Nv0qqBGdFSgrKNmWRRPhUA1tyTPyy3p55k+rpMo2r9cQAFn1Z2+Ia1UiM/Hjblx96eTehdVh4FdmyHFCH+lMTD+1nzdJEqE+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1FTbSwP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1FTbSwP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABADC433F1;
	Fri,  8 Mar 2024 21:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709933875;
	bh=Nl774TonQ/EPbh/FBsB5DbbJy+7y8vGjygHTLin3/iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O1FTbSwPbwPL35FmY6dtBjsURQ5rPlr8bqnxqpigJ6YBpgvHGaFwhhwUEaEnH4SX8
	 xlfXgAcYh8wXW2oEPb02dA1olUzCPxp8kueJD8TQlkOZs1GRMQUw03h/5Q7o9FNTq7
	 qRYa5xuMIUtevSvECK3JA4cjvYzalsS35XOmoc2lMgZUzAnRMkMQIqU1Bz9uGyBHKY
	 MOXVx2T5F0BSkzQsDXcFIpoNzh7XBD7xaIu1u7QEvi1eaUTb95hSASvOO0n47zU2g2
	 OvbaUqlW5KGC3CnDcBjOg5Nfs8D2AFLYmFwwNhajbDDmmRzcNAReoP9RZVbm81rY8X
	 IvZVA8dCSC+KA==
Date: Fri, 8 Mar 2024 21:37:51 +0000
From: Mark Brown <broonie@kernel.org>
To: M Cooley <m.cooley.198@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: ASoC: amd: yc: Fix non-functional mic on ASUS M7600RE
Message-ID: <5eb9f2b5-62ef-442d-b93f-ea6b0d85eac3@sirena.org.uk>
References: <CALijGzn7GL_tmdGZXy-tTGCgpT4bwLW2+QU1QBseMRQwjPhbtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r+OJECivp/tGZknI"
Content-Disposition: inline
In-Reply-To: <CALijGzn7GL_tmdGZXy-tTGCgpT4bwLW2+QU1QBseMRQwjPhbtw@mail.gmail.com>
X-Cookie: Isn't this my STOP?!


--r+OJECivp/tGZknI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 08, 2024 at 03:50:12PM -0500, M Cooley wrote:
> Hi, I apologize if this is not the correct format for this request,
> but I am unsure what the protocol is for people unaffiliated with
> kernel development teams submitting [PATCH]'s vs bugs / feature
> requests. I am happy to resubmit as a properly formatted patch request
> if it's preferred.

It's a patch whatever the reason for it - basically your email looks
like it got almost everything right (assuming git am likes it), you just
need to delete the process question above from the changelog and add a
Signed-off-by as covered in submitting-patches.rst.  As that covers
there's legal stuff with the signoff which means I shouldn't take a
patch without it.

--r+OJECivp/tGZknI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXrhS4ACgkQJNaLcl1U
h9BZPQf/dewCs37qRVQ+7Lax8z7y8Sbz5bzqTB/gx31jpc117TTslepA0Hkx/LwZ
kVSJeRklTXLAhrq8LJXyM+eNn0D7POqgtfMnsgSRdxJ3f/h0hCvuikFZSGjtAp8s
TbPWp7W46pEr12iEq9QgV9fSD/BBz+NwpkOfiHjlyvK4iXF391fzrQPJR6RQUjp2
4VdLBYizpWaap2O1HBvoSa34uuOjHZbi9fqD8iutomRcI0/JKlDLEwSEgIq2Wk51
ROhBuSBPf83iFJuu65Qua6WUxLmZ1fOTZ/msCoYCLhNr4xs4jQgHXSpBd81OyFWB
pSeIZPoUFF/xD23AYUEq/BJq36KQ6w==
=DdL/
-----END PGP SIGNATURE-----

--r+OJECivp/tGZknI--
