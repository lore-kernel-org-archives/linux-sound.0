Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155E33D6481;
	Mon,  4 May 2026 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777902778; cv=none; b=SUwSuWzoKy3z+YLeTsF0mW2h4ObFJpXK50wt7AhuAPPFAwTiOuMbK7CTSvC/b0XxrGVICAn5LD9AG/bavEeZvjPzv1xTHoXl5t5zopMcEmlOMx+HxDYJCm1USmiy5f9iqqylN9nQ/2NiKhJ1vNfm8N2/GRkl3FL8UHPZ5MeLvyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777902778; c=relaxed/simple;
	bh=8rh8pD504ewRqsZbNeFp1FjCWMLehdxXgu5NQImGCG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLZ7fefR85mnOiqacxImjfMo1nzu9SLoPw3JOB9k2KtUh4pGv5rFUGrgvl1DPsX1nxuWQeougegUTtHKo8xcQ100vEcqYPCV7Kod8uMJG36wnmSjACfnAZBckMQLNWpuMmEAELip12KJ4B04ev46O8+h74VbXWhYvLrOLfbOZLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPYMwFvd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPYMwFvd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A44C2BCB8;
	Mon,  4 May 2026 13:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777902777;
	bh=8rh8pD504ewRqsZbNeFp1FjCWMLehdxXgu5NQImGCG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QPYMwFvdI7XvG6UczVbIgTkS6TEm4nOV2xK6qlMUmHwqpNjgjx2krfajXJhfAbFoa
	 u2ptPnaypgum5H5x748KiFc+KeldU5GY+8w3Lmu/xASF3jaXtAZwUPVhrt3kiGDLMj
	 zp7RCwXn6cw0HlXu3rjPQeM7wZvqLUzunPOGyxltDj+aKjzhFf+EEI4kp22DoFPY07
	 vW+1n33TDz+yaGVMmJp00XQRHxS6Oy7ipLWLQa2yd2fG7vAQMsXa8Dvu1fvK0DXy59
	 0dvvC2R7WTiiNueF465TqabLRSg+foMb/q1qrXq7xD61H1+b2SxibDO7nR8hIsZ7Y5
	 Iy0HjSS4TS9Fw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 633A01AC586B; Mon, 04 May 2026 14:52:55 +0100 (BST)
Date: Mon, 4 May 2026 22:52:55 +0900
From: Mark Brown <broonie@kernel.org>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev, baojun.xu@ti.com,
	shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v15 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Message-ID: <afikt0VzLDHrTjvM@sirena.co.uk>
References: <20260504125716.2015-1-niranjan.hy@ti.com>
 <20260504125716.2015-3-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8E+klVZ3TSHOp9nl"
Content-Disposition: inline
In-Reply-To: <20260504125716.2015-3-niranjan.hy@ti.com>
X-Cookie: Alex Haley was adopted!


--8E+klVZ3TSHOp9nl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2026 at 06:27:14PM +0530, Niranjan H Y wrote:
> Add codec driver for tac5xx2 family of devices.

> +static s32 tac5xx2_sdca_dev_resume(struct device *dev)
> +{
> +	struct tac5xx2_prv *tac_dev = dev_get_drvdata(dev);
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	unsigned long t;
> +	int ret;

> +
> +	/* Detect and set jack type for UAJ path before playback.
> +	 * This is required as jack detection does not trigger interrupt
> +	 * when device is in runtime_pm suspend with bus in clock stop mode.
> +	 */
> +	if (tac_has_uaj_support(tac_dev))
> +		tac5xx2_sdca_headset_detect(tac_dev);
> +
> +regmap_sync:
> +	regcache_cache_only(tac_dev->regmap, false);
> +	regcache_mark_dirty(tac_dev->regmap);
> +	ret = regcache_sync(tac_dev->regmap);
> +	if (ret < 0)
> +		dev_warn(dev, "Failed to sync regcache: %d\n", ret);

We do the jack detect before we reinitialise the registers, meaning the
device is still in cache only mode and volatile reads will all return
-EBUSY.

--8E+klVZ3TSHOp9nl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn4pLYACgkQJNaLcl1U
h9Bkwwf/TC2t0yJLZpLLC4MpoarVoZXnIPARjX8+gyg1RLHtWgAyXFArmsgZ/Jop
S2pCSdCkAhJp8WDBgbn6RebaUsTJplmRuRCSO6G6f19GIV33Juapi3UjYNbw1wni
pqx77gCTh0QC4Bw1bGi2FRracZyoZlbBn3TYPurtlkHN45CQCtn2KL/JbDoBu0Zz
SHhd8D3BXtuKZbDyuPxjPF+Ug/aRO+TBaB2UFchRb4fPVIBGLmv4MApZYA+n03Rw
h8ka7IGgSJiIBnwzm1I24lC4AUcHJb8kUla4mWMBExZgU5GeGZqvrf+ttZstGNtp
Nq83ytwbopQBziWdKudwOIUYZQqqZA==
=609v
-----END PGP SIGNATURE-----

--8E+klVZ3TSHOp9nl--
