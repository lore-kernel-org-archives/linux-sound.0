Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F9A3BED5A;
	Mon,  9 Mar 2026 15:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068505; cv=none; b=kMo9O3DKCZHdPlq2QqCfLT8AIBhx1KeHeSxIHdlBENitbBWwWGCU+NeMHxOwFlUKnrUpxQxCahTyV0vvk0nbpz7aKHrkWKetY2PdyLj/hjJr/QhnVrQ9t5tCubT0p3AAxQzZx8NIEJRCxDwlFbuzPgvr7yhZInBbRsRZiZpd19s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068505; c=relaxed/simple;
	bh=MzNzeFnlyLbJ4VC7JBUxgFm9F0OG1dip+7AjWCewOIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2ZXbEHmWSrJTh2B+Q7lGx/B9VCitvv+BHUdALTktxSXuGIbi3V06CrFMDx/IkjY2kK1uFEL7CKYzj+BeqUp0xyHSc0RS1jU/Dnm28NTs0Kaxa/O+QZeQ+1IaqN68dYsPCqXCDNZtTOl4W50P+/nnvxnlMUE6sSvRD3phJ79UxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAoxR4WC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAoxR4WC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E54C2BC86;
	Mon,  9 Mar 2026 15:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773068505;
	bh=MzNzeFnlyLbJ4VC7JBUxgFm9F0OG1dip+7AjWCewOIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jAoxR4WCA5ootmgRnV4H+bTuuqsrxzFfqGqHhupX2KkedRbdjZdPQR1wmqOeehhU+
	 sQYcwm3IQ4Qo8sQGCKg+Y+2avGP33KD5mvbn499PM5aSXacq7y9fEW9PhD6hXbK5P0
	 OlpFaZdPQA4GOPz6dG4oq7qUDY3+AKLCCUkmd1+yuQ9n4latd90ZR46eGK+biIPu78
	 IAA/ZKXS4eqHPrrLsucsKLKKSCUoohUg0swSOODUZlRrso9l3baYleICXuCrsU4mL5
	 8BBBF7K0rLb7B8OSzU0xbpavEKs71RB4ae0YeRvm+2xlBc6tYG6ogSRaacipWbuFMF
	 Zf9EIN0UUXlEQ==
Date: Mon, 9 Mar 2026 15:01:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Matteo Cotifava <cotifavamatteo@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org,
	cujomalainey@chromium.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: soc-core: fix use-after-free in
 snd_soc_unbind_card()
Message-ID: <17591222-b9f7-4056-9c13-4a2ccd0788df@sirena.org.uk>
References: <20260308110931.148919-1-cotifavamatteo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zsfbaBBAFlwbGK26"
Content-Disposition: inline
In-Reply-To: <20260308110931.148919-1-cotifavamatteo@gmail.com>
X-Cookie: Do not dry clean.


--zsfbaBBAFlwbGK26
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 08, 2026 at 12:09:31PM +0100, Matteo Cotifava wrote:

> snd_soc_flush_all_delayed_work(), but flush_delayed_work() does not
> execute if the delayed work timer has not fired yet and the work item
> has not been enqueued in the workqueue. Cleanup then frees DAPM

That's exactly what flush_delayed_work() is supposed to do?  Are you
sure whatever you're seeing isn't that something is managing to schedule
new work after the cancellations?

> Replace snd_soc_flush_all_delayed_work() with a new
> snd_soc_cancel_all_delayed_work() in the unbind path to guarantee
> that any pending or running delayed work is cancelled or awaited
> before card resources are released.

> Also fix soc_free_pcm_runtime() to use cancel_delayed_work_sync()
> unconditionally instead of the racy conditional flush. The original
> check of delayed_work_pending() followed by flush_delayed_work() has
> a time window where the work can become pending between the two
> calls.

These are two separate changes which should be in two separate commits.

> -	if (delayed_work_pending(&rtd->delayed_work))
> -		flush_delayed_work(&rtd->delayed_work);
> +	cancel_delayed_work_sync(&rtd->delayed_work);

This now guarantees that we don't execute any queued work, presumably
something was expecting it to do something...  We should probably drop
the check for pending work since flush ought to be safe if nothing was
scheduled, but it's not clear why you're jumping to cancellation.

--zsfbaBBAFlwbGK26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmu4NQACgkQJNaLcl1U
h9BRpAf/aDEbbIApkKtNL1qmOi3VZPvvybhocEbV1Ki2o1KnMLoAuDIvrMy6ctXS
uI7lILcTDDeGOQe4u8Ue8sArx4EC0GkPONOVqTIl2arF65kUeBxSHWa8S/blWygI
j4SwYJ3Pd/Ot4XG34IyU6B5Zr7Rvs4OkoG7auzJCg2hIhX1MNH4ukMwxJ4DvlODM
GNXydRPYpOajf6lT8A9HK/ghnOtyDveAQqQAEvQI9MVsQ/4brDMovz0yfbA+cvmY
4Vcz4BIfboshh5+CaqzM8SfTjdahfNT5jy0mbS/g6F4MKhtplSdN6WcaQ4AwOTh+
x9UpIVks6yYFRZmvNviBqANTDJoLrQ==
=fohs
-----END PGP SIGNATURE-----

--zsfbaBBAFlwbGK26--
