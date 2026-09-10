Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7154F47605D
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040645; cv=none; b=AdMEs5tFQyfq0lpUFF5Q/Ky1oBgT3/gxeqm9aQXwhJMMmwdcrwMlmyc3u+I4lESlFOsM/X+1sXFrJvu2xxZrefE3lNhaUyeaecb3H/xC9DtsFYwHFfYkGqqQsLFAAG9kyAO1of6+/eB1ROILBkiz6c6eRTu9I0B+kg/zuldg2oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040645; c=relaxed/simple;
	bh=PWJqb0oR0SEFtUil+dz679UOpPkGYh4mN3pxmk0E1Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAIfdDkBNj8yDK1zr441e7Ib5iS5Mi3aOtRaDZtWhpGf+PxoY9OYNZjYBRW/Z0283JBBtJk0mcyv7IWWP26aT4gbbnM91oSTCCm2j1PfFw004bmEv28fy77iNhq6FElYgGwCnUFSb0XEbdr74NdVQoBd8NEPdJ9udiBZ4JdDjJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3YCYGr4; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3YCYGr4"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca06b03so13178865ad.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040642; x=1789645442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jEjcaLeodosmHYaYiyTfEDLf32OqTBL16rI4GMqtRw0=;
        b=B3YCYGr4ucbwpbDiS8Nt4xwKx4hqkqH7K4yW2/IuEkwhEV01ZQSQ5RZcGHemIMrbUN
         t886S2021BHWWRz41hVl0y1PMi0k1jlDCl79xWB+WWwIu/YalYxnxh4f3KAFFvAeyu+4
         3s28cp2YVFc6JuBlx2r5ddYHV+7qJZzo3q4GsDg0e+MmoZHcI76OwUcFcM452Ker0ezx
         zapxrRFCeAeQ3IMy+E764UP+6Lm33gd7VpDAaZeqmI9/lRUjLwTeQpwlDQKRVc9y+d9q
         hlMw0wyqV3lU27g9lkFayvm636EYvCVC7A9CWR9ysYWeTsDuszcaMKHHCMCtxDtonGx/
         cNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040642; x=1789645442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jEjcaLeodosmHYaYiyTfEDLf32OqTBL16rI4GMqtRw0=;
        b=pWTdD/YdYgtOwgAk1R/bjBTk/b0TAf1y3JIVCui5eteXFbU6ZjH++cjb7rkCqPpx4F
         xT/iF3mUQQhJMdU+pNZTsQixSECfp9nxEc31Fq9xpOX13qVS6LGga6kS0kcN4FvK8olG
         j9qmkGgrFBu3oQ8edKuXnLMsQVzYc2itOhbJA8O6G/S8/zXGdtDjaCjQvuPKNoXof+gD
         42ooKSFp117s5tHaPS0Tl0d6zj1xzEEyF8DEdur2aMq2u7Oyu+o7p7A7gjex99gXEmHh
         i9CHY7zklKYsHrUngLxFQYtL9FYySrrjnTVX7zbo8Hwqw86I/ysKkgsYNSpKGaG1fZr2
         kOsw==
X-Forwarded-Encrypted: i=1; AKwUvByaNGZldX+6RWThAc2mPl2sviTYmXaODr3srB8ej8sF5eLFBHPcBCWqf4iEt4uknSyV+VSNSlnJ4evAmQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mLpC9CxkV7/am4EbD5yrYMZm6DcGF4+6X7TxibutJ0yAURhpeC
	LsbfkAFHP0iwaDT/21SefUKMcZxvx2jeeuQolYuX52EdIdyMka+hNO3W
X-Gm-Gg: AYBFou07r0EffRn4aYlc6TRL0cklnXk30eP/Gi/8COWLF5cEI9VK1NonIEFkM9RPMkm
	+H+8VEIxYP61KJSai9B9NFNOHt7CsCyelIwD08DRPdZPE8yG0DLPb4cMM4iOXl5oGa4Ks34qBnu
	af3nNoqK/EoYfK4fsgwxDj0YDjRKV3Mp0G4JF7h0eiwWIrD8y+fG56Pd44qY3syy1AsrbaZ1vpP
	mpzW8LR/khVCAW6nKfxDeLEpGyCViKLKeZi/1b/rmguCm/otcV1xyKUlgcVc8jFJO0fkX3vDGIS
	q6gOsk7V3obqZfvsJRoEJ1WqzR4WqSd+ZwEADIU7DnglDWkFeYFrWJaUHyolVgLZHEfsJIIwEST
	5OXymQPEoiVQKdr8DOkYMF3DzTl4yPABA12zVt6RH+rK5chFuoZSn+6b/FgoqW4kYYSkMjTTjn/
	WjojfY8ETPQ4+WlKryvpErHEUjckp2P25zelrCGfwS5ZwKqzfmOwB5pyPdesdzLo9dmghMrBQCz
	kkrWehChP5tupOekdE5Gk9nU1U1ioK0cxB/CbrKJUDLUf3pVS6WLdgtb2WJB8M9HmlZrxQNN6yF
	BWmmpfYWFm98ZTuMLd8fub2dPg==
X-Received: by 2002:a17:903:1b6c:b0:2ca:12aa:a390 with SMTP id d9443c01a7336-2dd0dca9c9dmr43423175ad.0.1789040642448;
        Thu, 10 Sep 2026 04:44:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14959fd2sm87427155ad.23.2026.09.10.04.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:44:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Darren Ye <darren.ye@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: mediatek: common: Propagate PCM buffer errors
Date: Thu, 10 Sep 2026 18:43:38 +0700
Message-ID: <20260910114338.142682-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910114338.142682-1-phucduc.bui@gmail.com>
References: <20260910114338.142682-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_afe_pcm_new() currently ignores the return value of
snd_pcm_set_managed_buffer_all().

Return the error to the ASoC core.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/common/mtk-afe-platform-driver.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index c1869b38c9e7..84218d137143 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -151,11 +151,10 @@ int mtk_afe_pcm_new(struct snd_soc_component *component,
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
 	size = afe->mtk_afe_hardware->buffer_bytes_max;
-	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
-				       afe->preallocate_buffers ? size : 0,
-				       size);
 
-	return 0;
+	return snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, afe->dev,
+					      afe->preallocate_buffers ? size : 0,
+					      size);
 }
 EXPORT_SYMBOL_GPL(mtk_afe_pcm_new);
 
-- 
2.43.0

