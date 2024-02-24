Received: from mail-200161.simplelogin.co (mail-200161.simplelogin.co [176.119.200.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77D517581
	for <linux-sound@vger.kernel.org>; Sat, 24 Feb 2024 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=176.119.200.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708767174; cv=pass; b=EV0JEPIUKpAG0xv6xj3dXRSvlCV1Ri55zu6KV26ZJf51ZejiJ1bDI1igO3KJeStYoayZ/8zRSMndxl4dswfjOb4jrKs7wf9dw12mnVGvkzIv+75LpRXlSEq4n9SF5jYZv/WcI0f1IJLaAvAoVsM3Kl9VK+xsNFHxR6bFDUDGOgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708767174; c=relaxed/simple;
	bh=jzBrO3uSZ6sZuNU1DMDZKwRSevCxQmBgUljq5SNQOP0=;
	h=MIME-Version:Date:Subject:Content-Type:From:To:Message-ID; b=rDxhcrS0LFBS74MG72dAIRhSNz2q3eKRE204V1Y6HvHAa459N2zpFkHLrqalrhDxJd13IExHcctuo2jgXjZqSidwZE57BidfDH8b1/Js4u3b/QaBaCFnPkzqzhMxJuoAkPOnhmbD0T8R1uGv49S1wM0jPIvG//nRy47bQ8Yfesw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=willian.wang; spf=pass smtp.mailfrom=willian.wang; dkim=pass (1024-bit key) header.d=willian.wang header.i=@willian.wang header.b=kdrjKjyW; arc=pass smtp.client-ip=176.119.200.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=willian.wang
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=willian.wang
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=willian.wang header.i=@willian.wang header.b="kdrjKjyW"
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1708767164;
	cv=none; b=sgZNtUwLcMwxeNKHRCPb06P+OS6/WOKJcZTiLGLCgdePrqqSrGmEyhi1up2bLcW79uvsmU4Cy/u4jn9u22jg8+qA0ogGF71TwEE86QzXt39fbHo4GzO39mFZuwesX3Ste1UZrRx2EHAWCBNM4Po7DrSI98bPKPxcY05/2bNQg/NSd30oN1+YUHAbxT4xqOEvfh4DmnC6QBk8U0ND0+53s8BhYzKv3ByqDSmo/HbsAdzklUDBwamX9FziY+U2sETPRNAgWjUUCK8LB7GgD8e0LyA2AR7+NeYLP4oNUY1QIGZOhe8yzt0e2To9so8TB35duaD9h6BXmHZGFzf1Zi6z1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1708767164; c=relaxed/simple;
	bh=jzBrO3uSZ6sZuNU1DMDZKwRSevCxQmBgUljq5SNQOP0=;
	h=Date:Subject:From:To; b=zIiqOh1qiQvxzCZf4v96HtpjHbiK7OnXt2RK0teDD7Ts2OS22TFhkJ1NMfiwSp/eGk3WKEM8Fqk7H5Vo4Vw0hZqsp1R1rxSIjFhlkNvxUyB0IOaFIKOofQaqie/F1NJqYLN8RkQnWVEZNI+oiJWoPoOF+j3MF8u+pEQnvd70dsxDrptZc64N+C6hqR+T2naqanbTnBLBLBBzSeM3fB8aIV8BX3Mo3IbF57OU/h7MM2X/2yw35gSev5NFplJuEMd4tncc0QUf6C1WyD+iNJ7HaPYVIj6XZPw0gm3zTGBYtn/Cmx6GWvVYBG6SFKks4oqNq0fPVov5x7xma+kEhc2L1g==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=willian.wang;
	s=dkim; t=1708767164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o5vmX96xFlSMPyK5nB+r0O4ya6q1S1f36Ej1Gbl8J/E=;
	b=kdrjKjyW7Cvk9ZZcjPTQqgWxF0vJHU9hJmxZTfGtnXvqLxcHDbSrDAEv83kea/MhLUhucV
	+TlWNMi9UNms/WvKw0RBNIodwBhn+/13mZpIQe+0eDfqnKWY7Qq79qGEQaezV8J2nDyjEB
	TVdLlX8f6PCBcQtNhthAiuZYqzz+Sek=
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Feb 2024 06:32:05 -0300
Subject: [PATCH] ALSA: hda/realtek: Add special fixup for Lenovo 14IRP8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
From: Willian Wang <git@willian.wang>
To: linux-sound@vger.kernel.org
Message-ID: <170876716408.8.3462298005055430048.273643142@willian.wang>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 273643142
X-SimpleLogin-Want-Signing: yes

Lenovo Slim/Yoga Pro 9 14IRP8 requires a special fixup because there is
a collision of its PCI SSID (17aa:3802) with Lenovo Yoga DuetITL 2021
codec SSID.

Cc: stable@vger.kernel.org
Link: https://bugzilla.kernel.org/show_bug.cgi?id=208555
Link: https://lore.kernel.org/all/d5b42e483566a3815d229270abd668131a0d9f3a.camel@irl.hu
Signed-off-by: Willian Wang <git@willian.wang>
---
 sound/pci/hda/patch_realtek.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 0ec1312bffd5..aa16944d5c11 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7444,6 +7444,7 @@ enum {
     ALC287_FIXUP_LEGION_15IMHG05_AUTOMUTE,
     ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
     ALC298_FIXUP_LENOVO_C940_DUET7,
+    ALC287_FIXUP_LENOVO_14IRP8_DUETITL,
     ALC287_FIXUP_13S_GEN2_SPEAKERS,
     ALC256_FIXUP_SET_COEF_DEFAULTS,
     ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
@@ -7495,6 +7496,24 @@ static void
alc298_fixup_lenovo_c940_duet7(struct hda_codec *codec,
     __snd_hda_apply_fixup(codec, id, action, 0);
 }

+/* A special fixup for Lenovo Slim/Yoga Pro 9 14IRP8 and Yoga DuetITL 2021;
+ * 14IRP8 PCI SSID will mistakenly be matched with the DuetITL codec SSID,
+ * so we need to apply different fixup on this case. If it weren't for the
+ * PCI SSID, 14IRP8 would be matched with the correct codec SSID
+ */
+static void alc287_fixup_lenovo_14Irp8_duetitl(struct hda_codec *codec,
+                          const struct hda_fixup *fix,
+                          int action)
+{
+    int id;
+
+    if (codec->core.subsystem_id == 0x17aa3802)
+        id = ALC287_FIXUP_YOGA7_14ITL_SPEAKERS; /* DuetITL */
+    else
+        id = ALC287_FIXUP_TAS2781_I2C; /* 14IRP8 */
+    __snd_hda_apply_fixup(codec, id, action, 0);
+}
+
 static const struct hda_fixup alc269_fixups[] = {
     [ALC269_FIXUP_GPIO2] = {
         .type = HDA_FIXUP_FUNC,
@@ -9379,6 +9398,10 @@ static const struct hda_fixup alc269_fixups[] = {
         .type = HDA_FIXUP_FUNC,
         .v.func = alc298_fixup_lenovo_c940_duet7,
     },
+    [ALC287_FIXUP_LENOVO_14IRP8_DUETITL] = {
+        .type = HDA_FIXUP_FUNC,
+        .v.func = alc287_fixup_lenovo_14Irp8_duetitl,
+    },
     [ALC287_FIXUP_13S_GEN2_SPEAKERS] = {
         .type = HDA_FIXUP_VERBS,
         .v.verbs = (const struct hda_verb[]) {
@@ -10247,7 +10270,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
     SND_PCI_QUIRK(0x17aa, 0x31af, "ThinkCentre Station",
ALC623_FIXUP_LENOVO_THINKSTATION_P340),
     SND_PCI_QUIRK(0x17aa, 0x334b, "Lenovo ThinkCentre M70 Gen5",
ALC283_FIXUP_HEADSET_MIC),
     SND_PCI_QUIRK(0x17aa, 0x3801, "Lenovo Yoga9 14IAP7",
ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
-    SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga DuetITL 2021",
ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
+    SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga DuetITL 2021",
ALC287_FIXUP_LENOVO_14IRP8_DUETITL),
     SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05",
ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
     SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940 / Yoga Duet 7",
ALC298_FIXUP_LENOVO_C940_DUET7),
     SND_PCI_QUIRK(0x17aa, 0x3819, "Lenovo 13s Gen2 ITL",
ALC287_FIXUP_13S_GEN2_SPEAKERS),
-- 
2.43.2

