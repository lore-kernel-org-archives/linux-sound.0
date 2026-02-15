Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53A42744F
	for <linux-sound@vger.kernel.org>; Sun, 15 Feb 2026 04:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771130787; cv=none; b=rENZg9RCIEfUv0dMRHMWGTRnR08efez8jtf7YEHk1fNbwtu2/u8QjsqekLMLPCKcyJFATtve0Wu9osWZBEnOEHVKITSEV/EobVWyc+7acVucU1GWLR5ACNjziJvrJzK4jszFrCceH6jhvxYkS8XhjPhoaFMhvbqw7zGCzcEuenk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771130787; c=relaxed/simple;
	bh=hPqJqYgD/VsQaKOmjn6jsIkSHcx4wtLQc6KIIaoF48s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6ZNb+TlkIFgW4BH9kL55oTYzUKUnc8+6ThxbyDivP4+8JAM5LkpspsMj6HTa4BV6dA/eI4/JXnY6onfwvcXjwy78PC2GFQo2IqQgdmMWW3xRnXkWiKp3qs+/DT03PrMgZrSbJt3m/Z+r94Eqxipq9rImIlw2B9R+oHbUrsNdUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAmv2Exs; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAmv2Exs"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2aad1dc8856so14554405ad.1
        for <linux-sound@vger.kernel.org>; Sat, 14 Feb 2026 20:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771130786; x=1771735586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fo5ht8FCiU4gBdhRThK3j3sjSpYRXvzkXclJ8nzOvY=;
        b=UAmv2ExsPmHrZuPFFHfVODw7G0aR3NAkLOtI+ZGmptVTH9PzzpkSEeGCEDSbDmu3QH
         RM47MigO/T51zAtvLk8mc5VsGie0qDp6Xf5LTFe4BEJGtqXxtq3URmpGvoVTpQDgk/8G
         92Xe0dcuN8xnV5ZtmBPH6AARCqyZeM3Foa9Xc6BKsvb5CZON9eoqFnnewQ1EQdWJXg6I
         R1g02jWJLZLaO/OyA2lykGcDpAPJE74BXmI7BtQne3eyFGOd3LMnzV1RSLQw7luXsXUH
         IyOslCOSnLT3TizWjgm2sxOvY6HqVrhykfiBj0BvaU4AjPX7QLgMA1x+S7Z/71HApu4R
         LaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771130786; x=1771735586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8fo5ht8FCiU4gBdhRThK3j3sjSpYRXvzkXclJ8nzOvY=;
        b=S+1Fu5anuQJjRqjlTmsHzrhpPu5Y0Mm0IAIxxE1xL2II0Zey0NkTQStvcgcLZhrUlR
         OzNhf22aA/6soNAeGVufM4uSg1wGVoPEC8UxRqHPWWyXbTDX068801JCm4zYqHPzSZUh
         UMGmGS5gbEd8jplcKqfAXPhEtMURZPKhXUom97SfM9lvCk54w6mGR3eITplUSO4fflw4
         EvxH/0S/7zsOEZ9GVu+BdYdADE/jpNvYIBpqWUA5P7qVa8JX0CWnkAcA2r1b/oM2aAwJ
         HkDeHyjKMr6+6SUPJUdbfB6sexeVURRhA0LIxiw7nEwiHLdocrIsfse3TtA8z9zOyzC6
         /qRg==
X-Gm-Message-State: AOJu0Yy58mejNKSDqwdVOcCJkTiYV65zmX62nA/W6he5tmDYLOz3NQg0
	1u7WQrb7bx4waweXMrweIyyGPJjSiYt/LQQH7mq5IKr2H+Ttgtf9zGYdxEtrl2H49FMuvg==
X-Gm-Gg: AZuq6aLnUkrbH/CYXrc44bMaK5KVah0XuTlg96nemWzpwGp0BLQ8i4xjBeIkg/mKvjZ
	UTBACRheT23c/VmNt3KeQRBP9MJay/EVAJwnM07IMIRyRKRDt3OcxlOwa1hDcEjkrLOHGsO7F8i
	d3uqDF4Omv97Sf3PNImQ7U9kXQoXQGwxitVN+mjgc6AA4Hf7UsmNcll212gauPpUi5Op/C7DxEk
	QFc3fIGNLbCbfmLN8JphmwMdJW5765Abr57bxTva0Dqclezcr4bJ0j+7aWIptt6+Lo9ZUf0VkgM
	BQj6h1COrHAMRzZLnk9aJbgTF3d8lC6mTF2FIyAQL+kI/7lKwovA33pGBBIv3yaA9Du1S8CO+34
	fOu1nwCP/6kXQiHORNl4qpUSCRh2wJwFPKyRnrrkT7mtzDC7vK/FfgnDLtmhFWAPLcnG1q1pnYK
	Xjw9ShtPHyl25KPrcDh/x3
