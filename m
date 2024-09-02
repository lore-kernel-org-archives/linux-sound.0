Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F051817C9A4
	for <linux-sound@vger.kernel.org>; Mon,  2 Sep 2024 07:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725260884; cv=none; b=YknfgbU07dtiZ2hit0FHDv2KwYKLSAFzOSBqahj/Haum9MMl3EUW4q93T+2OcGWGN+tXoifbWMNbEV8ETu4h7FiwAjvP8gR5HbpOQdPNtJpIvF6w+j0StwrG4PYd/8UB/AjhUiY9Op4Nt6JDTijZ4JAbqlZP0cw6lLOC7iSvkW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725260884; c=relaxed/simple;
	bh=CpAPWKER8xOHl2OqxqSvXxHa0/V3Ya6Heee63yJjhRM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uj3iB+OuZCQIRI0c3DdndYT7LZaqyMbKaOgripHXL/DTC5/AQVUFQGQcvDAY9oTyaCjVHbZbmFBStklcNJO2Hwv/6GDiGzz8faPU91E5F6XOo3ZvEepkmtLzilBQuQfDKOWd58YDVHwDK3To6ObayuzX5LkWnxWP6bNzvYcjGp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Wy0FT2xM2z1S9Rf;
	Mon,  2 Sep 2024 15:07:41 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 8BADC1A016C;
	Mon,  2 Sep 2024 15:07:59 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 2 Sep
 2024 15:07:59 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <ivan.orlov0322@gmail.com>,
	<linux-sound@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] ALSA: core: timer: Use NSEC_PER_SEC macro
Date: Mon, 2 Sep 2024 15:16:22 +0800
Message-ID: <20240902071622.3519787-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemh500013.china.huawei.com (7.202.181.146)

1000000000L is number of ns per second, use NSEC_PER_SEC macro to replace
it to make it more readable

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 sound/core/timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/timer.c b/sound/core/timer.c
index 7610f102360d..4315d1e98ebf 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -1174,7 +1174,7 @@ static int snd_timer_s_close(struct snd_timer *timer)
 static const struct snd_timer_hardware snd_timer_system =
 {
 	.flags =	SNDRV_TIMER_HW_FIRST | SNDRV_TIMER_HW_WORK,
-	.resolution =	1000000000L / HZ,
+	.resolution =	NSEC_PER_SEC / HZ,
 	.ticks =	10000000L,
 	.close =	snd_timer_s_close,
 	.start =	snd_timer_s_start,
-- 
2.34.1

