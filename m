Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7133B35CB60
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 19:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499171; cv=pass; b=q8+2Dwum3Kv4hM/dyMuJk8z/kQduOKUDB3gtYJ338BJ40ksUlRTtpJ2Fr4MKS5/MTmC9Wbtw1vSRP3or4OL/oDRq4k6Nn+3U0rEjPTjqWDCRtmy7PxEW3v69wcA0SiGRVwyxROfvKI1+2Wv7A91sE/oYJAszURBTlcp8IZEZj88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499171; c=relaxed/simple;
	bh=svhgFrtsNwVV75xB9WrI6WBq+Z2RuJypAPDZCj7R7f8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eCXmptr3PuSN2U4evFPJ+kPttPE2KpQicC1y9M0DptTFs8kH875hBU8WrA8OXIX/yl2vDd7rWvxwNwL2GuLyVD+v/OfV9Qy4CYgTstrR8htcC5Ax0RNWk+kN1ouU0YwwHOFWxZaOYRS9nJwutmA2yOoagrpT/pvSixoagOnT/Wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPtMqpXO; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPtMqpXO"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb751so84733a91.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 12:06:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789499169; cv=none;
        d=google.com; s=arc-20260327;
        b=bt81tmQUgaLzI39eBV+Vu/Y1dTm+DQA/T+nafX0xrFbzhGSC6xj4LE2PKcrvxa92rP
         z6mTLgTkix1oc5vn8tlTTwMswHlDTXUoBUeFIY6ARgQ/dDUB1oaA7jT1lN+ABDwipZKk
         CHt00II7onQ0MW3fF0jDzRIy8oyDXPU6oJG07RSMClb3UcVphpCi3Ms7ugo78t2Rk1sW
         1dVkplPVjNiWEM9cI3HZchBr/gi8UyiElYI5wQJrrTizj8iB2PjK0fVuz83ZiFxtobH5
         Oaacy1GlKMPayFurmL2IZVNl5+Ko3u60/069rulXpcmy7QGbaBxUew0Sx4IEemIuxnMh
         iwRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YwKz2S86ErjMP2jCo72byLvy9wdYmn76a9iqJvHvycU=;
        fh=9aPSW5kktpLWYGAnX2dqUbxWiPQSrfaHRBYHwNA7r7k=;
        b=kppEbVu6cj7aqNigf2rxAt0AZSXlgC/DLF2HffSNXS2OUKNQm58uwKpbQvdUvvMiqI
         iPCTQuPzcIWXWlgfAxJFGh5y3SCr1J39/PYV4+B36nlO+Qnhl43/KNS3vqPPbNWahAhv
         zx3ercUN8DGQvgtXdSXz4TSQKz6Jl/XeoxMNedaC/opfM1GgFsjaUXPF77zE0aP/V9fU
         lYSnEjUSCQWdWDsgA0K+tynb+zFTD1fr75o0AeV95CgxcCjN5XDT8ezI9s4tsRPjzxF6
         cRoVIzSpx6BzUTXLbvPpdAjGnXoTUcJp/WPQ5cBI2LoupyVT9Rn13inoaJSGcLXE/0Sh
         ay9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789499169; x=1790103969; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwKz2S86ErjMP2jCo72byLvy9wdYmn76a9iqJvHvycU=;
        b=KPtMqpXO8q5n2/0ud8oFUZ4wiUKNCTRK+YsIqLMBr3VwCrHmgu/thoyJW8sw/EeiHl
         MwPw+d1Kk0JnibOZBUtQsZZ5RCipmdArc4mwV2bq4FkSRXp9/7O1RtMS3OFupp0UqsQj
         JBBTdtVyEQtZaJD9tWtc0wPa82ZXKJGKzOX8idOulekFvPKrJDk8VaMeryBbaajdLvzh
         oIGAEGpXr3XZ/YUM+thow+Npj3pu8x1k4KQTpVvtMufwXYv7PNtt7cgWtB0973luTMIt
         6+ggPtXgfGNQyAJ2RXz+0ebCkWr4gWdTEXOd1oQGPnqymqN8Jm6PgrPkUUjbZxXO4I9q
         wVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499169; x=1790103969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YwKz2S86ErjMP2jCo72byLvy9wdYmn76a9iqJvHvycU=;
        b=y34mA6xiPtj3341Rg8Qudn1TH3D7cHPzsjGwa8a777z+AiyZW1R97nv9hSTnfcBxG1
         PsPbS7WOTuNO9PgDkwsvmWvIWeE/RBmTRcl4x7s2iDnDTOjUgyGoqNFo5HnXO0kKotTA
         bW/8nFvm281EzTef7SEVVobF1s8D2WEcxb+3N+5yYYb6KssuKZR/L4sAdyJJeB9q/AQZ
         lTLLk1NBY1/+kLchEsISA2LwkDK45j3Yix2mT/Xb/mHFC1GAVstu+1trzGmCjJSD3quu
         +jEM3cIycFIAsQnTUGY4F/zkiFHQDwfil/YRsZIhVO3CeAQPsWqULEXjGwrU5P3m4mUZ
         CUxw==
