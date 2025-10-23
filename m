Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9195930C610
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 12:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761222759; cv=none; b=S08hK9XUsyQrAqzHUucr80IyBsktw2OVrJzTal1hk1y86HYEfZNmTcDZ8LFAkvqnLI4IyamsC6OOlBnzvrRFZ8HcYXm5IwIW9hdGIHamEeGcqJVDuKN5FitF09XNAk2WzWv6jJMBn7ZbtMdoPTA6LGbiaWH2MyzBsD7O93j6Etc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761222759; c=relaxed/simple;
	bh=ImYeRrFeQNFB7VLJqanuaORolDo+/dMl7766Ze4HmHk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D8vREZ9XuDvB2NgIattDahZMc/H50T2izjoFp0EV+8utkwxG3jdGINU5MceGxoCjTixqRIMx+9xvq1rUlFGyxSj3LOyFOyH4HqFhscAV7D2YexCVzXNbcZh+d//UvFqj/QLESaH9WifPZrPeyU+u2djD625uALJ7GBDI3wmg/1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MomXxH2R; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MomXxH2R"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so4257655e9.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 05:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761222756; x=1761827556; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z7e61v6J4O9ATtCAEUwBdJpaGZuj6WojFVbriu7X/q4=;
        b=MomXxH2RxDrjrn17bc0ZOK9M0ZpITKEBVcVLGleVfEvEHYYTiprHFljzPb4/903MIE
         t9m5pU3m/l8wPvEUFZXsp3fSl4EHveX3R7dhiCpG7LIub/UZla4Eg/ccZRkaE/rJwDcX
         WDPykC5BCMmkNZ9ncsZa+3Vw+DxZnR5TZVhzlM0+Voai6olT8rgsrTIKlDYUMFGnQYCz
         frnY0BcDeYPyqlDUlAYXzi1D6u6OVntdoHQs1itGFaWD05FX8vwrtxIdMKp313Dmj6VG
         HHfb6O7IG0lPEcM98ReRV6Rh3Iqwwojaty2FMzceb04tjRwpFXBEDQW+JHC+uH5PYntC
         yqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761222756; x=1761827556;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7e61v6J4O9ATtCAEUwBdJpaGZuj6WojFVbriu7X/q4=;
        b=NA8VE0LdRxcJuRdMoDEHReKrl+XN1RZ3U+X6sF+tDK1dyBMbUTOxnfC0LZnFrKNK+y
         pTDZAX8JLxltekRBXXNyPhBiLDj2W92eIdRn9ifRGgIKu33b7QKHO7TV8aa4L2ZsnM0g
         CGgVkpVmdjGZltqLxPcYA1W0nl/U6ZBDUpblbpb2Wba7wU2npjGUb0sqfxHHhpywxPZr
         e/YYnEhQCfNgom/bt6zqlvJehaj6au/1GLS/2dNOnUKD3VvGrSwmglBkrMWFm/1WwsE/
         /7AFdaxzddMy86h6KSBeKG73qQb7ZPYMp6ccoGjPLkAlHHQGZ7dtzsO65/zOX90i/W/B
         rVxg==
X-Forwarded-Encrypted: i=1; AJvYcCUhYS6W60R3VRTCEAnk4UDdWwBm0+1KjqJL7pqM+snLPXTu2bU6nrhHnqlVVRxCOTVfaxb/GTQKK35jSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHRAedxFvWxY1yHwZ3iBtRaYfV1Zmml+r+dmqIjP7YD78GNZ0S
	4h+aWbGD8t+Y5bW49CAufwxzti3HlxmXFi3l7PGzopQ5dQ8ugKQq2Mzp
