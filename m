Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93051A42D0;
	Thu, 12 Sep 2024 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726140190; cv=none; b=WOA9i5G0Q7ZIPFslBjyjZvdun7SU1GLvRYVFhMEbkXj1qyfIUWZ3mNQr4H7lPS6TTkmtolpsSgOxQLBLyL98GlJMhLHPBbF7SaSJBrMb4RNyzFLNs4zSpea3G+C81sHzvksC60wvohfSOz12m+RTGFlmMu6Pz5jV5gy2MRtbfG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726140190; c=relaxed/simple;
	bh=wi4eh6Bhf9065g9IPgV5aYCLO5OYDMz5Y4IF0FbnzQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3YRxPEIiA5ysOe1eKobywKm+A7RuPKyR01QQ8ZUCx14cTVqVp2n3GsGncq9iOuMTWBceOOjBI7RPmUsdGYUWGS7sNOg2Fedp4XEzAx0JIcS/6HSb0qjrbU1pmmFDfzuvc8hkOwPTDvCKyS0r3h3sNNHmYsCWdXpeWBssKoK8Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYypDVPT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYypDVPT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED17C4CEC3;
	Thu, 12 Sep 2024 11:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726140190;
	bh=wi4eh6Bhf9065g9IPgV5aYCLO5OYDMz5Y4IF0FbnzQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYypDVPT/2O7zA+CCnkJJI/4Q7dXlEtC2dhiM+Rt92Ia/bpG9WzM9uZNT5tvAGl0g
	 zq8dhAIlzsM1ewm8TpYnGXK6uZ8kUC3baxoy/Tou8ZTlcFdeLqwYSxrqf964KMOhJJ
	 LhFmZcfrTglZfOJY1522QVD6F9zNsynbB9BgBxf9o/+HmGdpQjOMaACLLli//2IVdO
	 1K7kfjz5ArCKl1tflR6Xn1WCqOXx+WpjMEK4Kq7fMK3P0SRSjU7J5bqywXR/WaptEr
	 torRixbRVxncJa7DlZVz/SBpkXoLg4ma7GoEMM8paT0J7IxFnH2A1XesgYLHuWPADc
	 Cmq4cbc5xxuKg==
Date: Thu, 12 Sep 2024 12:23:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Application <application@irondevice.com>
Subject: Re: [PATCH v2 1/3] ASoC: sma1307: Add driver for Iron Device SMA1307
Message-ID: <9c672897-3470-4994-8f22-3e1911ef3c36@sirena.org.uk>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-2-kiseok.jo@irondevice.com>
 <51e05109-049f-4efa-b923-60943fe82777@sirena.org.uk>
 <SL2P216MB23371B88485C16DF14A274058C642@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wUoJipqS0jGmv+Ga"
Content-Disposition: inline
In-Reply-To: <SL2P216MB23371B88485C16DF14A274058C642@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
X-Cookie: Happiness is the greatest good.


--wUoJipqS0jGmv+Ga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 12, 2024 at 08:35:05AM +0000, Ki-Seok Jo wrote:

> > > +static DEVICE_ATTR_RW(check_fault_period);

> > Any reason the fault stuff isn't an ALSA control?

> I'm planning to change it to ALSA control as per the feedback.
> Could you please let me know how to set the default value for a control?
> For example, I would like to set it to a value of 60.
> (For controls with a boolean value, I would like to initialize it with a true value.)

For something like this which isn't coming from the register map you can
just pick a value and set wherever the data is stored during the CODEC
init function.

--wUoJipqS0jGmv+Ga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbizxUACgkQJNaLcl1U
h9BTLgf/Ua7Ov5hjGscJFUzYbRL9HCfAEC0w6vw+uu7adii69RTeDHc70LFCy/zq
gFNQ3oXSfwTCwFMiTBdEibyni2fbNWeAvQIT0ouGOcx5q2UOIko5tPMRexboNcQN
5OCDh+8AMjcgrk4btDzwhGCZPbU0/XatSVGFZheCbXkfp4rsERSfemTEE4zRz0B0
eexOHmpqLOM0Mp480ZhgEXdd7WffkZtfHWF8iStuIJquqlnON+CF5Ie+U2e8B/bs
WTae7DVRD0R+gm3jgn2RpcTdooqY460vicDEU1AhbQRG3FJ+ThRJIRFsxR+xwBJd
d+o632wkwU7kga9nFeME0oZCw2PiFQ==
=rA+w
-----END PGP SIGNATURE-----

--wUoJipqS0jGmv+Ga--
