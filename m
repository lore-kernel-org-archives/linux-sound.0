Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFBD3B2FC7
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 07:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507151; cv=none; b=InF0tIDjSPUlw94PfWuE+A6Dqk5z/4D7JHaWL6UKGmsBFiMQKwinyDtwYPd7J+S+hrzOVHl4d1B6XnE11cC21izQ1RbAuMxwYaRJZ2oqqHDwcHIqBfe8oD+rsAGnk0L9mLkVIf8siR3JqlUZvEIIWXqj41uKKINSxiUYIrZrl8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507151; c=relaxed/simple;
	bh=p8FN8g3EOZH5t59VLDalA8oARMTh1mFd8vUbpEtJ3vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOpvtcMFfNFB9eckyBDrgRZcZJGtbVInBNu0NuwMsA6fMncSPnXdX8y5xuYfvzsCFOiA4HsWtI2FpozgZtJdnlYVOVXlUbM9T9ouweJVdJDPEi/vrob7qZ9uXtnwrSvCbxvfWcXnLMD8PbaomqFBks8zL2v+gGGZrDtohOQCQTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpYL3PGF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpYL3PGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788507150; x=1820043150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p8FN8g3EOZH5t59VLDalA8oARMTh1mFd8vUbpEtJ3vI=;
  b=BpYL3PGFLBhq0tlwmWqPYL8ikgkL6SFe30CjTUzaaDUYbzo7lxK/DTc4
   h55CyPGqMUT420360BXIDbTvNvPQRaE2RNvKGmbuYSI66bljPxRfqTypO
   JR/tge/E8w8E7GfKCgv46917gi+ZnIcstrx4bmK/qiSIpBgdgqvgCt/XW
   7rdHi72HxtqtmYW6UQXZm3GI5wGXErgKh2dqnggt/WJtgTwDQuR2MzHCq
   YSH16q7oewty+cEKkATBtNUoJYvoHMyTucKUxrrJhZOhMf0cShWvfozyi
   YsfEk3Om7IUW8cZBnhljTFXg8JhvCG8p2TkHdJ4YhA75TQbBbQz1x5EGT
   Q==;
X-CSE-ConnectionGUID: GkjmmFoIT8KukgFqkhy9XA==
X-CSE-MsgGUID: 9nOC9r1lQRWzCtjoRDd3Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111778065"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111778065"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:30 -0700
X-CSE-ConnectionGUID: UmvaQQ+PQYqU65tXDTajjg==
X-CSE-MsgGUID: ytFDMBVVSUGH+icWSic4eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293480707"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.213])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 00:32:27 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com,
	Vijendar.Mukunda@amd.com
Subject: [PATCH 20/23] ASoC: SOF: ipc4: Handle compressed drain done notification from firmware
Date: Fri,  4 Sep 2026 10:31:31 +0300
Message-ID: <20260904073134.29648-21-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The decoder module sends a drain done notification when the last chunk of
the stream after the EOS from host has been decoded.

The notification is a module notification with 0xc0c0 as magic number in
event_id upper 16 bit.

Call sof_ipc4_compr_drain_done() when the notification arrives to handle
it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 include/sound/sof/ipc4/header.h |  3 ++-
 sound/soc/sof/ipc4.c            | 13 +++++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index dd1e0d1cf0d8..c0216f4b14c2 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -647,9 +647,10 @@ struct sof_ipc4_notify_module_data {
  * The event_data contains the struct sof_ipc4_control_msg_payload of the control
  * which sent the notification.
  */
-#define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_MASK		GENMASK(31, 16)
+#define SOF_IPC4_NOTIFY_MODULE_EVENTID_SOF_MAGIC_MASK		GENMASK(31, 16)
 #define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_VAL		0xA15A0000
 #define SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_PARAMID_MASK	GENMASK(15, 0)
+#define SOF_IPC4_NOTIFY_MODULE_EVENTID_COMPR_MAGIC_VAL		0xC0C00000
 
 /*
  * Macros for creating struct sof_ipc4_module_init_ext_init payload
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index e77f73390bd8..b9dd798e59bc 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -776,12 +776,21 @@ static void sof_ipc4_module_notification_handler(struct snd_sof_dev *sdev,
 	}
 
 	/* Handle ALSA kcontrol notification */
-	if ((data->event_id & SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_MASK) ==
-	    SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_VAL) {
+	switch (data->event_id & SOF_IPC4_NOTIFY_MODULE_EVENTID_SOF_MAGIC_MASK) {
+	case SOF_IPC4_NOTIFY_MODULE_EVENTID_ALSA_MAGIC_VAL:
+	{
 		const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 
 		if (tplg_ops->control->update)
 			tplg_ops->control->update(sdev, ipc4_msg);
+
+		break;
+	}
+	case SOF_IPC4_NOTIFY_MODULE_EVENTID_COMPR_MAGIC_VAL:
+		sof_ipc4_compr_drain_done(sdev, ipc4_msg);
+		break;
+	default:
+		break;
 	}
 }
 
-- 
2.55.0

