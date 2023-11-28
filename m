Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF7657896
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 14:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlYoUVtZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F04EC433C7;
	Tue, 28 Nov 2023 14:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701180918;
	bh=fpKEocUxMrrYcqELYtVIaj9TqLJFUwmG9ZmXoKkWhZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GlYoUVtZdU7z+1KSGtWb02ZBz3uQMEOVik7A4hKmwM/aLjG87QqnhGQqJooCClAG6
	 vetrqSkfJ+hIIdCNDC27KdjVEQsBj79fBsiCU/7qD5Fvf63l9QaPCuH08Kr8JYOtuZ
	 DCsXaxjjPAQRqV09qUtRBpixROqRnYVXMvIxZOWyMh7jU1nZAitg3NqPrxoSJTMpkH
	 PXN3Jj0hRU6/hu49lsekvJcQQk1JCJuUckwelycWiGDVOmvgpZIMkw+C7+remvLUke
	 pUKGYlyjxyYTLwM0sNLb4oIhBMAn6CoxaSVXY73fluV+NFknXSKHirQmO1yrVbqtCN
	 8BmDHdFNoNCHA==
Date: Tue, 28 Nov 2023 14:15:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Kamil Duljas <kamil.duljas@gmail.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH] ASoC: SOF: acp: Add prevent against NULL
Message-ID: <bb53b12c-f0e1-4e74-8fab-3bb887d2d1fa@sirena.org.uk>
References: <20231117201606.1955-2-kamil.duljas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ly5f+a4TVh2d6ApJ"
Content-Disposition: inline
In-Reply-To: <20231117201606.1955-2-kamil.duljas@gmail.com>
X-Cookie: Must be over 21.


--ly5f+a4TVh2d6ApJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 17, 2023 at 09:16:06PM +0100, Kamil Duljas wrote:

>  		adata->fw_code_bin = kasprintf(GFP_KERNEL, "%s/sof-%s-code.bin",
> -					       plat_data->fw_filename_prefix,
> -					       chip->name);
> +							plat_data->fw_filename_prefix,
> +							chip->name);

Plese don't include spurious indentation changes like this, it just
makes the diff much harder to read.

> +		if (!adata->fw_code_bin)
> +			return -ENOMEM;
>  		adata->fw_data_bin = kasprintf(GFP_KERNEL, "%s/sof-%s-data.bin",
> -					       plat_data->fw_filename_prefix,
> -					       chip->name);
> +							plat_data->fw_filename_prefix,
> +							chip->name);
> +		if (!adata->fw_data_bin)
> +			return -ENOMEM;

This now leaks the code binary...

--ly5f+a4TVh2d6ApJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVl9fAACgkQJNaLcl1U
h9DRmgf9FivgR71JdwufFtzF1Yv4mYhxVCkokn2ICbfL5yVE0zuCR2x0DQHdZIDD
rwAGJbGWbrIw9KWThiC3M9P+bbDepiTDVUy21R7iicAKFDw3nvEjbBei5KenF8j5
Dj6+ezNNcTA/tpYw1YL9aTjGBfgu6X/f1lwf+K1tu6dAbXUhJqnDnLDQzdzqMfsh
6jXyGlxWFdgOber5sYmDkLv+fLgXMM/iGarZNX7T0jRw+4jF6boQtCsWY1x6+8HL
WfQxUSLQKRin6/Jy5lhLQOKZ3MoxVwnOpaC78fNjqSN9rBvVJBzfkWNkcodeVRvq
USXhWq/aXvORd1C0SLaIr8aHdNjVEw==
=1Cz9
-----END PGP SIGNATURE-----

--ly5f+a4TVh2d6ApJ--
