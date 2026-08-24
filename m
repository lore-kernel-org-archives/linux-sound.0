Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB483E5EC2;
	Mon, 24 Aug 2026 06:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787553415; cv=none; b=ugJ030K4JDY6KlhE8AOz43XXmg/mnCdGdeYd6Q77jZBsonE2kb6H0O77TiqkdCDqmaVvbTFO591UXezYG/ZKOYhzjxBofthqJLBObovxnkFM6adz6ARX39qp7Yvi3JJSCWJr/QNvaFVq2ti5rcfLGDKBpYI4q1JXLUyk2P15WsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787553415; c=relaxed/simple;
	bh=dZukYpKH6t5eiurBI2eef6dDZJVBPpfKep8nn/vX7VY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nBYNc1VTxytddsbwX20S/Ie1cqLcVVOCPKoSKTIRhReYFa73hUxsYnCUPQuTFEgZoSxIpCdeMUaQx3bOQdoYcrnppKCyd+RjHNRJqQru2BpKJLhKi0dtRF/Sg1IuKhj2kF5fnixhsjxmQtaJYGp/cn2JPnblKEEQJdPAwpfqS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=o+6C3N+v; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="o+6C3N+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=At
	SvTifHpmKxJGgkxiD807a6Wky4viwbYXEzAW9IPxY=; b=o+6C3N+v8mFJFN2aVr
	oEFmgLK7WPvPF93sfIJNpbvOfMH+MyfLqmZu8b9zb2Gjrn5bz/YA2tryqclyHWXh
	C1qP6OLkeLrkFGcKs/AX5E8858Qc6XdgpEmzmKNCwKBfkFcIyQRtNRIQMLfM6xPE
	or3bKJHgK0CrdxIg82uW3o0QA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDHF_5K5otqcu0eMw--.50922S3;
	Mon, 24 Aug 2026 14:35:59 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	perex@perex.cz,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng@kylinos.cn
Subject: [PATCH 2/2] ASoC: amd: yc: fix memory leak in acp6x_pdm_dma_close()
Date: Mon, 24 Aug 2026 14:35:07 +0800
Message-Id: <20260824063507.483784-2-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260824063507.483784-1-wangdich9700@163.com>
References: <20260824063507.483784-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgDHF_5K5otqcu0eMw--.50922S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr4ruw4kWr1rZFyfAr45Awb_yoWDCFg_Cw
	4S9w1kXayUAr4Yy3Wvyr43ArW8CryxGryvkrnrKr17ArWagws3Cr1xtFZxuasrWrn7Aan8
	uw1YqFyUAa4kCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRMHUDJUUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvw9KmWqL5k9VWgAA3k

From: wangdicheng <wangdicheng@kylinos.cn>

acp6x_pdm_dma_close() does not free the runtime->private_data buffer
allocated in acp6x_pdm_dma_open(). Add the missing kfree.

Fixes: 7610174a5bfe ("ASoC: amd: add acp6x pdm platform driver")
Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/soc/amd/yc/acp6x-pdm-dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 710db721ffa4..40c4d833f4ed 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -275,9 +275,11 @@ static int acp6x_pdm_dma_close(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream)
 {
 	struct pdm_dev_data *adata = dev_get_drvdata(component->dev);
+	struct snd_pcm_runtime *runtime = substream->runtime;
 
 	acp6x_disable_pdm_interrupts(adata->acp6x_base);
 	adata->capture_stream = NULL;
+	kfree(runtime->private_data);
 	return 0;
 }
 
-- 
2.25.1

