Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837384334B9
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 07:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135539; cv=none; b=bIz1X0owk26gweXio5wRoTpjBSd/ADSwo/Zlx9muj+N0zj13LNCbDFdB7Feog1aUtOmXW0Ln04uG+5C/mSq1vUOkjLyi+tM4fN/EKRLXU2IBE9vN7PvASl+HK8D4SyUFOfp2c4bFK6nmpPJ0hdixqf6WqJDIiCmM4g7ubbwiZdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135539; c=relaxed/simple;
	bh=VezvnPfAFk9BE26q/X15JVkhgpA/qwbmXTUd7w7R6OA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9pXBnkwDLRFMrvBT7zl3WHE4tN+abH+gCHNROS1UulCCWsAfBRUcFvBIgJdq/OAYeVWQ1y4Byi8DOlWyQk6TIoxpECoMwWYt4OS5FDVK2cHZpjTfd/P+kujoAsqe9k+8kPMeazBz3LVc/5Dfkbki/6vJ0LGm3RYh0l4Tz1vTBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdfEXCvO; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdfEXCvO"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd5e6f0a22bso1511971a12.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 00:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135537; x=1792740337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwvQmXJD2Zw06QmGHQhTYptB614fchntA9Grpa7lwMw=;
        b=WdfEXCvOxBYnlU82iv4NQaLZVlEr4CK/9CGuWG9XDAJyO6dLp520oC/G/jB2VqIoQt
         a7877w0IvKrCoLImugVusA+TMJyHgXpJfa40BYaX7Zbi7DgEv1Wuf+gbTiPZZS+Sw2/0
         n006u79hI5eVoX6ckQzVfEwxlYTbSModcVVE9kLC66z7f48fseTfMMj0EWrhUQwdU6yx
         S0Lii/LTo/UQYLc77Rpr6CErH04a1dOHf8syJFAvZsmicGCYFjl7TND8pRQ26rboXNE0
         u8IIZ5JKEAq7ZgkAJQg4PQmedFp91XTKHpZjLRbeayQTpACP0H0XwHdxyzNxGxOcfpg0
         Q0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135537; x=1792740337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FwvQmXJD2Zw06QmGHQhTYptB614fchntA9Grpa7lwMw=;
        b=yOGVndRnjqiF/27AG7yR0NyL7iK+Ccxpm5hpsWusnV1fmLr9Uw/3LCEIz85/KTFzJt
         IaUgaDut5zKXChTzzpeGf3O+2oH77vymjASuYLO25hBgJaaXnyel7IsqMrbLaEv2ak/N
         S0thpWsIY2N46pcQB66byR6ETH2DG1LHwdWldnjFiaHFPPgPEL0ouDoTmd0/4KSYj+D9
         bkLL8TIeAhKPZ5GfKSk6qkwkmx+pttT+XEF71TTWVnO72BjkGqp8gBC7FBv4BKgjfE4b
         Ofvo0ky1QXbqGSKq3J1mAGKN0gwjS0MeqKBrSd2kLuIUrWb3JBTK65J2UaWFojQuFmME
         x1uQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkRK9lqGFcsqBQkhCj77SUoMftDLDMQ+HDHwvROFUpavAzoCfqHsS4DRWIoyEJHqNozMg+QzgXRn7eaA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+3vOuo3AtMJPnqk8tQ6+WwPDIsz+Q0b+pkMUTIUmRtmFX+LvF
	Q4HNsAbUcCLe8xj0smgfi2/W++kQLzE43/pzB0i/RdyN/oJjVWhe6si2
X-Gm-Gg: AYBFou29d1B1yr/mxN6rkB4UFDOVvwzti/1VVdpMb67/9VQ78YLDjrSdEY+zZenSI+t
	BFJlah29beqLbADd/Poz3gGOZhD+I7f+c60y+qa0Dx17NtojJMJilQ47lasDVjVW5fCDf7NGsNZ
	7coRscYmsTnwzQvkJZbWA5jL+xabWAP2Sj4s6isF2OGNP4XBmqul0E5ObhD72zEa9eekAMlt2/X
	NWXLSZ6HXm/qpyHL/cWL7rXBIYHcaqRu9coRuMPYQnp0urdiFkDAwckw0uhYPLE3z0AgbUQKrmE
	XmNjShpjyz+0Q4bmkakqzqmmTmov5vVO1NEK2gM+iic5qEfk0kFyONUEiReeY9xnN4krc0+k5JI
	5iILtwiH+iWF9imwWJN+GDOaH/Ube27IVhO9UH/VuxcKwzC92eReyAD6tO+QHQ69AY1hl5pTFvJ
	lM4QGAZSrhtUFQapzrjAaa2I2yITvIJJDHm5dqMp6DDKKeTmmvVvRkBjHZ/7dLYA02h1aPnVivC
	UCQs2uQWms5wWJu/bXxDT6svwGJ9DNQE7O8Xq887/bt0V//QJqP20J+JlLF3WtjufkjvCBjqGA=
X-Received: by 2002:a05:6a21:1585:b0:3e1:1faf:eba0 with SMTP id adf61e73a8af0-3e16be93a96mr19817283637.44.1792135536737;
        Fri, 16 Oct 2026 00:25:36 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b6171sm615257a12.14.2026.10.16.00.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:25:35 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	support.opensource@diasemi.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ASoC: codecs: sta350: Fix definition of Ch2 and Ch3 Volume Bypass controls
Date: Fri, 16 Oct 2026 16:25:19 +0900
Message-ID: <1107a42a563459b26038bdff4d8f6e2423816d0a.1792135144.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792135144.git.sammiee5311@gmail.com>
References: <cover.1792135144.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each channel's master volume bypass (CxVBP) is in its own
configuration register, C2CFG and C3CFG, not in C1CFG, which holds the
channel 1 bit.

Fixes: 2439ea1f0f8f ("ASoC: sta350: Add codec driver")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/sta350.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index d2b6f73d5e10..95aee5aa2bff 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -477,9 +477,9 @@ SOC_SINGLE("Ch2 EQ Bypass Switch",
 SOC_SINGLE("Ch1 Master Volume Bypass Switch",
 	   STA350_C1CFG, STA350_CxCFG_VBP_SHIFT, 1, 0),
 SOC_SINGLE("Ch2 Master Volume Bypass Switch",
-	   STA350_C1CFG, STA350_CxCFG_VBP_SHIFT, 1, 0),
+	   STA350_C2CFG, STA350_CxCFG_VBP_SHIFT, 1, 0),
 SOC_SINGLE("Ch3 Master Volume Bypass Switch",
-	   STA350_C1CFG, STA350_CxCFG_VBP_SHIFT, 1, 0),
+	   STA350_C3CFG, STA350_CxCFG_VBP_SHIFT, 1, 0),
 SOC_ENUM("Ch1 Binary Output Select", sta350_binary_output_ch1_enum),
 SOC_ENUM("Ch2 Binary Output Select", sta350_binary_output_ch2_enum),
 SOC_ENUM("Ch3 Binary Output Select", sta350_binary_output_ch3_enum),
-- 
2.43.0

