Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A5A42668B
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 22:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777500588; cv=none; b=m11y5zdL0q5CQXwV5LGxrVCaAj0j6MSrLfvlnePlzZ9FjsEpQS3R55urRX/LRneWbKpr6iBz6ZsX3vElDZI+9N56L7TitJQkfEY+nfgU285xWH6GmpHEgYWU3wCRel/tUihOheEqUUAdkio7Ui+SbFsvtIqYcgyEwFw3spYqjr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777500588; c=relaxed/simple;
	bh=hCNOSBLXAjUMQtoBtP5UMR9WCVq4JZvnEwgHJmZlwqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JUzlWdVDuvmCiHhRC1C5LahtgvkcNjZ5MoabFOcaTJiZBg4fom4vJAtdOrSeh98Atyz2YJtsegPRx2pFYSawS53YGa5rfeTrSlwiWiu+KS2cJSCPmPU1mJ40dAhNrEzAFmGcS0f+Xlhl9E/Xct1vfORcCxTxEsXuzT/qbeSLIeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/9PPq/X; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/9PPq/X"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a2c3dfb4a1so183038e87.2
        for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 15:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777500585; x=1778105385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BxIGaH1g/MCNNZJvRxFr0b29r98pjCvj5WhhCw3MOiQ=;
        b=A/9PPq/XoL3dL1fsag/E5PndZEev/4D2IL7mlDZB4J4Jul+l3n+mj9DW3ODJw8RbXj
         WRPQydvE7709l2JgwMnD162blbOJHIBmk/RoZVFa3pt6DX7M2zKPOR9aKYTBrEy6lwJM
         m2jFpxsRtMSAqYmLOgiQVDBHojZ/BuK5+sWXUN8vkPRAbJ1o2T1P+gGt6e34WA7PtWOJ
         IJugemLs2v1IxzsW/+vGhcAd1Tpz+0FB+JfKcGNyTiCwOqpmYyyHfjt6u+rc3FOjDzNs
         F3FMYW8XIRKXDpn8J9quIaNTWqt6Wjx1btInhok8PFeW5LkskYBuoBqOJKJFonH/gN4O
         WPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777500585; x=1778105385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxIGaH1g/MCNNZJvRxFr0b29r98pjCvj5WhhCw3MOiQ=;
        b=dXnwHIEy9rUw12IbT5OTkNlY/NAS1NpboqDj3v8/uJAMfeKQzTLZ3XjtwIJ8RwWJjq
         oq1zmf5QjGdHDtgcDsVwJjw9/g78RfwmbKVbcFgyfDM5ZGFzfdO2FJtEGesyNJeG8X2i
         qHo+zCE2jtmam6BwJFZiRY9+bAxwSlWCCjGIj9FcM9Whh5PdYSbtUwSZgUxzNUBLSeJ+
         o2IDhiN1896TTpXd/yhbwX3+orK/Yg5wyUF90Hfe5Xwd27Ah/lNgrtBDkVbBL8uVlUCB
         fhoenbcdJ2E1oSBGP9q9XIbIMa3z0ENw4eQpKsNK7Iz7J9DTo+djcS1uwSv8gBfmRPpg
         JVGA==
X-Gm-Message-State: AOJu0YzvosVEOpw+delZ//ngNH+2nAfRH9TUTtyCSgKtpwwUP/aOhX+N
	rpHMfopuVdpB6QGyHi5QsAYup/EsOCMcITtyOxZsHvdiBy5NfCylHpcQ
X-Gm-Gg: AeBDieuvnaLYXvVCckMtwi1ZMq8Y7+uW4AU48JPNz6y3fdOx6JxS4eSoINmWw78iVgy
	dgIyCe38TAVj6kKbMyvhcaoHHJcI754SpiUETbVYztkmfMKxl83Hc/38TXPp5C19XoaHt5rREI3
	L/dGXXw1/Uw+HSwwQub/avfww5BA1Pc0cq5aEHbdfgeUyb6YhchXsuOVg4+KFqQ03pVRfWJ27UC
	5HFJ4+5h5RTYIfcxPtTI8I30t3nmYZ/EvkWOL60XQN0lxkidgEEjny1WmN2lbfFYwCiuF6tQEew
	GhSVs66DhWKEqMSxVEKhoH+VUhZYGOYQi8l7DZpsgifSVzkrszSRoipnSjyt0fpXR3Idw+iMSDO
	W1erCmoo8mvqP7aRunaWLFLqcJD9+flYjhtqn/Ki1Q/EqSlvdySqnSSn1y0upT6CasxZ1z7mPII
	R+c6sqeTkbj6f2nMC3g+j90vJPeTgvQtut61bzD2Vbtg==
