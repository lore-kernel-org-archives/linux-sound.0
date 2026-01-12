Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C731E2882C5
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212575; cv=none; b=LDuWOOHAPqOyc9fasqGMoOUXNnWl8SgU665BbWR6Oo7zWrLNCBqNLWEWmh/nO1oBqtDwEvUmzlu5jSBRlLNBEveaGRT9tipoHMC54jvyWyIloDUlprnjn5TfmUGUBbbitDGrcCkTnPoqcGzPVC3IkqCfbuki5817wkVyMFv3N94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212575; c=relaxed/simple;
	bh=jw4R+G5HSECCzGnGHGCuuYR9W/MVggHvZ6p8EoUHlNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udL0WwyVy93/NugZVQP3EidogXQDvA4COAujr0sbhqTNht5g3gyvRkD5opvfe3/7mIpHZRs+GWIGhXlrGLPpjac9cPlEjVDc3uuD+AGcBR0wH0EhNSfPQOrnLfQcpJlkQzNbRmkTEhUwYXiNfme2J77dnAusHMXVXcS1ZlFeuXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9fcqn25; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9fcqn25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212573; x=1799748573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jw4R+G5HSECCzGnGHGCuuYR9W/MVggHvZ6p8EoUHlNM=;
  b=e9fcqn25bSaGoXZUoFKQGHvCtuNqYrXQlvelym6CuJMRMOZJZgias0oC
   VSf8uKBPd/ADZNJ5EcXeM8ShCYzWRXOm8+SU6FqZWLYHfWPLGILreGzvX
   1iEyT//1Lg9xoJBNsQTyf9PZd8Mr0gs/CiwuODRGEm6zpfMIqfMFK9zuL
   WYbo3IViF8/siWF0q/pR/1rUPDzYKjtfYFd/wcCM2Kiyr/cuAl4W5Exut
   GjdFRK8afOebIdNGZXhTDJ2Qgz+hWiMOmi4WBoKczMDcNuLJ+kQUghYVw
   lITZaQ0iqmNnqeDBh5emWWP7CAjitZxqVsUhbuFk0k01qVVx+er/gW3AE
   Q==;
X-CSE-ConnectionGUID: OtFqIF4LQf+PsgBmh6e/Sg==
X-CSE-MsgGUID: fhb6iJ8+QneTeITSsckZtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69535274"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69535274"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:33 -0800
X-CSE-ConnectionGUID: tahAXs8rS2mhv/v4oan3ag==
X-CSE-MsgGUID: nJ6QHaHdSJucVmnhpuOU0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208534711"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.204])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:09:31 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH 2/7] ASoC: SOF: Intel: Use guard()/scoped_guard() for mutex locks where it makes sense
Date: Mon, 12 Jan 2026 12:09:59 +0200
Message-ID: <20260112101004.7648-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112101004.7648-1-peter.ujfalusi@linux.intel.com>
References: <20260112101004.7648-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual mutex lock/unlock pairs with guard()/scoped_guard().

Only code refactoring, and no behavior change.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 22 ++++++++++++----------
 sound/soc/sof/intel/hda-mlink.c   | 29 ++++++++---------------------
 2 files changed, 20 insertions(+), 31 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 92681ca7f24d..cdfa3636f70c 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -311,7 +311,7 @@ static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cp
 	if (pipe_widget->instance_id < 0)
 		return 0;
 
-	mutex_lock(&ipc4_data->pipeline_state_mutex);
+	guard(mutex)(&ipc4_data->pipeline_state_mutex);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -323,16 +323,16 @@ static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cp
 		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 						  SOF_IPC4_PIPE_PAUSED);
 		if (ret < 0)
-			goto out;
+			return ret;
 
 		pipeline->state = SOF_IPC4_PIPE_PAUSED;
+
 		break;
 	default:
 		dev_err(sdev->dev, "unknown trigger command %d\n", cmd);
 		ret = -EINVAL;
 	}
-out:
-	mutex_unlock(&ipc4_data->pipeline_state_mutex);
+
 	return ret;
 }
 
@@ -388,7 +388,7 @@ static int hda_ipc4_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *c
 	if (pipe_widget->instance_id < 0)
 		return 0;
 
