Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B1B15A86D
	for <linux-sound@vger.kernel.org>; Sat, 18 Jul 2026 02:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784340348; cv=none; b=IDFiyJJXQe0Qf5Zmz1qJYB0oksIZ8UaM9CuvruCvRQfVnK6qFL9uN3iD3s4a25Zz7PTvygSdH7VhlUta8UDNf74GW9Gc7ya6DdQBPqHudL4EoyOqAYM0etCNoqclTvRo5khTQtv4p18SSSiJhqWDNESVMmOMnUlotg1Z5AmiFC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784340348; c=relaxed/simple;
	bh=0yUauwAuo7KwsaNZd38tPwSx5JIY9Ik380N6sogF4ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ldes4mtXz+EVAqeB37HbFNaxFxqdyh1tC04ZyZZBfZClEG4098ovvlD5aKJafoDWQ0Ov1+DkFOknnRYewMHV8zKluB7wWSAUsDXdIHXAOWo8FiDloPr8QxzyKge6s8MpqgnRtEwoEcj27yb7yAns8IYoOlGi/4ur7CcdP9YD+CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lHKRFxQT; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lHKRFxQT"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-664b05d408bso4394984d50.1
        for <linux-sound@vger.kernel.org>; Fri, 17 Jul 2026 19:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784340345; x=1784945145; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iOqNUcr0RPgPISLKJza4GrzUf3x35l3B/ya5sMd3KB8=;
        b=lHKRFxQTajnGdEMo88VC4JiiKSsEuBJYfuXpPLxVHsjBTz7zahMbegMgheVBf+U34c
         DCMD6J+ox7mG++X7OqIjszf7gomgleeicXzr1BJ8tIjGkKKc46LU4wdKJDolCp2H4Pg8
         MGVs7dIBXXVWBKjIvxwULj41FlzY5/vCtb/Bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784340345; x=1784945145;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iOqNUcr0RPgPISLKJza4GrzUf3x35l3B/ya5sMd3KB8=;
        b=KBWdzG3Ttmt4ypnOUAIQkqt4B4d1SGV2veAq1m9o1BxpaWhqQH+LQuRaSs3PU5pudv
         H4xWTpDenaLxlW8SmMrKKd8aEpEURLgh7kcgksFTN2NSA2lq2KVmm+fHsvMKcpb+YxCI
         BQhx+Lqp9tvO6gUvMJWsAXjafM66LYGBYOcvGTF4H0EQuojNhQ/IDvoqqpXOhxQphX/7
         37BtVLNSfbyhP8Wik8v+FejlypeWcqgW0KuvEct3k2rHod0SttAO+rfriB/JcYNaDhhQ
         vtkoWzPFBOuP85UqTv7gypDrvXElO46EndHoCCtwTPiSdfsQzmIUhdA+5ZOkfYb3BWoX
         l/MQ==
X-Gm-Message-State: AOJu0Yxjr2NtL6aHF2FbPbZR2OpURnIIAKq7N8g2Vzp0M0fg5ofXDHox
	bmMwp/5Gxqwd/aK1jgZ8g9gYrwmVDkOFmHmyDQfTNVh8F6JQGeYpB8FEg9M66sSV7g==
X-Gm-Gg: AfdE7cl+xcC/IvVAqq5VICzm5ZDu/A36JxSFPy4MyWvNy6/ngKhRMiHkHFQv2CRqTgM
	+cHhDB13YVrXQCUwU6lSfObhKg2i8TDoacCgEzlhc9YLEa/ARzf5qgd9Dw05M8/xXDtHhA2Hx7R
	TqkpNepjD98GcOQTbW/GoaFJshI5oCQC6z9Mkm0VcVLt3XNHxTIz8k/WG74ry2o4JKQR3JspshM
	IH3tXevMHdyTML6+FNg7N58l82oGwGRGvLpOo/OWzwVpZv8/vajfg9fYkxgDmXcIvrVuhNEjQc2
	zwPFtRTqyJgt/IN33amzF6l1xDeFN0wfUO9wT4FKupISHHfWv/xo3V9QT/oJpWAjXcdtoJBMfTi
	X0vzLFioPYlukxubfFh/w/FLqLJ4a98+ryXQSy/cHAu36EGtby/cSRQTUjp1+dxXvloINXJqm60
	S1MscI4l4+6jFZj6ezXey0LcweyOBgucCxLL78FDpAkAGB2bQ395YRnEshIUhk
