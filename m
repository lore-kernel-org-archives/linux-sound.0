Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2174F6F097
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707399270; cv=none; b=sPAhPvrhJ7KFNZtB4qoSIOib7hPhtlBeS+Xs7913x1huHoM0xhnC1ZntTpSidDmSwUzm/+6vma0vlCFClrVBUGobUeyXNRExge23TOfc8a1m0J2G2uVx5ey8dXCtZr5uSCjVPFAQcsUkHXnZFXq/BfPjZGcz/dmPqRkUV1uMToM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707399270; c=relaxed/simple;
	bh=pO0sOBD71j9JgCHpb+OOn/SUKuvP0Vgh0p8w2Knpbvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pM+Ko4SOI/tVLiTlo8vJxPMnRlGvlGoh8+h2sK4s+ReZN6wHXnY3gjHAAsQMNwZDppg7TF+Y3QlnA4oA3nap03VYKsGreapsgTHoaFpUWLG4XF2YmrikMLhlO8KwX+VMD5mJs86Nz97Uc9eUDVB6z9lc8D4r2qvgreR7lkusAqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RuijXWvR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RuijXWvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707399269; x=1738935269;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pO0sOBD71j9JgCHpb+OOn/SUKuvP0Vgh0p8w2Knpbvk=;
  b=RuijXWvRFKkAVXh1rxn4FZFKATFEkcQi1Vi1Krt4AtGfebwZusYZGsGr
   VUwPGsxAbYFqGu2JhitTz9x+Weo2Qe3uNQAJdiPqwJOUqH831OiyXdpSN
   kLgC8Qki9hQOS/ejYI+KARFuuDJWkcmZyXIv2Wl4E86YjryFhAvS7dSgy
   HTx7aliK80zSnsLhwtGQJbdXxNn36ecNbwgRefmAESRSQG7u31mniDKDF
   hSCcs/abS+p76G3gL9Qk9bio0gdzRKAXGPBafJGgD4sbvrb7VYzaHDO/g
   QdRfUrgSuT6YSej8473yw+fgqXME9KHzwurtzqDwhSwdeIWFfBin5WB9F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1128328"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1128328"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 05:34:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="824838799"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="824838799"
Received: from tvali-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.251.219.101])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 05:34:26 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc3-topology: Fix pipeline tear down logic
Date: Thu,  8 Feb 2024 15:34:32 +0200
Message-ID: <20240208133432.1688-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

With the change in the widget free logic to power down the cores only
when the scheduler widgets are freed, we need to ensure that the
scheduler widget is freed only after all the widgets associated with the
scheduler are freed. This is to ensure that the secondary core that the
scheduler is scheduled to run on is kept powered on until all widgets
that need them are in use. While this works well for dynamic pipelines,
in the case of static pipelines the current logic does not take this into
account and frees all widgets in the order they occur in the
widget_list. So, modify this to ensure that the scheduler widgets are freed
only after all other types of widgets in the widget_list are freed.

Link: https://github.com/thesofproject/linux/issues/4807
Fixes: 31ed8da1c8e5 ("ASoC: SOF: sof-audio: Modify logic for enabling/disabling topology cores")
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi Mark,

can you send this for 6.8 as a regression fix?

Thank you,
Peter

 sound/soc/sof/ipc3-topology.c | 55 ++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 0970dbdfa78a..ab7f46a162da 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2400,27 +2400,16 @@ static int sof_tear_down_left_over_pipelines(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-/*
- * For older firmware, this function doesn't free widgets for static pipelines during suspend.
- * It only resets use_count for all widgets.
- */
-static int sof_ipc3_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verify)
+static int sof_ipc3_free_widgets_in_list(struct snd_sof_dev *sdev, bool include_scheduler,
+					 bool *dyn_widgets, bool verify)
 {
 	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
 	struct snd_sof_widget *swidget;
-	struct snd_sof_route *sroute;
-	bool dyn_widgets = false;
 	int ret;
 
-	/*
-	 * This function is called during suspend and for one-time topology verification during
-	 * first boot. In both cases, there is no need to protect swidget->use_count and
-	 * sroute->setup because during suspend all running streams are suspended and during
-	 * topology loading the sound card unavailable to open PCMs.
-	 */
 	list_for_each_entry(swidget, &sdev->widget_list, list) {
 		if (swidget->dynamic_pipeline_widget) {
-			dyn_widgets = true;
+			*dyn_widgets = true;
 			continue;
 		}
 
@@ -2435,11 +2424,49 @@ static int sof_ipc3_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verif
 			continue;
 		}
 
+		if (include_scheduler && swidget->id != snd_soc_dapm_scheduler)
+			continue;
+
+		if (!include_scheduler && swidget->id == snd_soc_dapm_scheduler)
+			continue;
+
 		ret = sof_widget_free(sdev, swidget);
 		if (ret < 0)
 			return ret;
 	}
 
+	return 0;
+}
+
+/*
+ * For older firmware, this function doesn't free widgets for static pipelines during suspend.
+ * It only resets use_count for all widgets.
+ */
+static int sof_ipc3_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verify)
+{
+	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
+	struct snd_sof_widget *swidget;
+	struct snd_sof_route *sroute;
+	bool dyn_widgets = false;
+	int ret;
+
+	/*
+	 * This function is called during suspend and for one-time topology verification during
+	 * first boot. In both cases, there is no need to protect swidget->use_count and
+	 * sroute->setup because during suspend all running streams are suspended and during
+	 * topology loading the sound card unavailable to open PCMs. Do not free the scheduler
+	 * widgets yet so that the secondary cores do not get powered down before all the widgets
+	 * associated with the scheduler are freed.
+	 */
+	ret = sof_ipc3_free_widgets_in_list(sdev, false, &dyn_widgets, verify);
+	if (ret < 0)
+		return ret;
+
+	/* free all the scheduler widgets now */
+	ret = sof_ipc3_free_widgets_in_list(sdev, true, &dyn_widgets, verify);
+	if (ret < 0)
+		return ret;
+
 	/*
 	 * Tear down all pipelines associated with PCMs that did not get suspended
 	 * and unset the prepare flag so that they can be set up again during resume.
-- 
2.43.0

