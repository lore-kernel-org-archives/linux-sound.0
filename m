Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B237444A406
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363053; cv=none; b=ZiqEszOpox2l+RUKUV7CosOT2vxyKnN3i7y50nPA2Q3tRhzjUkhYCwTWyfp8nzpS2/YSagDJDylOYmVcypIzpRjgRKEFNZFUnBBjXz3p0EUuGaRUxSv94Z8vjeOGcnQUiBeqEYBKLiaGtRgmnFb9ujLS0gVEdKktJypxhjT+x4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363053; c=relaxed/simple;
	bh=4Er1ijPqTtRPWpGeswZ/4/BH0hb+gI3OUTkes/rtnjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tKF7vJx/W8aEcJ00FwuL9wOU+oxoXgFdXmpkSndl5ELfXCmV7PnkLw6PR3eR77NUi+2XzAu9qJK6/mxgoxGkCvbBHLryzybb31O6K2bo+JxYApTskUCbXbH5O0Q2YNN0M4D1JIZepxt5CAUWbBbkoHvJz+IULPrWonmQ95eQeqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kRHhusX8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRHhusX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791363053; x=1822899053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Er1ijPqTtRPWpGeswZ/4/BH0hb+gI3OUTkes/rtnjQ=;
  b=kRHhusX8SaPFs92H4KIe7PQxkD1tldU+DhSGMikyDHwck69e7DMl0IVA
   yM2xUGRpTG8z9EOIKv6AQ3V4SdJb/qBeGq6o/l+ToEeMiDA2W0qFCG0yB
   GlM5Xd9rSUw+ItaNqDcvlNZfo7b7kE/0wGM1Dtg8JeBgIxYtp6BnO2nAD
   qc0NGzEJ9UKlg+8FXkjus+oBtCFD7iaMaap+D/U7NVYUAaG4vDsAHh5eU
   cT0ipOYNNNKd8nQ4MIn9pjvcWB8dpGbiybmPCwC0jhB51pnwUtIzmVTD5
   E15pRuoeAQQQnMN/QpGpP9AzK0Jw3DRXyTZr/khWEO0cxxqPTX4KNfnmA
   A==;
X-CSE-ConnectionGUID: DDJ6VvWHST23Up6VaysPhg==
X-CSE-MsgGUID: aaWrUQDXStSKNMQ/wINNuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="114072"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="114072"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:53 -0700
X-CSE-ConnectionGUID: mpBSDkixTnyQX0eyhCwBGA==
X-CSE-MsgGUID: m5bNv7uySiCZ1vJ+mvZJMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670825"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:50:50 -0700
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
Subject: [PATCH v5 25/28] ASoC: SOF: ipc4: Handle compressed drain done notification from firmware
Date: Wed,  7 Oct 2026 11:49:52 +0300
Message-ID: <20261007084955.1256-26-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
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
2.56.0

