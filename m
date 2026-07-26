Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390B72BEC52
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785056581; cv=none; b=SvCrecCjvUc9oylQc/fA0OId2PDxYMgotSqleugp9dpDaFIjOHA6FHRqY0kozAX9QAhjUvg+7EacTCbflbtUf5IKLEY1HP9wnayVkkklnhoteu1xFZSCAhgR8wzILR/pfOTpAFM6qFTlIS0D02JPE/Ys5BUObpK6HOgrWNF9+zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785056581; c=relaxed/simple;
	bh=L2Igs+4mV4+GcdZSYkYS5Hgq9N+1Am75fWqOGCbJyM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJ/4gOeSkXja+8qn7LJYR5MvzHQdDNvFA2lKmhs4SQ5buZSyENbAGVdrXA0cc18B3wDne7coPBFiNgCLaWUcuB3qlclj86p0QafZ7V+4LZjTVYl263grj/XXROSL62shWfF2rhiQAwohVUsl1CfwseojyekKrDyc2c+5W8eiikc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvdoT9uI; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvdoT9uI"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9aea40d799so872460a12.0
        for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785056577; x=1785661377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X42qayrLWkd37VbCxwMOxjoYuIEHbZkiWI2Z233rOJw=;
        b=qvdoT9uIocsPD/0EmbEwITd1dN+nYv17dtav1bKDbNfMTIMapBnUQC+p4/hiHmc2F1
         XbMHnsCCPx1HUTSEOqItsVZ7yGujEQT3b0dk2Z/W/6B8uF4r4LGZMyBEJHI9wnY/RvHy
         BsBAzfx0rXVut/Y3HwSxEl4aYeH16Aiytovl6HwLC60upX3NFkGJBbAWsv4gqa+02LiK
         97lGB7Bw/efdrbY7sUtK2nOP7/J88qP7Pbs8yoBi8Z/c1Y23YL3rnbn/jQgsBUgF/qZw
         y5mXwS5sLGndaV8uXyqHk7dbZc+0yuBg9MiuDME8SbaDex5S3M0fdlzZ6GgRymCGJUoV
         br8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785056577; x=1785661377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X42qayrLWkd37VbCxwMOxjoYuIEHbZkiWI2Z233rOJw=;
        b=dV78XO9ma16YyKM+zI6QFNtbj7abdOVoK+3Z5nIqLUhMiWvryn1xZbMnQFyJnPQhdZ
         nsdwpPWqYCkpJM9Nl0rIKVQD5bKj2qpZ9WTF1WFAmmnEuQykc6h6+VQZmMycB0NrxmDD
         fyXDZQM3UZU7wR2jPMrMWV5U4ECmmI3C76TkUjIcZTEeZ96Y/YBUAEhaq0g6NjvPVqdE
         DRUQjjM4SRvsqnXAaVQZurRIAgcYAWEuLkOWE7ZfUiNlNvXqupXcsnO/p0U3kkD9Wo7L
         LM0X5imHLZ0biNIrcBRdw4ypmcndda8eSqMcYgmT1iR/Zsph85ht2JRddi3o4W19rjqs
         Xj6w==
X-Gm-Message-State: AOJu0YypqQy+bFFYhyGQCAABbcVBSw/zIdC5pz8xu5lEGkXzJF/n8qN4
	AOgOcnx850F84TJfugkbqFCth1fDiESCHWB8CLdJOt3Nieb3upb0zKOs
X-Gm-Gg: AR+sD11AKjrSxbp0x+CmYYnpXrxuIwOP4tBu7UVDqaNrBqeioRQzbuYJr0oQ85PFI5h
	Gk0JZYtUTQCHnshH+xpEpZOYRvw27A6vsaltvOpH6w3Xfw1Y7gSvGgOihuSRBXQl6LtCQi8siae
	gtMInXBFXOCqOJXnNtvMckGeod+gu2r2LnnNCEAkeDNDi6ncLYtzkgtp+JqiZ/vinLYz+pwqiR8
	lHG0MLuNCTzZudsJoMncv6TQ2fynKdVA7aPJQY0pavJE5aNNt4wP0SZ9e5whT6m/A7mXy3oS2Ft
	PZ+5PjVkPEjB9u9lpn3VEjSOYScc1gOSH9rMdAzTeRSxN5joJmxd1dp0clpCtfH7RBmQhCD9E0V
	GYDE0OedhXOaUoPzX/hVqLbBOwSEs+gMVWLme1w8lSXiMySmGXc5prTlk7dYezF8zt3xIN5+gFI
	Y=
