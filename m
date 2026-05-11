Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAC01B7910
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 03:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778471807; cv=pass; b=EGg2ZaTI7J3k8vDxKxoAZh+oDF4o9TiyMVv2Afg+xedQ96qguM/AFUZYG2qugw+GA1B9Just3FRrebFoXzKj10qRz5PBaKSsShdD+4RwAzH8f9A4nwqPtEg9nlZlzQL/Rb5efwp+mzTWgzMscBRUY1WX419O4T1iIIc/0F8V6zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778471807; c=relaxed/simple;
	bh=DWa3RJXdWc9Atm6EDVPY72eN/QjOT3zL1UoLi5Yy5L8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=fFKMRUb/YFXiT6SCpEInTQVqgsm8nArjwBxjmqrYO/F1BK1lwW2IsqeEaLpEsrjcqiquxMyMGHr1q11KmUkWqdFq62hScjMDYGzAbBuSo+4nzaBTKFh7KPfUO7S9GGa9tVpi4mAMxeIeDwEuVCTgJ4LbgexcWjJ9khjTIwAFHSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fpj2fNSq; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fpj2fNSq"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7de46b8e432so3717211a34.1
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 20:56:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778471805; cv=none;
        d=google.com; s=arc-20240605;
        b=dFAcB3apP6rg7QsG/uH85TaxhjSNPTf+xnnjPcyNLVEKwwgIbdaI1Dprig9hCDrpGv
         hkFTZu3pTNBISRu8ihr+WjsqgpeaS+qclwT/Yzu/W2lksItiw7hKlTeuvAvNbi6Vpehm
         GIurdOGodm14qCv4oaESV4gGL7Qb3TXAKLWVYpIoJkaI419PGUb8y/mDNsYOstJwD5MB
         wZZ88iPqDiBmnVX9H8Z56qXyLDWKFqnFdidOVq0ypAst0UpLFPw7rmN9Qrcm7Gz2wxJ/
         bmAGlusq7Il/4XW9TKTHztTeJuKFo6NbwzCGhCSv2SdfJcF6zLzoUBGIYQyY2ELtUlT4
         EbJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/cWL1LsbjH+Ya5TeZhjyeEkCoO7Z8HNTJv+hTIAYITA=;
        fh=wFxegsZFqs4yr7YJ47c/wRe02GgCW4lrmzNI8hVFYPI=;
        b=avRNW/n/jji5kgcbone0N9h7VckRN1v3D/VfYIGLHfe60dHGslLfRURW31nW4yPAYI
         aeFmptchvGJq4sNP0FnSluBXjJC7lbEGLI/3AmQbXlDasSelj9InzUAaGrxMK9WLax4D
         lwA8qz2DyrmCAJQSehn4SUxN1MTBgXvpYfan+0t58INKRijcplWbYA7pShIXYhkcZJ9C
         xTdW5OFQPUY4bHaF3NmKKYrzo4s2RPpGSclhVlxW/HWD+7uURyWvYetHeQVpGepifeI2
         +A3IxazK8L/HNp+0omTnjIw0nHGwQ3LMPINaMtgX/9qBFj6EKtr9EEK2c7LsQtHSV5X4
         SZWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778471805; x=1779076605; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/cWL1LsbjH+Ya5TeZhjyeEkCoO7Z8HNTJv+hTIAYITA=;
        b=Fpj2fNSqZ+WK2eKrTCttjuVlroNLshKr4SJn5bMbQrCE4rUFhZYxpFnMZe4tGxdDfi
         f9WtP3G8HddekSCvwjvRR8hHhwcTXJI2OhBexVLN3+GkyQTMKpG6sUzxaQ8eSpxO1b2T
         oH9/L6Srm1isCiFrRDy3N6gVjHg8ZLTl6nJt2KfOPt11H/Falizv4zakXtPGkDZsipdM
         6hgeYdjx48GROMqOA8lVIgvRObRLwNM01EnVcNyXoEgwCKp4kyAexrmzGoIR/1ZbAM5S
         WrWLCdHs/BeY07kytz+w3Ybv96REQq0n5UP6ny3LIdZNvFg+vE8SasIBl9syVbZbtt4b
         rGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778471805; x=1779076605;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/cWL1LsbjH+Ya5TeZhjyeEkCoO7Z8HNTJv+hTIAYITA=;
        b=LAWLBli3oJ+DouFe/f1z2d0C1RIHUsEztx12QWWR2/S1yDNWDiN/kKhgavAFbKIL0D
         /g/vwUVUl1XEWRhMFH3dsn/5bgLXWhu/Pq1O5P0lMvmZCDnIp3oU5rtkUyJ5a62pgESH
         LbB29eajTF2SB8s+T+xgFGZDokvPsggCouIFGMNm2ZiUr0bOnHEGjV23JMcABHBZc06c
         i2uLuiXxLlZfcc6vW9OBR09qEkFxnth6CGUfx/sSzgAXCAHOJA01ukraOYKHyCC80H2W
         dIQXHgUlYAMtIyOJvLvbDJ75r7W06Jzi3zlz4VMaOCa9KOP6a4BcQIQWT3tpOVUnR9QQ
         a84g==