X-Forwarded-Encrypted: i=1; AKwUvBwLd4MIEuFT8QQx0ttNInY92AKsGbI5U8Bc7QDrXVS8nczI2gCm97Q+GJYkGe083K9pqVqmJnIVgg5Yow==@vger.kernel.org
X-Gm-Message-State: AFuF++mm6i7F2mxvocGvLYY0MkNW1TpSi/kFt3uHnwkFnjLz27NDXlfi
	5SQXP4olbFVwWpnRd4rkZI1bbnKC2xj2eaejhv/+ywQzrE2k6GLIs0FjlKFSBAb2E3KPts16MCv
	PSb20lboXTldQu+47PUENJXpUPJUyKyA=
X-Gm-Gg: AYBFou1HEvB+EMmGK0QlVScy+zYYiG+MARpyB7GMUfwvtQizb9eZV9JGgnPMYpZdn6i
	ew3GtKbzLUs7ACooTlXcLXKands8hl9L3a+tvS7km8RFSBsOU1iH07j/WvxnxOTZypGWrMJWqCz
	cxWTpCS3gk85HMmtCatGBuT2XJji8suutMoGyI8jaxwfWOrOugSxqO5rAsyV6Va90DkLpfzIacs
	shRlnluxvJwhg00PqYtlIwVCYsLkAiM0HqtKkhu6942UkOrOIfEV64iqfqP/UPD9WVFqY0V/nYD
	tSf1/mtNK9A4xMU1+NCgDvU4MOFng6MOIG0m88d2JZCGoxoYpwLtgg==
X-Received: by 2002:a17:90b:5887:b0:39e:8d5:fcee with SMTP id
 98e67ed59e1d1-39e08d5fe14mr7669716a91.17.1789499168414; Tue, 15 Sep 2026
 12:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAAbPi4w+YO=W8vFr63wy6++1WQ2mHUDVfUDKyWR8xcTWKXCKw@mail.gmail.com>
 <1fdd17c6-a0ab-42de-8362-8e1374d42fac@amd.com> <bc542e80-e572-452b-81ba-53e57ed3126e@amd.com>
 <30fed968a6f54a6c81eca4ee23ea4166@realtek.com> <CAAAbPi4MekJAyNsCAi2Ww9QHVVrrGkW2cdDTrrpttZYmh7yZHw@mail.gmail.com>
 <3fa3de8f2bf24041ba9c029e0984abfb@realtek.com> <TY4PR01MB144329FF6B2B48FED9486F12E98BD2@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <99e1afd842c4466ea562c83bb736fa74@realtek.com> <TY4PR01MB14432C55B885DB8231CA07C6298BB2@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <aqg5OYBZ5eYqd-QX@sirena.org.uk> <CAAAbPi5fkpV3V1Ju+RYFOHWqNO+KjwoRVXnDgamNL5DVG0rbzA@mail.gmail.com>
 <a61ca5276d914235808711d7935e0f3e@realtek.com>
