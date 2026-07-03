Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B96C1E1C11;
	Fri,  3 Jul 2026 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783101783; cv=none; b=cXiPRSv+Ci9d5cfrHPLcIE+Cl9ISlg7jD3Q6dQyCi7lhWrjKNI3AVSJY1cUr0xkv4OxbZyKOUs8vJ945NmLFnOVv/aQKzRtbwExa2oE9+WlUvvgLXFpoSZNT5Hu4hFhONDoa7MqLLlD2DYSj/NTDijK1Fguff6FmlLWcrjHmN1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783101783; c=relaxed/simple;
	bh=T/5o4JJSPPY1HOjY33cpRvY4ZvNp8GJzsvZuwJsR430=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FapDfN1Fu1CFYaNmL2387yzF3QXpvlIe/T6F4Vmdo35tIDylUc6j4ZO31CgdSORh5GsGkEaDjGul/YFalQoSQK5fDu6pvdLLpXN1Hit8rT4YfsSWaQIXoJiIAUPibHcHEtT4h8WfA+FdFP4sHDi5xDzdNUG0awH8QEaUqmCe2hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHXr5mcJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHXr5mcJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6427F1F000E9;
	Fri,  3 Jul 2026 18:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783101782;
	bh=T/5o4JJSPPY1HOjY33cpRvY4ZvNp8GJzsvZuwJsR430=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bHXr5mcJxAmW70ggFh1D31ClrqSWO3dy7kEsQ2rc4Vpercy6toCyCHfu5i8jbX/GZ
	 HgwALQJXZ0FxZdEwkDTFeVzSgAO6PasTSImXm4BusW2N9YquMmhwtY2t3TimDr+fA1
	 rN6H0B4D06wQ916+kPLdvxTKKQ4vWrgZub0Arglcd3ZT2Qze23sIOILIPWFfYHrvwZ
	 uRz8YLHYL6N90rEvTsvvW0zpRWLewPWSNhj0Y9oiMfXJnLwji+sS+nwu6Qyb3ykkp0
	 J/U1C2G0u6oDxI6vBDbCcOZNPZQXEDM1KUXVwxyYW4Czpi3gylJQ4E7yp2LySVJVnM
	 B2zW0d4dOWNuA==
Date: Fri, 3 Jul 2026 19:02:56 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	perex@perex.cz, tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	mario.limonciello@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 16/16] ASoC: SOF: amd: add system and runtime PM ops for
 ACP7x
Message-ID: <168ec38d-3db8-4e3a-b7d7-fffac654bed7@sirena.org.uk>
References: <20260701095759.1012929-1-Vijendar.Mukunda@amd.com>
 <20260701095759.1012929-17-Vijendar.Mukunda@amd.com>
 <58e4579d-f87c-48db-9682-fec99c4706af@sirena.org.uk>
 <68d6745f-8bfd-4b1e-b4f1-33190038566d@amd.com>
 <632c9729-3f64-41fd-b85d-18f4437a68df@sirena.org.uk>
 <04ffb72b-0027-492d-be0d-4b4178e21e1e@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I2XHIjnu5yiSaqR/"
Content-Disposition: inline
In-Reply-To: <04ffb72b-0027-492d-be0d-4b4178e21e1e@amd.com>
X-Cookie: Another megabytes the dust.


--I2XHIjnu5yiSaqR/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 03, 2026 at 11:21:21PM +0530, Mukunda,Vijendar wrote:

> We can drop IRQF_SHARED flag, if that is preferred. Please let us know.

It's fine, it just wasn't clear that this had been considered.

--I2XHIjnu5yiSaqR/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpH+U8ACgkQJNaLcl1U
h9AQ7wgAhBjKPb3yCLyVvni34snV6a4xy8dhEHg3aes2svch8qBjnZBK90gIeDZl
ke/d6M66cd7T1kz1Kui4FkNfoUYwQqGsIifXpu7Eag4CNVf5i3DT2Jl7oV8Nl3x7
llLMLa5yCySX5PAP29Py2155XXnqr7jtzbhkXbwwkvGs3vJz0Q4ZH3J45+GIwNmK
VABqD/j3D++MVNE7pI6Uo4KFUN7g5jYJ4q9tKLCDzEXUDvpzNxncfTV1SHtb73l8
Wu88/2JzfkX5wXVj3+VtMnKVkPnA9wYwPdmDhCi8BvzYM4Myw1mmPclbZb+k+NSN
JD5jkULRHfKWjhonc+P4HAh9OmBEhg==
=WfaS
-----END PGP SIGNATURE-----

--I2XHIjnu5yiSaqR/--
