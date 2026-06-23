Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293FD3B3BF0;
	Tue, 23 Jun 2026 06:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195432; cv=none; b=tSit/8wzFFffoCrh6IiqXVtkNQ3CWY2O1qWvWEAH9IbpeCMMiJWtBu7Ksl2t5h066hvwEosTneRntPhWSln93X0vvg0M1UL2mZSpbdgENphz3l330DHZGrgksvwPtSWbStdWPketzcWbofQ1JOz4B6RguQCuTz+vZu3DGb+tgu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195432; c=relaxed/simple;
	bh=JdQ/ajGhfiigWd9Wx6X/EjAcsJEZhy7xX2sbsGJYqNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bsu/aTzJDM58FmvAxq+PeDVRTGmfH1kE2DRgN1SXkCbUHvgiNFEKXaVyIan+fohCJXTGBILRMKiAKRN3ig2pK729MQQAlcPKEZKvcleXPS/ltSBP2gWdjZYE64zW9O3xh/luTif5kkcXlDE788HZ8ljTT5WXRTLPkt6nFE77xDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAD3fADdJDpqTz3KFA--.53334S2;
	Tue, 23 Jun 2026 14:17:01 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [RFC PATCH] soundwire: qcom: fail runtime resume on enumeration timeout
Date: Tue, 23 Jun 2026 14:16:59 +0800
Message-ID: <20260623061659.57903-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3fADdJDpqTz3KFA--.53334S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw15Kry5XrWUCw17Jw4ktFb_yoW8AFyrpa
	1DWrWvkrZ7XF9F9rs0yw4vvryF93y8tay7Gan293s7ur15tr1Dta4rKryUtFs5JrWkCr17
	XFWqqF48GF1YyFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUTnQ
	UUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

swrm_runtime_resume() reinitializes the controller and waits for
hardware enumeration when clock stop is not supported, but ignores
wait_for_completion_timeout(). It then reads and reports slave status
even if enumeration never completed.

Return -ETIMEDOUT when the enumeration wait expires and undo the hclk
and wake IRQ state changed earlier in the resume path before returning
the error.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/soundwire/qcom.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3d8f5a81eff1..acac77a1093d 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1704,6 +1704,7 @@ static void qcom_swrm_remove(struct platform_device *pdev)
 static int __maybe_unused swrm_runtime_resume(struct device *dev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
+	unsigned long time_left;
 	int ret;
 
 	if (ctrl->wake_irq > 0) {
@@ -1725,8 +1726,15 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 			dev_err(ctrl->dev, "link failed to connect\n");
 
 		/* wait for hw enumeration to complete */
-		wait_for_completion_timeout(&ctrl->enumeration,
-					    msecs_to_jiffies(TIMEOUT_MS));
+		time_left = wait_for_completion_timeout(&ctrl->enumeration,
+							msecs_to_jiffies(TIMEOUT_MS));
+		if (!time_left) {
+			clk_disable_unprepare(ctrl->hclk);
+			if (ctrl->wake_irq > 0 &&
+			    irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
+				enable_irq(ctrl->wake_irq);
+			return -ETIMEDOUT;
+		}
 		qcom_swrm_get_device_status(ctrl);
 		sdw_handle_slave_status(&ctrl->bus, ctrl->status);
 	} else {
-- 
2.50.1 (Apple Git-155)

