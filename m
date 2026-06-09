Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DC43EB81E
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 08:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780993840; cv=none; b=Ablfv+0Mt/18J/2lCG5jqDk/Bu2eNDe1fQ6sY9C6OWxMaCKrlQc+cOo7QNaE6VCL8PrKO4Z0EigxgFtMKnxD0xhQ+5+/YtbCEbe6k1XSGmUsFyZ63BfgC1xrbQn+oHlftyN2Z/cVggihpqpQ6pWaGXYOXZx9o/e/hplhaD1OkYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780993840; c=relaxed/simple;
	bh=6dsQxvQhLJVetkfeMf/uttbRlGesl8SmnutqmrXwEwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVN5YwLmQEfHC5DU4GBZjHb4ktRCQTH0UqeQ+0RRXRN5mr9wcefPEr2i3ZrAC2gtZKKayvLFTnrWznGQ4p5fRW524MIHC0JR2AYRlC15gplxhnYT9hHtiwFro7CNx2ZEiJUR2h58xTuRg1lhEiL+Us+ghPzrtPTACrc++EHtjYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdVxD2dl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdVxD2dl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780993839; x=1812529839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6dsQxvQhLJVetkfeMf/uttbRlGesl8SmnutqmrXwEwQ=;
  b=NdVxD2dlVWiWgWD6oFelfyBWXrhsr+0DNZO7Shri5t2Tmhj8eFRBSovA
   mmMoCi6Ctzyjdyik6FRf+93Ps/mY0PwBadHFC9kyE/1o8ZRyQgcTrVyXq
   absU4SJMkLxs7ym2ibyBrBYNDKTWHewk8d/q88snoDy4M/17DNRGyR0+4
   JL6bB6JC3R9ciK8rgp9UKtuoKch5WVrLwpQfgdoY6K+rbZKQ7RAXT+ynO
   YiK6pAAJ7i33pmxFY1LQPtUddu1yqGlkf3tUAEYjxvgo5BR0LMsJdudRR
   PEuT/YaaM5tBFfjY33F/hKq5qsG9QWADTucrwwrkqF+04ZfWJBqDE+BU3
   A==;
X-CSE-ConnectionGUID: obLlcLPIRZCsxk7H+5Zg4Q==
X-CSE-MsgGUID: jvM8sKA+SaeYCesbcGKzvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81600396"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="81600396"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 01:30:38 -0700
X-CSE-ConnectionGUID: D6LkAlpgSkeHRUZui14ZzQ==
X-CSE-MsgGUID: Fbe/VkiYTmu1ufp0KPijFg==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.253])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 01:30:36 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com
Subject: [PATCH 2/6] ASoC: SOF: ipc4-control: Validate notification payload size
Date: Tue,  9 Jun 2026 11:30:37 +0300
Message-ID: <20260609083041.29093-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609083041.29093-1-peter.ujfalusi@linux.intel.com>
References: <20260609083041.29093-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Validate MODULE_NOTIFICATION payload length before reading
bytes/channel data in control update handling.

Fixes: 2a28b5240f2b ("ASoC: SOF: ipc4-control: Add support for generic bytes control")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index aa31eed05730..8d86d32a16ca 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -875,6 +875,16 @@ static void sof_ipc4_control_update(struct snd_sof_dev *sdev, void *ipc_message)
 		 */
 		if (type == SND_SOC_TPLG_TYPE_BYTES) {
 			struct sof_abi_hdr *data = cdata->data;
+			size_t source_size = struct_size(msg_data, data, msg_data->num_elems);
+
+			if (source_size > ndata->event_data_size) {
+				dev_warn(sdev->dev,
+					 "%s: invalid bytes notification size for %s (%zu, %u)\n",
+					 __func__, scontrol->name, source_size,
+					 ndata->event_data_size);
+				scontrol->comp_data_dirty = true;
+				goto notify;
+			}
 
 			if (msg_data->num_elems > scontrol->max_size - sizeof(*data)) {
 				dev_warn(sdev->dev,
@@ -887,6 +897,17 @@ static void sof_ipc4_control_update(struct snd_sof_dev *sdev, void *ipc_message)
 				scontrol->size = sizeof(*cdata) + sizeof(*data) + data->size;
 			}
 		} else {
+			size_t source_size = struct_size(msg_data, chanv, msg_data->num_elems);
+
+			if (source_size > ndata->event_data_size) {
+				dev_warn(sdev->dev,
+					 "%s: invalid channel notification size for %s (%zu, %u)\n",
+					 __func__, scontrol->name, source_size,
+					 ndata->event_data_size);
+				scontrol->comp_data_dirty = true;
+				goto notify;
+			}
+
 			for (i = 0; i < msg_data->num_elems; i++) {
 				u32 channel = msg_data->chanv[i].channel;
 
@@ -914,6 +935,8 @@ static void sof_ipc4_control_update(struct snd_sof_dev *sdev, void *ipc_message)
 		scontrol->comp_data_dirty = true;
 	}
 
+notify:
+
 	/*
 	 * Look up the ALSA kcontrol of the scontrol to be able to send a
 	 * notification to user space
-- 
2.54.0

