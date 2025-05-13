Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09C423957D
	for <linux-sound@vger.kernel.org>; Tue, 13 May 2025 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747139895; cv=none; b=iV5Cwl6DHU8d+TnQ870JPkoVIB8Aa0NeHJX7tTgsMiAgYgZgGGYMeskNg1Gfq2Il+CVGgSR4HCqwwxifBt8QOgmFF83jFYOh/yXeDswVIE8h9VWlQMzQRKDwJ064aYhoUiHRbrM6Kv1SxaWdDPJLC/v0z8ekFU9Zj15hIG2kOpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747139895; c=relaxed/simple;
	bh=YW+a3yKluG/1mSqHv5XFI6/4dQC8zaixgzpccScgqxQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FPsMB/EDyXYnlwjHtn416Ep8hRwUuZ7JWkpqx29S7clC7kelTmhWPIyoFGsPxnsS7zrj4VJOP8qcOk0poNnv6GIYTf/ZDD/GdgECAPZd7AogKdb6NE+rgU/e4s85gK+ng2jObvxRakSOD+MAphlKXcWHf98+irchLuoL4/n4OYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cYOd2vjt; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cYOd2vjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=V+
	sjHsv3k90DpJphQagDJgIHqpnduUHckm8AU4fMR8E=; b=cYOd2vjtf9B9OFu4b+
	xJsxFOn3Pv1CoZZ6Ur5Ir56h91vxU7qO9rkKTUqEmUkrRHY2X5XH/WjfHwDeMejb
	ss9FBihiCFVzBycCC3/toCy7k4UF0jiiU85P0pWzuaEhVSkpITVwZjwCdLUUJMVK
	MVKZCKj0qyvCX0GVX1ZtXcqQ0=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCX8hsYPSNoPWObBA--.21855S4;
	Tue, 13 May 2025 20:37:49 +0800 (CST)
From: Yuanjun Gong <ruc_gongyuanjun@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Cc: Yuanjun Gong <ruc_gongyuanjun@163.com>
Subject: [PATCH 1/1] sound/soc: Add check to of_device_get_match_data()
Date: Tue, 13 May 2025 20:37:44 +0800
Message-Id: <20250513123744.3041724-1-ruc_gongyuanjun@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCX8hsYPSNoPWObBA--.21855S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw4fGw1kCFW3CryftF48Crg_yoW3GFb_Gw
	4xWw48Xry3WFW2vFn8tr4ayr1UJrZxKFn5GrWxtws2g3yUZr43ZryDGrnF9FWUuws7AFy8
	Xa4qvrsxtFW5KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRAqXHUUUUUU==
X-CM-SenderInfo: 5uxfsw5rqj53pdqm30i6rwjhhfrp/1tbiNxZM5WgjNvOT8AAAsl

In tegra_ahub_probe(), check the result of function
of_device_get_match_data(), return an error code in case it fails.

Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
---
 sound/soc/tegra/tegra210_ahub.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index 99683f292b5d..ae4965a9f764 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -1359,6 +1359,8 @@ static int tegra_ahub_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ahub->soc_data = of_device_get_match_data(&pdev->dev);
+	if (!ahub->soc_data)
+		return -ENODEV;
 
 	platform_set_drvdata(pdev, ahub);
 
-- 
2.25.1

