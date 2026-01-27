Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A83301474;
	Tue, 27 Jan 2026 15:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528786; cv=none; b=N/eqkRFwPRfXOZzo1lfP0atcoM8EEY9goAoGlV9a/+8cJBv7ILYcXU/hvQJkjAGFBSQPWmwH/NB8T8EApmVBMgFRGoUamdYsaRoLSntP4KjG7HjbS6ffaPcwUwzNwOg28IhL89zlYmcTb8ORZSOMKZbzxnq76xQiCIOwBhbyatE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528786; c=relaxed/simple;
	bh=xnYN9Q0IFOodzxUZqshzGzPwYS+J6zEaW1r71nfonvs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dW2JdIzBoqYb1wR5EEUd7Xar4QC0M62ff+8T4GTgHZ7Yyza1L+mC/eeVQutgkLF45PH041deA2Rl8rNTuSxAazazViUciCUOmZzoMhIaiyTlK3UHU/nr3aREimO3hTB/i/1jUUPmagEzfDREh2rv0Tg1lzjw4kj+CyusuSybUgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpSEjwuO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpSEjwuO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0710BC116C6;
	Tue, 27 Jan 2026 15:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769528786;
	bh=xnYN9Q0IFOodzxUZqshzGzPwYS+J6zEaW1r71nfonvs=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=KpSEjwuO2DLPWdws9KNxncFhQBmeJyWjiaRU57U9ZiSk/aOLAR3D5L6/VVjAWpdg9
	 SE0fR7mAwkFJK904YIMPBlQlMg5LkyelxCvqdOqcNpv8/qr/GEVEH2jIrU1X2yb45Y
	 kTJxY7mXgvrsTKEiRrJR9K1PQ+Fhf6ynU6oDfX7iFq9Rh8Y9zPTHQc64fnHB2oILta
	 ytkoWgrKHN7mOSfIIswb/OGOd53nQP/O7EYfu3Hj0/yM7Ajfo1FvQe4H7rqeRm38km
	 5vjGyDXOlswDn/FMxfFCbKvkAwzF/xHYYbr+m9y5rNn2oN7/hpccqbI+ngxUrxyP05
	 b3dRFXnXNOM1A==
Date: Tue, 27 Jan 2026 15:46:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC codec
 driver
Message-ID: <82d338be-7522-4098-b58f-7759ac4a6897@sirena.org.uk>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
 <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>
 <aXjRx12yPA7QflaF@anton.local>
 <153acfd6-cb4f-48ee-82e0-0a18a4a1e9c7@sirena.org.uk>
 <aXjZoFi_fq3tzJFY@anton.local>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="251LqXcFPudUkTrO"
Content-Disposition: inline
In-Reply-To: <aXjZoFi_fq3tzJFY@anton.local>
X-Cookie: I brake for chezlogs!


--251LqXcFPudUkTrO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 07:30:27PM +0400, Anton D. Stavinskii wrote:
> On Tue, Jan 27, 2026 at 03:13:59PM +0400, Mark Brown wrote:

> > It's probably fine to leave the functional code as is but you should add
> > some comments to the mute function explaining waht's going on here.

> Sounds good. Will add comments and prepare v5.=20

Like I said in reply to the cover letter please send an incremental
change.

--251LqXcFPudUkTrO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml43csACgkQJNaLcl1U
h9A7+gf/aT6Tpy/f6zJBaTvksbxv5zRaptPM00kWLv33/krBq7KdJJ7dXCFCSABN
ygRt6v2QDSFwt9p5GfBTFzVDk+NqfbSy8SoCq8uvLN8bMHegR2//u8oY26kaJLan
kH35bpSDk/yPQJ2dq7d9uA4EuWHaj6QO8p8Mo8cBkz2L0gcaM94Qwr4tX8GEDbvL
JUf5G0ChfgHocxo7SE9mN1G2bKXw9CrHGr4mcpa0oUeXI3BvVLtm/74puZKbULE9
3aGOdaHMaPHtz//Di0ak9sF+g86EDESCOqgS5GeFurvySBUDjIPHrsiC38VBSU2O
FFcwKD1BZ/5pP0DNnqqVGE1UXefUwg==
=9wVx
-----END PGP SIGNATURE-----

--251LqXcFPudUkTrO--
