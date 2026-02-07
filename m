Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301972E36F1
	for <linux-sound@vger.kernel.org>; Sat,  7 Feb 2026 21:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770498744; cv=none; b=brtR21prhQTvrpiAmbLDYpKhpLHQvad3WAI3jbaG6FKKANEps6xdXC/GK06VpuLZxY1boKc7zplQNp5yPC8bzarF74gkKEUuXxPpvo9s5x4n0NHn2KlB2EtDdg+Kalm2TUSpxz4cj40+8RClovnRc5z7QqARExNALlAQwf1O/fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770498744; c=relaxed/simple;
	bh=3XlK0DHplaL9XcEwiCf8tz1XDpbhONbxeyIsDqBFAlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R+/a2BstcJRntAOLhtuvu9dygYj7HK50m7Z84+aZ5KhDb2w/MH6DYkW6FV7xBM73/3B1aQOT2faL23taXS/mbvdRDry0wh6tMiVaWQ9L0gS6RaNZPrtbimUeSH2fXd1WEAZgRRdDyiytE2eyulqpytWlIelesAnr/bsezSdPvEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FSYfU/+L; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FSYfU/+L"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so425405066b.2
        for <linux-sound@vger.kernel.org>; Sat, 07 Feb 2026 13:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770498742; x=1771103542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XR86n4YmLqY3fiT2QOaNmFLYhNyN2w2TumKOM3SzKE8=;
        b=FSYfU/+LRQN+GEFbzdHPCrdq8HwjGAqAiTaasmhnukfcwaUAMVgox/qqiVt9GHwpGY
         Axunw07prtVVunFx6HxlwA8BZpw//7lFMjDEpZKc2D0uFhIuvDKJz8J+d/5ai8U9PmOc
         OcB2keKFHHj+Y+CcaXp557EGAT/ZTjm++OLAUfGydKAidrB7GOvrXatT5SI75sJ08ocZ
         WljL3sgNRSn2g+uFaLcFAdezzC6M3tOVGaymxnosYho5zdOsGW+uDxNZycqNLFWeI3b5
         kecIcKkL3uaAQMYczRYHDc45g1YSQKlTnMRl42Gl7KNIDUXtDT1nNZOtIl+B/Kekcs1/
         I0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770498743; x=1771103543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XR86n4YmLqY3fiT2QOaNmFLYhNyN2w2TumKOM3SzKE8=;
        b=uLjaVfhoXKhGbA90IXgAJzapgOlU4Gns2m/IxvUugVSDEEcIu+MhCjoLRDeR/NqB3S
         j+/JDKfH0tdWi5TEbk7+1uM6xumMvTkAwXD9TCYtRI9Vtv979Yml45ddqRyyS5bxt1tY
         AHMpP4RI9jZFWM46oSeeafsu2f0CK4H4QgxKEtB4wW3sS5Uez+wwiNUdvs5kaz/9K3jP
         zMGBOpm4pGbKscOZ1wCSnA9azrbruR/JBEw4jYojjFHA4N6QLo0jea5O/Njog/CLnPnu
         FJ5eQ6zSVXNvJxKOBspuTdHI8k7ba6QHeJwBsaFdleo7BzgaLDKUe9+FPibF219w6Iva
         bjWw==
X-Forwarded-Encrypted: i=1; AJvYcCWZrC9kB+vXMmX5R1ZKTbUAJ0LAuGjAN8sTyXmck7ufbInk8O2gS6np3iiuEH2X544oQQ40nvi+uPP5zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPKMormCzC+qzM8u+z6WmhQo5FgtxleZ6/gwc0/QQgaARoZTsi
	HM2U8X8LfWWp3xiOMNRa0NzVYwlEiIGrcbt13/ZtazqOUNwRInDoiT1n
X-Gm-Gg: AZuq6aKaMNygSOSx514+s7GYdnFKLQ1xW7/bzkihDdFpm7ZjDKKBS8fcVcGlEdhh1Wv
	lYoPSXE9O/ZLY2WPCFSdeF17Jmp/n/NBrIvDJrUPdoeda8fINNtVPGYmjYQRyQvNplozo5BeYPr
	4bInu/MSNGlcF4QishzubyApiB76zZedR4nz42JgUq1DvX3Qry3fenk9M66IrthTlS1RY/QE818
	YwTyK5fxev86xKZFPAH1iXqTOOa5aszrj1H7kYb2wz9gCbHpDYKdDpB+WOBLk3UN1CnpzBf+Ss4
	GlFBumMgmyJVo1Y9lUCbeIyh++Aj3qfq/hDLipEJWmwZ8xlp9Lo+CP4bPP3d99ixqppFiePoJHm
	rffYBCYBqlcOiDRW7Snao2phq4xeJAUcOC7VY8Gd4BYT2rxyI+yLhrp07TVQj7bWlEWEZ8yNPxM
	30JBkoOrjUjBhtIYcBrDpYdWpWtIKrd2F2TGK/
X-Received: by 2002:a17:907:3faa:b0:b87:2780:1b2d with SMTP id a640c23a62f3a-b8edf440351mr409564966b.56.1770498742250;
        Sat, 07 Feb 2026 13:12:22 -0800 (PST)
Received: from Andrzej.rolna3517.home (d176-77.icpnet.pl. [109.173.176.77])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda74a56dsm210679066b.11.2026.02.07.13.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 13:12:21 -0800 (PST)
From: Daniel Kamil Kozar <dkk089@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	linux-sound@vger.kernel.org
Cc: Daniel Kamil Kozar <dkk089@gmail.com>
Subject: [PATCH RFC] Fix speaker/mic mute LEDs on HP OmniBook 7 AI 14-fr0220nw
Date: Sat,  7 Feb 2026 22:12:07 +0100
Message-ID: <20260207211219.769419-1-dkk089@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OmniBook seems to be reusing PCI SSIDs from the HP Agusta, but it uses the
ALC245 codec instead, so the current quirk cannot work on this machine.
Using ALC245_FIXUP_HP_X360_MUTE_LEDS makes the mute LEDs work properly without
any loss of audio functionality.
I'm aware that this patch cannot go in as-is as it possibly breaks the Agusta
, but I wasn't able to work out what kind of extra data can be used to
distinguish these two machines.
Please let me know if you need any extra information.
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b66965a52107..84ea1ae7b36b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6821,7 +6821,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e36, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e37, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e3a, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP OmniBook 7 AI 14-fr0220nw", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.53.0

