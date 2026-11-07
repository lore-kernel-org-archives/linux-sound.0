Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794093789;
	b=DuR6qZPOeSO89VUVj6ADqAMfH07nac3ccwUkpPyvNgtH0EuBixC3ky8C+By9kQWNozvJ
	 fYtJwBGnkXho+a3pM8V9cB0RYRHMzRaRINllSQOaUNJrGbcu9MaaCVrH6JiMDOhlNcvPD
	 Y6aaAgPmm1zM5rNbp+tt8qYYulZGNFdU2l8Y181RfrYTF7O7dcL8rTZIKiaYfJouBOEwb
	 v7pvzXyJzKhqfk+uzyIe852T9QkMvAoU8IHJZxhJOFMXJr3JGc7GVECep24kXObhFqUW7
	 V0lSz3vLkMtl4v0K1jW9c5pwitTQBm1FWu0ysbz8oRwX/Dc6UUNIwQU3qzw2x+OB4Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794093789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=moLlKHwkdn7UQ53+LKg66hlQ5XXQ9TPFyz5LXsquMhc=;
	b=bHZkjVp3kqfKmXwg0N8H/wqscRWq4osPPq3Sx4lJ88gdttXMt89pHpxhTB3FOzzrtpFg
	 5XghfTRxA78/cmaa3CKK91o7bICQzqHpHgAZQn6YQZ3GUZRtGeOMcLl3+pN/Ynx4VubON
	 1vgq1mYubOzCOh0ByRC5tuzVeoIBroH8/avlNTRBmNTln4Sigqcjs5Pt48mzwmx1ylbb6
	 Vr2bGGjLWskbXiLNCQUi1jiiIlcjmZxjtPoZ5T4eye6/AoCCU2R7zZsw1kAUOhHtuuHBN
	 05W/TePS1q4cSmc4+0uE9++/d55eH3qWC+GoIhyZ/9m24/eQobtzNg/iZtIjGlhjIGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gt7qzFlM;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21F9606A335
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 23:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B21F9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gt7qzFlM
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8439fe796ebso35287a34.3
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 15:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794093788; x=1794698588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=moLlKHwkdn7UQ53+LKg66hlQ5XXQ9TPFyz5LXsquMhc=;
        b=gt7qzFlMpqoYZvEiX1Ybh8HkLCv49AvDKm3uDsTFbK1E0fHQFWlB3O4Q+eZeu+2Lpd
         uyoNawZvBIAeqwNm6tRgLHJlBLxoUomnV+BFRmgGhCxVImQUo90BBWGuAERxrwTy+YgR
         CsAIyka1dDQ4itmAXF1ZqPDU7J3/ERnNL6G+9uvL2lhI6exgrfOtUO7S2XwfT0m/1rAo
         ioSpV1NWFvDFrKZOY0Is+lZ4NTD4g0wQId8fBNVJSxdFTvw6Dreq+RW0oG/6IHlhkma+
         Xtg/ozAeL3dqovvHy2tsAZO0bM19XiEJf3yst2TatGWuTJbSOgkYCy39c/Yy+rfCTQE1
         aKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794093788; x=1794698588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=moLlKHwkdn7UQ53+LKg66hlQ5XXQ9TPFyz5LXsquMhc=;
        b=nqqfZVF1H61hIyvoM+mcOg0RNu9UL9E7DUPR7BeUgfCkR+TKo2HJSfEby5RB1As5Ad
         yaWIbjwlxvrWiMXrUopmNT789HihFlwxCJ72sW5cLKczWFydp9L1GByLPtmMhZ2xFNos
         /3r0eVGRCX8sjyVudMiFJF2JYRt6Zudnr7YXr221pTV07WHaXuk1NP/FkiKo6xtS9n1W
         J+obeGFbOlwZomaN365uRG7wcodBRKzeexWLtNHWSVpdcLxJ1YfQnUJfqh2WOnhDWgNb
         s/gm34BkD+7EZf2TsQZJ2wwrwi+NxQ41Zd7ZDRZxJ8wbyJn0XE+reGp3LolP+Xin5W2k
         HgsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDmLiD2H0nxe8VEt/ktibiRwzM8byyJD83N6IbxcLtQaK4OAJDladRSgfzwvhwQQdxMIOcG2PVwgZRWA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q3TXvlEnSZfCsUnVfAY4ncMFTk6nHrNzsJHiDXBzi5el7VPII
	O8WsJfZmy08czP0LMLSa97FLlwOJcb8GT4H9zkJcBZt39OxzQxhuQx2L
