Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F8B1E5018
	for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 21:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785015718; cv=none; b=qqu6WZIhtT7OgjxdnUSnV/7vzRqHagQY7sK6xoSuWDhMNk21D7pINZDQBXMX5FmqP/IlW1bBgK9RyRHUoaXrX0fYE8Mvl9k/qMzt8yrGEWSPaJTx+xrEPep2HtqzT5aDxAWTyFDoiy6j7Eg/DHVgpatUwuPzbYVa9FOJIbHSj90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785015718; c=relaxed/simple;
	bh=fr21CWuVE2v1jAz/j0IooOlEFfAJfH4Fvhn7nnBw3ys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PUl8BJBhBW8lcvbNKJ4gdh+HBjdVJCNuKR1xRnuRrnPEVODD+xnlLpAP0nvg1sYtZwsccQeOtjigptBxxCiQNcbXtnoxouRyWBXfZuGQFI9e3Qifgk8/QrExUC5+h18Xc6RRynCs6XFPBL/kjZ5uvCGLFzsqROE30cMDLnL+tn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKPeg445; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKPeg445"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cad85b7b5aso2184265ad.1
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 14:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785015717; x=1785620517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cHiJnX2J2VSkrsEQikSRQbUcMT3UqVzJFXhvsSFINN4=;
        b=JKPeg4451+t73xPtLqz3HT5D3w4snVmlGDvt+be78z0B7JEv3kOtBAYNCfHC0eJlrM
         tjsdZgJ/YINWtwKmB5UdjBB6m9c8hhKHEfkhRylXX+gpkho3v5RGG3wBhWy1ftPvifQ2
         u8AdPy2eqSzm7PmwqOYvqFx7vKUJKR4TQBwAGM2y/2mljgEKrIjpAvWdntAQ6S/5Ppxu
         P2pRoWVsoh0bwmwkIGPiWk8+NcynihnezibhXSgpMgwJesszxqjRQb3uEF1rKkgzsdk3
         AkfHsUUbjEjf/JKW80vMfrKnpNhTrDtMV0a1ANLVX+3tYgrR5vt5xfzCGt9FlyATqGt6
         mISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785015717; x=1785620517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cHiJnX2J2VSkrsEQikSRQbUcMT3UqVzJFXhvsSFINN4=;
        b=TNU0uJbOBOwHVuknXfJi/0Vb7qfJRxuraRC9cShdB4cnr1L9eKtnrb82XJ+/YfjScH
         9Ugha/0lhf3fkD3ipGIVMLe6xcF5zWfFf+GOY8nFQHXB1AkwS3UJP00RsCVLVPcwayha
         Ggq8qRoRkjs7CMfcXkk/4saqtzAeGm/Smp8QY1LTGd9xqqQd9H+eE1K17YgAaiS/gkIO
         H2Qzw8xpFop9IYiUs2aOQUdnbFn7xgUp3abRVxyw6EhtIBszY0CkAi9oOLBiLH1tffc7
         H6lXNY8UCKoHXBOGmbK2FUty5DR6uapEx1dq4fpa9yQdo+TeMpTFrZK4r8YqtDf75esw
         HE0g==
X-Gm-Message-State: AOJu0Yw1k9Z0woAjHbScd5DXumf6gzUdFnT0e0cWMz2RfvUVKa4MbJ1b
	304U5L4nqYdY0DdHkPkoseEVi0HNOkokNw7ioLwnlHFMtOlBf5c4ZhgK
X-Gm-Gg: AR+sD12WFWkxf25uIFyRRS3vi8FSHv+AbdGNw/zzRteHEauuh/PiocYfaE6f/gPDKrN
	B3oSLFGRakUsR8yOyaqRY3ZOIHxQ8din4QnIemxNGv1bj+/kZSpVxdIsM/BHwqc/3J4sn6+ThsX
	y6QuBLSgUvRRir9SZTIH7YkEFGtCdyrIHz5jTOlPjl9RAGKxc6wAdACTyI/KIMCsLu085tjKWaS
	VybXzMVhmqupTOg9UIRrtumfWWk4SWvj8OyvWIXse6DTc/1cbrVSvZ72kevY/5R0rFWw5OpGkAb
	q2+IOpJI9l/gI3jr156iORdk2+CKdzLik2d80AqqDWgDAi5a+fTo3B8zOPTTW26sNRoxk5NGnR/
	KQ9I0LfJyqrGNS7hiC9mq6WR17bbsvhAlNWmFrV8hN1evc/JJ72t6eznopMZLgkC7Rj5RsmV3u1
	ITkOyuefsDhnQ=
X-Received: by 2002:a17:903:1aae:b0:2cc:e7f3:d39e with SMTP id d9443c01a7336-2cfde683892mr42865435ad.2.1785015716870;
        Sat, 25 Jul 2026 14:41:56 -0700 (PDT)
Received: from marcos-linux ([2804:3d04:a1ae:f400:ecc:47ff:fee4:ed75])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1255sm22614243eec.4.2026.07.25.14.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 14:41:56 -0700 (PDT)
From: Marcos Paulo Medeiros <maarcospm1996@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	Marcos Paulo Medeiros <maarcospm1996@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix headset mic on Acer Nitro 5 AN515-46
Date: Sat, 25 Jul 2026 18:41:31 -0300
Message-ID: <20260725214131.25872-1-maarcospm1996@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Nitro 5 AN515-46 (SSID 1025:159e, Realtek ALC287) has a combo
headset jack whose microphone does not work out of the box: the BIOS
leaves pin 0x19 unconfigured, so no headset mic is created.

Apply ALC2XX_FIXUP_HEADSET_MIC, the same fixup already used by the
sibling models AN515-57 (1025:1539) and AN517-55 (1025:1597), which
makes the headset microphone work correctly.

Tested on an Acer Nitro 5 AN515-46 by overriding the model via a patch
firmware with model=alc2xx-fixup-headset-mic.

Signed-off-by: Marcos Paulo Medeiros <maarcospm1996@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index b22564f92..7e735ff8b 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6862,6 +6862,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1539, "Acer Nitro 5 AN515-57", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58", ALC287_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1597, "Acer Nitro 5 AN517-55", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x159e, "Acer Nitro 5 AN515-46", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x160e, "Acer PT316-51S", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x161f, "Acer S40-54", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1640, "Acer Aspire A315-44P", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
-- 
2.53.0

