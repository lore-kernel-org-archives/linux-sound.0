Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D99440628
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 20:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923206; cv=pass; b=oWjZf6/JncknMHOp9sU+t4J3NzQKF7JALFzd2qGu7TRidwSxgqac827u9+HXqmNomRfCBle5+AZtCR3KkQu15jquV34R/8yhoFVqX4Mjjf7lAzIZxau8Trbe8yGmRBsk4GgA69WjIKB69M90HX+mLpQ/Ww+G49c1Tv1SoWm1KsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923206; c=relaxed/simple;
	bh=y8MAwGt/U3E6526A9X2TzeYDyXdPjM8q25RWzUbH8qY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqYYWAEbne7K0qdjs9QKt1/+qRX/BRw/vBYvj0rjpYZvZM6iKzF43lCmMO3SmceAjSpvzf/myKru/7ZrHwpnzE4D8gnOzi7qlbZC9X3aJ+vCfhdnXZZkJDJE7k85y+UYD0qPayrnFLvcjmw1PFYRIr9hcibPHIQsAq5jLF8ziYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okq3jTUR; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okq3jTUR"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35834f72d94so6130330eec.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 13:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791923202; cv=none;
        d=google.com; s=arc-20260327;
        b=gihtWEZHyS6NMe+9/UuZRX5xriyXQHudbK898uJKC2xIgkwlVe17wilARjxMlZ22UD
         g8rh/Py7q2Th8oDHWC2uFRz5sFK+xx52VKLakuiEgHHVapbTwOUJfcO1ucjwd93N7pXi
         FtHBrNRfgG0mDFCeRlAQSK428iEep9KGsj73zVHKeKCgThpxCB3dBiLq7G2qhAM8IhOj
         QDDcXCQC7EYNjhYHenVwcBsWRvkIqVk46GprlADfajBSPFvw6tj7MSbWtZ04m9OemG9w
         Py19kpBUqFb0EPLMART6d2ek/xLWN2bHqkrm5qWr4WtXU5yGGiqZP04U6wY7R8PaNIGS
         g5gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FjzvIvYBlDXlQCkbvl5HHzDUrqt9y2RgUSfydJ5XGYY=;
        fh=H2QEWtNGxiYXBxCHYKzbTCDpY0xi55/c0RZ3MxRTzz0=;
        b=RLmXJster5K5Tr+xgdaEk8Y+9Dg15x0q6ygTmA/PYTjfvuhMjMM1jf3m6bq9xtqkgv
         7tMMj4b6XAavOUSLT1b3xY7EBkhvo6qqy/kck7ZHsJSXbfqSYUC4ulNzy7YLnWE9vh7U
         ySwcmzYuhvDhE3h3Zx2v1D4Eq1kY339UQJ/n2aJ1hLezcgZon/0GgNbA664x/hakHlIm
         Rw2FF7DxHQt7wLO4pedQW4g2AvvMHLv3I/J6txxYZiWV8wZJ1HezVQaRMHSI7aVLtycJ
         SX/XDLRGroqktawgUd4UEfIaU5JF5y4ciPVOtzKVrkilXOvzvjlX9HRF2IPGYfK+Vzk+
         oEBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791923202; x=1792528002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FjzvIvYBlDXlQCkbvl5HHzDUrqt9y2RgUSfydJ5XGYY=;
        b=okq3jTURvH7JhqrV2kLtNL0ADKzMnqE7KxQnl3T8Fz5HxWfO3gndxRy2Zkt2FVa0RM
         0zEZkIy6BYnkFjLeZo+JkwczyGkrKsm9Tltbcah+4EPPcl4joG/yoL4Gp7whkYqfD/UH
         uzHGNJSCJqUm+qjT98MDKhv1V120NfnbxCPKLEIyiSEGG6elCZEvb7NZZDDLMqvVZuBu
         jX5x710EwC9LMnnKdSNFfrgN0vStMiu2H/wM/8fD58P76cbtBukXmRleV97dowK6DWQr
         Vm7bqjjjxtRq8IxyXq41yBoct9vzd59v5NKNeLzKDxWwgsd3W9F1BOgM/Wkmp5iI6Mbh
         eJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923202; x=1792528002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FjzvIvYBlDXlQCkbvl5HHzDUrqt9y2RgUSfydJ5XGYY=;
        b=O4mLfGYNdd7l8fRkHUJqQ4TE4zvhW1k0GYDiFOpgdLWQtFFd/5/x48/hK7dh43uzMQ
         3Zgkm+ZxPrWMGjHtXe6aAYZmx9CBN5CV2h8rQhPFl6gGPSMS8WNJ0MI9HG43o5VXLAZl
         Gjqbi6QCsb0xQy5iRQACaPKjYmtmaerdFF98KaT3pA1N6pMtkCQOTx+BaqF6pbt33yYj
         VPFdY/sGfwhV3bBPFuBD+NgrmTGV82ZfcoQSvteHgnTcI/8qwfyq82WRKdfOU9IFRQvY
         FfLglRGGvirdXmoxJaauyd3ML0enPcasZ8hoUhA1uOi3J7K1YHySt0GgYy0HcoTCmVxA
         ZlZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJgk3gJhoE1RE6gmQWk2Vmx6GBeb90H6UiC/f48fe9PDjmLwbgOJfwShXlTof9xXjrBgTML+Irscwyzg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLVdKh+Wwm/9T0SD8ecFfogMvH9hlcQA59ycqle2ncTCOv0gE9i
	mExgG7cbZxMqXCzfZtg/ACplOKHxNn55deBkFYv2PpjMSFd0nUO1i9OvNGukflBcAoxIwaxbdBC
	oIpbyH/vYeEeudpAaPU77O2NKB+3mfVk=
