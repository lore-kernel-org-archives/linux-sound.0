Received: from cmccmta3.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609A118A6C8;
	Tue, 15 Oct 2024 07:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728976115; cv=none; b=CMlSnwI/zJPFxtBKdvLRDZkOBlR/2XmkeoLjKCyfA77q6qCaUJILmQoqczTQ1A9RwN3eM7wjXahEXzWAVef+tsAl8BdGIjvntE4xhEzUOvcgWsSqfFZahlytjZdb5/d4a88y8YceDCUVYaKHoo4t21CDGheR53+JTusi9mahfOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728976115; c=relaxed/simple;
	bh=CIfFpWyaRMnTNin1IxZCFP/Rnjczo5uyw5p2dmpViik=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SEbhZ2i+eQJcMkdHkuta9SLy8C48HpmLZeuYfseRzZW6mq4WAN+gYx9YWDR86Mfccwcc3UdlLXxp5PBjXkoJ70xzMSxtVY0b2YEShf9xhjpiW/sOQYr53IVJqnM9O7CfScYACtDQjGAE/uVXiyMujAVt2GmwkFew0TPAvf+Um8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee9670e14eced5-26ee2;
	Tue, 15 Oct 2024 15:08:28 +0800 (CST)
X-RM-TRANSID:2ee9670e14eced5-26ee2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.103])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee6670e14ebe25-f9f0c;
	Tue, 15 Oct 2024 15:08:28 +0800 (CST)
X-RM-TRANSID:2ee6670e14ebe25-f9f0c
From: Liu Jing <liujing@cmss.chinamobile.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Jing <liujing@cmss.chinamobile.com>
Subject: [PATCH] ASoC: fix code redundancy in sound/soc/soc-dapm.c
Date: Tue, 15 Oct 2024 15:08:26 +0800
Message-Id: <20241015070826.5933-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the dapm_widget_power_check function, the logic for assigning the value of w->new_power can be simplified
using the conditional operator

Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
---
 sound/soc/soc-dapm.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 9330f1a3f758..865940de32c5 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1428,11 +1428,7 @@ static int dapm_widget_power_check(struct snd_soc_dapm_widget *w)
 	if (w->power_checked)
 		return w->new_power;
 
-	if (w->force)
-		w->new_power = 1;
-	else
-		w->new_power = w->power_check(w);
-
+	w->new_power = w->force ? 1 : w->power_check(w);
 	w->power_checked = true;
 
 	return w->new_power;
-- 
2.27.0



