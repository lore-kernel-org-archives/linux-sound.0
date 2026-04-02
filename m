Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADFA2459C6
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 02:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097386; cv=none; b=lPbALo5bBAJJlq/KlxyA5QQTarOKS0cEWcSULjN85/GHr6bWYqDvrc+kT1iniFu8GtyxkS3jNgLHgwDSsHTYXYWIaymxeDXSHmokU+jagkDxIWN3Z+uzOzqK/rRXzynip9VEiSvhsMQPikPKp0qka4nf4FdjxSvDbeNTqwpKnhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097386; c=relaxed/simple;
	bh=iQ5ZElz3G+ZRSJze8FXSr0FWo3shS+08s/GEeBLglok=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L5QXcChhwLGo7L5CD8qtvmQq0RWLPG06o6ErePVK5rtMsAzp+Cc9hHl9PubjX2duENqCO/2a0WylsAxA9IyOyYJ1hGstj0m/wbZJOpszd93dihY5ybd0ZIvE7cNbxxwDynBy6jKvBmP7d9gcul9kXgn5hS0NYcVOpv4836+3to0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=H8kd8XL6; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="H8kd8XL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=7J
	+dR7G2ZwdJFrgmRcucs3xi/eCZ39y2ZwJePoQmoQM=; b=H8kd8XL6GlOyGzuzwJ
	aQpxvdWZOBYJKMZnxgXVC2crxnMzntosUghyyC+sCICJ79TMM3AJV0U+zWH7GyvV
	fbemr2K0G6blk/sroVgac2KZSuvKAaixXn80KPyxUFNUa8NtkAq3Zj74ljsOS7nR
	3fcKS+B5/oemKr0zcfMjQkUq0=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCHT17_1c1pSbKPUw--.122S2;
	Thu, 02 Apr 2026 10:35:44 +0800 (CST)
From: wangdich9700@163.com
To: johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.com,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH 1/2] ALSA: aoa/onyx: Fix OF node leak on probe failure
Date: Thu,  2 Apr 2026 10:35:41 +0800
Message-Id: <20260402023541.54476-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgCHT17_1c1pSbKPUw--.122S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrGw18Xr1xAryUtw45ur1ftFb_yoWxWrX_JF
	4I93yv9FyrJF47t3yUXF4Syw409r18Cayj9Fn5tr17C345tr45uF1xtrn3CF1kZ3yI9F98
	XF1kWw1UG345CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRCeHD3UUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwACD0mnN1gAHggAA3m

From: wangdicheng <wangdicheng@kylinos.cn>

Add missing of_node_put() in the error path.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/aoa/codecs/onyx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
index 04961c456d2c..fea12d3a06a9 100644
--- a/sound/aoa/codecs/onyx.c
+++ b/sound/aoa/codecs/onyx.c
@@ -985,6 +985,7 @@ static int onyx_i2c_probe(struct i2c_client *client)
 	printk(KERN_DEBUG PFX "created and attached onyx instance\n");
 	return 0;
  fail:
+	of_node_put(onyx->codec.node);
 	kfree(onyx);
 	return -ENODEV;
 }
-- 
2.25.1

