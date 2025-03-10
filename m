Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD3022D7BF
	for <linux-sound@vger.kernel.org>; Mon, 10 Mar 2025 15:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741619871; cv=none; b=pyQTIu84me33/dFHcW8KT7Imz3V7/dihqJoY8QWDzgKTQaSdg4gWLta79dDJ3Xk9Uv7mC/ScKNTDPTJKCnwTn+IYagJpUi0EUTn6UKZtaP/kQL0mDVpnGJKZpN6mqRs6SnISNsidOYPbJiVbir69tPipSuPU+vFT19qVygyqwUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741619871; c=relaxed/simple;
	bh=jtWKSljuJuijGn9DGfG6LXSEu+xSnYR5E/8RKdlnh/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZF031xX0KVGiT1rLaEMmovVKmzbM84B0yviRQP+oq+Zio8zkTQYRPw87IKPMaY9gLgTqTB0gNg3ZtS7+EYxN+GEkfNejvzAvv2bd2F6El5iR9Ux+df3DaMG67+mDo0yiftwzZZ7WIkZyHJpKQE5yPQmxv8nVx1TkHzeWA7s7VNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RnRs3Fc9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RnRs3Fc9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D07C4CEEB;
	Mon, 10 Mar 2025 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741619870;
	bh=jtWKSljuJuijGn9DGfG6LXSEu+xSnYR5E/8RKdlnh/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RnRs3Fc99zrNdPcxUm9QLIPPG62546WoncpNqDiwcmWmyYbnAKY6DFtwn+WB1wRWj
	 pJlM9mDX5rTqXYfdUP2s5t9s+l5gF404ETHnDTWNW8KiEC/RQ2vfhLYeviRulXRtPf
	 oXDPamBkNL5Ashls2dNk9CFnjDNGXwrYXWpB57L9zLNf19qzNsbui6DRl+WejGwFRV
	 e/6jkU1WSYUZqNiRZRMc3AYLSRb490QNZ68IYlAIsUgrV5g1uexLyDSyYr2BEO5bAr
	 zKFi2ayGdho1sB3BkI1PmF3KRuHi0jz8nvztUrVjfgDfaKuoiFLJ5hiKFuEE4MQ1cP
	 RyXJQRuh1DcgQ==
Date: Mon, 10 Mar 2025 15:17:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev, bard.liao@intel.com
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-ptl-match: Add cs42l43
 support
Message-ID: <ae3ee5b8-e461-42f4-8cd3-97247f28f583@sirena.org.uk>
References: <20250310080712.58911-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="To55Jvl1ra4sY+fx"
Content-Disposition: inline
In-Reply-To: <20250310080712.58911-1-yung-chuan.liao@linux.intel.com>
X-Cookie: How do I get HOME?


--To55Jvl1ra4sY+fx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 04:07:12PM +0800, Bard Liao wrote:
> From: Naveen Manohar <naveen.m@intel.com>
>=20
> Patch adds driver data & match table for cs42l43
> multi-function codec on PTL-RVP at sdw link3.

This breaks the build:

build/stage/linux/sound/soc/intel/common/soc-acpi-intel-ptl-match.c:583:18:=
 err
or: =E2=80=98struct snd_soc_acpi_mach=E2=80=99 has no member named =E2=80=
=98get_function_tplg_files=E2=80=99
  583 |                 .get_function_tplg_files =3D sof_sdw_get_tplg_files,
      |                  ^~~~~~~~~~~~~~~~~~~~~~~
/build/stage/linux/sound/soc/intel/common/soc-acpi-intel-ptl-match.c:583:44=
: err
or: =E2=80=98sof_sdw_get_tplg_files=E2=80=99 undeclared here (not in a func=
tion)
  583 |                 .get_function_tplg_files =3D sof_sdw_get_tplg_files,
      |                                            ^~~~~~~~~~~~~~~~~~~~~~

--To55Jvl1ra4sY+fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfPApoACgkQJNaLcl1U
h9DJ6wf/V0l2u1vpgVduZq46MGqIAKuZrY4Pn1j22DSm9SJo6ddpmcW3V3zosHrF
A+0k+oCp5ueUqckb0OWLQI1+PVoPtA+dMDEbpd9/i2gQsVwKTTUwUeN4Zaza7OXM
lDT2WQSgkALsGhX7FlSJyKm8HQsJCFTs3Fy/HMSxHIkZ53TDn2Hfe0vu5OqVkImp
or+p7LewhXCpkiUsBt2uU3zKFCo03QOw2EufQtgbrFQDqkIWc3ekcyNlt82YW612
NVqiVYHCeRJpHRh31+vPGTt3caYE2gmwxcZ0ZXysN8TfLSCRCzI2lE9mAywyiodW
V0f48H6/6syMACIJB0hf+oS4/ZmBHA==
=MS0B
-----END PGP SIGNATURE-----

--To55Jvl1ra4sY+fx--
