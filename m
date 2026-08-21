Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A403D5652
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307929; cv=none; b=Ny2cUDh/n5tcOupW+S0zwA9nKHADXWPcRBbQobmnk/b0vKYIHx7gaTqifzGB4Y7FDSF4lb4pHat8L68wFx0W9Fj8wNy6/8NeeJ5JBMOsIEYadxHPPOH8eFoB5rlfpF8GnT+7NImUKm9XyirJYrncrYb+KAkDfzFajHQd1vSBnX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307929; c=relaxed/simple;
	bh=9+nNgrIbtiaXxwQEJECnJgBnQln9hyRAZut5Q+duTm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G35vkx2RXhe4k8EHxkyZ0PofPU3emj0snt8Kz981LziQ6Oe7qhq10wMlprz8h5UOdR59nQ9vEHdpstzXU2QoVybHYrkUfFU0Is0KrgkhLiiRsaDUHrNiVrFqqXxN0X5Dowq8206n5+5thCNgo3xSLfpKBliQbrYh6E/2gc/GI8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqxpGv0Q; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqxpGv0Q"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c160420289bso128111566b.0
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 03:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787307920; x=1787912720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VnOEYXmOukDrbPX5qoi601Gks/SapggbUlIYE99i1mg=;
        b=OqxpGv0QxImviiGLr7byloL2rh7HFEFsRc2Z/YAczYSpHfk/Tu45qYl5pmC42ZUg29
         oeqr7pZydE6uNmxYRSVW2UYdPSoL+P8zZbS7T0hPaDfnx3q3fPC6JMWo1N2BF1qTG+ON
         1RWEiiCM6r7jES/2y8xCBb8H5S8tOxpBIS1koG2XFTiLjIBemP6l+dYIKO5RagYxsORT
         J7RzgQSC1fcC/tpYQ9q0E72UPzBOy0E8mHVsRi1qdYmNdai/Jitvw6tbdfI76hqDPmNV
         h1f5vudJdhVsl6WWasZuSs22yrH5RSh6LwAmd0xSegDLcHMGoICKa+sg5Ac5xcW4HiNw
         izag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307920; x=1787912720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnOEYXmOukDrbPX5qoi601Gks/SapggbUlIYE99i1mg=;
        b=GW37oADWZ21YqRqezvDFjVBkctga1hoZnhLxNoDLrQou6w5Eluzhb4Ci+cSXpaUlVl
         izuW/kDqzDZGx9lPPOcjqbAcDCGqRiH6LwfYHOE92o86nimfEZpIAx6BzOkdegXb0dbS
         bR7FxlVwELqqrYUyrt+ZhHYMarMxg8LZTUBKtf2loeQf6W6737GgaYou/z0pcB964Cwh
         nxTyR38ZhModIhPDf7AD+oxCE4h3A20NTY/R47ps0dyPMmIRqfFcNTY5NrsZzcMYHQp3
         Fn2JjdaRreaxh3bNEFrt9iE/U49I1QMR98bwut0O4/vu4hMvo3iFw5j5RN/mQ6Vo0ugW
         LxkA==
X-Gm-Message-State: AFuF++maxXagpmM6ifQMM9qY0MYJjZ6sxmW89m2Jdd6SkGZW3TsFY+28
	bBVlcxnow2lkxWghSOtWJzzTH7/UnQPV3JXn8oC0YAe9W9bNWLqobV6fKA5fdb9/GHQ=
X-Gm-Gg: AR+sD12TAiaeWfB8qAJSBB5OzLwfLls9x5RUsZJvbC8UT5R4gKf5AwU3irv5mDs4W0+
	6yi4WU05FPp7YHtRBPrMvDt6n0Zco7FN3z2fyyJfG5jU5dcL/ppitxjjpDxidsF6oqbXqutjmJL
	8ro1FThLH9FNuqD5hyu2Znv4AFtv9DIzhzMNjYPnV5XiChsU4WncvirrNis5UUIqa7zZSpTu/96
	oWMvtuqRHnveCzj6LjnjiHerfaW64vbmcFSRPay7NnR/uf+Mx4gy8tQN0aAEGekODYmBwuXVSzZ
	iCwbLwWZLFh/GY+bbvhIC6JxqtFmc0+eIEOTiVOdVRNK3fH4BItY5Aiha0OAjg5AO6Uph012hpl
	t9/Q59iI68va+vVCCz+GnzLCBeA+3n8c9Lm30uYBHSdMPCFHS9nxaJm8Lp7t/HYOE0n3L16Ee64
	pf8sAp32tp4AaO14J6roQKrdCtvs0j3yAFVVHPH0E+ZTGD2fVvWm/hMgrfTHs8uFTs0nRQbZ6bm
	5vPG5YI7/DgLAhGAGbnSQ73rmrFrNcDY0zq41YZOHLU8ovUbgFpL0IMfYp+iJK3
