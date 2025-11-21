Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F9033556D
	for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734969; cv=none; b=iaK+YlyVeMWCNBoHu8Ulb0uqoXBqSnHpLy8DfUIChyrLHQba24e3n+N+tStTtV20NKIvQ8NjmqTxiCOVpApA9oC+08n2atdE2DrdcEPlWfC2XUz1A/mgBe6g0O+tqENZXkhE+9Im2hUmPha+QoMc0wXzpGLmpoWjQhE3WPxYwU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734969; c=relaxed/simple;
	bh=HDEFNLZbHChbSjezJhWZRHiNquOGC4B+deABIHEvTpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JJhkcK4w3a2qKUAOWGYfSeUDWNNYTVeOVii8kt2M+1bqJlHxW1X0hFOGkrpkXznwsECyRSchCmkSS/BtnKID27z4Xb0CTobTbIejYOyej8cvFXNb5pExZfH68jNna1fwV9fp4PD0zpqefTAhg0tKu2FrdxIhrYeMwiuBBhYlXj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaQ21DOP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaQ21DOP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779d47be12so16456095e9.2
        for <linux-sound@vger.kernel.org>; Fri, 21 Nov 2025 06:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763734966; x=1764339766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNjvlRHq8yldGP9LWeSBbHcpVfEA7AYRv1h3eH8bFU4=;
        b=HaQ21DOPJBCfCIybrUnqeSKPhbXq4FtylplAcprBwZ1Q0cjLW2fcBMG+7hV7Yk2OOm
         5MpONJGMxjB0L6JeKaMmNZl1znBY0CmKueIDp2YmvIDvM9ADFpgRCqkkjP56iger8AqZ
         fO5uuF7aTE/aTiXVRodNlQCLRkyYnb5GnhLT1pzCXf7vbBUIov12kLf0Dz3Xl0nccYQR
         KFrjzGkL+sbXg4WXC9rNj9ZrQKkkgr11PFUTW37gtJL7O057chLwpEcKeyIPipSZDS3N
         jrpuqU54D8YQas3I0NsAlJxiDmMwiuXAFFNKYOFGVUs7dsSNBgnuw4FS/XHiarrk4jQ8
         +qWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763734966; x=1764339766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNjvlRHq8yldGP9LWeSBbHcpVfEA7AYRv1h3eH8bFU4=;
        b=ihaceYs7AMiQt6DynCJ6TcPRWAjNdgc9sz2aAT3wdXdxg0oyaHYiyZA/BLaH1doz66
         DZX+E1Si7Xg9pDj7CH3Oa7w7uyTDEVZZFDycZ4yyuJLeC41T2aQXTj8Z0iKGAUA5RPUw
         kmuk8ykc5ErJk6+15ubW6efuM0JxqaKKNzb2cG7DcDaFIUTpqkkirQ/zWAkTYtcRSnzF
         90jhtzoRrBqvOIilOUsLFGXaJFTPKrvkFoX2eJL6uUedyevmbWa/i/86CnaTHgz9YF+2
         A2GpMO0qEwGESs/H6FPvkY3NsHgn3yPHGBYIeVr9fxfy0watHeUlwBC2HrxRGb6y3KEh
         xF1w==
X-Forwarded-Encrypted: i=1; AJvYcCU16dVRYQkWP4MEZ0D4EaSlM4JlxsW9qEkpj/e94OdkfwBjKv9OfThI6EZKfSC1XVevpwZPT0WcDFtm+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4W8ZaN3Zz/rKzFFB+x8iSMSVdUJvNGqdOwwWSgeznBUXyqEZZ
	1AKQrabJkNX2DRZ2OjK9hoBUsFTFH5UXysHUWXiIazg0bodgo4m2QmY9
