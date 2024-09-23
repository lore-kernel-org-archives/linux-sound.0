Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3842629F
	for <linux-sound@vger.kernel.org>; Mon, 23 Sep 2024 17:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727110900; cv=none; b=j23ZgLcNebY1up6nzrzuJzfmmslgpX26Wl32aown+63VB349eGNkP4iBq7LFGoJY4fJKRPyGnj5Os/6ht9kqVNySbYVWXE7lAzdXukDTAe9iZa9T6HMWnB2h29PKgMntZdM1badRrFbL9YD7noXAzfkCSMe4aGz/PeRJ9LcwF3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727110900; c=relaxed/simple;
	bh=uBoLJz+r2IDUToRH8LF4Bq78Fj30+YGZjGGSeA8JaXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dy2wSr8/Wf1EOsI5EbvoVvldFQuM54DuM3Gux8At0Yq3WohggNEEQdbYAYdEsaeirsRFIbsWsIlBYlZREzuArK5ipA1VQ7/3IDAioXAkYMZwgClmh8Hyk7MK44wR4JGmSBmooUEfT5sHnUMEIRqcK7itCOHyCEQTubJKyxO8QGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1/Xaud+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1/Xaud+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cb1758e41so36727745e9.1
        for <linux-sound@vger.kernel.org>; Mon, 23 Sep 2024 10:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727110897; x=1727715697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sV5XLAaFMxc4rcoZnvxVkwUoUPP74KqyTzkTBy9R7no=;
        b=c1/Xaud+huoTHZvg1+hKCKy9yWREBaLrQY07PaTZzd+aiXiufePSmEHTBlJf1AECrN
         yZ8R31wBcHzIKies64gIlet33q7yrR9WM8WnAZRbJhElRO9+JM+q+8tH6+X1F+BaJn08
         Kh0L9WjD+Bnp06SrQ3tXrSGBsnu+M/4xpRShDS7n4gBdLVgDVJ/6I0TlfYFIv2zVUMQR
         o49CJWADKoI/WqwRdhB3EBYS5cS/4qcjGRjlMIozwnpFulCvBTAPbkP4JnZNGXtpWUzx
         fwGjW2LKK5jt/VhpCYooW3pIOhTg2Xhq7dO5seBUMdsxXnCOn7sliXFWS0DOPM1ZXtJQ
         SKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727110897; x=1727715697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sV5XLAaFMxc4rcoZnvxVkwUoUPP74KqyTzkTBy9R7no=;
        b=c2T19oKvG9CITpi+7GDRCGRJzMazdJC1HMkXbQde3+v6ePxCMiTpMe6MUVcGUcrq7E
         +MeX05OcZP2qxPeLT+e4mh0AUTHDx9FAXcF95Q/QOmsO/o7vN+3y7/GsgGbgBTyGXqoq
         WMudDN3VWDyoQVZhBiAtGrGu4jr86FaaKQd4q3XbwaSqWFnfVoJFSM+b6tV8iUFPf42D
         clXWGj24DYRRwA8SRJnMNgjhluxXApRVQcYIUg5DkfbcW+aIyCgyaJyxIqWp6z59JMwH
         vSIjfP3gBwGYDlNSNMoRZSLHv5xoObeDAy92/qo+ExyUDspie6MnrBNH+Jfrjdz4CdAA
         pxew==
X-Forwarded-Encrypted: i=1; AJvYcCWgWiBG5ydljQHn+7hhxjrL6/pz8p5M8MoBIz36FTfedE6mGnh4yeCJuQxAbflg43I4TzaxvI4a3GMPGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8I9yHPL8cIY14O4dWFYLYmP8dRUGnOqI9R54ElK81G28Qa/ra
	1F1EMJd1DAca1cFfI6GVO+u7OFMGtMBzUb54RtK82gKziKWfuAGIqdj+9dNV