X-Gm-Gg: ASbGnctjORIzxF0uPoxDVExabt/0PraMbF97KxGsRFm/Q875x/yYax2gnFxEeKaQnIh
	xW4S43LsZhymdGlpUaIBufTCo71EcRNy9UvmjtD/iWGPC8HMch7jY4VGCjgeqvpvy4MRApsBGSJ
	XrPtAbFRb8VjFaTuyW0avTQHzylesZchJQi2SSLrmcWYtge7S2Kj0b7T/F7NGlRea8Gu3YmQlos
	p3jEDj5CW8xjpXB51AM/0I/AOFNx0FSLnPTPBB+bezsKi3f9O6Itko7TTpXqGuW78MvEje2R2Q3
	MvcF24lIdO9Eddf5ndCvfq06IwJuQ0e8JmckQGEYt1KLyT4/PrpuxfwLTXdv0z15IIImGTyD5Ot
	1mUAhL6tBbp9pDfbz0kuWXIFesmpHZHfxCt/dA/3fF/lWwQ2DHFxMEEw27RRVcF58MUSoObLbfl
	IjPpAmTKZG8IVAXHgyjwYMNYZc1fx8k04j+zp3eYkRRHrQ5oxFpzt1Z0v5
X-Google-Smtp-Source: AGHT+IGKyCAODeMTUl+gxq2i3XDR/HDdHpNBSXxr2ExR+43T7cM9sPtspUT2+NpeVn8DoO81OMCGtg==
X-Received: by 2002:a05:600c:444d:b0:45b:79fd:cb3d with SMTP id 5b1f17b1804b1-471179202famr171048855e9.36.1761222755361;
        Thu, 23 Oct 2025 05:32:35 -0700 (PDT)
Received: from 0.1.2.1.2.0.a.2.dynamic.cust.swisscom.net ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475cae9f8eesm35387245e9.6.2025.10.23.05.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:32:34 -0700 (PDT)
Message-ID: <b1fbce9d07df3daa8657f56d254d279aa784cffa.camel@gmail.com>
Subject: Re: [PATCH 1/3] ASoC: cs4271: Fix cs4271 I2C and SPI drivers
 automatic module loading
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>, Mark Brown
	 <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Herve Codina
 <herve.codina@bootlin.com>,  David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Liam Girdwood	
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai	
 <tiwai@suse.com>, Nikita Shubin <nikita.shubin@maquefel.me>, Axel Lin	
 <axel.lin@ingics.com>, Brian Austin <brian.austin@cirrus.com>, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Oct 2025 14:32:34 +0200
In-Reply-To: <873479ong5.fsf@ocarina.mail-host-address-is-not-set>
References: <e7873e6ce07cd92f4b5ce8880aa81b12c2a08ed3.camel@gmail.com>
	 <d38779a7-a1af-49e4-b429-5ebd791e2168@sirena.org.uk>
	 <d42ab1a0665f55731aabd1e9fcb31b8401b7913f.camel@gmail.com>
	 <873479ong5.fsf@ocarina.mail-host-address-is-not-set>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Javier, DT guys,

