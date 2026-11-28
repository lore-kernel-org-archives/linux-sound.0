Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.252.153.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795857798;
	b=kKc5Zk7psD1b03ZlIbv9yyJg1Lk73RbsU2HH9ef1jBZvNg9o4o/ZHjASzgm1qA6QNfdN
	 SASe7pfZ631Po29k/V2K5kzke1ZhHUFnYtG9J4apUAPMF78pjZoj9xuPU6dzD37qWiOuH
	 3XoNdrJyVc0+3Iqve4p8W1Wz1KEY9SRg3dsACeHWPS8t1MFuOoHpRQHjmgQcjLMXm/lrF
	 E7cHd/vIa+46pdI7UbUXBsSpb/zMtkosVPmdMfaT2Gr+fJDOnJ6xUYWkAp+sOkbW0n3Hs
	 8C8fiepmLb0bayyi5dIA9gBjvIB/uUL8qP6ACycKngWWj/T0lyUGBsbBkd27VP9Twyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795857798;
	h=DMARC-Filter:DKIM-Signature:Received:X-Riseup-User-ID:Received:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pkcccPCEEizcNwnu0sXzlcRZi2NZQIbRRE5j/shPavQ=;
	b=S1HqsfezBVJKveV0OSU3zdQxNGkAPJh0I/0fBEghHhxfxJCd5ZybAWWt6o0/X/ItQIvu
	 ZOS7k4aWDa5nw32DPHB8Bd8Rjh0P3kXCh1o1uEr02VNhfQN6T/AGmBWkRU1BsZML1oBN6
	 KEhO2F2e4FtqGrloXYdrh+LX4/wWTLySVLy8yYqVAmuiHmdft9CcQJpp/zdH8uv0ZLVxw
	 jq6yCCMujVrYGqhO0wKN1mrGLbfYMXR1ExFoVuEJcGYG7NaxvLEO/kUzDQMnO8VdgqrvQ
	 RJ85ZTwvebfXaXZLZ/WGLJ+bppQhc40CQGrM6uvhlzxYS0wDPR6Jbpi7kxJpfPkisFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riseup.net;
	spf=pass smtp.mailfrom=riseup.net;
	dkim=pass header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=olREoya0;
	arc=none smtp.remote-ip=198.252.153.6
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D400F606A31C
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 09:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D400F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=olREoya0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1795857797; bh=pkcccPCEEizcNwnu0sXzlcRZi2NZQIbRRE5j/shPavQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=olREoya0solLfSKegeDg8I6oogcKrSPT6jF0Jv+eo10iF9X7ncnhmGqc0s1VbpD3Q
	 kkUrUeGbpeL05+ptqC9qFRCoHNUGsLpeMl6rMppagFBrGH2PZv14UuCd7qY2ymCt2Z
	 QmwIptELzofgYnjkBcQo7KDElIecEi95v+AxlziM=
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4jc4Zs0sk7z9sVb;
	Sat, 28 Nov 2026 09:23:17 +0000 (UTC)
X-Riseup-User-ID: CE96943CE983E56D500227C44EF1D84A820F3DD9AFC796FFE532CD46DF04570D
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4jc4Zq2wKRz1y6Y;
	Sat, 28 Nov 2026 09:23:15 +0000 (UTC)
From: Rafael Diniz <rafael@riseup.net>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: wm8731: activate the interface after the converters, before the outputs
Date: Sat, 28 Nov 2026 09:23:04 +0000
Message-ID: <20261128092306.1566199-2-rafael@riseup.net>
In-Reply-To: <20261128092306.1566199-1-rafael@riseup.net>
References: <20261128092306.1566199-1-rafael@riseup.net>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The datasheet's power-up sequence powers everything but the outputs,
sets the other registers, activates the digital audio interface and
clears OUTPD last.  The driver has ACTIVE as a supply widget of its own,
which DAPM powers ahead of the ADC and DAC, so every stream start powers
a converter up under an active interface.

