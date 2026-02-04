Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2988C23A58F
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211039; cv=none; b=VOgwpkBViNaJJyjpjuut/F54HPpY5PTcQ9y2/lJyLfKQffkR9DZPpVQse5hSVmjXZuPCXWz0rEf/rktsUjoyMhEYTFT+VqScoyb9bQ8fkSs25h2IoTsKsDrQRfa+bbSazx7dbaWtgfSqkEbFq9ESnRyOqhcR7n3+pUJRntkq+3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211039; c=relaxed/simple;
	bh=Z586eq4yMlnpha6qDVyGw8m604cVU0MIDApCBKaHy5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qh7+yaq14tldphjv94yimrVlaRbNM+uOol3vJkdbd44fUon6hBx6dREL/geYmCO6FBQrbhqvj5fjh1SvCEwJ/QQgKrWwUP8WeQ20t/YMgSE9D2TDnB1zO7GkiW8/Hfq2qHeL4wdOk81Qz+XqSnd+zXKD26mH0zmLIv+6GWl1XJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o6VAyKn2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6VAyKn2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06D7C16AAE;
	Wed,  4 Feb 2026 13:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770211039;
	bh=Z586eq4yMlnpha6qDVyGw8m604cVU0MIDApCBKaHy5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o6VAyKn2rtnz2iGUJz/qZpi0Aw+qjzrDN8tKG0N28V4z1HC1BzXtr+5XkZpqVdoh0
	 DFz4VoBEEuyjvE6WZwmD/o4OdIGUHxHWXyD5FJAslChfKBAIsJmYEwXxHBycfaNWLi
	 /Ogn18YMqpekDYjsMR0+HQPKUutsIoPCNtkYZstoIQ2fOdLK+nYCfv8jdNyiH47aEl
	 pTYtSFpRfNN5OVPumffzfrFzNjqFDM/NRdy6YrCWMYadwfUoPwY7loGSJ49F4bQAl2
	 +XZlMDnagdkZfYfsF6xHlGDxcSW2LVAFWb7rqDdDjRmMmWBeBW96jUgLcDirDWftUt
	 +h9kYF44Fr66Q==
Date: Wed, 4 Feb 2026 13:17:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, tiwai@suse.com, amade@asmblr.net,
	linux-sound@vger.kernel.org, kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v2] ALSA: control: Verify put() result when in debug mode
Message-ID: <073455bf-2923-428a-bd65-b976cc46819f@sirena.org.uk>
References: <20260204112609.127085-1-cezary.rojewski@intel.com>
 <08cf484e-fc2f-4878-ab18-c80798b844e4@perex.cz>
 <407b1224-be04-4737-a8b9-42f70b8cb635@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iZgPb8N0oh2ungwW"
Content-Disposition: inline
In-Reply-To: <407b1224-be04-4737-a8b9-42f70b8cb635@intel.com>
X-Cookie: Are you having fun yet?


--iZgPb8N0oh2ungwW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 04, 2026 at 01:28:01PM +0100, Cezary Rojewski wrote:
> On 2026-02-04 12:46 PM, Jaroslav Kysela wrote:

> > For volatile controls (SNDRV_CTL_ELEM_ACCESS_VOLATILE), the result may
> > be fine. I would downgrade the level to pr_info for those controls here
> > with another message.

> Does that mean that verification for controls of access VOLATILE may never
> be fully correct? If so, maybe let's leave the developer to make the final
> call, whether it's false-positive or not?

Yes, volatile controls could change at any time so we can never
guarantee that a read will match a write.

--iZgPb8N0oh2ungwW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmDRtoACgkQJNaLcl1U
h9BBNQgAhX7sa5zS915ZUPms67OzcBPQPC6mfHu7gB/tOCeW5KQzavvA1t6n0H1y
iXnzlZWcB6lXj34FhNxTNhtanM3KR/eCIrY1De23XYO87kZFO9D5zuEh+6QjhE8p
gfwQZ1UED/fX2vfADsgb5Up1YtY43axmxRc9gMa4lrI0W+pr6ouB8A76JTJ7JwNM
tp+t1GLQ7jkD9HniWmRI+WVeNgZV2WJIo4v8K72hoUrrpJw+R3iHx9/szN7MWEJ/
rcWpcqt84pvO3HflVwjZY++axY8zvXBl00LCGW+l35IWV4zxRP6tPE/g4UvtkRJq
Ba2YXN7zczY15xkVAcvCZssj8g8NGA==
=WGlB
-----END PGP SIGNATURE-----

--iZgPb8N0oh2ungwW--
