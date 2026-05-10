Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEAA21CFE0
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 06:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778392843; cv=none; b=LAbDi3eeJa+CYIvqfXYwztPnhH0ZKhm4vBhunSsGnjic+2jPOR5XVzEuQtuEsS6mxgC1J8vzdcP7z7F/dbMESw2WyZpPr4leSNjkqwIIXNdJRtNKHXzPB8SuLdvpKZYsIgDxSzQ47ZqVkZ1CBnFM30DYyXLsy20svdjeLTEInkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778392843; c=relaxed/simple;
	bh=Ma5w/TUA8dq/jjUv5tENklFVDStHiQFHbyXHUvawrf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sPy6QimrcBWufvhGFyTc5ENPlKTZiCHOLRegJEEgqFe5dbz2mOkfq0wx8MPZyFci/3d3x5rwhlIjUG1J7ZKyqyuEseAFUPirSCpJkHoWSwIjQX2l6Pfx1dHazFOrdkdwTLfQn1xCuLc5kF3ZF2nsPFp3jkTey+qgU1A7oT2kXaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBjHx/sc; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBjHx/sc"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-365f36d7b88so458283a91.0
        for <linux-sound@vger.kernel.org>; Sat, 09 May 2026 23:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778392841; x=1778997641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SEfBXkMY/OX6F8yuaTV+n34HVpydN7B7v+xFBeTDoKk=;
        b=JBjHx/scbnZQ3NC9aH4QlNYJczHiEUHcDMv0HtmSuT0BT/5eGqglUc+LOP2rkHzj0h
         OY1At9ZqJdEdkTRw028kfn4H1aKfkxk9om9e5t5GJQ+ptEPL3tvwA/whMzotI07gOjkK
         qDtU7Jbs5l0oxUvjdBcepxoa+yx6CIFdXgYfA1QuiIiGEMe3HAqkd5O4ctigKDuMBMEk
         77CPUiTEkZkSdpVqSk1u5wl4utWR4RavR14BfhqpQUwrolDkNZms5TmOtyg1zVAaheha
         59V16yarcmgeQo13uUbR4LAlz1inJ2aF5Vd1Ki6XAjIbzQxE0lY1JsZPwLA0wWkuSlHv
         V5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778392841; x=1778997641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEfBXkMY/OX6F8yuaTV+n34HVpydN7B7v+xFBeTDoKk=;
        b=Ec7Y/+xNbWdU3l/dousRfBmIJlTuL2oKVtXA9J/EwWs5ZcToeY5ysFfplskcwKYz1g
         Kd4pnBbcqD7h/H2x05snlgNdoDtpKynFZYdbe7d9dWnBnDZSp2h0T3tkJku1p+F/4rZi
         StaONzhVqn/NAjyXeZVjiirB6aBXijSUBxoM0DCostPYbBs+nGTKE7PaHLA9sXqX71O8
         21gH9S5qWNscrJxI1q2hBQg+knTIydE7HbyhjOrjwAfF/rSYAPQmZeEtb0txc78ZKdOY
         uKMOjPaEHIJX3wkXN/kWsdj4XAYP2Aceaymxx+XDUdtwRx1bnvaqv7ppHQ3aJhg4PoTA
         RT2g==
X-Gm-Message-State: AOJu0YyAVSLmIOb8W1lmV1LaM0/GgMPowSMP38+B502MZfNlb6PA6Kyq
	431IIJQ4OYPn1rMnFr+YMKxpTe2Wl9kzC0E0zsWvwNAtJGKIPtm8KNMA
X-Gm-Gg: Acq92OFgljreIJIrTaSVb9NjicMq7XvFV5g9OGoM9kPTW98gE++hcVlTe/vfHwrA0jn
	60Y7vEOaZO336rnm8HGkrWOV1tP76sg8CvQWnuuwT/xxxeEOVe++QXf8wY7AiIsE5T2q9OctCDl
	mOCTbO+ge897tNzvPxvafD8kIAJulVflxAVIV+Bsj6y+4ebsjd7GZnH5ney9mmEz6fc80VhoaQR
	EjdMpptYrlTzFtSG1sKx8zZL0lrlp0yzkww0Pq4Mqr1y4OCnMMjDmaGM9wiKDJ0Za6zicuRh58z
	x2ORTR5elWeGOkdTDtDbnziom6sHrfm3CyqWniRfKlV7q5uiZPXnvBPxDwY04LgtzA/OU8VScG3
	SR/fRRanCU2qELuhTQ3+IiGxvtQ7LXsKkCfyKjKlZbzKH7/lUb4PH9FJ8ZJbEbnVoAUbonmCoWj
	8UrRsU06v7mFbilMDsHldZ1IfxmDA/S5h6Cf5QhpZ/
X-Received: by 2002:a05:6a00:3e0e:b0:837:42a6:58a8 with SMTP id d2e1a72fcca58-83a928fd137mr9538815b3a.2.1778392840982;
        Sat, 09 May 2026 23:00:40 -0700 (PDT)
Received: from localhost.localdomain ([103.80.236.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36c10sm20350561b3a.25.2026.05.09.23.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 23:00:40 -0700 (PDT)
From: Dirga Yuza <dirgayuza123@gmail.com>
To: Jaroslav Kysela <perez@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dirga Yuza <dirgayuza123@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add micmute quirk to Acer Nitro AN515-58
Date: Sun, 10 May 2026 12:58:01 +0700
Message-ID: <20260510055951.9035-1-dirgayuza123@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Nitro AN515-58 uses GPIO 4 in active-low configuration to
control the mic-mute LED. This patch adds a fixup to register the LED
classdev and associate it with the mic-mute trigger, while chaining to
the existing headset mic fixup.

Signed-off-by: Dirga Yuza <dirgayuza123@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index d720565db4aa..3f7698b28b97 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3323,6 +3323,18 @@ static void alc256_fixup_acer_sfg16_micmute_led(struct hda_codec *codec,
 	alc_fixup_hp_gpio_led(codec, action, 0, 0x04);
 }
 
+static void alc287_fixup_acer_micmute_led(struct hda_codec *codec,
+	const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	alc_fixup_hp_gpio_led(codec, action, 0, 0x10);
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->micmute_led_polarity = 1;
+		spec->gpio_mask |= 0x10;
+		spec->gpio_dir |= 0x10;
+	}
+}
 
 /* for alc295_fixup_hp_top_speakers */
 #include "../helpers/hp_x360.c"
@@ -4112,6 +4124,7 @@ enum {
 	ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED,
 	ALC236_FIXUP_HP_DMIC,
 	ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO,
+	ALC287_FIXUP_ACER_MICMUTE_LED,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -6664,6 +6677,12 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1b, 0x90170110 },
 			{ }
 		}
+	},
+	[ALC287_FIXUP_ACER_MICMUTE_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_acer_micmute_led,
+		.chained = true,
+		.chain_id = ALC2XX_FIXUP_HEADSET_MIC,
 	}
 };
 
@@ -6714,7 +6733,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1466, "Acer Aspire A515-56", ALC255_FIXUP_ACER_HEADPHONE_AND_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1534, "Acer Predator PH315-54", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1539, "Acer Nitro 5 AN515-57", ALC2XX_FIXUP_HEADSET_MIC),
-	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC287_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x160e, "Acer PT316-51S", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1679, "Acer Nitro 16 AN16-41", ALC2XX_FIXUP_HEADSET_MIC),
-- 
2.54.0

