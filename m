Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10249421225
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560276; cv=none; b=n9KS8XRPQ4bMJcDtpmfW2I8ehromNOMl9Eaq7QNsdoXwu7p0uMtbGRP2Wb7svPQ+sll7UhUYwiwFHeEOgWSsIzURoOtBRYMobZTdklfIDACH/l7FEpY1Rl1JpGE4+9pLbeUQedYZ1SbBsZodhhtPOjUp53SnP0C3JhhSur0ChyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560276; c=relaxed/simple;
	bh=p8FN8g3EOZH5t59VLDalA8oARMTh1mFd8vUbpEtJ3vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXA2w8Ryrmunbhw1tdcvLjzRFQQgejV2N2rBy8RupOvKoDPG05JcefgWBbSwb2aCfVdAlu10Sm/CA19WtJ5yvXvmuMu3dMsf4lq7lMYw97z0Cd7Kb2KV/SwSb0rARoq/rKbPTKEth9KABdfBl8OEACszvpz/DfTVDZHyA2KlqEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=irv1Y4ji; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="irv1Y4ji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560267; x=1821096267;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p8FN8g3EOZH5t59VLDalA8oARMTh1mFd8vUbpEtJ3vI=;
  b=irv1Y4jiATC8D2U3kLSzF5oCE8dw3nfZR0QCsO/6UwZS0Z0JcuEwWA+K
   Kkgs+1pT+g6irEyWl8U9HHEJSWe7rV+FFAwZGfKprMCG79BkiG3vEajk+
   L7sRbe+P4bAiaelNhDl0eRqtEVNaWgoZVh5c4dTwJ9Ns9EdbV/3CR1Bwa
   DViGeBuElagq1rpUwA++N1/EvMHSTahYffXfj9tpB/PRj/TtjaIbtC67e
   tDzaoVhoyW9M4Tz2qb7yhSNmgJyWChhplQp+zmo2JvcbriXoWGWzZVBV6
   pwFMV8qfKvbgKgR+JztrdIFGcBpLl7skpFIC6c1xa87zo0cQbYDJ4Vt8y
   A==;
X-CSE-ConnectionGUID: wQG+98H+Qxagnr/4oPmLlg==
X-CSE-MsgGUID: 9cq1tjOWRmeha/iQlzIP+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496558"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496558"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:20 -0700
X-CSE-ConnectionGUID: gQVsgZy5T0KJhJJBvkVjpA==
X-CSE-MsgGUID: vDcf6AwPSuyFYfOCf/4pyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293964"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:04:18 -0700
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
Subject: [PATCH v4 23/26] ASoC: SOF: ipc4: Handle compressed drain done notification from firmware
Date: Wed, 16 Sep 2026 15:03:17 +0300
Message-ID: <20260916120320.18318-24-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
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

