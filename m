Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94F43BED46;
	Mon,  4 May 2026 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777902598; cv=none; b=TFRvG6O9ICbV9zdesmH0+PLN+TKWvNd49O7TDRydPRkn83t1Oawj5moNxSoyrtCuOcQDHmHOpud3dF6qwtFvxsvG9yyoj41Lqn9YLsZEtwJw89NnimEINaQFHZ8YGkJXzM35blP7ySrGOkgI21Z9lGIfHS9NvcOHTr9whJd49eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777902598; c=relaxed/simple;
	bh=7Y3TtYS4/shsbu2UKhNA4Nqaob5i3kIIqd1viluZmKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IehmfA/x8kMuN3C2ImeocIBwk71zXvSU0OGDA4eCwUGK3xZAVTk0Xdq0qiEdnGH+Ls5ovhOnapwFdtNAQuBTjvt+Y4S4vLIs0R9FxxJqtjmfxsYuCvW7sRCkyqWM3SC5Nmy9iTumt8WVsjc5+H4JsUj6+zvtOG9ByfTKEok1p0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H981NfkM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H981NfkM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6518CC2BCB8;
	Mon,  4 May 2026 13:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777902597;
	bh=7Y3TtYS4/shsbu2UKhNA4Nqaob5i3kIIqd1viluZmKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H981NfkM0kyBjliixhjJWaIxJhepuFVe6OClp0EeMCuoOmJzNkqnIwqoRASW1pXi/
	 flQQPXJJycK/b4t5rXQ9KyTu629eNUA+0ynSvl07yGRT6kzuM/Q8d/NuNDceltzki1
	 MlrEGnPPdDHPc3ci5QaCExaShfu+UaaKGtm7tkuGrIq3zchK4ZgdIsJ6FmRnx1eDAg
	 f4QD2C1iaWijZLZhjinP2gdeoKCIMkZAHf0UnMJNlxAsiLzyCvNv053VCBTyDEjvX3
	 3Eiy1zm8VGojlw+KKFVMakxcsDor0eQFCEkBRb8HCboPrTdi4qEO2RM3wC9mtMIiNz
	 qkwJf9C313XMg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0225B1AC586B; Mon, 04 May 2026 14:49:54 +0100 (BST)
Date: Mon, 4 May 2026 22:49:54 +0900
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, baojun.xu@ti.com,
	shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v15 3/4] ASoC: sdw_utils: TI amp utility for tac5xx2
 family
Message-ID: <afikAnQRYH96azCv@sirena.co.uk>
References: <20260504125716.2015-1-niranjan.hy@ti.com>
 <20260504125716.2015-4-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2m8+CUxlUu4HyZkC"
Content-Disposition: inline
In-Reply-To: <20260504125716.2015-4-niranjan.hy@ti.com>
X-Cookie: Alex Haley was adopted!


--2m8+CUxlUu4HyZkC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2026 at 06:27:15PM +0530, Niranjan H Y wrote:

> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(asoc_sdw_ti_tac5xx2_spk_rtd_init);

The other helpers in the file are all EXPORT_SYMBOL_NS("SND_SOC_SDW_UTILS")

> +int asoc_sdw_ti_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct

> +       mic_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s", component->name_prefix);

> +       card->components = devm_kasprintf(card->dev, GFP_KERNEL,
> +                                         "%s mic:%s", card->components,
> +                                         mic_name);
> +       if (!card->components)

Do we need the local mic_name given that it just gets fed into another
printf() or could we just use component->name_prefix directly in the
second print?


--2m8+CUxlUu4HyZkC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn4pAIACgkQJNaLcl1U
h9Al3wgAhHAQZy/BoEHu50a1irnicQ/4UlBeDwAob0e8FMMLCHnxKma/yaBhbHni
yVmqwEROSjeIhoqTcsRRC3PK67phZn72bgZsqo/HbH0r/4XDeF/TiVjkLOE5cJej
ZlhLaJIx08VjEzBlg0AR9HjRjfFMWqb7qUznV/vhBreUCIDiKRlO5QpRmOXQNccT
RWtsx0ovdYhgrv9WTSsBP3EnVxzQwScCqk2lQXMksaDjlmyh/gkCZfB5dxYYcFWx
YzfHVQNB3mn+viYngFdVG892tPtlqXXKUOVcmtQo/L1GlBYabbO7UmH5YuRpWJg0
Wk5ARP6hlL7yfmitGJhCpIp5RLZyig==
=AeBb
-----END PGP SIGNATURE-----

--2m8+CUxlUu4HyZkC--
