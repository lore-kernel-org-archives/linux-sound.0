Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E19C32861F
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783025038; cv=none; b=nA9iA8rZ+S4KCN4c6+SzJczESRQQqAup0msJ8CRcuLgvE3A7g4swQwXPfU7c0JmRJhrEuzGKsbwwvSprRX7TAyxQGD+dgzgA/RFTa5V5V0QN0khD7fxABZxKRe0iHmKMX7Qji8qUM0mp8BvO0cesRzRnQENkDeDllriKrvX8j8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783025038; c=relaxed/simple;
	bh=nZkNttlzNNyG+na6lkSBSYYTUc2GvG7EHT8AWSUPRSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OLwyx8mHbn9Gk6L+vUKITl8f/mKSqUuu+G/CnEOsN7Nm9JqcwuzBrEtQXI0XPrWU0E93pbYMozlWSStnnn/osLxlUGWb4p4+F37hS8CywrolQYIQxYHemxuZ2y1BM6NpKfarQa24CGkljs56PmiAtEmciAMK2uqiEL4hzwHZ9dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e00r2/Et; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e00r2/Et"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4763b0c1dcdso2182127f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 13:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783025035; x=1783629835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tu9neP+7dOPbZzyuIR27g3T9PMRkt/Kt6nBWVDJUtL8=;
        b=e00r2/EtEjKKIqaSrUyHAshQNleh4inYDqTsCNwwISKFAhUeiA0vpurMEboDDbaIP5
         HWt0t68wkWrsXpcNK0dm1XqHz7Rut8Dxgp3jzL5mMU7c+CcTGS+z4bb3XmXiqKZh8uRE
         q15GaC1xCFtZyVWGP4IxrpxImTA8B1B6XGrIA7LEdJcF2KriX4bHLnIpjMGQvVGbOoO7
         FODIdUrEQ3+ptbw8v8RGGtqN33yRygtviNyXxCY5G5QAgSghNC6MfaZb6OA9TgUfLWEl
         YroZHx0KXyVZqoBqLa/K23R+jGAmm2Foex1wGZUQOIwyJsxUmpKs6KHpLRx03kdIGgQH
         xppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783025035; x=1783629835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tu9neP+7dOPbZzyuIR27g3T9PMRkt/Kt6nBWVDJUtL8=;
        b=k8AqTY5BorvBSAf0jceIs+feLts+v5zvGFwfpc6hahTE8MkbVYHuO3H+PptpkL4EMz
         Nnh1a+wc55DRG35/i9vqH2vo1pYy1+NbnOf03sH6oP2RDA+y1m1th72bOb/pwK8blhH2
         33jHbUdnxkw0fHsJCJwraf8G2DBk1O0MxAqJ0A/lZ3hJYYzz/eMrVnqvoX9ld3qnvC3f
         bOjod/9Qzpd8OyStH1sDzN+uWPdskL3G9r097t2dVCyTJYHbcXQwjtqKfhXU+HQKb2Zq
         lwpOrktMC4mmgm+Ef6Jpnr48RPirBjr7iIETwXW0hKkSetW41jCwWDZ0v6XanK3fZm3Y
         /ASg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2/+IwAIN2iIpW5aAZ6vcMVVFfWfIubOO9cpFrjlOBlLGO7pnsZMkxh8QAyjjqc9goWBEYvmCgSg5fCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAA5ZBonKP40K/NliXhKRLtOccmtC7/fyeD4yN0jevrdkz79lu
	ShdR0C2n/EA0YetzZ2AA0ODrCevvf1Zjl08CumNgtU2cUWdmsfD8n9EEPs6w0y/MUdm6Cg==
X-Gm-Gg: AfdE7cm12kbu6bDsF+WtmMsE8j276qDscO61ob80licLbsArz4Brb5gvSlXAiwONZGM
	fPlnBGidycU3H/ML9wAYgaJoe2W2Wa0T37p1AT8NARk7XBnCbAXTQaKMH1fv85MtuSuv85H7FxZ
	+wSOslSoZYt8lqEMiVOqG7m6OMgEov651mWeEwjEGvVEUz0OeZ+DbW6wjSQPV3/axHtiaIO5mFP
	YecLVi9Ys4U9T9Y5PEyL2unO7DKCKHXDi0Ck3b2x4XBSsQajpbja9hf8a4AL5M+Fm9KpT793zoA
	rC7LHDcZPPFp1QevcGgwz2e36AVtCfDuMnNjkYb/7ldHNUPMOTac1QBIu8Y4l972mAF86aP0fye
	I5rBRiYtzIY9KP3NeQxjWLJNHRZKvWnGRrAeFJAImiZRPxf0Udv22uafkho95LvzqwZqRYZKFQE
	nDDDMG1h7xYVC2o7BXikwciVaKwrRghGHn1sloS3lRWQIEFoMrCw==
X-Received: by 2002:a05:6000:2309:b0:460:6b0e:a75e with SMTP id ffacd0b85a97d-477b39839d6mr10620137f8f.16.1783025034730;
        Thu, 02 Jul 2026 13:43:54 -0700 (PDT)
Received: from FedeLaptop.wind3.hub ([151.33.234.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f310sm11627205f8f.31.2026.07.02.13.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 13:43:54 -0700 (PDT)
From: Federico Lombardo <lombardo.federico.lf@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	nfraprado@collabora.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Federico Lombardo <lombardo.federico.lf@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Enable mute LED quirk for HP Laptop  15-dw0xxx
Date: Thu,  2 Jul 2026 22:43:47 +0200
Message-ID: <20260702204347.187524-1-lombardo.federico.lf@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP Laptop 15-dw0xxx with subsystem ID 103c:85f0 needs the
ALC236_FIXUP_HP_MUTE_LED_COEFBIT2 quirk to correctly disable and
enable the Audio Mute LED.

Add the missing quirk entry.

Signed-off-by: Federico Lombardo <lombardo.federico.lf@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 21ab891fc..0651198be 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7011,6 +7011,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x856a, "HP Pavilion 15-cs1xxx", ALC295_FIXUP_HP_PAVILION_MUTE_LED_1B),
 	SND_PCI_QUIRK(0x103c, 0x85c6, "HP Pavilion x360 Convertible 14-dy1xxx", ALC295_FIXUP_HP_MUTE_LED_COEFBIT11),
 	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP_ENVY_X360),
+	SND_PCI_QUIRK(0x103c, 0x85f0, "HP Laptop 15-dw0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
 	SND_PCI_QUIRK(0x103c, 0x8603, "HP Omen 17-cb0xxx", ALC285_FIXUP_HP_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x860c, "HP ZBook 17 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x860f, "HP ZBook 15 G6", ALC285_FIXUP_HP_GPIO_AMP_INIT),
-- 
2.55.0

