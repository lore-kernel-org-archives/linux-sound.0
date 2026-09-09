Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4EA495021
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945043; cv=none; b=WH4GrNb03mnxg+lEtwQk8G/7MXwfmkmJHet9QnpTh7yNEHBALyL+uZ2EuPpghMWyMrVhyK6T53bUOKWtNVl4NifygbcRf00IJM10CUXte/3BNHNXxA13UWNMnA7hz2aXrA2hmVXA3V0exb/uYPRYAqUWwU6nZIC+eTJM21Lo1X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945043; c=relaxed/simple;
	bh=p8FN8g3EOZH5t59VLDalA8oARMTh1mFd8vUbpEtJ3vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oN6dWdnINA7Ap0pHDshTjseuxu/DKxiSh63WDn6qnMlH1M+MmeavC/t47cRDJPEcS2xbEpwK4xoW8mI7pL11kIgccN8N4QDqJYQQFJi35RjH0O5HhJI/d94ZwH+H+aVKza31UlfRVUVfdp2ncfuu/7UKX9SMXV3O8aih2heN2lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FqcHaQ+F; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FqcHaQ+F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788945043; x=1820481043;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p8FN8g3EOZH5t59VLDalA8oARMTh1mFd8vUbpEtJ3vI=;
  b=FqcHaQ+FspO5Xa03tRgDxwO+3hPJSDmVJHFaEsMQF7z4rQ4wfgqsWT2O
   l420o/4cXjGta5uWUhAfsEjyzj7OfC7y5rtA6ZzCzmrhv6x0mrcMhgxFh
   D2JrR7xw2bSBClYt1e2VVzibvwIw+n0XrI+eHw513PeduhRpbVZm/iHVJ
   QMCnT/JFZbFJN02gGrR67miuMdUEdffb+BBvIUjpZaN6u8LQi992LPtvj
   ydPA6eCX8+3D0FpaGIxXxw2Efue8oKh9cSOHp8DVr1HNs/KWO/00blSBZ
   +jH6tE3ZvxV6Qe0Vd+fDAWI9vOUhe8IgRuz2YtndDO4+tWRpMJD42+1yz
   Q==;
X-CSE-ConnectionGUID: rDR4cml2Q8SG6gSMiiphHA==
X-CSE-MsgGUID: U5efjxReSoaOoLXWLo9s9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89200883"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89200883"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:42 -0700
X-CSE-ConnectionGUID: 9T3UTKrUTmaebsT94guJbg==
X-CSE-MsgGUID: 86zAbDtDQRe3G4z/YQSYPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="266973363"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 02:10:38 -0700
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
	daniel.baluta@nxp.com
Subject: [PATCH v2 21/24] ASoC: SOF: ipc4: Handle compressed drain done notification from firmware
Date: Wed,  9 Sep 2026 12:09:46 +0300
Message-ID: <20260909090949.7503-22-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
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