X-Google-Smtp-Source: AGHT+IH64RzhNHT05+mZmsuakuuQ/wigEa25MD5w0U+0fy/UpI2BMLsjd3w23II7gehVl74xPDWdPQ==
X-Received: by 2002:a05:600c:548e:b0:428:10ec:e5ca with SMTP id 5b1f17b1804b1-42e7ac24d19mr77659165e9.14.1727110896606;
        Mon, 23 Sep 2024 10:01:36 -0700 (PDT)
Received: from aquecedor-3-0.lan ([2001:818:e81c:ce00:a171:3675:5403:539])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754c643csm131531485e9.45.2024.09.23.10.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 10:01:36 -0700 (PDT)
From: "=?UTF-8?q?Jos=C3=A9=20Relvas?=" <josemonsantorelvas@gmail.com>
X-Google-Original-From: =?UTF-8?q?Jos=C3=A9=20Relvas?= <josemonsantorelvas@gmail.com
To: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Cc: =?UTF-8?q?Jos=C3=A9=20Relvas?= <josemonsantorelvas@gmail.com>
Subject: [PATCH] Add subwoofer quirk for Acer Predator G9-593
Date: Mon, 23 Sep 2024 18:01:05 +0100
Message-ID: <20240923170105.405647-1-josemonsantorelvas@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: José Relvas <josemonsantorelvas@gmail.com>

The Acer Predator G9-593 has a 2+1 speaker system which isn't probed correctly.
This patch adds a quirk with the proper pin connections.

Note that I do not own this laptop, so I cannot guarantee that this fixes the issue.
Testing was done by other users here:
https://discussion.fedoraproject.org/t/-/118482

This model appears to have two different dev IDs...

- 0x1177 (as seen on the forum link above)
- 0x1178 (as seen on https://linux-hardware.org/?probe=127df9999f)

I don't think the audio system was changed between model revisions, so the patch
applies for both IDs.

Signed-off-by: José Relvas <josemonsantorelvas@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f787ff4182d4..df556c4f0f99 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7608,6 +7608,7 @@ enum {
 	ALC256_FIXUP_ASUS_HEADSET_MIC,
 	ALC256_FIXUP_ASUS_MIC_NO_PRESENCE,
 	ALC299_FIXUP_PREDATOR_SPK,
+	ALC255_FIXUP_PREDATOR_SUBWOOFER,
 	ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE,
 	ALC289_FIXUP_DELL_SPK1,
 	ALC289_FIXUP_DELL_SPK2,
@@ -9027,6 +9028,13 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ }
 		}
 	},
+	[ALC255_FIXUP_PREDATOR_SUBWOOFER] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x17, 0x90170151 }, /* use as internal speaker (LFE) */
+			{ 0x1b, 0x90170152 } /* use as internal speaker (back) */
+		}
+	},
 	[ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE] = {
 		.type = HDA_FIXUP_PINS,
 		.v.pins = (const struct hda_pintbl[]) {
@@ -10104,6 +10112,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1166, "Acer Veriton N4640G", ALC269_FIXUP_LIFEBOOK),
 	SND_PCI_QUIRK(0x1025, 0x1167, "Acer Veriton N6640G", ALC269_FIXUP_LIFEBOOK),
 	SND_PCI_QUIRK(0x1025, 0x1246, "Acer Predator Helios 500", ALC299_FIXUP_PREDATOR_SPK),
+	SND_PCI_QUIRK(0x1025, 0x1177, "Acer Predator G9-593", ALC255_FIXUP_PREDATOR_SUBWOOFER),
+	SND_PCI_QUIRK(0x1025, 0x1178, "Acer Predator G9-593", ALC255_FIXUP_PREDATOR_SUBWOOFER),
 	SND_PCI_QUIRK(0x1025, 0x1247, "Acer vCopperbox", ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
 	SND_PCI_QUIRK(0x1025, 0x1248, "Acer Veriton N4660G", ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1269, "Acer SWIFT SF314-54", ALC256_FIXUP_ACER_HEADSET_MIC),
-- 
2.46.1

