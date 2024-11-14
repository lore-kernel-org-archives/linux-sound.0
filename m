Received: from cmccmta1.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA1A1F585B;
	Thu, 14 Nov 2024 07:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731571113; cv=none; b=hjmJfYulnvzUquhZnnbBNrwtJNQytU+KC8RFjxZHqVAydzP2myrZz2nezP/L0mo0wC3uJoV8LQJECsopukwZG+WADuqOpBFSBoBtJw1DiiCucrACtaRRnYckZOQSleMFXf100v6+G2xmVPlcdo/nwag0EV+s0kFzLyaAgZgBd30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731571113; c=relaxed/simple;
	bh=XMp3TMytkuF37WuabIvY8hzRJfVme/+ExeXC30MjxBg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rjw0E+cVvuK98GTjVJKeDNmrWRWH/I465+ka0QIkmDWY8jqP5Qky2SRzfmQM8i1oG+5bs18xay6BlmLbW0CUw3Md1kbGtb5O+kKZaIGOyzluvNd/Dk75G76yRFzDoihECpzJvKx8p2/CT+zBO5+XJtARv/0fn+QW0Vb5e1FzGPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46735ad9e2a5-f1bae;
	Thu, 14 Nov 2024 15:58:24 +0800 (CST)
X-RM-TRANSID:2ee46735ad9e2a5-f1bae
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from localhost.localdomain (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96735ada06f4-b2187;
	Thu, 14 Nov 2024 15:58:24 +0800 (CST)
X-RM-TRANSID:2ee96735ada06f4-b2187
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: perex@perex.cz
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] ALSA: ump: Fix the wrong format specifier
Date: Thu, 14 Nov 2024 15:58:22 +0800
Message-Id: <20241114075822.41614-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

The format specifier of "unsigned int" in snprintf()
should be "%u", not "%d".

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 sound/core/ump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index ab4932dc499f..5d4dd207e5ab 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -387,7 +387,7 @@ int snd_ump_block_new(struct snd_ump_endpoint *ump, unsigned int blk,
 	fb->info.first_group = first_group;
 	fb->info.num_groups = num_groups;
 	/* fill the default name, may be overwritten to a better name */
-	snprintf(fb->info.name, sizeof(fb->info.name), "Group %d-%d",
+	snprintf(fb->info.name, sizeof(fb->info.name), "Group %u-%u",
 		 first_group + 1, first_group + num_groups);
 
 	/* put the entry in the ordered list */
-- 
2.33.0



