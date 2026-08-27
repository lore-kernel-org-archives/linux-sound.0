Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A2545D188
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 12:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787835530; cv=none; b=dO2//rQ1pyYQmP+RhbsNF6T33dDjGf/MH94zo62HplmCyYiX4uU+2UhTa4IMbEDfbERhXbaKgJuPD/xe67v/Uwi2wt9ivIjdg8W/d3/+5pXSFwYM9hC/k++QBp20jytxDu6zCuJmVEQZ1SvpS33sDTkHu/Vbx94hetpdwMjEVOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787835530; c=relaxed/simple;
	bh=PYYO7N04ztf2iF8EEZITDOJxD9o6BKi/GB8XVS0r8GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7inzT7FBLqfmJTc7nqebRMH24vZV8ZivoLvJyqXW7h+RvtmuQtGeW3PY4k8r+PqK2KG1zV+n1E8CvaRImWYkAOMZ00aY3ygTcnRxnZY3XbkjwjNvQE3iKyKLLaC3CztsfoldF4TqlvtsdvtGxS7+mrdutN3QdPpnufUWVCzel8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBSB3WYd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBSB3WYd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7855D1F00A3D;
	Thu, 27 Aug 2026 12:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787835509;
	bh=PYYO7N04ztf2iF8EEZITDOJxD9o6BKi/GB8XVS0r8GQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jBSB3WYdg3vcjfiJTfQtbS6HcYbrThQEt5l+hmK25lVk+d8aRmoF8yrkyqfElC30+
	 ZGsGq+8+Kd+57qZi9blq/lOuTgU53/n1DeJkVyWdwrC/0iyR9lORvZwlKIjTBw+KDQ
	 guQuDFUw5MOf5IpkUVLcpLHt+Syjx7Pv84ilUNgRR88gMwHK953+ngynh9IgWGMYuW
	 Q9jO+y48DQDXDk8lDMOaaA1vFvJVd7PylzvulsQQk+D/kEC9vOz+ZCBD03hVYGNbUB
	 W2zyX96M4538OA///c/DQMEFJGdN7CAcECeqfzSRGAI9+C+7SGdW4xFafaPyIyX22O
	 RTbcK+3h/ByvQ==
Date: Thu, 27 Aug 2026 13:58:24 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org, lars@metafoo.de,
	flove@realtek.com, oder_chiou@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com
Subject: Re: [PATCH] ASoC: rt766: fix the warnings: unmet direct dependencies
 detected for SND_SOC_SDCA_HID
Message-ID: <3c89cebe-8f87-4c0b-ac9a-2325df84cce4@sirena.org.uk>
References: <20260827074155.3938361-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZwMRSFnp2k0zgUSl"
Content-Disposition: inline
In-Reply-To: <20260827074155.3938361-1-shumingf@realtek.com>
X-Cookie: Alimony is the high cost of leaving.


--ZwMRSFnp2k0zgUSl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 03:41:55PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> This patch fixs the kconfig warnings from the kernel test robot.
>=20
> | Fixes: b50ecf5873df ("ASoC: rt766: add RT766/RT767 SDCA driver")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202608262153.rOQYkmOr-lkp@intel.c=
om/

Those aren't the warnings, that's a link to the warnings (don't worry
about it for now though).

--ZwMRSFnp2k0zgUSl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqQNHAACgkQJNaLcl1U
h9C9dAf/RNosWplaKxkwGTe1Nw5YfY3wa02ZFewkUBN5Xx+fNwZytMEplKno2HKn
Kkm4yiAVd5TDJev5+Uy2ehICzKnoF4OVQHeNCTvW1mJ1XYqfESPHQr5jHjK9tk4Z
tdK6BDNIM56lU5um6vO7OyTo0EguCkD/n9l8eLBgyodtxu/qAAKGoWweO9sJlMdN
v1kZUyUgrU36bFyaM0A6WYISPy2n/T1deWtr1uzUN7cQDM/JTeTPUBz8AwyelE4H
The7SKktzA4xJvm1XZ1n5SIu+T6KgCDqvHw6788D1+vhzzOopgy686xdjyC1OYEN
HWommtt67GuFrkohMdp7LhDxaIHuGQ==
=EF8f
-----END PGP SIGNATURE-----

--ZwMRSFnp2k0zgUSl--
