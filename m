Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89045331ED1
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 00:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693142; cv=none; b=aKZzcFeslou7mv5caQu4RdKGgG0OTA6/ze9RGzehdnRUXQX35mLvF0LJo/Tal4SWw7VjwUYqgJnpJKXTPnSJ6nS1AfrP+4P/+D07aJtwTGMe/FYHh/KLPme0KflHxznhrDpfGoEwIK7RYvGSBTDo4ggGMpREx01uqJ11A/StNOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693142; c=relaxed/simple;
	bh=Cyntk/FVhK4JAm7Ju/3leaRUYDR7IdhDIy/TSBbLK4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DXHwiLTzDf3AfZWyhMjk4tZrVwkc8ezjGeWVhQRuuI+AugxPW0/d6LyoYCaD7u9Plx8usWJSgfjcjqS3x7btKnA99v2Xdja6ekeJz0e0HCVhF/jpB+bezyCrK2c8ku2GkSKjZZvD7UBKmi/Tf1FTri/IzXlEzHe9O6k4eR8Y64I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UnbyRyLa; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UnbyRyLa"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201f9so241323d50.0
        for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 17:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789693139; x=1790297939; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2MwhL2bdx+GV001x/u0t/MHMuPCAU4uSV3lRn012fJw=;
        b=UnbyRyLaqf3m02E5CLnI9qCyhh5GsnqhJFaIGSNCw0ilPac68BNCe9SeHoYxouJ8oL
         tzxQzBEEB80dS/YB1eXAbPVgSwIiE5DQpw1eX6txpKIrO8RJr251X/tOAbrBwF82p0Ub
         pshObAThyGfnH4lqD8BbYk72T+/uffOykXQro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789693139; x=1790297939;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2MwhL2bdx+GV001x/u0t/MHMuPCAU4uSV3lRn012fJw=;
        b=AiGRW6p7DezJ8euap3DJSsPdNIN8VCXS+OMUj/aF0W7kddDIOxAS8QQEOYaAzHV4bN
         PiSxDObQpqO2NZ71YQXAB9CQ44XgOtslDpjoSb9jn8cxbrSlrX1Vc3ZisQivhIVnnD39
         272QQu/49nkr7aFWi1FPPLsVl3UmTsScx4tviVujhOBs3b/ZijHa3QTIIaUA5Z/AdfGt
         B9yHCm7p4MRsgrLNlCVEyJ1jq7NayK4/DXXXB6hLESR3E136q0jKgie90VfPYtX2jgHN
         30DUE1eSvd7Z9JmSLBVK5mDFF+XQ3NgphINMVYLVz89JaOyYiGt2JwmsyrCXRyM1RXUs
         KT2w==
X-Gm-Message-State: AFuF++mKoegSj9b4ueRfh15zKazEq8N3sYQBJdRwsSQRtfsVaYTDUu3H
	C+OSAIDqGM9/LALBsRd2UPTfMYYtKzumlTFiY065nU0Loih5Ld3iNB8ojuk1GTumFA==
X-Gm-Gg: AYBFou3F8zW2mwMV8XJS5dM4caTBA2DOyFVk0aCR6TZ+bfawGnM8ypzjM9HIm8GWCrL
	OBtTVR/MgkjFOt7vf/o11cT7DXTblyZyv1DzpzGHZG3PRwsOMLfSr6CIhaFGf8OiUgDSss8D1tW
	ZGKA/yvG8wf9HvZkvD/E9l0nS8qyhP76bh23OgVW1ad/IDUaB2lb+wR5nBEOGIJlddCoJqvlOBL
	G+BbFfqmWVSF4dHP4Mzrdpes2nk1tDnjgNHJGyAJw8/uXN27/0X+GqOmL/cpwDWCNn0sSv4yNgx
	zbn7qhZqj1pAe3xvGRbnLVQ9QvMmCsAHnNAzacEtObf0aKlUo12Wh+hRXDarmoW3K2nlrneahic
	8KS89pvq91F3RUrTE8F3qn/H0zRtQ705Y3QEs0IMKxlmApH/hZuqSXxcqtYuVXBZelz5qm1T//c
	9Ubt8QZz0lnXG7sylwreeyWN7M7U2Gd1BGTSoxuL9EJQJTyv4TPwy2vAhefl6pzOnQW4PUusOZI
	4k5QQrZSfZ8g5cH74exrIFJbMemcSAI/twHa455qEZMbHesBZwKamQ8N4xG
