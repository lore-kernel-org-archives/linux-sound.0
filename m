Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB29052843F
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 13:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070540; cv=none; b=gMrUoXq7mSrCrYksh0OFUamEjFipmNvsCOKzc7dmniDJplZD7zrltcHN04FS6L+gTVutoyQwHcfMULINTdbfxZdmIwlx4yTmgedKvaxhuurhvidfHB2+K9i5bLHG/uWtqHbxQmjsW+mlBlAZiUerEndo0uPVBX7XL9Cr68Q8rnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070540; c=relaxed/simple;
	bh=xs+kZ42rmYwiivpmB0ENnaXo2VwKvylSKcyYYvnzXq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YQAKvxLifd+U5sd04gZjiR1ycq/3tU6iaV65KrhdqqLlqPZieEQLulPEJfM7G5vtM+ujBwsgePTdlOYgXDjsOpzU26SI0Wh+sh8KRU9lD1LiZqTYpuYmheCsINC05oaRKG70G3AjLpIs43qNnyn74WG2/8RxOKzb5J0YZLccuXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dOnhpocH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dOnhpocH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so18614685e9.0
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 06:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792070536; x=1792675336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v0koWxN7u1SSkvKU8TByxzhlloNtbbSXphmEUfbqlfE=;
        b=dOnhpocHoaOVGjp6+CJ7TFc0k1cLy8zXVxKPYWpZGKVn83jwX9FKYXBuAyZu5TB0fL
         xdP0HjnkligWSNZa6gX83ro4l82CsHbwfZe/Y2J4quVKVoPoTI1qkolnnYOZswP9VIhk
         hCLOBLvFd01gGnc4niwZJsdDPeoI/XKpmGwPg0Ff0PoO0WvDHKphkWL4z0DD12EyKNbp
         yw11SibQ791V/irC8ry6t/1uBpWtbyUUHJsy+IBdOWqxLvDKha7uuFpG59q6GHrwnRdI
         nLXDM+X6vktY60cydKSg7k0Khonn/OpRmvwZytJsL+EVkR6AreKhELJ67J2xTSaIOW4a
         +xCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070536; x=1792675336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v0koWxN7u1SSkvKU8TByxzhlloNtbbSXphmEUfbqlfE=;
        b=g/82Q1BeqlnQ6IG08K1wA56fl/gDeOOoeZq2gIMSDiRPKWpDiU+IcCdOX+zKDyejMd
         wLkyKypaR3EnpiX8J++RL69rOGXJ/ZAVSJwrZp91smOX2Q5cJK9S1g7nFE41NZGQLB2X
         5im5ym8TqAMW9nl68hQzJVVN4Gie5pacdVeI9/vYB6VFp3rkw661SYtOiRPuUSPvaD3r
         5X15q4uSJ2lp+A8k6r6QmqwXcbCTdKoQah2PXUAwZ5nDQbrpGUmFDZ8DyC+6Mtrr1Xhf
         BTclShKzUt2OgQEVMMQ3UfWVsNg8gpxkT/OZUGLj5970QG0cDwj8rZGYR3yl+s0ZkJSi
         NYdA==
X-Gm-Message-State: AFq9FYJYxe6SyN+m3FXb4MmRkrD+u6yVto/Tc5MMKN+DELV9mT5d8gMr
	6pBWqWaCYAY9wepKaK4FhRZ1yTw1G/TL+kbudrzyUjniFxK6oM8MKv3gSquhYPq4QYk=
X-Gm-Gg: AYBFou1cBsKTObIdvJVSbEeYaAhkCNB2l7LwsFRHXNQVFLqxSiKFgb0/oe93YDelaTg
	V553Oh9zF4a4M1EIJqjl9ep25BHEnOZU7wxSFUih03TApLGysq3rjz2qunLjZsBjPWm5be/MIZT
	Iu/YDberXRIgOLtEX64rlukiUmylFG0o7RqfJRK0qH5rbTDcENJMv6nCyK/tEPkbUf+MYc5qx3G
	1sTukZfRrs0cexs1ojhwuZ9t8B60II0ZlZ6vy/dtl4sBpaYhyJBNcic3Fyy/Wmby+x6WIxCtwGe
	oUogcCD3M65s9R0K1Zdeh1Et+vdq66gesCRliBgSBh/tlt5iA5jaDNvWGfDlKa/KpQxt7ufya3l
	bvoxVL6Ch3f93qnWZ99l7zZD12BLxPVZF/o7QVc7raCzKC3FBlnq2oJ4OFUKCJEXyB7mbWBKA+T
	0KGLZ9fLCYi2xpu1ctB+KIjQ6LiXfzDnVjKPB2Dlen9Z6+YbU/Odw5BiY/z0xGh3EIBFJnhvEc
X-Received: by 2002:a05:600c:8216:b0:49d:34:420d with SMTP id 5b1f17b1804b1-4a18e4b0465mr392350895e9.20.1792070535541;
        Thu, 15 Oct 2026 06:22:15 -0700 (PDT)
