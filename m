Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9E71109
	for <linux-sound@vger.kernel.org>; Wed, 14 Aug 2024 13:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723640675; cv=none; b=ElsQITlYlv3oVkuKq3qu99pRcVIsnS/n6g1ZHP2+Fb4ouVP3kGWtY3bxun01+Z+KwQaPjPyUNnMlNa5YFujbKN5VxF2mBnqLYVHvvm4wgXwkdiS2c6aOrrZye3oKybi4cSMru/x4RvSPe5dL5H5TT32X/3wAAtDZOGR5dLdZR2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723640675; c=relaxed/simple;
	bh=/Fnx8Y5nhqPcK9Nfc3bO6zeYZ7dh7PtJbYQ6H77206E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PykpJVjslIL/eVgUCaAJ4X40rQfUExjcAxeFrECjlaXn+bdizU+EPrjNTEr59fBZn23ubPlanM7TH/cMTN0DUvT/p10x0Vem/OcaH6cotgPipqQp03V20Qb150Z4OF2l1/RX7F6VKiecB5eMk1xMnZmoGECg1uXNemYqTe55ad4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ye0Te/Ue; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ye0Te/Ue"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCEADC32786;
	Wed, 14 Aug 2024 13:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723640675;
	bh=/Fnx8Y5nhqPcK9Nfc3bO6zeYZ7dh7PtJbYQ6H77206E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ye0Te/UeybODxpQTaIWo1lpYJy4JnUeOdxTjfQK9Tv1j7aQsDVxj45xWzgUemE/iz
	 3Sz9p4hgU9z+OuwY3rSCQAlXvbdraw2GTHpGgP9aZ+Vo/IsBYrBkrlH1uMQIm32ojw
	 yIYMXFcKlU0x7VFCyKebvdjbjePhqIv5+a+YYxLR0mJdtYq/8iRPMIEPFenR6j+5uu
	 BXrR6UEx6dFHVtxEnya+saegnK6plfHSIa7SS3tCsfwaqGS9MqeRp5yt2Hk2FGYAWf
	 raDsbte2NQMH2W3iNAcyKTzBNtL0OspaQyMKNWtt9p3ydflz8tvD8joxgwlwmy63xJ
	 bGl7Jnf74hxBA==
Date: Wed, 14 Aug 2024 14:04:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Ki-Seok Jo <kiseok.jo@irondevice.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: FW: [PATCH 1/2] ASoC: sma1307: Add driver for Iron Device SMA1307
Message-ID: <33576ed9-abe6-4c6b-a3a3-0ae775601aa2@sirena.org.uk>
References: <20240813052609.56527-1-kiseok.jo@irondevice.com>
 <20240813052609.56527-2-kiseok.jo@irondevice.com>
 <66113ea5-11a7-41a9-8e28-af0394d7ded7@sirena.org.uk>
 <SL2P216MB233758C3649FAF0ACDCCB8898C872@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TTZ7pARm+F/j3sYW"
Content-Disposition: inline
In-Reply-To: <SL2P216MB233758C3649FAF0ACDCCB8898C872@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
X-Cookie: The second best policy is dishonesty.


--TTZ7pARm+F/j3sYW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2024 at 05:54:19AM +0000, Ki-Seok Jo wrote:

> > > +		return false;
> > > +	}
> > > +	sma1307_regmap_update_bits(sma1307, SMA1307_00_SYSTEM_CTRL,
> > > +				   SMA1307_RESET_MASK, SMA1307_RESET_ON);
> > > +	sma1307_reset(component);

> > This is a very unusual thing to support - what's the motivation for it?
> > If we were going to support it then we'd need to handle what happens to
> > the controls, either generating events saying where they've changed or
> > rsyncing existing values.

> The 'sma1307_reset' function is responsible for configuring the amplifier to operate properly.
> Sometimes users may want to reset the mixer control to its initial state after having used it.
> I have added a reset control for this purpose.
> Will it be problematic to initialize the chip values and return it to a usable state?

Yeah, so we don't usually have a control for that - most drivers could
have one after all.  The usual thing with ALSA would be to do this at
the userspace level, saving the configuration on startup and then
rewriting the controls from that saved configuration to reset everything
back to the initial state.  I guess you're partly using this to reload
the configuration from firmware?

