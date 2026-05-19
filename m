Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391EA1F4C8E;
	Tue, 19 May 2026 14:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201223; cv=none; b=G8/e3H4bUbhV9nyOHCsD5MOoAhgTfhJ7r12VYwDCJztjFzMz8X+gmwEkGeOyNWWixRQHTXP6sJaUdLPRYawChNzdZCDLd04pGBfwo6UKrX4cgKCym3it8o5z5PbaouUj1zWTYnDaV1IT0J76Xjja0KKgICRmzu5URMtUwiy9cjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201223; c=relaxed/simple;
	bh=/lwUrzLtHDmC5L/EvQ83FGks75jkMybPxXr49rsKcCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UsoE1QIl9bidQn+KFaRmRZvnfHoPvWzo9PY0xPH94nnyE8jG1Et94JiZnOYP0AUbkv9f/lWhKloz8AWbleCE7g+MXWPPqjraxZD5gi2HL/hKtJGHN8eZBQ/Rnt+yRKp7eVPJAybMG8xMaH4X0t9aMH/MfRxUR4vJAe3vzY8f/zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKhYlEvY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKhYlEvY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD5DCC2BCB3;
	Tue, 19 May 2026 14:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779201222;
	bh=/lwUrzLtHDmC5L/EvQ83FGks75jkMybPxXr49rsKcCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RKhYlEvY2X8I7Tnn1hLa42LJSoghnSUOCV1RizZPQE1MRhNWEZP7zwFOSx1W75LdE
	 6/sWnDKc4zgP6tbgru0CeXaIhpwZKlNpBsnwl7Zdxb/a4s7fdk+KYq4l5kWrkkLTYh
	 SxLq4wJkcAYVlYnndCNBArS1YME9NVR4rBqFhBVWqXVkaRyRoQIR+XkKa3Y5cwBl+2
	 +IMKephsM9vCt8Iyi8CyoW+3mG1jSLG6+fBg7PcwLsvJlcY9kGEW0GJ5BKQVqtb4GE
	 QTxE07QgXjvMVjf09Hgoz1vyIuxvIhd1Xz2FEAVoa3d4VasmD0F/DPDTtF4S7NqaI+
	 fi9W4fcpf0ZuQ==
Date: Tue, 19 May 2026 15:33:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
Subject: Re: [PATCH v4 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
Message-ID: <c2223ce4-0e9e-4fdb-b289-4e98e64f8e95@sirena.org.uk>
References: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
 <20260518081738.2453957-2-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w4kizHEW2fThmxhU"
Content-Disposition: inline
In-Reply-To: <20260518081738.2453957-2-ajay.nandam@oss.qualcomm.com>
X-Cookie: Huh?


--w4kizHEW2fThmxhU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 01:47:36PM +0530, Ajay Kumar Nandam wrote:
> Convert the LPASS WSA macro codec driver to use the PM clock framework
> for runtime power management.

> The driver now relies on pm_clk helpers and runtime PM instead of
> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
> clocks. Runtime suspend and resume handling is delegated to the PM
> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
> PM callbacks continue to manage regcache state.

> +	ret = devm_pm_clk_create(dev);

The !PM_CLK stub for this just returns -EINVAL so if that's not enabled
then none of the clocks will be enabled, the driver needs a dependency
adding.

--w4kizHEW2fThmxhU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMdMAACgkQJNaLcl1U
h9CQQAf9GykOBySA2ClRxrA6ln+Wjfy6PePYJt6qLAYa+rptm3x6h4IKYPuFyrV/
rB/YKafp1oi/1ViyN2/kaB5itBp5ovafNtjVnA8IOtX7WVv0vskrmXeJ81ygqrpt
cP6Jt3MsqJ3qryjC4qc2DLEWEjJJOliwzUgCmNsq6R9PAuruVDAdenMe8nU6+QH4
QdQuTdXtxWXFtc6VUvcF2w6f9FDMIEBJHOhlzqAAolMHhHd2tR7NGa0+hLpS9wlY
KJcjn+w/sw7gi9ObLaXFwGlktUYwHqRvdP2mIk+UJwvE6Pzxnvkg3BZLksuLjMtb
UUknRNi77wLAWzFAKxCpy4nWInpVUg==
=udHS
-----END PGP SIGNATURE-----

--w4kizHEW2fThmxhU--
