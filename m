Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794088054;
	b=1vblaq9YFF4vmaOXdufzgdOTVAazh6nSwZ1shNL2pHmg0+546rKhFNJmb5uDPm4xrfBw
	 Sg06bxPrEkWGUVQZyQ6k453gRiEkUmYmE+kiwG0CJxjQMgSro2ZlEj2ZRB/WG06K54Zw2
	 8MV1wFEz+QXOsYD21+VkU6xerQgYbmXptYM1wila7+v5AAjkxlzrzxr3qSblQyuJlopTl
	 IKx0mWDaZoZ/DphdrfTnFoyE49Is+RuqnxMmzgv+XOgQsMF3TcY/1kEjLNk2/WAUWI+4k
	 Xw3RhPdAbm3Bd2wb2azbEEZIukORglsZKPJeG/tYBW+TZe3ENYqqturoymqV5vIfX0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794088054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NGMljU8i0CzYubSHwRnXU3KUoCyXo07gCimyz3WL1DY=;
	b=uBqFuPe2FAxog1S3yJhq+Q48Ha4SyOBopMxIkSlTVcUSAANZRYCD5JHxVRFiiB7oo4Mx
	 xCEYlTWX1dqmJE6l1RSqFTiNDw506VizJtnOFG8xHTlu5L8Zu98WUpFCqYM3Uq19nqgh3
	 8tckZFvPnZtla29m/6Wio8KC6Bh+xdCPFAncsTF8P4iNRARCbKOot9/wK/2lBCeRtSy0J
	 xALpVOeIQao3NiONlLLptEJSHcZ1OEBXcIA1DgV+iG6AMrxHwp9pOwHndoDzS7Ibyyy1n
	 xbbmTO0tXShhdN+qtyjUrTYEEzi5kPmolrJkfirDhAECUtO9XJo+3HrGTljUQiuRwpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JaE+tugZ;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B18F606D801
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 21:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B18F606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JaE+tugZ
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-82109f51565so9166a34.2
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 13:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794088053; x=1794692853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGMljU8i0CzYubSHwRnXU3KUoCyXo07gCimyz3WL1DY=;
        b=JaE+tugZEwYWESR2YltaSzM776q8Mp/prLUPtxqZcvdj6KivQM5IEVRFZFE6PB+iB5
         n5PDUJcoEtyJUPF56dg24Bk7U5u+poNJwgbTvxzK00VZNkQxQBsp+kJblQVhFdLGtZgV
         cQJeT2XIC9tCcTEbWJQKKcyHdHNOz5MFYfhpZcIdpK4w13BunjCluNkRFT9YtE55trt8
         9rYbdTBkGLIImY9iBlpKRUqvfqg0lzDdDq8htF7BKJq+ezirKXZCbolcVOrnE0n72hyD
         OYTi2fkkpyeJQMG2VvuoqMjhEb3xo+PWCvlxIzxgcNpKztM8z2GvshphqR/8sVDMFns5
         C+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794088053; x=1794692853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NGMljU8i0CzYubSHwRnXU3KUoCyXo07gCimyz3WL1DY=;
        b=zFuDWjLsA0o8PY956HqjOFnAibJxpG32DJMOVlnD7kFi9s+ApK5LuD96xzw2DCQy5Z
         RIX2Bkn/AcjbqSGUMn/p2oBDth9bTiJ5Yem7FbYyPou6kLL6aoXNw3PGHFcXUwE7zlJZ
         TwyRHxhMD+5U+XX8+g1A+BUGbx9uIFtYnAhiQ35FWqHg5g5mnvKAigZHt+d0OXm1MdOW
         SI0ESB0BTxcCfeAJ5s+NQ4dX4WayOH+kU7hIMYMCa0kk0SqQ6DRGfsV9nSbUm5iPHws+
         3p1HiRffcH/s/yyq+pxZuzUlcR7scTjLwe+n1R2sEjSyDnBew+ctYfDYNxZHww4IAVaZ
         2P0g==
X-Forwarded-Encrypted: i=1; AKwUvBxDR17D8ay9hZMN1bsk9kros2TUvmWBiFyI0IsXii5wZS+LgscWKUnr3vCeNQcZ126xNd1+M82Nuw6vZg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8XYOuhxnKJVaabnMS1QyXX6hM2UxIirhzDfo9XDtZKEtve6rMN
	z1YiJxNoerJR/6SXP9SjX7ePsRdFB70E1wlumzIOzmAuyp0uOJgPDJsB
X-Gm-Gg: AYBFou3gtLnjKYtC2RxCFNc0atlTvp26IEDCQtZXBSFcsgWkJcsP2tme+iDenmKyUaF
	vQBOfUoiofK+33mCDE59NAuWKqCPE5pkPzjZ0QozIS3d5cCJVi6u49W68Gly4hueEmdl0JCr2yA
	dIwJAdOz0kQO6+3KCl+TbN0vxh+Dw7AMHdWJez8ovwiR4SY2rWR+LzCjlQaXbC8FJL7HRO1tynd
	JolqURiYjKLgGnzD6Ym0ZxgYPykHfQwoWphGA3wTBdsF8k0YLDfoENIGLY5+g5JiwzR8ZIImw/m
	hzSyxo0ST2uhMX2SRXE0ZEE39Uu6Y1ssLFfxNmdD8NBDryvga/EUJ88kqrbtWizkeZHTUiCvxjK
	XbWBQF9WHKNUmn55y5JHZ8dks1SXADnwIBQema9DeWdctWRtZT5gmcpRqOO4cs4jOqmCkk/Pc+k
	ae6ydYEvoYpnCMAImC6HRVJnKNBXhD+Z8ntgHNjXN7rAinB6oBu4A7SgOuEdZ6JBBQEaLJ9mlvn
	O8dliyQHi4ul5Ry8UadgNzWm7VlrDxeH3ZMUgJkDnYgRQphnMKTw4mMsdHAOJzEMPVREOTRo9PH
	dz1AWMYVyzI=
