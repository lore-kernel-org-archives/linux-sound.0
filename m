Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5323149659;
	Wed, 17 Dec 2025 11:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765972729; cv=none; b=ARP0/pT/nHoUWBw5MmJ96fH+8eyHQBBkUNHx6zzR1Gag0aXG5bOOfUJIEf2nkiVoRTJg4G0h5KMqUoDmKNdtiu73jNsvur+ItKrXlPkDLuc5jlcRVdHGxUbFN9R1DLTk7u46r7HB0WP8eItjtVZMMcghqGFJprwKIQ02Rk8/vjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765972729; c=relaxed/simple;
	bh=az23+D/s/gQqnMv3r7F2jy8VIJ1DssI/7UvjBBpPB0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B174AYsfDuCflBxkMSUY4DYOGZrbO7ZzZduYn+xuw+ayuFR4FyAy3i2kkis9I9PIjSCH10VHFkfpcbctJhv8yCKGe1y9KNlxe/XMRbKpBj66ZaRqfLnnjzUgrmaeWbF8oecLeorsqdIe67DtLyp2P8OnFKfluNQugl6UgtSgHiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxulqjAR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxulqjAR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13851C4CEF5;
	Wed, 17 Dec 2025 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765972728;
	bh=az23+D/s/gQqnMv3r7F2jy8VIJ1DssI/7UvjBBpPB0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxulqjARz01fMVw+ZwOKhMaD6WrMagxG/KcAIP0Rfd4sjcIPltTimbt6A7SH/RUPN
	 hIk9qY2MKX19MVvYosRTA1vmX7h0qvmTGlM8M+uLNMYlekCQCEazCE2IARSwX28On5
	 sCB6JJc9EZIX0WKXZlphIww9QZ2AR/Fntouo/8dU4hVKzyJEBBeBhbBoOL54NEfJZw
	 GCIFSLfrt0IM6y+X32ZsBzEYHYitoRAmta7Z2WCDTmikl2xb25hVWAV46OHuaSE0fx
	 9oBQbV/GTmyvdJGQ1aGPRnhcA1GvpyJ9iLXSNx/iGhJqkHRl2AVBbuyE7pL5ujFEve
	 oAP07XXTvMm9A==
Date: Wed, 17 Dec 2025 11:58:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tlv320aic32x4: Fix missing error check for
 devm_clk_register()
Message-ID: <d7358b2d-d9c9-4092-8ab4-5b9ba6f29341@sirena.org.uk>
References: <20251217025051.2196-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8RoDmGepTBGWjh0Y"
Content-Disposition: inline
In-Reply-To: <20251217025051.2196-1-vulab@iscas.ac.cn>
X-Cookie: To err is human, to moo bovine.


--8RoDmGepTBGWjh0Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 17, 2025 at 10:50:51AM +0800, Haotian Zhang wrote:

>  	for (i = 0; i < ARRAY_SIZE(aic32x4_clkdesc_array); ++i)
> -		aic32x4_register_clk(dev, &aic32x4_clkdesc_array[i]);
> +		clk = aic32x4_register_clk(dev, &aic32x4_clkdesc_array[i]);
> +		if (IS_ERR(clk))
> +			return PTR_ERR(clk);

If an error does happen this will leak all the previously registered
clocks.

--8RoDmGepTBGWjh0Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlCmvMACgkQJNaLcl1U
h9ApAgf/WdbeemHJNv9QaVbfpSOdv6mfxzedPXVKJHLwrFRvQND9sXZOGvUuZtAX
N8V7FZvo5vZuLL+KwwGQG6nOaPn3VLh0U3kF8e9dcp/P1DtdvI7e3daMCXaqtpht
WUM1I0TmC/n1GbrhERbuysRQG9JWk9fi73c9aeqxhBakUi0w9bS1RSUdiek0UWv6
z1x/o2OXxPbzso9Tee3egzkVPYYManVMJz40OW4+mmq9xWlkGK4BO4Aq+gMpNI9l
/+YU8f/CLzZ3rZxHJEHUjd1IYROAr1SYlM4iB2bUl6dxJk4HVEa3FrJx8J/Gt+fI
ZplnTqVniuZXyiTTRS/Nn3zOMCi+IQ==
=n4qd
-----END PGP SIGNATURE-----

--8RoDmGepTBGWjh0Y--
