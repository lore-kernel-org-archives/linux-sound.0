Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A10821FF53
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 19:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461453; cv=none; b=opcIPFuoM0jqdQKdcvn6IiFYT/INkteH7FcGoVEzlPdcKlKOHD4ndM+EJLLMtsuCff9tAww7suthnLnO+MhsCw28HhHJ99IUl/nfl8PNl9HLVDEQvsb4cBp2i89+M0VaH67ElLq9lacq3eLNS3X/T7U+p/4nITfWbOGkM8+2O/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461453; c=relaxed/simple;
	bh=v+7c2ibym+9L4vBuGB864srL601ndzgn07XqfmbWBCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RoHKhl8EPcRDmN1TgEMdd0xsFFDhEO6yY52iKgthYb7DNdo2OUS4lOF8EeMu2qBxBtgL/8JKW85T3RAunfCM/8RiN1JxJnMIb96mkgKOEXoG5L232t47sAIzeY0zDQdHC6UG4oeLpD/gwcnJAB564gqT0042ELpK3NrBMzjIJ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PUn7ELU8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PUn7ELU8"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4e6a0c274so24044f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 12:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748461450; x=1749066250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6b6pocI+1kBnlTh2HZkTgqTBwAL4VXspXdzVNai3n8I=;
        b=PUn7ELU8CIZQSBwJczFoSZnp9pJGMG65S8GCma2zua0j9eBbKKa3OGEsed/94/9YFa
         7XiTBgqovj1xd4x00wrTHzZGgEC9MsULZlxdrh5yiaGsBowDodHOZvcmywgqu0SYLDOG
         qHMqG9Ci6vQYgHooRAXKOmeuiFMH2VXkE9p5p/5pgHnpI5DoKTodXg5kV33j8gjiXaev
         Lpv/SVPXyuLruZIlwUbi4ur6fmBeuNi3yzuYqb7r60LhBJUBpMPFQ90/AYIUNPLNHws2
         GvYvVsk2VmqGltWHbcipfSJVPKL+999c96cMCoRmBTwLYXtrt4HBZZ7jsh28yOaMD6Yx
         DvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461450; x=1749066250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6b6pocI+1kBnlTh2HZkTgqTBwAL4VXspXdzVNai3n8I=;
        b=qXFislpxoZl9wHHQ0x7hdbN3fkIkzVXOjdbtX/WuH8ufghj/XA8VcEAOTn7aocSGPV
         +Bf/wLPbLk5zAZPIX/rSv+EwDgNvgWyPLtYOCAHcx6glEi3rl/rrmiB+9c+etqYSaHWK
         Fl6QgJz4QUcPzPQEsZHIdO0fAptWy4ytlOkpClyIzKAJ36lC7iN6kmKKD5lZ3PeALN2I
         qDK+e0bOQLyqrZhR7d1NrMSeiRQj86tQHIAPMt/7oF/3Y+uW55mhgZdqRCsaxsNplXF1
         BOv94Ej4wQIbhRrUtiMWFz2fNjUPNW8mxc5XSfnBVrNFPa3TbO2SC2ujt5BkfWnPfjnU
         BQiw==
X-Forwarded-Encrypted: i=1; AJvYcCWKNxGkRPvUGtEgULjXG3oQqIFm8P+RkhRmy6f7FYu8AZkCUnZ16pEEaNt2PysHOXEW09ZxUvxXRiXZ0w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb3SiwhhQXIURw9q7H5tqsKhiwTslq+zMXDbxtzUWhf3epd0aV
	JZTV2BcIf7PBPE4dieJrTxC6zLRgk8JDxgFYnRdaB48A0Y/Rk7iaEJHNf0rFNCQW89w=
