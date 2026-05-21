Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615BF381B14
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 10:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358324; cv=none; b=hFmfHN1CXUPyjLQW5cwnqGF1wuS9xtwbfrl06aXwgrLwSHfueY7H4jJEIc5+8piGBLhzONF0JzK92pLTrpc7LEC1LAI8elaO6D8aFHV8xyS21Mts2m/2cpDwhWf3XBMhFYxbmukJ3QO9X93rKWX8GXsHOtRnZzLijC819yeQdEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358324; c=relaxed/simple;
	bh=rrGDEbo1sVYzQXCzMv8CMyTVJvXHI2TtqATu+5v2nsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tqFRiJXMz3inri6DD1uOxzu9u6Lu+npwdeTl1Mvk3wNLUX0KLIJlnaL5+lWEE/JwimojbWyEWyyC6IMT9ubMQ+lvFpwjo0g9jQl9kQSBy8/KdOIC2l0lx42dzRU40z103y3s9Y+yHW/95WoifdjTRR1O7k08GyXa/ymUWcyv4ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=k5g9sdwa; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="k5g9sdwa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=W0lVCJ57lp8eSl4n++8tku/93R/AxgWm/Q68JK/mtuA=; b=k5g9sdwa+wZ/amnSCpVVf4gzzH
	gVm3YBJZHR8P2KTP1wgkXpfA/s+FKE1PLHcoiuUNNwZ6RvgPCOEo3bhjkyRWWZ7fVqiR1FIXdcqWp
	MopqAr11cz93s/skKiEl+5zGtq/l3+xjRrpXUrO0Ik4/gJPSFMu0Vj8RjJx4wQCyKdo5q7k723M1B
	2bNRVd3Cfse/H8TrEesaQ/FL/n3cfpzJujm/op2CX5mwDCYYFuCQDHq1hSCVJMP53a1eGqYR+0G8j
	iDtqKXJwfJCkjxHxZYDeMDy22Caef44AixoRrEqgeQfSozWYJ9krtIhRHEd/lzQHZSP5qNGnidf8o
	TU6pJTEA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQ0Nh-000DhX-2O;
	Thu, 21 May 2026 12:11:58 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wQ0Ni-000AjH-0T;
	Thu, 21 May 2026 12:11:57 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
 kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
Date: Thu, 21 May 2026 12:11:56 +0200
Message-ID: <6456213.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <77942519-5c7b-48ae-a709-6529d0577e98@intel.com>
References:
 <20260430140752.766130-1-cezary.rojewski@intel.com>
 <3949821.kQq0lBPeGt@steina-w>
 <77942519-5c7b-48ae-a709-6529d0577e98@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28007/Thu May 21 08:26:28 2026)

Am Donnerstag, 21. Mai 2026, 10:13:45 CEST schrieb Cezary Rojewski:
> On 5/21/2026 8:42 AM, Alexander Stein wrote:
> > Hi Cezary,
> >=20
> > thanks for the quick reply.
>=20
> ...
>=20
> >> Sorry to hear about the problem. To really see what's going on it would
> >> be good to attach the entire dmesg with:
> >>
> >> options snd_soc_core dyndbg=3D=3Dpmf
> >=20
> > I disabled HDMI and xcvr audio, as these are separate sound devices, to=
 not
> > clobber dmesg. Here is the excerpt from dmesg including the first and l=
ast
> > snd_soc_core message:
> > --8<--
>=20
> ...
>=20
> > snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-0018: Playb=
ack -> Left DAC
> > snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-0018: Playb=
ack -> Right DAC
> > snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-0018: Right=
 ADC -> Capture
> > snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-0018: Left =
ADC -> Capture
> > snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: connected DA=
I link 30c30000.sai:CPU-Playback -> tlv320aic32x4.1-0018:Playback
> > snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: connected DA=
I link tlv320aic32x4.1-0018:Capture -> 30c30000.sai:CPU-Capture
> > snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: connected DA=
I link 30c30000.sai:CPU-Playback -> tlv320aic32x4.1-0018:Playback
> > snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: connected DA=
I link tlv320aic32x4.1-0018:Capture -> 30c30000.sai:CPU-Capture
> > tlv320aic32x4 1-0018: ASoC error (-22): at snd_soc_dai_set_sysclk() on =
tlv320aic32x4-hifi
> > fsl-asoc-card sound: failed to set sysclk in fsl_asoc_card_late_probe
> > fsl-asoc-card sound: ASoC error (-22): at snd_soc_card_late_probe() on =
tqm-tlv320aic32
> > snd_soc_core:snd_soc_register_dai: fsl-xcvr 30cc0000.xcvr: ASoC: Regist=
ered DAI '30cc0000.xcvr'
> > snd_soc_core:snd_soc_register_dai: hdmi-audio-codec hdmi-audio-codec.1:=
 ASoC: Registered DAI 'i2s-hifi'
> > --8<--
> >=20
> >=20
> >> Now, listing the clocks won't help here unfortunately. The patch works
> >> on the component-level, clock details do not interest it. Also, could
> >> you specify the scenario? Is just a simple platform boot causing the
> >> problem -or- do you perform some specific test steps to reproduce?
> >=20
> > There is no specific scenario, just booting the board causes this error
> > during probe.
> Thank you for the confirmation.
>=20
> I've forgotten to mention - please also attach the equivalnet but from=20
> the system running the previous kernel (one that causes no trouble).
> Now, would it be possible to receive the excerpts as attachments? The=20
> timestamps are also welcome - in the above snapshop, all of them are cut=
=20
> off.

I stripped the timestamps deliberately, people told me it's just noise.
But here we go

7.1.0-rc3-00101-g56ba969925ac (works)
[   14.960029] snd_soc_core:snd_soc_register_dai: faux_driver snd-soc-dummy=
: ASoC: Registered DAI 'snd-soc-dummy-dai'
[   14.961501] EDAC MC: ECC not enabled
[   14.961521] EDAC DEBUG: edac_mc_free:=20
[   15.064506] imx8mp-dw-hdmi-tx 32fd8000.hdmi: bound 32fc4800.audio-bridge=
 (ops imx8mp_hdmi_pai_ops [imx8mp_hdmi_pai])
[   15.064648] imx8mp-dw-hdmi-tx 32fd8000.hdmi: Detected HDMI TX controller=
 v2.13a with HDCP (SAMSUNG HDMI TX PHY)
[   15.072889] imx8mp-dw-hdmi-tx 32fd8000.hdmi: registered DesignWare HDMI =
I2C bus driver
[   15.121803] snd_soc_core:snd_soc_register_dai: tlv320aic32x4 1-0018: ASo=
C: Registered DAI 'tlv320aic32x4-hifi'
[   15.123446] dw100 32e30000.dwe: dw100 v4l2 m2m registered as /dev/video0
[   15.128638] [drm] Initialized imx-lcdif 1.0.0 for 32fc6000.display-contr=
oller on minor 1
[   15.128724] imx-lcdif 32fc6000.display-controller: [drm] Cannot find any=
 crtc or sizes
