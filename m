Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F8530F958
	for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 16:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758213623; cv=none; b=aZAIeUi2O7F83JB5XbSzbieW1tdzy65aHO6sUbzuqjZP6jWB9naxq3KOY74ha3Ndj50Rhr3bbWKsMFJ90YhPRBmcoxVdy8sh/y9gHxn9606sKIuODWxQ2U3MF73pDHaEwRff0FD4pgYlxgE5/TDpmfXmVEC3ZSvdhnH8GX4st9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758213623; c=relaxed/simple;
	bh=8qXux/Vc1dzPkgcLfFCrymBfcnJ2c1a7n4ElLdzyceA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d3oaOjj/n3mEYCXraL6d3VraNdBApa9RDylPUuHMtq2Iz/YoHlmGIIx0tf3qOfnSGifeijm9SuWv/F2UjqPmfw4NhiO6a5F99kbt9RAiVzchrTh/hzEj+VaOuTMOWrEe5wLWCggq0dYCOdeekDvaLYo4xjMVu6PM13CERgR6hBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKzEHZ9f; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKzEHZ9f"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-80b7a6b2b47so121419585a.0
        for <linux-sound@vger.kernel.org>; Thu, 18 Sep 2025 09:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758213620; x=1758818420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOLygcP+xzbpP7kZE0AKFOWZV0EFCw3JTpU16h/cZRg=;
        b=lKzEHZ9fiYGdgIIgOEqQp23Kp2N26u/U6j1Ra2jCvR8d3UngNgMHq0gUgj31geHzSR
         /nBHaaeOf3EowjsWFlEyCShjtc+Yski/Egb09UVbn/xhYICjdVaIJIp+yuVzt+riX8V6
         Y+/5CHn0snVbqQ6UBbGTzKAGrxZBq/1s+V0g3iBW2YXE3TUJgyvZQLE6kLB3kfVhrMdB
         d+1K4u6ySi2DyCeO7mL7bCa8xjYubvaT0sEt6E1vu7C5ZoE8u1ouhSAVJUen+lxx7Adg
         gQkv7qSExrAlFoM8OeTPUM/FGkWoVewqLF8cjfTbyxdL8AZh8gqOVRUdoTdp/D4DTiXz
         vncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758213620; x=1758818420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOLygcP+xzbpP7kZE0AKFOWZV0EFCw3JTpU16h/cZRg=;
        b=I0dW51xujP2zVpbaJlw4+v4blSi3RrC/M/961/Cuhq2WgRqIlNsln2zm1oew5cEQNn
         vSPetnXmgrH+1G9ShUfKBikYNjkWsMHru/e7rzDx2HGMxrk2wQhXbuNz3yDzRM/CmCdS
         VfTO+n94/MvjrtHWAwr8qT2+2hIxZOiE+oB6aCigQFRFHgo2IQqo4QXPQk1l5Dr/1EJR
         6Nefh0iuOaw4Bqm8CME0ftz2Gu8EiQOd7kirTtQag0uxYDkk3Yg/RKQhmz6yLKi6xh8Z
         iQl0fq9SnQCxdU2A5VHRI7pD68pjhzf6/veSV1NUHThuV+8BkTX+ZLFEowvFkuV625g1
         cK5A==
X-Forwarded-Encrypted: i=1; AJvYcCXbDu0NV2/Doa+QWSloCbORhJFPNqn/AnBgrUJ/L2U46iqh/9asmRRC6diVx1/wFMgh2vo54gpVAs74iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNb3TWy187XtCJiAtD7lj55txN4k7LGgTST1e/F5HXicKiLj2n
	5jsgyDdDdyhXYJx7yc4CiN4p7V3JZ+jWCVGybxGZDzTwhq22XnwBcep9
X-Gm-Gg: ASbGncule9JYQx3pXa2az22th7v33AH+f2JVqXAFAAEqU2QebBC4wRFx4AY/TrqkzEk
	VeBste+uB0Vr7hcjiwei2kb9B9HvnHt5xQPDuPq4GeSUgy+zaHZNTbrrCVwskSJWrPu0rBQ5/iY
	9qmzokrO8hapobQRDF8W2/dFhf/hra8iIe1rs5P0HsSQSDkCuCHNrYn8i7O04vmoU3NYgqzT9lg
	zKhp7YuMlNeH8MOiJRtQ2I4OymWkVtudOWgqqfSpYo2lT5nbu2Yrlb0EzLmlZY8E5AnKRwuzLxU
	jn7O84g/XJXVYYQCoL6yNxHrfU16yRmedrk3VEmlgxK12BWikljObNdk6sxd5ZNhvwkpmCUDLQy
	AmM/sxjFI/KLR/6VPEUHLtSrEMDG65BLZ9Gb2MrZBrxXHwGZryWnQvJ8IIXjZG48WOg==
X-Google-Smtp-Source: AGHT+IGhjrWbjFjKXricb0N1Q63somwo2IYSb4i+ebrBpab9emSuZ+a4s3k78yG1lZ0DEe7YjEtAag==
X-Received: by 2002:a05:620a:11a7:b0:813:8842:93c3 with SMTP id af79cd13be357-83bad40024fmr21056185a.81.1758213620307;
        Thu, 18 Sep 2025 09:40:20 -0700 (PDT)
Received: from lufimio-laptop.mynetworksettings.com ([2a09:bac5:89e4:1678::23d:12])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-83634a4f965sm180540385a.71.2025.09.18.09.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 09:40:19 -0700 (PDT)
From: praful.adiga@gmail.com
To: perex@perex.cz,
	tiwai@suse.com
Cc: kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	chris.chiu@canonical.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Praful Adiga <praful.adiga@gmail.com>
Subject: [PATCH 1/1] ALSA: hda/realtek: Fix mute led for HP Laptop 15-dw4xx
Date: Thu, 18 Sep 2025 12:40:18 -0400
Message-ID: <20250918164018.69040-1-praful.adiga@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Praful Adiga <praful.adiga@gmail.com>

This laptop uses the ALC236 codec with COEF 0x7 and idx 1 to
control the mute LED. Enable the existing quirk for this device.

Signed-off-by: Praful Adiga <praful.adiga@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 85bb8c4d3b17..7d8c60f1a751 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6469,6 +6469,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8992, "HP EliteBook 845 G9", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8994, "HP EliteBook 855 G9", ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8995, "HP EliteBook 855 G9", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x89a0, "HP Laptop 15-dw4xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x89a4, "HP ProBook 440 G9", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89a6, "HP ProBook 450 G9", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89aa, "HP EliteBook 630 G9", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.51.0

