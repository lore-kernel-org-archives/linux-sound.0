Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81034A3413
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 18:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007357; cv=none; b=iWZWUOivjb6m9d4inV1cGhearf09sjjvNMFp8yF4+/JeTl+YIudlqGEuSnOsXgPRsplZVryY4XTWKdJA1l1MP1ayq9AIuXLoOG1awyixpUjPhlJaNNKfNZVyu0LTjaskrnoSPt50tVMQq+K0yWvpSlLKgzEoFBteNXJxzlzzh3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007357; c=relaxed/simple;
	bh=cIfhcGxf0lme2q7Sv5AmNgkFUrQz58imS9neGbBjmZU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S+OrcPcUdMuSpPfe2w4fLH0hyjFq4MRp8v8erugaq+WfBDhJGCLcDP7P9cFsHRHb5Fgds8N5xGqRWI9tShxuxcqbg96CNnQw7YM4svQf5jGtrvk3KAAr/D1Pg3VzYwNWZ3QN1dd1NWKd184Gxe9cShoRTN9pJ3PfvXB/RVyiSFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ogiywTpl; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogiywTpl"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so71600575e9.0
        for <linux-sound@vger.kernel.org>; Tue, 05 May 2026 11:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778007354; x=1778612154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UUgDKh47m/pBMygii9k620yi3vAmuYuPsVC+ZgCY6jQ=;
        b=ogiywTplX/TDqdkmh8xealePwKNwkxVxSdSTEkmGAgCdTSarktregreSPfDOmsw82Z
         16t+Z7Pl0lg8kF2941qA7Lk44NQ8P9KcFzr0nURK7OFiatWmxRPPtCxWk1b0nDDqmKu1
         DDkwpPUdngu+b0K2IwNqggVqY/wA+6wRJpZeko/R+3nXdXkZunlwr2XyLs06fTNiDyi6
         dLTDvKvX/DgZeTQO5POn1yyXJOBOfyRbWDn1zSK5SiqtUwDWxuec7CioYFemcG4Xp9AF
         Fv6tek+8AqrRU6VBee85s1ofF4rdjcD1/GZEiROKSSkQeAGMIuo+DRpwOpboE4B5PaFV
         NWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778007354; x=1778612154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUgDKh47m/pBMygii9k620yi3vAmuYuPsVC+ZgCY6jQ=;
        b=aFhT92W6Vz2qAzdXZElcB9/0SjK7DPOF0yVC3KnpRrC1M1krJ3aCR9touijnWUmus2
         l+CKGx5bbx4uf589HJIKsGi2JmsonA63yNE1Oot2V5cJ6e5QcchUfYxm6cTgsOVVc1Ox
         e23xPN/Z0W0dFqmhGXdi2NJ/BtG6An/wAXkD1SRT3zLqUD002G6i9roERjsDmsqFlGD9
         wZPP809DveLDrJsziT5Siw1fKd2t8fjjbOWiOt0b6pjWwisRqGRGj3x7ao86Om21hMgC
         WKS/eaq5fexoptoxOpxXyNHeb36TOcsSbyC99sVX9YD0icqERmBPQuwQiBzAwMzG4sh+
         jDiw==
X-Forwarded-Encrypted: i=1; AFNElJ9gVbrp8TKXooP1dPZLeROqc84kU2MLJD+VpOZW8yi8ZQ5KQiGWqMeecZXxp1Za10Lm+/1g5AwptdfH3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjeUB/BoO9mBP2tjNSBdtvyRlEvPhucFpGaWknt7N0C6aGR6JX
	qCAnvsv7pG0fP8P2b7+wHLvq+kO/PrHEEktpCZ51yR9xLOesObEpmSfY