In-Reply-To: <a61ca5276d914235808711d7935e0f3e@realtek.com>
From: Cristian Timohi <cristiantimohi@gmail.com>
Date: Tue, 15 Sep 2026 22:05:55 +0300
X-Gm-Features: AcwNN1VnNOp_rObYFhz-7Nnqku0Ij6U11ugGHcl26VcZU4eYiuuw-ZPljxKHwMQ
Message-ID: <CAAAbPi40oSScUh_GGdeX8KBSgktJyFq0mJazDigB1DHW+wM4-Q@mail.gmail.com>
Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14 FA401EA speakers
 silent and headphone jack buzzes on playback
To: Jack Yu <jack.yu@realtek.com>
Cc: Mark Brown <broonie@kernel.org>, Shengyu Qu <wiagn233@outlook.com>, 
	Syed Saba Kareem <syed.sabakareem@amd.com>, "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, 
	"Flove(HsinFu)" <flove@realtek.com>, 
	"venkataprasad.potturu@amd.com" <venkataprasad.potturu@amd.com>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, Oder Chiou <oder_chiou@realtek.com>, 
	"vkoul@kernel.org" <vkoul@kernel.org>, 
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>, 
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>, 
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, Fish690103 <fish690103@realtek.com>, 
	=?UTF-8?B?TWlrZSBMaW4gKOael+abieiDvSk=?= <mikelin@realtek.com>
Content-Type: multipart/mixed; boundary="000000000000427947065b8a3e30"

--000000000000427947065b8a3e30
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jack,


I tested the patch you sent on my affected ASUS TUF Gaming A14 FA401EA.
The result is very promising: the patch fixes both the internal
speakers and the internal SoundWire microphones.

Test kernel: 7.3.0-rc2-fa401ea-jack-v1+
with your patch:
ASoC: rt721-sdca: power up the vendor analog gates

Results:

Internal speakers: FIXED
Internal SoundWire microphones: FIXED
Headphone jack detection: still not working
Headphone playback: still not working

I verified the internal microphones in Audacity and they now record normall=
y.

The remaining headphone issue appears to involve more than just
automatic switching.
With headphones physically inserted, wpctl status is identical to the
state with the headphones disconnected.

The ALSA jack controls also remain:
Headphone Jack =3D off
Headset Mic Jack =3D off

I ran: `sudo alsactl monitor`
and inserted/removed the headphone plug multiple times.
No events were generated at all.

I also tried forcing the headphone playback path manually.
The relevant mixer controls initially showed:
Headphone Switch =3D off
Speaker Switch =3D on

I forced:

amixer -c amdsoundwire cset numid=3D9 1
amixer -c amdsoundwire cset numid=3D13 0

which resulted in:

Headphone Switch =3D on
Speaker Switch =3D off

Then I explicitly sent audio to the PipeWire headphone sink:

pw-play --target 58 /usr/share/sounds/alsa/Front_Center.wav

and also tested another WAV file.

There was still no sound from the headphones.

Therefore, on this FA401EA the current patch successfully fixes the
analog power-up needed for the speakers and internal microphones, but
the headphone path still appears to have two remaining problems:

Headphone/headset jack insertion is not detected/reported.
The headphone playback path remains silent even when Headphone Switch
is manually forced on and audio is explicitly routed to the headphone
sink.

I have attached a dmesg log filtered for
RT721/SoundWire/jack/headphone-related messages after booting with
your patch.
The laptop is still running BIOS FA401EA.304, the latest available
firmware for this model.

Please let me know what registers or additional diagnostics you would
like me to capture for the headphone/jack path. I am happy to continue
testing patches or register dumps on this unit.

Thanks,
Cristian

