Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6D3364926
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 19:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788982270; cv=none; b=Nlf2TMk2cYIu6WwfafzqKgOAPNgMSTih+rIC1NwblatwjF/ddOOBJrk844sBQMF4SCEBJhy1aArSpnrWPl2jsSX46Pqd7FJR3X3ABf1hjqqSVEI+E50awvLwn+ZVAvE2oulTpm5VcocmFv9Q9X5CXRytIfEEdRkHt37A+iZzcCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788982270; c=relaxed/simple;
	bh=OGmMUhZHrOr6boThLHu7z77I7dRpjo6IF+jPmVb2rpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bXru32wTpKHKosWN1xdzpuD31ZR1VvigbQ7mtwlzFjKPYxGcgBei+PbyqvlgFQBFt6NLv4HhlYESF9L0haHJUpRWLUS+nkkwd7Ut72owDV3bW/QBytar7NKaFRbJ2/DCtK797yH1j5xqicuIWTWZCc6Ai4RyNNX+pJyiLkKYw2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWZceMpb; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWZceMpb"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97cc72fe0f3so112299241.1
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 12:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788982267; x=1789587067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bu4GfVzH8DhuwM8RYplW9+YvYURtPxANRKmn9IzC2Nw=;
        b=GWZceMpbzLLRqJsp+gj217Q/gqjCB+2Rjfk0dQLnihPLBCxDzM4EOoOxfPCQ84DVp9
         G+M8kj6m9oLbSek8k6sAVWWstklMtXP3F8gVaQoyhQ3kMpwKQyjFRZzLNLEqNAnXlhKk
         iA3CamGvzV3Xa9wbk20Ym0DFO+tQzEapC5bUfxxQA3thzig331xcT4LjDkXmnXoInHvp
         UOaI7P48ETNP7qE7PNCt82di3bCmhJ76ZMDfNEunbI0gMdon472/Kzb7Piy4mX7RpV6w
         dBZZdUGX8cuoFsV6JabIFs2l54VXTeic1BFE1v31eXbP72WvWyAFs+FVhLutwWwpgTzk
         gr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788982267; x=1789587067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bu4GfVzH8DhuwM8RYplW9+YvYURtPxANRKmn9IzC2Nw=;
        b=oO0JSSK9YvMwwtoeoubJWR2MgUrxuemlXVwDMF92VZ2oTAGGC0uM+oBdlw/N1vJ3m3
         cdHUMS7cdz4DuyqB2GsAaR0xcKP15K4LD8shr3zbzXUQoSO81KZdM+0oeN3ekPpcpGSd
         lw6pFgI2ClxnreR6ue22AT3KwXWPVODID72f/h/3F3O4iiTT0gVPZGuwkcl6gq70r6QV
         mUJBeyW9d7NJjNm8vfRuw3bC+mlahcFkqrP3g+VBdA/HuG28fufzGL1YOt9lGyYfTpyB
         T0CyJ3LvY3Mb5WY94kkcqRs6q9x9v0/AtBRjbQZphqwF/AIAMqm0+91Wu2vQwSpTLR9H
         lngg==
X-Gm-Message-State: AFuF++ncO3uVe6Ps+4yCFjrjOG446ygBxhrS8SvSDFoxGxzH0iMszLBm
	IgBHCB9i6B6BTqfGuyw2NfjXa+5XjyShohEcWWbcNozzA/vt7kjabLuOMgBXAw==