X-Received: by 2002:a05:690e:80a:10b0:667:b08e:2a2 with SMTP id 956f58d0204a3-6683bc1d92bmr1125722d50.27.1784340345091;
        Fri, 17 Jul 2026 19:05:45 -0700 (PDT)
Received: from ripwilburliny.c.googlers.com (188.63.48.34.bc.googleusercontent.com. [34.48.63.188])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6683b80eb49sm2809821d50.11.2026.07.17.19.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 19:05:44 -0700 (PDT)
From: Steven 'Steve' Kendall <skend@chromium.org>
Date: Sat, 18 Jul 2026 02:05:41 +0000
Subject: [PATCH v2] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-fix-headphone-plug-cirrus-dell-v2-1-f88121570d62@chromium.org>
X-B4-Tracking: v=1; b=H4sIAHXfWmoC/4WNQQ6CMBBFr0Jm7RhaqERX3MOwwHagkwAlUyEaw
 t2tJK5dvp/89zaIJEwRbtkGQitHDlMCfcrA+nbqCdklBp3rS16pHDt+oafWzT5MhPOw9GhZZIn
 oaBjQUPEor641ndGQJLNQehyBe5PYc3wGeR+9VX3Xn7r4p14VKiysUaayrjTW1dZLGHkZz0F6a
 PZ9/wAQnHsMzwAAAA==
X-Change-ID: 20260710-fix-headphone-plug-cirrus-dell-5e3b49da5f52
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Steven 'Steve' Kendall <skend@chromium.org>
X-Mailer: b4 0.15.2

On some models like the Dell Inspiron 15 3520, jack
detection does not work. This patch switches to
delayed work to fix jack plug on Chrome OS.

---
This patch switches to a delayed work method for a
specific Dell machine (Inspiron 15 3520). This fixes
jack detection for this model.

Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>
---
Changes in v2:
- Changes from v1 have been removed.
- New approach uses delayed work and also solves the issue on this machine.
- I'm now using the latest release of b4. Hopefully this addresses the formatting issues I was having!
- Link to v1: https://lore.kernel.org/r/20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org

To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 sound/hda/codecs/cirrus/cs8409.c | 32 ++++++++++++++++++++++++++++++--
 sound/hda/codecs/cirrus/cs8409.h |  1 +
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/cirrus/cs8409.c b/sound/hda/codecs/cirrus/cs8409.c
index c43ff3ef75b6e..785946e29ce30 100644
--- a/sound/hda/codecs/cirrus/cs8409.c
+++ b/sound/hda/codecs/cirrus/cs8409.c
@@ -56,6 +56,10 @@ static int cs8409_parse_auto_config(struct hda_codec *codec)
 }
 
 static void cs8409_disable_i2c_clock_worker(struct work_struct *work);
+static void cs8409_jack_detect_work(struct work_struct *work);
+static void cs42l42_run_jack_detect(struct sub_codec *cs42l42);
+static int cs8409_i2c_read(struct sub_codec *scodec, unsigned int addr);
+static int cs8409_i2c_write(struct sub_codec *scodec, unsigned int addr, unsigned int value);
 
 static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
 {
@@ -69,6 +73,7 @@ static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
 	codec->power_save_node = 1;
 	mutex_init(&spec->i2c_mux);
 	INIT_DELAYED_WORK(&spec->i2c_clk_work, cs8409_disable_i2c_clock_worker);
+	INIT_DELAYED_WORK(&spec->jack_detect_work, cs8409_jack_detect_work);
 	snd_hda_gen_spec_init(&spec->gen);
 
 	return spec;
@@ -115,6 +120,27 @@ static void cs8409_disable_i2c_clock_worker(struct work_struct *work)
 	cs8409_disable_i2c_clock(spec->codec);
 }
 
