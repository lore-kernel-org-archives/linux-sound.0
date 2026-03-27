Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737933932DA;
	Fri, 27 Mar 2026 20:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642267; cv=none; b=WTk2ZJp14CYfv5ZgYZqYK9LpEuzsYCqvEv8swwAmDKja98vEIU3lUrm9/Kicv5uPz16GJZmap80Ck2YSbNNjCy2ccjRRtFmoaipNZhBmoSNzzOImMA3Tsa/pgCVNj2ynjDAPraLlEwVYMlLpU09nbQo9Xc2XGRXc74Ob18gpwzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642267; c=relaxed/simple;
	bh=n0fKDl6lHbgMjFJ7sRLin6JGIRs9h4ugIpz160DvGVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnqwwOhR4X7bz8m1lEBH5GBVrK3a9QgD4oYF7y496fOUUqa4Uhk2JN3cQTVBb5oM4qRoYf8DKfhDCL6U4FQHH5/8GfTfDBZA4BENQUL/8rLqPCzBLN6f7fMoICtRs/eaoofWO9/OOW8bHhYvrKRzt2hLunG7DnYoyEJdEvhi/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQu5u7+m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQu5u7+m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF37C2BC86;
	Fri, 27 Mar 2026 20:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774642267;
	bh=n0fKDl6lHbgMjFJ7sRLin6JGIRs9h4ugIpz160DvGVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CQu5u7+mogwhW1e8vjVBQ2rZGuUzZ+pdw9SQB7ZjHxKAL0R7JTZnCROPbWZmYj0Ew
	 9A0MRxqSMR4tMjZe5NGJ4qRmDnCljdSs8ERjco5UuTwnH8w2OFWKveTOIl9CtNlF8q
	 h/+3OwhgLcCdGiT+uc8RovqsbyLuZ6iNJyWtGiaoQz27cxkRstIuhsbzkcXcPOfWTW
	 5dRMZiDvR15Jkkw6SmzIOrPRwlSMG3G75j+XLYQDT6EhfsKL4yZqr0zDEKtGxOV6x/
	 50L3tkCxqI/yBassCFPV3WNfiuao/494wmK6VDNnjxNY9Hd9trpHMAmDYfFhlPhhMa
	 JdgeZZkoSTJqQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BA0111AC5847; Fri, 27 Mar 2026 20:11:04 +0000 (GMT)
Date: Fri, 27 Mar 2026 20:11:04 +0000
From: Mark Brown <broonie@kernel.org>
To: aravindanilraj0702@gmail.com
Cc: linux-sound@vger.kernel.org, cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.dev,
	perex@perex.cz, tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak in
 platform_clock_control
Message-ID: <acbkWDa6Dy2JsfXp@sirena.co.uk>
References: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
 <20260327193002.423897-4-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/p1D9yFNR/kQjTqE"
Content-Disposition: inline
In-Reply-To: <20260327193002.423897-4-aravindanilraj0702@gmail.com>
X-Cookie: Identify your visitor.


--/p1D9yFNR/kQjTqE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 27, 2026 at 03:30:02PM -0400, aravindanilraj0702@gmail.com wrote:

>  			ret = clk_prepare_enable(ctx->mclk);
>  			if (ret < 0) {
>  				dev_err(card->dev,
> -					"could not configure MCLK state");
> +					"could not configure MCLK state\n");
>  				return ret;
>  			}
>  		}

Same thing here.

--/p1D9yFNR/kQjTqE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnG5FcACgkQJNaLcl1U
h9Dt0Qf8D47NLlD3MUxTPRzIy566GiRikzaQ8llNgikQHl4hxnM4m7zcg300J1pX
Shi1k1GPeORjgHDoUM+sMEFaYk0JR1QONN9ZSjp50x13WnqReZaMTZjxGwWAbkTF
hsNq0J71mY/L4YQOapK6EymgCtnAlLDtq3+ilh7rbV6YqOaqbxpg7hz4LllP+VK0
WeZk1iuph728UQifzIoZrceja5AcPuByPxFp0OAyDcIcg7Zrm9rXOa5FH5ONuq2E
YNrF6wBPv0TOYHzRDqSyfsPusxkT3X3TNrjFIFxK9YBiO9yfjmi5uhCVil28sUn6
saumI26zM/Qw6LJS3KunocEQXf0YBg==
=SKgj
-----END PGP SIGNATURE-----

--/p1D9yFNR/kQjTqE--