X-Received: by 2002:a05:690e:4502:10b0:671:7d71:a879 with SMTP id 956f58d0204a3-6717fdac9aamr176121d50.63.1789693139443;
        Thu, 17 Sep 2026 17:58:59 -0700 (PDT)
Received: from ripwilburliny.c.googlers.com (160.117.86.34.bc.googleusercontent.com. [34.86.117.160])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6718340476bsm8248d50.2.2026.09.17.17.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 17:58:59 -0700 (PDT)
From: Steven 'Steve' Kendall <skend@chromium.org>
Date: Fri, 18 Sep 2026 00:58:47 +0000
Subject: [PATCH v4] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-fix-headphone-plug-cirrus-dell-v4-1-38c24848a769@chromium.org>
X-B4-Tracking: v=1; b=H4sIAMaMrGoC/4XNTQrCMBCG4atI1o7kp1OrK+8hLtpk2gRqUxJbl
 NK7mwqiiNDlOzDPN7FIwVFkx83EAo0uOt+lyLYbpm3ZNQTOpGaSy5zvBYfa3cFSaXrrO4K+HRr
 QLoQhgqG2BSRVZQdTYo2SJaQPlD5eA+dLauvizYfHa28Uy/VNqzV6FCBAaRS41yZDbU7aBn91w
 3XnQ8MWfZTfYrEqyiTWRSFkMrnJ5R9RfcSDwFVRJTE3GhErzutc/IjzPD8BcoUkO3MBAAA=
X-Change-ID: 20260710-fix-headphone-plug-cirrus-dell-5e3b49da5f52
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Steven 'Steve' Kendall <skend@chromium.org>
X-Mailer: b4 0.15.2

On some models like the Dell Inspiron 15 3520, jack
detection does not work. This patch switches to
delayed work to fix jack plug on Chrome OS for this model.

Assisted-by: LLM
Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>
---
Changes in v4:
- Delayed logic is now limited to the device with the issue.
- Tested for regression on Ubuntu 26.04 and looked good.
- Link to v3: https://patch.msgid.link/20260915-fix-headphone-plug-cirrus-dell-v3-1-6dc555b00f61@chromium.org

Changes in v3:
- Unified sleep time for both cases.
- Removed some superfluous logic after some additional testing.
- Link to v2: https://patch.msgid.link/20260718-fix-headphone-plug-cirrus-dell-v2-1-f88121570d62@chromium.org

Changes in v2:
- Changes from v1 have been removed.
- New approach uses delayed work and also solves the issue on this machine.
- I'm now using the latest release of b4. Hopefully this addresses the formatting issues I was having!
- Link to v1: https://lore.kernel.org/r/20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org
---
 sound/hda/codecs/cirrus/cs8409-tables.c |  9 +++++-
 sound/hda/codecs/cirrus/cs8409.c        | 51 ++++++++++++++++++++++++++++++---
 sound/hda/codecs/cirrus/cs8409.h        |  4 +++
 3 files changed, 59 insertions(+), 5 deletions(-)

diff --git a/sound/hda/codecs/cirrus/cs8409-tables.c b/sound/hda/codecs/cirrus/cs8409-tables.c
index b9ec8fb8eab7c..d0cef8492c994 100644
--- a/sound/hda/codecs/cirrus/cs8409-tables.c
+++ b/sound/hda/codecs/cirrus/cs8409-tables.c
@@ -594,7 +594,7 @@ const struct hda_quirk cs8409_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0BA8, "Odin", CS8409_ODIN),
 	SND_PCI_QUIRK(0x1028, 0x0BAA, "Odin", CS8409_ODIN),
 	SND_PCI_QUIRK(0x1028, 0x0BAE, "Odin", CS8409_ODIN),
-	SND_PCI_QUIRK(0x1028, 0x0BB2, "Warlock MLK", CS8409_WARLOCK_MLK),
+	SND_PCI_QUIRK(0x1028, 0x0BB2, "Warlock MLK", CS8409_WARLOCK_MLK_DELAYED_JD),
 	SND_PCI_QUIRK(0x1028, 0x0BB3, "Warlock MLK", CS8409_WARLOCK_MLK),
 	SND_PCI_QUIRK(0x1028, 0x0BB4, "Warlock MLK", CS8409_WARLOCK_MLK),
 	SND_PCI_QUIRK(0x1028, 0x0BB5, "Warlock N3 15 TGL-U Nuvoton EC", CS8409_WARLOCK),