On Tue, Sep 15, 2026 at 6:44=E2=80=AFAM Jack Yu <jack.yu@realtek.com> wrote=
:
>
> Hi Cristian,
>
> Could you check if the attached patch fix the issue?
> Thanks.
>
> Regards,
> Jack
>
> > -----Original Message-----
> > From: Cristian Timohi <cristiantimohi@gmail.com>
> > Sent: Tuesday, September 15, 2026 2:52 AM
> > To: Mark Brown <broonie@kernel.org>
> > Cc: Shengyu Qu <wiagn233@outlook.com>; Jack Yu <jack.yu@realtek.com>;
> > Syed Saba Kareem <syed.sabakareem@amd.com>; Mukunda,Vijendar
> > <vijendar.mukunda@amd.com>; Flove(HsinFu) <flove@realtek.com>;
> > venkataprasad.potturu@amd.com; linux-sound@vger.kernel.org; Oder Chiou
> > <oder_chiou@realtek.com>; vkoul@kernel.org;
> > yung-chuan.liao@linux.intel.com; pierre-louis.bossart@linux.dev;
> > lgirdwood@gmail.com; linux-kernel@vger.kernel.org; Dommati, Sunil-kumar
> > <Sunil-kumar.Dommati@amd.com>; Fish690103 <fish690103@realtek.com>;
> > Mike Lin (=E6=9E=97=E6=9B=89=E8=83=BD) <mikelin@realtek.com>
> > Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14 FA401EA
> > speakers silent and headphone jack buzzes on playback
> >
> >
> > External mail : This email originated from outside the organization. Do=
 not
> > reply, click links, or open attachments unless you recognize the sender=
 and
