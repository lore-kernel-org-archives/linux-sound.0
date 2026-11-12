Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.187.100.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489643;
	b=jp16bN+JhYPzeIeUiR1uyYunfVxtrhOr6m39VPh+RNxnzNtAtFciMtDUBavsQBOVFn/r
	 ADzFtycK+Ghm6eTDQGFvlwUOhiZ6VDjpPolSmZS11OTUkX020QFLQjzyxECesZMQp0VkQ
	 BvGLdpYQ7CAQ31IKO7mFpQKBSiybmTAvYgONvM0DqdG4+SR1CxgG/qioZobzRSRQwfSfl
	 dXrIq47czOzRHdEU9RNo3YoCymhtYOcjtDX1PtxxFJDVD/6me1U8LhNchV+GvX7GYd71x
	 1LGGWBaDgsJf4amZQeMDYOYkTxkOQEoSQk2VK+uCoAlH6JHl7oN1uvYj62DeOqQ9AaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489643;
	h=DMARC-Filter:Received:DKIM-Filter:From:To:Cc:Subject:In-Reply-To:
	 References:Sender:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dhcjapdHYVXZmRElCwJ9eubN2AWNyCGxi6c3PmLyQ24=;
	b=265zF1luxJpLB9eg/XeH8BQVIDW3/xqkaFJLZeCridKDZSF7pw9LHC08bLnWlUi/H+s5
	 c7TL5Z7czQhYK0N4chxKskCdecFWe2Gq2XD6XKunADUJAcj3VDiuc0GqBkZ6Fvx+sQUlV
	 3xf1Ck0BixVk14MRbpyGO4zxIXGfaTLWhIXastjKIO8KXYaBLlBrj2Z2iJ+HD9F+Rhu3u
	 pmZymumzAM717GoMWtO2HdsjS62PzipMoJVPxvk2k5JRsXEzWRTCT2nQlSjCQgkQQjIAl
	 da0ZXY60YiFO+BnhS36HtBapS+i8RVmTsOgpEZkYJw4AwtdGnUSSOU7ks23JKbyh7pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=piap.pl;
	spf=pass smtp.mailfrom=piap.pl;
	arc=none smtp.remote-ip=195.187.100.5
Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDF5606A8BF
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 13:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CDF5606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=piap.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=piap.pl
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id B05FBC3F2A4F;
	Thu, 12 Nov 2026 14:20:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl B05FBC3F2A4F
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org,  patches@opensource.cirrus.com, Richard
 Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: NULL ptr dereference in cs42l43/cs35l56 on Lenovo Yoga 7 Slim
 laptop
In-Reply-To: <avRD4MM8YLzPht/c@opensource.cirrus.com> (Charles Keepax's
	message of "Wed, 11 Nov 2026 10:30:56 +0000")
References: <m31p8sx403.fsf@t19.piap.pl>
	<avRBU4NbuLEyygl3@opensource.cirrus.com>
	<avRD4MM8YLzPht/c@opensource.cirrus.com>
Sender: khalasa@piap.pl
Date: Thu, 12 Nov 2026 14:20:31 +0100
Message-ID: <m3eccquqxs.fsf@t19.piap.pl>
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

Charles, Richard,

Charles Keepax <ckeepax@opensource.cirrus.com> writes:

> Having a look around, I also found this patch:
>
> https://lore.kernel.org/all/20261109102536.357134-1-ghidoliemanuele@gmail=
.com/

Applied it over latest 7.4.0-rc2+. Also installed
linux-firmware-misc_20260915.git1522c78a-0ubuntu1_all.deb as their LTS
version lacks *17aa383c* files.

The NULL ptr dereference is gone, but

$ cat /proc/asound/cards
 0 [sofsoundwire   ]: sof-soundwire - sof-soundwire
                      LENOVO-83R0-YogaSlim714ILL11-LNVNB161216