@@ -625,6 +625,7 @@ const struct hda_model_fixup cs8409_models[] = {
 	{ .id = CS8409_BULLSEYE, .name = "bullseye" },
 	{ .id = CS8409_WARLOCK, .name = "warlock" },
 	{ .id = CS8409_WARLOCK_MLK, .name = "warlock mlk" },
+	{ .id = CS8409_WARLOCK_MLK_DELAYED_JD, .name = "warlock mlk delayed jd" },
 	{ .id = CS8409_WARLOCK_MLK_DUAL_MIC, .name = "warlock mlk dual mic" },
 	{ .id = CS8409_CYBORG, .name = "cyborg" },
 	{ .id = CS8409_DOLPHIN, .name = "dolphin" },
@@ -652,6 +653,12 @@ const struct hda_fixup cs8409_fixups[] = {
 		.chained = true,
 		.chain_id = CS8409_FIXUPS,
 	},
+	[CS8409_WARLOCK_MLK_DELAYED_JD] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = cs8409_cs42l42_pincfgs,
+		.chained = true,
+		.chain_id = CS8409_FIXUPS,
+	},
 	[CS8409_WARLOCK_MLK_DUAL_MIC] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = cs8409_cs42l42_pincfgs,
diff --git a/sound/hda/codecs/cirrus/cs8409.c b/sound/hda/codecs/cirrus/cs8409.c
index c43ff3ef75b6e..056a31d121b5c 100644
--- a/sound/hda/codecs/cirrus/cs8409.c
+++ b/sound/hda/codecs/cirrus/cs8409.c
@@ -56,6 +56,9 @@ static int cs8409_parse_auto_config(struct hda_codec *codec)
 }
 
 static void cs8409_disable_i2c_clock_worker(struct work_struct *work);
+static void cs8409_jack_detect_worker(struct work_struct *work);
+static void cs42l42_run_jack_detect(struct sub_codec *cs42l42);
+static int cs8409_i2c_read(struct sub_codec *scodec, unsigned int addr);
 
 static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
 {
@@ -69,6 +72,7 @@ static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
 	codec->power_save_node = 1;
 	mutex_init(&spec->i2c_mux);
 	INIT_DELAYED_WORK(&spec->i2c_clk_work, cs8409_disable_i2c_clock_worker);
+	INIT_DELAYED_WORK(&spec->jack_detect_work, cs8409_jack_detect_worker);
 	snd_hda_gen_spec_init(&spec->gen);
 
 	return spec;
@@ -115,6 +119,28 @@ static void cs8409_disable_i2c_clock_worker(struct work_struct *work)
 	cs8409_disable_i2c_clock(spec->codec);
 }
 
+/*
+ * cs8409_jack_detect_worker - Perform initial jack detection once hardware is settled
+ *
+ * Defer initial jack detection. On ChromeOS and possibly other platforms this
+ * delay is required for jack detection to work as expected.
+ */
+static void cs8409_jack_detect_worker(struct work_struct *work)
+{
+	struct cs8409_spec *spec = container_of(work, struct cs8409_spec, jack_detect_work.work);
+	struct sub_codec *cs42l42 = spec->scodecs[CS8409_CODEC0];
+
+	if (spec->init_done && spec->build_ctrl_done && !cs42l42->hp_jack_in) {
+		int reg_ts_status = cs8409_i2c_read(cs42l42, CS42L42_TSRS_PLUG_STATUS);
+
+		/* error case */
+		if (reg_ts_status < 0)
+			return;
+
+		cs42l42_run_jack_detect(cs42l42);
+	}
+}
+
 /*
  * cs8409_enable_i2c_clock - Enable I2C clocks
  * @codec: the codec instance
@@ -954,6 +980,8 @@ static void cs8409_remove(struct hda_codec *codec)
 	/* Cancel i2c clock disable timer, and disable clock if left enabled */
 	cancel_delayed_work_sync(&spec->i2c_clk_work);
 	cs8409_disable_i2c_clock(codec);
