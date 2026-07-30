Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09692AE76
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 16:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429661; cv=none; b=mShSoE2bp/MmozyqVl7QMwrsxjycEUpjWBc2jEdJ1lF4ZOfvTWXpqtqEt/dcwlfPkRysIelER3Khtow6xKYn6VXnC74QjETkmSdlkprQGiKkWT9tL3DpXWStMVAb12tB8JOB90R9/kT/xwPaEY6wfR+QJ91/ajpYlHirrd69ISU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429661; c=relaxed/simple;
	bh=hE/aKmuSV/x/iVe4+EAx3CDiBl7hDsKb6INd6qooKKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4L8nafy3mhRrJInyK+Y+YASTIdBIm7wYaAdY0KsyJOE+RZ/0CyQeZSMfuCTo0AD9a3C/XUIstlB3qLCz4buwjsdDSuR7fiPKYIFalkHdwWs42XLOTH6wrYDXvq7REkdX5U4U9Iy9Ym4E0AGLvWR0mls5MODTLqGUoPTLuDDGS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n1E0N6yt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n1E0N6yt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1C91F00A3D;
	Thu, 30 Jul 2026 16:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785429660;
	bh=xLiwrH5I0GuHdUrd6GADoezDrsuuBjVi/lL1a6RtBwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n1E0N6ytA/hhXMxxDhgjrnObgJmVCSdncNEj7iyqWaQTxs3Qysd9Y1m723tIQePeN
	 IIlu43Wqn7sXhgB0uxLdBDE5v9xqRxv8cKEsbt2oHHvQxwBvgt+hLZQRUcTZY0g/g/
	 XmAvOU65pzwc+RmYcTiiI34aDmL/TzO0vkVYckHW/DZJ8uMNMEa357myhVRPWGMeTc
	 RbSBrAwPC9+ic4xvb9jARu26kJluY+0KT/n+Qs6AspcOpNm/9cCHyDWOeOU4iKFsAs
	 zNBKLtEeIAuxfEzFUuiutc+zn5duOhQ2BvA/+Fc9TpFgvgHUrOrhAaUAvbkUhust0Y
	 UUEkaOadD5Lkw==
Date: Thu, 30 Jul 2026 17:40:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, tiwai@suse.de, 13916275206@139.com,
	perex@perex.cz, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	baojun.xu@ti.com, k-lu@ti.com
Subject: Re: [PATCH v1] ASoC: tas2781: Optimize calibration to avoid full
 device reboot after calibration
Message-ID: <43286199-dde8-474f-929b-a9ccdb9dc598@sirena.org.uk>
References: <20260724102543.2067-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5zfKzzXBtEakxW2c"
Content-Disposition: inline
In-Reply-To: <20260724102543.2067-1-shenghao-ding@ti.com>
X-Cookie: In specially marked packages only.


--5zfKzzXBtEakxW2c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 24, 2026 at 06:25:43PM +0800, Shenghao Ding wrote:
> Some clients have specified a new requirement: complete device restarts
> should be avoided after calibration. Only a hot boot of the Smart Audio
> Amplifier is required.

> +	/*
> +	 * Set reloading-firmware flag after calibration, the flag will work
> +	 * during next playback, then set to the program id after reloading
> +	 * firmware.
> +	 */
> +	for (i = 0; i < priv->ndev; i++)
> +		priv->tasdevice[i].cur_prog = -1;
> +

I'll apply this since this is preexisting, but it might be worth
checking the interaction with DAPM delayed powerdown (or indeed active
streams).  There's an element of user error here of course.

--5zfKzzXBtEakxW2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmprfpcACgkQJNaLcl1U
h9D3bgf9HSYm3y361ohuNpAiC59YX35DbcqEuUiw5n0DppkTQqeMv4s5hZ12svna
WyrJAnws+Ymzgpg37iYouA1Rp5N8j4XdcK7fVQf08HcEwk4ExyecHOeNZqXFt0eJ
rpBo7NhJ1Xao8gpGMcxjZdK54UsmmxHSGc1QHcDRKBy94DeveWjmi8pijCdLg7Tx
IzhrOKSo+wbd7jgwNEsRs6Jj8SI6kPKAo4YfkgTtF5cxGPBG1Q67cxryz5Rdhn60
1Rtt3eYd9L4aPQMLP5rG5FFclmVnRIX8RNeveXgmdTjw046oFua9FxKZz6ZCI5dM
mIv31kT8SLC+VQndIetm0vC6wdfJHg==
=tQgq
-----END PGP SIGNATURE-----

--5zfKzzXBtEakxW2c--