With the codec as clock provider at 96 kHz from a 12 MHz crystal (USB
mode), as on the AudioInjector stereo card for the Raspberry Pi, about
one capture start in five then leaves the ADC delivering its DC offset
and noise at their usual levels but no signal, until the interface is
deactivated and activated again.  Both orders reproduce it on a running
codec over I2C: the driver's start order (interface active, then the ADC
powered up) went deaf in 1 of 8 trials, and powering the ADC down and up
under an active interface in 2 of 8.  Activating the interface with the
ADC already powered stayed healthy in 42 of 42.

Power the ADC and DAC from one supply, with the interface inactive, and
set ACTIVE from the same supply's POST_PMU event once they are up; clear
it in PRE_PMD before they go down.  DAPM runs supplies before the output
mixer (OUTPD) when powering up and after it when powering down, so ACTIVE
is set before OUTPD is cleared, as the datasheet asks, and the events
run on any power change, a mixer switch as well as a stream start.  A
subsequence orders the supply after the oscillator going up and before
it going down.  A second stream finds the converters powered and the
interface left as it is.

The register writes traced on that card follow the datasheet's order:
oscillator, ADC and DAC, ACTIVE, then OUTPD for playback; OUTPD, ACTIVE,
ADC and DAC, oscillator going down.  Turning the HiFi playback switch on
under a running playback stream sets ACTIVE the same way, and the line
bypass alone powers only the output mixer.

Tested on a Raspberry Pi 4 with that card, 6.18.60 (Raspberry Pi kernel,
where the driver is the same as here): after each of 30 daemon restarts,
each a fresh capture and playback start with nothing in user space
cycling the interface, the capture decoded a test transmission from a
second station; before this patch about one start in five came up deaf.
Built with W=1 on mainline.

The analysis, the I2C reproducers, the patch and this changelog were
written with Claude Code (Claude Opus 5.5) from the reported fault, the
kernel sources and the review of v2, and the tool ran the hardware tests
on the submitter's test setup at the submitter's direction.

Fixes: 8a27bd9a3318 ("ASoC: Manage WM8731 ACTIVE bit as a supply widget")
Link: https://github.com/raspberrypi/linux/issues/7776
Signed-off-by: Rafael Diniz <rafael@riseup.net>
---
 sound/soc/codecs/wm8731.c | 59 +++++++++++++++++++++++++++++++++++----
 sound/soc/codecs/wm8731.h |  7 +++++
 2 files changed, 61 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index f25b50919..d2f65f543 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -167,18 +167,67 @@ SOC_DAPM_SINGLE("HiFi Playback Switch", WM8731_APANA, 4, 1, 0),
 static const struct snd_kcontrol_new wm8731_input_mux_controls =
 SOC_DAPM_ENUM("Input Select", wm8731_insel_enum);
 
