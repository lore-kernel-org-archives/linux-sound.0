Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C5E24BCF9
	for <linux-sound@vger.kernel.org>; Thu, 20 Feb 2025 18:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740077036; cv=none; b=brThzKYVwYMQ1v2iE3t39lauTiUWtD5ZBIwbklI8XH9A2xtZA4l6wiChvNE2BoZEUq8D16MzW24V+be5ufG20Dnv7sZ1ctuT4iLDzUZn1LhuOX/Q6KczR7KKw4wbRQxuNZpN+pV4jGiuTPZbe+kUI56mtbV1c+DIG0yYvwEe7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740077036; c=relaxed/simple;
	bh=qIc9YOkMIYfzokI3wALzkU2RYPX3z7najzYF5eWq+C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBPHZATTm56gl8xrhJdxbOsg79voDjC3W+51qSK0YsS4vleG4c0anTiJi2HdQFTE/E60NUh0vTJpAlVIABi2Zw4EY1/4xiZvk1uB5dWLv8NraYEG0QZfJHbYZLYRhVRSCbKVuEW5NpnRusxV9QTjWTTyptwrZeS7GBHhOIvEwcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0dIYulN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0dIYulN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD578C4CED1;
	Thu, 20 Feb 2025 18:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740077035;
	bh=qIc9YOkMIYfzokI3wALzkU2RYPX3z7najzYF5eWq+C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0dIYulNblsv3PBKetiJ8z2WnvqfAtYoIqHFHb+GLjzXqVw05mLW2Dxew39k69KW7
	 9ECiprj6PThFbHf7ebNb05l6VMhM6P1J9ubzBuCQf+bR9ZjE9Ya/hLebgAUOCgxPJE
	 73J7mfk1/RbvX1LYvL5/4YmIkL0m29QLYsVJ5fJ8ZckEkZq+KVlcq5xQNhoK7hgO7P
	 BYf5qes9WEi0tmAc35p5M/xwd6VLpToyThdrWcTDuq6BXrEkeMpdX0096/KNhRp2Tq
	 Wm2eAKA8ylspRToMaRZveP2vc5xvYmoB/sRXvfvHudsIt84MpGsWCAzwo6ZWfP7C13
	 zmocWCHH6gb7g==
Date: Thu, 20 Feb 2025 18:43:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
	perex@perex.cz, tiwai@suse.com,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: SOF: amd: Add depends on CPU_SUP_AMD
Message-ID: <Z7d356eKF2gCNjfO@finisterre.sirena.org.uk>
References: <20250220165127.492927-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i1EzNU+Vmy53xsEX"
Content-Disposition: inline
In-Reply-To: <20250220165127.492927-1-superm1@kernel.org>
X-Cookie: Heisenberg may have been here.


--i1EzNU+Vmy53xsEX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 10:51:26AM -0600, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
>=20
> When SMN support was switched to the kernel wide AMD_NODE instead of
> local implementation this broke compilation on the allyesconfig for
> some architectures.  AMD_NODE is only supported on AMD platforms, so
> modify all the AMD drivers that use it to also require CPU_SUP_AMD.
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250220160950.2cd64bdb@canb.a=
uug.org.au/
> Fixes: f120cf33d232 ("ASoC: SOF: amd: Use AMD_NODE")
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--i1EzNU+Vmy53xsEX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme3d+YACgkQJNaLcl1U
h9Dtygf/cIAfl0na3/2g8jguF/D+B2ljZ3XM7UN0leluMcjFCOVxfd8pjD/kt1X7
Dj6vOccY7y0OxLaJL9OYzUrI7WR/iXdD9aYuKQTXB4fP5MU5stcXMcqR43lLYo7I
aVwaIgtrXnBSEdSND/BckRYAs2dcSwiG5EJ/qdm1aa1HsRdqd1DcWhz8uF2N5whY
QxkPAW56Hgn5QrnxWYTHuFj+e48y2VTs29ujU7eSwPMcjcc88B3ThEwpYT/NcNc1
HYXhia+6uOME+MAfWJM6ejL0nBBIonJ1GZDlpJlvC5/LgjcNMyJbrASYc4a45lw8
j13LOAYSkyHF88ue9smrD6QGAtH+4g==
=fUiV
-----END PGP SIGNATURE-----

--i1EzNU+Vmy53xsEX--