[   15.166943] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   15.166979] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.167011] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   15.167024] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   15.217490] usb 1-1: new high-speed USB device number 2 using xhci-hcd
[   15.339043] hantro-vpu 38300000.video-codec: registered nxp,imx8mm-vpu-g=
1-dec as /dev/video1
[   15.340841] hantro-vpu 38310000.video-codec: registered nxp,imx8mq-vpu-g=
2-dec as /dev/video2
[   15.341111] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   15.341140] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.341166] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   15.341203] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   15.342263] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   15.342309] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.342317] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   15.342330] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   15.404980] TI DP83867 30be0000.ethernet-1:00: attached PHY driver (mii_=
bus:phy_addr=3D30be0000.ethernet-1:00, irq=3D131)
[   15.412128] hub 1-1:1.0: USB hub found
[   15.412227] hub 1-1:1.0: 4 ports detected
[   15.474418] usb 2-1: new SuperSpeed USB device number 2 using xhci-hcd
[   15.476172] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   15.476234] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.476259] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   15.476273] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   15.521980] hub 2-1:1.0: USB hub found
[   15.522092] hub 2-1:1.0: 4 ports detected
[   15.547396] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   15.547424] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.547432] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   15.547440] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   15.604694] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   15.604824] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.604857] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   15.604870] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   15.689691] snd_soc_core:snd_soc_register_dai: fsl-aud2htx 30cb0000.aud2=
htx: ASoC: Registered DAI '30cb0000.aud2htx'
[   15.690994] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   15.692745] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.697628] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   15.697739] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   15.710917] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   15.710951] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.710978] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   15.710992] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   15.715166] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   15.715388] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.715448] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   15.715471] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   15.843744] snd_soc_core:snd_soc_register_dai: fsl-sai 30c30000.sai: ASo=
C: Registered DAI 'sai-tx-rx'
[   15.843776] snd_soc_core:snd_soc_register_dai: fsl-sai 30c30000.sai: ASo=
C: Registered DAI 'sai-tx'
[   15.844754] snd_soc_core:snd_soc_register_dai: fsl-sai 30c30000.sai: ASo=
C: Registered DAI 'sai-rx'
[   15.847549] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   15.847589] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.847612] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   15.861445] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi-ASRC-FE
[   15.861478] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.861617] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi-ASRC-FE
[   15.861640] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi-ASRC-FE
[   15.884578] snd_soc_core:snd_soc_register_dai: fsl-easrc 30c90000.easrc:=
 ASoC: Registered DAI '30c90000.easrc'
[   15.888542] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   15.888587] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.888612] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   15.888680] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi-ASRC-FE
[   15.888692] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.888699] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi-ASRC-FE
[   15.888739] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi-ASRC-BE
[   15.888751] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.888763] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi-ASRC-BE
[   15.888870] snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-sai 30c30000.=
sai: ASoC: adding CPU-Playback widget
[   15.888885] snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-sai 30c30000.=
sai: ASoC: adding CPU-Capture widget
[   15.888899] snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-sai 30c30000.=
sai: ASoC: adding SAI-Playback widget
[   15.888906] snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-sai 30c30000.=
sai: ASoC: adding SAI-Capture widget
[   15.889078] snd_soc_core:snd_soc_dapm_new_dai_widgets: tlv320aic32x4 1-0=
018: ASoC: adding Playback widget
[   15.889093] snd_soc_core:snd_soc_dapm_new_dai_widgets: tlv320aic32x4 1-0=
018: ASoC: adding Capture widget
[   15.997493] snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-easrc 30c9000=
0.easrc: ASoC: adding ASRC-Playback widget
[   15.997519] snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-easrc 30c9000=
0.easrc: ASoC: adding ASRC-Capture widget
[   16.002901] snd_soc_core:soc_create_pcm: fsl-asoc-card sound: ASoC: regi=
stered pcm #0 HiFi tlv320aic32x4-hifi-0
[   16.011059] snd_soc_core:soc_new_pcm: fsl-asoc-card sound: tlv320aic32x4=
=2Dhifi <-> sai-tx-rx mapping ok
[   16.011150] snd_soc_core:soc_create_pcm: fsl-asoc-card sound: ASoC: regi=
stered pcm #1 HiFi-ASRC-FE (*)
[   16.017612] snd_soc_core:soc_new_pcm: fsl-asoc-card sound: snd-soc-dummy=
=2Ddai <-> 30c90000.easrc mapping ok
[   16.020236] snd_soc_core:soc_create_pcm: fsl-asoc-card sound: ASoC: regi=
stered pcm #2 (HiFi-ASRC-BE)
[   16.020283] snd_soc_core:soc_new_pcm: fsl-asoc-card sound: tlv320aic32x4=
=2Dhifi <-> sai-tx-rx mapping ok
[   16.020306] snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-=
0018: Playback -> Left DAC
[   16.020318] snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-=
0018: Playback -> Right DAC
[   16.020329] snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-=
0018: Right ADC -> Capture
[   16.020338] snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-=
0018: Left ADC -> Capture
[   16.020349] snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: c=
onnected DAI link 30c30000.sai:CPU-Playback -> tlv320aic32x4.1-0018:Playback
[   16.020359] snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: c=
onnected DAI link tlv320aic32x4.1-0018:Capture -> 30c30000.sai:CPU-Capture
[   16.020369] snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: c=
onnected DAI link 30c30000.sai:CPU-Playback -> tlv320aic32x4.1-0018:Playback
[   16.020378] snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: c=
onnected DAI link tlv320aic32x4.1-0018:Capture -> 30c30000.sai:CPU-Capture
[   16.171201] snd_soc_core:snd_soc_register_dai: hdmi-audio-codec hdmi-aud=
io-codec.1: ASoC: Registered DAI 'i2s-hifi'

