Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1A638A292;
	Tue, 28 Apr 2026 02:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777343705; cv=none; b=kBvMvth62d0TPyGp8xLfcdjtN270X0ZRbhM2XK7UldkLq7UF14LhHVRaWrKpGKF75TYyzjm1X6k2UsmwXn6fu/h3zaHILLgvQ3K5HiCRA90Ehj15smU+XijbGApgyQvc5eGXeFb3XzxGxtfThY9hZcAtCoLUI4zaYqS4IvsWQQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777343705; c=relaxed/simple;
	bh=9f2LKyZ+HMS5jpO015TTD3tliZUH7Tzjnxh7wXSCwgA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xs+MJu5fTFJ8aii0aZcKohgODeWoT9qIUOFtYxWq7LSc3TNJt589AoYmmGoxiKtar4vi18tu831V07jY0zsLcahm3AfciI/MBfTQsjvXmD9i5GyB0fIGJ3GXCzw+/usCcI6DJGLXQGz6yo1vhiLmsTa3zGFFXNdFQy5AcwG7faM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pIvuEv4q; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pIvuEv4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8o
	MgQe0JHnAbbHZvkKQ5+BoxSmsUhtc23d1Sf9OpTW4=; b=pIvuEv4qlZDx+Y6NxF
	ajvb8TOP/PEuHAMnLv3CDy+YULgQAV2ybI5zQ+08WCvaMArAhU5h3jsxqfNuqTkd
	msHrToBTGH0IjEWE+ae+F6LMuI+7abWI4JzYLFMM85zidqh45Zz//T+lgH30ztg2
	AVepXVoI8AL1PxK+vWlX41h7E=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wB3G1qiHPBpaOjXCA--.27660S2;
	Tue, 28 Apr 2026 10:34:11 +0800 (CST)
From: wangdich9700@163.com
To: broonie@kernel.org,
	tiwai@suse.com,
	wangdicheng@kylinos.cn
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: aw88395: Fix kernel panic caused by invalid GPIO error pointer
Date: Tue, 28 Apr 2026 10:34:08 +0800
Message-Id: <20260428023408.46420-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3G1qiHPBpaOjXCA--.27660S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WryfuF4xGr4DZw18JF4ktFb_yoW8Kr4xpF
	4fWFZxKryDJry5ZrW0qr4fZF1FkFyDtFy8WrWakw1UZw15tw1vqr1xKw12vF47ArWxGFya
	qF4I9rWUuF4F9w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joApnUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCvwPFFWnwHKMbBgAA3X

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
aborted.

Also, since the GPIO is optional, remove the dev_err() log in
aw88395_hw_reset() when the GPIO is missing to match the optional
semantics. This also fixes a potential NULL pointer dereference as
aw_pa is not initialized when aw88395_hw_reset() is called.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
v1->v2:
Remove dev_err() in aw88395_hw_reset() to align with optional GPIO
semantics and fix NULL pointer dereference if aw_pa is uninitialized.

 sound/soc/codecs/aw88395/aw88395.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index 3602b5b9f7d7..dd09bac652f7 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -456,8 +456,6 @@ static void aw88395_hw_reset(struct aw88395 *aw88395)
 		usleep_range(AW88395_1000_US, AW88395_1000_US + 10);
 		gpiod_set_value_cansleep(aw88395->reset_gpio, 1);
 		usleep_range(AW88395_1000_US, AW88395_1000_US + 10);
-	} else {
-		dev_err(aw88395->aw_pa->dev, "%s failed", __func__);
 	}
 }
 
@@ -522,9 +520,10 @@ static int aw88395_i2c_probe(struct i2c_client *i2c)
 	i2c_set_clientdata(i2c, aw88395);
 
 	aw88395->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(aw88395->reset_gpio))
-		dev_info(&i2c->dev, "reset gpio not defined\n");
-
+	if (IS_ERR(aw88395->reset_gpio)) {
+		return dev_err_probe(&i2c->dev, PTR_ERR(aw88395->reset_gpio),
+				"failed to get reset gpio\n");
+	}
 	/* hardware reset */
 	aw88395_hw_reset(aw88395);
 
-- 
2.25.1

