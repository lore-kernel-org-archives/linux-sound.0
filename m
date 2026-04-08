Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20E63612F6;
	Wed,  8 Apr 2026 12:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775649964; cv=none; b=qSzV65Tu3erx4xz98RIxKQYmW0Rk/byzRkGVZ3sJ+ZN0+z9KFZ7HghUHqGd8WltEWTh2QylAWVNuKjiPW3VGaiEEXjvFi+HQi2JhY8IU8iWl2zDwEHvIfm5p1Xpe4mvRoC3k4tNj2XMQBE56L5bvv51cckf9xIN1cwOupgnCjM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775649964; c=relaxed/simple;
	bh=IQwWVrKpdbj9Y/+Sx7lWUdUGL5AO1rNP0oVcvcgxFCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWr33/4T7gZZz6Fi2+Wr2G3OMxPyKOnZJ58Nk+M4OrMBthBIzYEB7iBZGOZVLf2An8GHfh9zECSPMG3Rq6mxub3cT59ruq/Nv53WNTrnNcWurIbpfdqRjBSUlCbkW8cn+gkrjuNdK6GKucM2C9KX7hOqSGrPMou8R0K1WUJw6Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n04k67JY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n04k67JY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDBBC19421;
	Wed,  8 Apr 2026 12:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775649964;
	bh=IQwWVrKpdbj9Y/+Sx7lWUdUGL5AO1rNP0oVcvcgxFCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n04k67JYZUTen2nGTS6Shqp1UM7Q6lDBEyNrUKzyv4WRghiGDCYnAtG6YjatBMKRD
	 UhYPkKKlY7A8Oz1Tosuwy+ggkP7flgANBy2PEzdK8rn9nCcfrsO0OX/sE0LRqCN8FK
	 8bqVhUviz7qKwaX2GYK0JxYhOcXDWbcQX+A/KzvEPUi0NaJ0xwlNFnepW47hMLOQ+z
	 nxGGeaQTT6q/ET29HS0NCrFbVr9hC9rTnsywr8m+6krmjoIxatkFzMcvVHhNiWSZlw
	 RaWvBqhwBYTLT3jfUHCdTAZGR3G4gH2jLkfVqTreF+0pN+qkm+FUTSitb3LTxEYUPV
	 Wzac1TLkUEd7A==
Date: Wed, 8 Apr 2026 13:05:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, stable@vger.kernel.org,
	liam.r.girdwood@intel.com
Subject: Re: [PATCH for 7.0 0/2] ALSA/SOF Intel: Enforce stricter period size
 for NVL
Message-ID: <2d45e521-8ac7-4c4b-929c-f7d941dc3250@sirena.org.uk>
References: <20260408084514.24325-1-peter.ujfalusi@linux.intel.com>
 <87jyuhllwd.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DFeqL2HMWVEUSHTL"
Content-Disposition: inline
In-Reply-To: <87jyuhllwd.wl-tiwai@suse.de>
X-Cookie: Often things ARE as bad as they seem!


--DFeqL2HMWVEUSHTL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 08, 2026 at 01:41:22PM +0200, Takashi Iwai wrote:
> Peter Ujfalusi wrote:

> > NVL and NVL-S (ACE4) needs to use stricter period size constraint to
> > meet the address alignment for each BDLE buffer (start of each period in
> > the continuous ALSA buffer) set in the HDA specification.

> > It would be great if these can be sent for 7.0 as last minute if it is
> > doable, I left out the Fixes tag from the first patch as that is
> > introduced in 7.0.

> Mark, shall I pick up both patches to my tree for the next PR (planned
> for tomorrow or on Friday)?
> Basically both patches are independent, and I can apply the first one
> in anyway.

I've already got the ASoC one in process for a final fixes PR today and
was going to complain at Peter about combining patches for multiple
trees into a single series when there's no dependencies.

--DFeqL2HMWVEUSHTL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWRKcACgkQJNaLcl1U
h9B+lwf/UBOA4Z6fxbzD+Q5MH6+eUksh8C1UBKrSywIyyQiI00L+nkhTNem2p+MS
nln8CcMJgacVT6GSD6VA1zv56qEj0JwQJ10/lS/BRp9eMboXD64MyenvmxOVx6Bw
6TEG8P+7WsL7k169rSC5eyR47lk2Gq6jJq2wpcIT9e5c4IuHpbRDm8GPOPWwPTSs
a3ZjXhkIG9KhZ4PAfOg1KpWfF3gXEAiA2yRos3i6wroWkEgxph1lf0VaJ4HMRUmi
9MWpWjz04wn22VmYVTl/9tZGwRbF3RKmTn58rh+37CzkJ6PruVg9ynbiTVQY++lC
WUMkKHQNK+VvaoVH6kHtNEyZtii4LQ==
=ZYu6
-----END PGP SIGNATURE-----

--DFeqL2HMWVEUSHTL--
