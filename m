Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BF2281503
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 11:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797642; cv=none; b=id5CQF0cpMMKdLLNLGHcfR65CnNRtFVFC6JKab/ptueHP3REEyZ+067FKCBNur4ZorTh4DDeAQaam5Am2q2I7jmX03dNoHyxUXWbY2u5Iu0Kq7QBVyhd6nHGd9089tEIf5MttcKNxLTZaCgJ5r9sAnXfihxzaX7vuXRpgGn1lBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797642; c=relaxed/simple;
	bh=epm/mfkNSFkS5MRl8Y7ZMbQ3WylThWbfZwkvHI+x65A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWjb4So5Yw5OFjIsSgsy5G2wDPEgIPU+CK3t3LlEXk7TA2M1JkHG3cNLGNc1/8ZgC9LvEENtcyk9pi+ALd7dFJuZx1h7XzQtj2pYUpZbqfEzrEf7B48y6fma+qG7eduQXD2obhGZ94NK5liegbk/dPrdijJ+lL9uqU78Py8rA1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChFoclf7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChFoclf7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765797641; x=1797333641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=epm/mfkNSFkS5MRl8Y7ZMbQ3WylThWbfZwkvHI+x65A=;
  b=ChFoclf7nJaILai15FeLY7+kcHKEu9otx/2HMOsZCKV4g+t9m6t8icbk
   N7rSdjfflwIIKWO73gezgTl2oTSQsmk0Nk65iWkZh5bJDa6S2i/KwahK5
   tYkufRhxQmlzhBxJ6Ob3vgaIo0f34vyu8a0KDaR1GVSfMttceV9Al6AHQ
   hIEY+uHmrYbR2t9n1vidQgNQSBKGjNoO/aXzk6jR075qkmUZ923+A7MF8
   cZTLr7A0t98qet/uOKqLMSi0auInlAB/j2+cXbVh3gqGpdDrrxDrRPdmq
   VthK6PhHfyZqY7YpmH2kcRfn0rI/adVzwFofg0BXuYMq7C/N1oFICbjvW
   w==;
X-CSE-ConnectionGUID: hWtVyYvxQqGOk0YFCIiYtw==
X-CSE-MsgGUID: 2TR3610xTgywWzeYeAdG2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67731772"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67731772"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:20:41 -0800
X-CSE-ConnectionGUID: VAdo0wncSZibh6vEqcTOGQ==
X-CSE-MsgGUID: FyTvBjhFT5+eaekd4YZFjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197690223"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:20:38 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 5/8] ASoC: SOF: ipc4-topology: Set initial param_id for bytes control type
Date: Mon, 15 Dec 2025 13:20:45 +0200
Message-ID: <20251215112048.16331-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215112048.16331-1-peter.ujfalusi@linux.intel.com>
References: <20251215112048.16331-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the param_id in extension based on the information we got from the
topology.
If the payload did not present then the param_id will remain 0.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 4272d84679ac..d64e498c6985 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2924,6 +2924,7 @@ static int sof_ipc4_control_load_bytes(struct snd_sof_dev *sdev, struct snd_sof_
 	msg->primary = SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_MOD_LARGE_CONFIG_SET);
 	msg->primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
 	msg->primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+	msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(control_data->data->type);
 
 	return 0;
 
-- 
2.52.0

