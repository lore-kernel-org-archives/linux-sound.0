Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941C01DFF0
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 01:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770080534; cv=none; b=lry5x0pnuW3B3kNYHqep84YEvNYItqP8aQNcTbJa9FFb28Gh8K+f3c9qAMXGMocXCIS4M1i9TcnO+9KWJBWptr6s2yo5++su2WnB5TpoFNV3pl4/R7jPFF7lHm8NOP1tlJ3Pzae8xI36CBEb8EeHc3kn3T/diKeN9wpxYH41l1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770080534; c=relaxed/simple;
	bh=v6z2X+Fdd3gkkL9bkZZQ7sGHisbfsCWnTKhMOnBpfnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wzhks0Qhn10/HaI6wkZl/z92jzXlOAFjcb3BYy5IAhytOukxRTK2ZqO2x+4IFqpIdzHDfTfv2W/L31hp/aVjSFPAOY3yf7yFvOzLv/c7tNAJ5QmjuwXEJMy9xCUb+7CgcC/SpmElu6Kuz58TmhNhXwESZaxu70X7dULZaarSUOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dionne-riel.com; spf=pass smtp.mailfrom=dionne-riel.com; dkim=pass (2048-bit key) header.d=dionne-riel-com.20230601.gappssmtp.com header.i=@dionne-riel-com.20230601.gappssmtp.com header.b=TOfriTUz; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dionne-riel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dionne-riel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dionne-riel-com.20230601.gappssmtp.com header.i=@dionne-riel-com.20230601.gappssmtp.com header.b="TOfriTUz"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c6ac42b91eso629548385a.3
        for <linux-sound@vger.kernel.org>; Mon, 02 Feb 2026 17:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dionne-riel-com.20230601.gappssmtp.com; s=20230601; t=1770080531; x=1770685331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+Gb0+XF2VQxBj6Ow3rdFdJ6yl4kKYvIm3dcmDvHtJs=;
        b=TOfriTUz+cfpsAh+eLGv/XUmriQmk+hLIeexkDBwAMzTlja1Ge98sLvkuYf9uxKq1a
         OiaR7rbQVS+CugQ58Clji0JVN6sxaNGECmfXBXr1wy/3aHTU8nTcM1cs5mfcVVQoH7HU
         /BRnr/aD9jQy/ygaTO9wrEVggEQ58e/tIvtIPqcjyxl6m78WOxW3/OkSHvD/Yu3E4M8o
         j+yx+jDIqq2gFicCGVRAj/wILk8uwLuxVvXapK/Vxt1Of9sCjpaCGNsv7oZMy0lyQy2J
         i7sJQaM7JFuxUsSWCK3S7h8tbNUdazkbK7Vjt6rq6/xEJCapxY++N+a08BXENTWnYaJm
         kNWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770080531; x=1770685331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+Gb0+XF2VQxBj6Ow3rdFdJ6yl4kKYvIm3dcmDvHtJs=;
        b=WIwr5nrpyfMoWeXXCJ1GcAI97YQLhiBpcVo60fUvPAg8St4EciSOFwKN9aFy1Vlzqr
         bQGECWN03N/hI70YljOI7gQ9Pi4jY3am9xYTqWlJiPGuLUJk1JFUjmIvuY/6Nb8SgEtQ
         tCVrNm/XgfgwMotwyr9qBIUmFPTv0vxrJBw1Pju7nKjlwlPV3w84l645Ja4RGOJlbn2K
         4d4NHCJoaljpz+F0lBkkRPGEB47ZzXrC4qNgt16dKx/B+Ym0qLUMQKIsbw9R/yFgKDoI
         ia4ad43jOd2FGyjrO5gB46oa31m1eVbui2WGi8LfMiauGQfQ93LBQpRoUWaBPbWVjjF6
         RJpw==
X-Forwarded-Encrypted: i=1; AJvYcCXsLu2lKHOQPSxfDqx62Ng9jithOI0Q/EFSUOotfIR/Dqi0CqyUKOLpjKSagTj4BQURPtQDO2nVFc0FiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0SQ3w26YiSBhFBwjh2q+9lte5NcchTa08krpYetU62TolWZA7
	rtKt2cS+dyfj0lvZ8PFVCamomiKhVFHpLufmXnrC/sG+Eo0xT9NnEl/9+WBG5DsSo+vEjkuxjCN
	nLUA=
X-Gm-Gg: AZuq6aIJR91P3gYKC2dtj/VsjSU4F7L1wLB7zgSz4LIU+dKYzArwDpWvIj922IKi+bw
	xU4XrHHXdMyyUftXx2p1HKvgl0fBjm/Q5R0Xlh8yMAutArLWM56fiDn69ap625kaSHX4JZrfUN+
	odfihyyFs452nOxTsTQ0WzIJEClaKxdHCU8IFHOXBUxwsiVKj9ll4KxqZJk8bP55eKDmfKBKjtF
	QB60Q/xCwco2EWwFmps0aCMb2AWMFiF3T4IXUMgmcPECWv/AcMgZThMV8JouN618PzcWSCXfv3I
	4G5xdSRmAspdjLg/wQSfr59SIbiJifAPMcQc5eMAX/58ufi3pdTYXZsNMudzfxDtlADQZHMD/qS
	vlqEmFx7mEvLY26+qzxuxTIcIy/2mmx9+tKQFy4rwj6IwdCMiUjegDtUIyquhOEdwpbQ0seAO6c
	SH90nKO2C4BS+GByx+0xqxakSxkbiEk21xtdX4OUBkz8f3lXeEtfXp1WtFi3L3TnP8yg==
