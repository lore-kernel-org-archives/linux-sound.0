Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D911364A
	for <linux-sound@vger.kernel.org>; Tue,  6 Aug 2024 00:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722902957; cv=none; b=HIvEWBrB6zz9GAYgYlog18f/qhMXA4H/z5+DtPixLEzC/81A9m15WPPWgLXYxXpMvYfR1+rhvifBkn36KMPIQF4mb4NB+A9+3eqAdACxF3NZGt5xCqlP8BQHZ8ihOKmYZP2NUctMKP+rAHfrsLV5CmE65wP6I013JqHdgGZjLfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722902957; c=relaxed/simple;
	bh=R6MOIkZuJBuFqSF8tqOnUxEyKt8uQ3N4KcXwTYj2IeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BElXSOnEI/xX7PVRG0udG+1oNi5S+IQQbtNRXcSG8W/KmENZuxZJCSDEP/qAdKhl5kxIeTGN0jrXm7OFmdL4+4Yy+cEayhF1pIrToLFc/8Sn44TCC/ExPVyyas1Xuo9j+wUH7A7ixq09yPhuxZvxYDiDx472hViv21UN5THNc6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UVBmax1F; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UVBmax1F"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6b79293a858so571876d6.3
        for <linux-sound@vger.kernel.org>; Mon, 05 Aug 2024 17:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722902955; x=1723507755; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eXLI8wHyVdI6kvmwcMZ262mNarDv3w8K9hN3q9ZyawI=;
        b=UVBmax1FkPHOhlPKsNP4IbRtIoupq2A+pvmTirtuQabZ3GHOqLRPcM6ZqAA4tWhUti
         XFy0+AQR7Un7NK71xBuVV/8hCzquCRu+cnvBBoTVvT5+b2Im6uxrsiI0T4wP2GKr8dYB
         OnhjlLQDojHX/m2p4zbEkfwLTmaxYWSdgDPZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722902955; x=1723507755;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXLI8wHyVdI6kvmwcMZ262mNarDv3w8K9hN3q9ZyawI=;
        b=MXQV8of3z5h0sTjr8V1vkZjdjfxC1CgQYutpQ1jS63jWJmJ2vIGqDwN+omJUG+OXgw
         TEeqCneHdWzDVHY+M8cD7qqEGrRuiKOx+BVEIbR5xEXr4TJ0tODraC7u1l6kmEzYNMOc
         mHvbIcAGkxCoi2kD6WlCFIe5cqRvlGKc59umRkIVAiRE933QARscS9xJu5AJrC88P+iK
         y2JDXXAPW3QfBu0lAzNsmrjZZyK1S7H2qPC1XZCL0h/hZ3nBrD/UmutoBzNaITuu8QIN
         Y2ZKSAqofXNC9g65vJsZ1o8LwXYw6oUg9lrcgALETtAni2HBDqwlNzuR58EspqtVlP+I
         j5Cw==
X-Gm-Message-State: AOJu0YwyJfV7DigYss2TdVE+egpZ+J+zvaqnACtKegZ8WW/TXAHJXtPN
	LdvDDkRe39N0KabUfM49tBzJW4IGeLVgwNFEt8xQmgQCVvFjZaWB73ESzHSCgQ==
X-Google-Smtp-Source: AGHT+IGYHOxtSbB4Mzyzks5148QuRo36C5zZ7fJBUfAm/CwA0XoNyW8GIPaCPTpDpRYgGH4p13D3fg==
X-Received: by 2002:a05:6214:4805:b0:6bb:8c08:8830 with SMTP id 6a1803df08f44-6bb984c57c1mr154234956d6.56.1722902954681;
        Mon, 05 Aug 2024 17:09:14 -0700 (PDT)
Received: from wilburliny.c.googlers.com (200.234.86.34.bc.googleusercontent.com. [34.86.234.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c87bb90sm40166026d6.130.2024.08.05.17.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 17:09:14 -0700 (PDT)
From: Steven 'Steve' Kendall <skend@chromium.org>
Date: Tue, 06 Aug 2024 00:08:24 +0000
Subject: [PATCH v2] ALSA: hda: Add HP MP9 G4 Retail System AMS to force
 connect list
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240806-hdmi-audio-hp-wrongpins-v2-1-d9eb4ad41043@chromium.org>
X-B4-Tracking: v=1; b=H4sIAHdpsWYC/4WNQQ7CIBBFr9LM2jGApiWuvIfpghYosyg0g0VN0
 7uLvYDL95L//gbZMbkMt2YDdoUypVhBnRoYg4mTQ7KVQQl1FVooDHYmNKulhGHBF6c4LRQzeq1
 b0XptL2aAul7YeXof5UdfOVB+Jv4cR0X+7P9mkShRWz0YKWzXeX0fA6eZ1vmceIJ+3/cvElM8q
 sEAAAA=
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Steven 'Steve' Kendall <skend@chromium.org>
X-Mailer: b4 0.13.0

In recent HP UEFI firmware (likely v2.15 and above, tested on 2.27),
these pins are incorrectly set for HDMI/DP audio. Tested on
HP MP9 G4 Retail System AMS. Tested audio with two monitors connected
via DisplayPort.

Link: https://forum.manjaro.org/t/intel-cannon-lake-pch-cavs-conexant-cx20632-no-sound-at-hdmi-or-displayport/133494
Link: https://bbs.archlinux.org/viewtopic.php?id=270523
Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>
---
Changes in v2:
- Now instead adds value to force connect list as suggested in review.
- I tested these changes with two monitors via DP, results identical to v1.
- Link to v1: https://lore.kernel.org/r/20240802-hdmi-audio-hp-wrongpins-v1-1-8d8ba10d77f8@chromium.org
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 707d203ba652..4e7361d1d518 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1989,6 +1989,7 @@ static int hdmi_add_cvt(struct hda_codec *codec, hda_nid_t cvt_nid)
 }
 
 static const struct snd_pci_quirk force_connect_list[] = {
+	SND_PCI_QUIRK(0x103c, 0x83ef, "HP MP9 G4 Retail System AMS", 1),
 	SND_PCI_QUIRK(0x103c, 0x870f, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x8711, "HP", 1),

---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240802-hdmi-audio-hp-wrongpins-f88606f8d3ab

Best regards,
-- 
Steven 'Steve' Kendall <skend@chromium.org>

