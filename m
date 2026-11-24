Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795560417;
	b=YiYfjSuoBaUgOHEK1LJbTx4yMtS9bwdxBYnoyI1jz1Cn+SPCxiYqrapzVfSmJ25GZQaN
	 LwzgqxpOAJU1cGOqK9d3w/j1G+4YSSzpOMxsxXqyBLOEXdyBwg3MydnEntBmHISTHUq53
	 HfLw5y1ROHXdnIrTzx61hIEN6IFJmwBz3ZE5waBfwWl7rvGAuoyRB2Fc/wKVI8N9Uz/AH
	 gl8bBY8jiGAf7jD018ZeG11BjKI5VZwcNLJfDLB8DnPrT0I9V3zVCscxXqThs5GVrKhgs
	 GnDD4UBgGqXyhGiOH9UbFVSOX0zRbG5SV7i97WUUkrdAuSjM2wGiya2RDWGdIVRr74g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560417;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YJbAzPR+UlQT/r85xLiwaNKEzQOl7kHyCYA4DNIwAmk=;
	b=2ovIizvtlqzC6/B9exsq6X/qdDpOLrk+ZwiNZ5kHCLHi1+QJ8IbmvvAEbtYuMgxVlD2X
	 7GaSyb7HBr5fPCdiX9v7OMUpACUQelVT2rvrRAhwyGPNx9Cww8eo/b2kXtWVt9XF+N2QU
	 umRZ7das1vOB8c70Wt7zNk1cPoyYVzbjw9AAE3RNEIWh7NDcE/coX5R8Q9jYSrYFmoemj
	 43csb6Jk2AXDraTxm5TTKCIGggMcfC9arg1MXR0mIMRsrfu4YHfmT5yuxuNGyttXn95Yx
	 voVYNutQZG9WERJO2awQQF9QoNHmAn8BEUCYSyKIqy7fo0TUh3h3eOjM4PHA1Cp9NtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ibNNHHgx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD0C606A321;
	Tue, 24 Nov 2026 22:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ibNNHHgx
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795560417;
	b=F1U0LVAqhr3wj8m717ez7DQcUXgDO40y3rTOR0Ald/YjZ7pgADmE9xbnzBipvMnJJTfw
	 zHx2i1cVeU46vvMMq5mY0qngKYa+OQnZy+yIDxEs5gSqQqNqjxHs0QuBTYCg6eD1xsEaH
	 p2Xyb4CxmrgosOWsat03DyDSGnfhydvHBqfpjgQ4v3o03QtuS/Wc779mskqYiWEzvyLnK
	 w2BGV/72JjdA+YNHvKJysR0Cp3oXmuTxV4fdAWJD3qQrI4CrFfEfBi124eqHNaVmmQKdn
	 wVPyNTTILVRiIV6hKqSEeRDTA+5Wm34Iq8SOu61VkqaWG5tmha1LObC5V3WGjUTJJvA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795560417;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YJbAzPR+UlQT/r85xLiwaNKEzQOl7kHyCYA4DNIwAmk=;
	b=vxOh5FqlbKIVqk0C8+n2h31zyAcuEBkZnQhE9ZhSyCCiOIQC4IwIxJ7FEEtnPEz9PSsv
	 XEQ3OzeMCCpxykBHQVuWT5b1CoGwbZMo3WHtTNTys+QCeZeyZKD1hPHXQ/YoueL+yi4HM
	 sido9uJq+1mAOkx6n0DRPVlSObyWGvVccs5OX4BJPQXhDR6q+KbbZwE5U6VEOG9Hvc83a
	 +ViGJVWDRl2I+Q91rjLRTnODe7MOAVujVmSkZHSgMJR5UMtrxtpxNj1Gel8iOm3V5xLF5
	 WbsZ7+p5WKK0URbrWAoRsqb+odb4QzL+VKzHtqNtTHmA3OClytjrIIfCwd0RQHkNAUA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE6381F000D1;
	Tue, 24 Nov 2026 22:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795560417;
	bh=YJbAzPR+UlQT/r85xLiwaNKEzQOl7kHyCYA4DNIwAmk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ibNNHHgxWrl1bBh+84pQXfH02c0qI6iU6POIKfmzoykweVYcqjrZ5OkIhn2+8u3Ed
	 7eDugDr9gUE1fMSwPn+RbSXfFmSBNcxPCu7B88F1ifJsY8WdiT2zHmg0BH+34Yl3Jh
	 omqHOIrViPAU/YfNppYVpOEi3eSdhrxQ+RRaClJ8yAH7GPfq9uQVeGINLF+/ktsnpv
	 2JZ0xCQIT1ANna37LC9W7VXOurCid55zdojfTTyH3mCFeTviW/TWlRfm7OMhCeml8s
	 JZ4yJ6ifhZO3Cz0UzF2m4MgGVvIQpNISL7SdZMeeQ09XuBGsuZGez50a3YIA+EkxNa
	 yXVtSyjACfwyQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 710854CBF9;
	Tue, 24 Nov 2026 22:46:47 +0000 (UTC)
