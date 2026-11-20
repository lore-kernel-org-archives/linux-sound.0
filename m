Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.252.153.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162149;
	b=I7YLcmT5fy4AOnVLoJL3Wo+Pv+gn2A3w/cXr21otKMfdoNDTZ+c3o5oO9JMfSune2b76
	 oPR+1xI1RxN5V3BiXuU7AGLJMdKqoywtMauREaG1pCUMcwbDmefANUaHiZhKrBaA2hSkZ
	 Nv9nRppZPdsTAhEeVlPmONjXVRTjcdYBXDagfrmmxr9K0MFbo5A7dFpsiZQUWgVdd0+Iv
	 RmVh8IIwQsF0W1zKn0ezqzy35TrGRP36tpjRWl4GuYeF8OZBB716fnhs6Yio2k7fLCLhj
	 H7CTEAiibhdjdEIXtJhH5BHlK7X1EjCerSZnpjt8ZY0z0yHVnUK5xMlONF38ASAM8pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162149;
	h=DMARC-Filter:DKIM-Signature:Received:X-Riseup-User-ID:Received:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=JJ6VOwGfPfimd9/JwH4NQZl2nm7AUQ+ktrCXpHw8mWA=;
	b=mYy/MCunJwkOWBKj3gvNeGE4fH9vwMqjJxKYSFK2/JExA3boT/wHqaY7MSL+OFmGwy7b
	 QfUZpH8oiDZvEATs3u6hbkh22j7B4rAYZ8q3bwEaPS8HKMwvNn7RYSyyEkCOytWrINATg
	 loEl4cHQ06p7JGViXOB3zFJI5KhSbQpNfa6YhsrjyUStDNgZ6pzCnE7D0oL9u3jGLwFm3
	 Vhc5NxbIV0LjAooll2iBUh5IJaxRYoVS1Rpt7IUWASEzsZ9Y+7If8oOShE+XQwJhuJx10
	 D16SqIwizDILVaWDTrSE6pr09+B3TLqzLFSioTT75KR3FWE2lKXB0lX7qzCPqRQ52DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riseup.net;
	spf=pass smtp.mailfrom=riseup.net;
	dkim=pass header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=loQxJVmX;
	arc=none smtp.remote-ip=198.252.153.6
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A912606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 08:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A912606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=riseup.net header.i=@riseup.net header.a=rsa-sha256 header.s=squak header.b=loQxJVmX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1795162142; bh=JJ6VOwGfPfimd9/JwH4NQZl2nm7AUQ+ktrCXpHw8mWA=;
	h=From:To:Cc:Subject:Date:From;
	b=loQxJVmXaxsX02Ey/NYruspqXOcQHHg99ouNESqE8TEjIqcJadR0ynxHi6MrqYGGO
	 9WqN4IeLbHtR50hNlMDivxVVK8WI0pEeVugv+vW/nTxJwHvhYEE4UuHdGrZUkxYu2d
	 +lBvsT8t1LVsShrlHjKNyD52YPBc8LbB7OFzl6mk=
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4jW7Jt1CTLz9sFH;
	Fri, 20 Nov 2026 08:09:02 +0000 (UTC)
X-Riseup-User-ID: F254DBFB1DFDC90AD726A7571019DBCE3C8F914362BA7318BDB5034EDB731FE5
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4jW7Jd08JYz1xpk;
	Fri, 20 Nov 2026 08:08:48 +0000 (UTC)
From: Rafael Diniz <rafael@riseup.net>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rafael Diniz <rafael@riseup.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ASoC: wm8731: power the converters together, activate the interface last
Date: Fri, 20 Nov 2026 08:07:55 +0000
Message-ID: <20261120080825.2078162-1-rafael@riseup.net>
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

The datasheet's power-up sequence powers the converters, sets the other
registers and activates the digital audio interface last.  The driver
has ACTIVE as a supply widget, which DAPM powers ahead of the ADC, DAC
and line input, and gives each converter a widget of its own, so a
capture starting next to a running playback powers the ADC up under an
active interface.

