Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796658;
	b=FlTEN5MKBIHNCrnScEfoMuR13KfXnt905JVs/dYb91BIbvDY5/scARiaZVkWDG+BQQOy
	 xpyuNyyHt4Co2/NLbJJQoQjp10XYmxfTNrpaoH8PY/CZCUYchcKFyehr5ZyVk5vDLd2PU
	 CL+CxX8f00huKfb+3l+wWs0ks9nBSW5OuKvE5nPOXeJE8WOYk0F8WmREFnWOSLkcGTxuV
	 wDB7t1KE7AowSwIHAvIrkVoBL2qGgULwZlZCjH7ya0AL0E2tTNAMjw01VPBmySh7xq0SP
	 8xlihNRnxHAapvTaOOUKe8Irv03vK8rD9bBeMUTJqSTlvJAIfghf8yxHL/mNiDB/5nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796658;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=DU+KrNn6wQrVHqfxtS5COfYQDr+8ke4pxCAmPSMa+m0=;
	b=e1zzn3EqVQ301/NAECL65iu9aoX7U2YQTKBJ+KE4wh4tA4v8CQkWEgadDvOsT4yU8znT
	 D2CeJKxTz1AxttBMK/7tdCzSC8RRbcBd32N6PKA29lSe/H/WtbMVBB0eWBw99gIaVanzy
	 uZxs0m/8cc0d1JB0qAuojJFX2fYus9highw4wGdRpfk9P1cRX1BAmAPXqJRccm2r+76JI
	 eVTd4fiFU1/IsNB+JHb0oYJ1mNktzeuLd0/mBwk6K6XL4xxwMcYW0+3NtEmrKxVjAP5Kz
	 NQyESK+rrAMsyaN17I6jHpuwfhR78fIS9tlm26p8t9QveuW2kYnx2HDMca+YlrqCcIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SIZrKJmF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E515606A32C;
	Fri, 27 Nov 2026 16:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SIZrKJmF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4FC1F00898;
	Fri, 27 Nov 2026 16:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796658;
	bh=DU+KrNn6wQrVHqfxtS5COfYQDr+8ke4pxCAmPSMa+m0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=SIZrKJmF1Y2JEGJ4d3iJjDbL5vR6RuuAF++GbD/uulkHwmbDtf+5RKe6eEVKahaz/
	 jdOP6is/pguExSLBPNr9lddBYbPqvXd9t4uIQf7y9WsFgasyzBniI+lvsd2+AekcGQ
	 yDRLsNJ9hdVA1i2QITyfr7CfwRzLu5DhPKre6l89L+4nIdWehmW4wI+NWD1q2GpCgS
	 wdG3zQXLOlndJL15mYPVvu+GbBD1DBduMy4xge4W+IjmKQnZKKUS+Lfur9Ya8wYUlJ
	 qS25uFTSfU6Cocsxu/2LKnwzki9ZyR6vTQBkmYzRoQpFKOyTiCAHdFUXWD7QwjJrPn
	 46FhZJp+3yZdQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] soundwire: qcom: Check clk_prepare_enable() return value
Date: Fri, 27 Nov 2026 16:23:42 +0000
Message-ID: <20261127162402.3074271-3-lee@kernel.org>
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

qcom_swrm_probe(), qcom_swrm_irq_handler(), and swrm_runtime_resume()
ignore the return value of clk_prepare_enable(ctrl->hclk) and proceed
to access controller registers even when enabling the interface clock
fails.

Check the return value of clk_prepare_enable() in all three callers and
abort register access on failure.

Closes: https://sashiko.dev/#/bug/linux-f65cddc9-08ff-4531-9acf-76981d74d914
Signed-off-by: Lee Jones <lee@kernel.org>
---
v3 => v4:
 - Rebase onto soundwire/next preserving the multi-master dependent resume path and wake_irq error handling.

 drivers/soundwire/qcom.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 336690217d68..44ef3beeb1e7 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -804,7 +804,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 	u32 i;
 	int devnum;
 	int ret = IRQ_HANDLED;
-	clk_prepare_enable(ctrl->hclk);
+
+	if (clk_prepare_enable(ctrl->hclk))
+		return IRQ_NONE;
 
 	ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
 		       &intr_sts);
@@ -1890,7 +1892,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		goto err_init;
 	}
 
-	clk_prepare_enable(ctrl->hclk);
+	ret = clk_prepare_enable(ctrl->hclk);
+	if (ret)
+		goto err_init;
 
 	ctrl->dev = dev;
 	dev_set_drvdata(&pdev->dev, ctrl);
@@ -2090,13 +2094,15 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	if (ctrl->mm_role == QCOM_SWRM_MM_DEPENDENT)
 		return clk_prepare_enable(ctrl->hclk);
 
+	ret = clk_prepare_enable(ctrl->hclk);
+	if (ret)
+		return ret;
+
 	if (ctrl->wake_irq > 0) {
 		if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
 			disable_irq_nosync(ctrl->wake_irq);
 	}
 
-	clk_prepare_enable(ctrl->hclk);
-
 	if (ctrl->clock_stop_not_supported) {
 		reinit_completion(&ctrl->enumeration);
 		ctrl->reg_write(ctrl, SWRM_COMP_SW_RESET, 0x01);
-- 
2.56.1.839.g22a8290db9-goog

