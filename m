Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A994372B45;
	Tue, 10 Feb 2026 17:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770743378; cv=none; b=fezamlkzRNm9d2AGydr7vDBjK9MazxCJiw9j4VP9TKCv0MhbsIxQlEOISax3UOPQG0j18UNfUFzgWvJ8V56qfHlF6fEvOb5uyKZkp/DtdoQoSSOpJ9XBRS+PCrqtrDtDat3id3n2ONZO5WO4k5CSU/gnO2tLf5bnigBL6yDq/WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770743378; c=relaxed/simple;
	bh=fuVUhQ8IfDRKa7Kh1nLHN9IQfMj+L7RtNDkNPOo0Nwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlMp79y2HleJ8vlAFHkmxI/8k2u4XtccCVeUeAy9FHrccRB3avm8C7O114QCIM8gn7o7reLZ6Rbffx+Jcibh4YoEEExC/OImhzDwtfpJMYOkGDaLlvyUI22ouUlFt0f8YpU289bJZp7fTlG6DB0vUY9npemG8OgBrzJMtZZdWeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lp9eZGet; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lp9eZGet"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A65D0C116C6;
	Tue, 10 Feb 2026 17:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770743378;
	bh=fuVUhQ8IfDRKa7Kh1nLHN9IQfMj+L7RtNDkNPOo0Nwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lp9eZGetaSpXv6Yb9UtiSGvhJ/vjgH2QNJCh9Pegb45xYTKTlH31Nncg4TZbsafJg
	 jPREYYZO0FclZ2zkVTcHnJYZpdgh2BJdu+WXKIYTtEKL6cRYHjgPxMs+idFmShVVKG
	 wu73BFA33qETSKnN42ns2uM7/cMVxeEmdnpwZ1a/47EF4T0X+eTGRUB833z2qNfBxR
	 9hmUOKKhhE+urVWQVmt/x4UfpOP+Iwm4mzpcVHZLkeWzsKb6rrTw6g/5U8IRwUyEpL
	 EcrwSB3hXyj10RcwMyEmbKQuz5SM9OZXaJ7LaKSg0d1LfW6nbP6srb7Lq0vE53SPCv
	 5kybBV+bRnh3g==
Date: Tue, 10 Feb 2026 17:09:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "ASoC: fsl_xcvr: fix missing lock in
 fsl_xcvr_mode_put()"
Message-ID: <3f9a014e-e668-4d83-a3a4-8cf4583db611@sirena.org.uk>
References: <20260210143809.297565-1-n7l8m4@u.northwestern.edu>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nrIfPBcelc/Oyfjd"
Content-Disposition: inline
In-Reply-To: <20260210143809.297565-1-n7l8m4@u.northwestern.edu>
X-Cookie: Spelling is a lossed art.


--nrIfPBcelc/Oyfjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 02:38:09PM +0000, Ziyi Guo wrote:
> This reverts commit f514248727606b9087bc38a284ff686e0093abf1.
>=20
> The original patch attempted to acquire the card->controls_rwsem lock in
> fsl_xcvr_mode_put(). However, this function is called from the upper ALSA
> core function snd_ctl_elem_write(), which already holds the write lock on
> controls_rwsem for the whole put operation. So there is no need to simply
> hold the lock for fsl_xcvr_activate_ctl() again.

This doesn't apply against v6.19:

Applying: ASoC: fsl_xcvr: ASoC revert missing lock change in fsl_xcvr_mode_=
put()
error: sha1 information is lacking or useless (sound/soc/fsl/fsl_xcvr.c).
error: could not build fake ancestor
Patch failed at 0001 ASoC: fsl_xcvr: ASoC revert missing lock change in fsl=
_xcvr_mode_put()

--nrIfPBcelc/Oyfjd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmLZkwACgkQJNaLcl1U
h9B0bgf/YZp6ijko3GUorgpSQu5p2W7kQA4JXn1TgpfctygpM0Nm5y8o7rxQ/9ux
R2kxzOA9mnZ7r7WKViLsxJZH64WhOXbrlrt3cIgUKjyoGhqGg3iK70qyIIGwgWAW
NUCI0rQLMBYqJaIoBDYFZx+dmhr8uKajrghvqpW/U7NDNyUXMSNFksCyV9ZTrZiY
jNVHAVsj/o8PPswBhLE9HoRNgdYt11qDKiR5b+UydECUO4XBeqFvT2s09+amjPtN
ZOvn0azgyFG+BzXVEwhUbB9ddvpw5TS6nnoC8UdaBwfemveHHF9PtZqTB26IqWZd
BD5TfweNluw7xCteGMGplykjhvMSbQ==
=pywT
-----END PGP SIGNATURE-----

--nrIfPBcelc/Oyfjd--