-	mutex_lock(&ipc4_data->pipeline_state_mutex);
+	guard(mutex)(&ipc4_data->pipeline_state_mutex);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -396,14 +396,16 @@ static int hda_ipc4_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *c
 			ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 							  SOF_IPC4_PIPE_PAUSED);
 			if (ret < 0)
-				goto out;
+				return ret;
+
 			pipeline->state = SOF_IPC4_PIPE_PAUSED;
 		}
 
 		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 						  SOF_IPC4_PIPE_RUNNING);
 		if (ret < 0)
-			goto out;
+			return ret;
+
 		pipeline->state = SOF_IPC4_PIPE_RUNNING;
 		swidget->spipe->started_count++;
 		break;
@@ -411,7 +413,8 @@ static int hda_ipc4_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *c
 		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 						  SOF_IPC4_PIPE_RUNNING);
 		if (ret < 0)
-			goto out;
+			return ret;
+
 		pipeline->state = SOF_IPC4_PIPE_RUNNING;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
@@ -429,8 +432,7 @@ static int hda_ipc4_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *c
 		ret = -EINVAL;
 		break;
 	}
-out:
-	mutex_unlock(&ipc4_data->pipeline_state_mutex);
+
 	return ret;
 }
 
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index ce561fe52bd5..6f15213937a3 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -524,11 +524,8 @@ void hdac_bus_eml_enable_interrupt(struct hdac_bus *bus, bool alt, int elid, boo
 
 	hlink = &h2link->hext_link;
 
-	mutex_lock(&h2link->eml_lock);
-
-	hdaml_link_enable_interrupt(hlink->ml_addr + AZX_REG_ML_LCTL, enable);
-
-	mutex_unlock(&h2link->eml_lock);
+	scoped_guard(mutex, &h2link->eml_lock)
+		hdaml_link_enable_interrupt(hlink->ml_addr + AZX_REG_ML_LCTL, enable);
 }
 EXPORT_SYMBOL_NS(hdac_bus_eml_enable_interrupt, "SND_SOC_SOF_HDA_MLINK");
 
@@ -837,11 +834,8 @@ int hdac_bus_eml_sdw_set_lsdiid(struct hdac_bus *bus, int sublink, int dev_num)
 
 	hlink = &h2link->hext_link;
 
-	mutex_lock(&h2link->eml_lock);
-
-	hdaml_link_set_lsdiid(hlink->ml_addr + AZX_REG_ML_LSDIID_OFFSET(sublink), dev_num);
-
-	mutex_unlock(&h2link->eml_lock);
+	scoped_guard(mutex, &h2link->eml_lock)
+		hdaml_link_set_lsdiid(hlink->ml_addr + AZX_REG_ML_LSDIID_OFFSET(sublink), dev_num);
 
 	return 0;
 } EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_set_lsdiid, "SND_SOC_SOF_HDA_MLINK");
@@ -875,12 +869,8 @@ int hdac_bus_eml_sdw_map_stream_ch(struct hdac_bus *bus, int sublink, int y,
 		lchan = 0;
 	}
 
-	mutex_lock(&h2link->eml_lock);
-
-	hdaml_shim_map_stream_ch(pcmsycm, lchan, hchan,
-				 stream_id, dir);
-
-	mutex_unlock(&h2link->eml_lock);
+	scoped_guard(mutex, &h2link->eml_lock)
+		hdaml_shim_map_stream_ch(pcmsycm, lchan, hchan, stream_id, dir);
 
 	val = readw(pcmsycm);
 
@@ -1012,11 +1002,8 @@ int hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool e
 
 	hlink = &h2link->hext_link;
 
-	mutex_lock(&h2link->eml_lock);
-
-	hdaml_lctl_offload_enable(hlink->ml_addr + AZX_REG_ML_LCTL, enable);
-
-	mutex_unlock(&h2link->eml_lock);
+	scoped_guard(mutex, &h2link->eml_lock)
+		hdaml_lctl_offload_enable(hlink->ml_addr + AZX_REG_ML_LCTL, enable);
 
 	return 0;
 }
-- 
2.52.0

