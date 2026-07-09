Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C883723EA8A;
	Thu,  9 Jul 2026 17:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617464; cv=none; b=FB+FWWtNQSOda5Evq2YUcr+F4Sbyxdw7p9/fD2NHp8Atl9ljgNEc+etHfRgoogNIUA1t1sO660kzI20SR1WA6F8TpvKE7J4Stw3Sv/TWeY9ad9z6Rt28vsg+UPbj5bX17Q6KzpCytbtdeL91vRFyfXpDHW4resKwoENv5o/07YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617464; c=relaxed/simple;
	bh=aeXoARSWbQHaBeo0zPuFlRQn9RNcBwMWekmXAT53GCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxL0EkIzWGGNugd5awJx/UIB+/OhWJAwP5S1vxcQFdRVtnP97xg/UD+Sl4/1nCXKOm/RCWAPzUCnnLB72b4Ut1LCt5a8P23gAoIRQqmS7Al8EuMRxcu6vxkJTyWeyW+0DBW/qJxa7hIbZKTOzz3d1CQ4hHok8asK/dOocKcZsB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrWVg5Nd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrWVg5Nd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E220E1F000E9;
	Thu,  9 Jul 2026 17:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617463;
	bh=hu7RJDXVjMt/MUj7Dde25d8+nHf2eRwwqw8qorwPda0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hrWVg5NdnRkfv23bl3dStmf6K1bZbQqAsdmgNROeNtC6upsn+egi3YbvnFMxKnQDm
	 EFkTAuE/iRyWUBEKW1ukVsYOfLnX+BqFIj3gErTfolCNBgw2Dmf/ZC7qgiE5zHXbST
	 Z9XcuXXBW9BiUexjO5oA+SFpupSCIbb/LJ5cNe86ys1GEJSUEMuSgdJRvBF0T0rovi
	 1z/CReHMtCa2sijCoZaGkO1kxt36d9H90Dkf8uFQWITEHFDDT+4nbXxgVIexzRHv3X
	 csaAfEMHXaIILJJ1gPuWgBkLbP+4592aFblDIGNdWGLG2dXCG10YsYgyxoOCn4/uUU
	 gaicFrvskiLRQ==
Date: Thu, 9 Jul 2026 18:17:34 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com, Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/27] ASoC: codecs: Use guard() for mutex & spin
 locks - part 2
Message-ID: <c74c52c5-91b3-4764-a7a1-26fc940bf735@sirena.org.uk>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="61d5AFFcly1gk4TJ"
Content-Disposition: inline
In-Reply-To: <20260709045902.498848-1-phucduc.bui@gmail.com>
X-Cookie: MS-DOS must die!


--61d5AFFcly1gk4TJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2026 at 11:58:35AM +0700, phucduc.bui@gmail.com wrote:

> bui duc phuc (27):
>   ASoC: codecs: da7213: Use guard() for mutex locks
>   ASoC: codecs: da7219: Use guard() for mutex locks

Only the first two of these seem to have come through which has rather
confused things?

--61d5AFFcly1gk4TJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpP164ACgkQJNaLcl1U
h9CXVwf9Hi+8k/grZJpWPryXkF9eQnmQKdVD9kTokae7G8oJR/aQEzZjTiF475Tk
pc+ahjdUoUcnZYBQLiaqQTJTnWvQW62QrUAGVXOzPv8KWas47Wd3Jd0LmWpgDpYv
MfzehjZyymLLmCVN8oImAvE97g7oUmbILYWnfkjfSMANhkSjbEHi/+VXT+tmxCzs
ihiM5Chu+C65wTbVjLw2c6ql/7p2aE61fnYsr2RCrFaV/1Xwbf+rO9AQIAdomo9w
nLP/cAg+fau0Wo6W44Pd1p8wWL0Bt6CR6QSgCRhv258l5YZWxS/uK5HNypSPnA9e
gNdNfKpYEndx7XQWxZrIeV7iSdzNNg==
=rheX
-----END PGP SIGNATURE-----

--61d5AFFcly1gk4TJ--
