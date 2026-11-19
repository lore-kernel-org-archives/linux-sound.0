Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075058;
	b=B72PlcHo5SelPxOuIeIZByolfE1aci+qneX9YumSrCSUQaaYOtHatYCkI7k2hAhMqMUt
	 p/4GGgq8YCu12s6cvqmjtIxaguIfBvl33F51OLQYe8REM6H0tyylhFtYqS0s91F1jwX7z
	 PsjkXcNG4FcNKVPNNLPQximNy6tfMAdBo7Os2AOdCOybpehEn4PfHc48FCbsqvSI0HnsA
	 a7gLCyl4DDrRYGrx4bcxDa6NZuU9Kbb7pQA4SlATEFIAhIjsT6ed+jP9WfwfgM3ISVVuq
	 svwoetuG2NPzWBxWf2sIMjaEKt82593dA+wYkpgj7w5YMC9/2KB8lkHlicyPj7jqxDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075058;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SRYWraIuYKdos5Qn7radXz3nCLgEG//umi+1VgOa+rE=;
	b=DCxnq6DOrKlZeA9QEFJIl8JrSi60VBujwntUkis67qwxSVBes8ubV232l/jtMnNv/LBX
	 AjAlIF4sL9yUz2RHqXz6tDlipcH+gyKdDFz+/d7+ou+ChI3xdyidyXAbUV+4YoHgFnxpZ
	 UBadJENJoWU6yCht0GqGIUUxWPKs1NzXds4YwOz8zyoYxL/sEOhxTz8yftzlWCc23VcnS
	 9C73yzbwoaaTMJ+iEqj4aglzbd0pIEo/rE6RbFoupiZj+FUcZg8Ld4PtBVPCk25yAWEBy
	 jOQmyEfsUFGj8V6ae0WUI7Tir+EbzzsEmXQ5u51SnWeabCmkrr6ioMzWsCcASVlyHiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cOFmkwuT;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A9A606A331;
	Thu, 19 Nov 2026 07:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19A9A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=cOFmkwuT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=cOFmkwuTyHujPsc1BgJeCVqRvOqLPdaTfnQwdMujyKLeiHZ61a1RWJHGh1nu/vFV9oO1EiMkZOmHz
	 Ak0F+0ym/enuolk16ozzmoueVzW1oppvRHS9uBGMOKIGR3MkgSyTA3taQ52wOfzT91HVIgdpJ2UQ7N
	 Z0y/Txdbeij8syks=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46afeabec3b1-bb8cc;
	Thu, 19 Nov 2026 15:57:34 +0800 (CST)
X-RM-TRANSID:2ee46afeabec3b1-bb8cc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6afeabed1b1-f4ec5;
	Thu, 19 Nov 2026 15:57:34 +0800 (CST)
X-RM-TRANSID:2eea6afeabed1b1-f4ec5
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] ASoC: cs48l32: Release the runtime PM reference on IRQ read errors
Date: Thu, 19 Nov 2026 15:57:33 +0800
Message-ID: <20261119075733.50138-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cs48l32_irq() acquires a runtime PM reference before reading the
interrupt registers. If either register read fails, the handler returns
IRQ_NONE without releasing the reference. This can prevent runtime
suspend after a bus error.

Use the existing autosuspend path for both read failures. The handler
still returns IRQ_NONE, and a failed runtime resume still exits
without a put.

Fixes: e2bcbf99d045 ("ASoC: cs48l32: Add driver for Cirrus Logic CS48L32 audio DSP")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/codecs/cs48l32.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 72c4bf9e8be6..b6974df7595d 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -1352,7 +1352,7 @@ static irqreturn_t cs48l32_irq(int irq, void *data)
 	ret = regmap_read(regmap, CS48L32_IRQ1_STATUS, &eint_pending);
 	if (ret) {
 		dev_warn(cs48l32_codec->core.dev, "Read IRQ1_STATUS failed: %d\n", ret);
-		return IRQ_NONE;
+		goto out;
 	}
 	if ((eint_pending & CS48L32_IRQ1_STS_MASK) == 0)
 		goto out;
@@ -1360,7 +1360,7 @@ static irqreturn_t cs48l32_irq(int irq, void *data)
 	ret = regmap_multi_reg_read(regmap, eint1_regs, reg_vals, ARRAY_SIZE(reg_vals));
 	if (ret) {
 		dev_warn(cs48l32_codec->core.dev, "Read IRQ regs failed: %d\n", ret);
-		return IRQ_NONE;
+		goto out;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(reg_vals); i += 2) {


