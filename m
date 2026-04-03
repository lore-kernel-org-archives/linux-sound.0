Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5681D61BC
	for <linux-sound@vger.kernel.org>; Fri,  3 Apr 2026 01:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775180908; cv=none; b=K4K6sUvaA/WPfaIJe6c1wsiaJR4qUdo2/cJwo+Yqon8ACj1uWE879jm6TwYKglVDyLUJ25ORevcelchjedVXq00YQTsE8y0hD0buuGtiBbETskZkMhROeY811B68X/juhfEgpGm1SGip+9h4jWSejzm3gTbr21pVX3pDRKvucTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775180908; c=relaxed/simple;
	bh=X9Z51RB+KfkwX3A1kCeHp9OlR+aN3HrdBbzoxxO5eVc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ATf27oioOoV86fbkZbCwO5D48cDiVZx1InTfc0aTvQ4bZzhH3ZFNzvu6UUcbGalSrgON3288Q9qOPq+gFx+CMs53q+Nf3IpwUrH+a+Ncvtesg038MQSaa+kYy8K5mCjJbWUWwaFw5KN9Ixds5vLxNbh532r1VLGJTFMCTMJmcWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JmWex4Mu; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JmWex4Mu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Bj
	V3zxihmqtsHZ19nXPiN3UVuXXarr2GiOFicubZu5E=; b=JmWex4Mua9Xg4/86TY
	zcwXRxtax+2rLvsfBAqbisZHilh2k1Q9wXQW09AYr2ilb18n937Mw2enT7rM/z/Y
	KOC8+ll+res7BrGkNY1g/GgswlA9piJ4lnare4P9yKZkGMQlrBYM9Tt+VkmtC+i/
	Hwl81/BkN+SCV6K8ki3CruJ8E=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBnZAE6HM9pTfLWCw--.54645S2;
	Fri, 03 Apr 2026 09:47:39 +0800 (CST)
From: wangdich9700@163.com
To: johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.com,
	wangdich9700@163.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2 1/2] ALSA: aoa/onyx: Fix OF node leak on probe failure
Date: Fri,  3 Apr 2026 09:47:36 +0800
Message-Id: <20260403014736.33014-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnZAE6HM9pTfLWCw--.54645S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr47JryxtFW3uF18Cw4Durg_yoWfZrX_JF
	409rZYg34rKr4xCw4DXFWSvw1v9r18Ca1S9FnYyF17C34rtrs8CFnIyFn3Cr9rWryIkFy3
	JFn0qr1UGrWakjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRqPS4PUUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5xtjsmnPHDsfiQAA36

From: wangdicheng <wangdicheng@kylinos.cn>

Add missing of_node_put() in the error path.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---

v1->v2:
onyx_read_register()--->goto fail--->kfree
aoa_codec_register()--->goto fail_put--->of_node_put + kfree

 sound/aoa/codecs/onyx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
index 04961c456d2c..da0eebf5dfbc 100644
--- a/sound/aoa/codecs/onyx.c
+++ b/sound/aoa/codecs/onyx.c
@@ -980,10 +980,12 @@ static int onyx_i2c_probe(struct i2c_client *client)
 	onyx->codec.node = of_node_get(node);
 
 	if (aoa_codec_register(&onyx->codec)) {
-		goto fail;
+		goto fail_put;
 	}
 	printk(KERN_DEBUG PFX "created and attached onyx instance\n");
 	return 0;
+ fail_put:
+	of_node_put(onyx->codec.node);
  fail:
 	kfree(onyx);
 	return -ENODEV;
-- 
2.25.1

