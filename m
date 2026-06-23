Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F01F23D2B1;
	Tue, 23 Jun 2026 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782223407; cv=none; b=SOLnjSpLgZ8z9rwiq14xNJetevpVLmGq2Neub4HoraEUuBHP89KaSLDe2gvGXK2sDjky4DjVPi4Esr2xrfM8Xkk+QCwHQ2R+ch0o9/oAprSROQDGwq2kYfgjb8rTZfqxCFat6MQfh5yub1xkeOXcOQ/hP7tXTTHZI/ZXGAfVarw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782223407; c=relaxed/simple;
	bh=9H5fptiLS6Kk2nIMuyicmrJNv2Qsyp3rSuSow6rzloE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aUGeK5+TjGPzqUQ1Lt2ZtsdUU9eFTb6nVr2YVvaciuwMHr3BaNomHwhbpoW27ZWg9IuNbT49JkMBJRr9veytUKOambvgC+9dn71roOwqXuWznjmT1BxG1z8yxNxw9P/648iMCE1OnTOww6oWfReVbWugCyjmK0m/4XslnbL9n6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowAD3RMgjkjpqPGDYFA--.16270S2;
	Tue, 23 Jun 2026 22:03:16 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mastan Katragadda <Mastan.Katragadda@amd.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] soundwire: amd: report clock-stop exit failures
Date: Tue, 23 Jun 2026 22:03:15 +0800
Message-ID: <20260623140315.78919-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAD3RMgjkjpqPGDYFA--.16270S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF47JryrCw4DZry8WF1UGFg_yoW8Kr43pF
	Z2qrW3Kryktw1Yvw1kZFWFvFyrA393ta47GFW7Gw4xAF1Yqrn8ua15tr4YqF15Kr1rJa1a
	gFWUJF45CF1qvw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUnG
	QDUUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

amd_sdw_clock_stop_exit() requests SoundWire clock-stop exit and waits
for AMD_SDW_CLK_RESUME_DONE, but timeout handling only leaves
clk_stopped set and returns 0. It also logs sdw_bus_exit_clk_stop()
failures without propagating them.

Return the hardware wait error and the bus clock-stop-exit error so
runtime resume does not report success while the manager remains in
clock-stop state.

This is sent as RFC because clock-stop exit is part of AMD SoundWire
runtime/system PM recovery and the expected timeout policy needs
maintainer confirmation before changing the resume return value.

Fixes: 81ff58ff71ad ("soundwire: amd: add runtime pm ops for AMD SoundWire manager driver")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/soundwire/amd_manager.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a3316efdf..7d82fad0d 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1206,18 +1206,20 @@ static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
 		ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL, val,
 					 (val & AMD_SDW_CLK_RESUME_DONE), ACP_DELAY_US,
 					 AMD_SDW_TIMEOUT);
-		if (val & AMD_SDW_CLK_RESUME_DONE) {
-			writel(0, amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
-			ret = sdw_bus_exit_clk_stop(&amd_manager->bus);
-			if (ret < 0)
-				dev_err(amd_manager->dev, "bus failed to exit clock stop %d\n",
-					ret);
-			amd_manager->clk_stopped = false;
+		if (ret) {
+			dev_err(amd_manager->dev, "SDW%x clock stop exit failed\n",
+				amd_manager->instance);
+			return ret;
 		}
-	}
-	if (amd_manager->clk_stopped) {
-		dev_err(amd_manager->dev, "SDW%x clock stop exit failed\n", amd_manager->instance);
-		return 0;
+
+		writel(0, amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
+		ret = sdw_bus_exit_clk_stop(&amd_manager->bus);
+		if (ret < 0) {
+			dev_err(amd_manager->dev, "bus failed to exit clock stop %d\n",
+				ret);
+			return ret;
+		}
+		amd_manager->clk_stopped = false;
 	}
 	dev_dbg(amd_manager->dev, "SDW%x clock stop exit successful\n", amd_manager->instance);
 	return 0;
-- 
2.50.1 (Apple Git-155)

