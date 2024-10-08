Received: from cmccmta2.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536441684A4;
	Tue,  8 Oct 2024 06:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728368727; cv=none; b=jLJzH/pGtwINvoZvdALJqmHdr92jw1r/ZarxW1skHJxjPhm4NfcDsojNFXSoipXB96fmxDFD2nlhqaRFjPyNjNNqkhTaYv+/2KhjLrRda/djqU7hciwRm11otDyEz6BdTD7LYiWxnJdJueZWXLCrBzHJdwpY4RctqD9vflVvKW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728368727; c=relaxed/simple;
	bh=Sw6TW99Y2bN+fpZnhTuDS7fuaQiPRcTWhOhjUuxyZsU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=f1BN28sVtkIvfaSijdFvLKHaXF8yQ/MSCQe3zDDdbCcMk+otcKzjhsFJ5IAgM0TB0WZIuHWL3XE2/rtGipVGiqv6BA7snrikQr21BMEl0f1y0c/2lUkR4ztjdIMziKZQgLuVqFZohUx03kBD6tmNRhemqhF8MIiMdeqpKrsCajQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56704d050d71-e0d78;
	Tue, 08 Oct 2024 14:25:21 +0800 (CST)
X-RM-TRANSID:2ee56704d050d71-e0d78
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26704d04f6d7-9755c;
	Tue, 08 Oct 2024 14:25:21 +0800 (CST)
X-RM-TRANSID:2ee26704d04f6d7-9755c
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	zhujun2@cmss.chinamobile.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Sound:pci: Remove redundant code in stac9460_dac_vol_put
Date: Mon,  7 Oct 2024 23:25:17 -0700
Message-Id: <20241008062517.12282-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Simplified conditional block by removing redundant braces

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/pci/ice1712/prodigy192.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/pci/ice1712/prodigy192.c b/sound/pci/ice1712/prodigy192.c
index 096ec76f5304..a12dafbf53ab 100644
--- a/sound/pci/ice1712/prodigy192.c
+++ b/sound/pci/ice1712/prodigy192.c
@@ -170,14 +170,9 @@ static int stac9460_dac_vol_put(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 	tmp = stac9460_get(ice, idx);
 	ovol = 0x7f - (tmp & 0x7f);
 	change = (ovol != nvol);
-	if (change) {
-		ovol =  (0x7f - nvol) | (tmp & 0x80);
-		/*
-		dev_dbg(ice->card->dev, "DAC Volume: reg 0x%02x: 0x%02x\n",
-		       idx, ovol);
-		*/
+	if (change)
 		stac9460_put(ice, idx, (0x7f - nvol) | (tmp & 0x80));
-	}
+
 	return change;
 }
 
-- 
2.17.1



