Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1AD2727EA
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 09:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756458699; cv=none; b=A0vVS66BWvo14RYm+ekw/KHRV/LLgpxwX9OqvOjLHJMpru0YSXiaBXOrEdqviNrw6rpa+LDPd5j4r6SzpVXVUqChY0atfSElz9/JQws68fZv88vpXDUcH0O+5jc2RzQRerpHBqvLbrO7LcB9CAso1TXa8TtbGQYTRh/GJtyIe7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756458699; c=relaxed/simple;
	bh=XDsUBz+Z/pTsplKL9hdJKouFJhur4zXSJtHYzE7PmIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ji0ETk3c8Bpqw/CxXxDo09a/pgQcGHzjq8sH1eu+BTWwBzH6wnP93B3U7aRWavqDS7n5eyrXUwFDmcvXW8CIh3T+Pr+fFjTpaukUqg6c29bSwDmGn/OV4FB7GORCEnxyW7zKUcCasF0lVrIH5NK2hSqElgs1DJB5jc84Rl0rfII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tSw3er+b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tSw3er+b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2A5C4CEF0;
	Fri, 29 Aug 2025 09:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756458699;
	bh=XDsUBz+Z/pTsplKL9hdJKouFJhur4zXSJtHYzE7PmIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tSw3er+bUeqQPlSqY1V0Vlol5wlrokshfaUFtT1CHSL4Muckv1NedEfb8MRgaPkAG
	 vIIhte+j/dRbCzNubCX3Xer/ytPaR2PvBzvSwW4R9LueG5C5xVCqCyKunl0TLp6qAU
	 Yk4yvF05QKot2pYD7HWVsriBj37qu8Vi55o3JgA4Qrzwxin4p102nxQqS4QnK+5l9k
	 5+Wr8shyfE0G8jiA0KYbPlGHWwdIPwp9e7S2nNlJXb7q3tBKqE3ejVi6QAW8EQbZ2q
	 yiQjR9Tk2uB7we7eBU2yelI4JUej7DzsWTdrfvluoRJdEaM1vXbvMibK0DnaKrn+h+
	 IwnHjdX1+3hCQ==
Date: Fri, 29 Aug 2025 11:11:36 +0200
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, yung-chuan.liao@linux.intel.com,
	cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, navada@ti.com, shenghao-ding@ti.com,
	v-hampiholi@ti.com, baojun.xu@ti.com
Subject: Re: [PATCH v1 1/4] ASoc: tas2783A: Add soundwire based codec driver
Message-ID: <aLFuyMr8olVeOFgk@finisterre.sirena.org.uk>
References: <20250829065206.1631-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QT76D2I2cJprbHzc"
Content-Disposition: inline
In-Reply-To: <20250829065206.1631-1-niranjan.hy@ti.com>
X-Cookie: Filmed before a live audience.


--QT76D2I2cJprbHzc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 29, 2025 at 12:22:03PM +0530, Niranjan H Y wrote:

> +static const struct snd_kcontrol_new tas2783_snd_controls[] = {
> +	SOC_SINGLE_RANGE_EXT_TLV("Amp Gain", TAS2783_AMP_LEVEL,
> +				 1, 0, 20, 0, tas2783_amp_getvol,
> +				 tas2783_amp_putvol, tas2781_amp_tlv),
> +	SOC_SINGLE_RANGE_EXT_TLV("Speaker Volume", TAS2783_DVC_LVL,
> +				 0, 0, 200, 1, tas2783_digital_getvol,
> +				 tas2783_digital_putvol, tas2781_dvc_tlv),
> +};

Both should be named ... Volume as per control-names.rst.  mixer-test
should tell you this.

--QT76D2I2cJprbHzc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmixbscACgkQJNaLcl1U
h9BCiwf+O/n9yiwIr8L3IksQ9floTRD9r3odU+pfUamaz6JOuMdSIVXpG47Xtf2m
YTQVf/Thc8U/822mJlb1otpsKZ1l5xHPtTa1ZW7Sj5cEfvikaAP4wY9KsFdd9m9s
bxUY81cPbY2gaPHdh+RJHEol7fx/ZAE9+ArxZDwBNBWrqmgEu2cB8tk2DBnfZ318
rJt5yJj2KQ8oTi8o2/KtOFiJehw2wPSX4mOpgL2MmmNM9aOgF0mV6H8u9oV1tj5N
SoIjo7ojxvhBxsR03BOdlbEHJ0EOlVkvJEfjFZ7AROMXXanGNXXGKwxY5zyuyozF
WYF1J53FG/Eyw7wKTYTZ+5wr6bcErA==
=4Zjo
-----END PGP SIGNATURE-----

--QT76D2I2cJprbHzc--
