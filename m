Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C9C39D6CF
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544121; cv=none; b=eVZs2QKg67+so1U+HZVvFrYMcNWKqNq+dfiUelYXLJ0lG6cpufwBjy5iNSMGjpg+iUV9mzUpWkWV0UM+7tvcWMnDajLEPx4nL3qkkzkznuZLC4avaaMB6cNtuxOlm3p+1WW9d+b6q+JId3KmLSxQCyUpflo0H/yZT180yah30wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544121; c=relaxed/simple;
	bh=8HV852kkCrLJJqm5lXdcFWJSQ384uj2qm9kSfvfSljU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jRlMVQY+5TOmEiSMT6PZmyURk18uv34/Qz2XioimUOV9InNYNZqSIBnCk0ueb+HcGbuCAnTBcj8M/Ubl2YgJGYjbjBD8oaJPpM/LHSkxYFkGeZqd7sQKP9ZlfVeJv99E5cumvBSB4D3PUcGaDQmxZ+IQvuAgcN4fRgVOO1Y+dDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GcsUIroh; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GcsUIroh"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5fe086fb0bdso1275093137.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Mar 2026 05:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772544119; x=1773148919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ox2lIBigJxBhDAzWF1GGFhbADrcYbkRqSJFVIngTPE=;
        b=GcsUIrohR/3NZLYVqhuVgFtYg0YN8rRQb/93+LKyKZrsL9gg1a4czG2D3uarwKo48Z
         8dA8/GaJsaF9NzJnpSQs5XfkMQ1pO4wd1sCETzO1ujl6Kl7lou7rGSIx5vOhVU89Z/2C
         7aqRzr07MjYkPFnKKWQm/5C8XMzf6sAKLAoGf5GBumsUhEk78hgexGXO0qIdq5gVkUyE
         UziyRRikbF3f3T9D989DrbRuHcZ1by8rOZqWnvveOgFJCE2K6QVl3wTksjrfbpFtHOv3
         PPA2F4yroVJ58S8vDndMLxi17TUoKbW6hD5kFs/LskhV+r43GbwKSDY8pjzokwWDygWM
         Es1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544119; x=1773148919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ox2lIBigJxBhDAzWF1GGFhbADrcYbkRqSJFVIngTPE=;
        b=mDsrs4BVomRUUjsdYwJ4m7mts9tMNpqCRgAmBSLVAj/F+4hgEVu+sn5HCC3oeOjKjH
         hJCiAxHANgAPKzOFomzS/n7csAjYppIevjpoxKpqjm30lhksb4ZNDYxlsl4hHN3tp5VB
         dUyUYj8ro1/h3D3cm4qM15vXARuaTV3hRoQRm1L+1LxKPbbn4RSxn/+PYN4oA+1BFyYK
         2Ftl+R9IJUIMXkkF2hA1TINJmHOcsFvo6zsVx8mYN0WJOpP3uvoEC/YRqg01uKUCsssa
         rdEiwznf8akz74frxaN3+xJVn9rC8LnZrPoPF0FSCwb0moTxAwOTnlSlE3QKaUwMjwZr
         3qmg==
X-Forwarded-Encrypted: i=1; AJvYcCXscI2Ig1TRcJdBRUcfJhB6exzaVh+DOcMZVHmRxRNVUfuYKizLA1RqNRHtHAASQJa9n4bjEnaO0Tczkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKor8L4wRu/v6MpRxaSm5vxzJ8aZDm+vxeIlfvF+GLiGJlGgAK
	Ox8sZU+/k05Uc1Bg3N/bV6Dls9jI5NJKGctiqpvhx18V1qZLiAiKmXZ2
X-Gm-Gg: ATEYQzwpQ3aU+tXVDIn705I38TO8ePdLXg8iRS7j0tv1DovAHKl2ZLKvbx3EAzVN/0O
	cKBnK0/TeqrLszaP6EtKbQeAlbuzoHBHfR58qH6uhGth3XOeeJUvabck1X3a6ePdXMwk7TwK60+
	oEt+XilmFaI1boisIR6wp2el9A1sWI/AhlN99UsY+jdSsfHP92xhB9swwBam52438k6ETyHUPQc
	Vdg9DCW/QPi4egsW2UAPckrUyyRIR1Jb5PtiLFqOffpymt5Jtgm1i/T4gYC1NylTtV2qUv12m5T
	kNpupLgj/K0tpbe/3OFl6LFG96D4rorOxtKZJdWCVhST7mG9JEr0cC5nkD1PoWdao7F7H1zk8ag
	lrdU4Xrc652ZjE2mnkJW7Wc7VLo6BdiCWsTzEYdK5NyjFWSppO1E8I9gxFHrEWXsdgIgZ1zbxkE
	tttbbEFuf9Ocbn3X7ofUFcVt1hWbKBLgJ3YTNye1zmcRBVn+ccRwWO2oZ+p5rEtPxKqQIa9sA6Y
	nfbLIk=
X-Received: by 2002:a05:6102:3ed6:b0:5fd:fa29:ae15 with SMTP id ada2fe7eead31-5ff3233258bmr5395968137.9.1772544118714;
        Tue, 03 Mar 2026 05:21:58 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:1b3:a802:8875:499e:12bf:3287:5753])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea6ea19sm16593553137.12.2026.03.03.05.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:21:58 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: stable@vger.kernel.org
Cc: broonie@kernel.org,
	alexander.stein@ew.tq-group.com,
	linux-sound@vger.kernel.org
Subject: ASoC: fsl_xcvr: provide regmap names
Date: Tue,  3 Mar 2026 10:21:42 -0300
Message-Id: <20260303132143.766078-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Stein <alexander.stein@ew.tq-group.com>

This driver uses multiple regmaps, which will causes name conflicts
in debugfs like:
  debugfs: '30cc0000.xcvr' already exists in 'regmap'
Fix this by adding a name for the non-core regmap configurations.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Link: https://patch.msgid.link/20251216084931.553328-1-alexander.stein@ew.tq-group.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_xcvr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 06434b2c9a0fb0..a268fb81a2f868 100644
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
cgit 1.2.3-korg
