Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323048;
	b=zD9yF599tFs4jNIREvqJ3QI/XtVNGZck4hNRXE9VdwNTtvqXT3LeVhrV4JKxcSu+lfcB
	 p1pusxG3IJlOZ7XZFvRi/Li6JzWVxladIabP5cbwKEhQsvDM5JvtMuqg93g1Cn5ftePe7
	 P4R39LtgoHNwkGj+D2HgW0sJyshuh5cz0CyapX1mq2NoKZRb3hU/GZPIcDNUeRxbeqAlm
	 YXYb0B5CcY8on1QQ54L/C1EatmQ72pUryOMZ1Sls8O7zqrnXsnr4fYNT/xkEKt4P8QEMY
	 JQi53knYga92OMoUFb/XNL3WjDNBbV4QwDkoiogvoS3IflarwvOep+nIeXWz88HqX9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323048;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type;
	bh=bJqFkRFVL6M+qMT46xLGOyEZQ2ZPCkdlSYU5aDKbld4=;
	b=plktQYVAYrpWaYCe/04cvvk9bjVyqQwEK6i6wrte26Jq0sMmX3lC7tdWBu5qePgMLiX2
	 FXsxsDfHu7l+wvPi+35cPJBD6eqreIGHq61cFZxXccb71YIKESUgQ++sI3vZG1bR7W31c
	 oMXFIFZAEr1UlY2+0d4Q8Ie8TqOOfHo4DqdSLjGJ2l0Nf/89CrvKsA+EEUtvKRzQ6r1Vj
	 Z7MX4yjq/9uKl/sSc1SaJQxL8/jtAhKsDrhNySxTQCWSl7a+oOkmHuU7yc8XN32+8S7Zl
	 +K6yNAfiGm9Kns5zGAq534Gw/y6vLIOBagusLnBVr6ZEIEyhZkXOCK6Lg9ofw1kYjbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=vNA2MP9m;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A893B606A320
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 15:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A893B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=vNA2MP9m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794323045; x=1794582245;
	bh=bJqFkRFVL6M+qMT46xLGOyEZQ2ZPCkdlSYU5aDKbld4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=vNA2MP9maTe3jxDDkFaXuZ1IUt8C9EWNA7QlLIbGXy9RHj2mdvsfiLRw7hvNn3SgX
	 0AweiAxPQ5vOYXLr6wL76u5o+IVELG4KWG5xiAmNqQlwFDWwWUHyMupFNy5Vd4Hf4o
	 hVQtp8ml7XZmD1UdHKl7NMoRaYBdHhVK4n7CXoMJzd3IPIlbnLLNFoV6zu3dnSGZpa
	 eGYijgqNr4BAL2RXx64esvcGcM1KC173UYj/mOfHAMwu84GvZWZ9F8UzNtJ4iLcNJu
	 MNlwVt5c8YqHP05nsw28V5n6ykqQ100Pqged435si8arUqToDFEbOAf6rI7Q1uRS2h
	 HwahM85rtdb2w==
Date: Tue, 10 Nov 2026 15:04:01 +0000
To: "Stefan Binding \\(Opensource\\)" <sbinding@opensource.cirrus.com>
From: Mads <mhbn@proton.me>
Cc: 'David Rhodes' <david.rhodes@cirrus.com>, 'Richard Fitzgerald' <rf@opensource.cirrus.com>, 'Takashi Iwai' <tiwai@suse.com>, linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: RE: [BUG] ALSA: hda: cs35l41: stale cs_dsp.name after component unbind breaks firmware load
Message-ID: <BE-wuE1JQwSXSjXreJ8tR5MZTMpcEPa5WV3KibxMw10TvbyJyKtI-SeIhAVtpsEPbkKmTX9qQH2CL4MZ7iOmtkM34uF6Beh2G56RsAFd-S4=@proton.me>
In-Reply-To: <009c01dd6892$0bc18a10$23449e30$@opensource.cirrus.com>
References: <dD5GFAprPRxWfPbbbrhD_wor9MMiT3a4ONaybCd3jr7tBR5xKw2oIcpfDhFtSiXUOsmHcUUUH_UNMBMvm57yTY1MMHqjriZRLAP4XvHrdmY=@proton.me> <009c01dd6892$0bc18a10$23449e30$@opensource.cirrus.com>
Feedback-ID: 46771976:user:proton
X-Pm-Message-ID: ea32e71cb49dd26144d4c3d967c1b24dc3f2b8b2
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------50a31fb1c7714e5d1d75686f59635065c7a3f9363415bf7f9500468fa5ed0176"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------50a31fb1c7714e5d1d75686f59635065c7a3f9363415bf7f9500468fa5ed0176
Content-Type: multipart/mixed;boundary=---------------------a6d0cf1c7ff98e827513e9219a491658

-----------------------a6d0cf1c7ff98e827513e9219a491658
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi Stefan,

Thanks for testing. The code involved is unchanged in v7.3: cs35l41_hda_bi=
nd() still calls cs35l41_smart_amp() synchronously, so cs_dsp_create_name(=
)'s devm_kasprintf() lands in the component devres group. cs35l41_hda_unbi=
nd() still leaves halo_initialized set. cs35l41_request_firmware_file() bu=
ilds the filename from cs_dsp.name.