X-Gm-Gg: AYBFou1jqa1jJNSZPFLSMdaiS3/+98ibMT3jwEiZDRbtjdzBkak0MFu/hDrzXpz8Boy
	EoNsAE3SIH+5b53wenh+pew6yZ51jQ3jY0zJ0WnPYvqkfpSTGOysN6nVitSeCjko/3bBi2euAmo
	ib41cJqxeuxF4A5Skr6m4L4bwPrKlLj+bnhnTf3qqYdOQ6jXCQirqrAJzx9Q8UercPxP7gDSXx3
	ZkV5r4wYaetdYcm3deB7hr0uA/tBP00ibxBWEBw3+vaPBuMM3CjjFmL0SjHCpKdzmo6By54AGP3
	ionvYWI5Pq6YwyvZLO3wggojlEC89wq5SSU2uJfIZRPJEQM9UcmM+v6vQsP00u9B
X-Received: by 2002:a05:7300:1c94:b0:351:4a80:d94c with SMTP id
 5a478bee46e88-3537dfbbe1bmr21401980eec.21.1791923201794; Tue, 13 Oct 2026
 13:26:41 -0700 (PDT)
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
 <a61ca5276d914235808711d7935e0f3e@realtek.com> <TYVPR01MB108923CFD066C9059AB2F6BBC98882@TYVPR01MB10892.jpnprd01.prod.outlook.com>
 <074582b854a64eaa82aa931560848f31@realtek.com>
In-Reply-To: <074582b854a64eaa82aa931560848f31@realtek.com>
From: Cristian Timohi <cristiantimohi@gmail.com>
Date: Tue, 13 Oct 2026 23:26:29 +0300
X-Gm-Features: AclHuK_8aJp-_kwNV-t-t5rTcxdNMnS6i0rFDvIXF6sQ0lBUPV463lsd2JhIsFo
Message-ID: <CAAAbPi6CN9bz=PhkO3Psf0pUaKToWCyubnvB1nf9KfXEVR_EVw@mail.gmail.com>
Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14 FA401EA speakers
 silent and headphone jack buzzes on playback
To: Jack Yu <jack.yu@realtek.com>
Cc: Shengyu Qu <wiagn233@outlook.com>, Mark Brown <broonie@kernel.org>, 
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jack,

I have very good news: with the latest RT721 changes, audio is now
working correctly on my affected ASUS TUF Gaming A14 FA401EA.

I tested a new kernel based on:

Linux 7.3-rc7
24a19b953e

The RT721 stack used for the test was:

247b84c07b7
7325b35a12d
e2eb4873b901
ASoC: rt721-sdca: Adjust blindwrite flow to fix type detection issue

