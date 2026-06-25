Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA773D75BE
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782386126; cv=none; b=LX31fSRjfIiZaoRkU8Jl1bnE3j2IF+kQ464en5LcYW+wZIHedfUuVzaDnD+il36vjaqqxNFjT614/vKFPnKZid58BDtTsRizkicNWaq4vOZvotqHaqR3S09hEyryUkkTieaDGjPG2ACELe5RESv4tr2ijTvpKOCUq9tswUg8sD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782386126; c=relaxed/simple;
	bh=zs3dvOESsas88reCmr/AEl3w73h5yut3msWRRmjK2sM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qKp0rOFStYaoRT60ptIzlcP8YsONwJaa9/ousXy54XtXHWEJYn11ISY+RrtgAtxIDMWuxUPMswyPT80xJWy490aq5MQ45BMDiQ45hlZa4+Mgk8u49ZblPlHeKzFdjqYxpVywlR9HQbHL2wtx+pFhiVCo9z2BSB+BNlLYOwMNT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fbengineering.ch; spf=pass smtp.mailfrom=fbengineering.ch; dkim=pass (1024-bit key) header.d=fbengineering.ch header.i=@fbengineering.ch header.b=cDhloHT6; arc=none smtp.client-ip=185.125.25.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fbengineering.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fbengineering.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fbengineering.ch header.i=@fbengineering.ch header.b="cDhloHT6"
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gmGKD0KR5zhBd;
	Thu, 25 Jun 2026 13:09:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fbengineering.ch;
	s=20220212; t=1782385759;
	bh=Dzj+e+4XyJyd2QqAMQgHkmCoz8+ZaySGMyd36Cqm0II=;
	h=From:To:Subject:Date:From;
	b=cDhloHT6MVx7gZKK76jruRBd4j7paRl94gOjHVXInWSuRWLFE8DjvLRP0o0FZ1Xsb
	 IWMvdqmiicSyWzqseM/ElW2QgL6yi4rP6O0IkaR3kgqqIpZYUtSab7fcsSemfAMCiR
	 0A7p9mooy+cES1Zqg7ewXfyMKzpoYiDxNu0rttuc=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gmGK96VlRzPLJ;
	Thu, 25 Jun 2026 13:09:17 +0200 (CEST)
From: Federico Beffa <beffa@fbengineering.ch>
To: perex@perex.cz,
	tiwai@suse.com,
	willerz@gmail.com,
	abhi220204@gmail.com,
	jpfuentealbabizama@gmail.com,
	uwe@kuechler.org,
	beffa@fbengineering.ch,
	jean-louis.colaco@orange.fr,
	cassiogabrielcontato@gmail.com,
	cryolitia@uniontech.com,
	yury.norov@gmail.com,
	i@rong.moe,
	tasos@tasossah.com,
	geert+renesas@glider.be,
	simon@mungewell.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Add support for Pioneer DJ DJM-S11
Date: Thu, 25 Jun 2026 13:08:09 +0200
Message-ID: <20260625110809.821006-1-beffa@fbengineering.ch>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

The Pioneer DJ DJM-S11, a professional 2-port DJ mixer, is currently not
recognized as an audio interface and therefore not usable on Linux. This
patch enables its full audio functionality.

Like other mixers in the Pioneer DJ DJM family, the DJM-S11 uses
vendor-specific USB class descriptors (0xff) and requires custom mixer
quirks to expose the hardware's input capture routing and volume
controls.

Add the USB vendor and product ID (2b73:0037) to quirks-table.h, mapping
the control interface (Interface 0) to trigger the standard mixer quirks,
and establishing the audio formats for the playback and capture streams.

Control interface 3 is likely related to the touchscreen which is
capable to display waveforms, etc. This functionality is not supported.

In mixer_quirks.c, add the DSP routing options for the DJM-S11. This
creates the ALSA kcontrols for selecting the capture sources (Phono,
Line, Post-fader, etc.) and initializes the default DSP state during
the device probe.

Note that the DJM-S11's capture endpoint clock is strictly slaved to
its playback endpoint. Capturing audio (e.g., timecode vinyl DVS input)
physically requires an active playback stream on the output channels
to feed the master word clock back to the capture stage. Userspace
audio servers (such as PipeWire or JACK) should be configured in
full-duplex mode or have automatic node suspension disabled to maintain
the clock line and prevent I/O errors during capture.

