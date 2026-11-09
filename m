Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259957;
	b=ft7wHJrRznyprHP3iycYw0fCBRhFlhU5gyaJi6t2AqmOM6W2W0aZMphVt2b9p95SogPw
	 9sQthB4UlPRnZGdiK1Bki48eJJumRimaRro2Rma9uq+hTK8Kk0dSPPLxbkP3g87TYo7h/
	 qE00ZbSCO8H/iYkD61WeIq1pX76Cmd13X5x5NTKfdrV/LXLA2c6O8pN/81Z8YaCSU4FIK
	 v4w9ORlsTftBit36ZJD7HI3TisKX2xbsgeGd2Z2vukjQVAg3DCfJJV5o3EWQgX1g/MPru
	 /cBN/RfaQFSB8GMCtzX9XAcZybWoUXOeOkXL72RamYErOGdUYcYYFwEL0PJcAI9ozjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259957;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=KfP+qP/zROxfDnz3mzR6nvfhebyC+h9GAWIwcwDWEVo=;
	b=EVAs9M+flUEfToS/C44KmHjYPAfYH9cSLrkZdhofQFkCvCw/np/L4tpZA2K+TbooH12B
	 iYfBwTBzFaXMu6iwqYxe1W1qk9Kmucau52l6hjdPllJJi4adVpyMKAzFrdJjbB0Q9XBwZ
	 y1y/N5JwbHMRMUSSanBhXiY/5D0thqMuRlZB8TcdUP3+pwWR1oSAAJr+rSNLkc6nKrm2g
	 ocAnpacyn0z9G0Eo7AcMf2NW0+O2A3QPZn5frMbMDxeI8e3F/97jBdbppe/WrKboLbjsG
	 cHlX2qJ+31vV+f3yS2+Yrhyi3pdfnRQfVAqhtjJF/plO3Z+2tWllakNczQX681Xijbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=hj5ie5nebbepzpwhzol23eyzpm.protonmail2 header.b=bEZR+mCs;
	arc=none smtp.remote-ip=109.224.244.26
