Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420598;
	b=h5QTJ9H4241yzYvDdozaojPxmYeMEbZUXv2saFxM0AWqL8Bl0VMMjY6szthniH9hv8GW
	 lloT1yYnZkBqWCC36Xe1F4zyfKkVtOQI5iTm+okJHS9nB0Nz1q2qe17H+RHSWcyk67+qM
	 xcpK5qjMDkPTJseuJDuoMzMPbwUDek08kWLt4pcS/3c+ozeotrPldmscm/++oPIals0lO
	 W01x18cgNiYM8nzg2GnKlTVVWt7hxFQHJeBodAD9u9aZ8WRAAgDHMdCJlWiPbptjkI636
	 /jVcx6MJArtchmRusYWy1hsfpimKxHbNBwhVjhtUSOq3yC/3/rAM8H5zXrc3g5OQQfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420598;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wdAgCFFdw0rSMXALw4gmM4sUmyE/cmBQLiHptzW8uy0=;
	b=Rlt8uVE7CLKtvmF9TWus51iCfLk9+Ddqd8Kl/Lh7FXsEHPgQ4uAhiXGh07K640TcNDvJ
	 OzHbnb/RiaiG83mHZVM2WQDusvlsbG7B1TT0Hf+EK0Gcjp8XJZAiLS8+JDF5CuBDgXMLV
	 SWDN8oW0Lmalw+sn2PSMpS+Kqiq2lXmDUts/xaV3yY2jw8CAiUxGzdUHMFLdzAwhIRtNN
	 W71JwDPmjxcNuK6jH7mgbgKn1cMd4vWLFSmIUnCEtsjtt11KTHQ82OadR5mpevbCxtYhe
	 uxK0+vCp/YjPjaIfGyRvfuVTm1zpi0wCSfwsq4x/DyAfWt9hwLEFPo1ObXVmMD56Qgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eosNcEyq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F36606A31F;
	Mon, 23 Nov 2026 07:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eosNcEyq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F1A1F000CA;
	Mon, 23 Nov 2026 07:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795420598;
	bh=wdAgCFFdw0rSMXALw4gmM4sUmyE/cmBQLiHptzW8uy0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=eosNcEyq2V5Ib/i4MLgRyKQ63uu99YCbFJU900Cxk1w/T6U7GeojNUAtnfb4zUB2R
	 l0Qa+9hB4yiRR4K5KIV8XOkM5UM+z+gtV38w2yaisjbxReztO8tG6MIkPnsscosI49
	 s0qEDdl5PKXDhVTIe0/o8IshrmyK8yiyVk6hYZq2SNLpdqF6zBqaHke9Zmjxunhl/y
	 2wSt9q7O5PYp5YpnWQ63Re8EeRYV3pekFhVOOSE2l6hdEPOc3JnoS9HY8OVttjBjFf
	 w7cxmN/qqUZlBResQyJskd4MwAqCWqLkEKha3NrkQ55RQoUSWeGYiT+TANXYhjuvGS
	 leqLrc6RYOPNA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/10] soundwire: qcom: Prevent stale broadcast IRQ from completing subsequent command
Date: Mon, 23 Nov 2026 07:54:31 +0000
Message-ID: <20261123075522.405347-11-lee@kernel.org>
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

When wait_for_completion_timeout() expires for a broadcast command in
qcom_swrm_cmd_fifo_wr_cmd(), any late
SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED interrupt from the
timed-out command can fire concurrently with a subsequent broadcast
command after reinit_completion(&ctrl->broadcast), prematurely
completing the new command.

Clear any pending special command completion interrupt and reinitialise
ctrl->broadcast before issuing a broadcast command under
ctrl->intr_lock, clear the interrupt on timeout, and verify that the
interrupt status bit is still asserted under ctrl->intr_lock before
signalling ctrl->broadcast.

Closes: https://sashiko.dev/#/bug/linux-fa1aa3a1-f9c7-4e8a-bdfc-49a559353546
Signed-off-by: Lee Jones <lee@kernel.org>
---

v2 => v3:
 - No changes

v1 => v2:
 - Drop Fixes and Stable tags

 drivers/soundwire/qcom.c | 44 +++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 648260a1dac6..8c75cc4302c2 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -554,11 +554,18 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
 	if (swrm_wait_for_wr_fifo_avail(ctrl))
 		return SDW_CMD_FAIL_OTHER;
 
-	if (cmd_id == SWR_BROADCAST_CMD_ID)
+	if (cmd_id == SWR_BROADCAST_CMD_ID) {
+		mutex_lock(&ctrl->intr_lock);
+		ctrl->reg_write(ctrl,
+				ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
+				SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED);
 		reinit_completion(&ctrl->broadcast);
-
-	/* Its assumed that write is okay as we do not get any status back */
-	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_CMD_FIFO_WR_CMD], val);
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_CMD_FIFO_WR_CMD], val);
+		mutex_unlock(&ctrl->intr_lock);
+	} else {
+		/* Its assumed that write is okay as we do not get any status back */
+		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_CMD_FIFO_WR_CMD], val);
+	}
 
 	if (ctrl->version <= SWRM_VERSION_1_3_0)
 		usleep_range(150, 155);
@@ -571,10 +578,16 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
 		 */
 		ret = wait_for_completion_timeout(&ctrl->broadcast,
 						  msecs_to_jiffies(TIMEOUT_MS));
-		if (!ret)
+		if (!ret) {
+			mutex_lock(&ctrl->intr_lock);
+			ctrl->reg_write(ctrl,
+					ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
+					SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED);
+			mutex_unlock(&ctrl->intr_lock);
 			ret = SDW_CMD_IGNORED;
-		else
+		} else {
 			ret = SDW_CMD_OK;
+		}
 
 	} else {
 		ret = SDW_CMD_OK;
@@ -773,6 +786,22 @@ static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void qcom_swrm_complete_broadcast(struct qcom_swrm_ctrl *ctrl)
+{
+	u32 status;
+
+	guard(mutex)(&ctrl->intr_lock);
+
+	ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
+		       &status);
+	if (status & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED) {
+		ctrl->reg_write(ctrl,
+				ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
+				SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED);
+		complete(&ctrl->broadcast);
+	}
+}
+
 static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_id;
@@ -889,7 +918,8 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 				mutex_unlock(&ctrl->intr_lock);
 				break;
 			case SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED:
-				complete(&ctrl->broadcast);
+				qcom_swrm_complete_broadcast(ctrl);
+				intr_sts &= ~SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED;
 				break;
 			case SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2:
 				break;
-- 
2.56.1.750.gf70dc682cf-goog

