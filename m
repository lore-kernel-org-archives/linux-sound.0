Received: from MTA-08-4.privateemail.com (mta-08-4.privateemail.com [198.54.122.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0D83A5995;
	Tue, 28 Jul 2026 17:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.122.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785260172; cv=none; b=feMHLMsmo6ovxWwwpi+FNpQ7V0cLukSLze7SfI7Z9ZOWvkTCvajVyUEBw0Kb0BGUgbbJsRHQ+IzGa10CI5CAJDpfa1Xdw5LvAWH4qj01ZA675QNVjZ7gGxYzKTAfcaXH3ypD7o60UqlVAQcFP4bTLAls13FN2GI4xsJ45Ug9UPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785260172; c=relaxed/simple;
	bh=IEmoRKFeDKYkiQQtghpwXIx4o7APwngr6FjACS3Tsp0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sA9/dhjOwO6XJk+nL9YD8LQQBpeGyiaSdZmbSyhlinxzoxinthjLJvRQP9yLLJxs2U0hNCUejq5/vDBTiTUOzhforC9x90l55eVIIVFaA3uiADyUSZ29XpyBjNNcyWOSzZsG91rCO/dpN7kFu6RVMcyxX7dljODl8Ymf+4wV6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.122.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (K8S-PROD-WORKER-04 [87.215.145.39])
	by mta-08.privateemail.com (Postfix) with ESMTPA id 4h8jL1300Qz3hhTL;
	Tue, 28 Jul 2026 13:35:53 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Luca Weiss <luca.weiss@fairphone.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/2] soundwire: qcom: set the bus mclk_freq property
Date: Tue, 28 Jul 2026 19:35:41 +0200
Message-ID: <20260728173542.61146-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sdw_slave_get_scale_index() needs bus->prop.mclk_freq to compute the
SCP bus-clock base and scale register values, and fails with "no bus
MCLK" when it is unset. The qcom controller never set it, so slave
initialization cannot program the clock registers on this bus: it
would fail outright for an SDCA-class slave, and a slave driver
declaring clock_reg_supported hits the same error. The pending WCD9378
codec driver hand-rolls these writes as a workaround, following its
downstream counterpart.

Report the controller clock, letting the core derive the same values
the hand-rolled writes program: 19.2 MHz base and the scale matching
the bus clock (half the double rate).

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
v2: no code change; added Srinivas's Tested-by/Reviewed-by.
v1: https://lore.kernel.org/all/20260727162741.68081-1-jorijnvdgraaf@catcrafts.net/

This is the soundwire side of the plan from the WCD9378 v1 review
discussion [1]; the codec's v2 will set prop.clock_reg_supported and
delete its hand-rolled base/scale writes, relying on this property.
Patch 2 is the helper extension requested in that thread.

Validated on the Fairphone 6 (SM7635, WCD9378): with the hand-rolled
writes deleted, the core reports "Configured bus base 1, scale 2,
mclk 19200000, curr_freq 9600000" for both slaves at enumeration, the
codec's SDCA sequencer powers up on those values, and capture works,
across reboots.

No behavior change for existing devices: without a class_id or
clock_reg_supported, sdw_slave_set_frequency() returns before reading
mclk_freq.

[1] https://lore.kernel.org/all/20260707151329.67858-1-jorijnvdgraaf@catcrafts.net/

 drivers/soundwire/qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3562802f4204..55678a30cd4a 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1633,6 +1633,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
 	prop = &ctrl->bus.prop;
 	prop->max_clk_freq = DEFAULT_CLK_FREQ;
+	prop->mclk_freq = DEFAULT_CLK_FREQ;
 	prop->num_clk_gears = 0;
 	prop->num_clk_freq = MAX_FREQ_NUM;
 	prop->clk_freq = &qcom_swrm_freq_tbl[0];

base-commit: 6409292ab5f7d1a60a6f8948bd6dcd8633c36dfe
-- 
2.55.0

