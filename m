Received: from cmccmta3.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56344202C20;
	Thu,  5 Dec 2024 09:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733392539; cv=none; b=Uzf1DSiSaaq1HC4z7FN/3l/BaWkl5qoRxthNxdCXKHsGPgWQ2y2ndg1zUxcGP8kQmgY4nOTBU99FVaNeA7aC5BejhkxvvD32nB2BAqZj3PbGrQjOPwBwjeZicy6mzz6Akuc9MlnUglNB4tWFGfIA0vXjY1qKqZmI5E7MYE+RApU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733392539; c=relaxed/simple;
	bh=iRjDAgRpjerTWwbcREdXfoOcXRzk3JFsd6ZpFcFRZ2c=;
	h=From:To:Cc:Subject:Date:Message-Id; b=u32k+Jr2AyUcNMQG90KA04gVb8m+VdBxsgSYi2kN/PJLlaN4bB2kCGSFGiSzntN/1z1VUFa27RCsrZ/OLjk77yLosN2HLl0ClIuxhNHw5NuD3iN447VhGHgbwdMk/fSsU9pBFSQcmy3esR3ixiC9BKZCRiel5Rglqy0ldANwIqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee9675177bc2f7-dc30f;
	Thu, 05 Dec 2024 17:51:58 +0800 (CST)
X-RM-TRANSID:2ee9675177bc2f7-dc30f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee9675177bd835-9f8b7;
	Thu, 05 Dec 2024 17:51:58 +0800 (CST)
X-RM-TRANSID:2ee9675177bd835-9f8b7
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	zhujun2@cmss.chinamobile.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: lola: Fix typo in lola_clock.c
Date: Thu,  5 Dec 2024 01:51:56 -0800
Message-Id: <20241205095156.17837-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The word 'ajustement' is wrong, so fix it.

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/pci/lola/lola_clock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/lola/lola_clock.c b/sound/pci/lola/lola_clock.c
index cafd30e30..2e73fbf33 100644
--- a/sound/pci/lola/lola_clock.c
+++ b/sound/pci/lola/lola_clock.c
@@ -35,7 +35,7 @@ unsigned int lola_sample_rate_convert(unsigned int coded)
 	default:        return 0;   /* error */
 	}
 
-	/* ajustement */
+	/* adjustement */
 	switch (coded & 0x60) {
 	case (0 << 5):    break;
 	case (1 << 5):    freq = (freq * 999) / 1000; break;
-- 
2.17.1



