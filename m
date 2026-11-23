Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420592;
	b=FamFSg54alKUzQDgxJ3PfZPzqTinm/dUtWT2h+O/4XspKMiLGHJColh3rbwcnj91Fbq/
	 G2Xpgb9BdfMCdHG0RqPN51XVyAj8784cd39HgWf7y3n5RTWyyNaFmr3PO0yrNGmYRCNDQ
	 otO7ogkyQBhddTxi3zPpdUrr5wdGUFKvTzFX/PvMbcmLstOC/Rw746JNPoiH+rqQh6UfP
	 Lup/UsY/FpwOdL6NIQ1wB7GVtv6CW7nINBEkJJDREdwHj31wxNgdDoIeczqAqx2WAchYL
	 haUOgFjaHSG4kHZKFPOjYFinOjoue+9i5Cda7Ow1w3lfBVgxz2ZkBB4xAH3FIV6/Jfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420592;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=45SnKidonl0igMhwvGCpmH47BH0cjr1RCjUuG6gYLho=;
	b=yIFadMqp/BQmqWmQ0lhil0JHLFcCIeKjmt4AATlJYhBRJBmqA1Smp4hS7pEusjLTtwlJ
	 DLq/ZHn/z2xvc5ygOP9UegWau7gtXhsRNUnQJ407sm+WfSWA19AFsALEe4aFLI8syj3nF
	 opHB2DnEkNUMWHmdny9MbKdl2gY6PjNwLzJb6PnnVLPJl1Gem2x/GOwXItoq5cCI+jSBh
	 jXELJCg/YvmfSZSi6Uc3U0oxH4GIaeviRlQFO1bf9yC92yGLq9tXHdUjlHzOcI5D0gTmr
	 q5Deo/DvpwsCiupQbTyw5EyPgZgzK+z/FQ5ebwa86gAjvXbO8/6gvLon/tp2BSYlEPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZTSVIXjN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF397606A693;
	Mon, 23 Nov 2026 07:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZTSVIXjN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 106771F000C6;
	Mon, 23 Nov 2026 07:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420591;
	bh=45SnKidonl0igMhwvGCpmH47BH0cjr1RCjUuG6gYLho=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ZTSVIXjNbrI0MemaScNUkiOPe7LoFMR//oncNd0FNlrOfh68YagLHkJL/BoHlqQfw
	 FmUYVdHLdCCYS7QH2L15OZs4PxNf2QXQ5TbffopRrOiYT0DfVCd9f+FNtMuoBLQEP3
	 N9O3GemqLlq3cZoxTTe182bNZLiC72vNDuS0EPxMUgdu6yrP7fFyGmxpJ1LuABWYa2
	 LdjC+0vLMRaNa+thZA5PQOYko5xcTbwLwsxaXmjCOiDuhlUclkl9ZER0TvQ7cDM41i
	 rTf29/E10xvUErhkCxVtMC9S9YErZtYX8L8XqveLLvsxNn3UXx5o0vAswYUfTtxcUF
	 rDQbOCIGgi7DQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/10] soundwire: qcom: Serialise ctrl->intr_mask updates
Date: Mon, 23 Nov 2026 07:54:30 +0000
Message-ID: <20261123075522.405347-10-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261123075522.405347-1-lee@kernel.org>
References: <20261123075522.405347-1-lee@kernel.org>
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

qcom_swrm_irq_handler(), swrm_runtime_suspend(), and
swrm_runtime_resume() concurrently read, modify, and write
ctrl->intr_mask and program the interrupt enable registers without
synchronisation.  Overlapping read-modify-write updates can clobber
interrupt mask bits and leave the hardware interrupt mask out of sync.

Add ctrl->intr_lock to serialise accesses to ctrl->intr_mask and its
associated interrupt mask register updates.

Closes: https://sashiko.dev/#/bug/linux-ea523727-6467-42aa-850f-8f838e4b84a8
Signed-off-by: Lee Jones <lee@kernel.org>
---

v2 => v3:
 - No changes

v1 => v2:
 - Drop Fixes and Stable tags

 drivers/soundwire/qcom.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 307be1ec3d68..648260a1dac6 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -202,6 +202,8 @@ struct qcom_swrm_ctrl {
 	struct completion enumeration;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
+	/* Interrupt mask and broadcast completion lock */
+	struct mutex intr_lock;
 	struct clk *hclk;
 	int irq;
 	u32 ee;
@@ -784,7 +786,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 
 	ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
 		       &intr_sts);