X-Gm-Gg: AYBFou04aDKyXQ1MRYZJO0JxmdXFJAPYoMK8kqFHf1GIyaM4PjCN4PrqYl41/KfO3+a
	gseTRnEera5N8GX2mRg8OFaSCVU9QtegUl3/dqxrctbLhllogz2d/uuAKvJntyC9Ug0qKJzTC0F
	WFpk9rgJDRMdndNLY0rysMc6acwfldwkDdxmWB+z91LW3X538PRL4C5thvhydLrDebrDIGlVo5O
	YK1fMtFFFmOzZPNh+f8F/Sqaj+1yxVVLq446KJ4tHuY8SegNED58/Ej7ced8zOA1tb8kz4tCG6D
	YZdyrKuep083qERJTZ2XJkhlFk8C46r3Vl4DU84h8QQd3iw6xBM11Yqnj0sfNe3tJtlDH+erMvU
	F6bpdCYypRMbQZJO3/P0O3bQ++kp3D6ZeKYrlt33pE/x80l6l0mw8zMGPMLOhjDcm67w5WbK/TV
	5pUua0OgDN04MiVnoywwRrXsceh8IEIqvBTYABawUE/n2O7a7JdOXhLsKjykpOXLlmcebdTA1eK
	kGECWDpvSg0TlI6G9PMK6Lp+qzBhfDEYlRGoZtJ/qQubeWT6u4rWMAVs2MP/jWStSe1qYoWRLph
	HSQKsBUh46I=
X-Received: by 2002:a05:6830:270a:b0:81d:2120:d5bb with SMTP id 46e09a7af769-85f508a875amr183178a34.30.1794093787683;
        Sat, 07 Nov 2026 15:23:07 -0800 (PST)
Received: from huawei-d14 ([2806:104e:25:7de8::2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4f2df8dfsm329315a34.0.2026.11.07.15.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:23:07 -0800 (PST)
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
Subject: [PATCH v2 2/2] ASoC: amd: acp: es83xx: Enable speaker amplifier after the codec output
Date: Sat,  7 Nov 2026 17:22:25 -0600
Message-ID: <20261107232225.3838-3-samuelslg03idk@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107232225.3838-1-samuelslg03idk@gmail.com>
References: <20261107232225.3838-1-samuelslg03idk@gmail.com>
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

The speaker amplifier GPIO is driven from a SUPPLY widget. DAPM powers
supplies before the rest of the path, so the amplifier is enabled while
the ES8316 headphone driver and charge pump, which also feed the
speakers, are still powering up. This results in an audible pop every
time the speaker output is powered on.

Move the speaker GPIO handling to the Speaker endpoint widget, which
DAPM powers up last and powers down first, and give the codec output a
short time to settle before enabling the amplifier.

The headphone path is left unchanged: the Headphone endpoint widget
shares its power-up rank with the codec output drivers, so moving it
would not guarantee the same ordering, and it could not be tested.

Fixes: 54fcd9dd44b2 ("ASoC: amd: acp: Add machine driver that enables sound for systems with a ES8336 codec")
Signed-off-by: Samuel Leyva <samuelslg03idk@gmail.com>
---
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index fb675774f..66b0b3ffa 100644
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
@@ -114,7 +117,7 @@ static struct snd_soc_jack_pin es83xx_jack_pins[] = {
 };
 
 static const struct snd_soc_dapm_widget acp3x_es83xx_widgets[] = {
-	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_SPK("Speaker", acp3x_es83xx_speaker_power_event),
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Internal Mic", NULL),
@@ -122,9 +125,6 @@ static const struct snd_soc_dapm_widget acp3x_es83xx_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("Headphone Power", SND_SOC_NOPM, 0, 0,
 			    acp3x_es83xx_headphone_power_event,
 			    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
-	SND_SOC_DAPM_SUPPLY("Speaker Power", SND_SOC_NOPM, 0, 0,
-			    acp3x_es83xx_speaker_power_event,
-			    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
 };
 
 static const struct snd_soc_dapm_route acp3x_es83xx_audio_map[] = {
@@ -138,7 +138,6 @@ static const struct snd_soc_dapm_route acp3x_es83xx_audio_map[] = {
 	 */
 	{"Speaker", NULL, "HPOL"},
 	{"Speaker", NULL, "HPOR"},
-	{"Speaker", NULL, "Speaker Power"},
 };
 
 
@@ -186,10 +185,13 @@ static int acp3x_es83xx_speaker_power_event(struct snd_soc_dapm_widget *w,
 	struct acp3x_es83xx_private *priv = get_mach_priv(card);
 
 	dev_dbg(priv->codec_dev, "speaker power event: %d\n", event);
-	if (SND_SOC_DAPM_EVENT_ON(event))
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/* Let the codec output settle before enabling the amplifier */
+		msleep(ES83XX_AMP_ON_DELAY_MS);
 		priv->speaker_on = true;
-	else
+	} else {
 		priv->speaker_on = false;
+	}
 
 	gpiod_set_value_cansleep(priv->gpio_speakers, priv->speaker_on);
 	gpiod_set_value_cansleep(priv->gpio_headphone, priv->headphone_on);
-- 
2.56.0