With the codec as clock provider at 96 kHz from a 12 MHz crystal (USB
mode), as on the AudioInjector stereo card for the Raspberry Pi, about
one capture start in five then leaves the ADC delivering its DC offset
and noise at their usual levels but no signal, until the interface is
deactivated and activated again.  Both orders reproduce it on a running
codec over I2C: the driver's start order (interface active, then ADC and
line input powered up) went deaf in 1 of 8 trials, and powering the ADC
and line input down and up under an active interface in 2 of 8.
Activating the interface with the converters already powered stayed
healthy in 42 of 42, and rewriting SRATE or IFACE with their values
under an active interface in 12 of 12.

Power the ADC, DAC and line input from one supply, with the interface
inactive, set ACTIVE from a DAPM post widget once a stream's widgets are
up, and clear it before the converters go down.  A second stream then
finds the converters powered and leaves the interface as it is.

A second stream's hw_params also rewrote the sample rate and format
registers of an interface already active for the other direction.  One
rate and word length serve both directions: keep matching settings as
they are and refuse others with -EBUSY while the interface is active.

Tested on a Raspberry Pi 4 with that card, 6.18.60 (Raspberry Pi
kernel, where the driver is the same): with this patch, 30 of 30
full-duplex stream starts had the test signal in the capture, against
about one in five deaf without it.  Built with W=1 on mainline.

The analysis, the I2C reproducers, the patch and this changelog were
written with Claude Code (Claude Opus 5.5) from the reported fault and
the kernel sources, and the tool ran the hardware tests on the
submitter's test setup at the submitter's direction.

Fixes: 8a27bd9a3318 ("ASoC: Manage WM8731 ACTIVE bit as a supply widget")
Link: https://github.com/raspberrypi/linux/issues/7776
Signed-off-by: Rafael Diniz <rafael@riseup.net>
---

Notes:
    v2:
    - add the Signed-off-by missing from v1
    - send with git send-email; v1 was mangled by the mail client
    No code changes.

 sound/soc/codecs/wm8731.c | 92 ++++++++++++++++++++++++++++++++++-----
 sound/soc/codecs/wm8731.h |  8 ++++
 2 files changed, 89 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index f25b50919..1a983ad43 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -167,20 +167,76 @@ SOC_DAPM_SINGLE("HiFi Playback Switch", WM8731_APANA, 4, 1, 0),
 static const struct snd_kcontrol_new wm8731_input_mux_controls =
 SOC_DAPM_ENUM("Input Select", wm8731_insel_enum);
 
