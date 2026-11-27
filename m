Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796665;
	b=GEkLjMsXmGDJww3w4ODTsgZVukfYqC34n3tM4CtdBJ9Vm000RwHWxcKG1w1jUW8J7PMM
	 CjBPUGbjMXkHqMgHK0TYbzHubjHZMvDBL5F/i5G8KYXD5cA+06olohKrQRS9vi1+L4fbz
	 RiOyErJhlcnxw+/wWbVl4pqnsU884VAFaB8FZlqMfJb1dy7krd+BYj6w/A4v6dV38inen
	 D6CvQ3yr/n+AyRDp58J9ajaY+TXYQ+RyJ3QOvPWDdbHdS5vKsbj+rN6DA6O+6jbHbIpkq
	 ft9xfAs4dE9Jc55IJtTcgQ7QLfSZPwXKYl/1SZK29E5AtBdkD7uJtOnGbVyAeKklotw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796665;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=M394t6NoKktITFKyuF5cYMdEps8L43u/mf2zIqozehg=;
	b=Pxs8AXmfHK4GNqLDfoMzYMEWJ3jI5ugFVQNLRU6ECZP6w8VG0n+WP238fE1jByKCMlYF
	 Fqpjd+9H2JSaYHJEM/VuMmkaojn/z+7dMxVKnUpb6TJWOr17hQWVY4obq/wisxZwgZaee
	 incZERlKMwigdTMf830pbLh/O+bzGarIpD0FH7Wigihg0eBu1ji6a0LD3UFKcHdPmlbI5
	 76I7yB9WLgNMf6UFSoNppKqE3UZhqDp5WL+gVPCbYoCtZkgUBldPgzfP7J7SIfGM96qeQ
	 44S0v+fTtfqe2xUBdnIOXbHA9dNP6dzSK9WHYdk5kcgp7eKC+rhQIncdJdGmW6KdA3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I76+FOxZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C696606A31E;
	Fri, 27 Nov 2026 16:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I76+FOxZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801241F00899;
	Fri, 27 Nov 2026 16:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796664;
	bh=M394t6NoKktITFKyuF5cYMdEps8L43u/mf2zIqozehg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=I76+FOxZPddSmBaqm82weo+piRjPNclzeEdR1DO1y+jKRTSyMfNMY2ypqP+uPfsdr
	 DTEmGh/s24B86xTRHxkT7B2SD5T24XXensDuRWHJyxjSgR1DCP0RgwhkrMlIGO6ukF
	 SPA1oZafOu/lY8ML11kITcGvXTUzAWsQRHs0A6WJXGz4CeTHv4tw/F/9lkqxIAAHPn
	 X61qT+IUJvzCQeF33XBGu+g1+JKirgh3ze3WOKr6caDviRXRa24mV++FE9/+UOGUqL
	 YHsfhyy1Lkx9HOs2T4C0RlIqbsnpOkxTE7JvXhMHZrLfbCjILLqaAtGptVq2rtI4iW
	 7tzfiA2OUN8Sg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] soundwire: qcom: Serialise ctrl->intr_mask updates
Date: Fri, 27 Nov 2026 16:23:43 +0000
Message-ID: <20261127162402.3074271-4-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127162402.3074271-1-lee@kernel.org>
References: <20261127162402.3074271-1-lee@kernel.org>
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
v3 => v4:
 - Rebase onto soundwire/next preserving multi-master initialisation and MMIO gating.

 drivers/soundwire/qcom.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 44ef3beeb1e7..b1b3a981a340 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -228,6 +228,8 @@ struct qcom_swrm_ctrl {
 	struct completion enumeration;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
+	/* Interrupt mask and broadcast completion lock */
+	struct mutex intr_lock;
 	struct clk *hclk;
 	int irq;
 	u32 ee;
@@ -810,7 +812,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 
 	ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
 		       &intr_sts);
+	mutex_lock(&ctrl->intr_lock);
 	intr_sts_masked = intr_sts & ctrl->intr_mask;
+	mutex_unlock(&ctrl->intr_lock);
 
 	do {
 		for (i = 0; i < SWRM_INTERRUPT_MAX; i++) {
@@ -846,10 +850,12 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
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
@@ -889,20 +895,24 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
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
@@ -936,7 +946,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 				intr_sts);
 		ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
 			       &intr_sts);
+		mutex_lock(&ctrl->intr_lock);
 		intr_sts_masked = intr_sts & ctrl->intr_mask;
+		mutex_unlock(&ctrl->intr_lock);
 	} while (intr_sts_masked);
 
 	clk_disable_unprepare(ctrl->hclk);
@@ -1015,6 +1027,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	/* Enable Auto enumeration */
 	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 1);
 
+	mutex_lock(&ctrl->intr_lock);
 	/* dependent has no sdw_bus; keep IRQ dispatch masked */
 	if (ctrl->mm_role != QCOM_SWRM_MM_DEPENDENT)
 		ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
@@ -1022,6 +1035,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	if (ctrl->version < SWRM_VERSION_2_0_0)
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
 				SWRM_INTERRUPT_STATUS_RMSK);
+	mutex_unlock(&ctrl->intr_lock);
 
 	/* Configure No pings */
 	ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR, &val);
@@ -1065,8 +1079,10 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 
 	/* enable CPU IRQs for the selected EE window; dependent has no sdw_bus */
 	if (ctrl->mmio && ctrl->mm_role != QCOM_SWRM_MM_DEPENDENT) {
+		mutex_lock(&ctrl->intr_lock);
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
-				SWRM_INTERRUPT_STATUS_RMSK);
+				ctrl->intr_mask);
+		mutex_unlock(&ctrl->intr_lock);
 	}
 
 	/* Set IRQ to PULSE */
@@ -1899,6 +1915,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->dev = dev;
 	dev_set_drvdata(&pdev->dev, ctrl);
 	mutex_init(&ctrl->port_lock);
+	mutex_init(&ctrl->intr_lock);
 	init_completion(&ctrl->broadcast);
 	init_completion(&ctrl->enumeration);
 
@@ -2144,6 +2161,7 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
 			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
 
+		mutex_lock(&ctrl->intr_lock);
 		ctrl->intr_mask |= SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
 		if (ctrl->version < SWRM_VERSION_2_0_0)
 			ctrl->reg_write(ctrl,
@@ -2151,6 +2169,7 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 					ctrl->intr_mask);
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 				ctrl->intr_mask);
+		mutex_unlock(&ctrl->intr_lock);
 
 		usleep_range(100, 105);
 		if (!swrm_wait_for_frame_gen_enabled(ctrl))
@@ -2178,6 +2197,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 	swrm_wait_for_wr_fifo_done(ctrl);
 	if (!ctrl->clock_stop_not_supported) {
 		/* Mask bus clash interrupt */
+		mutex_lock(&ctrl->intr_lock);
 		ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
 		if (ctrl->version < SWRM_VERSION_2_0_0)
 			ctrl->reg_write(ctrl,
@@ -2185,6 +2205,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
 					ctrl->intr_mask);
 		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 				ctrl->intr_mask);
+		mutex_unlock(&ctrl->intr_lock);
 		/* Prepare slaves for clock stop */
 		ret = sdw_bus_prep_clk_stop(&ctrl->bus);
 		if (ret < 0 && ret != -ENODATA) {
-- 
2.56.1.839.g22a8290db9-goog