+	mutex_lock(&ctrl->intr_lock);
 	intr_sts_masked = intr_sts & ctrl->intr_mask;
+	mutex_unlock(&ctrl->intr_lock);
 
 	do {
 		for (i = 0; i < SWRM_INTERRUPT_MAX; i++) {
@@ -820,10 +824,12 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 				dev_err_ratelimited(ctrl->dev,
 						"%s: SWR bus clsh detected\n",
 						__func__);
+				mutex_lock(&ctrl->intr_lock);
 				ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
 				ctrl->reg_write(ctrl,
 						ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 						ctrl->intr_mask);
+				mutex_unlock(&ctrl->intr_lock);
 				break;
 			case SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW:
 				ctrl->reg_read(ctrl,
@@ -863,20 +869,24 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 				dev_err_ratelimited(ctrl->dev,
 						"%s: SWR Port collision detected\n",
 						__func__);
+				mutex_lock(&ctrl->intr_lock);
 				ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION;
 				ctrl->reg_write(ctrl,
 						ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 						ctrl->intr_mask);
+				mutex_unlock(&ctrl->intr_lock);
 				break;
 			case SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH:
 				dev_err_ratelimited(ctrl->dev,
 					"%s: SWR read enable valid mismatch\n",
 					__func__);
+				mutex_lock(&ctrl->intr_lock);
 				ctrl->intr_mask &=
 					~SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH;
 				ctrl->reg_write(ctrl,
 						ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 						ctrl->intr_mask);
+				mutex_unlock(&ctrl->intr_lock);
 				break;
 			case SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED:
 				complete(&ctrl->broadcast);
@@ -910,7 +920,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 				intr_sts);
 		ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
 			       &intr_sts);
+		mutex_lock(&ctrl->intr_lock);
 		intr_sts_masked = intr_sts & ctrl->intr_mask;
+		mutex_unlock(&ctrl->intr_lock);
 	} while (intr_sts_masked);
 
 	clk_disable_unprepare(ctrl->hclk);
@@ -952,11 +964,13 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	/* Enable Auto enumeration */
 	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 1);
 
+	mutex_lock(&ctrl->intr_lock);
 	ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
 	/* Mask soundwire interrupts */
 	if (ctrl->version < SWRM_VERSION_2_0_0)
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
-				SWRM_INTERRUPT_STATUS_RMSK);
+				ctrl->intr_mask);
+	mutex_unlock(&ctrl->intr_lock);
 
 	/* Configure No pings */
 	ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR, &val);
@@ -997,8 +1011,10 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 			0xFFFFFFFF);
 
 	/* enable CPU IRQs for the selected EE window */
+	mutex_lock(&ctrl->intr_lock);
 	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
-			SWRM_INTERRUPT_STATUS_RMSK);
+			ctrl->intr_mask);
+	mutex_unlock(&ctrl->intr_lock);
 
 	/* Set IRQ to PULSE */
 	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
@@ -1686,6 +1702,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->dev = dev;
 	dev_set_drvdata(&pdev->dev, ctrl);
 	mutex_init(&ctrl->port_lock);
+	mutex_init(&ctrl->intr_lock);
 	init_completion(&ctrl->broadcast);
 	init_completion(&ctrl->enumeration);
 
@@ -1851,6 +1868,7 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
 			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
 
+		mutex_lock(&ctrl->intr_lock);
 		ctrl->intr_mask |= SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
 		if (ctrl->version < SWRM_VERSION_2_0_0)
 			ctrl->reg_write(ctrl,
@@ -1858,6 +1876,7 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 					ctrl->intr_mask);
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 				ctrl->intr_mask);
+		mutex_unlock(&ctrl->intr_lock);
 
 		usleep_range(100, 105);
 		if (!swrm_wait_for_frame_gen_enabled(ctrl))
@@ -1879,6 +1898,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 	swrm_wait_for_wr_fifo_done(ctrl);
 	if (!ctrl->clock_stop_not_supported) {
 		/* Mask bus clash interrupt */
+		mutex_lock(&ctrl->intr_lock);
 		ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
 		if (ctrl->version < SWRM_VERSION_2_0_0)
 			ctrl->reg_write(ctrl,
@@ -1886,6 +1906,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 					ctrl->intr_mask);
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 				ctrl->intr_mask);
+		mutex_unlock(&ctrl->intr_lock);
 		/* Prepare slaves for clock stop */
 		ret = sdw_bus_prep_clk_stop(&ctrl->bus);
 		if (ret < 0 && ret != -ENODATA) {
-- 
2.56.1.750.gf70dc682cf-goog