plus the vendor analog power-gates fix you previously sent me:

ASoC: rt721-sdca: power up the vendor analog gates

The original local commit for that patch was:

6577f2bf61309383a74864f1cf60d1ad80c21175

Because the RT721 code had changed, I ported the analog-gates patch
onto the newer RT721 code while preserving the same register values
and the FA401EA DMI matching.

The resulting kernel is:

7.3.0-rc7-fa401ea-jack-v2+

Results on the physical FA401EA:

- Internal speakers: WORKING
- Internal SoundWire microphones: WORKING
- Headphone jack detection: WORKING
- Headphone playback: WORKING
- Automatic jack insertion/removal events: WORKING
- Automatic switching between speakers and headphones: WORKING

The jack state is now correctly reported by ALSA.

With headphones inserted:

Headphone Jack =3D on
Headphone Switch =3D on

`alsactl monitor` also now reports events when inserting/removing the
headphone plug:

node hw:1, #11 (0,0,0,Headphone Jack,0) VALUE

Previously, on the same machine, there were no jack events at all and
`Headphone Jack` remained permanently off.

So on this affected FA401EA, the combination of the newer RT721
type-detection changes and the vendor analog power-gates fix appears
to fully resolve the Linux audio problem.

One important point is that the vendor analog-gates patch is still
required on this machine. Without it, the internal speakers are silent
and the internal SoundWire microphones do not work correctly. With it,
both work normally.

Could you please consider submitting the vendor analog power-gates fix
upstream as soon as possible and, if appropriate, make sure both this
fix and the RT721 type-detection changes reach mainline and the
relevant stable kernels?

On this FA401EA, both parts are needed for fully working audio:

- the analog-gates fix restores the internal speakers and internal micropho=
nes;
- the newer RT721 type-detection changes restore jack detection and
the 3.5 mm headphone path.

If the fixes are suitable for stable backporting, that would be
especially helpful, since affected FA401EA units otherwise still
require a custom kernel for fully working internal audio.

My goal is to return to the normal Fedora kernel and receive the fix
through standard kernel updates instead of maintaining a custom
kernel.

I am happy to test a final upstream version of the patch, a v2/v3
revision, or any stable-backport candidate on this laptop.

Thank you very much for helping debug this, everyone working on this
is very skilled. The machine now finally has working Linux audio.

Regards,
Cristian

