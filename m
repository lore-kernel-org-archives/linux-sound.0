Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB68F3EDAD6
	for <linux-sound@vger.kernel.org>; Fri,  6 Mar 2026 17:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772816693; cv=none; b=nN9UMfobhbo2Kb8JzrEw4HPrUA5EaxC++C7JcOZQwBOMSkOlHaVNWKdmN4GT1v+J9/93ZfzOUWP4E17VKSLRFdu/w9T9ExyMmexvLuScUCJISmH0f1Pt7V77kMXOjrvJDUQ71Ncvx8CpPa9isbQ3CAF5qEuJ3/TPg8AHHkM80IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772816693; c=relaxed/simple;
	bh=KgU5qIlmN4yivxWth4nZMfVPkNBmx99YR47kvHMtCt8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bp+MJEHbv4jXYu1i3KdeZyC0wi+Qiav7tyiaqb/n2mvKY1by6k7XN4FYw0UiNB6RWfWSz+Z4JlOPmLMkwuZcwK2rPuhe0liNgG4U941D0D69FRqGvL91R95+GDQy/s4yAgYkOshWg7UFcPg7SNR76DVgIQglKpNKxAlHdUuVCl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QYbMP0xE; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QYbMP0xE"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso7117145e0c.3
        for <linux-sound@vger.kernel.org>; Fri, 06 Mar 2026 09:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772816691; x=1773421491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R4KjQPrU7WLJvf7ZmVhX2kRs77Fj2PYQR90hIAEseI=;
        b=QYbMP0xEizri31PzmLzUyzI2u6+AdxONThV2YD3by80vjDSerjOl3L29p1vv4QK4Jd
         RRLh8UctMlXg9AFTZIgp4BGWOsOQUhQWZCT5gtHCTHAyhE7rFMgHqrEJrzf27B1DPJIU
         fJ937AzHD/KXVR8pGL/qr3jIhE4RwfQ6XjOkLmzZvDZ6ff+6QsP4TX5zXtXZJnjWGY1s
         Cu59G4t5uIfPuKHrTLPVW+equY+yLtJMgTFYAkGeIzgMgru6AIEh6hSe8VFUvi0xiu9G
         uce/deLTCOJJipwtSwBbgzZdTV4xUlgaPCh63aSJhrlX6ZKrsW+VVHRew/Ekr5XplZTE
         X0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772816691; x=1773421491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6R4KjQPrU7WLJvf7ZmVhX2kRs77Fj2PYQR90hIAEseI=;
        b=QfH7M5g9doW5DRsqnb6fy2kqJEQLw0RoU1GwHV+BuQ5dZxlMk57u4Nh6vAAxty2vhX
         GGRCkouHFa8nlE9NrYCnVoSYMxXkKhTKc9oBtzmf1cCnwacubEjGjhe7hU5dAnXeKKzn
         ovsWh9XtBPyilCJeI3TlD03dWtiAI5Ud5/YmtebMJxUDQOIqP9b9BsgXKVUdxkvdEcKb
         g5zrnhfKX+buUOkCaM54TMthC+6043XjC3NNGvBd0RU+CS0CjeVYIB11ijAek0stxthc
         Xyu8N5GYP7MPmgp/bMH+ChjnUUfQz4AiGg6THgCJtUskHwHNBCQ3FhxB567cKx89uoNe
         cNuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFuetc9Xtr5fVmYXl0nhjW2JrSIsE+C+sQcQmq5cps6eXXtnt4NPVCr55Bkz4vFYqWWxOtdZJ8w6pYuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYiV1TuanbaiflSI4vVDVJuuam9DxrLOhcT1jYxVNMsLxSvECb
	3cy7bqSzYodwx3MuQrbXRR9ORk3XGJqR/EQ9Pm+ZpTKyB9M8j1xalLhQXsboyQ==
X-Gm-Gg: ATEYQzw7R8cUZ3L2KVCrgJZLp6cBTLlnl9vfGT6AyCdwS8+URPgXzGeZezJFrDCPUNs
	/38EqYIKFVBXRf2dgIdJA9PkyeDq/tAJfkbOjSit4n+e+vTMh7Ewl7N4c/cHIwsVbAekleRvjLx
	ZK/8YshfcJdOjBzqteMJFtd4N8kVh/BPiiiMeGgal3W54ADIUmTY8So8wY47tXffB/I7KIO0w2M
	hZQ2it5ZLIhU5HTpLUW70BXlyUoSorsj4jT0VDWm3OLKn/d5K4H4Tu91RLF8rsLQVtx6WV2aCil
	W737LREKeoNnXkWM/+7PH6fbvVi1A99Utwz4JeEyTrlN1kxeO4nVJKZD6xszsEtMHvk5+D/TI0I
	o6BYfntyaO6dJe8/EUf3u9WB555gFGdD6ZqBHGFnFw6SMgpxjpePWcZJmPMZbXzWYuVYvSxKiZF
	pL4Xv6zLid83m713tXafr70nyc8gpZ5yGssMycaDCK9d3uJNXCMHdZmQv5Q3cIrgxNzxKftWiEO
	8O0jLY=
X-Received: by 2002:a05:6122:829d:b0:568:e716:5faa with SMTP id 71dfb90a1353d-56b07e716b2mr1017214e0c.13.1772816690635;
        Fri, 06 Mar 2026 09:04:50 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:1b3:a802:8875:ddd6:ede8:90d6:abeb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b0f889ed2sm332967e0c.13.2026.03.06.09.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:04:50 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: stable@vger.kernel.org
Cc: broonie@kernel.org,
	alexander.stein@ew.tq-group.com,
	linux-sound@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 stable-6.18 2/2] ASoC: fsl_xcvr: provide regmap names
Date: Fri,  6 Mar 2026 14:04:21 -0300
Message-Id: <20260306170421.1430704-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306170421.1430704-1-festevam@gmail.com>
References: <20260306170421.1430704-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Stein <alexander.stein@ew.tq-group.com>

commit 08fd332eeb88515af4f1892d91f6ef4ea7558b71 upstream.

This driver uses multiple regmaps, which will causes name conflicts
in debugfs like:
  debugfs: '30cc0000.xcvr' already exists in 'regmap'
Fix this by adding a name for the non-core regmap configurations.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Link: https://patch.msgid.link/20251216084931.553328-1-alexander.stein@ew.tq-group.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None.

 sound/soc/fsl/fsl_xcvr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 06434b2c9a0f..a268fb81a2f8 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1323,6 +1323,7 @@ static const struct reg_default fsl_xcvr_phy_reg_defaults[] = {
 };
 
 static const struct regmap_config fsl_xcvr_regmap_phy_cfg = {
+	.name = "phy",
 	.reg_bits = 8,
 	.reg_stride = 4,
 	.val_bits = 32,
@@ -1335,6 +1336,7 @@ static const struct regmap_config fsl_xcvr_regmap_phy_cfg = {
 };
 
 static const struct regmap_config fsl_xcvr_regmap_pllv0_cfg = {
+	.name = "pllv0",
 	.reg_bits = 8,
 	.reg_stride = 4,
 	.val_bits = 32,
@@ -1345,6 +1347,7 @@ static const struct regmap_config fsl_xcvr_regmap_pllv0_cfg = {
 };
 
 static const struct regmap_config fsl_xcvr_regmap_pllv1_cfg = {
+	.name = "pllv1",
 	.reg_bits = 8,
 	.reg_stride = 4,
 	.val_bits = 32,
-- 
2.34.1

