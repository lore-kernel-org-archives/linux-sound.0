Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FB8231A3B
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 00:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791333089; cv=none; b=CwcA7J8f25iLyEIEloIQerbBWshjZJ/6WK9cdklh6WHDeArrZFxQJh9cehFSISJGdfvVhp7t3Hz119lQVnLBYAzQK/GPvP7H+XKN7ON8qPOA8r3eGNQYigfBpdRevHLjSjcZm03Mwxu0YINdCZMKJvBz/PWGrkt665uDJcTYdt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791333089; c=relaxed/simple;
	bh=t1qUesrSPwTZJ7qrENmMUw+i1KmO1JUF7xvjDbtzqeE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dKzvJry9564BCkgu2xVeR+TKf0SQpEAvIJM+kObrs+MdL9p4HbPjoj+Be64UsUPwFJ7kGSXLhh2IUva9ATSScUPBM09I8vQvytyK/KSYNw1qbqikkV3QzCizKpiKthEtvromlMy/6sPVnYIinYH7W6GmYmEAoNgDJQXGijbfa5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GLnNuMjh; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GLnNuMjh"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67489c8202cso3468666d50.3
        for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 17:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791333086; x=1791937886; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VPNBsDgchbd7JIStat8oFQ2lIw0GIhWnueiuUIQNBPY=;
        b=GLnNuMjhb7K9+g9p+XJb6LqzVK/b5oabxQZFzN/ly/0DRXjInehF2ajXN7KB81wFwZ
         ZsCWiXeP65kl88eVB6D3+3W+RX0kXZ5f5YwnUJM5iUiTrkya2iuJgH3zsCg/lNnPRuzx
         9iht/JIEfV04uAdB1hURe1t+KqOlGiHmYOQnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791333086; x=1791937886;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VPNBsDgchbd7JIStat8oFQ2lIw0GIhWnueiuUIQNBPY=;
        b=E9VOFpydW1Ofdzh6wCqb5Rh0T0zQnRr/NX2tmt5QfQGkFCzK8s4OaMVf9tV5lRx/3B
         3u56V2PM+tKi+jgj/UI9KXyBlXVR1cveTOO4VrOpi0J6l+iSv5beP2N3M8wL1+ZBBWjq
         nhbmou0bQCVNtsTkSltxFYMXjdvRhQL/DVK42EtwWFaVoBbURJVv1l1AGa92WYMJVgo3
         AwQQQH0BX/Ilw6o7BFne4qKdq8M66/LsNIXTM0vZGmivS3rlzGnWLdZqONCINraj/IXm
         wp4KTI0DzDSw8Ipeux7JTdiwt8uhHWcWiPcNPNkmsshDRGFxeKYN5CujdwFxDPYV3pfk
         pDFg==
X-Gm-Message-State: AFq9FYJVedROrpKYpFjEpYa3RVs3TMDamyZnL/dX66IiwVqbJ47fjmkH
	MOBL63+ySlmvQ4QjFGvUzDMJnG2SD0Pz20KpeYcer7PuFVzP9PB4QkemPEa0MILNRw==
X-Gm-Gg: AYBFou0vHSq4+eANrgXjMqrxv1SqI/sKZhhG3LRCwCir05fnfGc7sww9YykJZCaOoeB
	wIDsI04va8aWFgBZ1I8T9Ewolb/u2AJhwni+3Apyfn+CaMNGtzqDkOXwaqwlJ4Ju+E1H/49YSV/
	Rn1jM4miwHB+d5JBJSst6w/4z9tRbG+VMnAKz1NYJazBpS5Q5lUmcAxD/wZTHKxahjOxG2Nbjy0
	57yFFKYzK56UBfsWS85u2LWZN8vildcTGuIPRMvKz2izoXMix9JI+5echEndRD12BP0pISfTJZp
	aEJ3xf7pcVTnqGbJV3NO7q8MhkmXxOEREhNMk17hVr6acNSP1+wpckfXMi5PJaAsbx6b1lF3kZN
	ESmrOOCV7IsB978PbANG6/8W/B9K+UqNGbKTTcORqKSMfStJPrHv5l2XGow49poglj8zW3Itt2O
	KG1ESrp7a8+Yoe6lB2Vm0KtRzCc6t5wPfqAz4yO6QGz1YGnIVLVK7gVN6DzDItfNZzrQ5NabcaQ
	o+Q4QBb4d5iiONvHrYsRMyC/q5A8jjOjWq12Z2DSXb4V6Ux46Nx5xdKt1sJ
