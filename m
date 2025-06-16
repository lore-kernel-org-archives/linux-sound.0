Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F232E424C
	for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 12:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075643; cv=none; b=e6OVvCHDxakttuoOMid0FI5c5OI0+Na3fm7XkzAV1tf38LraKsArkj2XbTNXRz0cfKi3i95dQMZf/LpJnv9FjE5rtrqjEudjiMxbLfmENWM2+N4uGYot450koQau9PbAFuOYjyJIfHdG7XyhNQ+dzik3EMbTjbdoc168TTQv/U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075643; c=relaxed/simple;
	bh=Oxj/0P9jxw/FHMCwsdom3l2VwLRUednbzisZw3bbaQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dklSUWE8i5JJn4bzSOiBhYnCIOgace9vjKi6s9yDlZM4Kzgxjs/E85RajW+QT/SQC+iosX3tlceCs+NT3TnJenSIf86P0blgX3muOFBAfKHwIa0Jm0MgEBnjhlClqHBHNAfXA2+ULoSWjbq1p/NNPgrIc0IVMMdp6R/QcpGQOw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffrHDxka; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffrHDxka"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59F1C4CEEA;
	Mon, 16 Jun 2025 12:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750075643;
	bh=Oxj/0P9jxw/FHMCwsdom3l2VwLRUednbzisZw3bbaQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffrHDxkamuTCTIDPSa7OKPnrSidVhp2A4zUZaRirh4lpBroXPqY+puBnVwkrAp3Ge
	 Rh/T/et/Yu5lbuzeQgqXH4C3vlZxWS7qP966rhAzce50LKj2kVGscridea0uR8DMS0
	 SraOqhbiBJds7QXXB7GTMLmSbF1gThakEykVbwz8ISLB/MUqwRNaaL/n1LxSIbf48+
	 b51ZfJcnAREw5+fRbSwsfnGp2pY+Gl2S5y8K/geDWj5Zg3hl9Stj/DKW3WxMIjWbYB
	 Rd+B4EXD+LhkDw/hnIRmRNnzRELQ0iFl2vylXsCbZvW9mgYJxM34Ce5H8NgYvm87lf
	 2KWLP0+OR5+6A==
Date: Mon, 16 Jun 2025 13:07:18 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Cc: lgirdwood@gmail.com, jikos@kernel.org, bentiss@kernel.org,
	linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com,
	oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
	ckeepax@opensource.cirrus.com, bard.liao@intel.com
Subject: Re: [PATCH v2 2/3] HID: core: Add bus define for SoundWire bus
Message-ID: <48b1cade-6ff0-48fd-93c0-04e7a717ffc3@sirena.org.uk>
References: <20250616114907.855452-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cHhv1Vu3AveSwVdY"
Content-Disposition: inline
In-Reply-To: <20250616114907.855452-1-shumingf@realtek.com>
X-Cookie: Keep out of the sunlight.


--cHhv1Vu3AveSwVdY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 07:49:07PM +0800, shumingf@realtek.com wrote:
> From: Charles Keepax <ckeepax@opensource.cirrus.com>
>=20
> SDCA (SoundWire Device Class for Audio) uses HID to convey
> input events from peripheral devices. Add a bus define for the
> SoundWire bus to prepare support for this.

This seems mostly an ASoC series, is it OK to take this via ASoC?

--cHhv1Vu3AveSwVdY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhQCPUACgkQJNaLcl1U
h9BWwQf/Vck1tmma5GrIlTxt55/rvSB5UnmtZume1m+MYWpvRWk0gH05fqLmELir
kqv5ZHZuwLcSwLYpF0ZYVtKP67ZQNWygOekEtOOzORMvpZqsXiGWhrbCrtKO9RfF
od4eEIj59IuiqecXneRCGDFCa+BxJ/nnZSTWikXedIFvyOVpAYgu1I1ynh8hKmFT
hnNT2jpJB0noUPQvhTPaV82KwhxNg+ik35g+MnRWxBdA5Gd6owhafje6YWbtuQeG
2xE0EufAgvPhe052w7TA1vESffky6KaRqkB+i4QRntLWDpJnFMjeTEG4M/PfFavo
BUbMHcSYI7WyyOTEm5BEMXLI2qnuuQ==
=JsNz
-----END PGP SIGNATURE-----

--cHhv1Vu3AveSwVdY--