> > > +static int sma1307_register_write(struct snd_kcontrol *kcontrol,
> > > +				  struct snd_ctl_elem_value *ucontrol) {

> > Again, this seems better provided by the regmap debugging features.

> Occasionally, regmap writes are restricted in debugfs, so I added it.
> (Reading is still allowed, so a read function shouldn't be necessary.)

Yes, the regmap debugfs interface requires modification of the kernel to
support writes which is generally fine for that application where you're
doing things during development.  Do you have a use case for this in
normal operation?

> > > +	/* HEADER */
> > > +	sma1307->set.header_size = SMA1307_SETTING_HEADER_SIZE;
> > > +	sma1307->set.checksum = data[sma1307->set.header_size - 2];
> > > +	sma1307->set.num_mode = data[sma1307->set.header_size - 1];

> > We didn't verify that the firmware is big enough to contain the header (eg,
> > if there's some filesystem corruption) or any of the other sizes or counts.

> The file format is fixed.
> The size isn't very large, but up to what extent is it acceptable?
> The header size is predefined, and the header contains the file size value.

It's just about making sure that we're not reading beyond the end of the
data we got from request_firmware(), or doing something like
dereferencing a NULL pointer.  The main issue is being robust against
loading a corrupted firmware file, so no real need to enforce specific
limits other than what's needed to make sure that reads are in bounds.
Consider what would happen if there were a 0 byte file instead of an
actual firmware for example.

> > > +	/* Register Initial Value Setting */
> > > +	switch (sma1307->amp_set) {
> > > +	case SMA1307_DEFAULT_SET:
> > > +		sma1307_set_default(component);
> > > +		break;

> > Why aren't we just using the chip defaults here?

> The values input to this function are the default values for the chip to operate.
> The chip won't function with just power applied; it requires specific values to be provided to operate.

Sure, but IIRC some of them looked like things which would normally be
runtime configured through ALSA controls rather than fixed at startup -
for ALSA controls we generally leave them at chip defaults and let each
userspace pick what makes sense for it.  This is just a way of making
sure that we don't have issues with different userspaces wanting
different configurations, the hardware provides a convenient default.

> > > +	case SMA1307_BINARY_FILE_SET:
> > > +		sma1307_setting_loaded(sma1307, setting_file);
> > > +		if (sma1307->set.status) {
> > > +			sma1307_set_binary(component);
> > > +		} else {
> > > +			sma1307->force_mute_status = true;
> > > +			sma1307_set_default(component);
> > > +		}
> > > +		break;

> > What's this for?  Usually any default setup would just be done through the
> > usual control interface.

> Generally, the amplifier operates correctly with default settings.
> Occasionally, when users want different output levels, we provide a binary file to adjust the settings.

> Since the settings may vary depending on the speakers used and other external factors, and because these settings cannot be adjusted by the user, the purpose is to provide a configuration file upon request.

So really this is loading a firmware file with parameters?  That's
probably fine.  It might be better to just try to load the firmware
unconditionally and then fall back to defaults if there's no firmware,
though possibly there's safety issues.

The setting_file should probably be named based on the machine
compatible or something, that way people can ship a single firmware
image with multiple machines supported.  Possibly also with an option
for extra configuration if it's at all plausible that there might be
more than one of these devices in a single system.

--TTZ7pARm+F/j3sYW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma8q14ACgkQJNaLcl1U
h9CSuAf/Vy/pX6hgSnMKf5Z3timCWGt1jEg38/44dfm308zhOtmw5egoPlTN1sIT
iIrOb8A5yfUfNOPt4prihyqmh5GR2jMAKohQXWT1wjsglAWHSPzkD2RQewZgd5w2
waiiVl0CYd88EuYeaWbEC9bM5fAV/rPME97T4WoFlC6hK1kjho3ArDgjo2CviYXe
lg2rPLPyPbVkenFHiokP4PJtaYEPvvSoS+YCj632wjfrKBDCrjNhxq/UnSWVBWdY
a/p/keQx2/Sa7oYwDfsedMkkN9FbhZKJVUz/dZDsRcyOJsK6p37DPRKPjeOVL7w3
CbeTzZRnkurD+lVSGfjmgEEnsDoHWw==
=T5o+
-----END PGP SIGNATURE-----

--TTZ7pARm+F/j3sYW--
