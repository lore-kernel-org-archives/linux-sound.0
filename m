Received: from cmccmta1.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFB718B09;
	Fri,  6 Dec 2024 02:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733451428; cv=none; b=haHYFAAh2XPsRBxcegvkvCYJQZVLuh5q++LWxByIh9ZqL4uzsgK8P9xeJaDClRyoMY/wIxxoOW+JzFlP+KYvt73zt29m57fyYTQoAAinsb/gGK7yU9339Sr+pJRvAHINxnGLGdoAj2cbtHFTksrqBSg0/OZ4voNRHeyCVNA4ToQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733451428; c=relaxed/simple;
	bh=3rVlvT5hQvpxgtxAGjWYKOq0CzXq023vhksmYQupQEk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j/ba+BCybRJIdkRYIwwe/fyA6Vtw0OPrriziJxstc4aohlgPbe46r7/jWxl35++Prel6Aum1N/RIYI2u1znczZeqDH5t9Sz2bK8UOtMrDFNXlXUR1B/5fcMl3zBMG+AU6UdJWT+Fs7/qH0iFrEt2kbjR+f6BUyVbQQt5SY9lncI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee467525e97705-ac00f;
	Fri, 06 Dec 2024 10:16:55 +0800 (CST)
X-RM-TRANSID:2ee467525e97705-ac00f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee667525e979e1-c8dcc;
	Fri, 06 Dec 2024 10:16:55 +0800 (CST)
X-RM-TRANSID:2ee667525e979e1-c8dcc
From: liujing <liujing@cmss.chinamobile.com>
To: perex@perex.cz,
	tiwai@suse.com,
	drhodes@opensource.cirrus.com,
	jbrunet@baylibre.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liujing <liujing@cmss.chinamobile.com>
Subject: [PATCH] ALSA: cmipci: Modify the incorrect format specifier
Date: Fri,  6 Dec 2024 10:16:47 +0800
Message-Id: <20241206021647.2343-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace %d with %u in snprintf() because it is "unsigned int".

Signed-off-by: liujing <liujing@cmss.chinamobile.com>

diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index e3cac73517d6..cb8593c376ee 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -3084,7 +3084,7 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
 			}
 		}
 	}
-	sprintf(card->shortname, "C-Media CMI%d", val);
+	sprintf(card->shortname, "C-Media CMI%u", val);
 	if (cm->chip_version < 68)
 		scnprintf(modelstr, sizeof(modelstr),
 			  " (model %d)", cm->chip_version);
-- 
2.27.0



