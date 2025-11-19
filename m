Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC49370319;
	Wed, 19 Nov 2025 10:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763547141; cv=none; b=S3Md3EsICglnlzDZWH0QDs2b5yE+8zDs1keT6AqLGdEyZWWKxpfjCDfgfxLN17W518P/kSewtMhjG9YRwrq2MB9d1u3TdITxR2IQQmlzktKXEV1klC+TruVYMAavHZRnhl2wdH4z1CQUwVT2A86PNU8tQvz7Ris4EDyEdQ9Vo94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763547141; c=relaxed/simple;
	bh=FU2RxZzkHcckppbwMMS4L0jezZXRB21OXx9HVJL2Uc4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=G1ElQJQVJ49LMM3I03JIhJ+l6WnU2Bjx2f8WXn/v/DXqLyRs6V9OM551rS7+BoYwC3J/lHjYJOZeBQBox10FGR881W/K9A8yYkpprSCS1gLgMVh6RBG7IOysR21xuQX2fxjMsvZIWNPDYqW9hdvLeT0hm7yAiU2XVfxjW6cmDiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RjCi/i3F; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RjCi/i3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=dI
	jDq+Ac7IYU7cSMPIXIHWwDeSEPQltiwxjUsoO2KQ8=; b=RjCi/i3FfqVg+7nnaY
	rPGZQyns01hQS1THPxoz8q9RpnuqCFnq0nS9GwWGaflKfRFwiwXpFvwoKMyHxbQT
	Gfyc4hyoZP6IKO9W0VdXUdjb6uDJUirFjn78cSLHMka4ATBy5ar6UDMs/XAYhGnM
	11/ToKGb9Uzc4FbJKZ6zVprWo=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBX9szalx1pGmuvEg--.59581S2;
	Wed, 19 Nov 2025 18:11:38 +0800 (CST)
From: "jempty.liang" <imntjempty@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"jempty.liang" <imntjempty@163.com>
Subject: [PATCH] ASoC: soc-core: Pre-check zero CPU/codec DAIs, handle early rtd->dais alloc failure
Date: Wed, 19 Nov 2025 10:11:16 +0000
Message-Id: <20251119101116.78676-1-imntjempty@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgBX9szalx1pGmuvEg--.59581S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWxAr4xXr48Xr4fAw1kKrg_yoWfCFc_Ca
	yrC395ZryFy3W3t3yqqF1SkFy0qa1xCrW8GFn2yF98JrWUArsYka1DJF95ury8Ww4xAa43
	GrZxuF47Z34xXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREFAp5UUUUU==
X-CM-SenderInfo: hlpq3yxhps35i6rwjhhfrp/xtbBgBkKAWkcOQnD7wAHs8

This commit adds a pre-check in ASoC to ensure there are non-zero CPU or
codec DAIs. It also handles early failure of memory allocation for
rtd->dais by going to the cleanup path, preventing potential issues
from invalid configurations or out-of-memory situations.

Signed-off-by: jempty.liang <imntjempty@163.com>
---
 sound/soc/soc-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 4297cc27005c..e4b21bf39e59 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -545,6 +545,11 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	dev_set_drvdata(dev, rtd);
 	INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
 
+	if ((dai_link->num_cpus + dai_link->num_codecs) == 0) {
+		dev_err(dev, "ASoC: it has no CPU or codec DAIs\n");
+		goto free_rtd;
+	}
+
 	/*
 	 * for rtd->dais
 	 */
-- 
2.25.1

