Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FB9142E92
	for <linux-sound@vger.kernel.org>; Fri, 16 Aug 2024 22:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723845981; cv=none; b=ZE3NOLr+DQKsI6dlr6QwMiTWGF/NFfHh+0o1RfFLS6sIryWKCLLXsYBvuIutqEqkWmkkiPp+HmP6V+s0XpLOxLrm11JrKBdGproUf/rNtidW0+Phkz2HwWLee02pASoce1k5KLhnwG7uHlH3IpBL0G/ijFwdYypNhvv5VrIgbNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723845981; c=relaxed/simple;
	bh=/EilKSQ0mXGnk5AMMvGjVePctCjusnvFF4kZOpss1L0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPvhTp3IZ5yvhcM6OzNHzSxdxbUCE2p+1yHRGyOkhWr5lxqwMFISNc+RTFEGf5k/kGa+8LaRwDb9VbXmPUj9SYfVh/+nd6B1VH+LiQIAtvLwnas4PtlsjjKkqJwM1q9Zr+wCe3CCLCB2uRq26z8nY3vV0+HCJBMXButYQdIKMT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXlrTNl6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXlrTNl6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3939AC32782;
	Fri, 16 Aug 2024 22:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723845980;
	bh=/EilKSQ0mXGnk5AMMvGjVePctCjusnvFF4kZOpss1L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DXlrTNl623Qf6SG5C8zaxAv4i2cG/G3Grvk4ywWUSJr4Uo57uQw23yGdS4yBS+EPx
	 mntnVdSf0V3WuAXOBbfD2sRF30KwTCOx7a7GpmMHd4+xi/wFw/sNGCiMMueBia6rNO
	 tAlBv8j2wqdGHpBvbbFhTqZ3LC2TDzimmMjVsa+lW57BATFW3MSR2c6/fbWE56BuDh
	 xGHHwEPBJmT/XwNzG3sqyxPrslF/Xhj+ZWo4ZnZl9PZnF9xr4vnAfK7ZH4F7rp1JC1
	 3Qz52bmv3H1QAFoQQWBIP816Jdcxgof3862K0npuWD4kdWV36zbDm+Vrp4D9gaIUzK
	 08M40d+2gusPw==
Date: Fri, 16 Aug 2024 23:06:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	andriy.shevchenko@linux.intel.com, cujomalainey@chromium.org,
	lmajczak@google.com
Subject: Re: [PATCH v2 01/14] ALSA: hda: Move SST device entries to AVS
Message-ID: <ef967f55-fd8e-4491-84f6-76808d839dae@sirena.org.uk>
References: <20240814083929.1217319-1-cezary.rojewski@intel.com>
 <20240814083929.1217319-2-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9dkE5JiScp51KwAN"
Content-Disposition: inline
In-Reply-To: <20240814083929.1217319-2-cezary.rojewski@intel.com>
X-Cookie: Are we running light with overbyte?


--9dkE5JiScp51KwAN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2024 at 10:39:16AM +0200, Cezary Rojewski wrote:
> The avs-driver succeeds the skylake-driver. It suppots all
> configurations of its predecessor and more. Reflect that in the existing
> selection table.

Takashi, are you OK with this?

--9dkE5JiScp51KwAN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma/zVYACgkQJNaLcl1U
h9AlDwf8DQk9L/552nT1Wvxyjqugf0bkMVTlBbquu2pfXp/zMhOiFjZ07Fpq5AEO
FMS50p2TaKC4RS5G/goMEPoCFlkz2lIAvSKbfM/av6XyA2ivbVZPKdF0YApAhJRb
60rKPiBXM2VMNP126PWm0sk4TjF36IAP0Ej0rig9nWHqfm5jKzWmSxqCOq11qWmm
zri2l/9MYgKtLTvOQnF4zzIXo9RO888i7H2pau0kZJwHbQ0v0S7jjtBaki1kbMIg
0mE1VUk/JM+Om7NXg2dyfAHUUHTvPNK7EZomOx3ZcSnLTJurRfTfjm/hAGdzMvAP
8SXysufSJU6464knp2QApK4q0lDzJA==
=H7hQ
-----END PGP SIGNATURE-----

--9dkE5JiScp51KwAN--
