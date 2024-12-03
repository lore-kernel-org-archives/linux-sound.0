Received: from cmccmta2.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07931DE89C;
	Tue,  3 Dec 2024 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733218979; cv=none; b=KCC0DkyZJkT/lYtg/ULi8ZSVzvy9gTZfnJtrOcF5fFg1CRmd5Nqp3lZdJNjFI3SUyxMssBPT4id949RxNyZLFcE7Tav9JLBjzDplxUuv5WOBNfzfpWebuoVlrz/CSrvW4mcVJvWlV1v8IXBS24cWuYGBEvaKXL1oMn1ypXSrT2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733218979; c=relaxed/simple;
	bh=+yjjcxVwvFLNfysfuyD0wjRizb8/bA7tfeY8RuPXPbQ=;
	h=From:To:Cc:Subject:Date:Message-Id; b=fCioQQrby1ibv0MTqcuBov4WcBZmWyl3NfX2JqKbrZGDwzM8VJ1VSSXx6i0hFg27/OxAW2OPf3dwbQp5k8dxHGsA8zmAZbUHyDJk4oPP1aXjIznYXr/vDc0s0YFr7lqdM7//yZrvbcRV3OZr4QpshR6fWz7HtTfSScwuUIp1C24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee8674ed29c702-fd74e;
	Tue, 03 Dec 2024 17:42:52 +0800 (CST)
X-RM-TRANSID:2ee8674ed29c702-fd74e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee9674ed29b6de-27215;
	Tue, 03 Dec 2024 17:42:52 +0800 (CST)
X-RM-TRANSID:2ee9674ed29b6de-27215
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhujun2@cmss.chinamobile.com
Subject: [PATCH] ALSA: hda: Fix typo in hda_sysfs.h
Date: Tue,  3 Dec 2024 01:42:50 -0800
Message-Id: <20241203094250.8312-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The word 'accodingly' is wrong, so fix it.

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/pci/hda/hda_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/hda_sysfs.c b/sound/pci/hda/hda_sysfs.c
index 265fd4737..140e24bf4 100644
--- a/sound/pci/hda/hda_sysfs.c
+++ b/sound/pci/hda/hda_sysfs.c
@@ -648,7 +648,7 @@ static const struct hda_patch_item patch_items[NUM_LINE_MODES] = {
 	},
 };
 
-/* check the line starting with '[' -- change the parser mode accodingly */
+/* check the line starting with '[' -- change the parser mode accordingly */
 static int parse_line_mode(char *buf, struct hda_bus *bus)
 {
 	int i;
-- 
2.17.1