+/*
+ * The datasheet's power-up sequence powers the converters, sets the other
+ * registers and activates the digital audio interface last.  With the
+ * codec as clock provider at 96 kHz (12 MHz crystal, USB mode), powering
+ * the ADC up while the interface was already active left it, about one
+ * time in four, delivering its DC offset and noise but no signal, until the
+ * interface was deactivated and activated again.  As DAPM widgets of their
+ * own, ACTIVE (a supply) was set ahead of the ADC on every capture start,
+ * and a capture starting next to a running playback powered the ADC up
+ * under an active interface.
+ *
+ * So the ADC, DAC and line input are powered together, by one supply, with
+ * the interface inactive; the interface is activated once a stream's
+ * widgets are all up and deactivated before the converters go down.  A
+ * second stream finds both converters powered and the interface left as it
+ * is.
+ */
+#define WM8731_PWR_CONVERTERS (WM8731_PWR_LINEINPD | WM8731_PWR_ADCPD | WM8731_PWR_DACPD)
+
+static int wm8731_converters_event(struct snd_soc_dapm_widget *w,
+				   struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+
+	snd_soc_component_update_bits(component, WM8731_ACTIVE,
+				      WM8731_ACTIVE_ACTIVE, 0);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(component, WM8731_PWR,
+					      WM8731_PWR_CONVERTERS, 0);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		snd_soc_component_update_bits(component, WM8731_PWR,
+					      WM8731_PWR_CONVERTERS,
+					      WM8731_PWR_CONVERTERS);
+		break;
+	}
+	return 0;
+}
+
+static int wm8731_interface_event(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	unsigned int pwr = snd_soc_component_read(component, WM8731_PWR);
+
+	if (event == SND_SOC_DAPM_POST_PMU && !(pwr & WM8731_PWR_CONVERTERS))
+		snd_soc_component_update_bits(component, WM8731_ACTIVE,
+					      WM8731_ACTIVE_ACTIVE,
+					      WM8731_ACTIVE_ACTIVE);
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget wm8731_dapm_widgets[] = {
-SND_SOC_DAPM_SUPPLY("ACTIVE",WM8731_ACTIVE, 0, 0, NULL, 0),
+SND_SOC_DAPM_POST("Interface", wm8731_interface_event),
 SND_SOC_DAPM_SUPPLY("OSC", WM8731_PWR, 5, 1, NULL, 0),
+SND_SOC_DAPM_SUPPLY("Converters", SND_SOC_NOPM, 0, 0, wm8731_converters_event,
+		    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
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
-SND_SOC_DAPM_PGA("Line Input", WM8731_PWR, 0, 1, NULL, 0),
+SND_SOC_DAPM_PGA("Line Input", SND_SOC_NOPM, 0, 0, NULL, 0),
 SND_SOC_DAPM_MICBIAS("Mic Bias", WM8731_PWR, 1, 1),
 SND_SOC_DAPM_INPUT("MICIN"),
 SND_SOC_DAPM_INPUT("RLINEIN"),
@@ -199,8 +255,9 @@ static int wm8731_check_osc(struct snd_soc_dapm_widget *source,
 static const struct snd_soc_dapm_route wm8731_intercon[] = {
 	{"DAC", NULL, "OSC", wm8731_check_osc},
 	{"ADC", NULL, "OSC", wm8731_check_osc},
-	{"DAC", NULL, "ACTIVE"},
-	{"ADC", NULL, "ACTIVE"},
+	{"DAC", NULL, "Converters"},
+	{"ADC", NULL, "Converters"},
+	{"Line Input", NULL, "Converters"},
 
 	/* output mixer */
 	{"Output Mixer", "Line Bypass Switch", "Line Input"},
@@ -320,10 +377,6 @@ static int wm8731_hw_params(struct snd_pcm_substream *substream,
 	u16 srate = (coeff_div[i].sr << 2) |
 		(coeff_div[i].bosr << 1) | coeff_div[i].usb;
 
-	wm8731->playback_fs = params_rate(params);
-
-	snd_soc_component_write(component, WM8731_SRATE, srate);
-
 	/* bit size */
 	switch (params_width(params)) {
 	case 16:
@@ -339,8 +392,25 @@ static int wm8731_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	wm8731_set_deemph(component);
+	/*
+	 * One sample rate and word length serve both directions.  While the
+	 * interface is active (the other direction running) its clocking is
+	 * not rewritten: the same settings are kept, others are refused.
+	 */
+	if (snd_soc_component_read(component, WM8731_ACTIVE) & WM8731_ACTIVE_ACTIVE) {
+		if (snd_soc_component_read(component, WM8731_SRATE) != srate ||
+		    snd_soc_component_read(component, WM8731_IFACE) != iface) {
+			dev_err(component->dev,
+				"interface active at other settings: %d Hz, %d bits refused\n",
+				params_rate(params), params_width(params));
+			return -EBUSY;
+		}
+		return 0;
+	}
 
+	wm8731->playback_fs = params_rate(params);
+	snd_soc_component_write(component, WM8731_SRATE, srate);
+	wm8731_set_deemph(component);
 	snd_soc_component_write(component, WM8731_IFACE, iface);
 	return 0;
 }
diff --git a/sound/soc/codecs/wm8731.h b/sound/soc/codecs/wm8731.h
index 8d5a7a9ca..0187e047f 100644
--- a/sound/soc/codecs/wm8731.h
+++ b/sound/soc/codecs/wm8731.h
@@ -33,6 +33,14 @@ struct snd_pcm_hw_constraint_list;
 #define WM8731_ACTIVE   0x09
 #define WM8731_RESET	0x0f
 
+/* WM8731_PWR */
+#define WM8731_PWR_LINEINPD	0x0001
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

