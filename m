Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3E33F5BC
	for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 16:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786811602; cv=none; b=N94mJutBQnFnkKiAOGk1piOnTwj9iYyT91kE0JHqXJvs+yDMshZxkC3FTIeAJ2IKOk+giRlxi+izDy0KNAjoGOCosWlKPwQ+9DCvyYNdASAeGZFYrzMJaBe0kIcQGtlB+lqvNO0LwMtBGeBrkfrbgXFetwh8FG+MNBkL/gYkCa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786811602; c=relaxed/simple;
	bh=3lYLAvzE6JYr1INmRYprAgI5KD8UavfJ3cIkN28zFA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dM1I/iJkx1KK3mCNiPzYcGt8gApR3f9lCh3uQk3QHeFfG3zpn652W2KmbwN5GzbeXU1pYj6rv3xq21qAkmu0VSCfAvEaX9ni34tXl1uv9wXA3T1vOZG3tqHpK7cmueEEFP0Lo+BPFGlRqOR8dwKZuXMSlgCPRjKCGIv/5eyCx/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sv3AiV+H; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sv3AiV+H"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ce98cb8165so19415285ad.1
        for <linux-sound@vger.kernel.org>; Sat, 15 Aug 2026 09:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786811600; x=1787416400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tucraPR0f99G0jy0riUMXbGvsFOyRV50tjBAO/oFVXw=;
        b=Sv3AiV+HDLaa1oaOBL9dwLZ+fPzff0OjNfWml5NfFrcTsfLgV9jUJNEaVi+Gv4nLsq
         urqr2llM3FEui4JcHL9UBcPG3aOu8uO5SfhtlQ5iXLigE0oqCk4RPb/6WONvbCeUQ/nA
         GE47UVv4X2fEhZFQ5i9UdyOYp89SXlLpF58HKMwjO5Tur5/c0Qf8hnvoniVNHWdGp5m4
         O2gK/6JH0/FRGFVJ3TbwtV+V0WiXJbgYlPThjrwYe0ORdX5LKfp8GxpiReYHdne7Xbw3
         FV20pae67WdpPzTM0R+sXoM/LJzzPczhpPOdq6YtB7JP49bVyQ40SKWG0IKsm+Rwnf2V
         RQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786811600; x=1787416400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tucraPR0f99G0jy0riUMXbGvsFOyRV50tjBAO/oFVXw=;
        b=YyNwM7PrNKsNKLvWy6imxlvnLErKzmVa86OOdkpoPhL631zihgDWHwVMeA4oHEtLeS
         CAlQGIaI3ktVCYCh6fPOKBiMGxZNQWLJB2XgFYJss7d/xFdXvgTUBkRHy6md9bxBPHGM
         LDHLVE16vz74m1cJ7kz+hP56tGeMCY9mD7H+ruRSLsgPbFK95Pq8/xdJTjfgQ/oJojik
         p8oXeqfiBfhx42/ppkEnfBJ6Ho0e/77T9j4DEjVQpokDlqBXhX3xqxd/P5adU81CcSUe
         EDAA84jqMa87ysCe9KGMvSe04dOVhH4h/OyNae4942i0ovEnplD+DKHWV5XG8apj97p0
         pB5g==
X-Forwarded-Encrypted: i=1; AHgh+RoBYGls7s+y3PNUmmAUFm4hkac1zzoP/K1y49HZXvLw6hu780746nkZ6WqfPnaMlcD7fOPlt4Ahj9juhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY/PlJKvG7DaAMD+iYUgjzFvAVb4I6zEPzfrq9MjQde82qek1o
	gDlcU0ZMvCZL+OpVRKXHdpTAS7jIqoLm1qBVX4PRumHHKC2kKEEMcvIk
X-Gm-Gg: AR+sD10Qj6OZ5SUmj4OvPkz9TeseJRWGnlKHbSBevE2qOx6d7BS38B52aA1Kr+EE03H
	oZmiex4XxIRcEcWY5WH6+D3kKWPTNMHSNs8K6YN38MlRRYZ2r5TVcBcb3TJWvNBIIVP1Rw9o4cD
	HJVgWaMcZOJwvPFbK8oQPVFqbCF//68fM5uhhJywPHhxwtq92Anm3AVGu8EWNxW3uC7IhCgnt2d
	+SDz/fLImXQObbz3jTUH6srcSHIiiSinlINY/XxaglSWy9D+ikWZ5I28rq+AjMSoB/uctBvQcE9
	Po1fMRKpKVRXJxkgsTwLuaU8xMZ8gU8vsHttKMfS5lM78P1RpE7X6x0MCiZ8pKhkYj7uYtkJH6V
	ixN/dh8r7lpzglqNEVSNhX1hZ9SPGQH+DEuiyoyflslSBb9fskj7LLIif3AeP8dAm/0N1SdY64/
	E+lHntxMitddZzrVXrPnfsekC8ECcRvEjvDZwxjiGuwaZA97BhCd1v7TNG5RsSzzPjXY0+
X-Received: by 2002:a17:902:db03:b0:2d3:c3b:c7cc with SMTP id d9443c01a7336-2d37f5d0f8fmr215414565ad.3.1786811600442;
        Sat, 15 Aug 2026 09:33:20 -0700 (PDT)
Received: from localhost ([103.174.141.112])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-320ea8fe4c2sm15843199eec.29.2026.08.15.09.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 09:33:19 -0700 (PDT)
From: Yashraj221B <yashrajghule.221@gmail.com>
To: perex@perex.cz
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org,
	Yashraj221B <yashrajghule.221@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix mute LED for HP Victus 15-fa1xxx (MB 8C3F)
Date: Sat, 15 Aug 2026 22:03:12 +0530
Message-ID: <20260815163312.29030-1-yashrajghule.221@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Victus 15-fa1xxx with motherboard 8C3F is missing the
existing mute LED quirk for ALC245 codecs.

Add the 103c:8c3f subsystem ID to the existing
ALC245_FIXUP_HP_MUTE_LED_COEFBIT quirk.

Tested on HP Victus 15-fa1xxx (MB 8C3F). The mute LED works
as intended.

Signed-off-by: Yashraj221B <yashrajghule.221@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 3f0e276fc606..df0732c5e14d 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7470,6 +7470,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8c17, "HP Spectre x360 2-in-1 Laptop 16-aa0xxx", ALC245_FIXUP_HP_SPECTRE_X360_16_AA0XXX),
 	SND_PCI_QUIRK(0x103c, 0x8c21, "HP Pavilion Plus Laptop 14-ey0XXX", ALC245_FIXUP_HP_X360_MUTE_LEDS),
 	SND_PCI_QUIRK(0x103c, 0x8c2d, "HP Victus 15-fa1xxx (MB 8C2D)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8c3f, "HP Victus 15-fa1xxx (MB 8C3F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c30, "HP Victus 15-fb1xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8c46, "HP EliteBook 830 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8c47, "HP EliteBook 840 G11", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
-- 
2.55.0