X-Gm-Gg: AYBFou3oo5jzZOH7Q5HoY05p0yJ+NQu25ApDdMA0q89sZc7oWExwdIV3ZkufP/UKGJo
	xrl1NoyHsny3AJLy0e0wTQfaKOCGpjen5whe6t635ytr/o0n97RQEGOTgYNZvvriwpe56MFLo3X
	KYLgNRmAdf2TsFqWxZnXrOCOGz7krjgypC2mArKTVvx3MUSy5lNoXqL7a1S8R4SEnRv7JrF3NYU
	ca60Xzya3CCZwWHIxInt4U8RtXZe1eDUBqib4BmMfI31svhmJjAl06zoZM2w62WALxRrPvkkKhg
	NH/PiL6BPk4jlJ/ckRd6l5eHoNfI9rfI9VVqoQvhn4BkCuB5LJyHvUY49pheV7Yc33wU/VGnp1s
	H38y3C9hRXXIu0eD77ewU4mNxL4OLTjff1+6FkM3i1nBVBIgBnqndxrAueQDukurQs7afIu8wef
	RBvI4HT1bxL6ohU879AkhuLb1wGa1JwFR5OiCEMP34bCe8E2NxvseH3K/uPQ3mLzA=
X-Received: by 2002:a05:6102:578c:b0:774:ce64:242f with SMTP id ada2fe7eead31-790db2da0e4mr366570137.20.1788982266782;
        Wed, 09 Sep 2026 12:31:06 -0700 (PDT)
Received: from localhost ([47.201.34.27])
        by smtp.gmail.com with UTF8SMTPSA id ada2fe7eead31-78a47ae301fsm11646230137.7.2026.09.09.12.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 12:31:06 -0700 (PDT)
From: Andrew Udvare <audvare@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Udvare <audvare@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix speaker dropouts on MSI GE66 Raider 11UE
Date: Wed,  9 Sep 2026 15:31:04 -0400
Message-ID: <20260909193104.26508-1-audvare@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The speakers on this laptop are driven by a Realtek ALC1316 smart amplifier
sitting behind the ALC298 processing-coefficient tunnel. Nothing configures
it, so it runs on its power-up defaults with silence detection enabled: the
speaker path is muted after roughly 0.2 s of quiet and takes roughly 0.4 s
to reopen. Anything arriving in that window is lost, so the beginning of
every sound that follows a pause is cut off. It is most obvious with speech
synthesis, where the first syllable of each utterance disappears, but it
affects music equally. Headphones do not pass through the amplifier and are
never affected.

Measured on the affected machine with generated tones: isolated 150 ms
bursts spaced one second apart are inaudible, the same bursts spaced 100 ms
apart are heard, and a continuous tone loses only its first 0.4 s.

Add a fixup that programs the amplifier's initialisation sequence at codec
init, which turns silence detection off. Writes go through the tunnel with
coefficient 0x22 selecting the amplifier, 0x23 carrying the 16-bit
register, 0x24 and 0x25 the value's high and low halves, and 0x26
committing.

Link: https://github.com/thesofproject/sof/issues/5842
Signed-off-by: Andrew Udvare <audvare@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 50 +++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index ecc9c6e6a..8f55c3c00 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1840,6 +1840,48 @@ struct alc298_samsung_amp_desc {
 	unsigned short init_seq[2][2];
 };
 
