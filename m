Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DC42C11CF
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 09:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756459793; cv=none; b=R/f7A43GZGFX3zb94Bg8U6mwbrRDYqgzfWB2aBO5rIPYgvG92R99oeyxk9A3XGicfls6JxFrz91xaZHDE+03Q5xtuYr3ObYXwzzJC7+FD29IJDPFGnE8MSTK6hJha592zS57oI6SlZQcqBAPWQKKZcZNjbjhg5dgequjF3/hSE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756459793; c=relaxed/simple;
	bh=beh6YjiDTBg0Qhz33CN7K4bss4RP6+bZpAEH8mabHnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b9nTzcIHJTsWN8yu5BmikITaxvK3gJw4YtzoKne3zAwDp1LOEYc6XPUDppllbUHSrgTvBbk0ke+KPbrC0p28pBq8mBiJQXQsU9fy7SI7YjMIaNKNrK8x3sSgAuIjkhmTshAyZF2PB/hbHr2zg9XWF706OJS050TZxDo/z5fy59c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nt2zbhpc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nt2zbhpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756459791; x=1787995791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=beh6YjiDTBg0Qhz33CN7K4bss4RP6+bZpAEH8mabHnA=;
  b=nt2zbhpc1B892mgI/DTDftl14lmgzrW2XOjRVnSj7NiiF18WnL1dlPnN
   CYFq0yHSTWISFuh5bR7sAk0igJeNjBxV5cru4cw3SZiCDr5RjJdV4W0Jl
   AqZg85Tkx5FKtX1jCCzY1DWSquiyXqXQ/LXIqjYMyDboQXxgKAtoinn5B
   W92ZiADh6H/cbJMcNyC6TKDAiwufQFo9GfAw3a3M7jwuYPm/hAY6Jwb54
   01GrXqTRRmFDDJ3BRFIi3zwY9o5frvrxjNQbDnQdGdIJqHMeTS/XlaUuk
   rRpsYoSUGADqjc0h68D5JfCToZcGZU4b3Fl8wrdSrsc8020b1dfEvPyMI
   A==;
X-CSE-ConnectionGUID: j+tHi4pyReay5jVp9OGJ4Q==
X-CSE-MsgGUID: tc2b/R2xSUO8cGQsfTFI3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="84147891"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="84147891"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:29:51 -0700
X-CSE-ConnectionGUID: 233nDmndQwuFO8ZxTF7Peg==
X-CSE-MsgGUID: qfEvC4FGSe6HRX3ep7ADrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="170245417"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 02:29:48 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH 3/5] ASoC: SOF: sof-client: Add sof_client_ipc4_find_swidget_by_id()
Date: Fri, 29 Aug 2025 12:30:20 +0300
Message-ID: <20250829093022.32094-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829093022.32094-1-peter.ujfalusi@linux.intel.com>
References: <20250829093022.32094-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

Add sof_client_ipc4_find_swidget_by_id() for finding widgets from SOF
client devices. The motivation is to decode probes debugfs output to
be more readable.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-client.c | 13 +++++++++++++
 sound/soc/sof/sof-client.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index 4c7951338c66..4d0acb8f85cd 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -353,6 +353,19 @@ struct sof_ipc4_fw_module *sof_client_ipc4_find_module(struct sof_client_dev *c,
 	return NULL;
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_ipc4_find_module, "SND_SOC_SOF_CLIENT");
+
+struct snd_sof_widget *sof_client_ipc4_find_swidget_by_id(struct sof_client_dev *cdev,
+							  u32 module_id, int instance_id)
+{
+	struct snd_sof_dev *sdev = sof_client_dev_to_sof_dev(cdev);
+
+	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4)
+		return sof_ipc4_find_swidget_by_ids(sdev, module_id, instance_id);
+	dev_err(sdev->dev, "Only supported with IPC4\n");
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS_GPL(sof_client_ipc4_find_swidget_by_id, "SND_SOC_SOF_CLIENT");
 #endif
 
 int sof_suspend_clients(struct snd_sof_dev *sdev, pm_message_t state)
diff --git a/sound/soc/sof/sof-client.h b/sound/soc/sof/sof-client.h
index b6ccc2cd69e5..c3741b92a26f 100644
--- a/sound/soc/sof/sof-client.h
+++ b/sound/soc/sof/sof-client.h
@@ -47,6 +47,8 @@ int sof_client_ipc_set_get_data(struct sof_client_dev *cdev, void *ipc_msg,
 				bool set);
 
 struct sof_ipc4_fw_module *sof_client_ipc4_find_module(struct sof_client_dev *c, const guid_t *u);
+struct snd_sof_widget *sof_client_ipc4_find_swidget_by_id(struct sof_client_dev *cdev,
+							  u32 module_id, int instance_id);
 
 struct dentry *sof_client_get_debugfs_root(struct sof_client_dev *cdev);
 struct device *sof_client_get_dma_dev(struct sof_client_dev *cdev);
-- 
2.50.1

