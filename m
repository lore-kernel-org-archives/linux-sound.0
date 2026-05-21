Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52841E51E0
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 06:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779345768; cv=none; b=HLi+DXcyuu8Zh+4P3yIerfy/3QutKfwLJTpBJR7cU7lxMZXDEUCTRFgkZC0VwsdSBBYzpjgqIk1tSj4su+x8A/UIC99pjT+2WJBTDv0gE/Niijx//FoebnyyqoyCyaftXMAKZmi2G83lB5uhMeiuq/wZr86RVecv2mipW+oNf18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779345768; c=relaxed/simple;
	bh=fPTWbVZ03ph+eKZU4Xdn/cTDzoUa94Q+o0mD0O3rDmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pBJUXBlF3Wv6yHNukZwQXI7ZmNOt4xkXIYhho47t3mLseF2dRaP2Rotmp/COhCAwRkc5+LryPl00LMl9ZGiBRJxNkorLKK2pAHHFkTGpvBNQNaxwem/fvyhCi73Dm1C2htdDDrH1IGe1al6W5drZmkGv5dl9gojLnyjkDUTZiwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=qHrbyG88; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="qHrbyG88"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=H7trw++6QR5hp6XmwUr3i+Ki44ernB6k7QLZ5GEN95s=; b=qHrbyG88IRtwO9tcRqV6YaeSE+
	cEwS5y2SnhosGLkfe+PU4eG7l5FlY33gCTRu4g/ZdTM6NuTm6eeQReEySgT/hsDpf2qoOlGMqdgBh
	VOqwFEuDGIrucqH/4mvI4D6+Jlr5IiVRNKd1wywRzP0fSNtB4qW7O2npS+FRvJf2rksuMp5nQHzS4
	rLmYZQySFhf/klh4ug6fxxUwIzkLi+WfnE8pKPivjuLK6fF+2sDuj/YoywBJ6cP6O9rerG2fLsu9N
	mxFO5dUvSdJaC+DUxdHwDbgoHvuNCOhwGpDAkkKe9FBFW5g9pRrcEP4Ev1ecg38SmEYOE8spoddLv
	tmw9vkag==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wPx76-000HYu-0X;
	Thu, 21 May 2026 08:42:36 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wPx76-0009kD-2K;
	Thu, 21 May 2026 08:42:36 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
 kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
Date: Thu, 21 May 2026 08:42:35 +0200
Message-ID: <3949821.kQq0lBPeGt@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <fd995eb5-31d0-4037-b5d8-2ef3a75ccb95@intel.com>
References:
 <20260430140752.766130-1-cezary.rojewski@intel.com>
 <3045975.e9J7NaK4W3@steina-w>
 <fd995eb5-31d0-4037-b5d8-2ef3a75ccb95@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28006/Wed May 20 08:25:19 2026)

Hi Cezary,

thanks for the quick reply.

Am Mittwoch, 20. Mai 2026, 12:33:14 CEST schrieb Cezary Rojewski:
> On 5/20/2026 11:55 AM, Alexander Stein wrote:
> > Hi,
>=20
> ...
>=20
> > This showed up in linux-next and causes a regression on my imx8mp-based
> > platform (imx8mp-tqma8mpql-mba8mpxl.dts).
> >=20
> > On 7.1.0-rc3-00101-g56ba969925ac eveythings works as expected and sound
> > cards are registered.
> >=20
> > On 7.1.0-rc3-00102-g42d99857d6f0 I'm getting these messages/errors:
> >=20
> > fsl-asoc-card sound: ASoC: CPU DAI (null) not registered
> > tlv320aic32x4 1-0018: ASoC error (-22): at snd_soc_dai_set_sysclk() on =
tlv320aic32x4-hifi
> > fsl-asoc-card sound: failed to set sysclk in fsl_asoc_card_late_probe
> > fsl-asoc-card sound: ASoC error (-22): at snd_soc_card_late_probe() on =
tqm-tlv320aic32
> >=20
> > The clock tree looks like this:
> > audio_pll1_ref_sel               0       0        0        24000000
> >     audio_pll1                    0       0        0        393216000
> >        audio_pll1_bypass          0       0        0        393216000
> >           audio_pll1_out          0       0        0        393216000
> >              sai3                 0       0        0        12288000
> >                 sai3_mclk1_sel    0       0        0        12288000
> >                    sai3_mclk1_cg  0       0        0        12288000
> >                       pll         0       0        0        49152000
> >                          codec_clkin 0       0        0        49152000
> >                             nadc  0       0        0        49152000
> >                                madc 0       0        0        49152000
> >                             ndac  0       0        0        49152000
> >                                mdac 0       0        0        49152000
> >                                   bdiv 0       0        0        491520=
00
> >=20
> > Adding some debug output the offending call is
> > tlv320aic32x4 1-0018: set sai3_mclk1_cg to freq: 24000000
> >=20
> > Apparently this was not happening before.
> Hello Alexander,
>=20
> Sorry to hear about the problem. To really see what's going on it would=20
> be good to attach the entire dmesg with:
>=20
> options snd_soc_core dyndbg=3D=3Dpmf

