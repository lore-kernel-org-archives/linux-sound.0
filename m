Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514DA2980A8
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839638; cv=none; b=Dcz/4k0YYN03hY/xYTULhisBa4QNPXLmyqBktVUeVfyaGs2/jegvgF4A0nABhfAymIdb1WxkpFpDujgOnJK7JnEoPiH9IY5/p3vP3HI2ftxmNd2lmZYN6bi94eLg4k3KsHslnFKjjfqwFinkKqGw7JoFjf0aCZNNOdQd+G490XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839638; c=relaxed/simple;
	bh=yIX1bqDOZJMk4FAwTaBF9FTRFIItyzhNRj3qdfFr7GM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AcnJEo20UFmZULYZmQ/iVzwx0hVYaZorn0fe0VHDUsBCYGB+Rz0MQaeplbtEgSTqmP5XvQoM7bf2bQBcveaFS6PNmn7VOx2/EmOaZ0aZctdkVCQDH4nYkyYFibpfipuGPt95PfNXV24rmyLM1n8VUhwxkS4r+M5GLqyIut8B5Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgBaN4hq; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgBaN4hq"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30e18c3e0b8so3331088eec.0
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 10:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782839635; x=1783444435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LAEwzM4GUMJjKZDLNdDkTnGBKY8hW57ikhpmi3nBjbI=;
        b=KgBaN4hq8AXl/2Tw8UygKtGrj9ErqtvCXOaKXk5xLtTPbza8Dc9mRiZGWyfmDMXjS+
         l1Xrncroy7k8CI8mQzMShu8b8F8qrIdyObg/neJhyYWAb9pEaLX3/lEju0b7GVoqiXHf
         nN93jNSfahGGL2//7tYSunaAmiQciS8AyrVUElvDP4TaJV1TLbRfPA6YyUrlRNVPIiuy
         QQQaa5DeekFdxr5qesUCeFKSmzDgFGsIvQiXh1UBAYNhKGl/TY+gcOdfkACMMBMBurYB
         hgd2XL8qJkIQOmLFSqyX+yyOsS3a9IyqMQPySOtiTfVYJV24f7ek9ITCLUzDH1uLXO0d
         LKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782839635; x=1783444435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAEwzM4GUMJjKZDLNdDkTnGBKY8hW57ikhpmi3nBjbI=;
        b=nPEHWdRtpcox1QQMHL6AC3Vd0nr/SeWoaeLBgp2u/GuH8Kp/DFVqmdbq1XN9o0703b
         b7iVfwS9HCLfy/pf8F5YwhrB/wUFOYmhz5sOhtRaJ2Wmg0FktJq5oQcR/a+g8DxfLeoe
         66z6UKk4skterO4DQ6UjB700lc/OZHky3ZF9UJ+tACNs9quHoGbfWIggQByi+JiwH+Ak
         4JsRO5ILwZ0vO1hhpVvzoe09lFShOi0oRz75LDL0hVvMK5ASzQ7OG9BzUt2XSyFeWKSg
         U+5Aa0TUm4kKo1YKcLOaANvvrU7ScGUJVi1b+qRZAWNahwt8Xbu0tiNPW0osYtMrQY7K
         UL7Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro8uvLSv5yweAOkOKY/WolnaJqrwJRrnIfISK3jl5Yd9wa3kgIFFrC6a6U20rTGtDFcDI5gJojbupdn3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFG2UeM6Re5H/6zxec53eqoPt+EKvKN8htCvJdPjg0pbZAB6Bg
	PKyc/ssgcRPQZpO2PAOm3i0PhXVEG1Fa3ILBUvZ3W3qojtjfTfNGRFuO
X-Gm-Gg: AfdE7clvJAvgfQrWu+pPNAXLvtxhCdq+gYTCzLlJ+ZW+jsUq5rUabp4Wp8WVJPsbv99
	zxCxdIzu4qhryElUQ5S9XS2IZMtYf+e3DbjGRsGMkTZjov3PuB6k787v2OpoCEoruO8g4YCwUh+
	SE4slSD8AIQ6+j4AVFkCm6ocbgAki5M2B5JTPi3Rbfb8T+xTJvGoyw+IW2mer+a6BngUz8IOQQP
	btjZXakMy5qo2/FclGO8Wf7E0pXknRQM6wprTACBT5bCgAW8aAFU+tfBG3YFTUg9VRSxe1xuwF/
	d4PvdZfYmpnNDGabligdQgf8PKUQYx4mHbLKGbKsnY6yxX76L8SrJNnlOaR0SpF8Wf/YHTnHXhq
	hv/2PwJCdhhBJaCvXoOGLrwaaWQb/BbdHJJdlUlKGpWTD5sBbR3ifiQdtvV+yTW0dP4rEm5Z7UX
	FtTiPhA4KxH89ns54Cbx4gRA==
X-Received: by 2002:a05:7300:f68d:b0:30c:63fb:ebfd with SMTP id 5a478bee46e88-30ee134194emr3279885eec.19.1782839635185;
        Tue, 30 Jun 2026 10:13:55 -0700 (PDT)
Received: from ahmi-PC.. ([2406:b400:28:6260:79c2:f49:197:de9e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2cd21bcsm19639864eec.0.2026.06.30.10.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 10:13:54 -0700 (PDT)
From: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
Subject: [PATCH v2] ASoC: renesas: fsi: Propagate platform_get_irq() errors
Date: Tue, 30 Jun 2026 22:43:33 +0530
Message-ID: <20260630171333.36396-1-ahmisaranrao@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

platform_get_irq() returns a positive IRQ number on success and a
negative error code on failure. It no longer returns zero. The driver
currently stores the return value in an unsigned int and returns -ENODEV
for all failures, which loses useful errors such as -EPROBE_DEFER.

Store the IRQ in an int and return the error from platform_get_irq()
directly.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Narasimharao Vadlamudi <ahmisaranrao@gmail.com>
---
Changes in v2:
- Mention that platform_get_irq() no longer returns zero.
- Add Acked-by tag from Kuninori Morimoto.
- Add Reviewed-by tag from Geert Uytterhoeven.

 sound/soc/renesas/fsi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index ae86014c3819..6be6587e1095 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -1992,7 +1992,7 @@ static int fsi_probe(struct platform_device *pdev)
 	const struct fsi_core *core;
 	struct fsi_priv *fsi;
 	struct resource *res;
-	unsigned int irq;
+	int irq;
 	int ret;
 
 	memset(&info, 0, sizeof(info));
@@ -2007,12 +2007,15 @@ static int fsi_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	irq = platform_get_irq(pdev, 0);
-	if (!res || (int)irq <= 0) {
+	if (!res) {
 		dev_err(&pdev->dev, "Not enough FSI platform resources.\n");
 		return -ENODEV;
 	}
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
 		return -ENOMEM;
-- 
2.43.0