> > know the content is safe.
> >
> >
> >
> > Hi Mark, Jack, Shengyu, all,
> >
> > I performed the test Jack requested for NID 0x5f / index 0x30 on my aff=
ected
> > ASUS TUF Gaming A14 FA401EA.
> >
> > I am including all details below because there were a few important
> > observations during the test.
> >
> > One note before the technical details: I am not a Linux kernel/audio de=
veloper,
> > and this level of ASoC/SoundWire/RT721 debugging is beyond my normal ar=
ea
> > of expertise. I am working through these tests with ChatGPT helping me
> > understand the driver code, build temporary diagnostic modules, and per=
form
> > the tests carefully.
> >
> > I am trying to keep every experiment minimal, reversible, and verified =
by
> > readback where possible. I hope the results are still useful for debugg=
ing the
> > actual issue.
> >
> > ---
> >
> > ## SYSTEM
> >
> > Laptop:
> > ASUS TUF Gaming A14 FA401EA
> >
> > CPU/platform:
> > Ryzen AI MAX+ 392
> > AMD ACP 7.0
> >
> > Codec:
> > Realtek RT721 SDCA
> >
> > BIOS:
> > FA401EA.304
> >
> > This machine is already running the latest firmware/BIOS currently avai=
lable
> > for the FA401EA. Therefore, at least on this unit, the issue is reprodu=
cible with
> > the latest available ASUS firmware installed.
> >
> > Running kernel:
> > 7.3.0-rc2-fa401ea-rt721+
> >
> > Kernel source tree HEAD:
> > 1a3fdcb408 ASoC: rt721-sdca: Adjust latency control to fix no-sound iss=
ue
> >
> > This includes the a20afec40ea1 fix.
> >
> > The following patch was NOT present during this test:
> >
> > ASoC: rt721-sdca: Update preset for all functions
> >
> > Audio card:
> >
> > amd-soundwire
> > ASUSTeKCOMPUTERINC.-TUFGamingA14FA401EA-1.0-FA401EA
> >
> > SmartMic capture PCM:
> >
> > card: amdsoundwire
> > device 4: SDW1-PIN5-CAPTURE-SmartMic
> > DAI: rt721-sdca-aif3-4
> >
> > ---
> >
> > ## DIAGNOSTIC MODULE
> >
> > I built a temporary out-of-tree snd-soc-rt721-sdca module matching the
> > running kernel.
> >
> > No DKMS installation was performed and no permanent module replacement
> > was made.
> >
> > The temporary module initially only did the following:
> >
> > 1. Added MBQ address 0x5f00030 to the readable and volatile register li=
sts.
> >
> > 2. Added rt_sdca_index_read() calls inside:
> >
> >    rt721_sdca_pde11_event()
> >
> >    to read:
> >
> >    NID:   0x5f
> >    index: 0x30
> >
> >    at three points:
> >
> >    * before requesting mic-path PS0
> >    * after requesting mic-path PS0
> >    * before requesting PS3
> >
> > The existing PDE2A power-state request itself was left unchanged.
> >
> > ---
> >
> > ## BASELINE READ-ONLY TEST
> >
> > Before capture I enabled:
> >
> > rt721 FU1E Capture Switch =3D on,on,on,on
> >
> > Capture command:
> >
> > arecord -D hw:amdsoundwire,4
> > -f S16_LE
> > -r 48000
> > -c 2
> > -d 3
> > /tmp/rt721-mic-test.wav
> >
> > The register values were:
> >
> > RT721TEST mic 5f:30 before PS0: 0xffb7
> > RT721TEST mic 5f:30 after PS0:  0xffb7
> > RT721TEST mic 5f:30 before PS3: 0xffb7
> >
> > Therefore, on my affected FA401EA:
> >
> > 0x5f:0x30 =3D 0xffb7
> >
> > and requesting PDE2A PS0 does NOT change it.
> >
> > I then analyzed the raw PCM samples.
> >
> > Capture:
> >
> > 144000 frames
> > 48000 Hz
> > stereo
> > S16_LE
> > 3 seconds
> >
> > Channel 0:
> >
> > min=3D0
> > max=3D0
> > RMS=3D0.00
> > nonzero samples=3D0/144000
> > nonzero percentage=3D0.00%
> > distinct sample values=3D1
> >
> > Channel 1:
> >
> > min=3D0
> > max=3D0
> > RMS=3D0.00
> > nonzero samples=3D0/144000
> > nonzero percentage=3D0.00%
> > distinct sample values=3D1
> >
> > So the SmartMic capture is exact digital zero on both channels.
> >
> > ---
> >
> > ## 0xFFB7 VS 0xFFF7
> >
> > Jack mentioned that the default value according to the RT721 specificat=
ion for:
> >
> > NID 0x5f
> > index 0x30
> >
> > is:
> >
> > 0xfff7
> >
> > My hardware returns:
> >
> > 0xffb7
> >
> > Difference:
> >
> > 0xfff7
> > 0xffb7
> > ------
> >
> > 0x0040
> >
> > So BIT(6) is the only difference between the value observed on my unit =
and
> > 0xfff7.
> >
> > ---
> >
> > ## FIRST ATTEMPT TO FORCE BIT(6)
> >
> > I then modified the temporary module to set only BIT(6) using:
> >
> > rt_sdca_index_update_bits(..., BIT(6), BIT(6))
> >
> > rather than overwriting the entire register.
> >
> > This should change:
> >
> > 0xffb7 -> 0xfff7
> >
> > In the first attempt I performed this before requesting PS0.
> >
> > That attempt failed safely:
> >
> > RT721TEST mic 5f:30 before PS0: read failed: -16 RT721TEST force BIT6 f=
ailed:
> > -16
> >
> > -16 is EBUSY.
> >
> > Since rt_sdca_index_update_bits() first reads the register and returns
> > immediately if the read fails, no register write occurred during this f=
irst
> > attempt.
> >
> > After PS0 the register became readable and still contained:
> >
> > 0xffb7
> >
> > There was also a runtime PM issue during this attempt:
> >
> > runtime PM trying to activate child device sdw:0:1:025d:0721:01 but par=
ent
> > (sdw-master-0-1) is not active
> >
> > followed by:
> >
> > Failed to resume device: -61
> > Slave 1 alert handling failed: -61
> >
> > Because of this I did not consider the first attempt authoritative.
> >
> > ---
> >
> > ## FINAL CONTROLLED TEST
> >
> > For the second attempt I moved the BIT(6) update until AFTER PDE2A had =
been
> > requested to PS0.
> >
> > I also explicitly kept the complete relevant path runtime-active during=
 the
