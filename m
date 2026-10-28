Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227146;
	b=Qz+imTeSUhhKbNZ10eNH1AyWYDYR7QDoPmQC+dX/9KUqo1EvNN+4xaMgWUDdbiRmsPkz
	 pkH/5Bgk8LtdgLmfymkB4P5d2b0cvylP0I8JSNlply88WOWL0RzjIO9hDGeLy4QS5kt+C
	 Crb55Sns05EMNaPIDYgE6XlRI+U6y3/BAx8QhvwBXwtvP/KQWJvJB0wrMMeIIkt5xyGJa
	 PoLY3LZUthjkjbkZnOyBPuuPzYBksNud0uIP4ockjoyr8z/E5lp2xDFg5gAti2P6foz5v
	 tYRdBSGsVDH8yHNGw11GSbMHhgKYXOD4gIaJ/hKNjnzmZp1MNovs5l/8LTQcSmZYRTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227146;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:X-CMS-RootMailID:References;
	bh=+pN3yifX0ZWEqqItPU6PdYRevZHvDImE7qVI1Pf4LGA=;
	b=Thk1sgXYmDLJoGsVo8vACOoe0vMBpaHjY1gNPxZncxPWGT4HoXEERJTWWjgrGPJqo7bc
	 Zr4gVbQW9Wqf2T9o+3uIJkvL6uPPyNpDTdLvQvAivN3kVpg10111QqBvlCkWou5xyWo57
	 anWK/M7PQj/A6Y0qb3jxm0fut/tPWitaguoAwPWyvhbJi4Zx4pNyiIUgCxPHWKVbLd3CS
	 ECObIcJypbj0YVg/4hvbhH8Q00YR1jMNjssesG8oPgqxzDe+qZd027BTiFG6touazi26x
	 42IgVqy/3XhSq6f6X3ZCXn28MXpiRz2AE/HY95pW7w9PgxA0UovZawpuSuRMEb/zZcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Jp2tqFYL;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF4B606A31C
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 22:39:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF4B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Jp2tqFYL
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261028223903euoutp02d9e168e308e869342ab5dfd532c4ada9~i0pX7pb1S0054600546euoutp02c
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 22:39:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261028223903euoutp02d9e168e308e869342ab5dfd532c4ada9~i0pX7pb1S0054600546euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793227143;
	bh=+pN3yifX0ZWEqqItPU6PdYRevZHvDImE7qVI1Pf4LGA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Jp2tqFYLGKGkWC4Dd6UbLre1yTZYdDCbFI04NZBibtZdHQzHxDKmoWso3n9gXzIIA
	 YGz2nZLxh/gHAchFVNCMxUsJe5SfkzqwElhfWfhHHRFmbMjWBjWU2SEAfiZHrisNcw
	 edGH6IrmMhqpe4bDAO0I7bUKjsnRxEVUKaHUzc54=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261028223902eucas1p191e23afb4afaa13275f6182ee6cda2b2~i0pXqiekH0296402964eucas1p1X;
	Wed, 28 Oct 2026 22:39:02 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261028223902eusmtip194719eaa8712d720d83da28b83ec1567~i0pXUBnEr1563515635eusmtip1V;
	Wed, 28 Oct 2026 22:39:02 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Srinivas Kandagatla
	<srini@kernel.org>, Vinod Koul <vkoul@kernel.org>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>
Subject: [PATCH] soundwire: qcom: decide about clock stop support on runtime
 suspend
Date: Wed, 28 Oct 2026 23:38:49 +0100
Message-ID: <20261028223850.2683359-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261028223902eucas1p191e23afb4afaa13275f6182ee6cda2b2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261028223902eucas1p191e23afb4afaa13275f6182ee6cda2b2
X-EPHeader: CA
X-CMS-RootMailID: 20261028223902eucas1p191e23afb4afaa13275f6182ee6cda2b2
References: <CGME20261028223902eucas1p191e23afb4afaa13275f6182ee6cda2b2@eucas1p1.samsung.com>

The controller decides whether to use the clock stop mode for runtime PM
based on the clk_stop_mode1 property of the attached peripherals, but
evaluates it only in qcom_swrm_enumerate(). This is racy and wrong:

- The property is set by the peripheral driver in its probe, which may
  run after the device has been enumerated on the bus. On Qualcomm RB5
  both WSA8815 amplifiers share a single powerdown GPIO, so probing the
  first amplifier powers up the second one too, which then attaches and
  gets enumerated before its own driver has set clk_stop_mode1.
  wsa881x_probe() also de-asserts the powerdown GPIO before setting the
  property, so the race exists even for a single amplifier.
- The flag is reset for each enumerated device, so only the last one
  is taken into account.
- The flag is never re-evaluated once the peripheral drivers probe, as
  the slave status doesn't change then.

When it ends up false, the controller enters clock stop on runtime
suspend, disables its clock and loses its state together with the WSA
macro. The clock stop exit path in runtime resume doesn't reinitialise
the controller, so the link never comes up again and the playback
fails:

  qcom-soundwire 3250000.soundwire: swrm_wait_for_frame_gen_enabled: link status not disconnected
  qcom-soundwire 3250000.soundwire: link failed to connect
  wsa881x-codec sdw:1:0:0217:2110:00:3: Initialization not complete
  wsa881x-codec sdw:1:0:0217:2110:00:3: ASoC error (-110): at snd_soc_pcm_component_pm_runtime_get() on sdw:1:0:0217:2110:00:3

Evaluate the clk_stop_mode1 property of all peripherals on the bus at
runtime suspend instead, when their drivers had a chance to set it, and
use the same decision in the matching runtime resume.

Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
The issue was analyzed and the patch was prepared with LLM assistance.
The fix was tested on the real Qualcomm RB5 board.

Best regards
Marek Szyprowski, PhD
Samsung R&D Institute Poland
---
 drivers/soundwire/qcom.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 6e0c5fb10efa..2745900dc241 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -723,14 +723,10 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
 
 		sdw_extract_slave_id(bus, addr, &id);
 		found = false;
-		ctrl->clock_stop_not_supported = false;
 		/* Now compare with entries */
 		list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
 			if (sdw_compare_devid(slave, id) == 0) {
 				qcom_swrm_set_slave_dev_num(bus, slave, i);
-				if (slave->prop.clk_stop_mode1)
-					ctrl->clock_stop_not_supported = true;
-
 				found = true;
 				break;
 			}
@@ -1858,12 +1854,31 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static bool qcom_swrm_clock_stop_not_supported(struct qcom_swrm_ctrl *ctrl)
+{
+	struct sdw_slave *slave;
+
+	list_for_each_entry(slave, &ctrl->bus.slaves, node) {
+		if (slave->prop.clk_stop_mode1)
+			return true;
+	}
+
+	return false;
+}
+
 static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
 	int ret;
 
 	swrm_wait_for_wr_fifo_done(ctrl);
+
+	/*
+	 * Decide here and not at enumeration time: the properties are set by
+	 * the peripheral drivers on probe, which may happen after the device
+	 * has been enumerated. The matching resume uses the same decision.
+	 */
+	ctrl->clock_stop_not_supported = qcom_swrm_clock_stop_not_supported(ctrl);
 	if (!ctrl->clock_stop_not_supported) {
 		/* Mask bus clash interrupt */
 		ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
-- 
2.43.0

