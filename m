Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB3A32F766;
	Wed, 18 Feb 2026 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771423274; cv=none; b=nevrRMcwdeS5h2N0h7rBS4Yq1t0qvTzwl4+69GBkxGmnZKiBEEsGy4diZ7NMcF1OoBvFhg8t09xbQAFFaF9ORrK+3WqeqJNM8rs41Wt2MmsluXEqViiqsUHYCri63ouh0bRF59TdTAe0HnvTZmb1N3RiKs8GmyclwxZ6vub1tW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771423274; c=relaxed/simple;
	bh=BtVYVKgsTmOrhBPS5WxXXBV2evBxZ38WWXFNEqhx8vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KnCzZEvUDA6xRk0yGHZ7L61bdC16/y03M1xXe9cAt21mvgJqq1BYN9Uweh5RPCLVErRyzTy9a0LyELnYqw0Xhj4QpXMnYYin7yHVnndRSkbiIu/Red9PZO3Tv/Cp++VHkBRvfk4av8PYbjjgunFRp4b3l9J9Joen+x2u9VwRNl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
From: Cole Leavitt <cole@unwrap.rs>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cole Leavitt <cole@unwrap.rs>
Subject: [PATCH v3] soundwire: bus: demote UNATTACHED slave warnings to dev_dbg
Date: Wed, 18 Feb 2026 07:00:42 -0700
Message-ID: <20260218140042.21536-1-cole@unwrap.rs>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260217233533.4716-1-cole@unwrap.rs>
References: <20260217233533.4716-1-cole@unwrap.rs>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dev_warn() messages in sdw_handle_slave_status() for UNATTACHED
transitions were added in commit d1b328557058 ("soundwire: bus: add
dev_warn() messages to track UNATTACHED devices") to debug attachment
failures with dynamic debug enabled.

These warnings fire during normal operation -- for example when a codec
driver triggers a system reset after firmware download, or during
initial multi-device enumeration due to the PING frame race documented
in cadence_master.c -- producing misleading noise on every boot.

The original debugging use case is fully served by dev_dbg(), which
remains visible when dynamic debug is enabled.  Demote both state
check warnings to dev_dbg().

Fixes: d1b328557058 ("soundwire: bus: add dev_warn() messages to track UNATTACHED devices")
Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---
Changes in v3:
 - Add Fixes tag and version changelog

Changes in v2:
 - Drop unattach_pending flag approach entirely per reviewer feedback
   (Pierre-Louis, Richard, Charles)
 - Simply demote dev_warn() to dev_dbg() unconditionally
 - Single patch instead of 2-patch series

 drivers/soundwire/bus.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fb68738dfb9b..45234cc07f35 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1899,8 +1899,8 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 
 		if (status[i] == SDW_SLAVE_UNATTACHED &&
 		    slave->status != SDW_SLAVE_UNATTACHED) {
-			dev_warn(&slave->dev, "Slave %d state check1: UNATTACHED, status was %d\n",
-				 i, slave->status);
+			dev_dbg(&slave->dev, "Slave %d state check1: UNATTACHED, status was %d\n",
+				i, slave->status);
 			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
 
 			/* Ensure driver knows that peripheral unattached */
@@ -1951,8 +1951,8 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			if (slave->status == SDW_SLAVE_UNATTACHED)
 				break;
 
-			dev_warn(&slave->dev, "Slave %d state check2: UNATTACHED, status was %d\n",
-				 i, slave->status);
+			dev_dbg(&slave->dev, "Slave %d state check2: UNATTACHED, status was %d\n",
+				i, slave->status);
 
 			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
 			break;
-- 
2.52.0