X-Gm-Message-State: AOJu0Yz14nyBWssLOyuucmZ0AVwsu+Ya0EqOMrDNBVS6kbaZMclNqEVQ
	Sew1ArtwJVbz/SmtlQ9ag9YwmjEGZfNRyvMbNANlrp/ydkjsIXilj7rBcTlsXb0s3pTxsw19/Rt
	zKjqqNEsOLzkHY8nQqYQ3uFRVic/zue3KCvHg
X-Gm-Gg: Acq92OG6PAuXsGwup8kR8+W5oRttdw+JADzuiOOMSLgy3V+3DG6lqejXgbJRadF4qqg
	Z8N7IHKvZh9jilQeBjwGYWhwVI/rmWJx8YiOkSjn+YjYNF8n+wKw/aE9UbnO5KBH1/QDCtcKAf0
	AwAXZUD0+kGVdkShl7tv/jfIyxEMzhDCeJo+FJfWnb5quY2WLSyBwBHia76xkg8SqvGD1+KwSNs
	ElkTFLM5lHiDATsWsNoTaxdzijm1jkb4VuDYJ+PxuctjirTtxiCkAxup57/lPA9Aeb5smyGBlRV
	IeJW856lzULQKqDl6hdXBzXt6vcZ3uq94YH3
X-Received: by 2002:a05:6820:16a6:b0:696:7780:477a with SMTP id
 006d021491bc7-69998d22e20mr12301759eaf.46.1778471805439; Sun, 10 May 2026
 20:56:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: SirDoctorGentleman <amagicalfishy@gmail.com>
Date: Sun, 10 May 2026 23:56:34 -0400
X-Gm-Features: AVHnY4I0En4PYky4Bi9tee9WPEyuCJmkcfDAlzqZKvV9DLS_ZgE4HJNsScJvvJw
Message-ID: <CANXUdNb=dWnECdFe6dQWdqcOKjzHEZO2BizPv5QCX3c0SnCpUg@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add codec SSID quirk for Lenovo Legion 7 16ITHg6
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

PCI SSID 17aa:3811 is shared by the Legion S7 15IMH05 and the Legion 7
16ITHg6 (codec SSID 17aa:3855). The existing PCI quirk applies the S7
15IMH05 fixup to both, so the 16ITHg6's CS35L41 i2c amps never bind
and internal speakers stay silent.

Add an HDA_CODEC_QUIRK matching the codec SSID, routing the 16ITHg6 to
ALC287_FIXUP_LEGION_16ITHG6. Mirrors the existing Yoga Pro 9 16IMH9
entry on the same shared PCI SSID.

Signed-off-by: javi <amagicalfishy@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7675,10 +7675,11 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
      SND_PCI_QUIRK(0x17aa, 0x3801, "Lenovo Yoga9 14IAP7",
ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
      HDA_CODEC_QUIRK(0x17aa, 0x3802, "DuetITL 2021",
ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
      SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga Pro 9 14IRP8",
ALC287_FIXUP_TAS2781_I2C),
-     /* Yoga Pro 9 16IMH9 shares PCI SSID 17aa:3811 with Legion S7 15IMH05;
-      * use codec SSID to distinguish them
+     /* Yoga Pro 9 16IMH9 and Legion 7 16ITHg6 share PCI SSID 17aa:3811
+      * with Legion S7 15IMH05; use codec SSID to distinguish them
       */
      HDA_CODEC_QUIRK(0x17aa, 0x38d6, "Lenovo Yoga Pro 9 16IMH9",
ALC287_FIXUP_TAS2781_I2C),
+     HDA_CODEC_QUIRK(0x17aa, 0x3855, "Legion 7 16ITHg6",
ALC287_FIXUP_LEGION_16ITHG6),
      SND_PCI_QUIRK(0x17aa, 0x3811, "Legion S7 15IMH05",
ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
      SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05",
ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS),
      SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940 / Yoga Duet 7",
ALC298_FIXUP_LENOVO_C940_DUET7),