+/*
+ * The MSI GE66 Raider 11UE drives its speakers through a Realtek ALC1316 smart
+ * amplifier, reached over the ALC298 coefficient tunnel. Left unconfigured the
+ * amplifier's silence detection mutes the speaker path after about 0.2 s of
+ * quiet and takes about 0.4 s to reopen, so the start of every sound that
+ * follows a pause is lost. Headphones do not pass through the amplifier and are
+ * unaffected.
+ *
+ * Tunnel layout for ALC286/ALC298: coefficient 0x22 selects the amplifier, 0x23
+ * carries the 16-bit register, 0x24 and 0x25 the value's high and low halves,
+ * and 0x26 commits. Bit 4 of the commit word is a self-clearing go bit.
+ */
+static void alc298_fixup_alc1316_amp(struct hda_codec *codec,
+				     const struct hda_fixup *fix, int action)
+{
+	static const unsigned short init_seq[][2] = {
+		{ 0x0000, 0x01 }, { 0xc001, 0x14 }, { 0xc003, 0x00 }, { 0xc004, 0x11 },
+		{ 0xc005, 0x00 }, { 0xc006, 0x00 }, { 0xc007, 0x11 }, { 0xc008, 0x11 },
+		{ 0xc009, 0x00 }, { 0xc730, 0x06 }, { 0xc612, 0x16 }, { 0xc00f, 0xf7 },
+		{ 0xc00a, 0xd8 }, { 0xc00b, 0xb7 }, { 0xc60b, 0xff }, { 0xc60c, 0x37 },
+		{ 0xc605, 0xf0 }, { 0xc020, 0x00 }, { 0xc022, 0xd6 }, { 0xc023, 0x00 },
+		{ 0xc025, 0xd6 }, { 0xc602, 0x07 }, { 0xc603, 0x07 }, { 0xd101, 0x00 },
+		{ 0xc093, 0x80 }, { 0xc090, 0x87 }, { 0xc091, 0x11 }, { 0xc614, 0x20 },
+		{ 0xc615, 0x0a }, { 0xc616, 0x02 }, { 0xc617, 0x00 }, { 0xc050, 0x80 },
+		{ 0xc051, 0x7f }, { 0xc052, 0x00 }, { 0xc053, 0x70 }, { 0xc054, 0x00 },
+		{ 0xc0a2, 0x01 }, { 0xc09d, 0x80 }, { 0xc09c, 0x71 }
+	};
+	int i;
+
+	if (action != HDA_FIXUP_ACT_INIT)
+		return;
+
+	alc_write_coef_idx(codec, 0x22, 0x0010);
+
+	for (i = 0; i < ARRAY_SIZE(init_seq); i++) {
+		alc_write_coef_idx(codec, 0x23, init_seq[i][0]);
+		alc_write_coef_idx(codec, 0x24, 0x0000);
+		alc_write_coef_idx(codec, 0x25, init_seq[i][1]);
+		alc_write_coef_idx(codec, 0x26, 0xb031);
+	}
+}
+
 static void alc298_fixup_samsung_amp(struct hda_codec *codec,
 				     const struct hda_fixup *fix, int action)
 {
@@ -4211,6 +4253,7 @@ enum {
 	ALC236_FIXUP_HP_15_FD0XXX,
 	ALC236_FIXUP_LENOVO_INV_DMIC,
 	ALC298_FIXUP_SAMSUNG_AMP,
+	ALC298_FIXUP_MSI_GE66_ALC1316_AMP,
 	ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS,
 	ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS,
 	ALC298_FIXUP_LG_GRAM_STYLE_14,
@@ -6006,6 +6049,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc295_fixup_hp_pavilion_mute_led_1b,
 	},
+	[ALC298_FIXUP_MSI_GE66_ALC1316_AMP] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc298_fixup_alc1316_amp,
+	},
 	[ALC298_FIXUP_SAMSUNG_AMP] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc298_fixup_samsung_amp,
@@ -7933,6 +7980,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1458, 0x900e, "Gigabyte G5 KF5 (2023)", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1462, 0x12fb, "MSI GE66 Raider 11UE",
+		      ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
 	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x152d, 0x1082, "Quanta NL3", ALC269_FIXUP_LIFEBOOK),
@@ -8515,6 +8564,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC298_FIXUP_HUAWEI_MBX_STEREO, .name = "huawei-mbx-stereo"},
 	{.id = ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE, .name = "alc256-medion-headset"},
 	{.id = ALC298_FIXUP_SAMSUNG_AMP, .name = "alc298-samsung-amp"},
+	{.id = ALC298_FIXUP_MSI_GE66_ALC1316_AMP, .name = "alc298-alc1316-amp"},
 	{.id = ALC298_FIXUP_SAMSUNG_AMP_V2_2_AMPS, .name = "alc298-samsung-amp-v2-2-amps"},
 	{.id = ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS, .name = "alc298-samsung-amp-v2-4-amps"},
 	{.id = ALC256_FIXUP_SAMSUNG_HEADPHONE_VERY_QUIET, .name = "alc256-samsung-headphone"},
-- 
2.47.3

