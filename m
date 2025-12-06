Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9497279C8
	for <linux-sound@vger.kernel.org>; Sat,  6 Dec 2025 14:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765032855; cv=none; b=RSwerLMslVlzK1p672YPazg1EFyOj+q4br6SW9vK8UuRz+u0c7ti54jN9n8sY2/NPWV7XrtsGdEUV7PRlBB6q+LO4dQzquqnAf8382c8ggc4rj1yIO1bl4z1BTxqutCLVGYKy5C3hVRdMcmIOp3Te9WgAlZTsYSqPzhf/Eyinms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765032855; c=relaxed/simple;
	bh=5D7VXlAUJDO1wgXYpuCdEwFMeC40y8y4aj8DR6xaffA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t4MutMV3vPQLda4G9cQ5364Txvkd0BiU2SbzYw+F2vUl6a8qofGu0UVXMVfsJRl8gzQ+f+uA/Pkf4kzCbaeW43jC+wRsm7FEFokZZ2sN+ysL09e22GdTAvIAuAN0DWJ4DL/st8BgqyxBqmFDOnvfLypv1OGX1rg97USGeCdpqK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGCQJ4Da; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGCQJ4Da"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3414de5b27eso2251975a91.0
        for <linux-sound@vger.kernel.org>; Sat, 06 Dec 2025 06:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765032853; x=1765637653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M7aGuIkb1zLGBw9QlRp9kXJ0T0y3DEkonULODaHEw7M=;
        b=XGCQJ4DagFn49dh/5CDnYyV7nPd5ClRV4EIOjO2Gif4WzXMqo4rUDWa2udZMctDNMI
         4jWbwd+IehzAre+NCprfl4f/0xqGS1VX6Bnl5bqjlQ4zzgJ7Ch8lYqy7nUDi4JxjcYoB
         5CyBBypuGfvLmkRHwYql3Kn8K6fHXE1/dI00zLyEyqIkNIHV+NNtQEDMEBNcTEHrMSr4
         EYBBHlGh92oXV6EOWckshx0J7fKGm4YC6SumhlTIdb1hcU0sjZrZRhmrobIeWshcBLGB
         g/RUJHT+FHi5sbJoDM0u/tRfZINk14uWhtDvwx1u6y8OOsw1J4eJv4YtnqQcmxIR0VVO
         XPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765032853; x=1765637653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7aGuIkb1zLGBw9QlRp9kXJ0T0y3DEkonULODaHEw7M=;
        b=l9jbCDPnqzbdWNrlZbU8DikNqTkBitB+bin3bL2g/R3Mun/TsZlRetN6xinzdy/VrJ
         C7EFpkW26FynqW3dQa0/VdeQoAMVy6IetbY+NUuAr/bITv6OobH0yikQl/UogQsoi5w1
         o/VxXK9lErsAxRNIji631Tkn3OLLqjAiPWlHcFFykukIePrHG816Bv3GK85g7mDtatbt
         Hqv3VouIZkf+hE/m6ANLGAFvoA8hSDzsjJbEwsUzXCCAnY1h3YvB/8f2iN3REy8kb+q9
         CuUBukp46vI+tzYIbu0LkRlIpZuLVjLDiecbhJZ2UZu7bK3hk3ynmsKzumGExled7s71
         RS0g==
X-Forwarded-Encrypted: i=1; AJvYcCW/MDHD+dNksfDREr+sQ8CTCPVH988dj2Ddr8P7bcHyIP+yss+Vj1Egs5jsAWZzAirdvg5imMZCqml6dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymCLMLVU1DDW0hv7Kah26q4WbjGl+sGFEYaahcn0t8g87KfFsp
	r3VDXhFDcYoksgiOy9JF7SO1olGcDx++yqca5t9kk1tu+2n263Hzzk/G
X-Gm-Gg: ASbGncsDsKgk0/37CMbobODizst8iQTGRdih2AQH9ChFIio+IohF2M8+yG/gYfKzNKU
	9JUjnc9yzy5KmoNH0QYseDFwtpTAtKFIYpgXHPxTKY7TO5yuEnlnoyKwIoXlPrnifWl4m+2Xg9y
	TihTHAKJ6GW1NFUPBIsIRpT/r4GgZydTlNfKlyWSpVng3IiKcecTHsqeKd6GOss7trKKNfawfR4
	efOqb2FP1k3uk8TTJICToBjuF1WcIksxGtrpBN7vzNTM5dTAaqbQHIsnkX173fhKUzCCPxqg8X3
	wlRLzBa5SA14L6E6FEw4iVXgihv3MBFMCaCjSlhlp3YWQYbqgGXVJky5qT6v4RrI0lPcDcvJRMs
	wYUS0Ag1mF65yTHrLCBaTZAgyj38oHdvNevaaLN7V4qWaVNZ9FruB0pOOYnloK2IsQeW4pSXlfM
	mtGKiqzd/KjVFzOUJLmW/9hg==
X-Google-Smtp-Source: AGHT+IHSInWWoI45tN4csnvwQ0FOn+OAE79vWC+/AcpAnlfHWXrmR4GqpXKNuXk8B6Rw/MtSM903XA==
X-Received: by 2002:a17:90b:3b44:b0:341:8bda:d0ae with SMTP id 98e67ed59e1d1-349a259a061mr2098951a91.20.1765032852851;
        Sat, 06 Dec 2025 06:54:12 -0800 (PST)
Received: from gmail.com ([49.37.171.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e801c6a1fcsm3452695b3a.4.2025.12.06.06.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 06:54:12 -0800 (PST)
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
Subject: [PATCH RESEND] ASoC: codec: rt274: Use devm_request_threaded_irq to manage IRQ lifetime and fix smatch warning
Date: Sat,  6 Dec 2025 20:21:59 +0530
Message-ID: <20251206145158.3623-2-hariconscious@gmail.com>
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

