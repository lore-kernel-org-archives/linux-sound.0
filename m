Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B9518DF72
	for <linux-sound@vger.kernel.org>; Tue, 10 Sep 2024 12:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725971840; cv=none; b=MsR9cPJcI7ocUpn52dZauMqzHJG+aaQ53/USVTzyN+kZFUnLBGUjyfoVk/qFAJbBS9XyG++wGmuF2hV/WHInqAcfiSS5C4u/AeYRoYAA+X4xuVkDCvW324WZkJgi3XvekCpdc5ISm9wtNyJ6kmrpNqzyNaZi1CzfUo3DzElGHj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725971840; c=relaxed/simple;
	bh=rWXS0WqumTAShTx4umJMc9bJv8yoWmdyeL6Ezpr20vQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LvWpwBwP1ClZdk04UFf2M7fHnMHyU1rLQu4ugB4kpTQPBlzkVRrcFzOKg/nEazn03QY5Z7Ss1fVexzj1EGTfXEr21CHmdAWSZUuoUZ+9CnoFBw/IeztG0g9u7AbnV2SrzJjJrsIXMa0OP+OsHyStBdjAKTBqqnl95WKBbQ1g36s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4X337k5HZXzpVff;
	Tue, 10 Sep 2024 20:35:14 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 9410418005F;
	Tue, 10 Sep 2024 20:37:16 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 10 Sep
 2024 20:37:15 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <jbrunet@baylibre.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <linux-sound@vger.kernel.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH] ASoC: meson: Remove unused declartion in header file
Date: Tue, 10 Sep 2024 20:23:30 +0800
Message-ID: <20240910122330.70684-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemf500003.china.huawei.com (7.202.181.241)

The declaration of aiu_fifo_hw_free() has been removed since
commit e05cde84eabc ("ASoC: meson: Use managed DMA buffer allocation").
Let's remove the unused declaration.

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 sound/soc/meson/aiu-fifo.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo.h b/sound/soc/meson/aiu-fifo.h
index 84ab4577815a..b02cfcc4de7f 100644
--- a/sound/soc/meson/aiu-fifo.h
+++ b/sound/soc/meson/aiu-fifo.h
@@ -38,8 +38,6 @@ int aiu_fifo_prepare(struct snd_pcm_substream *substream,
 int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
 		       struct snd_pcm_hw_params *params,
 		       struct snd_soc_dai *dai);
-int aiu_fifo_hw_free(struct snd_pcm_substream *substream,
-		     struct snd_soc_dai *dai);
 int aiu_fifo_startup(struct snd_pcm_substream *substream,
 		     struct snd_soc_dai *dai);
 void aiu_fifo_shutdown(struct snd_pcm_substream *substream,
-- 
2.17.1