X-Received: by 2002:a17:907:e1c3:20b0:c20:ef18:ddcc with SMTP id a640c23a62f3a-c246a69da16mr421835666b.11.1787307919989;
        Fri, 21 Aug 2026 03:25:19 -0700 (PDT)
Received: from pop-os.. (05BBC51F.dsl.pool.telekom.hu. [5.187.197.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24591e044dsm447437666b.51.2026.08.21.03.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:25:19 -0700 (PDT)
From: Csaba Budai <ilyr73@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Csaba Budai <ilyr73@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix ALC700 audio on Intel Hades Canyon
Date: Fri, 21 Aug 2026 12:25:14 +0200
Message-ID: <20260821102514.11194-1-ilyr73@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Intel Hades Canyon systems with an ALC700 codec, analog audio can
become unusable after rebooting from Windows into Linux.

The affected system uses codec subsystem ID 8086:2073. In the broken
state, Realtek coefficient 0x1b has value 0x4a4b. Setting bit 0x0400
changes it to 0x4e4b and immediately restores normal analog playback.

The BIOS also sets this bit after disabling and re-enabling onboard
audio, while Windows may leave it cleared. Linux currently does not
restore it during codec initialization.

Add a machine-specific fixup for Intel Hades Canyon which sets only
bit 0x0400 of coefficient 0x1b during HDA_FIXUP_ACT_INIT.

The fix has been verified across Windows -> Linux reboots on an Intel
NUC8i7HNB with an ALC700 codec.

Signed-off-by: Csaba Budai <ilyr73@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index cae327e1d..2fd11b963 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4089,6 +4089,7 @@ enum {
 	ALC225_FIXUP_DELL_WYSE_MIC_NO_PRESENCE,
 	ALC225_FIXUP_S3_POP_NOISE,
 	ALC700_FIXUP_INTEL_REFERENCE,
+	ALC700_FIXUP_INTEL_HADES_CANYON,
 	ALC274_FIXUP_DELL_BIND_DACS,
 	ALC274_FIXUP_DELL_AIO_LINEOUT_VERB,
 	ALC298_FIXUP_TPT470_DOCK_FIX,
@@ -4333,6 +4334,19 @@ static void alc287_fixup_lenovo_yoga_book_9i(struct hda_codec *codec,
 	__snd_hda_apply_fixup(codec, id, action, 0);
 }
 
+static void alc700_fixup_intel_hades_canyon(struct hda_codec *codec,
+					    const struct hda_fixup *fix,
+					    int action)
+{
+	/*
+	 * Windows may leave coef 0x1b bit 0x0400 cleared, causing broken
+	 * analog playback after rebooting into Linux.  Restore the bit
+	 * during codec initialization.
+	 */
+	if (action == HDA_FIXUP_ACT_INIT)
+		alc_update_coef_idx(codec, 0x1b, 0x0400, 0x0400);
+}
+
 static const struct hda_fixup alc269_fixups[] = {
 	[ALC298_FIXUP_RAZER_BLADE16_2025_PINS] = {
 		.type = HDA_FIXUP_PINS,
@@ -5411,6 +5425,10 @@ static const struct hda_fixup alc269_fixups[] = {
 			{}
 		}
 	},
+	[ALC700_FIXUP_INTEL_HADES_CANYON] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc700_fixup_intel_hades_canyon,
+	},
 	[ALC274_FIXUP_DELL_BIND_DACS] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc274_fixup_bind_dacs,
@@ -8230,6 +8248,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0xa128, "Positivo N15RPE-S", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0xa212, "Lunnen Ground 14", ALC269VC_FIXUP_LUNNEN_GROUND_14),
 	SND_PCI_QUIRK(0x7017, 0x2014, "Star Labs StarFighter", ALC233_FIXUP_STARLABS_STARFIGHTER),
+	SND_PCI_QUIRK(0x8086, 0x2073, "Intel NUC 8 Hades Canyon",
+		      ALC700_FIXUP_INTEL_HADES_CANYON),
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
-- 
2.43.0

