Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087625;
	b=caiCZmTE8aAWyjDE9jz0cxNHcSQsxKyJ7IOjFvYPdrpJI5hkMF5UazdRsgqsc47kFAGb
	 paKiEndd8FeJyminAlyZkgj3TOkH5ecWjgt1Mu/IoY6cdj3nc9NKmuRdt/pL4zz3lGxDw
	 eFXBi7e2eyCU0gEmzJ7nH+0vtl9BCorxxR9f5y434AqN8yrLK6LaIrKCeYzsdunSB4wS1
	 JAtc9xu6xoiPCiIPAtusPrWds+H4qZva3ey5AUA5Z1fAQME/fm0tBkHfAcw44dzr8q9zP
	 g46C/ablCYqDMFPoutHy6UxPrc6OlTBVR2o9pO4B65K62s7GnXQ186qXNhL10U+2Szw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087625;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=4kIJHlIY7ogzb5xb3pYDsa9MsUCMZi6GMeJqSqIA0UI=;
	b=e31byKGlFqxk7B+ejVb5KsYoGwjvTXSitmoAhTwLjJ+PKfYNQP/UNUSOEFG52M8EWSVo
	 DANuafocvy9Y45k6NcAD7f1Us/wIstx7Yh4jQIJ6hbepUbqsqujlw2zDEB28eKOALEbX7
	 nwXqmD5qcqe3HxtmP3iXCulWmzBr0E2zfg/61VJlWyw/QFhfxrJUsCErPPen1A7G3YV9N
	 HEKXYqstHClCVwfmXv/h8koEVkaBeCIWEO6EwmQek5bTgl7w87ToRUxClDA0Xx2Bz00Vq
	 Mwtro9AQg/42BNHqWlY1qu4pWG8ve2jUun2fVNfBMZa0J+Dj3ABgpJXfYcQgwyT2MjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=61.135.153.176
Received: from smtp153-176.sina.com.cn (smtp153-176.sina.com.cn [61.135.153.176])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0A6606A320
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 11:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C0A6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([112.64.39.13])
	by sina.net (10.54.253.38) with ESMTP
	id 6AFEDCF800002D23; Thu, 19 Nov 2026 19:26:51 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 418E4F2AE7394B0EB37F722B04C5DCD8
X-SMAIL-UIID: 418E4F2AE7394B0EB37F722B04C5DCD8-20261119-192651
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 2/4] ASoC: codecs: ES8326: issue about capture pop
Date: Thu, 19 Nov 2026 19:26:45 +0800
Message-Id: <20261119112647.6728-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261119112647.6728-1-zhangyi@everest-semi.com>
References: <20261119112647.6728-1-zhangyi@everest-semi.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

The original 40 ms setting did not work with all CPUs.
To achieve better recording performance on most platforms,
the 40 ms setting has been extended to 100 ms.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 86d73281070d..f8a6769d0d6e 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -785,7 +785,7 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 			}
 
 			queue_delayed_work(system_dfl_wq, &es8326->capture_pop_work,
-				   msecs_to_jiffies(40));
+				   msecs_to_jiffies(100));
 		}
 	}
 	return 0;
-- 
2.17.1