> > experiment.
> >
> > ACP PCI device:
> >
> > /sys/bus/pci/devices/0000:64:00.5
> >
> > SoundWire manager:
> >
> > /sys/devices/pci0000:00/0000:00:08.1/0000:64:00.5/amd_sdw_manager.1
> >
> > RT721 codec:
> >
> > /sys/bus/soundwire/devices/sdw:0:1:025d:0721:01
> >
> > For all three:
> >
> > power/control =3D on
> > runtime_status =3D active
> >
> > PipeWire, WirePlumber and alsa-state were stopped during the experiment=
 so
> > nothing else held the ALSA devices.
> >
> > RT721 status before capture:
> >
> > Attached
> >
> > The sequence inside rt721_sdca_pde11_event() was:
> >
> > 1. Read 0x5f:0x30
> > 2. Request PDE2A PS0
> > 3. Wait 10-20 ms
> > 4. Read 0x5f:0x30 again
> > 5. Set only BIT(6)
> > 6. Read 0x5f:0x30 again to verify the write 7. Perform SmartMic capture=
 8.
> > Read 0x5f:0x30 before PS3 9. Clear BIT(6) again 10. Read back the regis=
ter to
> > verify restoration 11. Request PS3
> >
> > The resulting kernel log was:
> >
> > RT721_BIT6_V2_BEGIN
> >
> > RT721TEST mic 5f:30 before PS0: 0xffb7
> > RT721TEST mic 5f:30 after PS0: 0xffb7
> > RT721TEST mic 5f:30 after BIT6 set: 0xfff7 RT721TEST mic 5f:30 before P=
S3:
> > 0xfff7 RT721TEST mic 5f:30 after BIT6 restore: 0xffb7
> >
> > RT721_BIT6_V2_END
> >
> > So the requested value was successfully written and verified by hardwar=
e
> > readback.
> >
> > During the entire three-second capture:
> >
> > 0x5f:0x30 =3D 0xfff7
> >
> > After capture, BIT(6) was cleared again and readback confirmed that the
> > original value was restored:
> >
> > 0x5f:0x30 =3D 0xffb7
> >
> > ---
> >
> > ## CAPTURE RESULT WITH 0x5F:0x30 =3D 0xFFF7
> >
> > Capture command:
> >
> > arecord -D hw:amdsoundwire,4
> > -f S16_LE
> > -r 48000
> > -c 2
> > -d 3
> > /tmp/rt721-mic-bit6-v2.wav
> >
> > Capture:
> >
> > 144000 frames
> > 48000 Hz
> > stereo
> > S16_LE
> >
> > Channel 0:
> >
> > min=3D0
> > max=3D0
> > RMS=3D0.00
> > nonzero samples=3D0/144000
> > nonzero percentage=3D0.00%
> > distinct sample values=3D1
> >
> > Channel 1:
> >
> > min=3D0
> > max=3D0
> > RMS=3D0.00
> > nonzero samples=3D0/144000
> > nonzero percentage=3D0.00%
> > distinct sample values=3D1
> >
> > Therefore the microphone capture remained exact digital zero on both
> > channels even while 0x5f:0x30 was verified to be 0xfff7.
> >
> > ---
> >
> > ## SUMMARY
> >
> > Firmware:
> >
> > BIOS FA401EA.304
> > Latest currently available firmware for FA401EA Issue still reproducibl=
e
> >
> > Baseline:
> >
> > 0x5f:0x30 =3D 0xffb7
> > DMIC =3D exact digital zero
> >
> > Normal PDE2A -> PS0:
> >
> > 0x5f:0x30 remains 0xffb7
> >
> > Explicit BIT(6) set:
> >
> > 0x5f:0x30 becomes 0xfff7
> > hardware readback confirms 0xfff7
> >
> > SmartMic capture while register is 0xfff7:
> >
> > Channel 0 =3D exact digital zero
> > Channel 1 =3D exact digital zero
> >
> > After capture:
> >
> > BIT(6) cleared
> > 0x5f:0x30 returns to 0xffb7
> >
> > ---
> >
> > ## CONCLUSION
> >
> > On my affected FA401EA, explicitly setting NID 0x5f / index 0x30 to the
> > specification default value 0xfff7 is NOT sufficient to make the microp=
hones
> > work.
> >
> > The machine is already running BIOS FA401EA.304, which is the latest
> > firmware currently available for this model, and the issue is still rep=
roducible.
> > Therefore there is no newer ASUS firmware currently available for me to=
 test
