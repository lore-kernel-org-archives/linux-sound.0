Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C64239E80;
	Tue, 12 May 2026 00:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778547094; cv=none; b=ULhkDAtRwOu8ey1L6CT3bP8mbLNbh0F7tNYQM5pfI/ox9rlmGi57MLBXZJ8d5UYgCX55DbplAEncgpOT9b8kxzqo3rnfMuoNcOQvbY+zfom7Z4ooBLuVCrhwfQ0aKooi0xOU0lEzJd7iBDiiRV3wMoccFcy7efHayVLaVv14eCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778547094; c=relaxed/simple;
	bh=UV2sS8Vxol5Bb+mptXiKcKzzAvZ375d7kLDC556bi/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agL5a978dENghcbp3tVYaO/DQnfKPsAddv9CjyfDfmf2X4yHirmTOZ3PALaUwvaYoQsvubSkFUyQ6L0Mcr2ljXois8eGnWSSdjnjepC3MAvdF7AgrwfvLBstYarCLLaqtOLhbN7bI5XX5eVzWJVwKAKr41V3VwhRLD+T4bO2g/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nsq11grw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nsq11grw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED4CC2BCF7;
	Tue, 12 May 2026 00:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778547094;
	bh=UV2sS8Vxol5Bb+mptXiKcKzzAvZ375d7kLDC556bi/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nsq11grwKNVWtVpZV28n+dcNo/WqEox8p2Tu7DsATvD/P2o4TbHM8mylWScXhGrlF
	 OxHOqOUJv/sxszfYEKvR2vKhuMR43P5uC5bxYfNKvFTdJrTKWLIEX+JHMBcVMnV20n
	 E3DpkQU2udmV12ETIu0/GX6YA71Tyw7hYzOlckIVWDm8GsGFLPhRf/Civa/DFNAMSe
	 C42i9u+GZ41krZPa5oqQeOSqAIr9qTyg7goryKgMmM0aFD90sLtmdpE2OmOdWoKsPU
	 uFKmf2fxTPcxlasf5eLs7tF+ybetvap7pj01paSvtsE9+oWGyde4D+djHmFnXVTHcW
	 7y7XuCxUp8VpQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 85F541AC58C2; Tue, 12 May 2026 01:51:31 +0100 (BST)
Date: Tue, 12 May 2026 09:51:31 +0900
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: vkoul@kernel.org, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
	oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
	niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
	baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 01/18] soundwire: Add a helper function to wait for
 device initialisation
Message-ID: <agJ5k-Nf1NAr01sN@sirena.co.uk>
References: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
 <20260511141029.851125-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RO7HUYwMX6xptB+u"
Content-Disposition: inline
In-Reply-To: <20260511141029.851125-2-ckeepax@opensource.cirrus.com>
X-Cookie: Truckers welcome.


--RO7HUYwMX6xptB+u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2026 at 03:10:12PM +0100, Charles Keepax wrote:

> +int sdw_slave_wait_for_init(struct sdw_slave *slave, int timeout_us)

> +	time = wait_for_completion_timeout(&slave->initialization_complete,
> +					   msecs_to_jiffies(timeout_us));

The parameter is timeout_us but we use msecs_to_jiffies() here.

--RO7HUYwMX6xptB+u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoCeZIACgkQJNaLcl1U
h9B4zwf9EOsb1p0Un3P56jUFI7XLzKwBmipkqdhuUGNlt2jnxvUzLjTf/SovJeri
qV+vAhn64TGsm0B+5fDPSR+kGds2MVFTZoQ7VA12uj+IziQL6opFGZ/8rVC4vGHe
5MCxoWYIZNngX9m93Om9uRlzdxRi6BYbajkhfvqcIX0JgkQrg0yb1GpAMj8n71Lu
9DEjqZCy9/LXaPP+VBSLqoB1WHBOe94TvqFyBXUiedKhfQ2+JrS/mIuGqL3F+kkM
m9Di+dizRLkRqW4/bobbP9MwDL9zpRog5LTQmm7aTF7COSg/HoHc0/K1fgQ0dqvb
M5y6n3SVC540rw/5vP7qGIERLWgOag==
=OtSh
-----END PGP SIGNATURE-----

--RO7HUYwMX6xptB+u--