X-Received: by 2002:a05:6512:3b90:b0:5a4:ea:724f with SMTP id 2adb3069b0e04-5a8522d7f95mr17256e87.30.1777500584405;
        Wed, 29 Apr 2026 15:09:44 -0700 (PDT)
Received: from yurko-laptop.lan ([213.174.0.72])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a769586sm883314e87.64.2026.04.29.15.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 15:09:44 -0700 (PDT)
From: Yuriy Padlyak <yuriypadlyak@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuriy Padlyak <yuriypadlyak@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix speaker silence after S3 resume on Xiaomi Mi Laptop Pro 15
Date: Thu, 30 Apr 2026 01:09:03 +0300
Message-ID: <20260429220903.14918-1-yuriypadlyak@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Xiaomi Mi Laptop Pro 15 (TM1905, subsystem 1d72:1905) ships with the
Realtek ALC256 codec on Intel Comet Lake PCH-LP. After S3 resume the
codec sets coefficient register 0x10 to 0x0220 instead of 0x0020 — bit 9
is erroneously set, which silences the internal speaker. Bluetooth and
HDMI audio are unaffected because they use different paths.

This is the same mechanism fixed for Clevo NJ51CU by commit edca7cc4b0ac
("ALSA: hda/realtek: Fix quirk for Clevo NJ51CU"), but the existing
ALC256_FIXUP_MIC_NO_PRESENCE_AND_RESUME also reconfigures pin 0x19 as a
front mic, which is wrong for this Xiaomi where pin 0x19 default is
0x411111f0 (disabled). Add a minimal fixup that only clears the stuck
coef bit, and add the Xiaomi SSID to the quirk table.

Verified by reading coef 0x10 with hda-verb after resume (returns
0x0220), writing 0x0020, and confirming the internal speaker resumes
output. With this fixup applied the bit is cleared on every codec init,
including post-resume.

Signed-off-by: Yuriy Padlyak <yuriypadlyak@gmail.com>
Cc: <stable@vger.kernel.org>
Tested-by: Yuriy Padlyak <yuriypadlyak@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index d720565db..2ec0b9158 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3390,6 +3390,19 @@ static void alc256_fixup_mic_no_presence_and_resume(struct hda_codec *codec,
 	}
 }
 
+static void alc256_fixup_xiaomi_pro15_resume(struct hda_codec *codec,
+					     const struct hda_fixup *fix,
+					     int action)
+{
+	/*
+	 * On the Xiaomi Mi Laptop Pro 15 (TM1905, SSID 1d72:1905) the ALC256
+	 * codec sets coefficient 0x10 bit 9 to 1 after S3 resume, silencing
+	 * the internal speaker. Bluetooth and HDMI audio are unaffected.
+	 * Clear the bit so the speaker keeps working across suspend cycles.
+	 */
+	alc_update_coef_idx(codec, 0x10, 1<<9, 0);
+}
+
 static void alc256_decrease_headphone_amp_val(struct hda_codec *codec,
 					      const struct hda_fixup *fix, int action)
 {
@@ -4041,6 +4054,7 @@ enum {
 	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
 	ALC233_FIXUP_NO_AUDIO_JACK,
 	ALC256_FIXUP_MIC_NO_PRESENCE_AND_RESUME,
+	ALC256_FIXUP_XIAOMI_PRO15_RESUME,
 	ALC285_FIXUP_LEGION_Y9000X_SPEAKERS,
 	ALC285_FIXUP_LEGION_Y9000X_AUTOMUTE,
 	ALC287_FIXUP_LEGION_16ACHG6,
@@ -6229,6 +6243,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
 	},
+	[ALC256_FIXUP_XIAOMI_PRO15_RESUME] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc256_fixup_xiaomi_pro15_resume,
+	},
 	[ALC287_FIXUP_LEGION_16ACHG6] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc287_fixup_legion_16achg6_speakers,
@@ -7762,6 +7780,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1d72, 0x1602, "RedmiBook", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1701, "XiaomiNotebook Pro", ALC298_FIXUP_DELL1_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1d72, 0x1901, "RedmiBook 14", ALC256_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1d72, 0x1905, "Xiaomi Mi Laptop Pro 15", ALC256_FIXUP_XIAOMI_PRO15_RESUME),
 	SND_PCI_QUIRK(0x1d72, 0x1945, "Redmi G", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1d72, 0x1947, "RedmiBook Air", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1e39, 0xca14, "MEDION NM14LNL", ALC233_FIXUP_MEDION_MTL_SPK),
-- 
2.53.0

