Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C0515A86D;
	Tue,  2 Jun 2026 01:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780364252; cv=none; b=Myy8ep2V8UOBIMQEdRprvVs+FUqi4J1VOEavv9xMvpkkC/P3Rv2qNnSbXSHIQLm9fducBCIyMQR2sVwWuscH8bqkYb7K9bIfaj7w6QyYXZB2fFHbMzAx35hlTqwU+nnCaYDeHD5MYwjR8PuP9WJwjtt9wJHLe5cOO/ViGwdq3uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780364252; c=relaxed/simple;
	bh=CmPHlYtu3P9FJ7RgDn5BiwJs3yMYdZZTEEoWVJHey9w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OFtw9UT1ylc8aMsKRLJiB2qrs00dXTlwxBTQhq78nX4hX9pZHpvT2fUyZaSvcpbHQ7V8mZW0lPKhpyjQOQG375cn5ikvGCjUFPgvGoaCryt4Gt2oJ/O8TxiOTgaLMZgDOs2+1SoWBfwJwoF4M8ZSA1vWI/q3tQPIDvJySl9tX4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=dN2lOdd3; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="dN2lOdd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Sy
	+Oebbd+aF7mCSMMplBJuYfOqORMN6arHtP1ixVB4A=; b=dN2lOdd3XJEGYEP2e3
	iQj1UYGs4ydutCiaQYb2gk48PgKXqNSvlM56gRPdpYCmZmwlNbDRMfGMfoS4sgyN
	H6sVpB4zZGZ4bZnOBITd6o9XuHPhm4aQrRAu6ZB4/AkD9Ny/OJX5dvkjBtGkL25X
	W/jrjVZ42Ld8Z9rzpFbzjJu5M=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCntcu+Mx5q6qgEAA--.65S2;
	Tue, 02 Jun 2026 09:37:07 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	wangdich9700@163.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2] ASoC: codecs: Use struct_size() for aw_container allocation
Date: Tue,  2 Jun 2026 09:37:01 +0800
Message-Id: <20260602013701.38855-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgCntcu+Mx5q6qgEAA--.65S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF13Kr45JFWfJr43WryfZwb_yoW5CF4xpr
	n5CFZ5tFWUKr45uryrtr45Za4FkFW8uF47X34UZ343J3W5t34kWF4kCw4UZa92yr9xKFsx
	X3W7XFy8urs0q3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRaYLhUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC6AMfbmoeM8MsOwAA3J

From: wangdicheng <wangdicheng@kylinos.cn>

The aw88395 driver and its variants (aw88081, aw88261) use sizeof(int)
when allocating memory for struct aw_container. This should use
struct_size() helper macro instead for proper type safety and
portability.

The struct_size() macro is the standard kernel way to calculate the
size of a structure with a flexible array member, providing better
type checking and avoiding potential issues with manual calculations.

Fixes: 62fc25fbab5f ("ASoC: codecs: Add i2c and codec registration for aw88395 and their associated operation functions")
Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

v1->v2: Use struct_size() helper macro instead of sizeof(struct) as
        suggested by maintainers.
---
 sound/soc/codecs/aw88081.c         | 4 +++-
 sound/soc/codecs/aw88261.c         | 4 +++-
 sound/soc/codecs/aw88395/aw88395.c | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index 8c5bb3ea0227..40f1ed6f8a80 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -1148,7 +1148,9 @@ static int aw88081_request_firmware_file(struct aw88081 *aw88081)
 	dev_dbg(aw88081->aw_pa->dev, "loaded %s - size: %zu\n",
 			AW88081_ACF_FILE, cont ? cont->size : 0);
 
-	aw88081->aw_cfg = devm_kzalloc(aw88081->aw_pa->dev, cont->size + sizeof(int), GFP_KERNEL);
+	aw88081->aw_cfg = devm_kzalloc(aw88081->aw_pa->dev,
+				       struct_size(aw88081->aw_cfg, data, cont->size),
+				       GFP_KERNEL);
 	if (!aw88081->aw_cfg) {
 		release_firmware(cont);
 		return -ENOMEM;
diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index a6805d5405cd..4094ce8b7038 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1111,7 +1111,9 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 	dev_info(aw88261->aw_pa->dev, "loaded %s - size: %zu\n",
 			fw_name, cont ? cont->size : 0);
 
-	aw88261->aw_cfg = devm_kzalloc(aw88261->aw_pa->dev, cont->size + sizeof(int), GFP_KERNEL);
+	aw88261->aw_cfg = devm_kzalloc(aw88261->aw_pa->dev,
+				       struct_size(aw88261->aw_cfg, data, cont->size),
+				       GFP_KERNEL);
 	if (!aw88261->aw_cfg) {
 		release_firmware(cont);
 		return -ENOMEM;
diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index dd09bac652f7..1988ff62db3f 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -475,7 +475,9 @@ static int aw88395_request_firmware_file(struct aw88395 *aw88395)
 	dev_info(aw88395->aw_pa->dev, "loaded %s - size: %zu\n",
 			AW88395_ACF_FILE, cont ? cont->size : 0);
 
-	aw88395->aw_cfg = devm_kzalloc(aw88395->aw_pa->dev, cont->size + sizeof(int), GFP_KERNEL);
+	aw88395->aw_cfg = devm_kzalloc(aw88395->aw_pa->dev,
+					struct_size(aw88395->aw_cfg, data, cont->size),
+					GFP_KERNEL);
 	if (!aw88395->aw_cfg) {
 		release_firmware(cont);
 		return -ENOMEM;
-- 
2.25.1

