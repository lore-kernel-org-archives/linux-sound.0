Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164101;
	b=eEuHvlrqIDqIwmdgFKlY9Q1nT4/STmIHtJd+a5QF7Y4Ybns3reZzXNkEUXNw6bkl4hWD
	 5G5xZyaFjedM71i6+TzEuwZFoqJikwPyyXKFJEGOoHNzVa5iBGRoTJyPv4RVSxW6Dfr11
	 XzbnXqQPjFKKrn4mhnGDyvjjfapG6PxoY2HGLS9o7fpV4sT49xdxas/43QVgrkKL8yIfF
	 3MFERGfPVNl8P4dPNnDJHccDTkKalW3jw2Qx/UHZVYDzG3yLIWH7Vkq9YkXLpuSZeM7Nr
	 EhSS4exQL5jnfL0vyiPtAfoMgwc8jgEzkfR7YmkMMBMwfjhagittup2P3l7TOrQxlew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164101;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer;
	bh=8tzH+3GXLoxcfluPUxGtHTdK4vrEejEuYEXvhaD3clE=;
	b=vbYKsnYn1YiAmpdj5vnnG3GJl3Se+/5guoBAc3Y9XGgts7vSBdwvrb27Ca44ISnn/bFo
	 17/QzR26zqIZYxXNk+W/6tSEWzd1jNc2nvLZz+nk3CWU0tySHDOgpLLg+YGR8a14IZNFG
	 V8sLIDZSurniMMxs0zOVir/Zwhr5BVx4oV61nuoDw9O95IjbVbQKuqRc+9j6O+yOmlJ/X
	 MQDM150fAtNIomKfT2NWN4f+rK2i2syago1TvDQr4oY8URcYvIwG9XSBFsqa/FuAahl7P
	 RpmmuyUk8CM8kHbqBfjA/whSwRRymbZlA9FSzhtaDZlcdY9/Q+n6egvvsRTuPrr0Tow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nC7JDWc0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2136606A320;
	Fri, 20 Nov 2026 08:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nC7JDWc0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FEC1F000C4;
	Fri, 20 Nov 2026 08:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795164100;
	bh=8tzH+3GXLoxcfluPUxGtHTdK4vrEejEuYEXvhaD3clE=;
	h=From:Date:Subject:To:Cc;
	b=nC7JDWc0fSmwH5P3xerrGc86HVhZgNRP7QS8r2dQjidliMwi6nk6zJiw4Tf4SwT37
	 yF+sI8fwfqKICc3Fo3Qk3cR5SaMryvX/ghSHaRIMwm1XSVJ2Vk2y9z75VBiOU98VV1
	 aehqo3Us+eBpulTX/JSll2jfmyTSksW2PFPbsoW3rXZTalqK6aZNey7IR6cFkClx4b
	 SdxDoropJywsWVC08M3/vKnoBNisk9mcAA25PxO72ls1R4MGeXkgSAr0AFMl6qH0Xl
	 Y6xP0ZK35fjRYCdynRwmJCLrgwyTVUVCUl+Mh3OTL9rMnil5mFvX4uclU3UPrRQ17m
	 DCjNWnd32d7xw==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 09:41:37 +0100
Subject: [PATCH] ASoC: ab8500: Add AB8505 handsfree output gain
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-ux500-asoc-handsfree-gain-v1-1-56379df0a6d3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqEMAwAwK+EnA2kWdZDv7J4iDXVXOrSoAji3
 xd2HjA3hnW3wAw3djs9fG+YIQ2AZdO2GvmCGVBYxpSE6bjezKSxF9q0LVG7Ga3qjXSWUkRfdTT
 GAfDbrfr1vz/T8/wARlACBmsAAAA=
X-Change-ID: 20261120-ux500-asoc-handsfree-gain-ab2cc2a3f6e0
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

The AB8505 has a final gain stage in the handsfree speaker paths. On
revision 2 and later, its HFLGainCtrl and HFRGainCtrl registers reset to
0x1f, which is the no-signal setting. The existing controls only reach
the preceding DA3 and DA4 gain stage, so userspace cannot unmute the
speaker outputs.

Expose the handsfree output gain as an ALSA control. Select the combined
revision 1 register or the separate revision 2 and later registers
according to the detected chip revision.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/codecs/ab8500-codec.c | 30 ++++++++++++++++++++++++++++++
 sound/soc/codecs/ab8500-codec.h | 15 +++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 3e3ff9bfe00d..8b0cd01d2a27 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -955,6 +955,12 @@ static DECLARE_TLV_DB_SCALE(dax_dig_gain_tlv, -6300, 100, 1);
 static DECLARE_TLV_DB_SCALE(hs_ear_dig_gain_tlv, -100, 100, 1);
 /* -1dB = Mute */
 