I disabled HDMI and xcvr audio, as these are separate sound devices, to not
clobber dmesg. Here is the excerpt from dmesg including the first and last
snd_soc_core message:
=2D-8<--
snd_soc_core:snd_soc_register_dai: faux_driver snd-soc-dummy: ASoC: Registe=
red DAI 'snd-soc-dummy-dai'
hub 1-1:1.0: USB hub found
hub 1-1:1.0: 4 ports detected
usb 2-1: new SuperSpeed USB device number 2 using xhci-hcd
TI DP83867 30be0000.ethernet-1:00: attached PHY driver (mii_bus:phy_addr=3D=
30be0000.ethernet-1:00, irq=3D134)
hantro-vpu 38300000.video-codec: registered nxp,imx8mm-vpu-g1-dec as /dev/v=
ideo1
hub 2-1:1.0: USB hub found
hub 2-1:1.0: 4 ports detected
snd_soc_core:snd_soc_register_dai: tlv320aic32x4 1-0018: ASoC: Registered D=
AI 'tlv320aic32x4-hifi'
hantro-vpu 38310000.video-codec: registered nxp,imx8mq-vpu-g2-dec as /dev/v=
ideo2
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
: dai_link HiFi
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
:   [0] cpu0 <-> codec0
snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: ASoC: binding Hi=
=46i
snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound: ASoC: Componen=
t (null) not found for link HiFi
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
: dai_link HiFi
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
:   [0] cpu0 <-> codec0
snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: ASoC: binding Hi=
=46i
snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound: ASoC: Componen=
t (null) not found for link HiFi
snd_soc_core:snd_soc_register_dai: fsl-aud2htx 30cb0000.aud2htx: ASoC: Regi=
stered DAI '30cb0000.aud2htx'
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
: dai_link HiFi
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
:   [0] cpu0 <-> codec0
snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: ASoC: binding Hi=
=46i
snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound: ASoC: Componen=
t (null) not found for link HiFi
snd_soc_core:snd_soc_register_dai: fsl-easrc 30c90000.easrc: ASoC: Register=
ed DAI '30c90000.easrc'
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
: dai_link HiFi
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
:   [0] cpu0 <-> codec0
snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: ASoC: binding Hi=
=46i
snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound: ASoC: Componen=
t (null) not found for link HiFi
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
: dai_link HiFi
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
:   [0] cpu0 <-> codec0
snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: ASoC: binding Hi=
=46i
snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound: ASoC: Componen=
t (null) not found for link HiFi
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
: dai_link HiFi
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
:   [0] cpu0 <-> codec0
snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: ASoC: binding Hi=
=46i
fsl-asoc-card sound: ASoC: CPU DAI (null) not registered
snd_soc_core:snd_soc_register_dai: fsl-sai 30c30000.sai: ASoC: Registered D=
AI 'sai-tx-rx'
snd_soc_core:snd_soc_register_dai: fsl-sai 30c30000.sai: ASoC: Registered D=
AI 'sai-tx'
snd_soc_core:snd_soc_register_dai: fsl-sai 30c30000.sai: ASoC: Registered D=
AI 'sai-rx'
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
: dai_link HiFi
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
:   [0] cpu0 <-> codec0
snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: ASoC: binding Hi=
=46i
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
: dai_link HiFi-ASRC-FE
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
:   [0] cpu0 <-> codec0
snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: ASoC: binding Hi=
=46i-ASRC-FE
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
: dai_link HiFi-ASRC-BE
snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-asoc-card sound=
:   [0] cpu0 <-> codec0
snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: ASoC: binding Hi=
=46i-ASRC-BE
snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-sai 30c30000.sai: ASoC: addi=
ng CPU-Playback widget
snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-sai 30c30000.sai: ASoC: addi=
ng CPU-Capture widget
snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-sai 30c30000.sai: ASoC: addi=
ng SAI-Playback widget
snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-sai 30c30000.sai: ASoC: addi=
ng SAI-Capture widget
snd_soc_core:snd_soc_dapm_new_dai_widgets: tlv320aic32x4 1-0018: ASoC: addi=
ng Playback widget
snd_soc_core:snd_soc_dapm_new_dai_widgets: tlv320aic32x4 1-0018: ASoC: addi=
ng Capture widget
snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-easrc 30c90000.easrc: ASoC: =
adding ASRC-Playback widget
snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-easrc 30c90000.easrc: ASoC: =
adding ASRC-Capture widget
snd_soc_core:soc_create_pcm: fsl-asoc-card sound: ASoC: registered pcm #0 H=
iFi tlv320aic32x4-hifi-0
snd_soc_core:soc_new_pcm: fsl-asoc-card sound: tlv320aic32x4-hifi <-> sai-t=
x-rx mapping ok
snd_soc_core:soc_create_pcm: fsl-asoc-card sound: ASoC: registered pcm #1 H=
iFi-ASRC-FE (*)
snd_soc_core:soc_new_pcm: fsl-asoc-card sound: snd-soc-dummy-dai <-> 30c900=
00.easrc mapping ok
snd_soc_core:soc_create_pcm: fsl-asoc-card sound: ASoC: registered pcm #2 (=
HiFi-ASRC-BE)
snd_soc_core:soc_new_pcm: fsl-asoc-card sound: tlv320aic32x4-hifi <-> sai-t=
x-rx mapping ok
snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-0018: Playback =
=2D> Left DAC
snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-0018: Playback =
=2D> Right DAC
snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-0018: Right ADC=
 -> Capture
snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-0018: Left ADC =
=2D> Capture
snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: connected DAI li=
nk 30c30000.sai:CPU-Playback -> tlv320aic32x4.1-0018:Playback
snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: connected DAI li=
nk tlv320aic32x4.1-0018:Capture -> 30c30000.sai:CPU-Capture
snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: connected DAI li=
nk 30c30000.sai:CPU-Playback -> tlv320aic32x4.1-0018:Playback
snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: connected DAI li=
nk tlv320aic32x4.1-0018:Capture -> 30c30000.sai:CPU-Capture
tlv320aic32x4 1-0018: ASoC error (-22): at snd_soc_dai_set_sysclk() on tlv3=
20aic32x4-hifi
fsl-asoc-card sound: failed to set sysclk in fsl_asoc_card_late_probe
fsl-asoc-card sound: ASoC error (-22): at snd_soc_card_late_probe() on tqm-=
tlv320aic32
snd_soc_core:snd_soc_register_dai: fsl-xcvr 30cc0000.xcvr: ASoC: Registered=
 DAI '30cc0000.xcvr'
snd_soc_core:snd_soc_register_dai: hdmi-audio-codec hdmi-audio-codec.1: ASo=
C: Registered DAI 'i2s-hifi'
=2D-8<--


> Now, listing the clocks won't help here unfortunately. The patch works=20
> on the component-level, clock details do not interest it. Also, could=20
> you specify the scenario? Is just a simple platform boot causing the=20
> problem -or- do you perform some specific test steps to reproduce?

There is no specific scenario, just booting the board causes this error
during probe.

Thanks and best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


