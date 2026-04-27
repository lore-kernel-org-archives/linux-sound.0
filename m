Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8165DF59;
	Mon, 27 Apr 2026 02:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777257029; cv=none; b=Vw5Utp2lAnWK8vrVSRymo9F1K9fNekDVwfA/2T7k+G86OBRUAiCrASvy37yHPXNYmwv1vHFf6Md896wEkJG2foI1hvq9TSCuMpO8DiPYhk73QiyAtH6KXiRASAX6bwGrE/dlygAYLVM6iNRThvStSVbzlHdxt3S8JCUUHiNqLbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777257029; c=relaxed/simple;
	bh=f3ZIWJDjDv29AI59sQDBQHbt9vYdSZbomtqJ6zmTVOc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AJOJHf3TTq+e+IFyj2PCidsdreGKvSjegf51CJV8wjciOpUltSLxHYTc2X9PwHpO0ArOaMF4BnRpnBbl5nZd4h/IeO7iaDojADrE6mBljd2C1EuCY/tCzcxJLjCnI9JEZ2SxldGVMtzfg+X79yEnJphi4wHIrXybP/PV8FcwK4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=amLTDGtl; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="amLTDGtl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Qv
	DxuTwweRKErYsdSQnwAoexuHqo6KmGkmz0+hTJPHk=; b=amLTDGtlvqNY/X7YJ5
	kXv3x79Q6S4gS8eAo9TVgMkMxA4krF9/0lvkn9sRRWoRGgqH2us4F//kOBNQvCeX
	+99pEimRsQ+OeAStMh7jfII7EPO4Br3CZNO11PrxLNz6n4yeEdeqd5FyIQkds/Gd
	cb97PyzzAioZTTkLwPx5eQoL4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCHKA4cyu5pFeVBBg--.92S2;
	Mon, 27 Apr 2026 10:29:52 +0800 (CST)
From: wangdich9700@163.com
To: broonie@kernel.org,
	tiwai@suse.com,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ASoC: aw88395: Fix kernel panic caused by invalid GPIO error pointer
Date: Mon, 27 Apr 2026 10:29:46 +0800
Message-Id: <20260427022946.48886-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgCHKA4cyu5pFeVBBg--.92S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WryfuF4xGr4DZw18JF4ktFb_yoW8Xryrpr
	4fGFZ5KFyDJ3yUZrW0qr4fZF1FkFyjyF48WFyFkw4UZwn8tw10qr1xKw129r4xtryfGFWa
	qF4xu3yUuF4rZr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEbAwnUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC6ADQIGnuyiDZNgAA3a

From: wangdicheng <wangdicheng@kylinos.cn>

In aw88395_i2c_probe(), if `devm_gpiod_get_optional()` fails, it returns
an ERR_PTR() error pointer. The current code only prints a message and
continues execution, leaving `aw88395->reset_gpio` as an invalid pointer.

Later, in `aw88395_hw_reset()`, this invalid pointer is passed to
`gpiod_set_value_cansleep()`, which dereferences it and causes a kernel
panic.

For optional GPIOs, `devm_gpiod_get_optional()` returns NULL if the GPIO
is not defined in the DT, which is safe. If it returns an ERR_PTR, it
means a real error occurred (e.g., -EPROBE_DEFER) and the probe must be
aborted. Fix this by returning the error code when IS_ERR() is true.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/soc/codecs/aw88395/aw88395.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index 3602b5b9f7d7..e60cd7e239cc 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -523,7 +523,7 @@ static int aw88395_i2c_probe(struct i2c_client *i2c)
 
 	aw88395->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(aw88395->reset_gpio))
-		dev_info(&i2c->dev, "reset gpio not defined\n");
+		return PTR_ERR(aw88395->reset_gpio);
 
 	/* hardware reset */
 	aw88395_hw_reset(aw88395);
-- 
2.25.1

