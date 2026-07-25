Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4F923BCF7
	for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784988190; cv=none; b=WSgyrmZ1g1PNrn9sG0MuahuzMq5wrrhzshwIi3bEapoARZRJvoHxYmOR6mZiu7/5FZ9Z2Qx1AoW4hdlIto7P265LbXRY5UgQNUXzf8/5NnNsCfNxXDAzq+m5pNivshlN5Fon+85IyCksEpmSRAJKI40HhTeZ/3tUw7GwuYa/FLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784988190; c=relaxed/simple;
	bh=rqM+bHp5dc01oSVIdNaDGVvxy/3DKX+PpaJWPk6k17Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TptyVIWblLTNbEdUDj1QY5NsuZJRm8CiMAmLmENUB4CJ+eEQeU+hmEF/9JYjSLIgDl84jqmUCHgmnQzvIHXW1O44/mstu9cKnbhXw3TLCrISZ7CIjQjSdaGwUvISEz8pLhvbFBYwpx1itwhaSp373WX1wyIjavSL57TJiuyZv30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Siox1CRO; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Siox1CRO"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1030371a91.3
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 07:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784988188; x=1785592988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T1f11c1+LqGQKYZGZsvjS1hui2EH+/7PFp9bdrgEzrg=;
        b=Siox1CROXRBJXoMribzku28gwzWWrRK4fb77GAxibGgIaGC0x5F+AkbQwREdgtaXi3
         QzVI64/ZRgiLdis+C554xdJ5mBFiLYlTK2xTIfn6M5dfgcB1+e4x8D+8Td5CadCC3MbZ
         Q6PhNnCAUsWuW0XJVjrvxtZbu87H9gvvEcIoK51Ds488qhj2wkd4NSRlPr4KY+xO7mEc
         1QTlDne7u0lDzdScR0XrdYhbfAZWymXVXxj1DG7G51+D5zMfnA/CtlZXf2sKRigTGgD2
         ANNe7N4sStvTsalwythXOcQoRrixyeI8AHojDkaIjvbkaYAKjzRYUNEoPcN5KWraIzc9
         W+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784988188; x=1785592988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1f11c1+LqGQKYZGZsvjS1hui2EH+/7PFp9bdrgEzrg=;
        b=m9daykGDgtV0dC4ORwE/xet9iclUxLlQ2LLoXgAB0w848gU8p5S0AdMdHmVNLPMBKy
         MSm8XkC7WptXZu7EqtFtOCzTOOU+XGtklP1FgYOX3Yux/rxnRJNZpiIb5bTCqSO/SIdn
         LYU4qr6weiBe1GBxF16vsI+AyglMGAzHYDSJq5EUQ0SsEQAMwzHGyaDVf7kPxhxM76qv
         SWzLlkv65yeNl6wiZ2KsJ2dIYnGlrDMQbCYPwJnmKDgmjR5IyG/Y1qREgeVxF29JT0zC
         bLUtOib4woW3A6DVpFkwNkn+3nOUA5hctnYNA25bNaEOP4L8lHbz8iifpMLAGfmaBUmj
         trgg==
X-Gm-Message-State: AOJu0Ywvz3+EpfDwoupQxyq5SjmQX3UIzXwPvIY5j5Tc+AspLmy/SOAM
	qUrcVIXxe0lEV8nazhJGF7jlFdQR+mpK43MVg+UhHpYN051XpkP5naBW
X-Gm-Gg: AR+sD10GiypEEIpNEakuY1EgIGZJLRlP3JCjEtzLtVjR2faJO8REn3/p8k+eV1HGUd3
	Tqaj6ld/7yn26Jfqtvu1pgugfKq1rhzjQFqBWmrk8Cf2mqtPvGgiCSDBJTRl8+JlaBZvL0Ec0Z5
	iZfgMKAXg1VoUUJ6EpaJAjtxVHte5UjPDDjmddEdHzxSw4tfXtCFgcJ6np5W8XDXzAEzoiW+KVa
	WoywFY54MIXx7f1Le8jKe24PpySY84L901U8j1xziit/RuVMBvC+2aO9BnTXpBBL+821VL4UI74
	2GIT204Qwtqplaqvckr/KERfh7X2Acp/2CV+JPuqGwB+gUh6uDdS8bFhH4xP/rokaf8aqjcKoOD
	AIfsZyFWLgln4kgCe/C0VtLdTuH2GujYG/kMs600HLLIgjH+ZM03NE7sqBY1IEQGRJ+MlxPHRl2
	BrMBNQF7VONA==
X-Received: by 2002:a17:90b:3f0c:b0:38f:1e1a:5164 with SMTP id 98e67ed59e1d1-38f2975e3b1mr2708145a91.37.1784988188149;
        Sat, 25 Jul 2026 07:03:08 -0700 (PDT)
Received: from fedora ([2401:4900:91fb:6bf5:d7da:6f79:b6ed:5828])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc415eafsm11151861eec.7.2026.07.25.07.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 07:03:07 -0700 (PDT)
From: Gunal S <gunal2002@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gunal S <gunal2002@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Infinix INBOOK X3 Slim
Date: Sat, 25 Jul 2026 19:32:18 +0530
Message-ID: <20260725140241.28524-1-gunal2002@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Signed-off-by: Gunal S <gunal2002@gmail.com>
---
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

