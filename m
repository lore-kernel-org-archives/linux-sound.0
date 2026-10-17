Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008EC3148D8
	for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 00:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792198252; cv=none; b=C3amUmWoq3SY0BvhIitqJrYhu9yIa0vnmrD3nP2B9H+/CLKS+qHlPCcGtqkNn4wSgzSq/Pvvsm2mLtxUT24zG6c+gpn2/VBeBvBZK2JhvAHVLtb8OrGFi/jiNS+RbXnNdlzxSz/Ei5MzrpQ4Zuuqlty91vEP93kFXD+GijQ913k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792198252; c=relaxed/simple;
	bh=5V8rinvEffdQKrE933/i9Jyx4668IhiI+lCFsqIuIZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eozbPe27Vtws5tNQ7Bbp5wVjaNOyJ/6kmIzW41eb89tsvyET/Nsxd1vMZFnijhgGlPAUIrtElS3e9QkQXqm3B34Q0VpJCHkwkXsEyQZLt6OQ2ZQbbN1L2q0IlARMqydk/XFYOinmxA6mlnzO1TsWD8i7SKoaRKUgdKv5cBVW7MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gehfVjRO; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gehfVjRO"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4af173320f9so318001b6e.2
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 17:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792198250; x=1792803050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+hJXj8wwiIb+5no1EG7QW0zHdqHn0SmMCU0JKT/7aQ=;
        b=gehfVjROL79+MsFFUIGuyrVCyf4r0h1E9bbuMkuV84/ZaS1BwEL0bfHMAmD9NL2VdT
         GVGgeVmy9nHjrYYdRxGcf4k8xAGFVGvr4GjaYYzjxLy2XwC73Rnx61QunLMUUpIAA5V2
         1feC4FsXQzc2xYeMFys3cNsMjtuoERILxL2I5uyETcQESlwmDz3XGLa6E5bjpBOjQ7I4
         CbxyDQfqOupAGlslzuAc81M7BtqsixdKmFME0zcKvWNvdddxElXC5NPB1PGgsm5IBU6M
         S+YBXEkWhPnboNMtZSTzrg4jXGn0WJ0oZlyoWD5SpiY6OzCrhHwMXslGPOaJjeAnLZwl
         nNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792198250; x=1792803050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+hJXj8wwiIb+5no1EG7QW0zHdqHn0SmMCU0JKT/7aQ=;
        b=pG2lI19e2aKOSfYWng1aXoGUuz5QK7f/DluOqjgDCkUPhM0m9ohgAPjjMYvrK/tWjL
         yd3v+WgvIUXKErtYBe8wGUnkiJiNCQHyziqqgyDaJRJJU/WXR3Byi3fpH1DBch/ZCYxr
         1qtuTpshvhOBQ0z7anoBUYNkkXxbOm0wC11ndax6NRnHEYANG9Skg+JrpHXsxNsMAIUU
         hYmAvaHv45KgN/qK9NLUqJFoxtkQM3fc9b/IW7fdrnRjsPyF9+pCm9BzRDjHqoNyIVg3
         BUz+NHRBX3Kv+axU4R6wlD2g03vHQQkh1RP2m0Coa6PTVqVmHprcLxjyjHaZfnGm2F11
         YOew==
X-Forwarded-Encrypted: i=1; AKwUvBzUEcVFvjUBcUTOZqxxWsw2N1cBhyCkQM+JdEpB8r8W6zmLOboNS+YXnfly5W/7REfzv3THo3W301Ot4g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKoeuVVK4ZKs4CQo5D8l1iDPXE5ZpfkFrer8OtIVlWFq58+43Sv
	QQCI/GQaEkKTWs85VETtpyLnNPaHGF5Sq9i+mrWwC1B2fIuaD9ZhRpXzw1pQhDLwRhI=
X-Gm-Gg: AYBFou2HXCA7wcFYbkrljorJlDpXuk7wR1wpPcgKnT9xY5Gc7lBIHn6hgOrTlrqAXwB
	DRxO642vHc7z/GYvBGeC/c/UHFcB98lep0YWPQKE65l6hb2u8zTDu4Ks/MKwRMu7dg8/Oj7I9bv
	N5X8VyIJFiJ8w/YOAv4Rr40iutdKwhiYA+SoIILZSvbf/fE4CBXdtcCtgYtBPFzLcFXloiZXBBu
	KPoZ0YH3+OYSzG/tK580GBbiyC3JjcuIOQ58mcZvV0R2GiFhz6FayzsE1arPskDIAug8WDv+9GA
	4UNpIqLougddOGpMPqqf699TQBiRqdU1lEARqO6j0hTU4U7MqmULg4CSyGuR98x0MVmpOsLTaRe
	2GFVDmMKdQZVqrWiqzWojuGCnB0OzYcHOx50o6gItmmq8yVrT+mO/+BXXFkJst3dNufzDeROAPY
	WxsDwMVj+UtyQMIgo+UCclAbIX8lq2+agb4Miz5HzU+l10h3iG7qWgFZjBecPzlDI=
X-Received: by 2002:a05:6808:1245:b0:537:3bdb:2d7b with SMTP id 5614622812f47-53cd247bf4fmr1239261b6e.11.1792198249790;
        Fri, 16 Oct 2026 17:50:49 -0700 (PDT)
Received: from fedora ([2806:266:482:9274:1367:9be1:68ed:86d5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b63cff2sm2843941fac.7.2026.10.16.17.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 17:50:49 -0700 (PDT)
From: Luis Gerardo Lopez Hernandez <gamaerry@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Gerardo Lopez Hernandez <gamaerry@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Fix internal speakers on Acer Aspire AL16-31P
Date: Fri, 16 Oct 2026 18:50:39 -0600
Message-ID: <20261017005039.9139-1-gamaerry@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Aspire AL16-31P (Intel Alder Lake-N, Realtek ALC269VC,
PCI/codec SSID 2782:1718) has its internal speakers wired to pin 0x1b,
but the BIOS marks that pin as not connected (0x411111f0) and only
exposes pin 0x14 as the speaker. As a result the internal speakers are
silent while headphones, HDMI and Bluetooth work.

This is the same layout as the Infinix Y4 Max and MEDION E15433, which
share the 0x2782 subsystem vendor. Reuse their fixup, which configures
pin 0x1b as an internal speaker and limits the internal mic boost.

Tested by booting with snd-hda-intel model=2782:1705: the fixup is
picked, pin 0x1b is used as a speaker output, the internal speakers
work, and they are muted when headphones are plugged in.

Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Luis Gerardo Lopez Hernandez <gamaerry@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 36d3bc23a..2a0d25493 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8671,6 +8671,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x1701, "Infinix Y4 Max", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1705, "MEDION E15433", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x1707, "Vaio VJFE-ADL", ALC298_FIXUP_SPK_VOLUME),
+	SND_PCI_QUIRK(0x2782, 0x1718, "Acer Aspire AL16-31P", ALC269VC_FIXUP_INFINIX_Y4_MAX),
 	SND_PCI_QUIRK(0x2782, 0x4900, "MEDION E15443", ALC233_FIXUP_MEDION_MTL_SPK),
 	SND_PCI_QUIRK(0x2782, 0xa128, "Positivo N15RPE-S", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0xa212, "Lunnen Ground 14", ALC269VC_FIXUP_LUNNEN_GROUND_14),
-- 
2.56.0