Signed-off-by: Federico Beffa <beffa@fbengineering.ch>
---
 sound/usb/mixer_quirks.c | 21 ++++++++++++-
 sound/usb/quirks-table.h | 67 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index f6f2bc8e97a7..4ba409796d7e 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3936,6 +3936,7 @@ static int snd_rme_digiface_controls_create(struct usb_mixer_interface *mixer)
 #define SND_DJM_450_IDX		0x5
 #define SND_DJM_A9_IDX		0x6
 #define SND_DJM_V10_IDX	0x7
+#define SND_DJM_S11_IDX	0x8
 
 #define SND_DJM_CTL(_name, suffix, _default_value, _windex) { \
 	.name = _name, \
@@ -4276,6 +4277,21 @@ static const struct snd_djm_ctl snd_djm_ctls_v10[] = {
 	// playback channels are fixed and controlled by hardware knobs on the mixer
 };
 
+// DJM-S11
+static const u16 snd_djm_opts_s11_cap1[] = {
+	0x0100, 0x0103, 0x0106, 0x0107, 0x0108, 0x0109, 0x010d };
+static const u16 snd_djm_opts_s11_cap2[] = {
+	0x0200, 0x0203, 0x0206, 0x0207, 0x0208, 0x0209, 0x020d };
+static const u16 snd_djm_opts_s11_cap3[] = {
+	0x0307, 0x0308, 0x0309, 0x030a, 0x030d, 0x0311, 0x0312 };
+
+static const struct snd_djm_ctl snd_djm_ctls_s11[] = {
+	SND_DJM_CTL("Master Input Level Capture Switch", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Input 1 Capture Switch", s11_cap1, 1, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 2 Capture Switch", s11_cap2, 1, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Input 3 Capture Switch", s11_cap3, 3, SND_DJM_WINDEX_CAP)
+};
+
 static const struct snd_djm_device snd_djm_devices[] = {
 	[SND_DJM_250MK2_IDX] = SND_DJM_DEVICE(250mk2),
 	[SND_DJM_750_IDX] = SND_DJM_DEVICE(750),
@@ -4285,6 +4301,7 @@ static const struct snd_djm_device snd_djm_devices[] = {
 	[SND_DJM_450_IDX] = SND_DJM_DEVICE(450),
 	[SND_DJM_A9_IDX] = SND_DJM_DEVICE(a9),
 	[SND_DJM_V10_IDX] = SND_DJM_DEVICE(v10),
+	[SND_DJM_S11_IDX] = SND_DJM_DEVICE(s11),
 };
 
 static int snd_djm_controls_info(struct snd_kcontrol *kctl,
@@ -4589,9 +4606,11 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x2b73, 0x0034): /* Pioneer DJ DJM-V10 */
 		err = snd_djm_controls_create(mixer, SND_DJM_V10_IDX);
 		break;
+	case USB_ID(0x2b73, 0x0037): /* Pioneer DJ DJM-S11 */
+		err = snd_djm_controls_create(mixer, SND_DJM_S11_IDX);
+		break;
 	case USB_ID(0x03f0, 0x0269): /* HP TB Dock G2 */
 		err = hp_dock_mixer_create(mixer);
-		break;
 	}
 
 	return err;
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 71444c2898b4..938908671d93 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3310,6 +3310,73 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	/*
+	 * Pioneer DJ / AlphaTheta DJM-S11
+	 */
+	USB_DEVICE(0x2b73, 0x0037),
+	QUIRK_DRIVER_INFO {
+		QUIRK_DATA_COMPOSITE {
+			{
+				QUIRK_DATA_STANDARD_MIXER(0)
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(1) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 14,
+					.iface = 1,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x01,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						   USB_ENDPOINT_SYNC_ASYNC,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 48000 },
+					.clock = 1,
+					.fmt_type = UAC_FORMAT_TYPE_I
+				}
+			},
+			{
+				QUIRK_DATA_AUDIOFORMAT(2) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 10,
+					.iface = 2,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x82,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC |
+						   USB_ENDPOINT_SYNC_ASYNC |
+						   USB_ENDPOINT_USAGE_IMPLICIT_FB,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 48000 },
+					.clock = 1,
+					.fmt_type = UAC_FORMAT_TYPE_I
+				}
+			},
+			{
+				/* Audio Control (unknown purpose) */
+				.ifnum = 3,
+				.type = QUIRK_IGNORE_INTERFACE
+			},
+			{
+				.ifnum = 4,
+				.type = QUIRK_MIDI_STANDARD_INTERFACE
+			},
+			{
+				/* HID */
+				.ifnum = 5,
+				.type = QUIRK_IGNORE_INTERFACE
+			},
+			QUIRK_COMPOSITE_END
+		}
+	}
+},
 
 /*
  * MacroSilicon MS2100/MS2106 based AV capture cards
-- 
2.54.0