> > against this behavior.
> >
> > One interesting difference from the earlier reported register dump is t=
hat my
> > unit does not currently show 0x01c2 at 0x5f:0x30.
> >
> > It shows:
> >
> > 0xffb7
> >
> > both before and after the normal PDE2A PS0 request.
> >
> > The only difference from the documented default value 0xfff7 is BIT(6).
> >
> > However, setting BIT(6), verifying 0xfff7 by hardware readback, and kee=
ping
> > that value for the entire capture still leaves both microphone channels
> > producing exact digital zeros.
> >
> > This seems to suggest that some other part of the analog/vendor power
> > sequence is still required.
> >
> > This could also explain why the community workaround which writes sever=
al
> > RT721 vendor analog power registers succeeds: that workaround modifies
> > considerably more than 0x5f:0x30, including codec-wide power state at
> > 0x5f:0x00 and other analog power registers.
> >
> > I intentionally did NOT apply the complete vendor power sequence during=
 this
> > test because I wanted to test Jack's 0x5f:0x30 question independently a=
nd
> > provide a clean result.
> >
> > For reference, the internal speakers also remain completely silent on t=
his
> > machine with a20afec40ea1 alone, as previously reported.
> >
> > If you would like me to perform another targeted test, please specify t=
he exact
> > register/value and at what state it should be read or written, and I wi=
ll try to
> > reproduce it carefully.
> >
> > Again, I am not experienced with Linux audio driver development and I a=
m
> > relying on ChatGPT to help me understand the kernel code and construct =
these
> > diagnostic tests. I wanted to be transparent about that.
> >
> > Nevertheless, I have tried to keep the experiments minimal and reversib=
le and
> > to verify register changes by hardware readback wherever possible.
> >
> > I hope these results help narrow down the issue.
> >
> > Thanks,
> > Cristian
> >
> >
> > On Mon, Sep 14, 2026 at 9:13=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> > >
> > > On Mon, Sep 14, 2026 at 08:16:22PM +0800, Shengyu Qu wrote:
> > >
> > > > On my FA401EA this issue doesn't exist so I can't test. Maybe you
> > > > can ask at bugzilla so other users with this issue could test?
> > >
> > > > PS: maybe this is the issue for some old batches of RT721 chip? My
> > > > device is very new and this might be why I don't have this issue?
> > >
> > > Could some firmware update have done something that helps somehow?

--000000000000427947065b8a3e30
Content-Type: text/plain; charset="US-ASCII"; name="rt721-jack-after-jack-patch.txt"
Content-Disposition: attachment; filename="rt721-jack-after-jack-patch.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_mu31la550>
X-Attachment-Id: f_mu31la550

WyAgICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA3LjMuMC1yYzItZmE0MDFlYS1qYWNrLXYxKyAo
Y2hyaXNAQ2hyaXMtTGFwdG9wKSAoZ2NjIChHQ0MpIDE2LjIuMSAyMDI2MDgxOSAoUmVkIEhhdCAx
Ni4yLjEtMiksIEdOVSBsZCB2ZXJzaW9uIDIuNDcuMjAyNjA3MjYpICMyIFNNUCBQUkVFTVBUX0RZ
TkFNSUMgVHVlIFNlcCAxNSAyMTozMTowMyBFRVNUIDIwMjYKWyAgICAwLjAwMDAwMF0gQ29tbWFu
ZCBsaW5lOiBCT09UX0lNQUdFPShoZDAsZ3B0Mikvdm1saW51ei03LjMuMC1yYzItZmE0MDFlYS1q
YWNrLXYxKyByb290PVVVSUQ9ODFhNDg1NTktZWRmNi00YjBiLTk2Y2QtMWNiMzlkYmNiNzdhIHJv
IHJvb3RmbGFncz1zdWJ2b2w9cm9vdCByaGdiIHF1aWV0ClsgICAgMC4wMzk5MTBdIEtlcm5lbCBj
b21tYW5kIGxpbmU6IEJPT1RfSU1BR0U9KGhkMCxncHQyKS92bWxpbnV6LTcuMy4wLXJjMi1mYTQw
MWVhLWphY2stdjErIHJvb3Q9VVVJRD04MWE0ODU1OS1lZGY2LTRiMGItOTZjZC0xY2IzOWRiY2I3
N2Egcm8gcm9vdGZsYWdzPXN1YnZvbD1yb290IHJoZ2IgcXVpZXQKWyAgICAxLjY3NDAwM10gdXNi
IHVzYjE6IE1hbnVmYWN0dXJlcjogTGludXggNy4zLjAtcmMyLWZhNDAxZWEtamFjay12MSsgeGhj
aS1oY2QKWyAgICAxLjY3NDkyNF0gdXNiIHVzYjI6IE1hbnVmYWN0dXJlcjogTGludXggNy4zLjAt
cmMyLWZhNDAxZWEtamFjay12MSsgeGhjaS1oY2QKWyAgICAxLjY3NjY4MV0gdXNiIHVzYjM6IE1h
bnVmYWN0dXJlcjogTGludXggNy4zLjAtcmMyLWZhNDAxZWEtamFjay12MSsgeGhjaS1oY2QKWyAg
ICAxLjY3OTE3NF0gdXNiIHVzYjQ6IE1hbnVmYWN0dXJlcjogTGludXggNy4zLjAtcmMyLWZhNDAx
ZWEtamFjay12MSsgeGhjaS1oY2QKWyAgICAxLjY4MTQ3Ml0gdXNiIHVzYjU6IE1hbnVmYWN0dXJl
cjogTGludXggNy4zLjAtcmMyLWZhNDAxZWEtamFjay12MSsgeGhjaS1oY2QKWyAgICAxLjY4MjMz
OV0gdXNiIHVzYjY6IE1hbnVmYWN0dXJlcjogTGludXggNy4zLjAtcmMyLWZhNDAxZWEtamFjay12
MSsgeGhjaS1oY2QKWyAgICAxLjY4NDIwNl0gdXNiIHVzYjc6IE1hbnVmYWN0dXJlcjogTGludXgg
Ny4zLjAtcmMyLWZhNDAxZWEtamFjay12MSsgeGhjaS1oY2QKWyAgICAxLjY4NDk2Nl0gdXNiIHVz
Yjg6IE1hbnVmYWN0dXJlcjogTGludXggNy4zLjAtcmMyLWZhNDAxZWEtamFjay12MSsgeGhjaS1o
Y2QKWyAgICA4LjIwNjcwOV0gcnQ3MjEtc2RjYSBzZHc6MDoxOjAyNWQ6MDcyMTowMTogZW5hYmxp
bmcgdmVuZG9yIGFuYWxvZyBwb3dlciBzZXF1ZW5jZQpbICAgIDguMjEyMzg1XSBpbnB1dDogYW1k
LXNvdW5kd2lyZSBIZWFkc2V0IEphY2sgYXMgL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjA4
LjEvMDAwMDo2NDowMC41L2FtZF9zZHcvc291bmQvY2FyZDEvaW5wdXQyMgo=
--000000000000427947065b8a3e30--
