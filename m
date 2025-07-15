Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FF12BE629
	for <linux-sound@vger.kernel.org>; Tue, 15 Jul 2025 18:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604134; cv=none; b=l8kM7M7cRa5oOqe9sFAJEe+JIi0znSGuFOkgaD/ifjr8D45iBM4n8LER2vcw1wcMrDKTsHJxGc98d9fU70jNbxl4Uue33xfY/haf9NVsl/QmzSps3ytg6Qe9n7ceVtdnB5SuA6/of0EBBx5VWid9jhZlRbC/+zmeIsb/LeEfygQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604134; c=relaxed/simple;
	bh=tO1fqgtWScloBLOKm/6iSlTSNcOKeI8l2fWCYbecUzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wcu7XcfNlVf16umyGVanoMOHvXo+JMRcfviL0WpvsiqUAscok4AXfuPNrol1p87j2l3Tf2bQ3sNF+OHGtAF+iokWsUjPc7ADvHubVj8VXhlZ1YML+SpUlXs/uOagcbY0XO4e06LbaWA0ZgR793QG6baFbiMbyEfn/qZ0ikRQ/aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haZ7lgU3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haZ7lgU3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF575C4CEE3;
	Tue, 15 Jul 2025 18:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752604133;
	bh=tO1fqgtWScloBLOKm/6iSlTSNcOKeI8l2fWCYbecUzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=haZ7lgU3g63MyaeiTuk81k8Fo2WUsef4b0ty5QzDiiXQyXYaVYFbO8p5II1sZVeL+
	 R8FCD462V4SYXHwUsGb7q9bS6Hl9FTnL6zAgN8husJP+yWt44pvqXhvSW49QKv7qr/
	 YXrYoqSFZGJe2Z5hYpQ/WFR608z80QzcQwuhGh+8nJ1g+tpQP7S1ZqjDR5HE1UMNvb
	 PKO/rryP1gE5SPXRogbnqrG0PiOE+oKuNAHA44koQRB/oKtlpyhHvIJS5SBnRzJGAM
	 QjgvsHvguyb8/nJChEe+N64cxeThBvbMYbpnSBgIBTxLzuAZn24NImH6Jz0VUZrAZT
	 Behfob6l4fO/Q==
Date: Tue, 15 Jul 2025 19:28:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Lane Odenbach <laodenbach@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	mario.limonciello@amd.com, venkataprasad.potturu@amd.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] Signed-off-by: Lane Odenbach <laodenbach@gmail.com>
Message-ID: <00677352-4f44-41ab-bde7-64b9898cee38@sirena.org.uk>
References: <20250715182038.10048-1-laodenbach@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ef5jRJ/AHx68zTa4"
Content-Disposition: inline
In-Reply-To: <20250715182038.10048-1-laodenbach@gmail.com>
X-Cookie: Your own mileage may vary.


--Ef5jRJ/AHx68zTa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 01:20:38PM -0500, Lane Odenbach wrote:
> ASoC: amd: yc: Add DMI quirk for HP Laptop 17 cp-2033dx
>=20
> This fixes the internal microphone in the stated device
> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++

This is a bit mangled - you've added a signoff as the subject instead of
putting it at the end of the changelog where it'd normally be.

--Ef5jRJ/AHx68zTa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmh2neAACgkQJNaLcl1U
h9BidAf/UFef8fH4gmqU1G2lpld45eNHXhQDZgmRzd3Bupq7qFwAEXI4UDvfPpFd
jcsP64HIbtZXl4tJtCYSnvkxwNhFLtCttciFRU0u845mcE/TbNvSNKwGngovcegR
jPgLV3fDOvWUfY3v+b46dSPnt4HqHrj5zeLia9pNK8oG2m1H70IwyyN5k9skRbot
Re+TMxhbP/a6w0lwQuA70Brk9sNrMPqclLqyXkw1Fun7VrfUvKpZh0YvgG6RWyPh
W89zhiQSAYBrbRc5wB5nz5sy9xZiTKdKClTMWuag3/X4ZHixjg22nPJQrSm+CyjK
6qsurPOdK9CGJMJyYUAt7qA/7VMTCA==
=9jL3
-----END PGP SIGNATURE-----

--Ef5jRJ/AHx68zTa4--
