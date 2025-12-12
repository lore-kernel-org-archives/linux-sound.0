Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00055225779
	for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 10:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765534436; cv=none; b=ls71xmpRkGOpIUi8CPGyLxBTcg/9s6QaCHBo6DqnOUu46l1wrv0GrnL0W+/P/974QtHWcF6G8+1wvQ5WgjcPwEY9DoqehPnSydV0vhAxhImiu/Hi/tiBDFYI+UeE7PuB1VXhrHFn9WkyYE7ptRo/lKERX//4+fkkHJDtXNehSFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765534436; c=relaxed/simple;
	bh=3Vvlbr+jKqwaA5DPdoMZmZ7QYo6PwubPJNwj3YLu394=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LBeCNidC7sjoC/jAsgyTY6iBv4Q06vNsNO6TUmzaQWfSd8EYMCfVlVqmDENtSctTtZ0CHiSbCnwgXNBbFUlVyKjQbZ3s3HAEeToY7xiJZtt3KMwDg8Ge1b9LUmxSiRdeqCm/fpRmopM2j/QH9RzGaBwYGJkNuuStCQlCQMNvwRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJ2ELERt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJ2ELERt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765534435; x=1797070435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Vvlbr+jKqwaA5DPdoMZmZ7QYo6PwubPJNwj3YLu394=;
  b=bJ2ELERtDqGFUvPHeoQAymubpOKvJ1dWpTmbYL2XpX8ZQgW35KfXBWWH
   jqgoC/fFXxCsBCFcHDLeuRNO2/2KDV0IDfJoav2QsmF6uQUxTMfaUHR6F
   PyubppDicyfN6QGeqareFLrNffMLKygQFe64svlMQSELe81e7hMQzJ4Tu
   nlMZltGl23tjNIdSYptl5gh020n2GO8AHln6h/GilASlkPQPVjDL+XU/Q
   5o+U56TK0ol4CNoBSyb7VMB7fnkaUvhTujnnFc1HknUCrYkI8auw8uvD1
   wU9RF8rKWOrmnUq/LwmWhO3CJ4XOFuCUEMSSq9t6vOTjdvt6DmRTbxwpb
   w==;
X-CSE-ConnectionGUID: FRLan8tKQX+ESJBBfHcf5Q==
X-CSE-MsgGUID: ASS6dQ94QNaTYfL65ata5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78891334"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78891334"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:13:54 -0800
X-CSE-ConnectionGUID: DtTtMJhRRPG8ujwVNsqs+g==
X-CSE-MsgGUID: +rbg+SUoTv66brmu42PTPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="234444924"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 02:13:53 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/5] ASoC: Intel: catpt: Update CATPT_IPC_ERROR macro
Date: Fri, 12 Dec 2025 11:38:55 +0100
Message-Id: <20251212103858.110701-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251212103858.110701-1-cezary.rojewski@intel.com>
References: <20251212103858.110701-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it easier for functions that call IPC handlers to deal with their
results by accounting for '0' (success) code. Rename the macro to
reflect this behaviour change.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/core.h   |  2 +-
 sound/soc/intel/catpt/device.c |  4 ++--
 sound/soc/intel/catpt/loader.c |  2 +-
 sound/soc/intel/catpt/pcm.c    | 24 ++++++++++--------------
 sound/soc/intel/catpt/sysfs.c  |  2 +-
 5 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index 7b7c30a0d2ac..d273f24d3d53 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -129,7 +129,7 @@ irqreturn_t catpt_dsp_irq_thread(int irq, void *dev_id);
  * HOST <-> DSP communication yet failure to process specific request.
  * Use below macro to convert returned non-zero values appropriately
  */
-#define CATPT_IPC_ERROR(err) (((err) < 0) ? (err) : -EREMOTEIO)
+#define CATPT_IPC_RET(ret)	(((ret) <= 0) ? (ret) : -EREMOTEIO)
 
 int catpt_dsp_send_msg_timeout(struct catpt_dev *cdev,
 			       struct catpt_ipc_msg request,
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index d13062c8e907..d8e0da558495 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -41,7 +41,7 @@ static int catpt_do_suspend(struct device *dev)
 	memset(&cdev->dx_ctx, 0, sizeof(cdev->dx_ctx));
 	ret = catpt_ipc_enter_dxstate(cdev, CATPT_DX_STATE_D3, &cdev->dx_ctx);
 	if (ret) {
-		ret = CATPT_IPC_ERROR(ret);
+		ret = CATPT_IPC_RET(ret);
 		goto release_dma_chan;
 	}
 
@@ -107,7 +107,7 @@ static int catpt_resume(struct device *dev)
 
 		ret = catpt_ipc_set_device_format(cdev, &cdev->devfmt[i]);
 		if (ret)
-			return CATPT_IPC_ERROR(ret);
+			return CATPT_IPC_RET(ret);
 	}
 
 	return 0;
diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index 6fd1a32f3863..566b6e04a848 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -657,7 +657,7 @@ int catpt_first_boot_firmware(struct catpt_dev *cdev)
 
 	ret = catpt_ipc_get_mixer_stream_info(cdev, &cdev->mixer);
 	if (ret)
-		return CATPT_IPC_ERROR(ret);
+		return CATPT_IPC_RET(ret);
 
 	ret = catpt_arm_stream_templates(cdev);
 	if (ret) {
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index abd1cb07c60c..cc43346f83af 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -365,9 +365,7 @@ static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
 	if (stream->template->type != CATPT_STRM_TYPE_LOOPBACK)
 		return catpt_set_dspvol(cdev, id, (long *)pos->private_value);
 	ret = catpt_ipc_mute_loopback(cdev, id, *(bool *)pos->private_value);
-	if (ret)
-		return CATPT_IPC_ERROR(ret);
-	return 0;
+	return CATPT_IPC_RET(ret);
 }
 
 static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
@@ -414,7 +412,7 @@ static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
 				     cdev->scratch,
 				     &stream->info);
 	if (ret)
-		return CATPT_IPC_ERROR(ret);
+		return CATPT_IPC_RET(ret);
 
 	ret = catpt_dai_apply_usettings(dai, stream);
 	if (ret) {
@@ -456,11 +454,11 @@ static int catpt_dai_prepare(struct snd_pcm_substream *substream,
 
 	ret = catpt_ipc_reset_stream(cdev, stream->info.stream_hw_id);
 	if (ret)
-		return CATPT_IPC_ERROR(ret);
+		return CATPT_IPC_RET(ret);
 
 	ret = catpt_ipc_pause_stream(cdev, stream->info.stream_hw_id);
 	if (ret)
-		return CATPT_IPC_ERROR(ret);
+		return CATPT_IPC_RET(ret);
 
 	stream->prepared = true;
 	return 0;
@@ -491,7 +489,7 @@ static int catpt_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		ret = catpt_ipc_set_write_pos(cdev, stream->info.stream_hw_id,
 					      pos, false, false);
 		if (ret)
-			return CATPT_IPC_ERROR(ret);
+			return CATPT_IPC_RET(ret);
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
@@ -499,7 +497,7 @@ static int catpt_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		catpt_dsp_update_lpclock(cdev);
 		ret = catpt_ipc_resume_stream(cdev, stream->info.stream_hw_id);
 		if (ret)
-			return CATPT_IPC_ERROR(ret);
+			return CATPT_IPC_RET(ret);
 		break;
 
 	case SNDRV_PCM_TRIGGER_STOP:
@@ -510,7 +508,7 @@ static int catpt_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		ret = catpt_ipc_pause_stream(cdev, stream->info.stream_hw_id);
 		catpt_dsp_update_lpclock(cdev);
 		if (ret)
-			return CATPT_IPC_ERROR(ret);
+			return CATPT_IPC_RET(ret);
 		break;
 
 	default:
@@ -679,7 +677,7 @@ static int catpt_dai_pcm_new(struct snd_soc_pcm_runtime *rtm,
 	pm_runtime_put_autosuspend(cdev->dev);
 
 	if (ret)
-		return CATPT_IPC_ERROR(ret);
+		return CATPT_IPC_RET(ret);
 
 	/* store device format set for given SSP */
 	memcpy(&cdev->devfmt[devfmt.iface], &devfmt, sizeof(devfmt));
@@ -849,9 +847,7 @@ static int catpt_set_dspvol(struct catpt_dev *cdev, u8 stream_id, long *ctlvol)
 		}
 	}
 
-	if (ret)
-		return CATPT_IPC_ERROR(ret);
-	return 0;
+	return CATPT_IPC_RET(ret);
 }
 
 static int catpt_volume_info(struct snd_kcontrol *kcontrol,
@@ -1041,7 +1037,7 @@ static int catpt_loopback_switch_put(struct snd_kcontrol *kcontrol,
 	pm_runtime_put_autosuspend(cdev->dev);
 
 	if (ret)
-		return CATPT_IPC_ERROR(ret);
+		return CATPT_IPC_RET(ret);
 
 	*(bool *)kcontrol->private_value = mute;
 	return 0;
diff --git a/sound/soc/intel/catpt/sysfs.c b/sound/soc/intel/catpt/sysfs.c
index e961e172f9b7..0cb122a4dfd2 100644
--- a/sound/soc/intel/catpt/sysfs.c
+++ b/sound/soc/intel/catpt/sysfs.c
@@ -24,7 +24,7 @@ static ssize_t fw_version_show(struct device *dev,
 	pm_runtime_put_autosuspend(cdev->dev);
 
 	if (ret)
-		return CATPT_IPC_ERROR(ret);
+		return CATPT_IPC_RET(ret);
 
 	return sysfs_emit(buf, "%d.%d.%d.%d\n", version.type, version.major,
 			  version.minor, version.build);
-- 
2.25.1

