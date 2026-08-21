Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B4817A314
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 12:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315344; cv=none; b=XodFpmV5ftfw1CphIvaqUKkky/GicURosOgJvmps3yNvHY7JVzdOc/aDitDvK3ntUNxouqQGj0aVGiwK41j9Gp4kMOUyMzG8KAXmLLrlqYJT/YUvvNpSgWj4WdqjpfuI76hJ6MR3S4BUekq0o0PrMfYD+00Bx51bcqaJz+nqlwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315344; c=relaxed/simple;
	bh=5KktxiklsF/0QCkN3dKJ354QFQXWmjZRHfGMH6yZW44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/iKeR8+mbQ6f7clvGO1VxJFbomcJ0g7JRpY2s/+ljeEe8+Fv4jk4wgfbO4kWiGlq9mBg6QFYsZGWhp0uZwUrq+Wcv+Ix0gHC9pAG/fRSUtQAU14L6n3whbQLxIOJeI8NeVbabhL34/dyDku87p3FiznrGR6WSuvQ26A86+Bb7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqIBjrux; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqIBjrux"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ce98cb8165so8020595ad.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 05:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315338; x=1787920138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EdEJgY9D5VmAtVYQAvmQy6QO5FD2ftLDiJehs4hR10=;
        b=RqIBjruxWSEX+t9H9aOzZgXh9Jk8lVGcWZWJxcHmnjPCbb/2CMIqwUftJDsG/jui8k
         WUOmPb+djfmaUJVfH/JVZ0qQua0tG9FFYEQEK8Z+2NjBbf5RLxr/+GKvpGe4r85PL7U0
         Bgarc1NIejHzxB9m7P7Op+LaFKCam7J5jqSrNMWdA3WDVI64R6wairW560PplTm9QMSZ
         lYZ9b8faSOebj2WsY8rvuwxuT9tvvDFcYuleWGxvDWKPyzlORU8gtN+3VCFJHyxKCe/o
         UUztpIl4IgKO+kufsYva2mWMr0c9rEobSmo6tIWH9wazl4iKN2qs7U6cO14x21wPNq9t
         HA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315338; x=1787920138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7EdEJgY9D5VmAtVYQAvmQy6QO5FD2ftLDiJehs4hR10=;
        b=HUgLqjaPx9cD3I0HtyB1EiTPTMoQVnuprz6wO06LMZlGzfUwu+ZugZPyJ/a2s0+Wlq
         1XYjo8ih2RfM3CqkUUOMILWpLgNIm0pcrN1tekk+Nc+/nArkijDoteJSN9bL1kDdEVoq
         ZmCLFXZZkMUoPcv6lyFijhEPPgUlsTKKxewSW8+TIp2XFVvEAXXLc+UKU0TtNfQysDzm
         7eu9V8Ew9Wo/qEu+uPgIUGQ9F8Tzx/a1yMUko92gKzZczw+mhGDPdtlQAC2ahcvLskWo
         FOxHu1581Li64JIet8cMRwLGU9A2y/FDoAtt4bcz+nla2a9rzn0QLlqUs24AErQtWEpR
         H6Og==
X-Forwarded-Encrypted: i=1; AHgh+RqWcBN/fMb+EDc0BPfBBkbGvx1y4V9Bj47waBAegltIDDIpjtVqqLJj9yfUB3WqpVwNlF5uVL+1LaGdvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuAWojI6DvmgaR/BhoProKZPeOEQocV5iNwU6e1jfIi+uzRIYY
	txNAoMKUzYpzu+/v38gBupoZVxCMtKjctgiMrYflxSi+x0B9RCm7XHbv
X-Gm-Gg: AR+sD11a+jWVMCA5yQ+Jdpk4UEJ4s0URxxfEZsZ0P7U5T6MbZWVFZUAHMyp68uYbQES
	UM9rSJq3aP1IEYZehW/KjUGjVnx/MxCPn7b9y8ixUY8n2+viD0aY+58/sh9++xJgOmKJEipSgkL
	/6GtAqJCJaM9mzqzd+cvCHGDI1qyt1UzHQK38pESguM2ycbSvhM55+UFM8GTPUWwtbr11YhOhpj
	OviIbYnuNVhrqmXpKbM/CYO+QGl+qeB3UfFp704LJ7nRPqVRJh/w6WaVEOeKzyCcS5n92sQD+Wa
	V7BuYZvBD/1XIG6qSoB2ISPj+wAZ4njuaJ7U4HOpaTnZtBEB6Qutl+Cuq2TUxPaVZZmOckyIn23
	pZ6/9NgRKsMODW6dq+qoguZ56hcj3w+lmF15k09x4NMTMNiSWfZ8ysF1RStwLS93n1Lx0rtDVLg
	m5dxS5cjMAv0dsuVY0Zb27oiRzYjm1/IEZmwdqIfAI9+RAmTEDejXHKLm4zm5OTB/N8ZKdz0nWs
	063E7YKIfm+vHwDpI4MTuce/0P3+l4OOXFS84gfUj/7Mmonv2z0Z90H69uAnb9KBcjAiWudxWMO
	i19gmgPYj3sWNgE=
X-Received: by 2002:a17:903:1aac:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d61a15e594mr181843635ad.10.1787315338494;
        Fri, 21 Aug 2026 05:28:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d554450sm18134515ad.2.2026.08.21.05.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:28:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 1/3] ASoC: mediatek: mt6797: fix wrong unwind order and error code in enable_clock
Date: Fri, 21 Aug 2026 19:28:38 +0700
Message-ID: <20260821122840.41266-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122840.41266-1-phucduc.bui@gmail.com>
References: <20260821122840.41266-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The error paths in mt6797_afe_enable_clock() use incorrect goto labels,
causing clocks that failed to enable to be disabled during cleanup.

Fix the goto labels to only unwind clocks that were successfully
enabled, and return the actual error code.

Fixes: c5e7fca928d3 ("ASoC: mt6797: add structure define and clock control function for 6797")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v2:
 - Update the subject prefix from ASoC: mt6797: to ASoC: mediatek: mt6797:.
Changes in v3:
 - Add Fixes tags.
 - Add Reviewed-by tags.

 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 6f3e6acfcfab..0ac04d73b777 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -63,21 +63,21 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD], ret);
-		goto CLK_INFRA_SYS_AUDIO_ERR;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_SYS_AUD_26M]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD_26M], ret);
-		goto CLK_INFRA_SYS_AUD_26M_ERR;
+		goto CLK_INFRA_SYS_AUDIO_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_TOP_MUX_AUD]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_INFRA_SYS_AUD_26M_ERR;
 	}
 
 	ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD],
@@ -93,13 +93,11 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD_BUS], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_MUX_AUDIO_ERR;
 	}
 
-	return ret;
+	return 0;
 
-CLK_MUX_AUDIO_INTBUS_ERR:
-	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_BUS]);
 CLK_MUX_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD]);
 CLK_INFRA_SYS_AUD_26M_ERR:
@@ -107,7 +105,7 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 CLK_INFRA_SYS_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUD]);
 
-	return 0;
+	return ret;
 }
 
 int mt6797_afe_disable_clock(struct mtk_base_afe *afe)
-- 
2.43.0

