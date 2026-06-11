Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D53C22D7B9;
	Thu, 11 Jun 2026 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194878; cv=none; b=RFGbvugr2NE3Fk/45XydU/BOYdXUkj3jJhfAY414ik1eVsKWl87+0+WqzaJ71GHvwpYdwHs4OY2djWibNp4pSTq70R8gCehnC6z3djJF40V9UDKbkOdf5HDfsO+K+YBcBco4LO0ckLVixKF/i9Nc/KLd86XopMGJO4H2R38AwDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194878; c=relaxed/simple;
	bh=3rH53SUJZMJPH+pwmu5uFm7fF3wPqdWJPKY5um1CNsg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N6goRzekllwXVeaJHmLjeqsRyDEBvACH6m+GhqQXJHVZpp475Cl+YU1cJgAs+YXho7BGgTKG4uBnmLmguY5REw/emiffPkZd6bbfQUVOJF2/Ehzdiv3X2XgHwiDX+MRF+5JJNYKW8fnhlc3W8V21uOXkDBH0ZWFSlMz0U2gccaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=PeweumBs; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="PeweumBs"
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 420765ea6;
	Fri, 12 Jun 2026 00:16:04 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: broonie@kernel.org
Cc: david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	Paul.Handrigan@cirrus.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: [PATCH 0/2] ASoC: cs35l3x: drain threaded IRQs before runtime suspend
Date: Fri, 12 Jun 2026 00:15:51 +0800
Message-Id: <20260611161553.3378721-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9eb778233703a1kunmccb51b6d16b656
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGEpLVkxMQk9PTU0dTh4dTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=PeweumBscxODJR8ACb7J1woSWyUGALWoOXLFDtnP4pUlT7NGjMW0vs+y8qcHP6e4OCdkkXIycLZUIKnjfPAM/QYIkP6NWVApUKY1MPXZ/SCE6I8KFikgWgxoSba71LFWiS3asC98qm+ci5pPxgFn0xjOuXWuuv0hCOPLez53RbU=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=OsrqqoAz//FW0++tDWxkkLWuS73oidVwq+3+InqhsQg=;
	h=date:mime-version:subject:message-id:from;

Both cs35l33 and cs35l34 can enter runtime suspend while their threaded
IRQ handlers are still reachable. The suspend path then switches the
driver into regcache cache-only mode and powers the codec down, while
the IRQ thread still expects live status-register access.

This issue was found by our static analysis tool and manually audited on
Linux v6.18.21. Directed QEMU no-device validation further showed that,
after runtime_suspend() completed, the real threaded handlers could
still be injected and would continue past volatile regmap read failures
into their release/update paths.

This series keeps the fix on the suspend actor and applies the same
runtime-suspend/threaded-IRQ ordering repair boundary to both drivers:

- track whether request_threaded_irq() actually succeeded
- disable_irq() before cache_only/power-off in runtime suspend
- enable_irq() only after regcache_sync() in runtime resume

That drains any in-flight threaded handler and blocks new IRQ handling
while the codec is suspended, without mixing in larger IRQ-thread
defensive cleanups.

Build-tested by compiling cs35l33.o and cs35l34.o.

No cs35l33/cs35l34 hardware was available for end-to-end runtime
testing.

Runyu Xiao (2):
  ASoC: cs35l33: drain threaded IRQ before runtime suspend
  ASoC: cs35l34: drain threaded IRQ before runtime suspend

 sound/soc/codecs/cs35l33.c | 14 ++++++++++++--
 sound/soc/codecs/cs35l34.c | 14 ++++++++++++--
 2 files changed, 24 insertions(+), 4 deletions(-)

-- 
2.34.1
