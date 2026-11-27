Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796671;
	b=UJFaj47RsaomAA1TfMNsCq6bowVfvbrxdOeJebQp1bS9iUd7UAEBtBH5epdkR0IwWURS
	 UL5mjtqUmYc0mzQNHj5C2esWppgDgV+AXht/X9LYI7fXNDO8H+YR0DtIrazWtiSUB3pI8
	 SOQRT0ZI42LXng8ftuRyLbYLmoCPwMVtlUpVoTlFj2JQxhr03ZnTn1/zvij9m9puIzJba
	 qxHbqOFIImCL6TqTkZaBq8jjeONngbHHAtB0potwrx6THNTdTaaNY3LvZwRc7I/awwpz5
	 feLQKQS6oFWrkmbthxvC5sjUdbfDUiqGCiM/UHflouAo/DAOPVcAwkmB3X5mgsA+WcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796671;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VPfEddydHzKq7t7WQQj0YbXyoTQFw0LwRyEBV4/ojO4=;
	b=SQ9ZOyK+A872T+KmfjYqOff2lqN08Gyyq4qtd48XwmfWBGvKy9gR8iKvzBSvk/xuG+in
	 En399l1Mbo7S6cMslV6RVVP5U57yF59smkySgn1TEEjx/8IQAKZIEDcWeLbhzJR2kXy3H
	 2husdm9QG2Cj9DMDz3UAUsaOmbONZjLyDpHN1nVT+WYIgTBnTmSiKSegqqKTAKDGZ7Z7v
	 EwIqxiF81KUriqo4BRuStnp4U75P2HiroCeYYgzs0IcSES5Gqxu+/SU9Hrp7AmH56OS1W
	 pB32S2GQ1mCde1mC1HvN7x/1op7e3tR/wMPupn/KGPfut5jtVtL544FVs16yTUsDzTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C10oRDXX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52622606A321;
	Fri, 27 Nov 2026 16:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C10oRDXX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59101F00898;
	Fri, 27 Nov 2026 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795796671;
	bh=VPfEddydHzKq7t7WQQj0YbXyoTQFw0LwRyEBV4/ojO4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=C10oRDXX2ueHdHxIIVAt5f25O18uHj/m6OUJObne99MAbmPYXlPdxEW1P2AjYgIaW
	 EkPWhsSgF/gmeu/cFcEdNOsxA1CpBKNEJn3IlYcvITGYzQuVZGrCI6R/UswHalnuYU
	 08UYjax0qAySRzE9zd3RnS3K6EYGlokgIEC5AHN+uWCEFkkn/zGU2p9oHgQ3WZoYfR
	 yHs2qTCjuGNxKhFLDjzN+uOfs31eK4XWHkF94sl9jzxWY8Uylel5edHyzmJo4ITScK
	 r8YKD58RonF4uUQY1YconfQ5H4YCZ3EiRKOZHAWNOBBBDTudEU2KPusRcYfC6F1euA
	 uUeEnzifupfdQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] soundwire: qcom: Prevent stale broadcast IRQ from completing subsequent command
Date: Fri, 27 Nov 2026 16:23:44 +0000
Message-ID: <20261127162402.3074271-5-lee@kernel.org>
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
v3 => v4:
 - Rebase onto soundwire/next.

 drivers/soundwire/qcom.c | 44 +++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index b1b3a981a340..cd3ee3435c47 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -580,11 +580,18 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
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
@@ -597,10 +604,16 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
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
@@ -799,6 +812,22 @@ static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
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
@@ -915,7 +944,8 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
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
2.56.1.839.g22a8290db9-goog