X-Received: by 2002:a05:6830:4c16:b0:7fa:ab72:9e01 with SMTP id 46e09a7af769-85f508d8e9cmr63578a34.25.1794088053214;
        Sat, 07 Nov 2026 13:47:33 -0800 (PST)
Received: from huawei-d14 ([2806:104e:25:b43e::1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fb70ab1sm159512a34.14.2026.11.07.13.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 13:47:32 -0800 (PST)
From: Samuel Leyva <samuelslg03idk@gmail.com>
To: broonie@kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Leyva <samuelslg03idk@gmail.com>
Subject: [PATCH 2/2] ASoC: amd: acp: es83xx: Enable amplifiers after the codec output
Date: Sat,  7 Nov 2026 15:47:14 -0600
Message-ID: <20261107214714.11392-3-samuelslg03idk@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107214714.11392-1-samuelslg03idk@gmail.com>
References: <20261107214714.11392-1-samuelslg03idk@gmail.com>
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

The speaker and headphone amplifier GPIOs are driven from SUPPLY
widgets. DAPM powers supplies before the rest of the path, so the
amplifiers are enabled while the ES8316 headphone driver and charge
pump are still powering up, which results in an audible pop every
time the output is powered on.

Move the GPIO handling to the Speaker and Headphone endpoint widgets,
which DAPM powers up last and powers down first, and give the codec
output a short time to settle before enabling the amplifier.

Tested on a Huawei MateBook D 14 (NBM-WXX9).

Signed-off-by: Samuel Leyva <samuelslg03idk@gmail.com>
---
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index fb675774f..0a05f1f08 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -18,6 +18,7 @@
 #include <linux/input.h>
 #include <linux/io.h>
 #include <linux/acpi.h>
+#include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/string_choices.h>
 #include "../acp-mach.h"
@@ -60,6 +61,8 @@ static const struct snd_pcm_hw_constraint_list constraints_channels = {
 #define ES83xx_12288_KHZ_MCLK_FREQ   (48000 * 256)
 #define ES83xx_48_MHZ_MCLK_FREQ      (48000 * 1000)
 
+#define ES83XX_AMP_ON_DELAY_MS	50
+
 static int acp3x_es83xx_headphone_power_event(struct snd_soc_dapm_widget *w,
 					    struct snd_kcontrol *kcontrol, int event);
 static int acp3x_es83xx_speaker_power_event(struct snd_soc_dapm_widget *w,
@@ -114,23 +117,15 @@ static struct snd_soc_jack_pin es83xx_jack_pins[] = {
 };
 
 static const struct snd_soc_dapm_widget acp3x_es83xx_widgets[] = {
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_SPK("Speaker", acp3x_es83xx_speaker_power_event),
+	SND_SOC_DAPM_HP("Headphone", acp3x_es83xx_headphone_power_event),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Internal Mic", NULL),
-
-	SND_SOC_DAPM_SUPPLY("Headphone Power", SND_SOC_NOPM, 0, 0,
-			    acp3x_es83xx_headphone_power_event,
-			    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
-	SND_SOC_DAPM_SUPPLY("Speaker Power", SND_SOC_NOPM, 0, 0,
-			    acp3x_es83xx_speaker_power_event,
-			    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
 };
 
 static const struct snd_soc_dapm_route acp3x_es83xx_audio_map[] = {
 	{"Headphone", NULL, "HPOL"},
 	{"Headphone", NULL, "HPOR"},
-	{"Headphone", NULL, "Headphone Power"},
 
 	/*
 	 * There is no separate speaker output instead the speakers are muxed to
@@ -138,7 +133,6 @@ static const struct snd_soc_dapm_route acp3x_es83xx_audio_map[] = {
 	 */
 	{"Speaker", NULL, "HPOL"},
 	{"Speaker", NULL, "HPOR"},
-	{"Speaker", NULL, "Speaker Power"},
 };
 
 
@@ -168,8 +162,11 @@ static int acp3x_es83xx_headphone_power_event(struct snd_soc_dapm_widget *w,
 	struct acp3x_es83xx_private *priv = get_mach_priv(card);
 
 	dev_dbg(priv->codec_dev, "headphone power event = %d\n", event);
-	if (SND_SOC_DAPM_EVENT_ON(event))
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/* Let the codec output settle before enabling the amplifier */
+		msleep(ES83XX_AMP_ON_DELAY_MS);
 		priv->headphone_on = true;
+	}
 	else
 		priv->headphone_on = false;
 
@@ -186,8 +183,11 @@ static int acp3x_es83xx_speaker_power_event(struct snd_soc_dapm_widget *w,
 	struct acp3x_es83xx_private *priv = get_mach_priv(card);
 
 	dev_dbg(priv->codec_dev, "speaker power event: %d\n", event);
-	if (SND_SOC_DAPM_EVENT_ON(event))
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/* Let the codec output settle before enabling the amplifier */
+		msleep(ES83XX_AMP_ON_DELAY_MS);
 		priv->speaker_on = true;
+	}
 	else
 		priv->speaker_on = false;
 
-- 
2.56.0

