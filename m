Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464B71DF72C;
	Mon, 30 Mar 2026 16:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889763; cv=none; b=CavweRt8SUz9t2qhE/c7VCzDeJdNvNcV6Zan5RhRmxSLwOCIyG92G1eWh19sDWggs3Bgk3lST8TKfr+AiS3aCXyLxySDbv5ZRZL2CGDJ7Zc1pWupESNqbWp0Yk7cDdZlniBsMnuUNdyuhe8DQP641sEILYJka1FHd1aCfNI9l1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889763; c=relaxed/simple;
	bh=Xn+1qiTw/NXrzLMVomxb5ibYDVwnFFeSwGmPfioVP9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p60tXb+u//JoApADLbPEvD8jh9iLNnZWKA8RukzyMUiPrw5GQBmkGHuGCtqmQA01tQoNY+x2ROTC2NnEiwwTFJjzcetg3WfNSfr+62RWfVhuf1NjgaEB1QSoAffqLPogKBde6KbqWHHJfrqqVlmZI/KF44vnLxhb1SqVlTNaD+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVqb2Szm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVqb2Szm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00EDC4CEF7;
	Mon, 30 Mar 2026 16:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774889763;
	bh=Xn+1qiTw/NXrzLMVomxb5ibYDVwnFFeSwGmPfioVP9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RVqb2Szm6LqmiA1LP3+mLwABcOWEGSdT45gtK7kT+FpUIpl8SQ7e239Dw+1OFLj6M
	 KAjU+aouPzv3BGTOsAocDduUubl5MPbH9DO9uR5X6mr0FjUxEDe2f7xByrYfpO36u7
	 aAwXeU0j2RwD/7GyzUFdVcbswGYu8gGEFM21h5/6ufuMbJA+nzY/5ZDR7BMYHhVEK0
	 G75e30ITiFXFCywNHsPdnxLGCNhwu5xaRiJEXKcx71BYD1jJv1JW5H2J3xh7fWknfh
	 lHakWO7eINYzsExKAlqzapgnbxz+rciTQwD8Dzg+7C0Vhus8mY4FXy1xSxYTkhjvdM
	 3B6JZZcgS93ow==
Date: Mon, 30 Mar 2026 17:55:57 +0100
From: Mark Brown <broonie@kernel.org>
To: aravindanilraj0702@gmail.com
Cc: linux-sound@vger.kernel.org, cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] ASoC: Intel: bytcr_rt5651: Fix MCLK leak on
 platform_clock_control error
Message-ID: <438706f6-dab6-4f3f-8a7a-2797c7cc683f@sirena.org.uk>
References: <20260328052556.434191-1-aravindanilraj0702@gmail.com>
 <20260328052556.434191-3-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LbPFjCP1SgAfU+El"
Content-Disposition: inline
In-Reply-To: <20260328052556.434191-3-aravindanilraj0702@gmail.com>
X-Cookie: HUGH BEAUMONT died in 1982!!


--LbPFjCP1SgAfU+El
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 28, 2026 at 01:25:53AM -0400, aravindanilraj0702@gmail.com wrote:

> If byt_rt5651_prepare_and_enable_pll1() fails, the function returns
> without calling clk_disable_unprepare() on priv->mclk, which was
> already enabled earlier in the same code path. Add the missing
> clk_disable_unprepare() call before returning the error.

>  	if (SND_SOC_DAPM_EVENT_ON(event)) {
>  		ret = clk_prepare_enable(priv->mclk);
>  		if (ret < 0) {
> -			dev_err(card->dev, "could not configure MCLK state");
> +			dev_err(card->dev, "could not configure MCLK state\n");
>  			return ret;
>  		}
>  		ret = byt_rt5651_prepare_and_enable_pll1(codec_dai, 48000, 50);

As I said on prior versions this has an unrelated change in this print.

Please don't ignore review comments, people are generally making them
for a reason and are likely to have the same concerns if issues remain
unaddressed.  Having to repeat the same comments can get repetitive and
make people question the value of time spent reviewing.  If you disagree
with the review comments that's fine but you need to reply and discuss
your concerns so that the reviewer can understand your decisions.

--LbPFjCP1SgAfU+El
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKqx0ACgkQJNaLcl1U
h9AqiAf9EF5dlEZJwLJdQWHgNIRKpmpwxAS6fhkutP7BuD4peF3Jah3xcFlbh7Sb
E3gt3NeyB3zv0MIKCYocPmHK2UJR/k4l6vi5rob8O3YKz/Wcm/7Jon91Z3iESDnp
0Fic6R4loM53YphYtMgLa7DUAiwm+7V/nSN+X/4LdzHROgMpHby/tJ8D3ESJbmno
6GpeaKOUNr48dn4njmD+grZMQQHNmnMocyDVEnScdE0ZVga+Lj9pxAWKLCvlR/fk
YD5ilqOXlDiqINCWtLnKEg/0mMWrlxs7rkfmLE78oi5965XV/BFC3cOMY2xJfku2
1t4iYgJ1XgNwZVCbOM7+TKiK9n7g6Q==
=fRTQ
-----END PGP SIGNATURE-----

--LbPFjCP1SgAfU+El--