On Thu, Oct 8, 2026 at 8:15=E2=80=AFAM Jack Yu <jack.yu@realtek.com> wrote:
>
> Hi Shengyu,
>
> Could you try the rt721 patch that is merged recently as below
>
> [1/1] ASoC: rt721-sdca: Adjust blindwrite flow to fix type detection issu=
e
>       https://git.kernel.org/broonie/sound/c/e2eb4873b901
>
> Regards,
> Jack
>
> > -----Original Message-----
> > From: Shengyu Qu <wiagn233@outlook.com>
> > Sent: Sunday, October 4, 2026 2:45 AM
> > To: Jack Yu <jack.yu@realtek.com>; Cristian Timohi
> > <cristiantimohi@gmail.com>; Mark Brown <broonie@kernel.org>
> > Cc: wiagn233@outlook.com; Syed Saba Kareem
> > <syed.sabakareem@amd.com>; Mukunda,Vijendar
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
> > Hello Jack,
> >
> > Any updates?
> >
> > Best regards,
> > Shengyu
> >
> > =E5=9C=A8 2026/9/15 11:44, Jack Yu =E5=86=99=E9=81=93:
> > > Hi Cristian,
> > >
> > > Could you check if the attached patch fix the issue?
> > > Thanks.
> > >
> > > Regards,
> > > Jack
> > >
> > >> -----Original Message-----
> > >> From: Cristian Timohi <cristiantimohi@gmail.com>
> > >> Sent: Tuesday, September 15, 2026 2:52 AM
> > >> To: Mark Brown <broonie@kernel.org>
> > >> Cc: Shengyu Qu <wiagn233@outlook.com>; Jack Yu <jack.yu@realtek.com>=
;
> > >> Syed Saba Kareem <syed.sabakareem@amd.com>; Mukunda,Vijendar
> > >> <vijendar.mukunda@amd.com>; Flove(HsinFu) <flove@realtek.com>;
> > >> venkataprasad.potturu@amd.com; linux-sound@vger.kernel.org; Oder
> > >> Chiou <oder_chiou@realtek.com>; vkoul@kernel.org;
> > >> yung-chuan.liao@linux.intel.com; pierre-louis.bossart@linux.dev;
> > >> lgirdwood@gmail.com; linux-kernel@vger.kernel.org; Dommati,
> > >> Sunil-kumar <Sunil-kumar.Dommati@amd.com>; Fish690103
> > >> <fish690103@realtek.com>; Mike Lin (=E6=9E=97=E6=9B=89=E8=83=BD) <mi=
kelin@realtek.com>
> > >> Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14
> > FA401EA
> > >> speakers silent and headphone jack buzzes on playback
> > >>
> > >>
> > >> External mail : This email originated from outside the organization.
> > >> Do not reply, click links, or open attachments unless you recognize
> > >> the sender and know the content is safe.
> > >>
> > >>
> > >>
> > >> Hi Mark, Jack, Shengyu, all,
> > >>
> > >> I performed the test Jack requested for NID 0x5f / index 0x30 on my
> > >> affected ASUS TUF Gaming A14 FA401EA.
> > >>
> > >> I am including all details below because there were a few important
> > >> observations during the test.
> > >>
> > >> One note before the technical details: I am not a Linux kernel/audio
> > >> developer, and this level of ASoC/SoundWire/RT721 debugging is beyon=
d
> > >> my normal area of expertise. I am working through these tests with
> > >> ChatGPT helping me understand the driver code, build temporary
> > >> diagnostic modules, and perform the tests carefully.
> > >>
> > >> I am trying to keep every experiment minimal, reversible, and
> > >> verified by readback where possible. I hope the results are still
> > >> useful for debugging the actual issue.
> > >>
> > >> ---
> > >>
> > >> ## SYSTEM
> > >>
> > >> Laptop:
> > >> ASUS TUF Gaming A14 FA401EA
> > >>
> > >> CPU/platform:
> > >> Ryzen AI MAX+ 392
> > >> AMD ACP 7.0
> > >>
> > >> Codec:
> > >> Realtek RT721 SDCA
> > >>
> > >> BIOS:
> > >> FA401EA.304
> > >>
> > >> This machine is already running the latest firmware/BIOS currently
> > >> available for the FA401EA. Therefore, at least on this unit, the
> > >> issue is reproducible with the latest available ASUS firmware instal=
led.
> > >>
> > >> Running kernel:
> > >> 7.3.0-rc2-fa401ea-rt721+
> > >>
> > >> Kernel source tree HEAD:
> > >> 1a3fdcb408 ASoC: rt721-sdca: Adjust latency control to fix no-sound
> > >> issue
> > >>
> > >> This includes the a20afec40ea1 fix.
> > >>
> > >> The following patch was NOT present during this test:
> > >>
> > >> ASoC: rt721-sdca: Update preset for all functions
> > >>
> > >> Audio card:
> > >>
> > >> amd-soundwire
> > >> ASUSTeKCOMPUTERINC.-TUFGamingA14FA401EA-1.0-FA401EA
> > >>
> > >> SmartMic capture PCM:
> > >>
> > >> card: amdsoundwire
> > >> device 4: SDW1-PIN5-CAPTURE-SmartMic
> > >> DAI: rt721-sdca-aif3-4
> > >>
> > >> ---
> > >>
> > >> ## DIAGNOSTIC MODULE
> > >>
> > >> I built a temporary out-of-tree snd-soc-rt721-sdca module matching
> > >> the running kernel.
> > >>
> > >> No DKMS installation was performed and no permanent module
> > >> replacement was made.
> > >>
> > >> The temporary module initially only did the following:
> > >>
> > >> 1. Added MBQ address 0x5f00030 to the readable and volatile register=
 lists.
