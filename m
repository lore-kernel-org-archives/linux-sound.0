Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCEF2C1598;
	Tue, 17 Feb 2026 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771371358; cv=none; b=tfGNVoYlAoTvvlfs4brhKmJHCtdwy6B+J92YfJ87Ka/a//EXSeDg7yspx3et3cZORKYNnrEPXKtB0Qc0y4V2mGHjJzbz/V2JcnMaVEbZAfWg8baPuMBn6wbvYETGs2dreGRcCJciWN3d9uGaefWJF5tWWMinajhLZpez3ri7ToU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771371358; c=relaxed/simple;
	bh=chF8byulc7vGETJ8uuyrLnT2EdBhd01wrsU+vUAuAKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcznDQ8e4ofpCSka6+99b3FaiYi5/1otis2C2I7ijIA8WMKlokm5EplF6HvQ7o6DhXHx0/IB7zAPxPgsPYSjXSptwbSTLuvo+NzLsFAy3EzCyzem37KidtLlP1QEmnE4DKBF71Rm2gbConWvdfhltksZUaKLvrvQPzTURf24uIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
From: Cole Leavitt <cole@unwrap.rs>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Cc: pierre-louis.bossart@linux.dev,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	cole@unwrap.rs
Subject: [PATCH 1/2] soundwire: bus: downgrade expected unattach warnings to dev_dbg
Date: Tue, 17 Feb 2026 16:35:32 -0700
Message-ID: <20260217233533.4716-2-cole@unwrap.rs>
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

The sdw_handle_slave_status() function emits dev_warn() whenever a
peripheral transitions to UNATTACHED from a previously ATTACHED state.
While useful for debugging genuinely unexpected detachments, this
warning also fires during normal operation when a codec driver
intentionally triggers a system reset (e.g., after firmware download),
causing unnecessary noise in the kernel log on every boot.

Add an 'unattach_pending' flag to struct sdw_slave that codec drivers
can set before triggering an expected detach. When this flag is set,
the bus layer emits a dev_dbg() instead of dev_warn() and clears the
flag, preserving the warning for genuinely unexpected detachments.

Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---
 drivers/soundwire/bus.c       | 9 +++++++--
 include/linux/soundwire/sdw.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fb68738dfb9b..a5a71ab1feed 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1899,8 +1899,13 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 
 		if (status[i] == SDW_SLAVE_UNATTACHED &&
 		    slave->status != SDW_SLAVE_UNATTACHED) {
-			dev_warn(&slave->dev, "Slave %d state check1: UNATTACHED, status was %d\n",
-				 i, slave->status);
+			if (slave->unattach_pending)
+				dev_dbg(&slave->dev, "Slave %d state check1: UNATTACHED (expected), status was %d\n",
+					i, slave->status);
+			else
+				dev_warn(&slave->dev, "Slave %d state check1: UNATTACHED, status was %d\n",
+					 i, slave->status);
+			slave->unattach_pending = false;
 			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
 
 			/* Ensure driver knows that peripheral unattached */
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f462717acf20..4318f2b144e1 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -682,6 +682,7 @@ struct sdw_slave {
 	struct completion enumeration_complete;
 	struct completion initialization_complete;
 	u32 unattach_request;
+	bool unattach_pending;
 	bool first_interrupt_done;
 	bool is_mockup_device;
 	struct mutex sdw_dev_lock; /* protect callbacks/remove races */
-- 
2.52.0

