Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E712F1FEC;
	Fri,  3 Jul 2026 17:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098586; cv=none; b=HzhT5x48kW5ZRlm9ghCTwD6+srDVnrTXci8dC6ApanJmIOgk81CPQCEZUJ0WbFqPOyCgbESvgXKTw/+zOEfxbHhZAvyY3gZXSuBDnxwjd5Rt0PxFeytWP8wO9bZa/r5m6iZez/A7NwRaKDeWDlHz93MVDzKOsXfC9Iy3WXp0l2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098586; c=relaxed/simple;
	bh=g4Z9AW55xBLuMsEyuGV+NPzY+gyjS9YnsvIV1ygMJzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2B8sGuCSbirb6fuvwKOeqq9PLLFAMZ/uvKkfgueE/N1ehsod9J2xH+7DLNlkKSrLc/LUKG0HJ3JZaIXCvGnWLU1N/KpGVswhrUku6FQb9LnA8A+IzO6/mZyEu73NPGqB2CVV7mt0R7jB+vBZOUMh5hpQ1OJE2cED6O2DlGNSW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIQnp8GU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIQnp8GU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0624A1F000E9;
	Fri,  3 Jul 2026 17:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783098584;
	bh=DBWihNUWgBjLa2D1ABgjObGnnXBcwoJR2Z7C+FfpPkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UIQnp8GUpIiYzbi7J219Gdr7+5yLHtjEjhRA9fJnSYdGkSs52FKWh2lvQRn7wqXP1
	 6HkykOtaGBBW675NugNHY5LI1jILRM8r/kGlQrN9641TKuyuliw0+4MvzKvQdjuzH4
	 Qf798J55OOHyERK1GeC3/zKWnE1hxo0+zhVq03PS8jXQCatp3CKM4Hqr67oP3iMQnn
	 iNrVwf0JFrvyP467YWE7Ri9GrgbLngXf+r38BhauAVKgJZ76vRXo78Q96dQ2X5WvsM
	 mq41dS5B08iUMd1DUsOqdBbY1EMoFmnRohiaRmVp2lkOgEWRZCX2D8OxGj8lOb85ws
	 yVccAJkSM2opQ==
Date: Fri, 3 Jul 2026 18:09:39 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	perex@perex.cz, tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	mario.limonciello@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 16/16] ASoC: SOF: amd: add system and runtime PM ops for
 ACP7x
Message-ID: <632c9729-3f64-41fd-b85d-18f4437a68df@sirena.org.uk>
References: <20260701095759.1012929-1-Vijendar.Mukunda@amd.com>
 <20260701095759.1012929-17-Vijendar.Mukunda@amd.com>
 <58e4579d-f87c-48db-9682-fec99c4706af@sirena.org.uk>
 <68d6745f-8bfd-4b1e-b4f1-33190038566d@amd.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B9Lvx88CybaklRd/"
Content-Disposition: inline
In-Reply-To: <68d6745f-8bfd-4b1e-b4f1-33190038566d@amd.com>
X-Cookie: Another megabytes the dust.


--B9Lvx88CybaklRd/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2026 at 10:21:25PM +0530, Mukunda,Vijendar wrote:
> On 7/3/26 21:58, Mark Brown wrote:
> > On Wed, Jul 01, 2026 at 03:25:17PM +0530, Vijendar Mukunda wrote:

> > The interrupt is requested with IRQF_SHARED so probably worth double
> > checking if the interrupt handler is safe to run while the suspend and
> > resume callbacks are running, I see we reset the device during suspend
> > so there might be some risk of corrupted register reads?

> There won't be any corrupted register reads when acp reset sequence
> is executed,=A0 all the acp registers are set to default values. i.e Inte=
rrupt
> control registers are disabled. This sequence ensures that till interrupt

Including whatever the threaded handler is doing?  I didn't actually
check properly, just saw the indirection through the SOF I/O functions
and the threaded handler.

> masks are enabled during resume sequence, no interrupt will be asserted
> for ACP IP.

Right, but IRQF_SHARED means it might be an interrupt for something
else.

--B9Lvx88CybaklRd/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpH7NIACgkQJNaLcl1U
h9DpJAf+PRQxFBpzYYnL5SWVj8/kH3j6IPakFuC4uf9GK9QxFvIGxdF80Np5xhve
fyV8KbFiYy3QRlF8ajBJGaZDvZmP0rOSHY5WRTmEK8epIEUcfJqFhuK3w7sonJXe
GzzbFU+Mokq9LsOFgtFZjuheuMOSRJLUtPlRzv+m7tD0HpdBJTuzQGfyV8gy8/oW
hk6mJk/ky4NGLvUPqxiyzt1KUE/yHmaDYcv8TCI49zJXYmgv08p4LEQGQkRpgGf/
tbIr/QLeZ0uKXyuLiJbOnwYwpipKiyjggqcx8gsNcvEeL4vWwti4MeYVeazLdwil
PBUvOeZagcXwcDGZ4YvRf9DivTZmew==
=rtYV
-----END PGP SIGNATURE-----

--B9Lvx88CybaklRd/--
