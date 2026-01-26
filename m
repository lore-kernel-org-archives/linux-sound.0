Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F99A246BCD
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 21:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769462532; cv=none; b=jDfx0CpPD2vK8AXvTHk88m7irsNW45wnr6Lg84z5L/9CxCh+2XFLcpqclrgZO/ePqSaNYQ4BOnrnGMTcMkXXuhAQrkthlNrsS0lMHfB1r9CQaDtVi+/flIHfJWK8HLMF0buWfUoIOY0SOfXBuZSKJuH1BYZ8vlfHBZ3iXj4l/XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769462532; c=relaxed/simple;
	bh=epqbRNM/6weIblsZcQ1eyG9eb/TctxPWwI2FzReBnlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpS1s5X/c6RGBeJKs/Yp+JjvWsYMd0eSUfpJLrMbmLnxeqfHJNZBSE23+tsmns/3c+6qQgd2XMy/jh8S82D4tNd94jYs24O85kqpTBYqjIPH/n/woBt6+wjIm3bBUsw97JtwZX2TRVTPpf9dPax/GgW3NKA4nVQqPKS2rfjbJTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vp+xsj2/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vp+xsj2/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85AAC116C6;
	Mon, 26 Jan 2026 21:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769462531;
	bh=epqbRNM/6weIblsZcQ1eyG9eb/TctxPWwI2FzReBnlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vp+xsj2/CM632hzyuY95zddJhY72p/+mn5PSmYYnFrLNig0S53LsP+3LP22hGJeAm
	 WYdovU9/UKiBTLL0ly0O8W4jN2WKbJGptdhu9qqgVpGYjCSyCxOwAIdHxgufuwzM9D
	 cnZylmqzdXUIETnc+ojdDdaPa7cs5roJhpF5Jt+0kLSfWD4/4HOX/n99y1H7eItIXT
	 do2z6dJfhF43f178/fazTLRtS032svavUMIGBNfjY2WJjrrYQ0nOAcs0Chhtii8mUW
	 ndM/f+1ftx//YkaCOMD3h5o1LAwfz6eyW9/LTgeAic9h/5x11d6Y1LKhwaPPQ6eec1
	 c1jSQAIoUfrUw==
Date: Mon, 26 Jan 2026 21:22:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, flove@realtek.com,
	shumingf@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ASoC: rt5575: Fix undefined references to SPI functions
Message-ID: <e259f5f3-072f-4b2d-9191-9a0717212beb@sirena.org.uk>
References: <20260126051758.3728312-1-oder_chiou@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="irkguet4Prt9vEFU"
Content-Disposition: inline
In-Reply-To: <20260126051758.3728312-1-oder_chiou@realtek.com>
X-Cookie: To err is human, to forgive unusual.


--irkguet4Prt9vEFU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 26, 2026 at 01:17:58PM +0800, Oder Chiou wrote:
> The kernel test robot reported the following build errors:

This breaks an x86 allmodconfig build:

ERROR: modpost: "rt5575_spi_fw_load" [sound/soc/codecs/snd-soc-rt5575.ko] undefi
ned!
ERROR: modpost: "rt5575_spi_get_device" [sound/soc/codecs/snd-soc-rt5575.ko] und
efined!


--irkguet4Prt9vEFU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml32v4ACgkQJNaLcl1U
h9C6xQf/Q1yCIyKtQlOQ8ZQn1ElpEwbM28yirS7Z9KS+ys2FbMLPhmwAplfc/aLj
A48AR6pk06lbGND8h6WADFpcUmTFszFeuBhoTHa2/kKhjLSN7N6LX9BRyQCQhNDh
60bhXJviuxtBMK3k1U1/nS/q+4pxelAIGsCfiKHIfms/xrExc3lwr8XtbdwadIHL
UUoWsGDCsENzSXzsdmHZyoCSFEYKA5CSX9yUgHcUVp0DZ4JeOxiYVwjXFOWQaqXB
kWPdx+E8kQ6uQt2U/xLInsuIBoHvRkxnjixCZVN5gbEFFQNXwhGjYtQDd+fOAoZd
amThhpKooR1fhhHkxKQB/BLgAmJHQg==
=7bN3
-----END PGP SIGNATURE-----

--irkguet4Prt9vEFU--