$ cat /proc/asound/pcm
00-02: Speaker (*) :  : playback 1
00-05: HDMI1 (*) : HDMI 1 : playback 1
00-06: HDMI2 (*) : HDMI 2 : playback 1
00-07: HDMI3 (*) : HDMI 3 : playback 1
00-10: DMIC Raw (*) :  : capture 1

and:
sof-audio-pci-intel-lnl 0000:00:1f.3: bound 0000:00:02.0 (ops intel_audio_c=
omponent_bind_ops [xe])
sof-audio-pci-intel-lnl 0000:00:1f.3: use msi interrupt mode
sof-audio-pci-intel-lnl 0000:00:1f.3: No SoundWire machine driver found for=
 the ACPI-reported configuration:
sof-audio-pci-intel-lnl 0000:00:1f.3: link 0 mfg_id 0x01fa part_id 0x4243 v=
ersion 0x3
sof-audio-pci-intel-lnl 0000:00:1f.3: Use SoundWire default machine driver =
with function topologies
sof-audio-pci-intel-lnl 0000:00:1f.3: hda codecs found, mask 4
sof-audio-pci-intel-lnl 0000:00:1f.3: NHLT device BT(0) detected, ssp_mask =
0x4
sof-audio-pci-intel-lnl 0000:00:1f.3: BT link detected in NHLT tables: 0x4
sof-audio-pci-intel-lnl 0000:00:1f.3: DMICs detected in NHLT tables: 4
sof-audio-pci-intel-lnl 0000:00:1f.3: Loaded FW: intel/sof-ipc4/lnl/sof-lnl=
.ri, sha256: e72726da2a91c7869e37ec02d280a4348c5600d25d158c2bfc1018fc6ef5a8=
b1
sof-audio-pci-intel-lnl 0000:00:1f.3: Firmware paths/files for ipc type 1:
sof-audio-pci-intel-lnl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/ln=
l/sof-lnl.ri
sof-audio-pci-intel-lnl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-li=
b/lnl
sof-audio-pci-intel-lnl 0000:00:1f.3:  Topology file:     function topologi=
es
cs42l43 sdw:0:0:01fa:4243:01: devid: 0x042a43, rev: 0xa1, otp: 0x03
sof-audio-pci-intel-lnl 0000:00:1f.3: Loaded FW: intel/sof-ipc4/lnl/sof-lnl=
.ri, sha256: e72726da2a91c7869e37ec02d280a4348c5600d25d158c2bfc1018fc6ef5a8=
b1
sof-audio-pci-intel-lnl 0000:00:1f.3: Loaded firmware library: ADSPFW, vers=
ion: 2.14.1.1
cs42l43 sdw:0:0:01fa:4243:01: Loaded FW: cs42l43.bin, sha256: 8708742e09d2d=
392d8e2731f9ba06fdb73486362e4df576c0b32c34b1cf825ce
Adding alias for supply vdd-amp,(null) -> vdd-amp,sdw:0:0:01fa:4243:01
xe 0000:00:02.0: [drm] Tile0: GT1: found GSC cv104.1.0
cs35l56_spi_probe
cs35l56_common_probe
cs35l56_common_probe: about to call cs35l56_init()
cs35l56 spi-cs35l56-left: Cirrus Logic CS35L56 Rev B0 OTP3 fw:3.4.4 (patche=
d=3D0)
sof-audio-pci-intel-lnl 0000:00:1f.3: Booted firmware version: 2.14.1.1
cs35l56_common_probe: about to call cs35l56_component_register()
cs35l56_component_register
cs35l56_spi_probe
cs35l56_common_probe
cs35l56_common_probe: about to call cs35l56_init()
cs35l56 spi-cs35l56-right: Cirrus Logic CS35L56 Rev B0 OTP3 fw:3.4.4 (patch=
ed=3D0)
cs35l56_common_probe: about to call cs35l56_component_register()
cs35l56_component_register
sof_sdw sof_sdw: Loaded FW: intel/sof-ipc4-tplg/sof-sdca-1amp-id2.tplg, sha=
256: b92f8736b0b3557c4030a3a82cd31d47a244589fa3b91ad8b3d4c469ebba27a7
sof_sdw sof_sdw: Loaded FW: intel/sof-ipc4-tplg/sof-lnl-dmic-4ch-id3.tplg, =
sha256: 79bd0bb781e8e30d5594a10d7c37825fc4356b2ac63d5d444c2e485b23ccf8f5
sof_sdw sof_sdw: Loaded FW: intel/sof-ipc4-tplg/sof-hdmi-pcm5-id5.tplg, sha=
256: fe798c5e0e927b7bb68349a21b50114b1832254a6f851c2e71a398710970273a
sof_sdw sof_sdw: Failed to open topology file: intel/sof-ipc4-tplg/sof-lnl-=
ssp2-bt-id8.tplg, you might need to
sof_sdw sof_sdw: download it from https://github.com/thesofproject/sof-bin/
sof-audio-pci-intel-lnl 0000:00:1f.3: Using function topologies instead int=
el/sof-ipc4-tplg/sof-lnl-dummy-4ch.tplg
sof-audio-pci-intel-lnl 0000:00:1f.3: loading topology 0: intel/sof-ipc4-tp=
lg/sof-sdca-1amp-id2.tplg
sof-audio-pci-intel-lnl 0000:00:1f.3: Loaded FW: intel/sof-ipc4-tplg/sof-sd=
ca-1amp-id2.tplg, sha256: b92f8736b0b3557c4030a3a82cd31d47a244589fa3b91ad8b=
3d4c469ebba27a7
sof-audio-pci-intel-lnl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
cs35l56 spi-cs35l56-right: Loaded FW: cirrus/cs35l56-b0-dsp1-misc-17aa383c-=
spkid0.wmfw, sha256: 01ea4865a3e85fe68a7021b9bf682541112c026a394b8355138e4b=
246faf0158
sof_sdw sof_sdw: ASoC: Parent card not yet available, widget card binding d=
eferred
sof-audio-pci-intel-lnl 0000:00:1f.3: loading topology 1: intel/sof-ipc4-tp=
lg/sof-lnl-dmic-4ch-id3.tplg
sof-audio-pci-intel-lnl 0000:00:1f.3: Loaded FW: intel/sof-ipc4-tplg/sof-ln=
l-dmic-4ch-id3.tplg, sha256: 79bd0bb781e8e30d5594a10d7c37825fc4356b2ac63d5d=
444c2e485b23ccf8f5
sof-audio-pci-intel-lnl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
sof_sdw sof_sdw: ASoC: Parent card not yet available, widget card binding d=
eferred
sof-audio-pci-intel-lnl 0000:00:1f.3: loading topology 2: intel/sof-ipc4-tp=
lg/sof-hdmi-pcm5-id5.tplg
sof-audio-pci-intel-lnl 0000:00:1f.3: Loaded FW: intel/sof-ipc4-tplg/sof-hd=
mi-pcm5-id5.tplg, sha256: fe798c5e0e927b7bb68349a21b50114b1832254a6f851c2e7=
1a398710970273a
sof-audio-pci-intel-lnl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
cs35l56 spi-cs35l56-right: Loaded FW: cirrus/cs35l56-b0-dsp1-misc-17aa383c-=
spkid0-ampr.bin, sha256: 2aa99330b228d19dc65d98fc2587e3ec9330833a94494a53fb=
ae8c5e35df80c5
cs35l56 spi-cs35l56-right: DSP1: cirrus/cs35l56-b0-dsp1-misc-17aa383c-spkid=
0.wmfw: format 3 timestamp 0x686474f4
cs35l56 spi-cs35l56-right: DSP1: cirrus/cs35l56-b0-dsp1-misc-17aa383c-spkid=
0.wmfw: Tue 01 Jul 2025 18:53:24 Central Daylight Time
sof_sdw sof_sdw: ASoC: Parent card not yet available, widget card binding d=
eferred
sof-audio-pci-intel-lnl 0000:00:1f.3: Loaded FW: intel/sof-ipc4-lib/lnl/B36=
EE4DA-006F-47F9-A06D-FECBE2D8B6CE.bin, sha256: bd7a59d37802d8acf6bc197c7004=
b6b25567c0cf955370089e86ada122373781
sof-audio-pci-intel-lnl 0000:00:1f.3: Loaded firmware library: ADSPFW, vers=
ion: 2.14.1.1
cs35l56 spi-cs35l56-left: Loaded FW: cirrus/cs35l56-b0-dsp1-misc-17aa383c-s=
pkid0.wmfw, sha256: 01ea4865a3e85fe68a7021b9bf682541112c026a394b8355138e4b2=
46faf0158
cs35l56 spi-cs35l56-left: Loaded FW: cirrus/cs35l56-b0-dsp1-misc-17aa383c-s=
pkid0-ampl.bin, sha256: a79325f6a87d30817625e36a491c6b4dc3dc90e9b4fbe6b45fc=
774fa759972c9
cs35l56 spi-cs35l56-left: DSP1: cirrus/cs35l56-b0-dsp1-misc-17aa383c-spkid0=
.wmfw: format 3 timestamp 0x686474f4
cs35l56 spi-cs35l56-left: DSP1: cirrus/cs35l56-b0-dsp1-misc-17aa383c-spkid0=
.wmfw: Tue 01 Jul 2025 18:53:24 Central Daylight Time
snd_soc_card_get_kcontrol(): name: AMPL Speaker Volume
cs35l56 spi-cs35l56-right: DSP1: Firmware: 1a00d6 vendor: 0x2 v3.13.3, 41 a=
lgorithms
cs35l56 spi-cs35l56-right: DSP1: cirrus/cs35l56-b0-dsp1-misc-17aa383c-spkid=
0-ampr.bin (v1): v3.13.3
cs35l56 spi-cs35l56-right: DSP1: Misc: C:\Cirrus\Project\Lenovo_Slim7_14_Ge=
n11_LLS7L\Smart_PA_Tuning\Initial_Tuning\Version1.0_Remove_CF\Lo
cs35l56 spi-cs35l56-left: DSP1: Firmware: 1a00d6 vendor: 0x2 v3.13.3, 41 al=
gorithms
cs35l56 spi-cs35l56-left: DSP1: cirrus/cs35l56-b0-dsp1-misc-17aa383c-spkid0=
-ampl.bin (v1): v3.13.3
cs35l56 spi-cs35l56-left: DSP1: Misc: C:\Cirrus\Project\Lenovo_Slim7_14_Gen=
11_LLS7L\Smart_PA_Tuning\Initial_Tuning\Version1.0_Remove_CF\Lo
cs35l56 spi-cs35l56-right: Calibration applied
cs35l56 spi-cs35l56-right: Tuning PID: 0x383c, SID: 0x1, TID: 0x1a7bf2
cs35l56 spi-cs35l56-left: Calibration applied
cs35l56 spi-cs35l56-left: Tuning PID: 0x383c, SID: 0x0, TID: 0xbed7ef
snd_soc_card_get_kcontrol(): name: AMPR Speaker Volume
snd_soc_card_get_kcontrol(): name: cs42l43 Speaker Digital Volume
sof_sdw sof_sdw: Setting CS42L43 Speaker volume limit to 128
sof_sdw sof_sdw: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI c=
onverter 3

Perhaps this? What could that mean?
ASoC: Parent card not yet available, widget card binding deferred
--=20
Krzysztof "Chris" Ha=C5=82asa

=C5=81ukasiewicz Research Network
Industrial Research Institute for Automation and Measurements PIAP

Al. Jerozolimskie 202, 02-486 Warsaw, Poland