Received: from mail-24426.protonmail.ch (mail-24426.protonmail.ch [109.224.244.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C2606A31C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 21:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 674C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=hj5ie5nebbepzpwhzol23eyzpm.protonmail2 header.b=bEZR+mCs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=hj5ie5nebbepzpwhzol23eyzpm.protonmail2; t=1794259948;
	x=1794519148; bh=KfP+qP/zROxfDnz3mzR6nvfhebyC+h9GAWIwcwDWEVo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bEZR+mCsAh76GDhN5xEP9TMwPCtg8SskVpynDVfHgVReASG5L2Lekk7ATrSm1RuJD
	 AfqHYTCC8A9vVF7WHUB8JFo8udqIvIgwgx9+zTVR+FGM8iGMlM6/ENYYse8kxMV0f6
	 sBZBG1eTl9PSi30NkVUVTIKGGtGTZiEFiHuqDIv6hSuNaLjqxSynY/TMLnNZ1TK2Vm
	 Re75yyjC8obx2vpSO0chQFLRzBc7tj+VzoxOsIPUeoAjFVOMASPzpSyK6SWM9LBUg9
	 FisIvTQOExI3ST4YZe0MXUM1hm8yhe/lPf7ETlc7ijTkZvFcmYxi+GiZ/XRSKsG4Dc
	 s7qhiD+tbcCOw==
Date: Mon, 09 Nov 2026 21:32:20 +0000
To: Thorsten Leemhuis <regressions@leemhuis.info>
From: Rujbin <rujbin@proton.me>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Alain Cousinie <alain.cousinie@laposte.net>, Linux Sound System <linux-sound@vger.kernel.org>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Linux 7.4-rc2: Intel Meteor Lake SOF/HDA audio fails with ASoC route errors (-19)
Message-ID: <mSuMDKuVQS8ZjTjivGVr3SMDUYuxZDrlG8aM0vLajVxIN8eq7OJTwAtWLWgMGypqzNolhoAsat_-nBy0wAq09eap6nIDkUvCES32gFvZ7ng=@proton.me>
In-Reply-To: <A2lXWpWj7wjBwPNTvCOh2-bCqRbX0Pb7od1dICr4c6SegAilwp8dERHk6riu7tj1b3XUMgcLnDDSP_8AoZAyj9VHm3NUkBB1NW2YPQfZLYY=@proton.me>
References: <mAZY9HZuXAXUf7zv8tqXquMtquf7iW2CIZB7WhU-SnwWp-Rpr0e8yixTsb3lAeQsO64PwwWlOao8aMjQ4hTKOQ6grCiNmaWZmFRXMdPICD8=@proton.me> <318f1745-acd7-430f-818b-c961987fe108@laposte.net> <1c28b5e3-7ddb-4e3d-a61b-a96aedd6eb50@leemhuis.info> <A2lXWpWj7wjBwPNTvCOh2-bCqRbX0Pb7od1dICr4c6SegAilwp8dERHk6riu7tj1b3XUMgcLnDDSP_8AoZAyj9VHm3NUkBB1NW2YPQfZLYY=@proton.me>
Feedback-ID: 45446246:user:proton
X-Pm-Message-ID: c72daf21872648188bd673d87f591abbb9fea2d8
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

I checked the disassembly of the installed v7.4-rc2 kernel and found furthe=
r evidence supporting the suspected root cause.

In soc_new_pcm_runtime(), the generated code initializes rtd->num_component=
s to the allocated array capacity. For the failing Analog Playback and Capt=
ure link, that value is 3.

The subsequent snd_soc_rtd_add_component() calls then write the component p=
ointers at indices 3, 4 and 5 instead of 0, 1 and 2.

This explains why the component array remains empty during iteration and wh=
y ASoC route initialization fails.

The installed kernel was built with GCC 16.2.1, with counted_by support ena=
bled.

I have prepared a minimal patch that resets rtd->num_components to zero aft=
er allocation. It compiles in my initial check, but I have not yet boot-tes=
ted the fix.

I'll test the patched kernel on the affected hardware before submitting the=
 patch separately.

Thanks,
Rujbin Nassereslam / zerox80




On Monday, November 9th, 2026 at 20:17, Rujbin <rujbin@proton.me> wrote:

> Hi Thorsten, Alain, and everyone,
>=20
> I investigated the regression further with the help of Codex.
>=20
> Source analysis points strongly to commit 4dd10fbbeb9c ("treewide: Conver=
t devm_kmalloc() family to the devm_kmalloc_obj() family").
>=20
> In soc_new_pcm_runtime(), devm_kzalloc_flex() appears to initialize rtd->=
num_components to the allocated array capacity, while ASoC expects this fie=
ld to count the number of populated components.
>=20
> Consequently, snd_soc_rtd_add_component() may write beyond the allocated =
array, while component iteration encounters an empty first entry. This woul=
d explain the missing SOF/HDA component probes and subsequent ASoC route fa=
ilures.
>=20
> A proposed minimal fix is to reset rtd->num_components to zero immediatel=
y after allocation in sound/soc/soc-core.c.
>=20
> The modified source compiled successfully against the installed 7.4-rc2 b=
uild headers.
>=20
> **This is not yet hardware-confirmed.** I have not booted a patched kerne=
l.
>=20
> Would this explanation match what the ASoC maintainers expect?
>=20
>=20
>=20
>=20
> Sent with Proton Mail secure email.
>=20
> On Monday, November 9th, 2026 at 19:49, Thorsten Leemhuis <regressions@le=
emhuis.info> wrote:
>=20
> > Lo! Sending this just to add the skl_hda_dsp_generic maintainers to thi=
s
> > discussion below -- maybe they have an idea what's wrong here. Alain,
> > Rujbin: if not, one of you will most likely have to run a git bisection
> > to identify the culprit. Ciao, Thorsten
> >
> > On 11/9/26 19:22, Alain Cousinie wrote:
> > > On 11/9/26 17:57, Rujbin wrote:
> > >>
> > >> I'm reporting an audio regression between Linux 7.4-rc1 and 7.4-rc2 =
on a Lenovo laptop running Fedora 44.
> > >>
> > >> Last known good kernel:
> > >> 7.4.0-rc1.vanilla.fc44.20261103210439475307
> > >>
> > >> First known bad kernel:
> > >> 7.4.0-rc2.vanilla.fc44.20261109132241085802
> > >>
> > >> Hardware:
> > >>
> > >> -   Intel Meteor Lake-P HD Audio Controller (8086:7e28)
> > >>
> > >> -   Lenovo subsystem (17aa:50e6)
> > >>
> > >> -   SOF driver: sof-audio-pci-intel-mtl
> > >>
> > >> -   Conexant SN6140 codec
> > >>
> > >>
> > >> Regression:
> > >>
> > >> With 7.4-rc1, audio works normally and ALSA registers the `sof-hda-d=
sp` sound card.
> > >>
> > >> With 7.4-rc2, ALSA reports no sound cards and PipeWire exposes only =
a dummy output.
> > >>
> > >> The SOF firmware boots successfully in both versions (2.14.1.1), but=
 7.4-rc2 fails during ASoC route initialization.
> > >>
> > >> Relevant kernel errors:
> > >>
> > >>     skl_hda_dsp_generic: ASoC: Failed to add route Analog In -> Code=
c Input Pin1(*)
> > >>     skl_hda_dsp_generic: ASoC: Failed to add route Analog CPU Playba=
ck(*) -> Analog Codec Playback(*)
> > >>     Analog Playback and Capture: fail to add hda routes, ret -19
> > >>     Analog Playback and Capture: ASoC error (-19): at snd_soc_link_i=
nit()
> > >>
> > >> On 7.4-rc1, the kernel successfully loads `sof-hda-generic-2ch.tplg`=
, initializes the Conexant SN6140 codec, and registers the audio devices.
> > >>
> > >> On 7.4-rc2, this initialization does not complete.
> > >>
> > >> Steps to reproduce:
> > >>
> > >> 1.  Boot Linux 7.4-rc2 on the affected machine.
> > >>
> > >> 2.  Run `aplay -l`.
> > >>
> > >> 3.  Observe that no sound cards are available.
> > >>
> > >> 4.  Reboot into 7.4-rc1 and confirm audio works.
> > >>
> > >>
> > >> This appears to be a regression in the SOF/HDA or ASoC initializatio=
n path. The responsible commit has not yet been identified.
> > >>
> > >> Full kernel logs from both the working 7.4-rc1 and broken 7.4-rc2 bo=
ot sessions are attached.
> > >>
> > >> Thanks!
> > >
> > >
> > > I can confirm the same regression in 7.4-rc2 on:
> > > HP Spectre x360 2-in-1 Laptop 14-eu0xxx/8C15, BIOS F.17 04/20/2026 (i=
7 155h)
> > >
> > > [    6.737799] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Analog In -> Codec Input Pin1(*)
> > > [    6.737802] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Digital In -> Codec Input Pin2(*)
> > > [    6.737803] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Alt Analog In -> Codec Input Pin3(*)
> > > [    6.737804] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Codec Output Pin1(*) -> Analog Out
> > > [    6.737805] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Codec Output Pin2(*) -> Digital Out
> > > [    6.737806] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Codec Output Pin3(*) -> Alt Analog Out
> > > [    6.737806] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Analog CPU Capture(*) -> codec0_in(*)
> > > [    6.737807] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Analog Codec Capture(*) -> Analog CPU Capture(*)
> > > [    6.737808] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Digital CPU Capture(*) -> codec1_in(*)
> > > [    6.737809] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Digital Codec Capture(*) -> Digital CPU Capture(*)
> > > [    6.737809] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Alt Analog CPU Capture(*) -> codec2_in(*)
> > > [    6.737810] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Alt Analog Codec Capture(*) -> Alt Analog CPU Capture(*)
> > > [    6.737811] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Analog CPU Playback(*) -> Analog Codec Playback(*)
> > > [    6.737811] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route codec0_out(*) -> Analog CPU Playback(*)
> > > [    6.737812] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Digital CPU Playback(*) -> Digital Codec Playback(*)
> > > [    6.737813] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route codec1_out(*) -> Digital CPU Playback(*)
> > > [    6.737813] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route Alt Analog CPU Playback(*) -> Alt Analog Codec Playback(*)
> > > [    6.737814] skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: Failed =
to add route codec2_out(*) -> Alt Analog CPU Playback(*)
> > > [    6.737815]  Analog Playback and Capture: fail to add hda routes, =
ret -19
> > > [    6.737815]  Analog Playback and Capture: ASoC error (-19): at snd=
_soc_link_init() on Analog Playback and Capture
> >
> >
> >
> >
