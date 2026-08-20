Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C917242315C;
	Thu, 20 Aug 2026 11:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787225286; cv=none; b=XaqUBti46rLQfGdmPe+kUuXTr1ygXmaW2c/GEH7FXamnQdNce+uNDWjv/QKiRcwzluuH1gGIANmrec9AEnEiqgTr+fjxpJ/reCWdehxG+vJntSDC5kTpat9gN1iYtEtTRr8OOiB01JbpgzWclN4OBjfTBJWPiMQg+qEj/ERctdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787225286; c=relaxed/simple;
	bh=QAkt9UKerK/CRTdIjw50n8mUXcB0P3r9QzeezLp1flc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a1yVRGT94vvR+eDmWcgTQdIGmSWPjWIkl1Xmwhxv8camm5uKdP9MBn2HHUiCMh5sC2CLYOtSb7Z1Xys81ozpHuSFr31vcCiDURuxtdtVnxE2Nl5Ss7YXBo4I1ioSx9ykBzoQoRJp3eMK/LNRrrQ6Ne0zk/rmV0o1w3uX1dOActQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=dKrxn5zV; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="dKrxn5zV"
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ab5f44d5;
	Thu, 20 Aug 2026 19:27:56 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: [PATCH] ALSA: mtpav: shut down output timer before card teardown
Date: Thu, 20 Aug 2026 19:27:49 +0800
Message-Id: <20260820112749.9195-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa01eed7e5e03a1kunm429c11d916a6a2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0geVhlCSkNLTkNIQx8fQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=dKrxn5zV2SrXS4rM4rCkHaAvju25THtbjeO4jqy3u/SSslPveJmxou3qwFhjnaMYBaXmgWRBUwPhA9SqctmPUt6vRv8EnHSidFxtAr8DggS79XgOGPmnzzAllHQMXs6DeqQjQjcBNc0vCzODt64ckvEVmMmUpE+Nj3yFahdDlr4=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=a6ps+BnFjZHjQwboZci7s5UXXkn9e1sLU7TDgnspGj0=;
	h=date:mime-version:subject:message-id:from;

snd_mtpav_output_timer() rearms chip->timer while holding
chip->spinlock and accesses the card-private mtpav state.

snd_mtpav_free() currently takes the same lock and calls
timer_delete() when the timer is active. This only removes a
pending timer; it does not wait for a callback that is already
running and does not prevent the callback from rearming the timer.

A callback running on another CPU can therefore continue after
snd_mtpav_free() releases the lock and access the card-private
state while the card is being torn down. It can also rearm the
timer after timer_delete() has returned.

Call timer_shutdown_sync() without holding chip->spinlock. This
waits for any running callback to finish and prevents further
rearming before the card-private mtpav state is released.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
 sound/drivers/mtpav.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/drivers/mtpav.c b/sound/drivers/mtpav.c
index d31eadf4be5f..1ed6d4f0cb62 100644
--- a/sound/drivers/mtpav.c
+++ b/sound/drivers/mtpav.c
@@ -642,9 +642,7 @@ static void snd_mtpav_free(struct snd_card *card)
 {
 	struct mtpav *crd = card->private_data;
 
-	guard(spinlock_irqsave)(&crd->spinlock);
-	if (crd->istimer > 0)
-		snd_mtpav_remove_output_timer(crd);
+	timer_shutdown_sync(&crd->timer);
 }
 
 /*
-- 
2.34.1
