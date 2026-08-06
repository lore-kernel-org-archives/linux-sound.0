Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C43C3859CB
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 05:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785995997; cv=none; b=dZsFlE/wpHkOi0xV+uDE37PAaq7hE5EeMfouAj04YRPNrUQsO547bpoMUwgIdiTWsOS+G1EZlDDK+EkNU6Lg0SxZxzGeyveJo7/6FjT27GTtSjqKZUSz2gfhMjipfgM2ennLJkt6i+UtmotMK1CPAKoRdfROcE4sP8Pi+C2r2uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785995997; c=relaxed/simple;
	bh=38sJWD51bvqFyIMrBEEym7OBm84GpTOLm6gU3EN0vbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uw2okuFfqW6tCZnuSgHiewytWf6NmwefKDl3ECM5htcXrpFe9JDgRUBoWwIuuLzDw44sX4u5T3qVkNjOF+jARskGfLsbqFQ8BNPNTJyMFNKF4zwM9LVDVI8Qo3Jx1ftNgbNG/keBbndX4otTACi4Md8VJxoDElJ4t3/75t826GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Un3MvipF; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Un3MvipF"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84874b52eabso2593346b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 22:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785995995; x=1786600795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+uV3a1ZMt20KcdVnxB2/Ay1vWKrYrKnEXInPtGHfWRI=;
        b=Un3MvipF+2z4hNKfWx45+NprlEKmrsXoaAd7c1+sO2yHJcH/VTrv+MUtsVgeCZHiv2
         7qy2tx+yquu3C09ik1odlpP/34Sj1mXeANjEM8xcLFGIJi05Quj0Qj7uJ6SRSOT8ezyy
         IMqjVNuOCcEHGvRLcPZEn7nsT+fGznz17lGazA+m2xO/VRwOB5Hs+z8TsGQRV5wVD6F5
         Exhg76sZfYnQG1yaN3WZIoFBuyVkdFWLH0xTqBk93AzccoD5QPE9KaZvmZVODZDvzI11
         Idm/czj1v60xiWvzPEoEPwaxd/WuiTHnVvkuyvvA3Yf2dfJu710C0LUvBwG3ttOoCILe
         YuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785995995; x=1786600795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+uV3a1ZMt20KcdVnxB2/Ay1vWKrYrKnEXInPtGHfWRI=;
        b=d6u29bhn9mHq9FskcchtUrMntADBcNWfT6XVqbBo0PwxlwNuDu8lwziftceKS6igYc
         eOefPZx3dg6DwlaxI413idDsLAexqjAFg7QDXIc9YOwU62lAogriorRw3q5+97t9nhZi
         6RTR6jiT/BqWEu6DF/v55wcO+276uORHbVw7R2W0AIJHFG/wddQUjxum2BbfLfs/2FGx
         omnNZri7MoI3C4oWntu558zXjXwLjkZx8yoB496j0skwwVpNffo7Y1H6Zgd1inTjMCEj
         WUcEww2dxh0g7WIaUwxk4zaAr8YEJ+wUm0s3NG1pjRi8p25vPvRMubVf5waQ+Z/X/oIm
         tD4A==
X-Forwarded-Encrypted: i=1; AHgh+Rqwhb/UChMc8Ol14nHoG9JDvKeSqjQrIQrr+ie+QC0joGeEn0pL+tPLSn36Bnc/k4AGEXKeK5TcAhIwkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCp8zYj+ZMnyomSMcuClUfP3vf/Io1kVE2oMIT/JVQa9/5y0GI
	Zgz8sqBrgSZK8K0wSkU6OIslDOg6OEL07neAk2DQRYlnVDojfb7NDTpm
X-Gm-Gg: AR+sD10KcUs4m/g90Q+xem/SJf4U6JkXZ92SYJ+5v9ZK0H1sOfX22w60eE86iqu+167
	EoHGEFfh6qOkZq3e79961D7fegImWYtl26L2VcHw3C2c6DHxjwEKiz7RndoVYm4p69nk51fPhHX
	ImOp782aD8lOhhNLE4iwSlTPekqWLsca1cXtqqfs4Lk0vJHUxx3vUWFaULGGwdgwXp51bK5giaC
	qAKUX1MIXxwZW4ECfIT02FzMiktC/H1/VTmO1Vg+HWliBVd8WExkOAQg/Xyh2t7KPojVAAQk0oP
	wRs970Zz7+GUPkPYz8WICt2xSoDJ0W4PxILfs90trZGgUetQkieGULfPR032tAJI58oFMaM30ha
	+jHa6T9VLGv0G3/p75T/9MET40BqhBsn6X1jMZl4cYKx4bGSLR7V21Hk+ISA1u5h3UQeuDuopWV
	BdduOvSje3UsBIBisPmOWpiciMmxx/UIswYBeJPp1orU+JFPoWN98QPrV6MN3j01dZb0s8rUxDs
	L6n3REqOkWZFUjiJCi7mNgaU7x3+d29Is7DAxXyvP4o1KToqFMheqGJaQ53llbrWXlB225F468Y
	uzzt
X-Received: by 2002:a05:6a00:88c:b0:845:3914:f039 with SMTP id d2e1a72fcca58-84f2dff687amr13631507b3a.26.1785995995648;
        Wed, 05 Aug 2026 22:59:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45ab011bsm633993b3a.41.2026.08.05.22.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:59:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: Intel: KMB: Propagate -EPROBE_DEFER from IRQ lookup
Date: Thu,  6 Aug 2026 12:59:37 +0700
Message-ID: <20260806055937.24600-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
re-probed when the interrupt resource becomes available instead of
continuing probe without an IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/intel/keembay/kmb_platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index 6659e8060ef3..48f132f01878 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -873,6 +873,8 @@ static int kmb_plat_dai_probe(struct platform_device *pdev)
 
 	if (kmb_i2s->use_pio) {
 		irq = platform_get_irq_optional(pdev, 0);
+		if (irq == -EPROBE_DEFER)
+			return irq;
 		if (irq > 0) {
 			ret = devm_request_irq(dev, irq, kmb_i2s_irq_handler, 0,
 					       pdev->name, kmb_i2s);
-- 
2.43.0

