Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1D038422F;
	Mon,  1 Jun 2026 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780298790; cv=none; b=AxaaOKTehrJUvbE50H6kuniACjPX817XKr0tIU6SWqfrBP73qELKOnO2qhvFN+UGRf5vduwSADxZ/RcNMAVFqcn6mpRfVUzgfPP1NahqY5ucnSJsNTubWzdWR8bPq6G0bICvMzgBSFwfKIRYLayuAO7ju0Xa1Y3HYQ2ixbDdUuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780298790; c=relaxed/simple;
	bh=xz78xep66OnAklmvNMlba7HczO/Lf1BojPWJKrsplf4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LcZZgYLTx5JHjq2iwU98zuQFVkwf7Wm5gBTjRdakNFtqqn6SAbOk/8LJBaA9id4ftmIg6j1HEu3PD+H9yL4sNEpwbNueOCpyWvuZhjMIB3QUTamIsnOfPC0OjVtrVi78DDhAb4ME5m6Dok2OeM02VF7pJGfT6dljufy2CjgfYTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CMaPLh/R; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CMaPLh/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5z
	8gy6QQhAqv7RfVM2cPlQ7mNMgRxtqE3/krJQIWk8k=; b=CMaPLh/Rq7KfSojhD6
	DVm3WRNUJ4yeUt3tI/meLHCFz30CERLQveP549SI7XhLf//z+QG6xb4TWsmtfUJ4
	AB3S6fw0M9P/S936WKYEGQfLIeTN3Mh4FwP2vrj/BjwmdIVqSngZUWTnAW55nsDm
	ewO+51N6nqieJiVrd5dbl+9aI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnr7EDNB1q6h_WAg--.18S2;
	Mon, 01 Jun 2026 15:25:59 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	wangdich9700@163.com,
	broonie@kernel.org,
	wangweidong.a@awinic.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ASoC: codecs: Use sizeof(struct) for aw_container allocation
Date: Mon,  1 Jun 2026 15:25:53 +0800
Message-Id: <20260601072553.150487-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnr7EDNB1q6h_WAg--.18S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF13Kr47Kw1kXF1DXrWxCrg_yoW5CFWxpF
	n5AFZ8tFWUKr45ZryFqF48ua4FkFy8uF47X34jy343A3W5t34kWFs5Aa4UZFZ2yr95KF43
	Way7XFyUZws8Xw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRFJPZUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5wfvP2odNAftJQAA38

From: wangdicheng <wangdicheng@kylinos.cn>

The aw88395 driver and its variants (aw88081, aw88261) use sizeof(int)
when allocating memory for struct aw_container. This should use
sizeof(struct aw_container) instead for proper type safety and
portability.

While sizeof(int) and sizeof(struct aw_container) may have the same
size on most platforms (both are typically 4 bytes), using the proper
struct size is the correct approach according to kernel coding style
for structures with flexible array members.

The standard pattern for allocating such structures is:
  sizeof(struct) + flexible_array_size

Fixes: 62fc25fbab5f ("ASoC: codecs: Add i2c and codec registration for aw88395 and their associated operation functions")
Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/soc/codecs/aw88081.c         | 4 +++-
 sound/soc/codecs/aw88261.c         | 4 +++-
 sound/soc/codecs/aw88395/aw88395.c | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index 8c5bb3ea0227..01e8610a8009 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -1148,7 +1148,9 @@ static int aw88081_request_firmware_file(struct aw88081 *aw88081)
 	dev_dbg(aw88081->aw_pa->dev, "loaded %s - size: %zu\n",
 			AW88081_ACF_FILE, cont ? cont->size : 0);
 
-	aw88081->aw_cfg = devm_kzalloc(aw88081->aw_pa->dev, cont->size + sizeof(int), GFP_KERNEL);
+	aw88081->aw_cfg = devm_kzalloc(aw88081->aw_pa->dev,
+				       sizeof(struct aw_container) + cont->size,
+				       GFP_KERNEL);
 	if (!aw88081->aw_cfg) {
 		release_firmware(cont);
 		return -ENOMEM;
diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index a6805d5405cd..7fcb3d7ec3fb 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1111,7 +1111,9 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 	dev_info(aw88261->aw_pa->dev, "loaded %s - size: %zu\n",
 			fw_name, cont ? cont->size : 0);
 
-	aw88261->aw_cfg = devm_kzalloc(aw88261->aw_pa->dev, cont->size + sizeof(int), GFP_KERNEL);
+	aw88261->aw_cfg = devm_kzalloc(aw88261->aw_pa->dev,
+				       sizeof(struct aw_container) + cont->size,
+				       GFP_KERNEL);
 	if (!aw88261->aw_cfg) {
 		release_firmware(cont);
 		return -ENOMEM;
diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index dd09bac652f7..b4ddf9ac9ca0 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -475,7 +475,9 @@ static int aw88395_request_firmware_file(struct aw88395 *aw88395)
 	dev_info(aw88395->aw_pa->dev, "loaded %s - size: %zu\n",
 			AW88395_ACF_FILE, cont ? cont->size : 0);
 
-	aw88395->aw_cfg = devm_kzalloc(aw88395->aw_pa->dev, cont->size + sizeof(int), GFP_KERNEL);
+	aw88395->aw_cfg = devm_kzalloc(aw88395->aw_pa->dev,
+					sizeof(struct aw_container) + cont->size,
+					GFP_KERNEL);
 	if (!aw88395->aw_cfg) {
 		release_firmware(cont);
 		return -ENOMEM;
-- 
2.25.1

