Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F027530F938
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 02:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097395; cv=none; b=PKn3x1ciQpUJP0QYsHXQWRlq73vd/V3RG6WqFhXauCkdjyl46lI1e1p7l4m4hLb/zcrcEj6eAiJhd+jGqR2OWOt+rNvzgMzAx2kOolDcZTKrNFbsvBtQTEM4KZHoP+nR7rR7C0jAofIdQ2SvYF795obi8Tt1u6Fl9w3+vS9TmpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097395; c=relaxed/simple;
	bh=6mkwvilQcsygwh2IucHpBxBi0Kk4TxPEkP76o579KNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GT/4lQtaZxxsjW1b7hZk7AKj1N7gsLTuye1r4mT+zukJzlVbRYDEzl2wscJPCmN5nCbxcH/Syw5t1GqTzAcvASJQ8nAGoWV1tN8zAYRxWgdi+cpQjv4ZYLJePiN7/WDTLZglwYgRFt8kejcSeXyV/7yHLlOTkeYKej2tZyRT9UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZMlz2OSe; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ZMlz2OSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=wv
	qvjqTWaQwKfw2mx75SrsBCfuONkI3REDQAjb+0vVI=; b=ZMlz2OSe2x8o+pXQGn
	SFebV1f5G9IvBD2iabf1avYJ/O+RnmMI20/46joruqAZ0JdMY1dYhMqzk8KYVVJR
	GXc1SNgwaIg9nSFxlCSA1JsHMm6rpghdRgyYsacCFtiojMJ2VUu3Ti3Kilahgnv3
	ot5fcg/qt2SRKJfdcIljar1BU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wBXHgcW1s1pWpsxCw--.20813S2;
	Thu, 02 Apr 2026 10:36:06 +0800 (CST)
From: wangdich9700@163.com
To: johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.com,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH 2/2] ALSA: aoa/tas: Fix OF node leak on probe failure
Date: Thu,  2 Apr 2026 10:36:04 +0800
Message-Id: <20260402023604.54682-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXHgcW1s1pWpsxCw--.20813S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjTisqG6DUUUU
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5xaI12nN1habiQAA3Y

From: wangdicheng <wangdicheng@kylinos.cn>

Add missing of_node_put() in the error path.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/aoa/codecs/tas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/aoa/codecs/tas.c b/sound/aoa/codecs/tas.c
index 13da2b159ad0..25214d3da65d 100644
--- a/sound/aoa/codecs/tas.c
+++ b/sound/aoa/codecs/tas.c
@@ -872,6 +872,7 @@ static int tas_i2c_probe(struct i2c_client *client)
 	return 0;
  fail:
 	mutex_destroy(&tas->mtx);
+	of_node_put(tas->codec.node);
 	kfree(tas);
 	return -EINVAL;
 }
-- 
2.25.1

