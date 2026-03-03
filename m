Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4591833F5AA
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 13:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544123; cv=none; b=teOFRqDV4h4uLC9gOTJN6snIKyWVp1FNc0qkI99yIcNbKKvaSJPdtwFfub8UyRrGvp1bRM0F3rd/UQo/3Bm5f4tYDRVRNDEtGFN2OqNnLReYZ0cHFerpYhNaoBQWGm5oxJiRCMyOn/mg5/bsHHwrMznP/VKvWH+pom0f63e4VUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544123; c=relaxed/simple;
	bh=S6IgDV3EkPgU7CqMUbZY4/ZqHUIrnR0zS7iri3Z1R2o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V8LyxGSo5uz7cEd3CCPzRog0vbx6C0AorsuJI06DkpGz0z3fyHc60kaCB6dJGq8mxJIG7QsIhUSuGg4O0IlrhxPizYzt7n/arSfrLQoKBk55xE/zGGtgLqhBG+a1gwperqPn2zg2O35U8fjaYWSJMSMLJWZqIPsSNzdF/xBJiuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJBewaEl; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJBewaEl"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5ff174502ffso3960114137.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Mar 2026 05:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772544121; x=1773148921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnryJSFJlY0DH3LD+RHWMuvCjKgvSwK47BtfG8A42dI=;
        b=bJBewaEl76/rSTgFND7nUSF8NW77RF7ivvSpoSIeBJNspsp3xS5tCrVtQ2RFt+nDrg
         8e4YD5RvWeiCs0f4ZdAwqUJz2m+tAi0NcNdFlcbOesJ9dG/ikPl/ya0QcAFVfuidmwaX
         UFmfHBpccUm+Zgy78qBwtVExjCWlotbFAQkkB3vu6Cb9ittxDkSObiRdncBFqVVzZJMR
         PRypcOZpF6T+g8XJgkSj+uAavIvys94b3KQmk8HPQVMei08traqrRJf2fZkO29F+iz8n
         yR8MScaiWCafC/JPCl0XojNfwNuczZJECUo6nCL/kU7VR2paMUikAr+eRr5X+jll33Rm
         zIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544121; x=1773148921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JnryJSFJlY0DH3LD+RHWMuvCjKgvSwK47BtfG8A42dI=;
        b=h8gt+6g9/0s+hT704c3y8jvRyDc2Rbea6DWj9Vf0+vkLZUXojQ38TZx8TMF/cAKMS5
         EO07WT27If+4rKPpkLOayN0/phgsMy12suwfT2lkcxBtt8OBQ+/Ntj2PVUQ2zPUt2Sat
         OmNhmEezpMu/VPCa8OmmipegIGUB9fluGVWvM9urUy8dQXLXeCPi1yw4uYcaj9CTdM1Z
         j1syzEYcApMM/nvhU3HkLdj1Hm1N2+hRQNDTPF7TpD0nQ8TyUeZeXqrXyzY5Z8zdtm8W
         arZyfxOMRRvuudWHByD6dcNQy4V7Gez6dTGSXGjQl/UC08kezyQOBLa2zLcC4ptfiSEo
         ZRQw==
X-Forwarded-Encrypted: i=1; AJvYcCX9NncMDPowDSKbVbrVpbTubdD451QpiFz9qi+dqon50eoH0+izGcr9QfFfYeYOs97X7vHMdRvd1SyH0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8zd+8WHVwiPVGCXKeDkLBmheelfnqQdx/nUlHLPkEIbbhi+Dt
	Btua61YX0u09ja1NXr9g2oCuH+6Mc3PhlZLyEWouKRfA5n0rMUi6819/
X-Gm-Gg: ATEYQzw8C9NeEERUvFonzU0h3OO5fLXIyiCCruuHR441HZFnowIHl0A9MXcmQ9WiGdo
	CMhL7qydb1BT96Ma8R25HvAuv/G6vlsLheSLvbmKK8ypORTrJU+FQUizEwiNU/1misqo24tGwQ1
	M/BNN0cd8YP9GO8A2Vvis2USKdF1J9DkyXeyyLhhVvpxM7k/t/ILdfaFIHgY9xZFxtrPAg8hKUM
	WVPeKlL2rZXwDw4Q8zVXnbEHZrAOameVz7A/gryvrOjIgYqF+W/0jzr8Ufnqkbigmh/aAOHXLNU
	krrTUIXxpx4xMHCQii1nGOVN2uen566mFC4ZV0vZxgzd3N1HnnajYUaZC3o+uZcnmmPbj4igPxk
	ug1+awwM/P5C8DDXK9RivIvDgjzgMaLm9imdStZLwjs7GD+M+pOV6jj16mzfVjFpO/aO1pKCE3f
	8AOCjes3fBzznTVBSyRbMZNf3m12+O6Oa1e5npc+p04/Y4Ijr0Wzy+iFAj9Pu0z7u2zZi1VJ2l6
	i5cpkU=
X-Received: by 2002:a05:6102:3747:b0:5fd:efb0:8562 with SMTP id ada2fe7eead31-5ff325a3a36mr7057394137.39.1772544121171;
        Tue, 03 Mar 2026 05:22:01 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:1b3:a802:8875:499e:12bf:3287:5753])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea6ea19sm16593553137.12.2026.03.03.05.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:22:00 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: stable@vger.kernel.org
Cc: broonie@kernel.org,
	alexander.stein@ew.tq-group.com,
	linux-sound@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH stable] ASoC: fsl_xcvr: provide regmap names
Date: Tue,  3 Mar 2026 10:21:43 -0300
Message-Id: <20260303132143.766078-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303132143.766078-1-festevam@gmail.com>
References: <20260303132143.766078-1-festevam@gmail.com>
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
 sound/soc/fsl/fsl_xcvr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 58db4906a01d..64eaa2fdeab7 100644
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

