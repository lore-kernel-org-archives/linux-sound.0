Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3032EA749
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 20:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765514; cv=none; b=t4qPP6sNEZvn6cvHBYVO7W3HPhjKRCD1ShOjZVYrvXDAJlvV4PDThDb85i7o1qstbE7PnQtwMiaAxn181yg2jl85nI+1yAhl/87YJAF7thCnzPyG3eQMS+EC2J/AX7pQ3/An3NWSFWJ9Mc+EMWCJQ22nCARz1BgJ1UR9xn4w15A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765514; c=relaxed/simple;
	bh=QUy50EuuE8Xv0BtJ8oSK86tqkRqc95LBFYfvhPNIcn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CctcHVDLOEt+IQJc3LmO7qsKrOFTJ8ItFa+C/peMmBhpUvO9c9XP6Gz/2kovBFQWJRYsKYAQptkQsqLgq2JPgg9Wajbf3g0WqYiK0whGCtG9/MZhr/vahXcja63pqYrRzvZk2PMeP8J6++fMqhOjFBJTmur7xuZWG7xinMou1dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/sKtLKx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/sKtLKx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68748C4CEF7;
	Thu,  9 Apr 2026 20:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775765513;
	bh=QUy50EuuE8Xv0BtJ8oSK86tqkRqc95LBFYfvhPNIcn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/sKtLKxh5TYzyUKUOhif2i5hBwV1EikjAlwfwAbpGztrQcxXkzmEZXjA6739mEa+
	 n/mNGfVfWalL6E0yrlrTPgaDHGY0KvKGJgZj5Di8rT0NZ6NuMoqmUkF3+f6qe7xQkX
	 h/k53lLbe4AzPGD1SK4nw2q9U+j/cE5ks+f4shxmfrJ4TWhazayAf6YzLdlAQPaPNI
	 DYtjKnY93Y9MHmY2IVXNTg3/jkjbmt4rzvyJ5W3i/FYuuWqw4noobc94ScyGA2iMqF
	 j8XLdnGM1zQ51AJcrvjeBrw0vVIt4HEPptWdlCOEHqrgKu8EcBAE0XIyMJynU4J6sX
	 qRdvTutzLYwtQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 159281AC58A7; Thu, 09 Apr 2026 21:11:44 +0100 (BST)
Date: Thu, 9 Apr 2026 21:11:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	ckeepax@opensource.cirrus.com
Subject: Re: [PATCH v6 3/5] ASoC: es9356-sdca: Add ES9356 SDCA driver
Message-ID: <adgIAKKsEP6bSTRe@sirena.co.uk>
References: <20260409021255.1006-1-zhangyi@everest-semi.com>
 <20260409021255.1006-4-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CY0knzsKKIBGIOnD"
Content-Disposition: inline
In-Reply-To: <20260409021255.1006-4-zhangyi@everest-semi.com>
X-Cookie: You will be divorced within a year.


--CY0knzsKKIBGIOnD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 09, 2026 at 10:12:53AM +0800, Zhang Yi wrote:
> This is the codec driver for es9356-sdca.

> +static int es9356_sdca_headset_detect(struct es9356_sdw_priv *es9356)
> +{
> +	unsigned int reg;
> +	int ret;
> +
> +	ret = regmap_read(es9356->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_DETECTED_MODE, 0), &reg);
> +
> +	if (ret < 0)
> +		goto io_error;
> +
> +	switch (reg) {

> +	default:
> +		es9356->jack_type = -1;
> +		break;

This is going to wind up as an all bits set, meaning that whenever we
detect a button we'll end up reporting everything possible as detected.
It's probably best to either ensure we can't report anything if there's
no jack detected or figure out what would cause the hardware to produce
a bogus value and report that as a fallback (eg, go with headphone since
we know there's *something* in the jack and it's safer than headset).

> +	if (status->sdca_cascade && !es9356->disable_irq)
> +		mod_delayed_work(system_power_efficient_wq,
> +			&es9356->jack_detect_work, msecs_to_jiffies(280));
> +
> +	mutex_unlock(&es9356->jack_lock);

> +static int es9356_sdca_dev_suspend(struct device *dev)
> +{
> +	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
> +
> +	es9356->disable_irq = true;
> +	cancel_delayed_work_sync(&es9356->jack_detect_work);
> +	cancel_delayed_work_sync(&es9356->button_detect_work);

This doesn't hold jack_lock so we might still race with an interrupt
callback, the above code needs to take the lock to ensure a callback
doesn't reschedule the work after we thought we cancelled it.

--CY0knzsKKIBGIOnD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnYB/8ACgkQJNaLcl1U
h9DIWwf/QMKGJ9oozKTX5m98SLOgxrE0TgO80MtNeJXa4j7zLFiAWUYGOlHpdDEP
V0HcMELxQ07/J6hfaZ2IXn3/8NkD+jbh8H6d2g9bCdGamH/TwdBg9bSdyRmIEox8
vZux8MkzfzRkGdIGWttR9xg0dGO9iAT0NsSEBFeBfqCjzQjL5frBvlvWNTQmtjV/
5552x9ZigYaHNgFq+q4X4V43OuQ4t39I+WWL5DDRMiWc8hmo8g7aqddbyNG8fMGZ
WjKkXS56JvoemLoOY9M9QxqII57Hyg4Fm6LK6Dqzeu7eV0A2Oexwj2mjAYGmUCD3
D9IfK1opZcWpMJMvLekTtAs4RSW7iQ==
=xZ8m
-----END PGP SIGNATURE-----

--CY0knzsKKIBGIOnD--
