Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE87382292;
	Fri, 19 Jun 2026 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781872128; cv=none; b=It94sXP1fLliTS7fsOm4IFxr793t0TSGtbMRryqtubxVzJE93Xuvk99k4RH61N59j+3hKUsoGWpzDjVceqcZKLSnKXnH6SKkCPxrLnzWqwrA8Wh/bMdjYYnKDX5alSoxrRdAT8aww5kO81UTl/rc0I2BH1MW3TsxUW6r2ucE4ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781872128; c=relaxed/simple;
	bh=IA8kBG1AYMPIBP2Nem2f/uY700Rpw5lsGJDuHCpb3R8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KovzHwAPy3gXNPpl0gcfo5j6meJGhSW6cP6GhQ/kmXq7qZzP4TlushFTXdLQMesXY6v8JsAlC0Y3Q/EtC//nmDqWdiZ2JtzJ6ouLLdRRcOByB9pynpENY0mPhO7gmmB/RfrdplQMkC19z7t6SRWxAr8eBuhwsm0FAP2+f6e5vxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=AqTVBUOl; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="AqTVBUOl"
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 430661e45;
	Fri, 19 Jun 2026 20:23:31 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@linux.intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>
Subject: [RFC PATCH v2] ASoC: rt700-sdw: always drain jack work on remove
Date: Fri, 19 Jun 2026 20:23:25 +0800
Message-Id: <20260619122325.2504287-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619080334.2296419-1-runyu.xiao@seu.edu.cn>
References: <20260619080334.2296419-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9edfd61cab03a1kunm307294d0cd17a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTktJVklPGh8eHkIZSRlOTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=AqTVBUOlrzCw2+abbMj02b3Q8HjGHaQZWTADIMu67qCuOAei3BQeGbzkQa81MBqfD93GtkZIRB60A0rDATqLpSM7SmLykClUYqlVY3k2Bdf6ZnvVR+VfRLMQIXkDDnrNuJWN0ZnqKWpkpDjkHoMOjyUZGMSNhtbj16vGq2yy9z0=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=rj7+XvAGWl5x+sp+Wc3k863z87o/PLrzXQex+bTCC+Y=;
	h=date:mime-version:subject:message-id:from;

rt700_sdw_remove() drains jack_detect_work and jack_btn_check_work only
when rt700->hw_init is true. That state bit is cleared by
rt700_update_status() when the SoundWire slave becomes UNATTACHED, but a
jack work item can already have been queued by rt700_interrupt_callback()
or rt700_jack_init() while the device was initialized.

Do not use hw_init as the remove-time guard for draining these work
objects. The delayed works are initialized during rt700_init(), so remove
can cancel them unconditionally and pair the object lifetime with the
codec-private data lifetime instead of a mutable hardware state bit.

This issue was found by our static analysis tool and then confirmed by
manual review of the SoundWire status, interrupt and remove paths. The
remove path should drain work based on whether the work object exists, not
on a runtime hardware state bit that can change after the work was queued.

A QEMU PoC queued jack_detect_work, simulated SDW_SLAVE_UNATTACHED, and
then entered remove. DEBUG_OBJECTS reported an active timer/work object
associated with the rt700 jack work path after remove skipped the cancel.

This is sent as an RFC because the practical trigger depends on SoundWire
core remove ordering after an UNATTACHED status update. If remove cannot
run after hw_init has been cleared while jack work is still pending, this
is a defensive lifecycle cleanup rather than a reachable race on current
systems.

Fixes: 737ee8bdf682 ("ASoC: rt700-sdw: use cancel_work_sync() in .remove as well as .suspend")
Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
---
Changes in v2:
- Rebase onto broonie/sound.git for-next, where SoundWire remove()
  callbacks now return void.

 sound/soc/codecs/rt700-sdw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 30fcca210f05..3194379c5778 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -459,10 +459,8 @@ static void rt700_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt700_priv *rt700 = dev_get_drvdata(&slave->dev);
 
-	if (rt700->hw_init) {
-		cancel_delayed_work_sync(&rt700->jack_detect_work);
-		cancel_delayed_work_sync(&rt700->jack_btn_check_work);
-	}
+	cancel_delayed_work_sync(&rt700->jack_detect_work);
+	cancel_delayed_work_sync(&rt700->jack_btn_check_work);
 
 	pm_runtime_disable(&slave->dev);
 }
-- 
2.34.1

