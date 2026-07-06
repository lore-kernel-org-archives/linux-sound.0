Received: from MTA-15-3.privateemail.com (mta-15-3.privateemail.com [198.54.122.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978473D668F;
	Mon,  6 Jul 2026 19:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.122.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783365736; cv=none; b=DDzJCLPf68hkIbEwK6cO8r5n1lfzmEj+o0b7n23xLRGD7ZKH8brVi6CGnlLsNIBxC6WUJNdtBpaaU5ht8wzV+YrXPwLp3dY7k6RcpxVUXSLwQ66/SqfD3qiwgwjasfriE0z/wmg6zcIxgF4Zw+g0n/jZApuNJi1jgur1qNLTb7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783365736; c=relaxed/simple;
	bh=5nSxqCzGm/GZZBges3YFGnTjObWf+SZ290QFkpnWBaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tmNibRvZnOsLW1oydzd50SqlHTRQ8F+/S8vJRgOtQBLkyPNHMk7fr7cuTnmurDhydPNQ4RvxeCpJopXuWMm4loehMSFFXtu4xuMfuC26h52SpATuIcoNA2gdTaEuGTtV1TzYjI2dzLJHEbPZySqzV/k9qO5xJvPf4tGNHPz2+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.122.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (K8S-PROD-WORKER-01 [87.215.145.39])
	by mta-15.privateemail.com (Postfix) with ESMTPA id 4gvDkY5k9Gz3hhT6;
	Mon,  6 Jul 2026 15:21:57 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: qcom: add SCP address paging support
Date: Mon,  6 Jul 2026 21:21:50 +0200
Message-ID: <20260706192150.143921-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm controller driver ignores the paging fields of struct
sdw_msg. For a paged access (register address >= 0x8000 on a
paging-capable peripheral, e.g. the SDCA control space at
0x40000000+) the core sets BIT(15) in the wire address and splits the
upper bits into addr_page1/addr_page2, but since the controller never
programmed the SCP_AddrPage registers the peripheral resolved every
such command against their reset value: reads and writes were
silently redirected to addr[14:0] in page 0.

Write the two SCP_AddrPage registers through the command FIFO before
the transfer, as cadence_master.c (cdns_program_scp_addr) and
amd_manager.c (amd_program_scp_addr) do. Like those controllers the
pages are programmed on every paged message rather than cached per
device; a cache can be a follow-up if the two extra FIFO commands
ever matter.

No peripheral on a Qualcomm bus sets prop.paging_support in mainline
today; the first user is the WCD9378 codec, whose driver is being
upstreamed separately - its entire register map, the
wcd937x-compatible analog core included, lives in the SDCA address
space.

Verified on the Fairphone 6 (SM7635): WCD9378 SDCA registers read
back their documented reset defaults and audio capture through the
codec works end-to-end; without this change every paged access landed
in page 0.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
 drivers/soundwire/qcom.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 603f228f46b5..3562802f4204 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -975,6 +975,20 @@ static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	int ret, i, len;
 
+	if (msg->page) {
+		ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->addr_page1,
+						msg->dev_num,
+						SDW_SCP_ADDRPAGE1);
+		if (ret)
+			return ret;
+
+		ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->addr_page2,
+						msg->dev_num,
+						SDW_SCP_ADDRPAGE2);
+		if (ret)
+			return ret;
+	}
+
 	if (msg->flags == SDW_MSG_FLAG_READ) {
 		for (i = 0; i < msg->len;) {
 			len = min(msg->len - i, QCOM_SWRM_MAX_RD_LEN);
-- 
2.55.0

