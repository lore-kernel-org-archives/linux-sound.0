Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12BF344DAE;
	Wed, 18 Feb 2026 18:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771437771; cv=none; b=jRVZu9/N9I6G1t4RdmGultBS0yoHgySxYMKk+jRFpQ26HzAsfFm1r5Sxwx9B03eZILbc5c4yDo0MKxmQaTiC2KCjhaX5fUH+qKpEuk20xmn8OfM3zJaGsX62veDHhVUsveQpHENzOcrsTw7bb6o4gAMoEXx95BQyxUeN1AsMU9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771437771; c=relaxed/simple;
	bh=zPhv6AoqKfkCRofMNXJkiwCDxKrgStzIWC83eX3qVhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJmJUHOwfmpP1kS6ephpeVuNl/xTppVsX548U3bfKpmzSE/lwHDP8DfnlHFpvePxcxsQ7Hro5HnFI9aOqGM0wRgIpsB3CBk9/BB82fFYwlOz1w/s0/nX0DswMOML94IePLyuwCN5br/VcbZGCtztiutP5/19r77PcIMDHTFyAzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
From: Cole Leavitt <cole@unwrap.rs>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Cc: pierre-louis.bossart@linux.dev,
	rf@opensource.cirrus.com,
	ckeepax@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cole Leavitt <cole@unwrap.rs>
Subject: [PATCH v4] soundwire: bus: demote UNATTACHED state warnings to dev_dbg()
Date: Wed, 18 Feb 2026 11:02:10 -0700
Message-ID: <20260218180210.9263-1-cole@unwrap.rs>
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
driver triggers a hardware reset after firmware download, causing the
device to momentarily go UNATTACHED before re-attaching -- producing
misleading noise on every boot.

Demote the messages to dev_dbg() so they remain available via dynamic
debug for diagnosing real attachment failures without alarming users
during expected initialization sequences.

Fixes: d1b328557058 ("soundwire: bus: add dev_warn() messages to track UNATTACHED devices")
Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---
Changes in v4:
 - Remove incorrect PING frame race reference from commit message
   (Pierre-Louis Bossart)
 - Clarify that the actual trigger is codec hardware reset after
   firmware download

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
index fb68738dfb9b..fe5316d93fef 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1899,8 +1899,8 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 
 		if (status[i] == SDW_SLAVE_UNATTACHED &&
 		    slave->status != SDW_SLAVE_UNATTACHED) {
-			dev_warn(&slave->dev, "Slave %d state check1: UNATTACHED, status was %d\n",
-				 i, slave->status);
+			dev_dbg(&slave->dev, "Slave %d state check1: UNATTACHED, status was %d\n",
+			i, slave->status);
 			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
 
 			/* Ensure driver knows that peripheral unattached */
@@ -1951,8 +1951,8 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 			if (slave->status == SDW_SLAVE_UNATTACHED)
 				break;
 
-			dev_warn(&slave->dev, "Slave %d state check2: UNATTACHED, status was %d\n",
-				 i, slave->status);
+			dev_dbg(&slave->dev, "Slave %d state check2: UNATTACHED, status was %d\n",
+			i, slave->status);
 
 			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
 			break;
-- 
2.52.0

