Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2A217BB1A
	for <linux-sound@vger.kernel.org>; Wed, 28 Aug 2024 12:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724847632; cv=none; b=l9Z08Mp4m8nXKMA2cmbwCEGMIz74CCwEnKYVraDUMg9P2TSdRtftQrv2Hh5ME2Qigk+MSDWTjAWuWgmqHP3jmrEguD2yY4CXmz5HbFLJsj3LNc8yyCcGh4yDrM4rX+0sNLEbWN9ICZUYi9vOaFHkFXgmw0RQw/WOTLphQTcf6hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724847632; c=relaxed/simple;
	bh=c15YKLZ7spRIIf+WjYrcy1fC29f+stI3FEwGzRYCw4c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q/iJaad2EtdXVWJq49BcKRyBCx8sWAB65yyJEsmDuuifYBMdRfpdi/vvDRYadY6wxQWOzMQhGPZQvsS4DEW4n+D0I95PlfF/E62y7ZmsAC3ZzHSJ8LmdD40twU+55S8daG36m6GmA/RRm1vRn5g7SDoQqiO3xH5dZ4S+GngBzkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wv3QS39Wlz2DbZl;
	Wed, 28 Aug 2024 20:20:16 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id D53D31401F2;
	Wed, 28 Aug 2024 20:20:27 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 Aug
 2024 20:20:27 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH -next] ASoC: dapm: Use IS_ERR_OR_NULL() helper function
Date: Wed, 28 Aug 2024 20:28:29 +0800
Message-ID: <20240828122829.3697502-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)

Use the IS_ERR_OR_NULL() helper instead of open-coding a
NULL and an error pointer checks to simplify the code and
improve readability.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 sound/soc/soc-dapm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d7d6dbb9d9ea..ad289f91b13a 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2254,7 +2254,7 @@ static const struct file_operations dapm_bias_fops = {
 void snd_soc_dapm_debugfs_init(struct snd_soc_dapm_context *dapm,
 	struct dentry *parent)
 {
-	if (!parent || IS_ERR(parent))
+	if (IS_ERR_OR_NULL(parent))
 		return;
 
 	dapm->debugfs_dapm = debugfs_create_dir("dapm", parent);
-- 
2.34.1

