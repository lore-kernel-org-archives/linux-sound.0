Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420585;
	b=2Asf4HP1scboAbCEp9D3ZMj+NtXYwIsJ+jl4nX4MfhZ1Gm5mFROoOebqILgqQtMfdGe7
	 97SJ1jNWwjG5MT1+r1I8HwJ1WrMyhFX59gteSZ4fzztnU8jAAQYUU+b3LQeuLEzPo8DpH
	 gzXlN9PORKHB0LK5uwl+sr7DVYb6BEEjnfOi3/qjilTQJnXCQq3gi+vP/iO7K6ydueJ4R
	 G5wr/0mFcgpC6HVok80DtNLP/QDSdPeesDC5ypNPo3X8sZ++BTHWXDswbF4oZbFgFKTDS
	 9pzZK+/JkelW8vI0ZjWPl9pHRrVdA9YzAJ1u+3diYxXwIoc0+mhW9JZ/XnKasYw666w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420585;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=NiYRB965QyMjahqN2h1lQRElGOPuwhMdnpU8Xt7TG2U=;
	b=4mblYNPhZLZx4E8JWhBHb/KvLo18cKKyf0xLIw0FiVhOnGHoQF0LmzOEXlboXmIw/X9B
	 yJbVuBEfC5wwTUPc4CsfaszjQahdjGj6pNwYFfYjzAvyp6V//GwSqezMjYS2PZv9jkkCS
	 CxcaqGJGxyUXC+lrQTwChqnix1xGxfX/PxrEtd1X5H8c4xVe5HWN+DaNtSU4MMgPrws4D
	 JgSt6/n0DKJLDgEYy6qZ7th7oMAnaeZIk9XwmnfVS6bsshhCKN+82yGv04zOLr2ycso3Q
	 7fAXfd5XEH/zUgqHNaUnJEQgevE6RuHsMBQOY0ztpWx4ZEtytTwEmgBXHh5C7apVqUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nAqN5FFP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01067606A31F;
	Mon, 23 Nov 2026 07:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nAqN5FFP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1161F000C6;
	Mon, 23 Nov 2026 07:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420584;
	bh=NiYRB965QyMjahqN2h1lQRElGOPuwhMdnpU8Xt7TG2U=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=nAqN5FFPZUeSNyPFGPJlQiZB6IhzuoA2HRqJyeWOVSn2w71SsiHJ2e/6nHwVYwsOp
	 jUj2u6tm46+nERCwyC44mjwxCqPj2R1Y3iNPzq6wOCHej2Pe9SSmbCup8pxEtBqsxU
	 XCfXLkKL3LvnbNq4LkwlOxxvr5KpoC3cy29jHCEydICYm/NyvCwaaKmquT62Yp9Wxc
	 h0IUax4zkh5q9hzpachHQTArCQvh/DsP15NuY3T2y1HujgLVu1Qg7s64cbDnm3EIKg
	 OjaaMfCGoWQzje15At0s/ZtN7zfzri1/hCHc8dPvydKWMEJRE1qgEGuHiVfVyyUnn7
	 DHFQXrZPETUgA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/10] soundwire: qcom: Check clk_prepare_enable() return value
Date: Mon, 23 Nov 2026 07:54:29 +0000
Message-ID: <20261123075522.405347-9-lee@kernel.org>
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

qcom_swrm_probe(), qcom_swrm_irq_handler(), and swrm_runtime_resume()
ignore the return value of clk_prepare_enable(ctrl->hclk) and proceed
to access controller registers even when enabling the interface clock
fails.  Also jump to err_clk when requesting the wake IRQ fails in
qcom_swrm_probe() so ctrl->hclk is disabled on error.

Check the return value of clk_prepare_enable() in all three callers and
abort register access on failure.

Closes: https://sashiko.dev/#/bug/linux-f65cddc9-08ff-4531-9acf-76981d74d914
Signed-off-by: Lee Jones <lee@kernel.org>
---

v2 => v3:
 - No changes

v1 => v2:
 - Drop Fixes and Stable tags

 drivers/soundwire/qcom.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 191f13a0bdc2..307be1ec3d68 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -778,7 +778,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 	u32 i;
 	int devnum;
 	int ret = IRQ_HANDLED;
-	clk_prepare_enable(ctrl->hclk);
+
+	if (clk_prepare_enable(ctrl->hclk))
+		return IRQ_NONE;
 
 	ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
 		       &intr_sts);
@@ -1677,7 +1679,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		goto err_init;
 	}
 
-	clk_prepare_enable(ctrl->hclk);
+	ret = clk_prepare_enable(ctrl->hclk);
+	if (ret)
+		goto err_init;
 
 	ctrl->dev = dev;
 	dev_set_drvdata(&pdev->dev, ctrl);
@@ -1733,7 +1737,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 						"swr_wake_irq", ctrl);
 		if (ret) {
 			dev_err(dev, "Failed to request soundwire wake irq\n");
-			goto err_init;
+			goto err_clk;
 		}
 	}
 
@@ -1802,13 +1806,15 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
 	int ret;
 
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
2.56.1.750.gf70dc682cf-goog