X-Received: by 2002:a05:620a:1995:b0:8a2:bff5:40d9 with SMTP id af79cd13be357-8c9eb1fbfd3mr1863581985a.16.1770080531424;
        Mon, 02 Feb 2026 17:02:11 -0800 (PST)
Received: from frankgrimes.elk-nominal.ts.net (135-23-195-66.cpe.pppoe.ca. [135.23.195.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c9f5e6ef7csm784153085a.42.2026.02.02.17.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 17:02:10 -0800 (PST)
From: Samuel Dionne-Riel <samuel@dionne-riel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Samuel Dionne-Riel <samuel@dionne-riel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for Minisforum V3 SE
Date: Mon,  2 Feb 2026 20:01:33 -0500
Message-ID: <20260203010132.1981419-2-samuel@dionne-riel.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First, adding a generic quirk for Bass speaker DAC avoidance.

This pattern (re-routing the bass speakers off of a DAC without volume
control) seems common enough that having a "model" to match against and
quickly use to verify may be worthwhile.

The alc285_fixup_thinkpad_x1_gen7 routing was selected, amongst the
different options, as it should allow tuning the ratio between both
speaker set.

The routing was verified using `hda-verb`, and picking either 0x00 or
0x01. Either routing made the volume of the bass speakers controllable.

    hda-verb /dev/snd/hwC1D0 0x17 SET_CONNECT_SEL 0x01

This likely will apply for the Minisforum V3, though there isn't a lot
of information to confirm whether or not the identifiers are the same.

This was verified on the Minisforum V3 SE, and the root cause (the bass
speakers routing) was found out by using pink noise, and playing with
the mixers.

Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>

---

Hi!

> Indeed it looks like that we can cleanup a lot regarding this DAC
> routing fix-ups.  Though, *_thinkpad_x1_gen7() has more workarounds
> about the control element renames -- which needs to be verified
> whether the very same workaround is applicable to other cases.

The renames were the reason I picked this particular fixup. It matches
the fact these are distinct speakers, and matches the role.

> IIUC, this kcontrol names (DAC1/DAC2) match with your device
> configuration?  Could you give alsa-info.sh output?

Indeed! Here is the output:

 - https://alsa-project.org/db/?f=69517ae9d95e21b50eddc64538c7094aaf356a07


See also v1 for the methodology additional commentary.
 - https://lore.kernel.org/linux-sound/20260201231216.1655154-1-samuel@dionne-riel.com/

Changes since v1:
 - Combined commits
 - Fixed order of the fixup table

Thank you for your time!

Signed-off-by: Samuel Dionne-Riel <samuel@dionne-riel.com>
---
 sound/hda/codecs/realtek/alc269.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index cafa48b5aceb5..5928f1f3c08d1 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3805,6 +3805,7 @@ enum {
 	ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED,
 	ALC288_FIXUP_SURFACE_SWAP_DACS,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO,
+	ALC245_FIXUP_BASS_HP_DAC,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6295,6 +6296,11 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc288_fixup_surface_swap_dacs,
 	},
+	[ALC245_FIXUP_BASS_HP_DAC] = {
+		.type = HDA_FIXUP_FUNC,
+		/* Borrow the DAC routing selected for those Thinkpads */
+		.v.func = alc285_fixup_thinkpad_x1_gen7,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -7344,6 +7350,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1e39, 0xca14, "MEDION NM14LNL", ALC233_FIXUP_MEDION_MTL_SPK),
 	SND_PCI_QUIRK(0x1ee7, 0x2078, "HONOR BRB-X M1010", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1f4c, 0xe001, "Minisforum V3 (SE)", ALC245_FIXUP_BASS_HP_DAC),
 	SND_PCI_QUIRK(0x1f66, 0x0105, "Ayaneo Portable Game Player", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x2014, 0x800a, "Positivo ARN50", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0x0214, "VAIO VJFE-CL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
@@ -7558,6 +7565,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC285_FIXUP_HP_GPIO_AMP_INIT, .name = "alc285-hp-amp-init"},
 	{.id = ALC236_FIXUP_LENOVO_INV_DMIC, .name = "alc236-fixup-lenovo-inv-mic"},
 	{.id = ALC2XX_FIXUP_HEADSET_MIC, .name = "alc2xx-fixup-headset-mic"},
+	{.id = ALC245_FIXUP_BASS_HP_DAC, .name = "alc245-fixup-bass-hp-dac"},
 	{}
 };
 #define ALC225_STANDARD_PINS \
-- 
2.51.0

