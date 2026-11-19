Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075156;
	b=Eel1FC1yh63F1zEkQGQlOOuyZpYh+ohPb3vCodXePo18rVHK+N/xakzzdpONliOqk9HL
	 XPeHabjzLQX4VeQ81RmoRpuGgrQlbDuzmW9/kv6dBW3OgkM+Fm05k6BBBKB4fg7cooKw8
	 F0QLeiPEyGhMkWcd6HBPueyGk/ESwgaWdq+4M4iQuHkXBbmTWUiYlqeAB9NUz557ECHaY
	 yNP7U8vyzLg/boF5oVK0UGPks809h3TgY3JQs2AAOW02XXfe4/9IT7gjQ2KWAJySHp+1H
	 DmrUbBN6smronemwDT0GjUYqFXfiwAyZfdI9TYzdqHzwbY0KDbAKjm8ug02UYC1Lm/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075156;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J8sp33TxN8sYSdWCIznAAYJLCH3d5/s4q2B6VwSxRt4=;
	b=M3R+BboizajvgpD0L3tTo4LCfmnbG7r6vhZcvOoTSNEAaYthAA8IMyDMll5ONmpVX9AN
	 lcu3Ka0uxTPIPzi5z+sn8xE8dTYwq2sIn+XxAb0LmeBVfbpGWTbaXy91YSeYFq5kpDzIU
	 UK9JkgAH/R9LnhTuLxwaSvgr+I12qg6XxedElSPZW0Ld0obI2HUkHZK0LKG7fClM4XkrU
	 3kEtkN1+EsD6CDccvaTIpFUzRXeTQcXM8Xutwwfslq5cKCv6wHJxUnglJpD8ewXbONeh/
	 gT7IBzG0E9aoj8jFVAEYG5h3oxUESfP1GhFmq2CRTqcq7VZBp2s70nKmhIT5gBUdtjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=QkMK89va;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F221606A32A;
	Thu, 19 Nov 2026 07:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F221606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=QkMK89va
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=QkMK89vaVhe1E4uSnihKIjUo8MtZQioFfrhu4HslvMqka7dOe23pvWSSMtD6U1SdNpizOwmUiPIrb
	 gWbz+1WqvYtuzjdcMKQszNPBOhK2/9FjEWPQcZbzjThQ8JGCm5Sx8bkw6+Db0ukhO+HQ+QXChUfP96
	 ZQ+A003lNVqw3ytg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86afeac503d3-bba8d;
	Thu, 19 Nov 2026 15:59:13 +0800 (CST)
X-RM-TRANSID:2ee86afeac503d3-bba8d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86afeac506fa-5df20;
	Thu, 19 Nov 2026 15:59:13 +0800 (CST)
X-RM-TRANSID:2ee86afeac506fa-5df20
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] ASoC: max98520: Handle reset and register restore errors on resume
Date: Thu, 19 Nov 2026 15:59:12 +0800
Message-ID: <20261119075912.50227-1-zhujun2@cmss.chinamobile.com>
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

max98520_resume() ignores errors from both the software reset and
the register cache sync. A failed I2C transfer can therefore leave
the amplifier incorrectly configured while resume reports success.

Restore the register cache only after the reset write succeeds. On
either error, restore cache-only mode and return the error.

Fixes: f88ee76b8645 ("ASoC: max98520: add max98520 audio amplifier driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/codecs/max98520.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index 56e559db88de..a1996568dda4 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -643,11 +643,16 @@ static int max98520_suspend(struct device *dev)
 static int max98520_resume(struct device *dev)
 {
 	struct max98520_priv *max98520 = dev_get_drvdata(dev);
+	int ret;
 
 	regcache_cache_only(max98520->regmap, false);
-	regmap_write(max98520->regmap, MAX98520_R2000_SW_RESET, 1);
-	regcache_sync(max98520->regmap);
-	return 0;
+	ret = regmap_write(max98520->regmap, MAX98520_R2000_SW_RESET, 1);
+	if (!ret)
+		ret = regcache_sync(max98520->regmap);
+	if (ret)
+		regcache_cache_only(max98520->regmap, true);
+
+	return ret;
 }
 
 static const struct dev_pm_ops max98520_pm = {


