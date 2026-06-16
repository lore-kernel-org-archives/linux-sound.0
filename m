Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026254502F
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781631310; cv=none; b=CeRqFez/favaSSCNc9+VajmwmhIoD/BJvbaZjzh1GIaLKXlBqRyQFwD9ACZ2+B6M6F+TzXZvwf44dVl1VW+UMxz9SzHFIQjUuAOUQ+KnHujboEzRPdqqoZa2rFG939tewqbi0jRSIZLZOFdSuL/vuInSqw7jWPlqJ25CC4qbumo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781631310; c=relaxed/simple;
	bh=QFUfyWDZ7jBPugSWk6RmS5YMcXyiK8VRmnUoLKuBncw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bxD1zItzmXO6lDpOajzGNkaZX5pDVNNHe944dVf59BHU2MxHeLYtPHRi/B90keobb2RSciVMebTggH0AGTV94mlGVDvt82GUBrDLUXLkK8RZrpyNr6n8VxeCuxaZQ9sfcrMU72BpV9aPCsUd0GSHgjGvJ44tG/GShjuIENWPx90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YETapU/b; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YETapU/b"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so121081a91.0
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 10:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781631308; x=1782236108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eddoeh+529KrI4UXlEjaC0Bj1TBtvgIqM8rPX6PagYA=;
        b=YETapU/biqRljyUyo6Er5e4DE+2cXIAFjckHnTsTBDoUcxNcDFktQieGD9tF4Dy6We
         2+loN0riz2ITY5V2w2bzcZGNy/2EryYZfzaTPlKeLgj4qNpqXbXaIYlQHaLRaTI/2MVw
         rBUa7rFw+dVykgdBzqFVfDWKkf02xrMXJQ+cLTUJ4vpilyrMSOWUXM7bV06AAfvFukgq
         ajrptyJq8zmvNzq+q29/K8YRVBFAe1/KWMWGD6zUWPE1mwLZfvboCBxlJ2jtztuclV6c
         tcVnyVwb+qCnmRVD5Y8CN+cNvJRInH2snYbQp+5uSTWJRm99Q+m1dl1FJZIMB7/vjyIK
         YHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781631308; x=1782236108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eddoeh+529KrI4UXlEjaC0Bj1TBtvgIqM8rPX6PagYA=;
        b=JQUJ7NJFaLddBpA7p6WqHyRPqfUqP7MYnnIIjm03aHtHWEpnsJWbXMkQudWRsz9HLe
         YFf1h/arzBN89uSTpvNl3DiKt++KSe+RVTxXvw4ItKI2o71sQeP/lrV035bBMqueNFA+
         UlMQv1Nat48xEGNId1Z4LHN7nDO9kr8RjF2Xi3ggTrHhLHLfq+IrZLnuWhW6iTvkq3qE
         WaI6qozl39rKWae4gsod2MNijZTP1mXuK5wsxJCu9ioD+SKqQX3PtrZWr0Kud5hpiYmu
         zRkqUegkzANEcrlmOfW7TKWrhCWvnh/p56gDPorMtU9dOJ3sGYlb/zrrP1znBYhar1j6
         /b3w==
X-Forwarded-Encrypted: i=1; AFNElJ8szSari6u2bCUgnlwg2xYpx2OIX23aTPpF/1A9Rv1+2rWVX5mwX5NfzMzBMOQexbj0wljm23Bf6UA5mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKUbmCSt/zb5RKJjWNqhH/dqqIVlLNvz8pebSF9sL/FhkXUNM1
	XnKbeXba7uMjMTKe+wx/Udb2UJapilabryz2IWTT7f+aXqBA3Cnf6fcX
X-Gm-Gg: Acq92OHVfgs4gwd6yeADUGFnKT8U5+GO8GsTvlZSzrvaAXe6EgWi/pSoe+si2WaOa5g
	u0xTZvjgtvm0NEtsfkHMA2RIqUWJWrMe3EcLPTuYfnBSiwopY2lUPdRRH8RmOP9y6/EwseCTJOF
	bvJ+kwWhMtw3+jSNTKJ7DLdM+4zbP/yMQ5skmYX/f9ZD4k/SEu8W0BmoijBLpNbkVB/DlnEA0v4
	4Ui8XVtoOUtKbG8CAHp3zrntd4AnXWR8Hi7sSqcffvie7V7Hw7KtU2HY9DCnPOlLNw8zlDnxRLE
	H0ahQTJJEn1XVwrNaHcrUg5iBPKk7pM27OLEWeh3Ss89WWU7TyrMUM/0bngr1r1Gt73VQbKuVhb
	ywFm7Azr64//QNR6WywMXzmo9Kpezl7r+7dSrIcWTylFm6SJFjAabXn8mQv9XF1DQ0rniTHjzmE
	5dYeRQV8r4d8L/c9Rx+hN0wHJO7N4pnrz4P/fcFgsJJ5mI
