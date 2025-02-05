Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACCE22B8B7
	for <linux-sound@vger.kernel.org>; Wed,  5 Feb 2025 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738756919; cv=none; b=osvNH+4Ytu9YnJlkPZcVQrEz/Lvm18m+OPO/eWg10VNUV74sQdMcLrjzdnohQQdqQ4smAA5BI2WbnnFnFtZxr8lrtL9xECc1UXfDbN66y9m4zsv+/gsxoNeCMjg7tIn/91bEWrnsMmKFdyGYrHtcHSuXhtJwQvjyqOlo7JdDKCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738756919; c=relaxed/simple;
	bh=BF7XDcQmsN2iArIg8PY8SNq0dZcQVwnzp37MbCrNIyg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B4Kz+YcOkXtC7PEsfpG2x1ajeRV+H77vjGzigsgqdmr5TlVe+3ZDNhEWGydD6r+zLnUuBaSVfii0iuwFSg4hy9H/7pKiqeQnAX73oh03aBBg+CIpysYcfXpoQOd20/Ok+yeuk8jD0dXTk8NZyGs17DQ2f8jj4vwdYA9TfA6XcBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuDuozCn; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuDuozCn"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f9c3ef6849so3140917a91.3
        for <linux-sound@vger.kernel.org>; Wed, 05 Feb 2025 04:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738756917; x=1739361717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sC+DeOKFgke/V6poFUMIlv8xFL2qTl0fLriKCpiuyjs=;
        b=MuDuozCnHqX78esILweeEyJB1xfOs2oZtSdRTr1w3lF6kdA0lWHxfbA9FwCLkamh70
         Yzk3VQmzxhvJ+YTix2t7ehISLc8fVZnT96Rjap+FVWqdgF/L1Zch9FcrnjNVqOS4Pv29
         1i7qvOVqwN1ccVw7FHDz2lkfAnsWyHhJcQKDjw2fGd2dUgc9eQ9aJpop30JClHsi1Prt
         XsWvLDB8HXpWhFUQdnq/OJ3a0GUG2iZmoTxMMDieMMtTBOcn4TD2EZhbLuPlF/weA/bP
         h1QYUqh8Pk3jjk3Q2nem6NmgVxJsze6YYYLGQiYDZI2DdtakYtO4ew3IqpXhM3VBdbRA
         Jw7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738756917; x=1739361717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sC+DeOKFgke/V6poFUMIlv8xFL2qTl0fLriKCpiuyjs=;
        b=jhziPJfWP1R4c54m+ZQV08+VeYsSbYcMI8iGC2TCG6hnEhzc3tu7k+ueij9wbzUau4
         lVadRtQcu7Dw1q0BZeX2bYVBjZ1R2/PAhADV1nw7lHWbg/2bObw5DFNOw2yyEEdDqzoc
         E9tZGlQ0cSrgMIwXtUDP5r7D+gkHs7ltUsVE0PIeT43/IIC/p2qdf9OoBYuNyJy7rV2Z
         wr/scdrhRirgHOGCHXdU4cZm2Wvzhwb9NLtTVGaGKv8faN5Q1H40w+tlZxpU11hIUv0c
         ZP2hE6jkxmuFoOUksRgw3ggnzG/B9jCTc3rsbkKYKLV8e2R3ChpXqe2vksZyZkkuWN5I
         Eqzg==
X-Forwarded-Encrypted: i=1; AJvYcCUOLQYXgiCFuz7jKllKFFOKxpOhMqptNpSZyTkCQNqRDyUjdydDRFr0RE3gkVdybKEPvnq8A1fG/YwvMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuJ5sYS+xPnGDybLnw2A9rtokJf9G81E6BGKsK6HlToHULwCaG
	fK9mEbnKBSDnepcMa6CSkFtWyA93qKcq2Oeeh3HkmG3fApbfkb/J7l6Npw==
X-Gm-Gg: ASbGncsP2mEuVqhbu/g2n+fw9Ru5WOwCRRua7BK+C9X6q1CMI2xSyZjmTorPSg7kwQv
	IsB0wnxXJQNUzwFqcOGGG6zfwJ1qnZk+7cHDsDdkf8cvO5Y3ekfln8qx4g2Eb35xNam2s5cSbNs
	IOP3T9xq9hof+5aRXaJAxMly+dNPZ/ARDUqXZO5CRlvu7Z3hj65Ycf6bolOOjqGk8qHfFbCzEpA
	V/QmWoZnbHuY0CkZi8XOWhLOYCS6ITNThS0+e94Sz0XTXnkyhzUymkEx8UfDRZwavpSxfbwKv7g
	6Z0S1IUAijYJD5+6IdZ14iwYkGLdSg==
X-Google-Smtp-Source: AGHT+IFl9Up/BaLyWXbKQ8HGrPtuY/TAvtdIHChfCsihvQg5LUJHAwx38yPBFWJ7z6vFZ66PURhpGA==
X-Received: by 2002:a17:90b:3846:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2f9e075384fmr4186831a91.7.1738756917240;
        Wed, 05 Feb 2025 04:01:57 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3191:ac6f:e550:d749])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1e2445asm1372097a91.39.2025.02.05.04.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:01:56 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ASoC: soc-core: Use of_property_present() for non-boolean properties
Date: Wed,  5 Feb 2025 09:01:28 -0300
Message-Id: <20250205120128.1080295-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Switch to of_property_present() to fix the following warnings observed
when booting the imx8mp-evk board:

[   11.436855] OF: /sound-bt-sco/simple-audio-card,cpu: Read of boolean property 'dai-tdm-slot-num' with a value.
[   11.436885] OF: /sound-bt-sco/simple-audio-card,cpu: Read of boolean property 'dai-tdm-slot-width' with a value.
[   11.436941] OF: /sound-bt-sco: Read of boolean property 'simple-audio-card,bitclock-master' with a value.
[   11.436960] OF: /sound-bt-sco: Read of boolean property 'simple-audio-card,frame-master' with a value.

Based on Rob Herring's patch for mmc.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/soc-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3c6d8aef4130..2c529210a8e0 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3120,7 +3120,7 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
 	if (rx_mask)
 		snd_soc_of_get_slot_mask(np, "dai-tdm-slot-rx-mask", rx_mask);
 
-	if (of_property_read_bool(np, "dai-tdm-slot-num")) {
+	if (of_property_present(np, "dai-tdm-slot-num")) {
 		ret = of_property_read_u32(np, "dai-tdm-slot-num", &val);
 		if (ret)
 			return ret;
@@ -3129,7 +3129,7 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
 			*slots = val;
 	}
 
-	if (of_property_read_bool(np, "dai-tdm-slot-width")) {
+	if (of_property_present(np, "dai-tdm-slot-width")) {
 		ret = of_property_read_u32(np, "dai-tdm-slot-width", &val);
 		if (ret)
 			return ret;
@@ -3403,12 +3403,12 @@ unsigned int snd_soc_daifmt_parse_clock_provider_raw(struct device_node *np,
 	 * check "[prefix]frame-master"
 	 */
 	snprintf(prop, sizeof(prop), "%sbitclock-master", prefix);
-	bit = of_property_read_bool(np, prop);
+	bit = of_property_present(np, prop);
 	if (bit && bitclkmaster)
 		*bitclkmaster = of_parse_phandle(np, prop, 0);
 
 	snprintf(prop, sizeof(prop), "%sframe-master", prefix);
-	frame = of_property_read_bool(np, prop);
+	frame = of_property_present(np, prop);
 	if (frame && framemaster)
 		*framemaster = of_parse_phandle(np, prop, 0);
 
-- 
2.34.1