From: Robert Ijtsma via B4 Relay <devnull+robertijtsma.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 23:46:47 +0100
Subject: [PATCH 2/2] soundwire: qcom: populate wr_fifo_depth before
 enabling interrupts
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-qcom-soundwire-fixes-v1-2-8ca94d60ddd6@gmail.com>
References: <20261124-qcom-soundwire-fixes-v1-0-8ca94d60ddd6@gmail.com>
In-Reply-To: <20261124-qcom-soundwire-fixes-v1-0-8ca94d60ddd6@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Robert Ijtsma <robertijtsma@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795560406; l=2771;
 i=robertijtsma@gmail.com; s=20261122; h=from:subject:message-id;
 bh=ubMHdvNcEq0xw+6HLkc77K1JCBeG6v8nJPQDHg2TJDg=;
 b=LDzxCCmc1jiBlI8Cq77vPJEnjiYxKJ1S/ZEnSwYFr5n7i1PlUgalWgAUES8EbePNX4caTa3cJ
 SXIHBYkmVw1BdRkMm8F3cQ8i8s8g4jujN339SfJKzEm2sCwLUBHp1rC
X-Developer-Key: i=robertijtsma@gmail.com; a=ed25519;
 pk=qiDyKVqFicxFIR5sB5m+p9SWPKL2/+mMoiQnUx0C9P0=
X-Endpoint-Received: by B4 Relay for robertijtsma@gmail.com/20261122 with
 auth_id=1604
X-Original-From: Robert Ijtsma <robertijtsma@gmail.com>
Reply-To: robertijtsma@gmail.com
Content-Transfer-Encoding: 7bit

From: Robert Ijtsma <robertijtsma@gmail.com>

ctrl->wr_fifo_depth is currently populated at the end of
qcom_swrm_init(), after devm_request_threaded_irq() in qcom_swrm_probe()
and after enabling CPU interrupts in qcom_swrm_init().

If a SoundWire interrupt fires before SWRM_COMP_PARAMS has been read,
qcom_swrm_cmd_fifo_wr_cmd() observes ctrl->wr_fifo_depth == 0 and fails
with -EIO ("err write overflow").

Read and validate SWRM_COMP_PARAMS in qcom_swrm_probe() prior to
requesting the threaded IRQ, and read SWRM_COMP_PARAMS before enabling
CPU interrupts in qcom_swrm_init().

Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controller")
Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
---
 drivers/soundwire/qcom.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 368f511..3a42ab8 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -997,6 +997,12 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
 			0xFFFFFFFF);
 
+	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
+	if (ctrl->version >= SWRM_VERSION_3_1_0)
+		ctrl->wr_fifo_depth = FIELD_GET(SWRM_V3_COMP_PARAMS_WR_FIFO_DEPTH, val);
+	else
+		ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
+
 	/* enable CPU IRQs for the selected EE window */
 	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
 			SWRM_INTERRUPT_STATUS_RMSK);
@@ -1008,12 +1014,6 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 
 	swrm_wait_for_frame_gen_enabled(ctrl);
 	ctrl->slave_status = 0;
-	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
-
-	if (ctrl->version >= SWRM_VERSION_3_1_0)
-		ctrl->wr_fifo_depth = FIELD_GET(SWRM_V3_COMP_PARAMS_WR_FIFO_DEPTH, val);
-	else
-		ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
 
 	return 0;
 }
@@ -1717,6 +1717,21 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
 	qcom_swrm_set_ee_register_layout(ctrl, data);
 
+	ret = ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
+	if (ret != SDW_CMD_OK) {
+		ret = -EIO;
+		goto err_clk;
+	}
+	if (ctrl->version >= SWRM_VERSION_3_1_0)
+		ctrl->wr_fifo_depth = FIELD_GET(SWRM_V3_COMP_PARAMS_WR_FIFO_DEPTH, val);
+	else
+		ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
+	if (!ctrl->wr_fifo_depth) {
+		dev_err(dev, "Invalid write FIFO depth in SWRM_COMP_PARAMS: %#x\n", val);
+		ret = -EINVAL;
+		goto err_clk;
+	}
+
 	ret = devm_request_threaded_irq(dev, ctrl->irq, NULL,
 					qcom_swrm_irq_handler,
 					IRQF_TRIGGER_RISING |

-- 
2.56.0


