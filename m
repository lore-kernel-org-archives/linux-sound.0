Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA3A946C
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 00:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768176423; cv=none; b=mKVMycFnprmIRdqUEOWv0egGCty7IWhL2mXoWbMTORTGx9ePEaYK2HpdzBJO8wFnH4JRupD21QrnNqpkPUqhnOolrkDpxoaPzsXhT86yNx9/Nc/nxBYH6oG1vW3XUu7eb5Tyx7KDBIAcS8qy2Qnl7QIcr8n/ACxZqYkEHr6B4bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768176423; c=relaxed/simple;
	bh=nEbu02rGcieGd7SL591dhL4TUhMm6PUoFBDrEsPWVGY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pMsWoOpR1/2u+DQNtpGPoLHmRzcN0qjfsBSojBwEfL3pAIwFMHBXEPqEqO5iUYwysLfq4aSS827z+f7PUNf27zhl/btktblpGsWE2gDKt0LZWgCYKyS5Qx87c2apyfwAJ0j1raPsxHJV2rX939+G1+YyYliUTvOnW7SBHHJQ9Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=KMHxKuSf; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="KMHxKuSf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1768176411; x=1768435611;
	bh=BLb5konC06hAl0DCz872KkcPrxiy16ODuN9xDkr7EHQ=;
	h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=KMHxKuSfuqYUEutkuN1iVORGlhWyIqlDrjA6Yh6tmtFmuDDW2jYTFjWebw84RvWdO
	 1ReVVop1jTcMYj63taoDnDPgd3Wr27qdCuczIqkEIyb9X64orId4FlRF7+jdaZdvBS
	 l/aNIzw51RpBgOsXOM/KN5w8b3J5Fqzb/OozOTd7o8UXHwQzgv26ef3i3QxcT5kdGg
	 seVoU6uygLbsA/MwKqMvXhAhJflSuvlCRWbpjvFG4Wkf/7WI7+fqER7hqfDoHb0vPM
	 O5E6RW5cIloj1nvNJAl1YWmKURHRbNB24S2JiRJYVFrI29fGlP1Wm0At6heUIUPCOw
	 ewEwSpntrdDfg==
X-Pm-Submission-Id: 4dqCNV2G9nz2SjQT
gpg: WARNING: unsafe permissions on homedir '/home/alex/.gnupg'
gpg: Signature made Mo 12 Jan 2026 01:04:28 CET
gpg: using EDDSA key 8BFCF5668AA29DAD00D728F6EDAE71A20F500310
gpg: Good signature from "Aleksandrs Vinarskis <alex@vinarskis.com>"
 [ultimate]
gpg: aka "Aleksandrs Vinarskis <alex.vinarskis@gmail.com>" [ultimate]
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Mon, 12 Jan 2026 01:06:37 +0100
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Asus Zephyrus G14 2025
 using CS35L56, fix speakers
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-asus-rog-audio-v1-1-513957b4704e@vinarskis.com>
X-B4-Tracking: v=1; b=H4sIAAw7ZGkC/x3MPQqAMAxA4auUzAaa+jN4FXGoNmoWKw0VQXp3i
 +M3vPeCchJWGM0LiW9RiWcFNQbWw587o4RqcNYNlsih16yY4o4+B4nYhXZdiLqNuYcaXYk3ef7
 hNJfyAfkL5NJgAAAA
X-Change-ID: 20260112-asus-rog-audio-4d3cb114fee5
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=nEbu02rGcieGd7SL591dhL4TUhMm6PUoFBDrEsPWVGY=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDJkp1pKfjJLeMnmHLYl1SHW/pPQpxyGmUufTJPGfUlMZf
 huvyojrKGVhEONikBVTZOn+8zWta9HctQzXNb7BzGFlAhnCwMUpABO5dZGR4YbAm+MNL/kKz/zk
 6Wb+8fm5nqmc0fxDG7YeVPSMvzanNIjhf1jSLZXFYv7sFguXrdydm+T1/MTrUsvc0t5ncb90dWe
 v5QUA
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

Just like GA403U, this GA403W needs to remap woofers to DAC1. Similarly to
other Asus devices, headphones/headset MIC is not working, however the pin
config alone is not enough to fix it.

From Windows dump of GA403W:
  0x12, 0x90a60140 # Correctly set by codec out of the box
  0x13, 0x90a60550
  0x14, 0x90170510
  0x17, 0x90170120 # Correctly set by codec out of the box
  0x19, 0x03a11050 # Set by ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC
  0x1a, 0x411115F0
  0x1b, 0x03a11c30 # Set by ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC
  0x1d, 0x40663A45 # Correctly set by codec out of the box
  0x21, 0x03211430

Even with all the values set, MIC of the jack is not detected. Until a
complete solution is found, set ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC
for GA403W which fixes audio volume control for woofers. No need to
create new quirk with missing pin config just yet, since its not
making the situation better.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
As per commit description, enable quirk to fix woofers.
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index e63a555eda6538027b0141c90c1c8de445e359bc..8c1ec2f6da41cd716dc5c45f4a0f6724099686d7 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6869,6 +6869,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8f42, "HP ZBook 8 G2a 14W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8f57, "HP Trekker G7JC", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8f62, "HP ZBook 8 G2a 16W", ALC245_FIXUP_HP_TAS2781_I2C_MUTE_LED),
+	SND_PCI_QUIRK(0x1043, 0x1024, "ASUS Zephyrus G14 2025", ALC285_FIXUP_ASUS_GA403U_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1032, "ASUS VivoBook X513EA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1034, "ASUS GU605C", ALC285_FIXUP_ASUS_GU605_SPI_SPEAKER2_TO_DAC1),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),

---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260112-asus-rog-audio-4d3cb114fee5

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>

