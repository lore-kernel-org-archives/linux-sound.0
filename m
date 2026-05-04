Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BFF3DE44C
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777906441; cv=none; b=gCfUqDBPCQ6cFApTwX/jy8MEPwZ3ZomxC4Wr/onxKLvGYodnLaun40IxnpcOGj+C+z1tXEwO80gnMNEIXxk5EmIEqCJlOY9waYZTi7AuFfajTS6lLdUhaMyYOHCFKQUtSgyx0pI7YNoPlD/m2YiNy3qps2Uy7WMcAlnLi6FUUpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777906441; c=relaxed/simple;
	bh=CNCvNJ0dA90Cp+3Mb0BHrR9N+E1ZEBUf5kddpUQ6Sdk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Aoanu3wz1KtM1rV5AuUJp2hedleDqehkq2LxxEADI4vtOzoHGqD9tGGj3yJd1iDuEE5y9G32jZq3GN+GQizIrJsRaZJWo+yvhDhxtQ57PM7LTAF1T5BDaHwg+ImOxI1dt7EbH0vEO58Fhf5qa7d7ccQ0sCQ9vYvIivkOOwquwiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QD0jFwdr; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QD0jFwdr"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67cac5ece75so890806a12.2
        for <linux-sound@vger.kernel.org>; Mon, 04 May 2026 07:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777906439; x=1778511239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a2AqFHw5Eps5MHT7rbIXfE2w96HNnPSpujTfBGlSerY=;
        b=QD0jFwdr2GI0+UpiutGqC7JnDVzl9JACsarlBmnM3dafUpFtcWd9ppnARvlLBoKctH
         GPuhX4aoND78Z3STn9bmpQeRx+SCP7caONJzclYq9t7YN4S0FFXUrM3GvDQCWeyWNwZd
         FZOyJw4IZ/uGs2buQRCcFggpyrpiAFhVwz238jJCD/3bvI/bZ/SUJYtTSqk1u72orC1J
         MH3F04h/2wJ3cQpSOq9L0d9UCy/R0c/UGlQ74ETU/ojCoRk9Ou9PwZZhAjh1IuDNPJS4
         fgZ9/CbTWATwtD/OSRQW/DY4yr8qPX8MHPsTcVg61ca0EROj5LefwNELPYmDOBkMr7mN
         kM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777906439; x=1778511239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2AqFHw5Eps5MHT7rbIXfE2w96HNnPSpujTfBGlSerY=;
        b=Pjxf89MjyYDBWs3BDL2Csj0wlduIDqf62Fl/eiKpQesg20rYcqLFIe+q1Qm1Z4OBdK
         /tIfqTBwBgjShqw438MvsJBpz5fQMW9wTPvmC0uYvGS0q/meEfQYLLQV6pDchcTLaFBO
         3rjGXyWKHhZolRDgewISJW9KeQx4A7ZlNyh/IoOJ4V6k8bqcykfDeYFUnln5ZPmjoCDw
         zZyMfzyJkH2uL/3/HvxC1JNSaXEmj4vlvS78s62UBzBJMijrB/jiGj5qnudwF6+5zxdq
         9jOno8OkQuWHCR/8PoifQKrV/bJGHoJO+Nhzz/lgzGc1kRfknITtcrU27OCXIasj4Cwg
         u31w==
X-Gm-Message-State: AOJu0YzU/Yl4bGLtf9huFRY5ofMlgb+01pzbHWva28lj2nZQlKvv5ZQO
	72s+Hf5cbJJ942sVSfIlJewgI8r5f5QAa6MaJrAg8W5fwo2z28J/ykiGGNiROuYE
