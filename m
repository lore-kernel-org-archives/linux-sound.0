Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9656B340D93;
	Wed, 18 Feb 2026 17:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434607; cv=none; b=Wm3KCW9oyzX95Wc2hR/GT696FIbhoHyRrYk3OeTWDX6FTFaM7aYKbzTuMA7yCqKWBdARwTgFDtwelHmCltoP1VzfXS2CjYtDfqDrGy4xNRw2KhoTZog6CWIVF8/qCUSdYWMEjK9Mvopp5cNHv36tv7dDjDKRqyKFNa446pxNu8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434607; c=relaxed/simple;
	bh=vrf31UGQC7sMN9Bk+WuN/fZZA5/1kvKQF2i8RKcU5yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSucNHHgdyYbhpY69meoi2HJUUXMS/iZdm/K17w4Mcs/4MzYzKhOB/aTpR4MCM0SMSH4QDUgTMt/crZfiY6q9FtTvXqlxLlwegOPug9GyEutoSPVB8keJlmCrAqwtPdjcXf9cwr1KvGjNblHNPzHIV5Y0sA6BNvWLjxyH+DAJXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a51d1zNw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a51d1zNw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 800B4C116D0;
	Wed, 18 Feb 2026 17:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771434607;
	bh=vrf31UGQC7sMN9Bk+WuN/fZZA5/1kvKQF2i8RKcU5yQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a51d1zNwz1POKc4pDTtQf1eSurysdgjW4USBKHRNkWN5NWDL4O12xpFHC4QNXdo+e
	 AtPIH6yg4AafDwg5IWuPV41L+/o0/kSWq2DimzAum7w/80/XeuM+vSgzYaiYZHr+J7
	 GQvSCXHRR3bAisqevcFki5EHjv6zPqnPAwv+ZC92Xdw4rQXwjZfwN80YvpMtt/+0l4
	 oL+hi3siKlhRHK+1/Ard8Yvp01bvO4L3KDcyInir179EYz2enOg2/WPMjDNuEQLudX
	 C6p0hM1QHZE7WzQIKA3rIjbxT/IVcNzpPMhr4cSGC/3rSpC9LmrqbqfQCj5zisXJsA
	 rKV04kWTP/H0Q==
Date: Wed, 18 Feb 2026 17:10:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
Message-ID: <e1cea076-fb1e-475e-b6a5-383370a69722@sirena.org.uk>
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
 <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
 <DGI2YVYBECUM.3O0UN9VMKF7FJ@bootlin.com>
 <34f61d25-607c-4967-bc67-3c7517c7fe14@collabora.com>
 <DGI8RSUWQ7W8.MDY7YGXPA5LX@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sg2fNopepba5YOFW"
Content-Disposition: inline
In-Reply-To: <DGI8RSUWQ7W8.MDY7YGXPA5LX@bootlin.com>
X-Cookie: Avoid contact with eyes.


--Sg2fNopepba5YOFW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 18, 2026 at 05:51:51PM +0100, Luca Ceresoli wrote:
> On Wed Feb 18, 2026 at 5:01 PM CET, Detlev Casanova wrote:

> +		if (!mclk_rate)
> +			mclk_rate = DEFAULT_MCLK_FS * params_rate(params);

> With this, and DEFAULT_MCLK_FS defined to 256, arecord is working again.

I did have the revert queued, but a fix would be even better if the
patch could be sent?

--Sg2fNopepba5YOFW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmV8mgACgkQJNaLcl1U
h9B48gf/d+VlDiIQX8LVKF3Pt5LLWdaLDPBQPRcJUMtlQ3Gq527LeYabfnGZzMxW
c7XCtu6ZCsfeslgZ9bXWWUQOEQSOfccHBVZe/OdwDhnosl6/w4ZJgtwiFKRdgFgF
EQnD5U3CAtJdxsVsWTwZHubB3aW5wGACbckm1r3VQCAA2dz9CH9XAsm90Cc5Gk72
Sx9vIqBBdlh/dRaI+J6d3zPJ4PHzskknUMBdfMSXafQAyGF2LCxNZ+isYxjiCKK1
Ely+fHBIqUSpj3Z2uUetG7jqvRLr0XYjPXel3pl96RXulhkKXuu1rX6SRpGhoXMq
/GEAda+ItwVRTta9P2EIXFwPqN5cHA==
=3Is/
-----END PGP SIGNATURE-----

--Sg2fNopepba5YOFW--
