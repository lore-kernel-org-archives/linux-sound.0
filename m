Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F2F3DD52C;
	Wed, 25 Mar 2026 14:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448725; cv=none; b=ue6iiz2od/wuUxwbNu/gSVI2Xd/rWxf0xNZyn7Y8mRJkiVDhPvioXLO7jqVNjAQ51zQoW7huwUGjC7wsLUEmrsGWPytcJFzmNGUiZ+ucX8abd124SAoYWM7i/sepURmvnMEWFJHbBv/KyjG82OE76P71ffAjzT/J1lVI46psB6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448725; c=relaxed/simple;
	bh=EHBtrmqbt6yLbXbwH9G60rCeU84GVOOCWpW82V0/fYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2B46TEom/yzSNTj5QdicX6CGzf8BeregVa0K0ZMqbgIaBk5aY+Zw3BCqZrp6a2DZgY33CJ8XCAczOfsFL6W98kewnJQJ+YUoGNVkpG7LuwZCqOsm27VB/beiReSvdNbTkqptnb2BOzwWeUHCL9h9gAYdeMmVZbVIPavHllb5P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVNF9Yiv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVNF9Yiv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736E4C4CEF7;
	Wed, 25 Mar 2026 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774448724;
	bh=EHBtrmqbt6yLbXbwH9G60rCeU84GVOOCWpW82V0/fYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KVNF9YivE572B/Z6HxIUtCI1KGUKResY+oK9MobzFrPwYIYz2YfeQHdLQSw5X2SLA
	 oTCkG78Vv6hLNmA4A/+GLqtqJs62tiRJARerq9RgEg42PFqZZ1DkFRID9PEZDr0HXU
	 OpU6NL/RCfnTdIYtHH88GDfgj9JHjKHhA9gHnCafH6crrAzvQ72kFkI7u6zZuxwx+t
	 pNaAiOHitsfBJT3kkPHOVQSVZt6Ao5BOdgKBh75gjUXmXehayc4acovLEuvpKB4DQ2
	 vEiH9aDEaAUmMohEcUKilLhUNhA8QcW82URliMIy7l374rqRLxqNHP8qJSgC/e0SfS
	 ZtwXbwcdaRsGw==
Date: Wed, 25 Mar 2026 14:25:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: lars@metafoo.de, nuno.sa@analog.com, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: adau1372: Fix clock leak on PLL lock failure
Message-ID: <bca938e0-a7f6-45ad-ba8e-386acb56eb5f@sirena.org.uk>
References: <20260324215016.66347-1-jihed.chaibi.dev@gmail.com>
 <20260324215016.66347-3-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qGzLXl7nJtEoX6tG"
Content-Disposition: inline
In-Reply-To: <20260324215016.66347-3-jihed.chaibi.dev@gmail.com>
X-Cookie: -- I have seen the FUN --


--qGzLXl7nJtEoX6tG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 24, 2026 at 10:50:15PM +0100, Jihed Chaibi wrote:

> @@ -807,7 +811,11 @@ static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
>  		 * accessed.
>  		 */
>  		if (adau1372->use_pll) {
> -			adau1372_enable_pll(adau1372);
> +			ret = adau1372_enable_pll(adau1372);
> +			if (ret) {
> +				clk_disable_unprepare(adau1372->mclk);
> +				return ret;
> +			}
>  			clk_ctrl |= ADAU1372_CLK_CTRL_CLKSRC;

This disables the clock but we also put the cache into writable mode and
deasserted reset, those need to be unwound too.

--qGzLXl7nJtEoX6tG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnD8E8ACgkQJNaLcl1U
h9DE5Af7BlNzrc4m9gHCTkgb9ebyirPUcFTHcCo1HrS1QiGEnYUL2n3swe+sZXJ+
iL29lWh27LJIsDQCkyoq3EO2SMw9mzsqOCv01ilYm6mad2doPHVp6fE9PMQx2tdU
bW4LynrALqp6x/gSJNAJaF9yrEZ9/EZzyFKezSB1RHrt7arpzZbN+cVw6T3NWUfU
V+S5FHEobc/DhrDpRTdcLSorSi47B1d9XXJ9VffnG6VXBYIvWBToe4GmxqWG8hQl
uF73E4ZtttelUNV7MS6IJVoFw6eZZAXd2lLhD+CWLNlJcHFi01wDyMCZugosq3nc
R+Qd0mkIsall6jLqXLfWru3jmk9vUg==
=SMyK
-----END PGP SIGNATURE-----

--qGzLXl7nJtEoX6tG--