+/* AB8505 v1 handsfree output gain: -3 dB to 12 dB in 1 dB steps. */
+static DECLARE_TLV_DB_SCALE(ab8505_hf_v1_gain_tlv, -300, 100, 0);
+
+/* AB8505 v2 handsfree output gain: mute, then -3 dB to 20 dB. */
+static DECLARE_TLV_DB_SCALE(ab8505_hf_v2_gain_tlv, -400, 100, 1);
+
 static const DECLARE_TLV_DB_RANGE(hs_gain_tlv,
 	0, 3, TLV_DB_SCALE_ITEM(-3200, 400, 0),
 	4, 15, TLV_DB_SCALE_ITEM(-1800, 200, 0)
@@ -1519,6 +1525,18 @@ static struct snd_kcontrol_new ab8500_ctrls[] = {
 		AB8500_SIDFIRADR, AB8500_SIDFIRADR_FIRSIDSET, 0),
 };
 
+static const struct snd_kcontrol_new ab8505_v1_ctrls[] = {
+	SOC_DOUBLE_TLV("HF Digital Volume", AB8505_HFGAINCTRL_V1,
+		       AB8505_HFGAINCTRL_V1_HFL, AB8505_HFGAINCTRL_V1_HFR,
+		       AB8505_HFGAINCTRL_V1_MAX, 1, ab8505_hf_v1_gain_tlv),
+};
+
+static const struct snd_kcontrol_new ab8505_v2_ctrls[] = {
+	SOC_DOUBLE_R_TLV("HF Digital Volume",
+			 AB8505_HFLGAINCTRL_V2, AB8505_HFRGAINCTRL_V2,
+			 0, AB8505_HFGAINCTRL_V2_MAX, 1, ab8505_hf_v2_gain_tlv),
+};
+
 /*
  * Extended interface for codec-driver
  */
@@ -2081,6 +2099,18 @@ static int ab8500_codec_probe(struct snd_soc_component *component)
 						 ARRAY_SIZE(ab8500_dmic_dapm_routes));
 		if (status)
 			return status;
+	} else if (is_ab8505_1p0_or_earlier(ab8500)) {
+		status = snd_soc_add_component_controls(component,
+							ab8505_v1_ctrls,
+							ARRAY_SIZE(ab8505_v1_ctrls));
+		if (status)
+			return status;
+	} else if (is_ab8505(ab8500)) {
+		status = snd_soc_add_component_controls(component,
+							ab8505_v2_ctrls,
+							ARRAY_SIZE(ab8505_v2_ctrls));
+		if (status)
+			return status;
 	}
 
 	status = ab8500_audio_init_audioblock(component);
diff --git a/sound/soc/codecs/ab8500-codec.h b/sound/soc/codecs/ab8500-codec.h
index 2a6f6409f1f8..9ffcb50a991d 100644
--- a/sound/soc/codecs/ab8500-codec.h
+++ b/sound/soc/codecs/ab8500-codec.h
@@ -142,6 +142,13 @@
 #define AB8500_FIFOCONF6			0x6E
 #define AB8500_AUDREV				0x6F
 
+/* AB8505 v1 audio bank registers */
+#define AB8505_HFGAINCTRL_V1			0x78
+
+/* AB8505 v2 and later audio bank registers */
+#define AB8505_HFLGAINCTRL_V2			0x80
+#define AB8505_HFRGAINCTRL_V2			0x81
+
 #define AB8500_FIRST_REG			AB8500_POWERUP
 #define AB8500_LAST_REG				AB8500_AUDREV
 #define AB8500_CACHEREGNUM			(AB8500_LAST_REG + 1)
@@ -150,6 +157,14 @@
 #define AB8500_MASK_SLOT(slot)			((slot & 1) ? 0xF0 : 0x0F)
 #define AB8500_MASK_NONE			0x00
 
+/* AB8505_HFGAINCTRL_V1 */
+#define AB8505_HFGAINCTRL_V1_HFL		4
+#define AB8505_HFGAINCTRL_V1_HFR		0
+#define AB8505_HFGAINCTRL_V1_MAX		0x0F
+
+/* AB8505_HFLGAINCTRL_V2, AB8505_HFRGAINCTRL_V2 */
+#define AB8505_HFGAINCTRL_V2_MAX		0x18
+
 /* AB8500_POWERUP */
 #define AB8500_POWERUP_POWERUP			7
 #define AB8500_POWERUP_ENANA			3

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261120-ux500-asoc-handsfree-gain-ab2cc2a3f6e0

Best regards,
--  
Linus Walleij <linusw@kernel.org>