7.1.0-rc3-00102-g42d99857d6f0 (broken)
[   14.400390] snd_soc_core:snd_soc_register_dai: faux_driver snd-soc-dummy=
: ASoC: Registered DAI 'snd-soc-dummy-dai'
[   14.487096] hantro-vpu 38300000.video-codec: registered nxp,imx8mm-vpu-g=
1-dec as /dev/video1
[   14.488989] hantro-vpu 38310000.video-codec: registered nxp,imx8mq-vpu-g=
2-dec as /dev/video2
[   14.511119] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   14.511158] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   14.511184] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   14.511194] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   14.511210] snd_soc_core:snd_soc_register_dai: tlv320aic32x4 1-0018: ASo=
C: Registered DAI 'tlv320aic32x4-hifi'
[   14.511227] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   14.511235] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   14.511244] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   14.511252] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   14.550504] usb 1-1: new high-speed USB device number 2 using xhci-hcd
[   14.636061] TI DP83867 30be0000.ethernet-1:00: attached PHY driver (mii_=
bus:phy_addr=3D30be0000.ethernet-1:00, irq=3D131)
[   14.743400] hub 1-1:1.0: USB hub found
[   14.743503] hub 1-1:1.0: 4 ports detected
[   14.807178] usb 2-1: new SuperSpeed USB device number 2 using xhci-hcd
[   14.817480] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   14.817513] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   14.817542] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   14.817556] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   14.817577] snd_soc_core:snd_soc_register_dai: fsl-aud2htx 30cb0000.aud2=
htx: ASoC: Registered DAI '30cb0000.aud2htx'
[   14.817588] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   14.817596] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   14.817605] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   14.817612] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   14.858476] hub 2-1:1.0: USB hub found
[   14.858592] hub 2-1:1.0: 4 ports detected
[   14.926344] snd_soc_core:snd_soc_register_dai: fsl-easrc 30c90000.easrc:=
 ASoC: Registered DAI '30c90000.easrc'
[   14.926383] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   14.926389] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   14.926912] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   14.927047] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   14.927117] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   14.927202] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   14.927250] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   14.927294] snd_soc_core:soc_dai_link_sanity_check: fsl-asoc-card sound:=
 ASoC: Component (null) not found for link HiFi
