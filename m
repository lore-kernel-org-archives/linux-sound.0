Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7450019B5A7
	for <linux-sound@vger.kernel.org>; Mon, 22 Sep 2025 14:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758549978; cv=none; b=ix9UieSQNp+RDclKnoGvZz4OeT+4YbQMNCllHXqLrvvlKuH7lyJf4RPzX2Cr3gXChsS3n/KwDSApU9TqQDaGLlRhhslBM4uQ50OdtByntXE0F/oQhWD+iQ4a/rWn3yamYE/3JB+1m4V3VdDrJKJqdhlKuuZ4hmZynKlFy7Sp020=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758549978; c=relaxed/simple;
	bh=NSzxPZcHqME+hAtkJ0C72qogZnh9d1CTCSrgMBNyWpw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IiZrWpvs+uzO5a0Z3gYSf374pg2LbPt9fg9wce/PKxWBNa7fYmK/soDRdB3lVwhEXbG/q2IJystz0OXN2n9hLah7EpEP4DeixH7LMkChqM3Jco0bghVZaukPKBqEKGIApign1wnrOzK1PwYDIAm7+f3of2qu0vmMuuDR6Asr6Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c87RPluG; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c87RPluG"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77716518125so2252991b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 22 Sep 2025 07:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758549976; x=1759154776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q65R4wtI7rKWrIB8Hpru/7LhZExxGYM5TnlXns4ne/U=;
        b=c87RPluGLTEG4UqAFiiXTRysBebOLFXX8T6DeDpuUDsgRfSC+PyTVWh9UIwtr9rKa/
         v3PmFehxTh8wY3+MPNuGTZ3o9RSdjwBK9hcqqwwnqCM27CQ9+tQLTVneHkAcUN6y2r5a
         k9mDgQXBuEk17Nt36U66AFrCOCYvaU7RP6tfpdQ4pNNB3Pc5sBL9jF0mmFAR6lFYvrmU
         sL7MBpnBo777nQ7MmSkNCNqjF9GIS49ww4ht/6br2t1i6whdHv+30x+UtH5hDTmTe4lL
         HBqIr1+jgZVXcXI21YmnrTtV/Hy5I4RCC9708jAPBimYt7Jeq+jcJBKgyZnQ403yDHxp
         0QoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758549976; x=1759154776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q65R4wtI7rKWrIB8Hpru/7LhZExxGYM5TnlXns4ne/U=;
        b=hUNt6ikttH7+VggH25iOa1pyTjSJLYY/JIdv38kMm7UrFDNmkhDA5xePK+6wxIAZKR
         H8Dgg5U0HOI1v+uggLZ1M62sheYPhXNdaVlhhco4izyOeLdJvUhAu/J9G3wanAHbFkQJ
         FrsdfoELRH6QrFtRd2GPHfy9FS+Qqkkz1Anq7lYH4QzxTZ2OeSkohyCy/oy20LXA4tMw
         Txb6Hike5R9Wzz5bXepAOp83I+uTBK/gB22YUm6hVLRHNipSuj6i4HWxCYJYUgCsfX49
         dD/BUiqbYC/4DNh3uzZ7ePjYcIC9YPHRUbxHk+b7Kq+v4k6E0RcPADElUP/EJbN/44KR
         2zEw==
X-Forwarded-Encrypted: i=1; AJvYcCVKwWuOhrViDnkL9rgcp7Gle5YsUrLLcFnYvp7kCRLjWJjNAsk84cLzo8Zss36BhVZSbs4K205rcR5z1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHTdzz6XqKSVS3plOaWG8Xs61PF6Uohdicm6klsyzAZP3wnfb
	avqhqcRO9PNNUs0VLRdpNiacydo18psQjFRF9/IFSrGKrI3Hqrz4xINm
X-Gm-Gg: ASbGnctHxe9boCqVAYN8bZRMI9jD5BC0pCQn6ndVIfGq3oGgZbNRDHX7mZrTFSs+gPc
	kPLaP9yLOdw1ENjek0XRq6tRPmEq5myRq8RKoB95C8f6APrc2Uu3p5tGS1B5Wwu+0wgDQInh/2O
	sgtHt2KI+Q6BX1PnL4E6ZsCA9srFRZS6SYd7YAACFBQEPgXCr9MLbZ1BUC26FpD0H5gbwXvIwCL
	6eWVb6xW0med5dC98oFt9oI7JaNEu9/Fwz4ckx0uwYLEgXLfz7CY4nW9DqLyvmmmaddZqQYsD6Z
	SLYV13XJzQXEMbPVoMGkTkxB4BXNfdUr3AD6ABODDL0U1ksKt2vL9zIZHhm5ETwKpztd+BLarGc
	4WhyQ/75RPbaYYaJG9UilOpOp
X-Google-Smtp-Source: AGHT+IGut+RghUbyFn2F4fwYbZuwj/DFVn5Cf89eveAp7C+mVNUJEdBY4DbdKoQyXojSDqZ4ufxz5w==
X-Received: by 2002:a05:6a00:c85:b0:77f:472b:bc73 with SMTP id d2e1a72fcca58-77f472bbe3amr1851305b3a.6.1758549975348;
        Mon, 22 Sep 2025 07:06:15 -0700 (PDT)
Received: from lgs.. ([2408:8418:1100:9530:3333:9fe1:c4de:4cb8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f188dd4a8sm7177799b3a.39.2025.09.22.07.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 07:06:14 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8365: Add check for devm_kcalloc() in mt8365_afe_suspend()
Date: Mon, 22 Sep 2025 22:05:55 +0800
Message-ID: <20250922140555.1776903-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kcalloc() may fail. mt8365_afe_suspend() uses afe->reg_back_up
unconditionally after allocation and writes afe->reg_back_up[i], which
can lead to a NULL pointer dereference under low-memory conditions.

Add a NULL check and bail out with -ENOMEM, making sure to disable the
main clock via the existing error path to keep clock state balanced.

Fixes: e1991d102bc2 ("ASoC: mediatek: mt8365: Add the AFE driver support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index 10793bbe9275..eaeb14e1fce9 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -1979,6 +1979,10 @@ static int mt8365_afe_suspend(struct device *dev)
 		afe->reg_back_up =
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
 				     sizeof(unsigned int), GFP_KERNEL);
+		if (!afe->reg_back_up) {
+			mt8365_afe_disable_main_clk(afe);
+			return -ENOMEM;
+		}
 
 	for (i = 0; i < afe->reg_back_up_list_num; i++)
 		regmap_read(regmap, afe->reg_back_up_list[i],
-- 
2.43.0

