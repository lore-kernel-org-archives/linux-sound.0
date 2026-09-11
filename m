Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B0E450909
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125812; cv=none; b=WoHiOSjDc8c/arVOEwJplkOlhnc/snwrSOeZxquyxTO/fF8BlacoJjKWMfzGx9k0K4P+twVvQoGzhT/u+nrBVIUGLZ6P+aCP2tB1ommwW7iNtVMmWdFw4rSviWYSeQL+WHjcZ1GH87w1C52G7VWPEZyvFqQxwY6dXDNwVxwIldo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125812; c=relaxed/simple;
	bh=p8FN8g3EOZH5t59VLDalA8oARMTh1mFd8vUbpEtJ3vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BBkCxhjK2nvMvfkvDoHlt0iSLyCwmMUaUuqgv5S1wiR7Swg5CI2o7XIf5y/17zNloFOf5AXmETZ/sfbPbV2iiQTsiW/+5822zHOhS/9MEFYI7m01Tu/huZyJF5AxtjXBeMvQUSFf1HlVla9go1eUz6PkEl7HLNVb5X5LQe6hJ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9UT6qmU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9UT6qmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125808; x=1820661808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p8FN8g3EOZH5t59VLDalA8oARMTh1mFd8vUbpEtJ3vI=;
  b=c9UT6qmUT0rYUGNd5m0naywaWP+Em4gXC2DLnDChR1+SVGxrm36TljbJ
   /YUC4QG1RQxQ0hg6DkTSfXVpEHPQ5XLn32RjNjgCda96m+aoQbyKEMXGU
   n/mAXWQmHYqPDv5q/GayL7uVsIol7aJWDYFg7DeDYl8qFtRCRhkFBL5WZ
   7nKhFdlJiOstLNLkiHf1Ttcc50lQKoMXs/tYfuCmrtghVR2GBawc2Jh4M
   1sNy4fjFtYvf9Regel+le5NZ8HFDUxczhwVDYcynY9QUf5SyVaEMqhzYh
   832uaXe6tvKEElkJnVTYdpdlSkL7otW1bVQSrVRme2D1/VMZem7Jx8jwo
   A==;
X-CSE-ConnectionGUID: /968Yi3xT7WbwTnunvMFrg==
X-CSE-MsgGUID: 9UuWrUl9TtWkHwhvsNAyig==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100750081"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100750081"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:51 -0700
X-CSE-ConnectionGUID: WZW2TURATXqNrkpR8v1Qfw==
X-CSE-MsgGUID: XR++OFc0RjuVObjKbxdKIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213522"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:22:48 -0700
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
Subject: [PATCH v3 23/26] ASoC: SOF: ipc4: Handle compressed drain done notification from firmware
Date: Fri, 11 Sep 2026 14:21:49 +0300
Message-ID: <20260911112152.28528-24-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
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