[   15.073545] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   15.073683] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.073717] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   15.136499] fsl-asoc-card sound: ASoC: CPU DAI (null) not registered
[   15.136614] snd_soc_core:snd_soc_register_dai: fsl-sai 30c30000.sai: ASo=
C: Registered DAI 'sai-tx-rx'
[   15.139874] snd_soc_core:snd_soc_register_dai: fsl-sai 30c30000.sai: ASo=
C: Registered DAI 'sai-tx'
[   15.139928] snd_soc_core:snd_soc_register_dai: fsl-sai 30c30000.sai: ASo=
C: Registered DAI 'sai-rx'
[   15.139954] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi
[   15.139964] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.139976] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi
[   15.140074] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi-ASRC-FE
[   15.140085] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.140096] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi-ASRC-FE
[   15.140134] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound: dai_link HiFi-ASRC-BE
[   15.140147] snd_soc_core:snd_soc_compensate_channel_connection_map: fsl-=
asoc-card sound:   [0] cpu0 <-> codec0
[   15.140156] snd_soc_core:snd_soc_add_pcm_runtime: fsl-asoc-card sound: A=
SoC: binding HiFi-ASRC-BE
[   15.140318] snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-sai 30c30000.=
sai: ASoC: adding CPU-Playback widget
[   15.140337] snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-sai 30c30000.=
sai: ASoC: adding CPU-Capture widget
[   15.140346] snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-sai 30c30000.=
sai: ASoC: adding SAI-Playback widget
[   15.140356] snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-sai 30c30000.=
sai: ASoC: adding SAI-Capture widget
[   15.140596] snd_soc_core:snd_soc_dapm_new_dai_widgets: tlv320aic32x4 1-0=
018: ASoC: adding Playback widget
[   15.140622] snd_soc_core:snd_soc_dapm_new_dai_widgets: tlv320aic32x4 1-0=
018: ASoC: adding Capture widget
[   15.271414] Bluetooth: Core ver 2.22
[   15.271545] NET: Registered PF_BLUETOOTH protocol family
[   15.272201] Bluetooth: HCI device and connection manager initialized
[   15.272255] Bluetooth: HCI socket layer initialized
[   15.272268] Bluetooth: L2CAP socket layer initialized
[   15.272293] Bluetooth: SCO socket layer initialized
[   15.296872] snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-easrc 30c9000=
0.easrc: ASoC: adding ASRC-Playback widget
[   15.296900] snd_soc_core:snd_soc_dapm_new_dai_widgets: fsl-easrc 30c9000=
0.easrc: ASoC: adding ASRC-Capture widget
[   15.300069] snd_soc_core:soc_create_pcm: fsl-asoc-card sound: ASoC: regi=
stered pcm #0 HiFi tlv320aic32x4-hifi-0
[   15.317421] snd_soc_core:soc_new_pcm: fsl-asoc-card sound: tlv320aic32x4=
=2Dhifi <-> sai-tx-rx mapping ok
[   15.317583] snd_soc_core:soc_create_pcm: fsl-asoc-card sound: ASoC: regi=
stered pcm #1 HiFi-ASRC-FE (*)
[   15.331269] snd_soc_core:soc_new_pcm: fsl-asoc-card sound: snd-soc-dummy=
=2Ddai <-> 30c90000.easrc mapping ok
[   15.345851] snd_soc_core:soc_create_pcm: fsl-asoc-card sound: ASoC: regi=
stered pcm #2 (HiFi-ASRC-BE)
[   15.345882] snd_soc_core:soc_new_pcm: fsl-asoc-card sound: tlv320aic32x4=
=2Dhifi <-> sai-tx-rx mapping ok
[   15.346065] snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-=
0018: Playback -> Left DAC
[   15.346088] snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-=
0018: Playback -> Right DAC
[   15.346104] snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-=
0018: Right ADC -> Capture
[   15.346116] snd_soc_core:snd_soc_dapm_link_dai_widgets: tlv320aic32x4 1-=
0018: Left ADC -> Capture
[   15.346132] snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: c=
onnected DAI link 30c30000.sai:CPU-Playback -> tlv320aic32x4.1-0018:Playback
[   15.346222] snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: c=
onnected DAI link tlv320aic32x4.1-0018:Capture -> 30c30000.sai:CPU-Capture
[   15.346239] snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: c=
onnected DAI link 30c30000.sai:CPU-Playback -> tlv320aic32x4.1-0018:Playback
[   15.346251] snd_soc_core:dapm_connect_dai_routes: fsl-asoc-card sound: c=
onnected DAI link tlv320aic32x4.1-0018:Capture -> 30c30000.sai:CPU-Capture
[   15.360319] tlv320aic32x4 1-0018: ASoC error (-22): at snd_soc_dai_set_s=
ysclk() on tlv320aic32x4-hifi
[   15.360342] fsl-asoc-card sound: failed to set sysclk in fsl_asoc_card_l=
ate_probe
[   15.360360] fsl-asoc-card sound: ASoC error (-22): at snd_soc_card_late_=
probe() on tqm-tlv320aic32
[   15.558546] snd_soc_core:snd_soc_register_dai: hdmi-audio-codec hdmi-aud=
io-codec.1: ASoC: Registered DAI 'i2s-hifi'

Thanks and best regards
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