Since this is a use-after-free, whether the firmware load fails depends on=
 whether the freed "DSP1" allocation has been reused by the time of the re=
bind. On an idle system it often still reads "DSP1" and loads fine. On min=
e it had been overwritten; the name was already empty in .1's own unbind m=
essages.

To make it deterministic, could you try booting with init_on_free=3D1 snd_=
hda_scodec_cs35l41.dyndbg=3D+p, then unbinding and rebinding only one amp?=
 I'd expect the other amp to log Failed to request 'cirrus/cs35l41--spk-pr=
ot-...' (the DSP name is empty). KASAN should also flag the read in cs35l4=
1_request_firmware_file().

Thanks,
Mads



Vh / Br
Mads

On Friday, October 30th, 2026 at 18:14, Stefan Binding \(Opensource\) <sbi=
nding@opensource.cirrus.com> wrote:

> Hi,
> =


> I have not been able to reproduce this on mainline kernel v7.3.
> The Omarchy kernel seems to be based on, but not identical to the mainli=
ne kernel.
> Are you able to reproduce this on a mainline kernel?
> =


> Thanks,
> Stefan
> =


> > -----Original Message-----
> > From: Mads <mhbn@proton.me>
> > Sent: Thursday, October 29, 2026 8:46 AM
> > To: David Rhodes <david.rhodes@cirrus.com>; Richard Fitzgerald
> > <rf@opensource.cirrus.com>
> > Cc: Takashi Iwai <tiwai@suse.com>; linux-sound@vger.kernel.org;
> > patches@opensource.cirrus.com
> > Subject: [BUG] ALSA: hda: cs35l41: stale cs_dsp.name after component
> > unbind breaks firmware load
> >
> > Hi,
> >
> > Same machine and kernel as my report "amp dead until reboot after one =
failed
> > system resume (shared reset)": HP Spectre x360 14-eu0xxx, SSID 103C8C1=
5,
> > 2x CS35L41 on I2C, kernel 7.2.5 (Omarchy distro kernel). The code belo=
w is
> > unchanged in mainline as of 75c1cb8178fe.
> >
> > To recover the stuck right amp without a reboot, I unbound and rebound=
 only
> > .1:
> >
> >   echo i2c-CSC3551:00-cs35l41-hda.1 > /sys/bus/i2c/drivers/cs35l41-
> > hda/unbind
> >   echo i2c-CSC3551:00-cs35l41-hda.1 > /sys/bus/i2c/drivers/cs35l41-
> > hda/bind
> >
> > .1 came back fine after a fresh probe. But .0, which was only unbound =
and
> > rebound as a component, could no longer load firmware:
> >
> >   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Falling back to default
> > firmware.
> >   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Unable to find firmware an=
d
> > tuning
> >   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cannot Initialize Firmware=
.
> > Error: -2
> >   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Cannot Run Firmware,
> > reverting to dsp bypass...
> >   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SSID:
> > 103C8C15, BST: 0, VSPK: 0, CH: L, FW EN: 0, SPKID: 0
> >
> > The files exist, and .1 loaded the same .wmfw a moment later. Toggling
> > "L0 DSP1 Firmware Load" off and on gave the same -2. Only a reboot fix=
ed it.
> >
> > >From reading the code, I think it goes like this. With
> > firmware_autostart, the first cs35l41_hda_bind() calls
> > cs35l41_smart_amp() -> cs35l41_init_dsp() -> cs_dsp_halo_init(), and
> > cs_dsp_create_name() allocates dsp->name with devm_kasprintf(dsp->dev,
> > ...). Because that happens inside component_bind(), the allocation lan=
ds in
> > the component's devres group, and component_unbind() releases that gro=
up.
> > cs35l41_hda_unbind() does not reset halo_initialized; only
> > cs35l41_remove_dsp() does, and that runs from remove. So the next bind
> > skips cs_dsp_halo_init() and builds the firmware file names from the f=
reed
> > dsp->name, which is a use-after-free. The freed name also shows in .1'=
s own
> > messages during its unbind ("DSP1:" becomes empty):
> >
> >   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.1: : Failed to read SCRATCH0:=
 -16
> >
> > I have not confirmed this with KASAN. Possible fixes: tear the DSP dow=
n in
> > cs35l41_hda_unbind() (cs35l41_remove_dsp(), or at least clear
> > halo_initialized and dsp->name), or keep the name allocation out of th=
e bind
> > devres group.
> >
> > I'm happy to test patches.
> >
> > Thanks,
> > Mads
> =


> =


-----------------------a6d0cf1c7ff98e827513e9219a491658--

--------50a31fb1c7714e5d1d75686f59635065c7a3f9363415bf7f9500468fa5ed0176
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmrzMlcJEBcwQI9sml54RRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmd/4oatMLXE0XZIGolT3QnqOGNjQlN56evQwMMJ
9DSjJxYhBKrdUMiR2NqyOetv1hcwQI9sml54AACZDQD+IpW4443Kpznry4+T
Bo9lhLcH5tcw6gGNvNz0J37WXn0BALUPQXuu8A8zBu7dzjvzCp0DfyD0DVOm
B3ee3ulz/mID
=7PH/
-----END PGP SIGNATURE-----


--------50a31fb1c7714e5d1d75686f59635065c7a3f9363415bf7f9500468fa5ed0176--