X-Gm-Gg: AeBDietAUX5aZrT5WX/U3TWbA68MUjxUDrctWSu1uqBKbrByFqJo89XPoRvaKBGWlRj
	94hE32BvWNh3ru9Y2HG1D1K83gvCC8IHetjCPfOWAECY4SODYu1LG5t2t7GxIibp2QnOr18xegj
	GFp6ty+77yFeQzYVKEvAh6dFQpuBOTNdvVQ4Sa8zuKBGBn3lh4CFs/lJhfLVe8GvFs9HJnT4Mfn
	LYw1kICuppmawhCwCTt3+BynGDqEb1USVbL7fZe4QixWB+HdRbclbzc0vllSkBdNTCcqozGvrxS
	zPIAPG9QJgJXzoyb3/xYUpMJI6rEdRHYhGPJrHkDfGQM+4+GVaWaVShGyW8p4bu5TjdcohILmEN
	OtdSufmYYvhHK3zQFu26hme8SmKCZ885PBIU56kT4+O/qfQ53OAwIOB2nGCKoBL+g+xivBanXQq
	zNme3RbYTGenNGAxGzs8/zKXBwv252y5y9zZjqN7zxk86opvER4AmV3KeOOAQSe1+Zk2STYtL13
	K1XIHwM+9dkMOEUE9NGEwQOIP6yK3WFFx1k8xi7sBntbKaUko6Nsmk=
X-Received: by 2002:aa7:ce16:0:b0:66e:8ca6:e79f with SMTP id 4fb4d7f45d1cf-67c1aaa6068mr3196367a12.13.1777906438380;
        Mon, 04 May 2026 07:53:58 -0700 (PDT)
Received: from din-wdei726.dei.uc.pt (gtdei-nat-wdei.dei.uc.pt. [193.136.212.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67b877d5ab2sm3548507a12.14.2026.05.04.07.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 07:53:58 -0700 (PDT)
From: Rodrigo Faria <rodrigofilipefaria@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rodrigo Faria <rodrigofilipefaria@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED fixup for HP Pavilion 15-cs1xxx
Date: Mon,  4 May 2026 15:53:37 +0100
Message-ID: <20260504145337.8740-1-rodrigofilipefaria@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new fixup for the mute LED on the HP Pavilion 15-cs series
using the VREF on NID 0x1b. These models will no longer fall back
to the generic 103c:0000.

Signed-off-by: Rodrigo Faria <rodrigofilipefaria@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a9cd03bb7..1db72bf28 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1669,6 +1669,20 @@ static void alc295_fixup_hp_mute_led_coefbit11(struct hda_codec *codec,
 	}
 }
 
+static void alc295_fixup_hp_pavilion_mute_led_1b(struct hda_codec *codec,
+						 const struct hda_fixup *fix,
+						 int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	alc269_fixup_hp_mute_led(codec, fix, action);
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+		spec->mute_led_nid = 0x1b;
+		spec->mute_led_polarity = 0;
+	}
+}
+
 static void alc233_fixup_lenovo_coef_micmute_led(struct hda_codec *codec,
 				const struct hda_fixup *fix, int action)
 {
@@ -3857,6 +3871,7 @@ enum {
 	ALC290_FIXUP_SUBWOOFER,
 	ALC290_FIXUP_SUBWOOFER_HSJACK,
 	ALC295_FIXUP_HP_MUTE_LED_COEFBIT11,
+	ALC295_FIXUP_HP_PAVILION_MUTE_LED_1B,
 	ALC269_FIXUP_THINKPAD_ACPI,
 	ALC269_FIXUP_LENOVO_XPAD_ACPI,
 	ALC269_FIXUP_DMIC_THINKPAD_ACPI,
@@ -5700,6 +5715,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc295_fixup_hp_mute_led_coefbit11,
 	},
+	[ALC295_FIXUP_HP_PAVILION_MUTE_LED_1B] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc295_fixup_hp_pavilion_mute_led_1b,
+	},
 	[ALC298_FIXUP_SAMSUNG_AMP] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc298_fixup_samsung_amp,
@@ -6907,6 +6926,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8548, "HP EliteBook x360 830 G6", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x854a, "HP EliteBook 830 G6", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x85c6, "HP Pavilion x360 Convertible 14-dy1xxx", ALC295_FIXUP_HP_MUTE_LED_COEFBIT11),
+	SND_PCI_QUIRK(0x103c, 0x856a, "HP Pavilion 15-cs1xxx", ALC295_FIXUP_HP_PAVILION_MUTE_LED_1B),
 	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP_ENVY_X360),
 	SND_PCI_QUIRK(0x103c, 0x8603, "HP Omen 17-cb0xxx", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x860c, "HP ZBook 17 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
-- 
2.54.0

