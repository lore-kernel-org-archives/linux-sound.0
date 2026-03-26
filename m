Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE26D2DB7BF
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532889; cv=none; b=CjTWhuGNKaz2tuaBUlDQSlSd/atjcT34Te2zSxiYoUCO18uRGF3Q8jBYqc76a4ifgmwzO0XTAPd4Hv2RBo1sivP/xIjtZuOUMhR8JiXU/+6ThM854BcGT/PZzylk/aIeaj5CLUQb+YJDQ2pWOkwPIkPA+jzpw5B4n0x1usgC8j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532889; c=relaxed/simple;
	bh=UNszagHGVwJzhH76TN04OiQNNlfu1FHxIjAgRAs2zH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PcvWvI5/b6Ruu2A7xLKSYd14yTRpttNv5zvizIEguo/yXnGJ3D86ZrO812zzpQSSCBe6o4k2XyRcl60l24vJ9o8RPrAjuYdIoQ8ABH+/EN5JcJgV8xFYOQzHtiozdwspYu98pKNPEPv4KGvyRCpiM2RMMB9VZMDODlLHkkDxHSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gF9DQp9O; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gF9DQp9O"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so444702a12.0
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 06:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774532888; x=1775137688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vjw+Wz2BQ09NcUFFpdqkRCn9P+DLrBZP5HIOIlyaTdY=;
        b=gF9DQp9OUQoqQ6LKODjia1aIQnsV3ugQkt9QiiC97reqbwruxbXcY2hJUzozzvs9LB
         g91JqGLviDL6nHvFdfocjJlUFq1T7NVUaBhGNF79rMAKnquVl5k6LP7NZD37YKBnvK4c
         M9hw8bzPCl3gyDga9skNC2l3sNvrFk/SXus+klUC9jlPMrpz49a66BhP/e537p9DGPno
         8rYJVa6ZDNDEwCG+pTXg/5R/rhxLhrgqPJVq0uRyGYANJAEgf1bPIZi0Efyv/4x4nR0R
         3/0LgleYvnIcoVv0073Hi7rjJ68/vRAXJmKRAWZM0SvhQjm/K2y9/pUa1el71yIFZtWn
         HKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532888; x=1775137688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vjw+Wz2BQ09NcUFFpdqkRCn9P+DLrBZP5HIOIlyaTdY=;
        b=SNzsQqKfrnikw/yJck+3nEb6mkgxp44nAwE6rN25KgmxX0VvXheC+AmqUaS2kYrmNy
         m34lqSj1GMw0pZApxI5cpVc37nwam6ZObfBWtTH/bOOaV1UWmmpGYEvXF/lvPibN2vHZ
         zjDfAiDt+3LQ012ty5hcqdzWK0lyR9+W1R1kR0xGDlNod9joUld6ZHRWOPzqmBLun/KS
         LGKSyqNa3xtYVqRLCPriZN/FlESUwUUwvjgmuuybO56t3Nd/tlH3qAwkk29CFDwW9w3P
         cUoeHUMR01EAPGud9H3RfKTZa9ejWM4w5G2+LixwSuxo3YyW1x/UZdGCiEQOGefavQhE
         oD8g==
X-Gm-Message-State: AOJu0YyTqOGG3ome10Zmi1bAe4XNAv4sAqDo1W779cVUWhlyhL0vxGL+
	V7XW67/BbrJ1NQUVuF32eXLSCDeDFY6V7HCzUB/VriK8NCsUdBzLVbmSQ8aIoQ==
X-Gm-Gg: ATEYQzz8OrBk3jKgZo5XLc18oGbtxIJECt84Y82SptOY2bXfq3UxwEcyOradi6YMmMR
	61lME8TwkBh/WT+fQ5wtEyq8DqgzwNvOpo9f64C8whxhTgcELIYn3dMs7pLNo4siXGOCfRYitrE
	0n99vKr/jQVhGHxYZWP0Yjtr9XQ4Hl6YvCKjEJ0OL/AGnwCfLjnu4wYYogIkfFUQiTFjPZz7PFR
	ZkUer60yd43jSq/StyPbkijauZXA9ojv0RqCM7qyfxJ18Cr/O+45w6UUqpilcIhaUJ3Re7w2gJK
	Kd9mrjePtDmVzEfn4F0JqNDBI1rynoV4752MOTUcsTr2KZ/64m7UUL7SCTSCKEylAAdplaAcPP1
	GjfuFVPt2iDub2Yl2uYesAHcuDQGLqFAhGRov7vsMMXjq4zaaDSD8Az9b4TuJ0ZLCWYwAJ7vG20
	d+7W43Gv6XWIIw+j4RzdZccPjfDRV18nuKe6uisSz/h4Vy5D4=
X-Received: by 2002:a05:6a20:7352:b0:398:abe1:ea8f with SMTP id adf61e73a8af0-39c4ad559eamr8472339637.44.1774532887902;
        Thu, 26 Mar 2026 06:48:07 -0700 (PDT)
Received: from localhost.localdomain ([2409:40e2:102a:c1a6:90d6:f111:290a:9842])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76739345b2sm1940581a12.17.2026.03.26.06.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 06:48:07 -0700 (PDT)
From: NonameBlank007 <nonameblank007@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	stable@vger.kernel.org,
	NonameBlank007 <nonameblank007@gmail.com>
Subject: [PATCH 1/1] ALSA: hda/realtek: add quirk for HP Victus 15-fb0xxx
Date: Thu, 26 Mar 2026 19:13:24 +0530
Message-ID: <20260326134409.15230-1-nonameblank007@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds a mute led quirck for HP Victus 15-fb0xxx (103c:8a3d) model

- As it used 0x8(full bright)/0x7f(little dim) for mute led on and other values as 0ff (0x0, 0x4, ...)

- So, use ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT insted for safer approach

Cc: <stable@vger.kernel.org>
Signed-off-by: NonameBlank007 <nonameblank007@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index ab4b22fcb..7f3e88999 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6954,6 +6954,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8a30, "HP Envy 17", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a31, "HP Envy 15", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8a34, "HP Pavilion x360 2-in-1 Laptop 14-ek0xxx", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
+	SND_PCI_QUIRK(0x103c, 0x8a3d, "HP Victus 15-fb0xxx (MB 8A3D)", ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a4f, "HP Victus 15-fa0xxx (MB 8A4F)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
 	SND_PCI_QUIRK(0x103c, 0x8a6e, "HP EDNA 360", ALC287_FIXUP_CS35L41_I2C_4),
 	SND_PCI_QUIRK(0x103c, 0x8a74, "HP ProBook 440 G8 Notebook PC", ALC236_FIXUP_HP_GPIO_LED),
-- 
2.53.0