X-Received: by 2002:a17:90b:38cf:b0:36d:c138:e0a0 with SMTP id 98e67ed59e1d1-37c8e44c2cdmr538734a91.2.1781631307993;
        Tue, 16 Jun 2026 10:35:07 -0700 (PDT)
Received: from tall-manderson.lan ([2607:fb90:9c20:d8f0:80e2:7be3:c57b:988d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521e76d1sm3491956a91.8.2026.06.16.10.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 10:35:07 -0700 (PDT)
From: Galen Hassen <rwekyes@gmail.com>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Galen Hassen <rwekyes@gmail.com>
Subject: [PATCH v2] ALSA: hda/conexant: Add pin config quirk for Lenovo IdeaPad Slim 5 16AKP10
Date: Tue, 16 Jun 2026 10:32:57 -0700
Message-ID: <20260616173257.37373-1-rwekyes@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87se6mrah4.wl-tiwai@suse.de>
References: <87se6mrah4.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo IdeaPad Slim 5 16AKP10 (PCI SSID 17aa:38b6) uses the
Conexant SN6140 codec. The internal microphone is on pin 0x1a but
the BIOS configures it with pin default 0x95a60120, which includes
a jack detection bit that causes the kernel to treat it as an
unplugged external mic rather than a fixed internal mic.

Add a pin config quirk that overrides pin 0x1a to 0x95a60130,
setting the connectivity bits to indicate a fixed/always-connected
device. This allows the internal microphone to be correctly
identified and used.

Signed-off-by: Galen Hassen <rwekyes@gmail.com>
---
 sound/hda/codecs/conexant.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

Changes in v2:
- Move the quirk table entry to the correct position in PCI SSID
  order (between 0x38af and 0x3905), as pointed out by Takashi Iwai.

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index e3b6aaabe..3d9226276 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -291,6 +291,7 @@ enum {
 	CXT_FIXUP_HEADSET_MIC,
 	CXT_FIXUP_HP_MIC_NO_PRESENCE,
 	CXT_PINCFG_SWS_JS201D,
+	CXT_PINCFG_LENOVO_IDEAPAD_SLIM5_16AKP10,
 	CXT_PINCFG_TOP_SPEAKER,
 	CXT_FIXUP_HP_A_U,
 	CXT_FIXUP_ACER_SWIFT_HP,
@@ -826,6 +827,12 @@ static const struct hda_pintbl cxt_pincfg_lemote[] = {
 	{}
 };
 
+/* Lenovo IdeaPad Slim 5 16AKP10 with SN6140 */
+static const struct hda_pintbl cxt_pincfg_lenovo_ideapad_slim5_16akp10[] = {
+	{ 0x1a, 0x95a60130 }, /* Internal mic, fixed/always-connected */
+	{}
+};
+
 /* SuoWoSi/South-holding JS201D with sn6140 */
 static const struct hda_pintbl cxt_pincfg_sws_js201d[] = {
 	{ 0x16, 0x03211040 }, /* hp out */
@@ -1006,6 +1013,10 @@ static const struct hda_fixup cxt_fixups[] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = cxt_pincfg_sws_js201d,
 	},
+	[CXT_PINCFG_LENOVO_IDEAPAD_SLIM5_16AKP10] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = cxt_pincfg_lenovo_ideapad_slim5_16akp10,
+	},
 	[CXT_PINCFG_TOP_SPEAKER] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -1114,6 +1125,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x17aa, 0x21da, "Lenovo X220", CXT_PINCFG_LENOVO_TP410),
 	SND_PCI_QUIRK(0x17aa, 0x21db, "Lenovo X220-tablet", CXT_PINCFG_LENOVO_TP410),
 	SND_PCI_QUIRK(0x17aa, 0x38af, "Lenovo IdeaPad Z560", CXT_FIXUP_MUTE_LED_EAPD),
+	SND_PCI_QUIRK(0x17aa, 0x38b6, "Lenovo IdeaPad Slim 5 16AKP10", CXT_PINCFG_LENOVO_IDEAPAD_SLIM5_16AKP10),
 	SND_PCI_QUIRK(0x17aa, 0x3905, "Lenovo G50-30", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x390b, "Lenovo G50-80", CXT_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x3975, "Lenovo U300s", CXT_FIXUP_STEREO_DMIC),
-- 
2.53.0