> > >>
> > >> 2. Added rt_sdca_index_read() calls inside:
> > >>
> > >>     rt721_sdca_pde11_event()
> > >>
> > >>     to read:
> > >>
> > >>     NID:   0x5f
> > >>     index: 0x30
> > >>
> > >>     at three points:
> > >>
> > >>     * before requesting mic-path PS0
> > >>     * after requesting mic-path PS0
> > >>     * before requesting PS3
> > >>
> > >> The existing PDE2A power-state request itself was left unchanged.
> > >>
> > >> ---
> > >>
> > >> ## BASELINE READ-ONLY TEST
> > >>
> > >> Before capture I enabled:
> > >>
> > >> rt721 FU1E Capture Switch =3D on,on,on,on
> > >>
> > >> Capture command:
> > >>
> > >> arecord -D hw:amdsoundwire,4
> > >> -f S16_LE
> > >> -r 48000
> > >> -c 2
> > >> -d 3
> > >> /tmp/rt721-mic-test.wav
> > >>
> > >> The register values were:
> > >>
> > >> RT721TEST mic 5f:30 before PS0: 0xffb7 RT721TEST mic 5f:30 after PS0=
:
> > >> 0xffb7 RT721TEST mic 5f:30 before PS3: 0xffb7
> > >>
> > >> Therefore, on my affected FA401EA:
> > >>
> > >> 0x5f:0x30 =3D 0xffb7
> > >>
> > >> and requesting PDE2A PS0 does NOT change it.
> > >>
> > >> I then analyzed the raw PCM samples.
> > >>
> > >> Capture:
> > >>
> > >> 144000 frames
> > >> 48000 Hz
> > >> stereo
> > >> S16_LE
> > >> 3 seconds
> > >>
> > >> Channel 0:
> > >>
> > >> min=3D0
> > >> max=3D0
> > >> RMS=3D0.00
> > >> nonzero samples=3D0/144000
> > >> nonzero percentage=3D0.00%
> > >> distinct sample values=3D1
> > >>
> > >> Channel 1:
> > >>
> > >> min=3D0
> > >> max=3D0
> > >> RMS=3D0.00
> > >> nonzero samples=3D0/144000
> > >> nonzero percentage=3D0.00%
> > >> distinct sample values=3D1
> > >>
> > >> So the SmartMic capture is exact digital zero on both channels.
> > >>
> > >> ---
> > >>
> > >> ## 0xFFB7 VS 0xFFF7
> > >>
> > >> Jack mentioned that the default value according to the RT721 specifi=
cation
> > for:
> > >>
> > >> NID 0x5f
> > >> index 0x30
> > >>
> > >> is:
> > >>
> > >> 0xfff7
> > >>
> > >> My hardware returns:
> > >>
> > >> 0xffb7
> > >>
> > >> Difference:
> > >>
> > >> 0xfff7
> > >> 0xffb7
> > >> ------
> > >>
> > >> 0x0040
> > >>
> > >> So BIT(6) is the only difference between the value observed on my
> > >> unit and 0xfff7.
> > >>
> > >> ---
> > >>
> > >> ## FIRST ATTEMPT TO FORCE BIT(6)
> > >>
> > >> I then modified the temporary module to set only BIT(6) using:
> > >>
> > >> rt_sdca_index_update_bits(..., BIT(6), BIT(6))
> > >>
> > >> rather than overwriting the entire register.
> > >>
> > >> This should change:
> > >>
> > >> 0xffb7 -> 0xfff7
> > >>
> > >> In the first attempt I performed this before requesting PS0.
> > >>
> > >> That attempt failed safely:
> > >>
> > >> RT721TEST mic 5f:30 before PS0: read failed: -16 RT721TEST force BIT=
6
> > failed:
> > >> -16
> > >>
> > >> -16 is EBUSY.
> > >>
> > >> Since rt_sdca_index_update_bits() first reads the register and
> > >> returns immediately if the read fails, no register write occurred
> > >> during this first attempt.
> > >>
> > >> After PS0 the register became readable and still contained:
> > >>
> > >> 0xffb7
> > >>
> > >> There was also a runtime PM issue during this attempt:
> > >>
> > >> runtime PM trying to activate child device sdw:0:1:025d:0721:01 but
> > >> parent
> > >> (sdw-master-0-1) is not active
> > >>
> > >> followed by:
> > >>
> > >> Failed to resume device: -61
> > >> Slave 1 alert handling failed: -61
> > >>
> > >> Because of this I did not consider the first attempt authoritative.
> > >>
> > >> ---
> > >>
> > >> ## FINAL CONTROLLED TEST
> > >>
> > >> For the second attempt I moved the BIT(6) update until AFTER PDE2A
> > >> had been requested to PS0.
> > >>
> > >> I also explicitly kept the complete relevant path runtime-active
> > >> during the experiment.
> > >>
> > >> ACP PCI device:
> > >>
> > >> /sys/bus/pci/devices/0000:64:00.5
> > >>
> > >> SoundWire manager:
> > >>
> > >> /sys/devices/pci0000:00/0000:00:08.1/0000:64:00.5/amd_sdw_manager.1
> > >>
> > >> RT721 codec:
> > >>
> > >> /sys/bus/soundwire/devices/sdw:0:1:025d:0721:01
> > >>
> > >> For all three:
> > >>
> > >> power/control =3D on
> > >> runtime_status =3D active
> > >>
> > >> PipeWire, WirePlumber and alsa-state were stopped during the
> > >> experiment so nothing else held the ALSA devices.
> > >>
> > >> RT721 status before capture:
> > >>
> > >> Attached
> > >>
> > >> The sequence inside rt721_sdca_pde11_event() was:
> > >>
> > >> 1. Read 0x5f:0x30
> > >> 2. Request PDE2A PS0
> > >> 3. Wait 10-20 ms
> > >> 4. Read 0x5f:0x30 again
> > >> 5. Set only BIT(6)
> > >> 6. Read 0x5f:0x30 again to verify the write 7. Perform SmartMic capt=
ure 8.
> > >> Read 0x5f:0x30 before PS3 9. Clear BIT(6) again 10. Read back the
> > >> register to verify restoration 11. Request PS3
> > >>
> > >> The resulting kernel log was:
> > >>
> > >> RT721_BIT6_V2_BEGIN
> > >>
> > >> RT721TEST mic 5f:30 before PS0: 0xffb7 RT721TEST mic 5f:30 after PS0=
:
> > >> 0xffb7 RT721TEST mic 5f:30 after BIT6 set: 0xfff7 RT721TEST mic 5f:3=
0
> > >> before PS3:
> > >> 0xfff7 RT721TEST mic 5f:30 after BIT6 restore: 0xffb7
> > >>
> > >> RT721_BIT6_V2_END
> > >>
> > >> So the requested value was successfully written and verified by
> > >> hardware readback.
> > >>
> > >> During the entire three-second capture:
> > >>
> > >> 0x5f:0x30 =3D 0xfff7
> > >>
> > >> After capture, BIT(6) was cleared again and readback confirmed that
> > >> the original value was restored:
> > >>
> > >> 0x5f:0x30 =3D 0xffb7
> > >>
> > >> ---
> > >>
> > >> ## CAPTURE RESULT WITH 0x5F:0x30 =3D 0xFFF7
> > >>
> > >> Capture command:
> > >>
> > >> arecord -D hw:amdsoundwire,4
> > >> -f S16_LE
> > >> -r 48000
> > >> -c 2
> > >> -d 3
> > >> /tmp/rt721-mic-bit6-v2.wav
> > >>
> > >> Capture:
> > >>
> > >> 144000 frames
> > >> 48000 Hz
> > >> stereo
> > >> S16_LE
> > >>
> > >> Channel 0:
> > >>
> > >> min=3D0
> > >> max=3D0
> > >> RMS=3D0.00
> > >> nonzero samples=3D0/144000
> > >> nonzero percentage=3D0.00%
> > >> distinct sample values=3D1
> > >>
> > >> Channel 1:
> > >>
> > >> min=3D0
> > >> max=3D0
> > >> RMS=3D0.00
> > >> nonzero samples=3D0/144000
> > >> nonzero percentage=3D0.00%
> > >> distinct sample values=3D1
> > >>
> > >> Therefore the microphone capture remained exact digital zero on both
> > >> channels even while 0x5f:0x30 was verified to be 0xfff7.
> > >>
> > >> ---
> > >>
> > >> ## SUMMARY
> > >>
> > >> Firmware:
> > >>
> > >> BIOS FA401EA.304
> > >> Latest currently available firmware for FA401EA Issue still
> > >> reproducible
> > >>
> > >> Baseline:
> > >>
> > >> 0x5f:0x30 =3D 0xffb7
> > >> DMIC =3D exact digital zero
> > >>
> > >> Normal PDE2A -> PS0:
> > >>
> > >> 0x5f:0x30 remains 0xffb7
> > >>
> > >> Explicit BIT(6) set:
> > >>
> > >> 0x5f:0x30 becomes 0xfff7
> > >> hardware readback confirms 0xfff7
> > >>
> > >> SmartMic capture while register is 0xfff7:
> > >>
> > >> Channel 0 =3D exact digital zero
> > >> Channel 1 =3D exact digital zero
> > >>
> > >> After capture:
> > >>
> > >> BIT(6) cleared
> > >> 0x5f:0x30 returns to 0xffb7
> > >>
> > >> ---
> > >>
> > >> ## CONCLUSION
> > >>
> > >> On my affected FA401EA, explicitly setting NID 0x5f / index 0x30 to
> > >> the specification default value 0xfff7 is NOT sufficient to make the
> > >> microphones work.
> > >>
> > >> The machine is already running BIOS FA401EA.304, which is the latest
> > >> firmware currently available for this model, and the issue is still
> > reproducible.
> > >> Therefore there is no newer ASUS firmware currently available for me
> > >> to test against this behavior.
> > >>
> > >> One interesting difference from the earlier reported register dump i=
s
> > >> that my unit does not currently show 0x01c2 at 0x5f:0x30.
> > >>
> > >> It shows:
> > >>
> > >> 0xffb7
> > >>
> > >> both before and after the normal PDE2A PS0 request.
> > >>
> > >> The only difference from the documented default value 0xfff7 is BIT(=
6).
> > >>
> > >> However, setting BIT(6), verifying 0xfff7 by hardware readback, and
> > >> keeping that value for the entire capture still leaves both
> > >> microphone channels producing exact digital zeros.
> > >>
> > >> This seems to suggest that some other part of the analog/vendor powe=
r
> > >> sequence is still required.
> > >>
> > >> This could also explain why the community workaround which writes
> > >> several
> > >> RT721 vendor analog power registers succeeds: that workaround
> > >> modifies considerably more than 0x5f:0x30, including codec-wide powe=
r
> > >> state at
> > >> 0x5f:0x00 and other analog power registers.
> > >>
> > >> I intentionally did NOT apply the complete vendor power sequence
> > >> during this test because I wanted to test Jack's 0x5f:0x30 question
> > >> independently and provide a clean result.
> > >>
> > >> For reference, the internal speakers also remain completely silent o=
n
> > >> this machine with a20afec40ea1 alone, as previously reported.
> > >>
> > >> If you would like me to perform another targeted test, please specif=
y
> > >> the exact register/value and at what state it should be read or
> > >> written, and I will try to reproduce it carefully.
> > >>
> > >> Again, I am not experienced with Linux audio driver development and =
I
> > >> am relying on ChatGPT to help me understand the kernel code and
> > >> construct these diagnostic tests. I wanted to be transparent about t=
hat.
> > >>
> > >> Nevertheless, I have tried to keep the experiments minimal and
> > >> reversible and to verify register changes by hardware readback where=
ver
> > possible.
> > >>
> > >> I hope these results help narrow down the issue.
> > >>
> > >> Thanks,
> > >> Cristian
> > >>
> > >>
> > >> On Mon, Sep 14, 2026 at 9:13=E2=80=AFPM Mark Brown <broonie@kernel.o=
rg>
> > wrote:
> > >>>
> > >>> On Mon, Sep 14, 2026 at 08:16:22PM +0800, Shengyu Qu wrote:
> > >>>
> > >>>> On my FA401EA this issue doesn't exist so I can't test. Maybe you
> > >>>> can ask at bugzilla so other users with this issue could test?
> > >>>
> > >>>> PS: maybe this is the issue for some old batches of RT721 chip? My
> > >>>> device is very new and this might be why I don't have this issue?
> > >>>
> > >>> Could some firmware update have done something that helps somehow?
>
