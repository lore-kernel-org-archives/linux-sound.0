Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F77CC2ED
	for <linux-sound@vger.kernel.org>; Tue, 30 Apr 2024 05:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714456767; cv=none; b=lkPsN2L8H3sOyvDu1xSVHxcDimZPc71NDRHhYRK541lpNTT3xm/4kj0mqtuelUdSJfjLLy1pkXQ20Uc4gLwxGnNSw534ow/gD2c8oYcpmw0mX23b7eRHYLjSGPjPMbbnEokhHM0IiFiBRAfdCoHwbTl4NC4hsBle586tK234is4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714456767; c=relaxed/simple;
	bh=zSXy3jfa4VKS0HJBqONSBAkFq+8kSfTF3GZiy9smyrY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nKcRZhTh6WhJefH62IqugCOaUhZkOP/3q0/gtPhhd2LnmYddw4sMv48gcbRUFuXhWThMikUpZvjpGvcf145By/bblj375akwNWKytX30Sshq5v7vJ8g2DSspxgDJM6YIo2D3t4QTDG2LxEYJSKZRgceqUA3arAvYUk4fWeWdqkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FW+G6kGw; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FW+G6kGw"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4defa67bc32so446569e0c.1
        for <linux-sound@vger.kernel.org>; Mon, 29 Apr 2024 22:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714456764; x=1715061564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ePtGLw/ehKaxX0AJvH8LbQitvZ0O8eQrKpyZ1mOzRZE=;
        b=FW+G6kGwVefGNtH2Vx+IQWIuR2Ya3QgTws7LlJ32opDoIcML+QYHgAyqdEVqW5us5O
         P/Ar+2aqOIngeRL5Y1Sf3niZ6M87m7krnzacqrnracvRw/haRlQ+x+Ou8zQQ0QeEa8gI
         yNxi0SFf/5ye7Jm2OA4PEyfqXZ/gj3IuEGGYypsm3QwH2L/N3NMYBbsYQfMnsJVnIlL0
         dV+fjM9v1H0k8/DqZELMMvIERHjk9ZucRgdRzM0XK7RqYDQlaWJHN053T9WnIJaDn0PB
         cGurTNKX3fgyxmdf0O/fqhODqoNOqjj8952Zvh6hWcAQ9qPwNFCgPjqFKrr8VIeAPTgA
         yMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714456764; x=1715061564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePtGLw/ehKaxX0AJvH8LbQitvZ0O8eQrKpyZ1mOzRZE=;
        b=aZmMR4/S1pt5/ct0jDtXjtq9bx9WxkrPHzHHS3tQzuJxLdAdioOmm6CbGOHZ1axJJA
         /REI6zuT9S7i2c3D/KgwqEQ5Yjgo9aRJpB6VYgd7p+a8aj1X2XE11dNfX9KJpxGaYOO7
         qnBgO3SR4gPUsnFM2tucJmJLEPm7tXpOPYZU3xnKAujHWjIZtUWtpgW/5TRHFe+thvBk
         dx6Sb1ftb4MzWTlw8HPKmAADFQ6eeUEnCcVHbOk2+rfPIxBLT3U3Qe7u58ysatD3PDYj
         +ggoNg5jiv/9QsXc20aZqJGCnDQMglajFTZ44rP2hFW2/4iDGTRH2wPAuDgTe6MEVeQE
         Knqg==
X-Gm-Message-State: AOJu0Yw8Zr532l79uGr4fd0l9B9XdYSpcv6SP4x81IcsFf5CtWLVM/jo
	FhbO5ZAODNdCtDZvBSLqgRaPtX/GrpLgPFfTG7xq93aUejjM7yU71dYcUQ==
X-Google-Smtp-Source: AGHT+IHC/g6VZCNlul3PLwyo49Gnb01uwO3dDb2VG6MvCquuxCc5toym7V5bg4FA6ACpGFX6leitxA==
X-Received: by 2002:a05:6122:3695:b0:4cb:fc25:7caa with SMTP id ec21-20020a056122369500b004cbfc257caamr10572854vkb.14.1714456764626;
        Mon, 29 Apr 2024 22:59:24 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id er7-20020a0561221b0700b004cc4f2df3edsm3901898vkb.31.2024.04.29.22.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 22:59:24 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: linux-sound@vger.kernel.org
Cc: David Hunter <david.hunter.linux@gmail.com>,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	julia.lawall@inria.fr,
	skhan@linuxfoundation.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH] sound: rk817 reduce memmory leak chance with __free
Date: Tue, 30 Apr 2024 01:59:18 -0400
Message-Id: <20240430055918.131299-1-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using the __free function instead of of_node_put helps with
preventing memory leaks.

Unable to test.

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
 sound/soc/codecs/rk817_codec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
index d4da98469f8b..bc015dc9c950 100644
--- a/sound/soc/codecs/rk817_codec.c
+++ b/sound/soc/codecs/rk817_codec.c
@@ -456,9 +456,9 @@ static const struct snd_soc_component_driver soc_codec_dev_rk817 = {
 static void rk817_codec_parse_dt_property(struct device *dev,
 					 struct rk817_codec_priv *rk817)
 {
-	struct device_node *node;
+	struct device_node *node __free(device_node) = 
+		of_get_child_by_name(dev->parent->of_node, "codec");
 
-	node = of_get_child_by_name(dev->parent->of_node, "codec");
 	if (!node) {
 		dev_dbg(dev, "%s() Can not get child: codec\n",
 			__func__);
@@ -466,8 +466,6 @@ static void rk817_codec_parse_dt_property(struct device *dev,
 
 	rk817->mic_in_differential =
 			of_property_read_bool(node, "rockchip,mic-in-differential");
-
-	of_node_put(node);
 }
 
 static int rk817_platform_probe(struct platform_device *pdev)
-- 
2.34.1

