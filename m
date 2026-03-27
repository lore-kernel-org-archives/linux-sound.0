Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C0B390223;
	Fri, 27 Mar 2026 20:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642239; cv=none; b=paLSMbqaaJDCkbFwVborkHBJg0otJYOLBEUdyaBC+JUn7m3GulOKbeSkW3IcRzjb5ofcKV7FHSDKvcKmwmew5OKWUor1mJZd5WT6Za83wsV6vPA6lsG9wDoK8A7Do80lo7Wy+7t2egY2lSDujQcQzzqvSIQ3ltzbUwqOmd/tW9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642239; c=relaxed/simple;
	bh=icNpnkUay1P0XdndMd/2KFMklbVHoGsbDkm3boCH/0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3PpW8AnvpWEcBX461SbLHjZS4YWCThE/OoyUKxzaszhNNqnnVXQu8J7tGzy3Gi0XM36YKfE1a+S5Zus9haxcX+3W1/iCPUaeXrlhKFeETb2mP3S8dQ14DNpQt4XHRNQR5EWGGsttjmtshpBATxWTIaaXkeq3C29zxZGIH/ZmtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7Qloev9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7Qloev9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3585C2BC86;
	Fri, 27 Mar 2026 20:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774642238;
	bh=icNpnkUay1P0XdndMd/2KFMklbVHoGsbDkm3boCH/0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7Qloev9f0WkRjNFbCkzfqMzbCDgF6gVWJ6bAypZI8PDhxvcQd5EOWGaDoC9HKSVG
	 2jNH2lJjLE6hyv9ZMvNqhLrJeDnkbNG7HyOtjtMOWykZt6/ZzBbaDlM8LKCpJIdqN4
	 6sCcUcMtad3svDufPyc8+EGMNYrJ1A5a6ePTBwqq5U61TxHnWG9ExvWJpTIpJeNYEF
	 g36axLHN+XtAGMciGl8pWdYV0F4Hs3Bs2zRC73sSySh/pcsJlD79Wt0l1KlnRqHsBx
	 5sCEfMVIEdG+AuBiBxGv8dzJ2ycZzrBeXSI6joJaJgmc96fudSBDXjxhElfyQyiG53
	 k/+YStkQ1r+GA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 85C311AC5847; Fri, 27 Mar 2026 20:10:36 +0000 (GMT)
Date: Fri, 27 Mar 2026 20:10:36 +0000
From: Mark Brown <broonie@kernel.org>
To: aravindanilraj0702@gmail.com
Cc: linux-sound@vger.kernel.org, cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: Intel: bytcr_rt5651: Fix MCLK leak on
 platform_clock_control error
Message-ID: <acbkPMwwcas627JI@sirena.co.uk>
References: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
 <20260327193002.423897-3-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qyB3SKnb2HaEBPL1"
Content-Disposition: inline
In-Reply-To: <20260327193002.423897-3-aravindanilraj0702@gmail.com>
X-Cookie: Identify your visitor.


--qyB3SKnb2HaEBPL1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 03:30:01PM -0400, aravindanilraj0702@gmail.com wrot=
e:
> From: Aravind Anilraj <aravindanilraj0702@gmail.com>
>=20
> If byt_rt5651_prepare_and_enable_pll1() fails, the function returns
> without calling clk_disable_unprepare() on priv->mclk, which was
> already enabled earlier in the same code path. Add the missing
> clk_disable_unprepare() call before returning the error.

The changelog does not mention this...

>  	if (SND_SOC_DAPM_EVENT_ON(event)) {
>  		ret =3D clk_prepare_enable(priv->mclk);
>  		if (ret < 0) {
> -			dev_err(card->dev, "could not configure MCLK state");
> +			dev_err(card->dev, "could not configure MCLK state\n");
>  			return ret;
>  		}
>  		ret =3D byt_rt5651_prepare_and_enable_pll1(codec_dai, 48000, 50);

=2E..separate change which is unrelated and really should be a separate
patch as covered in submitting-patches.rst.

It's a good enough change, ideally we'd log the return code as well.

--qyB3SKnb2HaEBPL1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnG5DsACgkQJNaLcl1U
h9A7Fgf+MZsGrv8JqrRiX5P80N3RVqwLpyeq3Im6XKahOvM+QNG8VmK1E5lvO9EE
MPst/wdjdjFUS913PpC55g1Fl7OJfbd9coIgBOe5gh2eXbhHG8F1Zi+B29J14Xlc
HuE5uPeRrVQSo51Owi0V3XZm87KFUIgExXAhSBhJ1tdOEQW7zIR4ZDwLOee24fnP
fUsX8IJ9D7tzKLJgfSni+4HjiNL+Vni3sQlSFVtJcEtLaIn0mz0WnoOBqtR9dgpu
VCB/rFJxzO9c8uCF+2UEaJGwrA9QemEd6PGJ7AMIVq/ZkoPIvFliVdSejmNgH+fx
GTGyqq6d56aNQ/SMjV4Gm9/KWGAjrQ==
=Veuh
-----END PGP SIGNATURE-----

--qyB3SKnb2HaEBPL1--
