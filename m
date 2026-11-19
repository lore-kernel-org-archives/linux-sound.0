Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075151;
	b=jUGxwZ8WGXK2MOcjBstMHpunT1WRaIbUNUPrfSv4tLWnGkTHWPPCMlF7FqIgFOLg85Vr
	 qJyWvvNiahEpIcPfI5iVzl9Q+c/DvwrdHCLPzxgHEK4OkgY9wTA6obl2cuquKpeHgUH3D
	 xwy6REepNis7aotO+J1YtdyirphmThfXdmnhLRiuC74bo403sZ/NEOZWiQAk1XZnoRTHl
	 BEvJnYHBsXrsR04Ug/TzgYi3El0CRkZfioZWbBLS4y6nDLlE3010oXh3HpgJddYoui/sm
	 fRHsWEnN0iHibvKVPO4x4Oxg57N1/AZoTPHJs6NvveaeouqYZbmYYqOcP0143gGFJzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075151;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i+TSTRKNm+cn7P81lHSoAK4bd1LwYiQ07noc/rvQFT0=;
	b=eruN2wi86fMDbFpoUBm8iFIiitVoBGMulWJFhR2cGdT4G6aygdy4GAjFyz/0UE8pVGeQ
	 6WzwIsNYt64fCvFDwVoV1WeT9Y5BWLGla2fnJavb1CqTAInWJdSxa4UtN+GOJvMrDAFfD
	 IuNQpYMVkKGftn9+gl1tmSZi/Bb/nwAXTOSWOMr45B+P4vBVe5t8rg+IdtBsNFnZnpsbJ
	 N6BRhft30JOVYlIDx/cMkqn8lRJPys2e57t3D0X133LYY0jLlK6lyEwNT14jfl1TqfYLt
	 +qmhYV5oyMVMRhyYE2qB6vJ5xiQ37psjzfsUObdpPQeEY8+5MzkNv0qJObXHQLx/Gyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Uf8xcxzx;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AE0606A320;
	Thu, 19 Nov 2026 07:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5AE0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Uf8xcxzx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Uf8xcxzx94iKtWuiAD3W31c1Wh7R4j/FV0MKlqGF1YKjfTJzjJ0CRRr9eR9baZnyypjLvZS424Y6u
	 ghVjLhMhyRqHyjZLkX1bjzx/61AOFHyLO22f/xAg3HlvV5u3Qm0Qi4i8QdvyfhFhE1hnB1FM4isbnE
	 9HxH4JXr9/zwnqK4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66afeac4b111-e83c7;
	Thu, 19 Nov 2026 15:59:08 +0800 (CST)
X-RM-TRANSID:2ee66afeac4b111-e83c7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46afeac4beb7-f5a1b;
	Thu, 19 Nov 2026 15:59:07 +0800 (CST)
X-RM-TRANSID:2ee46afeac4beb7-f5a1b
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	zhangyi@everest-semi.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] ASoC: es9356: Handle register cache sync failures on resume
Date: Thu, 19 Nov 2026 15:59:06 +0800
Message-ID: <20261119075906.50214-1-zhujun2@cmss.chinamobile.com>
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

The SoundWire resume callback reports success even if regcache_sync()
fails, leaving the codec with a partially restored register state.

Restore cache-only mode on a sync error and return the error to the
PM core.

Fixes: 5d9cb740cd38 ("ASoC: es9356-sdca: Add ES9356 SDCA driver")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/codecs/es9356.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index f2f658d8bc53..325744711943 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -1199,8 +1199,11 @@ static int es9356_sdca_dev_resume(struct device *dev)
 	}
 
 	regcache_cache_only(es9356->regmap, false);
-	regcache_sync(es9356->regmap);
-	return 0;
+	ret = regcache_sync(es9356->regmap);
+	if (ret)
+		regcache_cache_only(es9356->regmap, true);
+
+	return ret;
 }
 
 static const struct dev_pm_ops es9356_sdca_pm = {