Received: from archlinux.lan ([188.75.207.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd91c55bsm64398865e9.0.2026.10.15.06.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:22:14 -0700 (PDT)
From: Viktor Menshin <ripeeerr@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	alsa-devel@alsa-project.org,
	Viktor Menshin <ripeeerr@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix hiss/crackle on Lenovo Xiaoxin 14 GT (17aa:3912)
Date: Thu, 15 Oct 2026 22:21:57 +0900
Message-ID: <20261015132157.57198-1-ripeeerr@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 3a3e810e9108 ("ALSA: hda/realtek: Add quirk for Lenovo Xiaoxin
14 GT") added a quirk mapping SSID 17aa:3912 to
ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN, chosen by analogy with
neighboring SSIDs (0x390d, 0x3911, 0x391a) without being verified on
hardware, as noted in that commit's own message.

I have since tested it on the actual hardware (Lenovo Xiaoxin Pro 14
ASP10, same 17aa:3912 SSID) and confirmed it does not fix the reported
issue. ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN only repoints pin 0x17
and the preferred DAC pairs for the bass speaker; it does not touch
the codec's vendor processing coefficients. The actual symptom -
constant electrical hiss/crackle on both the headphone jack and the
internal speakers, independent of volume - is unrelated to pin/DAC
routing and is also present on stock Windows before the Realtek
driver is installed, which points at those coefficients being left
at their power-on default.

To find the correct values, I passed the physical HD Audio controller
through to a Windows 10 VM (VFIO, with QEMU patched to log CORB verb
traffic) and captured the coefficient writes the vendor Realtek driver
performs at init. Replaying a single one of them on Linux via hda-verb
reproducibly eliminates the headphone jack noise:

    hda-verb /dev/snd/hwC#D0 0x20 SET_COEF_INDEX 0x36
    hda-verb /dev/snd/hwC#D0 0x20 SET_PROC_COEF  0x77d7

This has held up across reboots and kernel updates for several weeks
(applied via a small systemd oneshot unit while testing).

Add a dedicated fixup that performs this coefficient write and chains
it with the existing ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN (which may
still be relevant for the bass speaker pin wiring on this board), and
point the 17aa:3912 quirk entry at it instead.

Honesty note: this fixes the headphone jack. The internal speakers
still have noise under certain conditions (notably worse on AC power)
that I have not been able to isolate via coefficient-table replay;
that part remains open. Sending what is verified to work rather than
holding this back.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221203
Fixes: 3a3e810e9108 ("ALSA: hda/realtek: Add quirk for Lenovo Xiaoxin 14 GT")
Signed-off-by: Viktor Menshin <ripeeerr@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 1623cf926..b72e04dc9 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3661,6 +3661,28 @@ static void alc287_fixup_yoga9_14iap7_bass_spk_pin(struct hda_codec *codec,
 	}
 }
 
+/*
+ * The Lenovo Xiaoxin 14 GT (SSID 17aa:3912) uses the same bass-speaker
+ * pin wiring as its 0x390d/0x3911/0x391a siblings, but on this board the
+ * codec's vendor processing coefficients (node 0x20) are left at their
+ * power-on default instead of being programmed the way the vendor
+ * (Windows) driver programs them. That leaves audible hiss/crackle on
+ * both the headphone jack and the internal speakers, independent of
+ * volume, regardless of which pin/DAC routing is used.
+ *
+ * This single coefficient write was captured from the vendor driver's
+ * own init sequence (via a VFIO pass-through of the physical codec to a
+ * Windows VM) and confirmed to eliminate the headphone jack noise.
+ */
+static void alc287_fixup_lenovo_xiaoxin_14gt_hp_noise(struct hda_codec *codec,
+						       const struct hda_fixup *fix, int action)
+{
+	if (action != HDA_FIXUP_ACT_INIT)
+		return;
+
+	alc_write_coef_idx(codec, 0x36, 0x77d7);
+}
+
 static void alc_fixup_yoga_pro7_audio(struct hda_codec *codec,
 				      const struct hda_fixup *fix, int action)
 {
@@ -4320,6 +4342,7 @@ enum {
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
 	ALC287_FIXUP_YOGA9_14IMH9_BASS_SPK_PIN,
+	ALC287_FIXUP_LENOVO_XIAOXIN_14GT_HP_NOISE,
 	ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS,
 	ALC236_FIXUP_DELL_DUAL_CODECS,
 	ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
@@ -6787,6 +6810,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC287_FIXUP_CS35L41_I2C_2,
 	},
+	[ALC287_FIXUP_LENOVO_XIAOXIN_14GT_HP_NOISE] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc287_fixup_lenovo_xiaoxin_14gt_hp_noise,
+		.chained = true,
+		.chain_id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
+	},
 	[ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc295_fixup_dell_inspiron_top_speakers,
@@ -8309,7 +8338,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	HDA_CODEC_QUIRK(0x17aa, 0x3907, "Legion Pro 7i 16IAX10H / Y9000P IAX10", ALC287_FIXUP_LENOVO_LEGION_AW88399),
 	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN_HEADSET),
 	SND_PCI_QUIRK(0x17aa, 0x3911, "Lenovo Yoga Pro 7 14IAH10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
-	SND_PCI_QUIRK(0x17aa, 0x3912, "Lenovo Xiaoxin 14 GT", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x3912, "Lenovo Xiaoxin 14 GT", ALC287_FIXUP_LENOVO_XIAOXIN_14GT_HP_NOISE),
 	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x391f, "Yoga S990-16 pro Quad YC Quad", ALC287_FIXUP_TXNW2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1),
-- 
2.43.0

