Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEDE391844;
	Tue,  2 Jun 2026 18:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780424746; cv=none; b=A4OtYrhFHQ7QTCSrQehluZogQFTWHFbIK+jDeaUXrhhKSNMpFRBXDoNzH0KnY/iLC/lI8LzxsJO49WotDIkH0DBxudPjM1WWYOf8PB2Dn9Fm25cofL4ffu+FHlHvwxOO0OkZETCoyFlUMpFp6amkZTcqrWpOHFFXSqaLqk+B3PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780424746; c=relaxed/simple;
	bh=AV76TpfOpqLoK8WOnjA1Pmw5UUEMrH+IJKYTM5BKWLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AgM7Fm2JzepxSBHzzwk4EIxYYH0l1X+g39UHY/DpkJvpqCXrfFSvrlRHPDEIhrShXQOBxs/D5XOttzoSNokKGw8C6n5SbHYhTSGa5pvcbUJj08KgYi5BDDNz8OE7nUbBkMCaUpPQKhzWkQjpOPMWo1jl8oLnF7Qbt3rijjhaxrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsaeRqfQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsaeRqfQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A491F00893;
	Tue,  2 Jun 2026 18:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780424745;
	bh=MPywl2Tf3bPWevgjpeoBp+UGNpJbeJ89NTxN/Iv10f0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KsaeRqfQwT2ZO7uUhDH52Yel/RVCTRDGBLU08LzLF1F96pniJDE4WSmlq/53pTgpJ
	 yjETQkvS+uJoZBV3PFGVZCDY+ujkDt+pOBImrytVJ4xfsJjNV9ddDi/YKOgbSzbhQU
	 gF3zQ3hBcdvRH41yzQiwEGiTF0rfAQrC2Ko9Xn7bF/d09HI43M+8vrT+kCiJ9QjVUO
	 rrqA+zptVi/nP1DKHOJnrx9JSmZjAOUIFXxaXfZrJwsMHSSaC8wJircli6zjOVaPEO
	 curvbHc/CWHHovXeMoTkR23cA3njz5w69hGlQZNyO8iTcq+g/MHeRa2YtHjuU3P25c
	 tOOAZa+xDA1Tg==
Date: Tue, 2 Jun 2026 19:25:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Juraszewski <bjuraszewski@gmail.com>
Cc: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2783: Update loaded firmware names to
 linux-firmware 20260519
Message-ID: <15efa76a-aab8-4a21-ac91-ed6698cb958a@sirena.org.uk>
References: <20260602175359.22439-1-bjuraszewski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A3LX8sZ8FsULIL3X"
Content-Disposition: inline
In-Reply-To: <20260602175359.22439-1-bjuraszewski@gmail.com>
X-Cookie: The wages of sin are unreported.


--A3LX8sZ8FsULIL3X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2026 at 07:53:59PM +0200, Bartosz Juraszewski wrote:

> This same commit removes all 22 symlinks from WHENCE, that used naming
> without the '0x' prefix to only 6 prevoiusly existing .bin files.

So there will be existing userspace using the old names.

> This patch adds `0x` prefix explicitly to the generated firmware name
> allowing file to successfully load. This results in functioning audio on
> my device - ASUS ProArt PX13 HN7306EAC, which uses 1714-1-0x8.bin and
> 1714-1-0xB.bin firmware files.

>  	for (; dev; dev = dev->parent) {
>  		if (dev->bus == &pci_bus_type) {
>  			pci = to_pci_dev(dev);
> -			scnprintf(name, size, "%04X-%1X-%1X.bin",
> +			scnprintf(name, size, "%04X-%1X-0x%1X.bin",
>  				  pci->subsystem_device, bus->link_id, unique_id);

This will only use the new name, meaning that an existing working
install will be broken when upgrading the kernel unless linux-firmware
is also updated.  We should try both names, assuming the change in name
stays, so that existing installs continue to work.

--A3LX8sZ8FsULIL3X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmofIB4ACgkQJNaLcl1U
h9BYwwf+L53gaq4+7DIzi2jPRKM7saIXE7FlTyp0y56S5Jo5G8FVwSPdkJ4sOWB4
IZIszKWnIWxoU45p6eiu29VWFifzBOYXXOcOdP1Jo0twD7i34KxjlnFpNyAcetvA
3MWXJZ2x6YvCKLsM1ZkaViM93QByT8fkBD4tiAfG/VjT75gS9HKqA9hBVsLeNTqm
PzbPacL0uWipND+PokSTRuZPQWBi6X/txulwGL56ynoy1ugHX+vC/IsLhfHgyMyF
4cMTLfyFxIvm1kDS7s5Zc7c+4DPNe+PtAsnFtJXKcvXIm2ajOTq70IzDH4TfL84p
DuXW5TcpWrX1mlzjZ90UY12nq7pWRA==
=RtMF
-----END PGP SIGNATURE-----

--A3LX8sZ8FsULIL3X--