X-Received: by 2002:a05:690e:4006:b0:676:d3fa:cd25 with SMTP id 956f58d0204a3-6790a4005f3mr584385d50.36.1791333086030;
        Tue, 06 Oct 2026 17:31:26 -0700 (PDT)
Received: from ripwilburliny.c.googlers.com (159.68.194.35.bc.googleusercontent.com. [35.194.68.159])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67909922c6bsm337560d50.11.2026.10.06.17.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 17:31:25 -0700 (PDT)
From: Steven 'Steve' Kendall <skend@chromium.org>
Date: Wed, 07 Oct 2026 00:31:24 +0000
Subject: [PATCH v5] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-fix-headphone-plug-cirrus-dell-v5-1-c28146b18d5c@chromium.org>
X-B4-Tracking: v=1; b=H4sIANuSxWoC/4XPTWrDMBAF4KsErTtFfyPLWfUepQtHGlsCxzJSb
 VqC7145UBpKwMs3MN+bubFCOVJh59ONZVpjiWmqAV9OzIVuGgiir5lJLg1vBIc+fkGgzs8hTQT
 zuAzgYs5LAU/jCEjqolvfYY+SVWTOVDfuBe8fNYdYPlP+vvetYp/+0uqIXgUIUA4FNs5rdP7Nh
 Zyucbm+pjywXV/lo2gPRVnF3lohq8m9kU9E9Se2Ag9FVUXjHSJeOO+NeCLqR/H4Rr1/bZ3UVtu
 uMe0/cdu2HyGQaWzFAQAA
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
Changes in v5:
- Switch to disable_delayed_work_sync() where appropriate.
- Call cancel_delayed_work_sync() before cs42l42_suspend() to prevent racing.
- Link to v4: https://patch.msgid.link/20260918-fix-headphone-plug-cirrus-dell-v4-1-38c24848a769@chromium.org

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
 sound/hda/codecs/cirrus/cs8409.c        | 52 ++++++++++++++++++++++++++++++---
 sound/hda/codecs/cirrus/cs8409.h        |  4 +++
 3 files changed, 60 insertions(+), 5 deletions(-)

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
index c43ff3ef75b6e..12ee71d7a35c0 100644
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
@@ -951,6 +977,8 @@ static void cs8409_remove(struct hda_codec *codec)
 {
 	struct cs8409_spec *spec = codec->spec;
 
+	/* Disable jack detect work */
+	disable_delayed_work_sync(&spec->jack_detect_work);
 	/* Cancel i2c clock disable timer, and disable clock if left enabled */
 	cancel_delayed_work_sync(&spec->i2c_clk_work);
 	cs8409_disable_i2c_clock(codec);
@@ -1020,6 +1048,9 @@ static int cs8409_cs42l42_suspend(struct hda_codec *codec)
 
 	cs8409_enable_ur(codec, 0);
 
+	/* Cancel jack detect work first as it accesses CS42L42 over I2C */
+	cancel_delayed_work_sync(&spec->jack_detect_work);
+
 	for (i = 0; i < spec->num_scodecs; i++)
 		cs42l42_suspend(spec->scodecs[i]);
 
@@ -1153,6 +1184,9 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 			spec->scodecs[CS8409_CODEC0]->full_scale_vol = CS42L42_FULL_SCALE_VOL_0DB;
 			spec->speaker_pdn_gpio = CS8409_CYBORG_SPEAKER_PDN;
 			break;
+		case CS8409_WARLOCK_MLK_DELAYED_JD:
+			spec->delay_jack_detect = 1;
+			fallthrough;
 		case CS8409_WARLOCK_MLK:
 		case CS8409_WARLOCK_MLK_DUAL_MIC:
 			spec->scodecs[CS8409_CODEC0]->full_scale_vol = CS42L42_FULL_SCALE_VOL_0DB;
@@ -1197,8 +1231,13 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
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
@@ -1208,8 +1247,13 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
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