X-Received: by 2002:a17:903:22c7:b0:2a4:8cd:c3cf with SMTP id d9443c01a7336-2ad17570671mr44125685ad.49.1771130785933;
        Sat, 14 Feb 2026 20:46:25 -0800 (PST)
Received: from arch.lan ([217.216.125.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1aadc729sm30914435ad.64.2026.02.14.20.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 20:46:25 -0800 (PST)
From: Ocean Zhou <zhouoceanhy@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Ocean Zhou <zhouoceanhy@gmail.com>
Subject: [PATCH 1/1] ALSA: hda/conexant: set CX20632 int mic mux on FEVM FA880 PRO
Date: Sun, 15 Feb 2026 12:46:15 +0800
Message-ID: <20260215044615.337813-2-zhouoceanhy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260215044615.337813-1-zhouoceanhy@gmail.com>
References: <20260215044615.337813-1-zhouoceanhy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On FEVM FA880 PRO (PCI SSID 2014:8004), CX20632 ADC node 0x14
comes up with connection index 1 (NID 0x1b), which leaves the built-in
microphone muted. Manually selecting index 3 (NID 0x1e, internal top mic)
restores capture, but the setting falls back to index 1 after
suspend/resume.

Add a dedicated fixup for this exact SSID and force NID 0x14 to
AC_VERB_SET_CONNECT_SEL = 0x03 in HDA_FIXUP_ACT_INIT. ACT_INIT runs on
both cold boot codec initialization and the codec re-initialization path
used after resume, so the built-in mic route is restored in both cases.

Tested on real hardware:
- hda-verb /dev/snd/hwC1D0 0x14 GET_CONNECT_SEL 0 returns 0x3 after boot
  and after suspend/resume
- /proc/asound/card1/codec#0 shows Node 0x14 connection star on 0x1e

Signed-off-by: Ocean Zhou <zhouoceanhy@gmail.com>
---
 sound/hda/codecs/conexant.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5623d8c0a0f7..1d68402f575c 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -299,6 +299,7 @@ enum {
 	CXT_PINCFG_SWS_JS201D,
 	CXT_PINCFG_TOP_SPEAKER,
 	CXT_FIXUP_HP_A_U,
+	CXT_FIXUP_FEVM_FA880_PRO_INTMIC,
 };
 
 /* for hda_fixup_thinkpad_acpi() */
@@ -340,6 +341,16 @@ static void cxt5066_increase_mic_boost(struct hda_codec *codec,
 				  (0 << AC_AMPCAP_MUTE_SHIFT));
 }
 
+static void cxt_fixup_cx20632_intmic(struct hda_codec *codec,
+				     const struct hda_fixup *fix, int action)
+{
+	if (action != HDA_FIXUP_ACT_INIT)
+		return;
+
+	/* Force ADC 0x14 to internal mic pin 0x1e (conn index 3). */
+	snd_hda_codec_write(codec, 0x14, 0, AC_VERB_SET_CONNECT_SEL, 0x03);
+}
+
 static void cxt_update_headset_mode(struct hda_codec *codec)
 {
 	/* The verbs used in this function were tested on a Conexant CX20751/2 codec. */
@@ -1024,6 +1035,10 @@ static const struct hda_fixup cxt_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cxt_fixup_hp_a_u,
 	},
+	[CXT_FIXUP_FEVM_FA880_PRO_INTMIC] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cxt_fixup_cx20632_intmic,
+	},
 };
 
 static const struct hda_quirk cxt5045_fixups[] = {
@@ -1125,6 +1140,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x1c06, 0x2011, "Lemote A1004", CXT_PINCFG_LEMOTE_A1004),
 	SND_PCI_QUIRK(0x1c06, 0x2012, "Lemote A1205", CXT_PINCFG_LEMOTE_A1205),
 	SND_PCI_QUIRK(0x1d05, 0x3012, "MECHREVO Wujie 15X Pro", CXT_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x2014, 0x8004, "FEVM FA880 PRO", CXT_FIXUP_FEVM_FA880_PRO_INTMIC),
 	HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
 	HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
 	{}
@@ -1149,6 +1165,7 @@ static const struct hda_model_fixup cxt5066_fixup_models[] = {
 	{ .id = CXT_PINCFG_SWS_JS201D, .name = "sws-js201d" },
 	{ .id = CXT_PINCFG_TOP_SPEAKER, .name = "sirius-top-speaker" },
 	{ .id = CXT_FIXUP_HP_A_U, .name = "HP-U-support" },
+	{ .id = CXT_FIXUP_FEVM_FA880_PRO_INTMIC, .name = "fevm-fa880-pro-intmic" },
 	{}
 };
 
-- 
2.53.0