X-Gm-Gg: AeBDietbBCN58WBx/UOvK3qzHhXBq5aQuKE3XieAnTAKu936+NcLKLMl+jWz2Rid+aG
	DRTYIdSJTrBE/CVynpGFg+AeBUhPSqQLJWHf/f2dXkGiVwW78hP2mXC+U7GN6UQ2U357+4yJRsa
	0gCVoA9udmseVXSxCUphk6vxhnUf3uz5WE2SZ4+G2hasCQLlG9H6F82tNnFbzfx9x+3NiqTtd6P
	Q0+EyjSJ3+3l0t0elYnoN5mQPPeIhudDew24Qj16GmwSlZsBCMN+TsYjGj6Sobmec2zgS3Uxl12
	bGkR97NCi8lJnlmZxTLZ+t/paksOMeDm7dojegDuZPYwuANCySN3SKUrFTpuRrfqo1iS0Y/4oeL
	WVLDIpDppnbMwHYVq7xuUe/vgMOzXntH7zYLTpAR0eJ9zBhQ09Q11M+819rqbqlsMZkjC7z6yEw
	cFqyibtyEka1EfGZSBp+wUgDLYyGgXtoIl+9+1rg2W6/bqFFyri10RsD8OoGYrnsMY2WDV6qwwE
	5Q=
X-Received: by 2002:a05:600c:811a:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-48e51f369c3mr8681035e9.15.1778007354077;
        Tue, 05 May 2026 11:55:54 -0700 (PDT)
Received: from fedora ([2a12:26c0:2305:6d00:61fc:ac1e:e8da:2ab6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81b99127sm407232765e9.0.2026.05.05.11.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:55:53 -0700 (PDT)
From: Rodrigo Faria <rodrigofilipefaria@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rodrigo Faria <rodrigofilipefaria@gmail.com>
Subject: [PATCH v3] ALSA: hda/realtek: Add mute LED fixup for HP Pavilion 15-cs1xxx
Date: Tue,  5 May 2026 19:55:18 +0100
Message-ID: <20260505185518.23625-1-rodrigofilipefaria@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new fixup for the mute LED on the HP Pavilion 15-cs1xxx series
using the VREF on NID 0x1b.

The BIOS on these models (tested up to F.32) incorrectly reports
the mute LED on NID 0x18 via DMI OEM strings, which lacks VREF
capabilities. This fixup overrides the LED pin to the correct
NID 0x1b.

Signed-off-by: Rodrigo Faria <rodrigofilipefaria@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a9cd03bb7..73b3470bd 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1669,6 +1669,21 @@ static void alc295_fixup_hp_mute_led_coefbit11(struct hda_codec *codec,
 	}
 }
 
+/* Override wrong pin to NID 0x1b (F.32 BIOS reports 0x18 via DMI OEM string)
+ * on HP pavilion 15-cs1xxx laptops
+ */
+static void alc295_fixup_hp_pavilion_mute_led_1b(struct hda_codec *codec,
+						 const struct hda_fixup *fix,
+						 int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	alc269_fixup_hp_mute_led(codec, fix, action);
+
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		spec->mute_led_nid = 0x1b;
+}
+
 static void alc233_fixup_lenovo_coef_micmute_led(struct hda_codec *codec,
 				const struct hda_fixup *fix, int action)
 {
@@ -3857,6 +3872,7 @@ enum {
 	ALC290_FIXUP_SUBWOOFER,
 	ALC290_FIXUP_SUBWOOFER_HSJACK,
 	ALC295_FIXUP_HP_MUTE_LED_COEFBIT11,
+	ALC295_FIXUP_HP_PAVILION_MUTE_LED_1B,
 	ALC269_FIXUP_THINKPAD_ACPI,
 	ALC269_FIXUP_LENOVO_XPAD_ACPI,
 	ALC269_FIXUP_DMIC_THINKPAD_ACPI,
@@ -5700,6 +5716,10 @@ static const struct hda_fixup alc269_fixups[] = {
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
@@ -6906,6 +6926,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8537, "HP ProBook 440 G6", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x8548, "HP EliteBook x360 830 G6", ALC285_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x854a, "HP EliteBook 830 G6", ALC285_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x856a, "HP Pavilion 15-cs1xxx", ALC295_FIXUP_HP_PAVILION_MUTE_LED_1B),
 	SND_PCI_QUIRK(0x103c, 0x85c6, "HP Pavilion x360 Convertible 14-dy1xxx", ALC295_FIXUP_HP_MUTE_LED_COEFBIT11),
 	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP_ENVY_X360),
 	SND_PCI_QUIRK(0x103c, 0x8603, "HP Omen 17-cb0xxx", ALC285_FIXUP_HP_MUTE_LED),
-- 
2.54.0