X-Gm-Gg: ASbGncv5Tz8HFpDgCHdS035iTx18ECL9UAgNd0/BVarDURphEQtuermACVrrA2uWIVB
	xwqQdp/rNrn0z7+RkFMbLPH3eLPN5ddyqG8zaVZufkd30fENsxCqrgSoDzT+ZyQ2coCJsH5IGbv
	blB9c+iyrfuKGrCINLMkpU0gElL/6qoCSUIzK9Zbp3avuCZJ15v2uH5XyBHhxa/XDtEzzkP31r8
	+4+LBHImgM1OcP7So2CZ3c3mRINEI3UBSWibHIMSvw93tc/dP2l7Pypjre+3gjN7OndSY276AaO
	51m06TS9710HFX4AHJZhZylTLxC1sS0fOb6P9rG9/D3Tei2idoDj4SdZzVxSeVtagDSGRiqV3VU
	TlJaD7FeYj6IDrlPP5HNdqT5OjFdZ5XLkflX8kU+WLCaBYxLSEYOoygmWUteWgirm9pJdQ/2E2B
	iOxg8AQEtVoKDR
X-Google-Smtp-Source: AGHT+IHOPQLDYI2JRfsRISZKbkan/BHMSu4JKZ2NXO4i1fO832Ovu7akI0DyJWfldMrYkC8E0xl0Lw==
X-Received: by 2002:a05:600c:354b:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-477c0184c45mr25879915e9.9.1763734966414;
        Fri, 21 Nov 2025 06:22:46 -0800 (PST)
Received: from gmail.com ([147.161.143.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3558d5sm45553235e9.1.2025.11.21.06.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 06:22:45 -0800 (PST)
From: hariconscious@gmail.com
To: oder_chiou@realtek.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH RFT] ASoC: codec: rt274: Use devm_request_threaded_irq to manage IRQ lifetime and fix smatch warning
Date: Fri, 21 Nov 2025 19:39:43 +0530
Message-ID: <20251121140940.40678-4-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

Replace manual "request_threaded_irq()" with the device managed
"devm_request_threaded_irq" to manage the IRQ lifetime and also
it removes the smatch reported warning.
Remove the manual "free_irq()" in the "remove" function as free_irq
is tied to device teardown.

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
Hello All,

This patch replaces the manual management of IRQ with the device
managed IRQ API. Also, it removes the smatch reported warning.
sound/soc/codecs/rt274.c:1204 rt274_i2c_probe() warn: 
'rt274->i2c->irq' from request_threaded_irq() not released on lines: 1204.

Removed the "remove" function as IRQ is managed automatically.
Runtime testing is requested to see no regressions.
Please report any failures or unexpected behaviour, I will support in
updating the patch accordingly.

Similar warning is present in the codecs rt286 & rt298.
If you are ok for updating those, will update them.

Thank you.

 sound/soc/codecs/rt274.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index 2c055c45111f..d441851dee8c 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -1188,7 +1188,7 @@ static int rt274_i2c_probe(struct i2c_client *i2c)
 	regmap_write(rt274->regmap, RT274_UNSOLICITED_MIC, 0x82);
 
 	if (rt274->i2c->irq) {
-		ret = request_threaded_irq(rt274->i2c->irq, NULL, rt274_irq,
+		ret = devm_request_threaded_irq(&rt274->i2c->dev, rt274->i2c->irq, NULL, rt274_irq,
 			IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "rt274", rt274);
 		if (ret != 0) {
 			dev_err(&i2c->dev,
@@ -1204,15 +1204,6 @@ static int rt274_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static void rt274_i2c_remove(struct i2c_client *i2c)
-{
-	struct rt274_priv *rt274 = i2c_get_clientdata(i2c);
-
-	if (i2c->irq)
-		free_irq(i2c->irq, rt274);
-}
-
-
 static struct i2c_driver rt274_i2c_driver = {
 	.driver = {
 		   .name = "rt274",
@@ -1222,7 +1213,6 @@ static struct i2c_driver rt274_i2c_driver = {
 #endif
 		   },
 	.probe = rt274_i2c_probe,
-	.remove = rt274_i2c_remove,
 	.id_table = rt274_i2c_id,
 };
 

base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
-- 
2.43.0

