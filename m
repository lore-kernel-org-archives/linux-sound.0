Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792996986;
	b=yb4KcziUJcuq1+qy3L2ncgixDPBmz8vKqcFnVhy+NsPmdWaUUyY/XoF/1iwgYqlDz+aJ
	 gb+DMTfUwWlgW7NYO/j15t89Znm90fe4kNM1k1NP5tuEbT0DLRQkZys+oGWgZpy2yrYt2
	 mnkYBoDyw86urmZcHbOv0dZ6e5a2H9B8sQruXkUJZmpoN3YHUql1iGXMg7F3x9wJ9D4hB
	 Hz3b+kJMeTl2/rW9JzwCg6/J6i+14eeyJ7ou6YKSIueCPSvl9tdvUsnflYz4fwFlNM7Nh
	 EcO81PXPlUODX/5s/QT8N6XVyDs5q1OI0epP98pUhzxUIlB0yimvxvJ9xfYu0TYCGiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792996986;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
	bh=dqlRUrYLpA8XNivxs2J5niBVVskJNEOQrFsmOLL5Evk=;
	b=IWvuKuKACDrHfPn3tN+lfnf2R9wHUjm4ltBOh6NUndrsPMnlykw3OtmK4VwVQBzVwXRy
	 BnpAIbxoK3vYLkQ0xgRV4uVIxRg3ffMUXPkLKRfcjaL5pg/LOw4zDP5QjE5/r/51Jr446
	 NKV1lKvFgcz9pEmFy7vqa48MQ//dBdJm51XlWwBXWBnQi/jOGzb8ub5AB4jxRxieFeSvo
	 AaKGN+TH5sHx9NIEvHiXc0VdS71fGh0VAKwEQfK2sIHTYt1b4v4tk3/LMTRBrXzGVO8EZ
	 n8SJ93KkTBKY5SfudRgnB2KxiO1X8uLErZmYKgUpekhOkux7G1XFMcVErFuPaqPyGeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=202.108.3.78
Received: from r3-78.sinamail.sina.com.cn (r3-78.sinamail.sina.com.cn [202.108.3.78])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3696F606A31D
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 06:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3696F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6ADEF66D00002520; Mon, 26 Oct 2026 14:42:55 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: A290E5DA7E39423BA7711774D2BE5540
X-SMAIL-UIID: A290E5DA7E39423BA7711774D2BE5540-20261026-144255
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v2 1/3] ASoC: es9356-sdca: Modify the timing and configuration of headphone events
Date: Mon, 26 Oct 2026 14:42:49 +0800
Message-Id: <20261026064251.15017-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261026064251.15017-1-zhangyi@everest-semi.com>
References: <20261026064251.15017-1-zhangyi@everest-semi.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Change the time it takes to create a workqueue from 280 ms to 50 ms to
ensure faster response to button presses.
Modify the settings related to buttons after plugging in the headset
to ensure more accurate button type recognition.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es9356.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index b8b3ffc13..4bb51dd8d 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -352,7 +352,7 @@ static int es9356_sdca_headset_detect(struct es9356_sdw_priv *es9356)
 	if (reg) {
 		regmap_write(es9356->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_UAJ, ES9356_SDCA_ENT_GE35, ES9356_SDCA_CTL_SELECTED_MODE, 0), reg);
-		regmap_write(es9356->regmap, ES9356_HP_DETECTTIME, 0x75);
+		regmap_write(es9356->regmap, ES9356_HP_DETECTTIME, 0x74);
 	} else {
 		regmap_write(es9356->regmap, ES9356_HP_DETECTTIME, 0xa4);
 	}
@@ -403,7 +403,7 @@ static void es9356_interrupt_handler(struct work_struct *work)
 			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
 			SND_JACK_BTN_4);
 		mod_delayed_work(system_power_efficient_wq,
-			&es9356->button_detect_work, msecs_to_jiffies(280));
+			&es9356->button_detect_work, msecs_to_jiffies(50));
 	}
 }
 
@@ -450,7 +450,7 @@ static void es9356_button_detect_handler(struct work_struct *work)
 			SND_JACK_BTN_2 | SND_JACK_BTN_3 |
 			SND_JACK_BTN_4);
 		mod_delayed_work(system_power_efficient_wq,
-			&es9356->button_detect_work, msecs_to_jiffies(280));
+			&es9356->button_detect_work, msecs_to_jiffies(50));
 	}
 
 	return;
@@ -1000,10 +1000,10 @@ static int es9356_sdw_interrupt_callback(struct sdw_slave *slave,
 		count++;
 	} while (stat != 0 && count < retry);
 
-	/* The 280 ms figure was determined through testing */
+	/* The 50 ms figure was determined through testing */
 	if (status->sdca_cascade && !es9356->disable_irq)
 		mod_delayed_work(system_power_efficient_wq,
-			&es9356->interrupt_handle_work, msecs_to_jiffies(280));
+			&es9356->interrupt_handle_work, msecs_to_jiffies(50));
 
 	mutex_unlock(&es9356->disable_irq_lock);
 	return 0;
-- 
2.17.1

