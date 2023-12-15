Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8F512E58
	for <linux-sound@vger.kernel.org>; Fri, 15 Dec 2023 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vf+oJzrr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702628245; x=1734164245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kwflmmhNZONA4rW+VKgS7JbnBTIZJk36G+az/1qW6ns=;
  b=Vf+oJzrrQWdGK4YdlmlNd53yyY86kwVMVYdZRo0K/NV8RU6K0gadOEtj
   3VHmb31ewulAs69QHphkhueaZbhyCzmr00cxRHAMO+p1AC2Ezy2jhh3c1
   Q19F0up0cW9DDLIm9AhFCEQyBC4xhfvh883XrGEIWdEBLNjbCzhEkOY7G
   e1nRjvikYauMmUmxPR/tTHoXoOC85TRaB3CZ9vweVfUqrC+Izr9qGpecF
   3IXFVsnZDI1mw/ewRRCAnAkbUWgZE5G+vrdgkI5BlJWhfkLnBYrXrwIhN
   DRzc+7Q55Px/lEkffGGeanFFaQSdcZrqTv8Z4WBX9PwD5KdNRWisz2su6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2414124"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="2414124"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 00:17:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="16206819"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 00:17:23 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/3] ASoC: SOF: IPC4: synchronize fw_config_params with fw definitions
Date: Fri, 15 Dec 2023 16:31:00 +0800
Message-Id: <20231215083102.3064200-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231215083102.3064200-1-yung-chuan.liao@linux.intel.com>
References: <20231215083102.3064200-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rander Wang <rander.wang@intel.com>

Update fw_config_params in driver.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/sof/ipc4/header.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index 2c81d6dde577..1eb538e18236 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -423,6 +423,12 @@ enum sof_ipc4_fw_config_params {
 	SOF_IPC4_FW_CFG_RESERVED,
 	SOF_IPC4_FW_CFG_POWER_GATING_POLICY,
 	SOF_IPC4_FW_CFG_ASSERT_MODE,
+	SOF_IPC4_FW_RESERVED1,
+	SOF_IPC4_FW_RESERVED2,
+	SOF_IPC4_FW_RESERVED3,
+	SOF_IPC4_FW_RESERVED4,
+	SOF_IPC4_FW_RESERVED5,
+	SOF_IPC4_FW_CONTEXT_SAVE
 };
 
 struct sof_ipc4_fw_version {
-- 
2.25.1

