Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9120C1DE2DF
	for <linux-sound@vger.kernel.org>; Mon,  6 Jan 2025 12:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736166707; cv=none; b=QVADGfXbVAwsfca2/2h1ORPtUlDyu4AyErytzs75nTKCjnQJVIJUYGyr/m2avVHXI0Zg92MbxxTG1vCCRDTBQPmBzJE2/XxByVK1eEh1zkRZ5h/7i6zHts8sn4BEEz/Udm9XCsU6uMvPsRGE8jnZNTMQMiPP+j72HWyQsMTvCf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736166707; c=relaxed/simple;
	bh=10JzLnyn14+DV8qNLCqcQiQasA4+VON31cZAl5XfOoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jlh1ISiegG3g2J1x+VCwPOjbd/N9T2Mr5h53pKPP1F3Mf2MKlZ5hDSSGuDUDuV3qARmOfp2+hFoL6iXnhWPnOsiYB8mcjwx1uHuD1AmgAEG9LwGqCPa8UcjtmO/GKFMAIJj1wE59fE7z3QcEDaP1Pf1c8SoCKDSpH/lSXRLSefI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrVxFc6p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrVxFc6p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F50C4CEE1;
	Mon,  6 Jan 2025 12:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736166707;
	bh=10JzLnyn14+DV8qNLCqcQiQasA4+VON31cZAl5XfOoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UrVxFc6pU+1aeQ4HGKnu+VnCWncVjkm3+UP+vl5buU+7nGbQpZ0xy7QxmXhqCn/VE
	 cCN9KAZf9KDL5Mf+doTmw41YerdHNtmdP69kr/jnRVBC6YBmPwTtguTGHEJeBnCRGj
	 duNs4LZGMFKUZghml+amTPOIPayS61vKH7JbFgVj3MT+Pbrup2gamIZf/4hdMAUKqY
	 FPLoxOJJT/OjStYAcmhdejjD7tP+O6Zhcvw0tNbWOCbV1D+eWPQPD+iu/cSTn0QzC1
	 Wt8gudi04EkjDBlEuk+AaBWIasN4wIa79ibNMY9gEc3wRxfsPm81mQ2/Fllqhx0edW
	 bJm43LpRMo/yw==
Date: Mon, 6 Jan 2025 12:31:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Louison Fourmoy <louison.fourmoy@orange.fr>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	mario.limonciello@amd.com, venkataprasad.potturu@amd.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] SoC: amd: yc: Add quirk for microphone for Lenovo
 Ideapad 83J3xxxxxx
Message-ID: <7c3e3b2c-54e5-45c5-8e47-fb08acd10af5@sirena.org.uk>
References: <9c4e1156-2768-4b78-b640-2796581a19ec@orange.fr>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NhnCa3ZTjGmZ86aG"
Content-Disposition: inline
In-Reply-To: <9c4e1156-2768-4b78-b640-2796581a19ec@orange.fr>
X-Cookie: Do not pick the flowers.


--NhnCa3ZTjGmZ86aG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2025 at 05:57:08AM +0100, Louison Fourmoy wrote:
> Quirk entry is needed for microphone to work on new Ideapad Slim 5. Full
> model number is 83J3CTO1WW but 83J3 is what's detected in software.
>=20
> Signed-off-by: Louison Fourmoy <louison.fourmoy@orange.fr>
>=20
> --- linux/sound/soc/amd/yc/acp6x-mach.c.orig=A0=A0=A0 2025-01-05
> 23:37:36.927778168 +0100
> +++ linux/sound/soc/amd/yc/acp6x-mach.c=A0=A0=A0 2025-01-05 23:38:28.0664=
18534
> +0100

This patch can't be used, it's been badly mangled by your mail client.
It looks like it's been word wrapped and tabs replaced by spaces.  Try
using b4 or git send-email to send the patch.

--NhnCa3ZTjGmZ86aG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd7zS4ACgkQJNaLcl1U
h9B4bQf/aZpC4Jge2LXg3yklKkGNzCAsTSdoxq9WduiC1zzfsO/8Q9a5y0Y2qbeP
TAJeVRp47V0wHKxOo3y1icR7UoziIaAqsd/Tj4nqHEu9op3iknSnOL65j0ND1qmY
w5tDpHmLCalUw5aqzh/QoYyiaDIYB7vNmuJxCGCszL/uMXx4xGTrjj6hy3G65yW3
DCyxKU/yvDyiFZ+KLDWm24DIQHyxlDORGo+ngSOf067ztgLf6rbRszujw02P0emU
hFN4DltjnER+0s89ADBxjJ2WRLQgF2ysBKhRKxoTMsbdUF9axOYC4sTk8LcMKoUh
6zsYeiub0JnyoH2YSsyAKLSs/0dTiQ==
=YryZ
-----END PGP SIGNATURE-----

--NhnCa3ZTjGmZ86aG--