+	/* Also cancel jack detect work */
+	cancel_delayed_work_sync(&spec->jack_detect_work);
 
 	snd_hda_gen_remove(codec);
 }
@@ -1026,6 +1054,8 @@ static int cs8409_cs42l42_suspend(struct hda_codec *codec)
 	/* Cancel i2c clock disable timer, and disable clock if left enabled */
 	cancel_delayed_work_sync(&spec->i2c_clk_work);
 	cs8409_disable_i2c_clock(codec);
+	/* Also cancel jack detect work */
+	cancel_delayed_work_sync(&spec->jack_detect_work);
 
 	snd_hda_shutup_pins(codec);
 
@@ -1153,6 +1183,9 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 			spec->scodecs[CS8409_CODEC0]->full_scale_vol = CS42L42_FULL_SCALE_VOL_0DB;
 			spec->speaker_pdn_gpio = CS8409_CYBORG_SPEAKER_PDN;
 			break;
+		case CS8409_WARLOCK_MLK_DELAYED_JD:
+			spec->delay_jack_detect = 1;
+			fallthrough;
 		case CS8409_WARLOCK_MLK:
 		case CS8409_WARLOCK_MLK_DUAL_MIC:
 			spec->scodecs[CS8409_CODEC0]->full_scale_vol = CS42L42_FULL_SCALE_VOL_0DB;
@@ -1197,8 +1230,13 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		cs8409_cs42l42_hw_init(codec);
 		spec->init_done = 1;
 		if (spec->init_done && spec->build_ctrl_done
-			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
-			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
+			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in) {
+			if (spec->delay_jack_detect)
+				schedule_delayed_work(&spec->jack_detect_work,
+						msecs_to_jiffies(CS8409_JACK_DETECT_DELAY_MS));
+			else
+				cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
+		}
 		break;
 	case HDA_FIXUP_ACT_BUILD:
 		spec->build_ctrl_done = 1;
@@ -1208,8 +1246,13 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		 * Run immediately after init.
 		 */
 		if (spec->init_done && spec->build_ctrl_done
-			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
-			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
+			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in) {
+			if (spec->delay_jack_detect)
+				schedule_delayed_work(&spec->jack_detect_work,
+						msecs_to_jiffies(CS8409_JACK_DETECT_DELAY_MS));
+			else
+				cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
+		}
 		break;
 	default:
 		break;
diff --git a/sound/hda/codecs/cirrus/cs8409.h b/sound/hda/codecs/cirrus/cs8409.h
index be1714a84fff4..dacc1083b9d46 100644
--- a/sound/hda/codecs/cirrus/cs8409.h
+++ b/sound/hda/codecs/cirrus/cs8409.h
@@ -247,6 +247,7 @@ enum cs8409_coefficient_index_registers {
 #define CS8409_CS42L42_AMIC_PIN_NID		CS8409_PIN_ASP1_RECEIVER_A
 #define CS8409_CS42L42_DMIC_PIN_NID		CS8409_PIN_DMIC1_IN
 #define CS8409_CS42L42_DMIC_ADC_PIN_NID		CS8409_PIN_DMIC1
+#define CS8409_JACK_DETECT_DELAY_MS		100
 
 /* Dolphin */
 
@@ -266,6 +267,7 @@ enum {
 	CS8409_BULLSEYE,
 	CS8409_WARLOCK,
 	CS8409_WARLOCK_MLK,
+	CS8409_WARLOCK_MLK_DELAYED_JD,
 	CS8409_WARLOCK_MLK_DUAL_MIC,
 	CS8409_CYBORG,
 	CS8409_FIXUPS,
@@ -339,12 +341,14 @@ struct cs8409_spec {
 	unsigned int i2c_clck_enabled;
 	unsigned int dev_addr;
 	struct delayed_work i2c_clk_work;
+	struct delayed_work jack_detect_work;
 
 	unsigned int playback_started:1;
 	unsigned int capture_started:1;
 	unsigned int init_done:1;
 	unsigned int build_ctrl_done:1;
 	unsigned int speaker_muted:1;
+	unsigned int delay_jack_detect:1;
 
 	/* verb exec op override */
 	int (*exec_verb)(struct hdac_device *dev, unsigned int cmd, unsigned int flags,

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260710-fix-headphone-plug-cirrus-dell-5e3b49da5f52

Best regards,
--  
Steven 'Steve' Kendall <skend@chromium.org>