On Thu, 2025-10-23 at 13:40 +0200, Javier Martinez Canillas wrote:
> > On Wed, 2025-10-22 at 15:56 +0100, Mark Brown wrote:
> > > > > I'm very reluctant to touch this stuff for SPI without some very =
careful
> > > > > analysis that it's not going to cause things to explode on people=
, right
> > > > > now things seem to be working well enough so I'm not clear we'd b=
e
> > > > > solving an actual problem.
> > >=20
> > > > The actual problem is that i2c-core is producing "of:" prefixed uev=
ents
> > > > instead of "i2c:" prefixed uevents starting from v4.18.
> > >=20
> > > > Most of the dual-bus ASoC CODECs are affected.
> > >=20
> > > That's a description of what change but not of a concrete problem tha=
t
> > > users are experiencing.
> >=20
> > the concrete problem Herve has experienced is that cs4271-i2c will not =
be
> > loaded automatically starting with Linux v4.18 (commit af503716ac14
> > "i2c: core: report OF style module alias for devices registered via OF"=
).
> >=20
> > > > Now declaring "of:" to be the new I2C bus prefix for uevents starti=
ng from
> > > > Linux v4.18 sounds strange.
> > >=20
>=20
> I don't find that strange at all. My opinion is that is the correct
> thing to do for the following reasons:
>=20
> * The struct of_device_id table (and not the struct i2c_device_id table)
> =C2=A0 is used to match registered devices through DT / OF with I2C drive=
rs.
>=20
> * All other bus types but SPI report an MODALIAS=3Dof: for devices that
> =C2=A0 are registered through OF.
>=20
> * I2C (and even SPI) devices registered by ACPI report a MODALIAS=3Dacpi:
> =C2=A0 and not a MODALIAS=3Di2c: or MODALIAS=3Dspi:.
>=20
> So I would claim that I2C reporting MODALIAS=3Dof: when devices are=20
> registered through OF are consistent with other buses, using the same
> data to both load modules and match drivers and also more consistent
> on how the I2C subsystem handles registration through ACPI, OF and pdata.
>=20
> Unfortunately the DT support in SPI was not complete at the time, and I
> don't think it can't be changed at this time without breaking something
> as Mark correctly said.
>=20
> I fixed a lot of I2C drivers and DTS when doing the I2C converstion and
> even with that some regressions were introduced like the one you report.
>=20
> > > I think a robust solution would involve having the OF aliases namespa=
ced
> > > by bus, or just not using the OF aliases but potentially having
> > > collisions if two vendors pick the same device name.
> >=20
> > But this sounds like the situation before the above mentioned commit
> > af503716ac14, when both i2c and spi were symmetrically namespaced with
> > i2c: and spi: respectively and contained the "compatible" stripped of t=
he
> > vendor prefix.
> >=20
>=20
> Is not the same for the reasons I mentioned above. What Mark suggests is
> to encode the bus type information in the OF compatible string, while sti=
ll
> being consistent about the table used to report modaliases and match devi=
ces.
>=20
> Maybe we could have something like the following (not much tested) patch =
?
>=20
> From b00f5914606fb72a5f7bdb38e63d109264261dee Mon Sep 17 00:00:00 2001
> From: Javier Martinez Canillas <javierm@redhat.com>
> Date: Thu, 23 Oct 2025 13:32:04 +0200
> Subject: [PATCH RFC] of: Report the bus type in module alias type sub-fie=
ld
>=20
> The modaliases for devices registered through Device Trees don't have any
> information about the bus of the device. For example, an I2C device has:
>=20
> $ cat /sys/devices/platform/soc/fe804000.i2c/i2c-1/1-003c/uevent
> DRIVER=3Dssd130x-i2c
> OF_NAME=3Doled
> OF_FULLNAME=3D/soc/i2c at 7e804000/oled at 3c
> OF_COMPATIBLE_0=3Dsolomon,ssd1306fb-i2c
> OF_COMPATIBLE_N=3D1
> MODALIAS=3Dof:NoledT(null)Csolomon,ssd1306fb-i2c
>=20
> $ modinfo ssd130x-i2c | grep alias
> alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of:N*T*Csolo=
mon,ssd1309fb-i2cC*
> alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of:N*T*Csolo=
mon,ssd1309fb-i2c
> alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of:N*T*Csolo=
mon,ssd1307fb-i2cC*
> alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of:N*T*Csolo=
mon,ssd1307fb-i2c
> alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of:N*T*Csolo=
mon,ssd1306fb-i2cC*
> alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of:N*T*Csolo=
mon,ssd1306fb-i2c
> alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of:N*T*Csolo=
mon,ssd1305fb-i2cC*
> alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of:N*T*Csolo=
mon,ssd1305fb-i2c
> alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of:N*T*Csino=
wealth,sh1106-i2cC*
> alias:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of:N*T*Csino=
wealth,sh1106-i2c
>=20
> The module aliases and compatible string have the bus (-i2c) as suffix to
> denote that is a driver for a device that can be accessed through I2C.
>=20
> This is done to prevent disambiguate in the case that the same device can
> be accessed through another bus (i.e: SPI) and have a different driver.
>=20
> To prevent this and allow to use the same compatible string for the same
> device regardless of the bus type used, let's add information about the
> bus type in the devide type module aliases sub-field that are reported to
> user-space. The same device then will report something like following:
>=20
> $ cat /sys/devices/platform/soc/fe804000.i2c/i2c-1/1-003c/uevent
> DRIVER=3Dssd130x-i2c
> OF_NAME=3Doled
> OF_FULLNAME=3D/soc/i2c at 7e804000/oled at 3c
> OF_COMPATIBLE_0=3Dsolomon,ssd1306fb-i2c
> OF_COMPATIBLE_N=3D1
> OF_TYPE=3Di2c
> MODALIAS=3Dof:NoledTi2cCsolomon,ssd1306fb-i2c
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> =C2=A0drivers/of/device.c | 6 ++++--
> =C2=A0drivers/of/module.c | 8 ++++++--
> =C2=A02 files changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index f7e75e527667..4187decc2873 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -225,8 +225,10 @@ void of_device_uevent(const struct device *dev, stru=
ct kobj_uevent_env *env)
> =C2=A0	add_uevent_var(env, "OF_NAME=3D%pOFn", dev->of_node);
> =C2=A0	add_uevent_var(env, "OF_FULLNAME=3D%pOF", dev->of_node);
> =C2=A0	type =3D of_node_get_device_type(dev->of_node);
> -	if (type)
> -		add_uevent_var(env, "OF_TYPE=3D%s", type);
> +	if (!type)
> +		type =3D dev_bus_name(dev);
> +
> +	add_uevent_var(env, "OF_TYPE=3D%s", type);
> =C2=A0
> =C2=A0	/* Since the compatible field can contain pretty much anything
> =C2=A0	 * it's not really legal to split it out with commas. We split it
> diff --git a/drivers/of/module.c b/drivers/of/module.c
> index 1e735fc130ad..f22ddc83ef40 100644
> --- a/drivers/of/module.c
> +++ b/drivers/of/module.c
> @@ -11,6 +11,7 @@
> =C2=A0ssize_t of_modalias(const struct device_node *np, char *str, ssize_=
t len)
> =C2=A0{
> =C2=A0	const char *compat;
> +	const char *type;
> =C2=A0	char *c;
> =C2=A0	struct property *p;
> =C2=A0	ssize_t csize;
> @@ -24,10 +25,13 @@ ssize_t of_modalias(const struct device_node *np, cha=
r *str, ssize_t len)
> =C2=A0	if ((len > 0 && !str) || len < 0)
> =C2=A0		return -EINVAL;
> =C2=A0
> +	type =3D of_node_get_device_type(dev->of_node);
> +	if (!type)
> +		type =3D dev_bus_name(dev);
> +
> =C2=A0	/* Name & Type */
> =C2=A0	/* %p eats all alphanum characters, so %c must be used here */
> -	csize =3D snprintf(str, len, "of:N%pOFn%c%s", np, 'T',
> -			 of_node_get_device_type(np));
> +	csize =3D snprintf(str, len, "of:N%pOFn%c%s", np, 'T', type);
> =C2=A0	tsize =3D csize;
> =C2=A0	if (csize >=3D len)
> =C2=A0		csize =3D len > 0 ? len - 1 : 0;
>=20
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787

to me the patch looks promising, it would both solve the ambiguity with
modules and avoid having several compatible strings per device, with indivi=
dual suffixes
per interface (bus), similar to the above solomon,ssd1306fb-i2c example.

Let's see how DT maintainers react on this, because I have an impression th=
at
everything except "cpu" and "memory" is discouraged in device-type (even th=
ough
these shall never appear in live device trees, but people would probably tr=
y
to copy paste the values from modalias back into dts ;-)

There are 134 counterexamples of device-type =3D "pci" under Documentation/=
devicetree/bindings
in the current kernel though. Which is just another bus, like i2c and spi.

--=20
Alexander Sverdlin.