+static void cs8409_jack_detect_work(struct work_struct *work)
+{
+	struct cs8409_spec *spec = container_of(work, struct cs8409_spec, jack_detect_work.work);
+	struct sub_codec *cs42l42 = spec->scodecs[CS8409_CODEC0];
+
+	if (spec->init_done && spec->build_ctrl_done && !cs42l42->hp_jack_in) {
+		int reg_ts_status = cs8409_i2c_read(cs42l42, CS42L42_TSRS_PLUG_STATUS);
+
+		if (reg_ts_status < 0)
+			return;
+
+		if (((reg_ts_status & (CS42L42_TS_PLUG_MASK | CS42L42_TS_UNPLUG_MASK))
+			>> CS42L42_TS_PLUG_SHIFT) == CS42L42_TS_PLUG) {
+			cs42l42_run_jack_detect(cs42l42);
+		} else {
+			/* Make sure Tip Sense interrupts are unmasked */
+			cs8409_i2c_write(cs42l42, CS42L42_TSRS_PLUG_INT_MASK, 0xF3);
+		}
+	}
+}
+
 /*
  * cs8409_enable_i2c_clock - Enable I2C clocks
  * @codec: the codec instance
@@ -953,6 +979,7 @@ static void cs8409_remove(struct hda_codec *codec)
 
 	/* Cancel i2c clock disable timer, and disable clock if left enabled */
 	cancel_delayed_work_sync(&spec->i2c_clk_work);
+	cancel_delayed_work_sync(&spec->jack_detect_work);
 	cs8409_disable_i2c_clock(codec);
 
 	snd_hda_gen_remove(codec);
@@ -1025,6 +1052,7 @@ static int cs8409_cs42l42_suspend(struct hda_codec *codec)
 
 	/* Cancel i2c clock disable timer, and disable clock if left enabled */
 	cancel_delayed_work_sync(&spec->i2c_clk_work);
+	cancel_delayed_work_sync(&spec->jack_detect_work);
 	cs8409_disable_i2c_clock(codec);
 
 	snd_hda_shutup_pins(codec);
@@ -1198,7 +1226,7 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		spec->init_done = 1;
 		if (spec->init_done && spec->build_ctrl_done
 			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
-			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
+			schedule_delayed_work(&spec->jack_detect_work, msecs_to_jiffies(100));
 		break;
 	case HDA_FIXUP_ACT_BUILD:
 		spec->build_ctrl_done = 1;
@@ -1209,7 +1237,7 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		 */
 		if (spec->init_done && spec->build_ctrl_done
 			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
-			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
+			schedule_delayed_work(&spec->jack_detect_work, msecs_to_jiffies(2000));
 		break;
 	default:
 		break;
diff --git a/sound/hda/codecs/cirrus/cs8409.h b/sound/hda/codecs/cirrus/cs8409.h
index be1714a84fff4..19ea0affb9764 100644
--- a/sound/hda/codecs/cirrus/cs8409.h
+++ b/sound/hda/codecs/cirrus/cs8409.h
@@ -339,6 +339,7 @@ struct cs8409_spec {
 	unsigned int i2c_clck_enabled;
 	unsigned int dev_addr;
 	struct delayed_work i2c_clk_work;
+	struct delayed_work jack_detect_work;
 
 	unsigned int playback_started:1;
 	unsigned int capture_started:1;

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260710-fix-headphone-plug-cirrus-dell-5e3b49da5f52

Best regards,
--  
Steven 'Steve' Kendall <skend@chromium.org>

