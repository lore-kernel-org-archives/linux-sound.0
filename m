Received: from cmccmta3.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED9D175BF;
	Fri,  6 Dec 2024 03:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733455063; cv=none; b=jW+bfFvFtku1RRqLd+l0GJ3WrfYGtL9AZeoUtim8ngjeA2mueqg9p3mVkaU7Z6/DT/bwN8vV89rsb+k81i3jeWByvTQOnkEZwPEmgOOUF6qkjbnMy15WVgybOhdp0ufJARUUGDuq8bVlOmHPPrgsPT+V3ZzfxWQ2yZGWSpk3NMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733455063; c=relaxed/simple;
	bh=Lh1zeS128y5mpgYqRCdcbUY/p/5od+6SmppBbpsSP3E=;
	h=From:To:Cc:Subject:Date:Message-Id; b=JuvB9Q/i5B+4VXtSg5krHuAhsRkbjwMfwjyHwwKFJRXMR9weRY+C60VnoxBkJSQ1pkr28Ure19XRQXwkeGnj0ThJwafO6Ngq/q926rVB88iza0UKqWEzW1N66DDWooFS2i8k8JIFAOyYiF4/XMuzaA3eGe8+u4c0GH8doVR/cwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee967526cc9c6f-e1c87;
	Fri, 06 Dec 2024 11:17:29 +0800 (CST)
X-RM-TRANSID:2ee967526cc9c6f-e1c87
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee367526cc8e77-d1419;
	Fri, 06 Dec 2024 11:17:29 +0800 (CST)
X-RM-TRANSID:2ee367526cc8e77-d1419
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	zhujun2@cmss.chinamobile.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: seq: oss: fix typo in seq_oss_init.c
Date: Thu,  5 Dec 2024 19:17:27 -0800
Message-Id: <20241206031727.20500-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

The word 'annoucement' is wrong, so fix it.

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/core/seq/oss/seq_oss_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
index 676246fa0..e0733efba 100644
--- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -111,7 +111,7 @@ snd_seq_oss_create_client(void)
 
 
 /*
- * receive annoucement from system port, and check the midi device
+ * receive announcement from system port, and check the midi device
  */
 static int
 receive_announce(struct snd_seq_event *ev, int direct, void *private, int atomic, int hop)
-- 
2.17.1



