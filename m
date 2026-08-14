Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DD346F4A6
	for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786731579; cv=pass; b=Jy4i1gPGoVlFvqYmAdzkHf3DnnA+n7DbHDnr9eNAozje8UjGDHbg2hIEoTfMlr896xRDsbYhKsQ3bfqtTqxfx12w8lKRspHmGmm/Jy4iJZO+MbLlvyCsPJ44dq7gRZjI7e78TdR8AEq9K3Wj7KQMjLxVw/cI4hAjsHgh+pcr8t4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786731579; c=relaxed/simple;
	bh=LcAqTqA0RY4kW6avjqwFtcYLceumU573IXvcBFm8XPI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WqDJFmHlCBGMh+QrQeE9DjV0R3q+vuR5x6CYEVsIMv+/qukNszNpraGnUETId6i0bg1qsK8EJftEKkBTInNwqv88ybkSorHhET8Jr6T+VUKr9REFZNcF+xKE694AE8hGZO0TQ276fbSEGEFQMQD4Jz5Jk4SfETF1egJom9DhjCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dwhm8uz6; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dwhm8uz6"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ce98cb8165so13856715ad.1
        for <linux-sound@vger.kernel.org>; Fri, 14 Aug 2026 11:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786731578; cv=none;
        d=google.com; s=arc-20260327;
        b=Z4WupuP6XeTdMPZIOte8of5ECLXGG6lMsk0FEPPeho49Zd8lmgbsRyhf4ywIWMgjBd
         7rnN1Mifu8f+YDE/E5XJTvC+Xd0JSmpSkDr6yz68HxE+R/vfCu5DMdcNpWXO7EWwXxhf
         zrb/1q1s4Yb5rDeI5CqNAu8PdoHF43b0n41Y1ZBsHFY/Dkms3RZvPr/7bz4UWF3U6ZzG
         Zq3VVkfbb+oWrNzKCjpm+clHdMpJjva7/1kHL5m9ST0mllHT5Ib+TL+sHnAijOzUt86t
         nPv60aMFCazrLXl3YIFQ4WNcb3f4dSGjF6GyzYI8X+LfPFnxtpKjv0AVwmVxkSki+cOT
         qvgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gxhb/0WoxKlmt7xxDsHfWlzsiixeDkyQq4izvjY45wk=;
        fh=/EciPM+bhkrv2uedo0A7bW61c1Dm33cOl2z1yiHbCJg=;
        b=NrA3xSBopuL6kAVxlIIYiD17mpkbo0FxWQteIDln1LPCVprnDmXPEM7sRVY528xHii
         Q5gZ7+cqRhWyj56qxg197A3PKJKAH2yC7aEv81uu8QPW+jbZE6J/GX5cRrVNaUGj2jC6
         rMqEhTc713s2JvW/emcK9f/4KGHwwX+/HiD6wSgyYhvQB0KVNQ6BlFxcBNYAOoRiU0CS
         b2lZoZ1UqV5OF82zPRtaMV+iJMloYD+4FgDDXF+4trbo5uUNG1mY5k20QI35zP36qB2B
         EMtIDE+ebOtjtwG2/dutmn3Oxd1ngAq4+gf0JUZ0y7f/61CtBZ8sYYn6/ygMo3/PHzzr
         7MLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786731578; x=1787336378; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxhb/0WoxKlmt7xxDsHfWlzsiixeDkyQq4izvjY45wk=;
        b=Dwhm8uz6TsW0DTycWyFGY7Zo+5bRsDPse4OmjsQT1QNcTgaZ18H3rhzt1hQNE76c+3
         nc/b5Ay9pHPnSyaQls0YDLwLHZhQRAnrBeOL/ZN7eqTQ0XxsR+QKB1xfz9TfIEPgHMn0
         hupdPLMjYtYX3/YM5Isl4XNr3FwXAJ9MK39lisOPK5o1fyIdNTzBMAc//L2l+JAUx9EX
         NL8taiQr3BxYIOFjvz8p8xlBPPS/KwmvqZXOuKjxKYWDK6xz7YSXSCiEp6lA+EVj4etz
         8BxY2OnkuNfe4nieUmWkrIEji+3NVHUr4NuZSJtsWYjCAgA7i0YcTvddD8kPTLT/Xbs3
         mTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786731578; x=1787336378;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gxhb/0WoxKlmt7xxDsHfWlzsiixeDkyQq4izvjY45wk=;
        b=npdo1QEVK6Yg7KmWsRhJ5bCtKrleJ5hymp1Mx8jBnBw2uet9kOz6zRB0OZm6Y/xfl3
         KcZAqKRI45E4HD9XgBWc/ENnMJjX8Xgbf0wTgL/aUqxDYxfgQpF5fjUrcSyaNG8ZjZ1g
         4VL6H3cXYplH41xxmpT6KyUW80bZRqkDzavZ6fgU/YG3z4WJGOiH+oO/l2Ispvz0z7HM
         8hRYjw3lOEL9Siq/ycyIdQhLRzi/ZX9rVLVDzenUUcgl8ZllJ6MUjEwdhXmySd9umwcN
         FWdHiH+I8ynv5OIv9SRMMWif+8PK6rxz4OMbMV4pfn0b11PxrYM8YLXFLkARpKg404C/
         1SCQ==