X-Received: by 2002:a17:90b:3e47:b0:38e:4011:465f with SMTP id 98e67ed59e1d1-38f2960cd53mr4451101a91.23.1785056577417;
        Sun, 26 Jul 2026 02:02:57 -0700 (PDT)
Received: from fedora ([2401:4900:c8f3:48f4:c9f1:4935:9171:a431])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc413766sm19451986eec.8.2026.07.26.02.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 02:02:56 -0700 (PDT)
From: Gunal Seenivasagan <gunal2002@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gunal Seenivasagan <gunal2002@gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for Infinix INBOOK X3 Slim
Date: Sun, 26 Jul 2026 14:27:11 +0530
Message-ID: <20260726085715.229802-1-gunal2002@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87y0ey9of8.wl-tiwai@suse.de>
References: <87y0ey9of8.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Infinix INBOOK X3 Slim (ALC269VB, subsystem 0x2782:0250) has its
internal speakers wired to pin 0x1b, but the BIOS pin configuration
table declares 0x1b as "no physical connection" (0x411111f0). It instead
declares pin 0x14 as the internal speaker, although nothing is connected
to 0x14.

As a result the internal speakers are silent under Linux while the
headphone jack works correctly. The codec output path to 0x14 is fully
open (DAC assigned and streaming, mixer and pin unmuted, EAPD asserted),
so the failure is silent with no error reported. The speakers work under
Windows, where the vendor driver supplies its own pin table.

Add a fixup that disables the unconnected pin 0x14 and declares pin
0x1b as the internal speaker.

Reusing the existing ALC269VC_FIXUP_INFINIX_Y4_MAX was tried first, since
it also remaps 0x1b to an internal speaker. It is not sufficient here: it
leaves 0x14 declared, so autoconfig finds two line_outs

  line_outs=2 (0x14/0x1b/0x0/0x0/0x0) type:speaker

and binds the primary "Speaker" control to the unconnected pin 0x14 while
demoting the working speaker at 0x1b to "Bass Speaker". Audio is audible
that way, but the volume and mute controls a desktop actually uses end up
attached to a pin that is not wired to anything. Disabling 0x14 is what
produces a single correct Speaker output.

Verified on the affected machine: with the corrected pin
configuration the driver's autoconfig reports

  line_outs=1 (0x1b/0x0/0x0/0x0/0x0) type:speaker

both channels play, headphone auto-mute switches correctly in both
directions, and audio survives codec runtime suspend (D3) and resume.

Signed-off-by: Gunal Seenivasagan <gunal2002@gmail.com>
---
v2: No functional change. Corrected the author and Signed-off-by lines to
    my full name, as requested by Takashi.

 sound/hda/codecs/realtek/alc269.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 379e1458f..d33904273 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3939,6 +3939,7 @@ enum {
 	ALC269_FIXUP_DMIC_THINKPAD_ACPI,
 	ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13,
 	ALC269VC_FIXUP_INFINIX_Y4_MAX,
+	ALC269VB_FIXUP_INFINIX_INBOOK_X3_SLIM,
 	ALC269VC_FIXUP_LUNNEN_GROUND_14,
 	ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO,
 	ALC255_FIXUP_ACER_MIC_NO_PRESENCE,
@@ -4409,6 +4410,14 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_LIMIT_INT_MIC_BOOST
 	},
+	[ALC269VB_FIXUP_INFINIX_INBOOK_X3_SLIM] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x14, 0x411111f0 }, /* disable, not connected */
+			{ 0x1b, 0x90170110 }, /* use as internal speaker */
+			{ }
+		},
+	},
 	[ALC269VC_FIXUP_LUNNEN_GROUND_14] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -8020,6 +8029,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x0214, "VAIO VJFE-CL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0x0228, "Infinix ZERO BOOK 13", ALC269VB_FIXUP_INFINIX_ZERO_BOOK_13),
 	SND_PCI_QUIRK(0x2782, 0x0232, "CHUWI CoreBook XPro", ALC269VB_FIXUP_CHUWI_COREBOOK_XPRO),
+	SND_PCI_QUIRK(0x2782, 0x0250, "Infinix INBOOK X3 Slim", ALC269VB_FIXUP_INFINIX_INBOOK_X3_SLIM),
 	SND_PCI_QUIRK(0x2782, 0x1407, "Positivo P15X", ALC269_FIXUP_POSITIVO_P15X_HEADSET_MIC),
 	SND_PCI_QUIRK(0x2782, 0x1409, "Positivo K116J", ALC269_FIXUP_POSITIVO_P15X_HEADSET_MIC),
 	SND_PCI_QUIRK(0x2782, 0x1701, "Infinix Y4 Max", ALC269VC_FIXUP_INFINIX_Y4_MAX),
-- 
2.55.0

