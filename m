Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B343D525F;
	Tue, 28 Apr 2026 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365467; cv=none; b=MpWNzasOzzw+FqMRcEshhXVPezmQAGNMYZxRAEUFFOMZTrUUrwomL8lyCrJijkY7cXCmH+AGqt7FjHIs75p7Mo2+Egzc18riJBAmUryGzmypK5fS1oUt9QQukGBIw2W+lF18/e8RTrkIA2KmOBMfRL05B7tkfnZei92C5FqOx/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365467; c=relaxed/simple;
	bh=aI754bXHi5SKpWR+v8iAmHt3R7vg4RUb/zMGt64yNYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fc229sN7P8A/QgiQhomg7Y3IxZHBF8kHlCSiQsOZGPcG/K29kB99Hnng+JvJP2Ism2p2ldShwyyrn8G0L5uyRT0GGM+VRpGZ91AFTfsev1mmE+lGYWXaNTqmrhBnv8KikxHXn1Ef+AJmNZ6Zu7pwnSmF1illm2WkboxS+MxTnQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nV4GysZK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nV4GysZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D388C2BCB8;
	Tue, 28 Apr 2026 08:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777365467;
	bh=aI754bXHi5SKpWR+v8iAmHt3R7vg4RUb/zMGt64yNYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nV4GysZKAMRflxvjWeRnsAoudbTK4Y//tq8gKSjCbZo0BTZS5N2783M4N41crBG3K
	 S8zYEhB3CJIKVWVpd7MS301v+oHGIlrySGyBsDsk0VB5sS/Tmq+o8HjTWRQRrg8NsU
	 I98Ceaz8cMzz5Uqx7/2oMJX4CGw7aC3ndaNOOtY09jK+ZZ193aX+SlY4R6j7zpcDH5
	 fbrB1sCC7+BDwrNlzOWcJFI8+Hac5xSIQyy6jl5WIUjshRbyTjA9+DE8Pt6lIjlyen
	 ZReBpttaNupTGvFBGncYcCouiov/uDdfraR7OU14WjPo4jKjzFFMA/N8uaZLAP5mDM
	 Gg6RXeAgnU6HA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 95D221AC5841; Tue, 28 Apr 2026 09:37:44 +0100 (BST)
Date: Tue, 28 Apr 2026 17:37:44 +0900
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ASoC: Intel: cht_bsw_rt5672: Drop unneeded NULL
 checks
Message-ID: <afBx2D_hwLccJj3v@sirena.co.uk>
References: <20260428074758.3087437-1-andriy.shevchenko@linux.intel.com>
 <afBqy-LWQ6th2S9v@sirena.co.uk>
 <afBs-GWQYIdcv0zM@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sz38Kh0RuckkYUfn"
Content-Disposition: inline
In-Reply-To: <afBs-GWQYIdcv0zM@ashevche-desk.local>
X-Cookie: Victory uber allies!


--Sz38Kh0RuckkYUfn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2026 at 11:16:56AM +0300, Andy Shevchenko wrote:
> On Tue, Apr 28, 2026 at 05:07:39PM +0900, Mark Brown wrote:

> > There's also the fact that as part of support for optional clocks the
> > clock API will quite happily consume NULL clocks.

> This clock is not optional, it's always retrieved with devm_clk_get().
> When the flow runs into these code pieces the mclk != NULL, and always
> valid (excluding some unrelated to this driver strange data corruption cases,
> of course).

> But yes, the CCF APIs are NULL-aware for a long time.

My point is that it makes no difference if the caller does the NULL
check.

--Sz38Kh0RuckkYUfn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnwcdcACgkQJNaLcl1U
h9BfaAf/Q10hZqWV4rhXlVYbhFLZJNbwr13dsGG1KYdzbwzYD0FnJhYx1VpQkOBL
ygDBxce2fi9bZ/9qAUcc+QWXva5E/v7wiWthG5Aug/YbFrNq4Q5boVX0Ddl9fWN8
dwTAcpckUst135Gpa9p4wj/8XJUJhhqYDhTllokPa7q8uuZxX5FB9thbmY/N5lYU
yA/+DilJyUwYjT0pnUNVe651btW62SthvOI/m5ATG52WfiQ6IGazkdcgKHjg/cBo
yCAGMxBeDQkGd7jQPLIf44i+dPRfGCZ45+fj05Gxl6smEkDDacbgdcSUIIZ7Go45
rG99ObP4/tkIo3M1GATkLE0xpvAGwA==
=02rt
-----END PGP SIGNATURE-----

--Sz38Kh0RuckkYUfn--
