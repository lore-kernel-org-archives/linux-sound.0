Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0EE37168
	for <linux-sound@vger.kernel.org>; Tue, 13 Feb 2024 11:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707823136; cv=none; b=G+MW9W0W3b/qj75xujHGRLrHprg5+xZm+xm1xtlm89qpYL3HivSb15gEi4o4t1MQUphxPv1WBN6qpZSexo5cNW5L0aEHIF9XBa8cjT7/NTBcLyjCD9RwulRlOYhwu8I6ZlX3MI2Pg7oaqEI4H7NwtMj8P8qNmM1gUQggYmxk95A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707823136; c=relaxed/simple;
	bh=88RKftrIN6tpj6knXZca5m470my0eZSPxE6E2ZHi6Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a1gyensxJnhWZZbKL/ZQ2gl6rBVjnPyH1Hptv/LWhHfMyAFFeUvMrqqpvF6btEIqmMN9uq0NdSpZ4/lIhsPlnoxcIMN5dJoOg+vfKmz7akK3qG1tRn566UgGZz4tMhxRJ01hUkxO99RosjYaQKmigsoNa6T7Q84hM9TDMO3rYOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xy1buK1g; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xy1buK1g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707823134; x=1739359134;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=88RKftrIN6tpj6knXZca5m470my0eZSPxE6E2ZHi6Uk=;
  b=Xy1buK1giuh28T+xUPvJ4uGB+rfc9MiT2Ac1Lo7EldkiLi16G7eE+7GE
   z+pQCRfbAn4hIGUBd0ngf6Fq48ovtf8IFFhdUCC0lXwgqgXt/pFTwww7Q
   HZP6dbCJRGmQP33EMG5X+TXb5Yoprh9q72VxLUPOIM81xGkJMql8cXses
   e4m7Zz70QxTyJQ8725MUXjV5Q4OFDkVIEtE9paTUmeLo2NbT/7OirrwLp
   CR/YiX7XuK5RQPUY3WV9gkqac3mrS3NAPOqZMeRZE3ZBRdjDOP/Fir7sd
   43S4KLDo3cmyaF9WFQk4+XjOciUwynkpSu96nCaT25LVJVUuP28C1rg3y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2180871"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="2180871"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 03:18:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="33666256"
Received: from dcoroian-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.42.253])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 03:18:51 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	rander.wang@intel.com
Subject: [PATCH] ASoC: SOF: mtrace: rework mtrace timestamp setting
Date: Tue, 13 Feb 2024 13:19:01 +0200
Message-ID: <20240213111901.20032-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rander Wang <rander.wang@intel.com>

The original timestamp is built base on windows epoch time which is not
fit for Linux system and difficult to be used for kernel debugging. This
patch adopts syslog timestamp so that we can simply use dmesg to check
the timestamp between fw and kernel.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-mtrace.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc4-mtrace.c b/sound/soc/sof/ipc4-mtrace.c
index 9f1e33ee8826..0e04bea9432d 100644
--- a/sound/soc/sof/ipc4-mtrace.c
+++ b/sound/soc/sof/ipc4-mtrace.c
@@ -4,6 +4,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/sched/signal.h>
+#include <linux/sched/clock.h>
 #include <sound/sof/ipc4/header.h>
 #include "sof-priv.h"
 #include "ipc4-priv.h"
@@ -412,7 +413,6 @@ static int ipc4_mtrace_enable(struct snd_sof_dev *sdev)
 	const struct sof_ipc_ops *iops = sdev->ipc->ops;
 	struct sof_ipc4_msg msg;
 	u64 system_time;
-	ktime_t kt;
 	int ret;
 
 	if (priv->mtrace_state != SOF_MTRACE_DISABLED)
@@ -424,9 +424,12 @@ static int ipc4_mtrace_enable(struct snd_sof_dev *sdev)
 	msg.primary |= SOF_IPC4_MOD_INSTANCE(SOF_IPC4_MOD_INIT_BASEFW_INSTANCE_ID);
 	msg.extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(SOF_IPC4_FW_PARAM_SYSTEM_TIME);
 
-	/* The system time is in usec, UTC, epoch is 1601-01-01 00:00:00 */
-	kt = ktime_add_us(ktime_get_real(), FW_EPOCH_DELTA * USEC_PER_SEC);
-	system_time = ktime_to_us(kt);
+	/*
+	 * local_clock() is used to align with dmesg, so both kernel and firmware logs have
+	 * the same base and a minor delta due to the IPC. system time is in us format but
+	 * local_clock() returns the time in ns, so convert to ns.
+	 */
+	system_time = div64_u64(local_clock(), NSEC_PER_USEC);
 	msg.data_size = sizeof(system_time);
 	msg.data_ptr = &system_time;
 	ret = iops->set_get_data(sdev, &msg, msg.data_size, true);
-- 
2.43.0

