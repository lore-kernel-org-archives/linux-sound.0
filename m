Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D80D282F3A
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893779; cv=none; b=nCmfZHb1HxqO23HBsj4wUwg5WpBY7Bfkj2b9LGfpqRj31GbSBYt+U1vSOdRNJCN+dGPHp6+L/mvfJ+0DZH1f/LuquWL6TZat9G5Bd5J1iZCFmRXiva31qklMqobeN+6p5TmnqgXl7tnXDy5dcX79moOfx51FjovMcudl7iooUEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893779; c=relaxed/simple;
	bh=19BZnxChlowowM6Aofe35dHPtiwWqpHKd2i1EmN8YM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJoA9QEjLeGZLWFAUKkw++BK9kRHI4W4a6me1PHdIL7IgzcMlmYahEKXJnru2QobBc7hRBaPEO0kZ5zn960ukvWdG/RG1S1uW79dGV32kgikVvhQFLtScg9YgFhNfrOVhqoyYBZq4hfYCyRIeyJkypfLUQSXAde5HPTUeJkjBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VgULxX1k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VgULxX1k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42481F000E9;
	Wed, 27 May 2026 14:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779893777;
	bh=50IouOULto/YrTc19jbmU1+ERDiBXoIDouvzcPC6Rtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VgULxX1ksB+hI78/V6ykZnWYqCcYdnu4P0heiR3/9RvW7pI31kvUJc1YrE00zQQT4
	 SymAzQCYPEMhW1w8ZlrWWggw8BHf6BhlaD2jolgwrB7KONwjQJDt/ec8WQel/8DuRl
	 xpqtKhSujT3HMvK91jQHenQLLvQTnuHDX1j4AubM4qtjNb6GRRxaG2Sa3pB7NJ3NEE
	 Ee52lholn2RBmpeLA1ERx2+SfauQwYOGLzuxaAhu08vknwZy1JHa8eqKdLGmXBzs1M
	 fRbh4L1H6/cOyx/x7HoOO8miQYP/4/43uwep/1fGXDa8X11sHDpa3J66NRJ0ZgS3NH
	 dye3IOcKfowXA==
Date: Wed, 27 May 2026 15:56:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-core: remove card->dmi_longname
Message-ID: <a7d26dd6-5c0d-40a7-8fd7-18cdd7422f39@sirena.org.uk>
References: <87tsrte3wq.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7sGY4HkxxfMfhxAK"
Content-Disposition: inline
In-Reply-To: <87tsrte3wq.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: You are fairminded, just and loving.


--7sGY4HkxxfMfhxAK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2026 at 06:57:02AM +0000, Kuninori Morimoto wrote:
> Current Card has dmi_longname[80] (when CONFIG_DMI), but no need
> to have it in Card, we can alloc it. Tidyup it.

> -	snprintf(card->dmi_longname, sizeof(card->dmi_longname), "%s", vendor);
> -	cleanup_dmi_name(card->dmi_longname);
> +	dmi_longname = devm_kzalloc(card->dev, DMI_LONGNAME_LEN, GFP_KERNEL);
> +
> +	snprintf(dmi_longname, DMI_LONGNAME_LEN, "%s", vendor);

This allocation needs checking before use.

--7sGY4HkxxfMfhxAK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoXBg0ACgkQJNaLcl1U
h9CEWAf+IYcMhiUh0BWIDR9kZdyBI/C5mrxroDq9coPq8PM7WR2LokoLMm7UTIhH
gokjR4n2qQGHeNoTjZmmKbO5nbN4lcHxpho1E24VLVb54pjb0B4qO3FHs5QKe5FZ
wcx9hehe0IJRxUQCMD+hwBEcjLHKmuOvVWQBhVDC5xsILkofo3s+A0rbDu6+YgfV
vIhyh8Gyokl2lIwQ104c6ClwfkU8715BQfLkjfEAtns5ZXviVLQBb4jLyCZP5zqN
gp05MYgIGxyjZyiocULrKAV6zK1Yx6QH7Lo9ALQ65F7Lv4EDKgsy7i/4soFHYcVC
5+MzMEZIRIVV1R1TmtUT8jndUVm+hw==
=E6xS
-----END PGP SIGNATURE-----

--7sGY4HkxxfMfhxAK--