+/*
+ * The datasheet's power-up sequence powers everything but the outputs, sets
+ * the other registers, activates the digital audio interface and powers the
+ * outputs last.  With the codec as clock provider at 96 kHz (12 MHz crystal,
+ * USB mode), powering the ADC up under an active interface left it, about
+ * one time in five, delivering its DC offset and noise but no signal, until
+ * the interface was deactivated and activated again.
+ *
+ * So one supply powers the ADC and DAC, with the interface inactive, and
+ * activates the interface once they are up; going down, it deactivates the
+ * interface before powering them down.  A second stream finds them powered
+ * and the interface left as it is.  DAPM runs supplies before the output
+ * mixer (OUTPD) when powering up and after it when powering down, as the
+ * datasheet's sequence has it; the subsequence puts this supply after the
+ * oscillator going up and before it going down.
+ */
+#define WM8731_PWR_CONVERTERS	(WM8731_PWR_ADCPD | WM8731_PWR_DACPD)
+
+static int wm8731_converters_event(struct snd_soc_dapm_widget *w,
+				   struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(component, WM8731_PWR,
+					      WM8731_PWR_CONVERTERS, 0);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_component_update_bits(component, WM8731_ACTIVE,
+					      WM8731_ACTIVE_ACTIVE,
+					      WM8731_ACTIVE_ACTIVE);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		snd_soc_component_update_bits(component, WM8731_ACTIVE,
+					      WM8731_ACTIVE_ACTIVE, 0);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component, WM8731_PWR,
+					      WM8731_PWR_CONVERTERS,
+					      WM8731_PWR_CONVERTERS);
+		break;
+	}
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget wm8731_dapm_widgets[] = {
-SND_SOC_DAPM_SUPPLY("ACTIVE",WM8731_ACTIVE, 0, 0, NULL, 0),
 SND_SOC_DAPM_SUPPLY("OSC", WM8731_PWR, 5, 1, NULL, 0),
+SND_SOC_DAPM_SUPPLY_S("Converters", 1, SND_SOC_NOPM, 0, 0,
+		      wm8731_converters_event,
+		      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		      SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
 SND_SOC_DAPM_MIXER("Output Mixer", WM8731_PWR, 4, 1,
 	&wm8731_output_mixer_controls[0],
 	ARRAY_SIZE(wm8731_output_mixer_controls)),
-SND_SOC_DAPM_DAC("DAC", "HiFi Playback", WM8731_PWR, 3, 1),
+SND_SOC_DAPM_DAC("DAC", "HiFi Playback", SND_SOC_NOPM, 0, 0),
 SND_SOC_DAPM_OUTPUT("LOUT"),
 SND_SOC_DAPM_OUTPUT("LHPOUT"),
 SND_SOC_DAPM_OUTPUT("ROUT"),
 SND_SOC_DAPM_OUTPUT("RHPOUT"),
-SND_SOC_DAPM_ADC("ADC", "HiFi Capture", WM8731_PWR, 2, 1),
+SND_SOC_DAPM_ADC("ADC", "HiFi Capture", SND_SOC_NOPM, 0, 0),
 SND_SOC_DAPM_MUX("Input Mux", SND_SOC_NOPM, 0, 0, &wm8731_input_mux_controls),
 SND_SOC_DAPM_PGA("Line Input", WM8731_PWR, 0, 1, NULL, 0),
 SND_SOC_DAPM_MICBIAS("Mic Bias", WM8731_PWR, 1, 1),
@@ -199,8 +248,8 @@ static int wm8731_check_osc(struct snd_soc_dapm_widget *source,
 static const struct snd_soc_dapm_route wm8731_intercon[] = {
 	{"DAC", NULL, "OSC", wm8731_check_osc},
 	{"ADC", NULL, "OSC", wm8731_check_osc},
-	{"DAC", NULL, "ACTIVE"},
-	{"ADC", NULL, "ACTIVE"},
+	{"DAC", NULL, "Converters"},
+	{"ADC", NULL, "Converters"},
 
 	/* output mixer */
 	{"Output Mixer", "Line Bypass Switch", "Line Input"},
diff --git a/sound/soc/codecs/wm8731.h b/sound/soc/codecs/wm8731.h
index 8d5a7a9ca..2c422c43f 100644
--- a/sound/soc/codecs/wm8731.h
+++ b/sound/soc/codecs/wm8731.h
@@ -33,6 +33,13 @@ struct snd_pcm_hw_constraint_list;
 #define WM8731_ACTIVE   0x09
 #define WM8731_RESET	0x0f
 
+/* WM8731_PWR */
+#define WM8731_PWR_ADCPD	0x0004
+#define WM8731_PWR_DACPD	0x0008
+
+/* WM8731_ACTIVE */
+#define WM8731_ACTIVE_ACTIVE	0x0001
+
 #define WM8731_CACHEREGNUM 	10
 
 #define WM8731_SYSCLK_MCLK 0
-- 
2.47.3

