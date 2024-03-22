Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7C63F9CC
	for <linux-sound@vger.kernel.org>; Fri, 22 Mar 2024 11:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711106802; cv=none; b=sRTWDFfTLlK7VCy6rmw6cH0F2Tddo4m+4vrB2lEuefaMtG/J4g1PBTfSjj/lkRquRu1VRMdqj4v31MQeGvaXu/TwR/vGiBiDQmTcvNpiu4Sd5g7SW188oFEGH0HJRON73UNnVfoNR20BIj25hXIAy5z1++980lqn5NOdh2CUj5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711106802; c=relaxed/simple;
	bh=Cltf0gUJhwqEhMMLpKzS3AOoVBO5HwUjCpHCNSxY2wI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sClJBDlJ6k0/YAsvO0f13WOk5lVy6HfI5oipv1JZb4VWytWEO5JceW9/BjJUXlOiwFAmhA/uEZppm1MSYSUfRTMt+L9xPWUFXj8/UNt/nkxVr4jTolBc7hUl59Q6t1AZ0DqUCijrcAMJVOO/6jodIubv0RvpKe0GswQdqGGcH3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cLVbNdGI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cLVbNdGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711106799; x=1742642799;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Cltf0gUJhwqEhMMLpKzS3AOoVBO5HwUjCpHCNSxY2wI=;
  b=cLVbNdGILbFLX4t0knQ0d540FNt+dV1zTvIZ2eL+hmDprStwXKvnD6sI
   b+BYzefa0eEOgXbSo5O793LWjDVIhVUEh9b/5tDUX5qWEqMqN/YrlVjzJ
   0LfvC+Wvf6rBiSZAEvE/XRGfNCONbwOXdJQFSsDcpHZbLksCNDQTIT+xM
   OBkVwcQtOY5YNdoaK8uyILPErj4B4yhRUTf8O/7i6cTmxd3+ZIY2/oFAo
   DxTvUEtAH1CcfQoPY/NPAH0TEpieaVGvQv6/aUjLPMjCe6qrf5PBXgeQz
   1usczDJYjGgOudzuZD4UftIqR5L+U2UqYjCpyi6g/FHhZ26GysA1/HlZX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9102212"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="9102212"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 04:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="15306939"
Received: from kridax-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.32.117])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 04:26:36 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	rander.wang@intel.com
Subject: [RESEND] ASoC: SOF: mtrace: rework mtrace timestamp setting
Date: Fri, 22 Mar 2024 13:27:03 +0200
Message-ID: <20240322112703.4549-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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
Hi Mark,

Can you pick this for 6.9, it was originally sent on 13.02.2024:
https://lore.kernel.org/linux-sound/20240213111901.20032-1-peter.ujfalusi@linux.intel.com/

Thanks,
Peter

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
2.44.0