X-Gm-Gg: ASbGncuM8slDxCflUJLa1G+I9ISQDgmueGm+QaQUrG7iZsrcXstMvLU4LKm/lImDMUf
	GNM4b1j7E5nBeZhEs7MRR+6/SthsNJD6mBdpNoKAd8//vWHk1B1vJe1SUs70FfbU0939Sza7Rya
	sPAcPAWN6arP16cgRlgHs8Lrkb4VQnsNOS7HE4mxQSyVlC9QvbtVvnKAY6eQOSaDnEn7Stc+rRc
	foRO4F0zWeeOs2AKKtGWp2Hh25lzKQqbLe6YYtljQI7G/yUULfBAjZhQPmwz4L2y57PwY9iaTgt
	qi59Fk0vFNOWEa5TfUm4G69MER2s2El7mJwKuh489UgRrRgm5eI9dTFfGED1kQ==
X-Google-Smtp-Source: AGHT+IHpZIF+SG/qw5FywiMZWZPdXSbwv4KKKCQlkP4nvRsETytm6+Be6Wq6IYWOYMM7+s75isaOrg==
X-Received: by 2002:a05:600c:138a:b0:43d:301b:5508 with SMTP id 5b1f17b1804b1-44ff400febemr14288445e9.2.1748461449599;
        Wed, 28 May 2025 12:44:09 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc15ad7sm367945e9.18.2025.05.28.12.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:44:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ALSA: hda: cs35l41: Constify regmap_irq_chip
Date: Wed, 28 May 2025 21:44:03 +0200
Message-ID: <20250528194402.567062-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=827; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=v+7c2ibym+9L4vBuGB864srL601ndzgn07XqfmbWBCM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2eCH3amPl91B4Ck8Do7O+u3Eac8Qh5VuY+wK
 5IY9tdu8FeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdnggAKCRDBN2bmhouD
 1/QgD/9Gz1c9lI5b1sxDHnXsy3V19uumEXQlOG+gkqYIHX0519danAD8LBM3tIrTG4469FeJomx
 Z/qeTe589Z93pgPe8gjF4rGoP4seIZ4BqgENvMz8R/wM+zbgK1c6ksHjtI/IdChDHE7LGFbho/+
 QoHbRBbilWW8lr+s9nUhq1y405dOLjyf7Is6KLMr0FaFujKTkfyYU7vqEQ2e4W2k+9Lo4hLbfBh
 PQyWLk7UynZPRCsi12TetnqudfzBn6jSMa8KzjY+YnJxLDrMZiiAt+2o2rN7tCOBE8ORql7Tly3
 62g4UD1lf2iqY68ndFsignzWYOrYykmXHIa9NU3r/odx8YtJ403sG4pBnPfYU6FD53+/cQLvA6T
 LaEozrbBGJavgNZZGEWpEpOLR1ck2Ztx5C5XffzW7RJSVPTMv/BVUcLdV45oObWnqXwlLwKBSfB
 suQeEmH+bsM/SiRwNWvxM0FqT4mUeFW68q55ur4dMVvgRbxPguo9GlW40zX89e5wktnG2Id03MY
 ivfHr0pVNEOKq3UA21nyE6jRCxrQgb3ydJlCVzeve6Kr7ye5o9E0ZEbcBQ4MLvlnMNP+HWdlezO
 lJDlsdplUPamGNlP2Icf4utVBPvBUXmR8Aq70laOigh4SlBM7QgurhYmp6mr90Sz8/nAFWrQp/M uMRIWxsLfwzJOKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Static 'struct regmap_irq_chip' is not modified so can be changed to
const for more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/pci/hda/cs35l41_hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index d9c8872b1866..d5bc81099d0d 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1603,7 +1603,7 @@ static const struct regmap_irq cs35l41_reg_irqs[] = {
 	CS35L41_REG_IRQ(IRQ1_STATUS1, AMP_SHORT_ERR),
 };
 
-static struct regmap_irq_chip cs35l41_regmap_irq_chip = {
+static const struct regmap_irq_chip cs35l41_regmap_irq_chip = {
 	.name = "cs35l41 IRQ1 Controller",
 	.status_base = CS35L41_IRQ1_STATUS1,
 	.mask_base = CS35L41_IRQ1_MASK1,
-- 
2.45.2

