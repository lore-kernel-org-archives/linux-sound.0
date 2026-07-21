Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AEB314D05
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 16:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651693; cv=none; b=jXzpRT3avjwldR/XrKGysTXQ7eyXxkidn7s17btAnxKx38gNwMWjyWUjPOfUce+O4zvg9gnSlqi0y+mm5frXbWQZzlaCoEdLnQFIqNPGrqWrOCS/05IfBS28NX7hLU5nqVwDiOVuvFBSr2xoABKGt8mpcB8hOwjJnI2rn9T/jfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651693; c=relaxed/simple;
	bh=n0bqY0PQZoczVX9Smp3L/8bXGpn6gSe1rg3Fkb23/nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sd99NmXZUxlZNrzwjT8VbmqDHBGVgtoIUtYZfqz2zFu7m+QNgEZKx0mo3CXTluerrr6noTEMoD+sTLG4HUx6Hx5KNjw8LsPNFM2V7QUH5CVb/cDhF5MUhIQOc3T0aaaCKrZyVSEHo9EHNdqFK7MqYwrf3v38H9CTbDk9uz6eFxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCueMc37; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCueMc37"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D211F1F000E9;
	Tue, 21 Jul 2026 16:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784651691;
	bh=n0bqY0PQZoczVX9Smp3L/8bXGpn6gSe1rg3Fkb23/nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TCueMc377Yrrv4oi3KA7/NkFxDtNCCAAAvvryNpKo2d7BFiSDHHdoCgJrToPnARtd
	 ZSPKI5E1UAxmei8tghftSqHZQHuI1ODQco51k4imWSIcifPQSNyaItDF1Q1iUbbHwy
	 /tBbQleZQOyNhXNwv5nkJPPerc+o2WxKoB+g/KHUICPl9wrqGdKoFp0qeRoJMKLvnI
	 W8KRrDhWz0iLxYCWttmAgW6g30G0Wz1soyJZgBJwVHcCMxQlmGM/+iU56sSmr0WEJ9
	 U8pc9nn5JTGFSdmmtHqxomFi8ZnOTfPj5GBBDamypKw3K3s6Rt2a2/s/HyojvU7nUI
	 vV6GLrJy08isw==
Date: Tue, 21 Jul 2026 17:34:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, tiwai@suse.de, 13916275206@139.com,
	perex@perex.cz, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	baojun.xu@ti.com
Subject: Re: [PATCH v2] ASoC: tas2781: Add calibration kcontrols for TAS2573
Message-ID: <0ef9314b-e21b-462e-a42f-4057058d7399@sirena.org.uk>
References: <20260719010409.1555-1-shenghao-ding@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9onVpMAjEdIP4YzU"
Content-Disposition: inline
In-Reply-To: <20260719010409.1555-1-shenghao-ding@ti.com>
X-Cookie: Love America -- or give it back.


--9onVpMAjEdIP4YzU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 19, 2026 at 09:04:09AM +0800, Shenghao Ding wrote:
> Add calibration kcontrols for TAS2573 in TAS2781 driver to support
> device-specific calibration settings.

This doesn't apply against current code, please check and resend.

It looks like this is more than just some controls, it looks like it can
also load the resulting calibration?

--9onVpMAjEdIP4YzU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfn6YACgkQJNaLcl1U
h9DU6Qf/eVhKktaUWOV0txjin4OEqfM1ieeq6bR1hlP2FuM4ONjK2MJ7wBcdHDX1
07ki6CX48dZinmYDpcLb9pckAs2qWYtbhU3GCJgCY7cXA0ybyXGaEfRP7+kikB2X
AMJQR+U1+vO5lFGMVcwh7Yo0/VLP8Oz2Bb4U2WFB7F/2fujP7XQCMV099xbA9n6M
gL4tlFHg8Exe1PfstexCrrsBiXa9bkoGfOFtg6B3K18MSM0PCIAveoCVhlhXLoMz
ocX9q/ISdcZSl1+8ME+8pHZgjPMFyip8c+tZyk9qLMBSDq6tUocRnHsYTx96wmSK
y77dm8dCUd2D1Zi0CpxPDpxFLYHGQA==
=ufsA
-----END PGP SIGNATURE-----

--9onVpMAjEdIP4YzU--