X-Gm-Message-State: AOJu0YzkZdyYYQYsxtiNuu0Y533yc2QAmspOuwi/nthop3aKerm+Fv/U
	QWWTNVzsCuNiZLCkKOsuZJpkOFdEeeCLCQi3Ukxm0kdlW5sGLP5k5FjO05W85RArKFWh/uFry7k
	je62u6ZLE8SCjmpGU4Q5hKZvosscxYhk=
X-Gm-Gg: AR+sD12MG1O6acp+vs7lK2cZGMFcseLLGsrnfTWqFATXMi/QJ9ehLh6KtU5CsnYJvCr
	ucJ2eJQwnSLywR7wHQs0ClbAZMullp7J0bzT1m+mdbHroEQ3EAzfdcUBhA+ZINE1ZDYA6R2JUSi
	GgJtMlTKm4UZBQ6D5gvc0krRjVJ/MtzocAzO+842930L7+hfD7uvLqQWZpnOcCHevfsQRbRaWVt
	pRqJ3xijygUxBNrEiykkN51f7u/LiQIICeCfpTwnFhfqDfB2ctmr8QZHeCjAvr2L8H49Ngd1KXF
	TgAuMuajnhvmqoBJ9zyIP54jJQ+PvlC0oIfSFZ+FvY0nFB4NK1eL0e176VLiWP1HmPIZdYAZFDg
	=
X-Received: by 2002:a17:902:db03:b0:2d3:c3b:c7cc with SMTP id
 d9443c01a7336-2d37f5d0f8fmr158085335ad.3.1786731577655; Fri, 14 Aug 2026
 11:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?5p2O5YiZ6Imv?= <lizeliang.linux@gmail.com>
Date: Sat, 15 Aug 2026 02:19:26 +0800
X-Gm-Features: AcwNN1WTjHUlToVDLZgmy6sKgVI3-wYQzA5yhm11nmuEqKKJ1HyM5DEQcC21Oas
Message-ID: <CANd6bg+B_fZUpy4wwU8HyQMeo9-GKMEx2FPBem=-e4yr4eU1uw@mail.gmail.com>
Subject: [PATCH] ASoC: tas2781: Add delay before block checksum retry to
 prevent deadlock
To: shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 3ee77f811a91350caa56783b76251cd8218e2263 Mon Sep 17 00:00:00 2001
From: Zeliang Li <lizeliang.linux@gmail.com>
Date: Sat, 15 Aug 2026 01:52:57 +0800
Subject: [PATCH] ASoC: tas2781: Add delay before block checksum retry to
 prevent deadlock

During runtime resume from power-saving states, the tas2781 amplifier
firmware block calibration checksum verification may occasionally fail
due to transient instabilities on the I2C bus or the chip's internal
power rails.

When tasdev_block_chksum() detects a checksum mismatch, it correctly
decrements block->nr_retry and returns -EAGAIN to trigger a
re-transmission loop. However, because there is no delay introduced
before repeating the loop, all available retry attempts are exhausted
almost instantly (within microseconds) before the hardware can fully
stabilize. This causes a permanent calibration failure, triggering
"ERROR_PRAM_CRCCHK", and results in a silent speaker deadlock after
pausing/resuming media on modern laptops.

Fix this by adding a 2ms usleep_range() delay before initiating a
checksum re-try loop, allowing the hardware sufficient time to
stabilize.

Signed-off-by: Zeliang Li <lizeliang.linux@gmail.com>
---
 sound/soc/codecs/tas2781-fmwlib.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c
b/sound/soc/codecs/tas2781-fmwlib.c
index dcbeb9618195..09cbee7a55dc 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -1765,9 +1765,16 @@ static int tasdev_block_chksum(struct
tasdevice_priv *tas_priv,
  ret = -EAGAIN;
  block->nr_retry--;

- if (block->nr_retry <= 0)
+ if (block->nr_retry <= 0) {
  set_err_prg_cfg(block->type,
  &tas_priv->tasdevice[chn]);
+
+ } else {
+ /* Give the chip and I2C bus time to stabilize before
+ * next re-transmission attempt.
+ */
+ usleep_range(2000, 2500);
+ }
  } else
  tas_priv->tasdevice[chn].err_code &= ~ERROR_PRAM_CRCCHK;

-- 
2.53.0

-- 
KISS == Keep it simple,stupid~:-)
http://lizeliang.org
