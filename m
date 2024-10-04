Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B18614A60F
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 09:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034922; cv=none; b=R8mJG5B3pRfVI069qES2TUTiX6RDb2jvaCZzhimANIw3zXnSTYLc7c7uuCRdeuc17XKDKtQzm2JrclDCYnSecaGvOF0k/cTOjaeVRpqBqXkbft7lqjnDjPq3A+ZFapO5H/jNFnVlmRmAuHb1nNyHI4/vynnRrZmx33XR2+OF3sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034922; c=relaxed/simple;
	bh=dIixDDDFSrAGpdEihbXL2wCEVihCf6o4GNQForyV3xg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GfuwN6fZwpWes8jc8Ls+LzRzJ5BMoRzVNV8kqP78nk9GCCTYtLKN4y1A7XyCRw+RhnUl5obr+k6txxwBbmj+t8gOJtONkQGveCwXlzP3UGol3ypv03YOpHbrqDJj4mvACj6xW14B2F7Zv9hxNakB5LFhzY6P0/SvIquJihVZ4z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jvg4tDWv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvg4tDWv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034920; x=1759570920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dIixDDDFSrAGpdEihbXL2wCEVihCf6o4GNQForyV3xg=;
  b=jvg4tDWvDIXw8UwGmKwPwBEYdxfZ2SMDAmGQ91Egjf6UWI8mJVuZCmsm
   rwYHnF0DGRCEmUxW73Dl9UC7cQLaInMJ+4k8qH3CgiuIT0IhkJIQW4m+3
   7ejnW7oaGgTOfptCHfhGgo/R3fwQv0yyp8Vqz01cAIJIKxeGWhaRyKUpq
   c+e2c2UjpWZOmzmJdCF9+/FyG58wX9sjILDDmrq0L+NSZPGV4IHWEqhw0
   HRcG55x0PulBQeGPDJBmuF0JSpYhHDT8V+SAwtKb5yTs5iLQXe7DEbREC
   vT3Oyv2ckNmL/EbagHfuOwDKursOM5Npu2zA0MSjWujQzlnZV9oGOEFaS
   w==;
X-CSE-ConnectionGUID: X/e4RVIfQaOD2MKa8DKSRA==
X-CSE-MsgGUID: 2zk+oGYSRUeqcc8awniIAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27136238"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27136238"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:42:00 -0700
X-CSE-ConnectionGUID: 1fXzf/ApQxesXaNe4PasUQ==
X-CSE-MsgGUID: VCgJbLvZTReOFHy6gG9S+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105492120"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:58 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9CD1C11F727;
	Fri,  4 Oct 2024 12:41:55 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweot-000Thu-1x;
	Fri, 04 Oct 2024 12:41:55 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 49/51] ASoC: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:45 +0300
Message-Id: <20241004094145.114184-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 sound/soc/atmel/mchp-spdifrx.c                 | 12 ++++++------
 sound/soc/codecs/arizona-jack.c                | 12 ++++++------
 sound/soc/codecs/arizona.c                     |  2 +-
 sound/soc/codecs/cs35l41.c                     |  4 ++--
 sound/soc/codecs/cs35l45.c                     |  2 +-
 sound/soc/codecs/cs35l56-sdw.c                 |  4 ++--
 sound/soc/codecs/cs35l56-shared.c              |  2 +-
 sound/soc/codecs/cs35l56.c                     |  2 +-
 sound/soc/codecs/cs42l42-sdw.c                 |  2 +-
 sound/soc/codecs/cs42l42.c                     |  4 ++--
 sound/soc/codecs/cs42l43-jack.c                | 10 +++++-----
 sound/soc/codecs/cs42l43.c                     |  4 ++--
 sound/soc/codecs/hda.c                         |  6 +++---
 sound/soc/codecs/madera.c                      |  6 +++---
 sound/soc/codecs/max98363.c                    |  2 +-
 sound/soc/codecs/max98373-sdw.c                |  2 +-
 sound/soc/codecs/rt1017-sdca-sdw.c             |  2 +-
 sound/soc/codecs/rt1308-sdw.c                  |  2 +-
 sound/soc/codecs/rt1316-sdw.c                  |  2 +-
 sound/soc/codecs/rt1318-sdw.c                  |  2 +-
 sound/soc/codecs/rt1320-sdw.c                  |  2 +-
 sound/soc/codecs/rt5682-sdw.c                  |  2 +-
 sound/soc/codecs/rt700.c                       |  4 ++--
 sound/soc/codecs/rt711-sdca.c                  |  4 ++--
 sound/soc/codecs/rt711.c                       |  4 ++--
 sound/soc/codecs/rt712-sdca-dmic.c             |  2 +-
 sound/soc/codecs/rt712-sdca.c                  |  4 ++--
 sound/soc/codecs/rt715-sdca.c                  |  2 +-
 sound/soc/codecs/rt715.c                       |  2 +-
 sound/soc/codecs/rt722-sdca.c                  |  4 ++--
 sound/soc/codecs/wcd-mbhc-v2.c                 |  4 ++--
 sound/soc/codecs/wsa881x.c                     |  2 +-
 sound/soc/codecs/wsa884x.c                     |  2 +-
 sound/soc/intel/atom/sst/sst_pvt.c             |  2 +-
 sound/soc/intel/avs/core.c                     |  2 +-
 sound/soc/intel/avs/debugfs.c                  |  4 ++--
 sound/soc/intel/avs/pcm.c                      |  2 +-
 sound/soc/intel/catpt/pcm.c                    | 12 ++++++------
 sound/soc/intel/catpt/sysfs.c                  |  2 +-
 sound/soc/soc-component.c                      |  2 +-
 sound/soc/sof/control.c                        |  2 +-
 sound/soc/sof/debug.c                          |  2 +-
 sound/soc/sof/ipc3-dtrace.c                    |  2 +-
 sound/soc/sof/ipc4-loader.c                    |  2 +-
 sound/soc/sof/pcm.c                            |  2 +-
 sound/soc/sof/sof-client-ipc-flood-test.c      |  2 +-
 sound/soc/sof/sof-client-ipc-kernel-injector.c |  2 +-
 sound/soc/sof/sof-client-ipc-msg-injector.c    |  2 +-
 sound/soc/sof/sof-client-probes.c              |  6 +++---
 49 files changed, 85 insertions(+), 85 deletions(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index fb820609c043..08577aabd8b8 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -578,7 +578,7 @@ static int mchp_spdifrx_cs_get(struct mchp_spdifrx_dev *dev,
 
 pm_runtime_put:
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
 	return ret;
@@ -661,7 +661,7 @@ static int mchp_spdifrx_subcode_ch_get(struct mchp_spdifrx_dev *dev,
 
 pm_runtime_put:
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
 	return ret;
@@ -727,7 +727,7 @@ static int mchp_spdifrx_ulock_get(struct snd_kcontrol *kcontrol,
 	uvalue->value.integer.value[0] = ctrl->ulock;
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
 
@@ -763,7 +763,7 @@ static int mchp_spdifrx_badf_get(struct snd_kcontrol *kcontrol,
 	}
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
 
@@ -812,7 +812,7 @@ static int mchp_spdifrx_signal_get(struct snd_kcontrol *kcontrol,
 	}
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 unlock:
 	mutex_unlock(&dev->mlock);
@@ -876,7 +876,7 @@ static int mchp_spdifrx_rate_get(struct snd_kcontrol *kcontrol,
 
 pm_runtime_put:
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 unlock:
 	mutex_unlock(&dev->mlock);
 	return ret;
diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 9c15ddba6008..1a454f32d06f 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -278,7 +278,7 @@ static void arizona_start_mic(struct arizona_priv *info)
 		dev_err(arizona->dev, "Failed to enable micd: %d\n", ret);
 	} else if (!change) {
 		regulator_disable(info->micvdd);
-		pm_runtime_put_autosuspend(arizona->dev);
+		__pm_runtime_put_autosuspend(arizona->dev);
 	}
 }
 
@@ -320,7 +320,7 @@ static void arizona_stop_mic(struct arizona_priv *info)
 	if (change) {
 		regulator_disable(info->micvdd);
 		pm_runtime_mark_last_busy(arizona->dev);
-		pm_runtime_put_autosuspend(arizona->dev);
+		__pm_runtime_put_autosuspend(arizona->dev);
 	}
 }
 
@@ -594,7 +594,7 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 		arizona_start_mic(info);
 
 	if (info->hpdet_active) {
-		pm_runtime_put_autosuspend(arizona->dev);
+		__pm_runtime_put_autosuspend(arizona->dev);
 		info->hpdet_active = false;
 	}
 
@@ -647,7 +647,7 @@ static void arizona_identify_headphone(struct arizona_priv *info)
 
 err:
 	arizona_extcon_hp_clamp(info, false);
-	pm_runtime_put_autosuspend(arizona->dev);
+	__pm_runtime_put_autosuspend(arizona->dev);
 
 	/* Just report headphone */
 	snd_soc_jack_report(info->jack, SND_JACK_HEADPHONE,
@@ -1043,7 +1043,7 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	if (ret) {
 		dev_err(arizona->dev, "Failed to read jackdet status: %d\n", ret);
 		mutex_unlock(&info->lock);
-		pm_runtime_put_autosuspend(arizona->dev);
+		__pm_runtime_put_autosuspend(arizona->dev);
 		return IRQ_NONE;
 	}
 
@@ -1128,7 +1128,7 @@ static irqreturn_t arizona_jackdet(int irq, void *data)
 	mutex_unlock(&info->lock);
 
 	pm_runtime_mark_last_busy(arizona->dev);
-	pm_runtime_put_autosuspend(arizona->dev);
+	__pm_runtime_put_autosuspend(arizona->dev);
 
 	return IRQ_HANDLED;
 }
diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 402b9a2ff024..b489bad40eda 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -2548,7 +2548,7 @@ static void arizona_disable_fll(struct arizona_fll *fll)
 
 	if (ref_change) {
 		arizona_set_fll_clks(fll, fll->base, false);
-		pm_runtime_put_autosuspend(arizona->dev);
+		__pm_runtime_put_autosuspend(arizona->dev);
 	}
 }
 
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 07a5cab35fe1..e8149f92708f 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -484,7 +484,7 @@ static irqreturn_t cs35l41_irq(int irq, void *data)
 
 done:
 	pm_runtime_mark_last_busy(cs35l41->dev);
-	pm_runtime_put_autosuspend(cs35l41->dev);
+	__pm_runtime_put_autosuspend(cs35l41->dev);
 
 	return ret;
 }
@@ -1325,7 +1325,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 		goto err_pm;
 	}
 
-	pm_runtime_put_autosuspend(cs35l41->dev);
+	__pm_runtime_put_autosuspend(cs35l41->dev);
 
 	dev_info(cs35l41->dev, "Cirrus Logic CS35L41 (%x), Revision: %02X\n",
 		 regid, reg_revid);
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index fa1d9d9151f9..fc078971122f 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -1469,7 +1469,7 @@ int cs35l45_probe(struct cs35l45_private *cs35l45)
 	if (ret < 0)
 		goto err_dsp;
 
-	pm_runtime_put_autosuspend(cs35l45->dev);
+	__pm_runtime_put_autosuspend(cs35l45->dev);
 
 	return 0;
 
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 7c9a17fe2195..0166aa07e0a7 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -283,7 +283,7 @@ static void cs35l56_sdw_init(struct sdw_slave *peripheral)
 
 out:
 	pm_runtime_mark_last_busy(cs35l56->base.dev);
-	pm_runtime_put_autosuspend(cs35l56->base.dev);
+	__pm_runtime_put_autosuspend(cs35l56->base.dev);
 }
 
 static int cs35l56_sdw_interrupt(struct sdw_slave *peripheral,
@@ -332,7 +332,7 @@ static void cs35l56_sdw_irq_work(struct work_struct *work)
 		sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1,
 				CS35L56_SDW_INT_MASK_CODEC_IRQ);
 
-	pm_runtime_put_autosuspend(cs35l56->base.dev);
+	__pm_runtime_put_autosuspend(cs35l56->base.dev);
 }
 
 static int cs35l56_sdw_read_prop(struct sdw_slave *peripheral)
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index e45e9ae01bc6..656502427347 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -440,7 +440,7 @@ int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base)
 	else
 		ret = !!(val & CS35L56_FIRMWARE_MISSING);
 
-	pm_runtime_put_autosuspend(cs35l56_base->dev);
+	__pm_runtime_put_autosuspend(cs35l56_base->dev);
 
 	return ret;
 }
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 757ade6373ed..55760ba019f4 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -823,7 +823,7 @@ static void cs35l56_dsp_work(struct work_struct *work)
 
 err:
 	pm_runtime_mark_last_busy(cs35l56->base.dev);
-	pm_runtime_put_autosuspend(cs35l56->base.dev);
+	__pm_runtime_put_autosuspend(cs35l56->base.dev);
 }
 
 static int cs35l56_component_probe(struct snd_soc_component *component)
diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index 29891c1f6bec..a416ca0af376 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -304,7 +304,7 @@ static void cs42l42_sdw_init(struct sdw_slave *peripheral)
 
 err:
 	/* This cancels the pm_runtime_get_noresume() call from cs42l42_sdw_probe(). */
-	pm_runtime_put_autosuspend(cs42l42->dev);
+	__pm_runtime_put_autosuspend(cs42l42->dev);
 }
 
 static int cs42l42_sdw_read_prop(struct sdw_slave *peripheral)
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 6400ac875e6f..3d4b2ef78447 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -1672,7 +1672,7 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	mutex_lock(&cs42l42->irq_lock);
 	if (cs42l42->suspended || !cs42l42->init_done) {
 		mutex_unlock(&cs42l42->irq_lock);
-		pm_runtime_put_autosuspend(cs42l42->dev);
+		__pm_runtime_put_autosuspend(cs42l42->dev);
 		return IRQ_NONE;
 	}
 
@@ -1776,7 +1776,7 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 
 	mutex_unlock(&cs42l42->irq_lock);
 	pm_runtime_mark_last_busy(cs42l42->dev);
-	pm_runtime_put_autosuspend(cs42l42->dev);
+	__pm_runtime_put_autosuspend(cs42l42->dev);
 
 	return IRQ_HANDLED;
 }
diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index d9ab003e166b..be75f6e3467f 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -243,7 +243,7 @@ int cs42l43_set_jack(struct snd_soc_component *component,
 	mutex_unlock(&priv->jack_lock);
 
 	pm_runtime_mark_last_busy(priv->dev);
-	pm_runtime_put_autosuspend(priv->dev);
+	__pm_runtime_put_autosuspend(priv->dev);
 
 	return ret;
 }
@@ -424,7 +424,7 @@ void cs42l43_button_press_work(struct work_struct *work)
 	mutex_unlock(&priv->jack_lock);
 
 	pm_runtime_mark_last_busy(priv->dev);
-	pm_runtime_put_autosuspend(priv->dev);
+	__pm_runtime_put_autosuspend(priv->dev);
 }
 
 irqreturn_t cs42l43_button_press(int irq, void *data)
@@ -463,7 +463,7 @@ void cs42l43_button_release_work(struct work_struct *work)
 	mutex_unlock(&priv->jack_lock);
 
 	pm_runtime_mark_last_busy(priv->dev);
-	pm_runtime_put_autosuspend(priv->dev);
+	__pm_runtime_put_autosuspend(priv->dev);
 }
 
 irqreturn_t cs42l43_button_release(int irq, void *data)
@@ -505,7 +505,7 @@ void cs42l43_bias_sense_timeout(struct work_struct *work)
 	mutex_unlock(&priv->jack_lock);
 
 	pm_runtime_mark_last_busy(priv->dev);
-	pm_runtime_put_autosuspend(priv->dev);
+	__pm_runtime_put_autosuspend(priv->dev);
 }
 
 static void cs42l43_start_load_detect(struct cs42l43_codec *priv)
@@ -765,7 +765,7 @@ void cs42l43_tip_sense_work(struct work_struct *work)
 	mutex_unlock(&priv->jack_lock);
 
 	pm_runtime_mark_last_busy(priv->dev);
-	pm_runtime_put_autosuspend(priv->dev);
+	__pm_runtime_put_autosuspend(priv->dev);
 }
 
 irqreturn_t cs42l43_tip_sense(int irq, void *data)
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index d0098b4558b5..8095b24fdade 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1089,7 +1089,7 @@ static int cs42l43_shutter_get(struct cs42l43_codec *priv, unsigned int shift)
 
 error:
 	pm_runtime_mark_last_busy(priv->dev);
-	pm_runtime_put_autosuspend(priv->dev);
+	__pm_runtime_put_autosuspend(priv->dev);
 
 	return ret;
 }
@@ -2371,7 +2371,7 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_mark_last_busy(priv->dev);
-	pm_runtime_put_autosuspend(priv->dev);
+	__pm_runtime_put_autosuspend(priv->dev);
 
 	return 0;
 
diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index ddc00927313c..af6e89879a5e 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -163,7 +163,7 @@ int hda_codec_probe_complete(struct hda_codec *codec)
 out:
 	/* Complement pm_runtime_get_sync(bus) in probe */
 	pm_runtime_mark_last_busy(bus->dev);
-	pm_runtime_put_autosuspend(bus->dev);
+	__pm_runtime_put_autosuspend(bus->dev);
 
 	return ret;
 }
@@ -263,7 +263,7 @@ static int hda_codec_probe(struct snd_soc_component *component)
 	snd_hdac_ext_bus_link_put(bus, hlink);
 
 	pm_runtime_mark_last_busy(bus->dev);
-	pm_runtime_put_autosuspend(bus->dev);
+	__pm_runtime_put_autosuspend(bus->dev);
 	return ret;
 }
 
@@ -301,7 +301,7 @@ static void hda_codec_remove(struct snd_soc_component *component)
 	 */
 	if (!was_registered) {
 		pm_runtime_mark_last_busy(bus->dev);
-		pm_runtime_put_autosuspend(bus->dev);
+		__pm_runtime_put_autosuspend(bus->dev);
 	}
 
 #ifdef CONFIG_PM
diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index b24d6472ad5f..b8c3b306f742 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -3940,7 +3940,7 @@ static void madera_disable_fll(struct madera_fll *fll)
 
 	if (ref_change) {
 		madera_set_fll_clks(fll, fll->base, false);
-		pm_runtime_put_autosuspend(madera->dev);
+		__pm_runtime_put_autosuspend(madera->dev);
 	}
 }
 
@@ -4322,7 +4322,7 @@ static int madera_disable_fll_ao(struct madera_fll *fll)
 
 	if (change) {
 		madera_set_fllao_clks(fll, fll->base, false);
-		pm_runtime_put_autosuspend(madera->dev);
+		__pm_runtime_put_autosuspend(madera->dev);
 	}
 
 	return 0;
@@ -4411,7 +4411,7 @@ static int madera_fllhj_disable(struct madera_fll *fll)
 
 	if (change) {
 		madera_set_fllhj_clks(fll, fll->base, false);
-		pm_runtime_put_autosuspend(madera->dev);
+		__pm_runtime_put_autosuspend(madera->dev);
 	}
 
 	return 0;
diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
index 950105e5bffd..77ba5c25a759 100644
--- a/sound/soc/codecs/max98363.c
+++ b/sound/soc/codecs/max98363.c
@@ -189,7 +189,7 @@ static int max98363_io_init(struct sdw_slave *slave)
 
 out:
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return ret;
 }
diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 26860882fd91..ff24f0e021e7 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -459,7 +459,7 @@ static int max98373_io_init(struct sdw_slave *slave)
 	max98373->hw_init = true;
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt1017-sdca-sdw.c b/sound/soc/codecs/rt1017-sdca-sdw.c
index 7c8103a0d562..c3cfb7b29b68 100644
--- a/sound/soc/codecs/rt1017-sdca-sdw.c
+++ b/sound/soc/codecs/rt1017-sdca-sdw.c
@@ -363,7 +363,7 @@ static int rt1017_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	rt1017->hw_init = true;
 
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	dev_dbg(&slave->dev, "hw_init complete\n");
 	return 0;
diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 563df483a466..5a9d640fb04c 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -292,7 +292,7 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 	rt1308->hw_init = true;
 
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
 
diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 22f1ed4e03f1..90af6b232193 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -303,7 +303,7 @@ static int rt1316_io_init(struct device *dev, struct sdw_slave *slave)
 	rt1316->hw_init = true;
 
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
 	return 0;
diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index 319f71f5e60d..461c971d5a8b 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -435,7 +435,7 @@ static int rt1318_io_init(struct device *dev, struct sdw_slave *slave)
 	rt1318->hw_init = true;
 
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
 	return 0;
diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index ebd6f09bd990..ae6ab0e05ab4 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -708,7 +708,7 @@ static int rt1320_io_init(struct device *dev, struct sdw_slave *slave)
 	rt1320->hw_init = true;
 
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
 	return 0;
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 5edf11e136b4..84195703b945 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -475,7 +475,7 @@ static int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 
 err_nodev:
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	dev_dbg(&slave->dev, "%s hw_init complete: %d\n", __func__, ret);
 
diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 434b926f96c8..cfa8b7bfaad9 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -339,7 +339,7 @@ static int rt700_set_jack_detect(struct snd_soc_component *component,
 	rt700_jack_init(rt700);
 
 	pm_runtime_mark_last_busy(component->dev);
-	pm_runtime_put_autosuspend(component->dev);
+	__pm_runtime_put_autosuspend(component->dev);
 
 	return 0;
 }
@@ -1231,7 +1231,7 @@ int rt700_io_init(struct device *dev, struct sdw_slave *slave)
 	rt700->hw_init = true;
 
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
 
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index dd6ccf17afd4..078b1afa06cd 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -546,7 +546,7 @@ static int rt711_sdca_set_jack_detect(struct snd_soc_component *component,
 	rt711_sdca_jack_init(rt711);
 
 	pm_runtime_mark_last_busy(component->dev);
-	pm_runtime_put_autosuspend(component->dev);
+	__pm_runtime_put_autosuspend(component->dev);
 
 	return 0;
 }
@@ -1663,7 +1663,7 @@ int rt711_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	rt711->hw_init = true;
 
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
 	return 0;
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 5446f9506a16..695ca6a3b2f8 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -481,7 +481,7 @@ static int rt711_set_jack_detect(struct snd_soc_component *component,
 	rt711_jack_init(rt711);
 
 	pm_runtime_mark_last_busy(component->dev);
-	pm_runtime_put_autosuspend(component->dev);
+	__pm_runtime_put_autosuspend(component->dev);
 
 	return 0;
 }
@@ -1332,7 +1332,7 @@ int rt711_io_init(struct device *dev, struct sdw_slave *slave)
 	rt711->hw_init = true;
 
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
 	return 0;
diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index ee5435f3a80a..2b0ce2da6332 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -237,7 +237,7 @@ static int rt712_sdca_dmic_io_init(struct device *dev, struct sdw_slave *slave)
 	rt712->hw_init = true;
 
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
 	return 0;
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index e210c574bb74..d202662c4711 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -479,7 +479,7 @@ static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
 	rt712_sdca_jack_init(rt712);
 
 	pm_runtime_mark_last_busy(component->dev);
-	pm_runtime_put_autosuspend(component->dev);
+	__pm_runtime_put_autosuspend(component->dev);
 
 	return 0;
 }
@@ -1863,7 +1863,7 @@ int rt712_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	rt712->hw_init = true;
 
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
 	return 0;
diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 7e10fd913812..2a2c3f0e4cf9 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -1074,7 +1074,7 @@ int rt715_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	rt715->hw_init = true;
 
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 299c9b12377c..24d4c0395bfc 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -1138,7 +1138,7 @@ int rt715_io_init(struct device *dev, struct sdw_slave *slave)
 	rt715->hw_init = true;
 
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index e5bd9ef812de..2b142e4ef8d0 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -337,7 +337,7 @@ static int rt722_sdca_set_jack_detect(struct snd_soc_component *component,
 	rt722_sdca_jack_init(rt722);
 
 	pm_runtime_mark_last_busy(component->dev);
-	pm_runtime_put_autosuspend(component->dev);
+	__pm_runtime_put_autosuspend(component->dev);
 
 	return 0;
 }
@@ -1557,7 +1557,7 @@ int rt722_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	rt722->hw_init = true;
 
 	pm_runtime_mark_last_busy(&slave->dev);
-	pm_runtime_put_autosuspend(&slave->dev);
+	__pm_runtime_put_autosuspend(&slave->dev);
 
 	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
 	return 0;
diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index d589a212b768..2b9f7f9b0165 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -826,7 +826,7 @@ static int wcd_mbhc_initialise(struct wcd_mbhc *mbhc)
 	mutex_unlock(&mbhc->lock);
 
 	pm_runtime_mark_last_busy(component->dev);
-	pm_runtime_put_autosuspend(component->dev);
+	__pm_runtime_put_autosuspend(component->dev);
 
 	return 0;
 }
@@ -1320,7 +1320,7 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 		mbhc->mbhc_cb->hph_pull_down_ctrl(component, true);
 
 	pm_runtime_mark_last_busy(component->dev);
-	pm_runtime_put_autosuspend(component->dev);
+	__pm_runtime_put_autosuspend(component->dev);
 }
 
 static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index dd2d6661adc7..b27b31ea2704 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -781,7 +781,7 @@ static int wsa881x_put_pa_gain(struct snd_kcontrol *kc,
 	}
 
 	pm_runtime_mark_last_busy(comp->dev);
-	pm_runtime_put_autosuspend(comp->dev);
+	__pm_runtime_put_autosuspend(comp->dev);
 
 	return 1;
 }
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 86df5152c547..71d9dc0a57ff 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1942,7 +1942,7 @@ static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
 
 out:
 	pm_runtime_mark_last_busy(wsa884x->dev);
-	pm_runtime_put_autosuspend(wsa884x->dev);
+	__pm_runtime_put_autosuspend(wsa884x->dev);
 
 	return ret;
 }
diff --git a/sound/soc/intel/atom/sst/sst_pvt.c b/sound/soc/intel/atom/sst/sst_pvt.c
index e6a5c18a7018..62c5fa294098 100644
--- a/sound/soc/intel/atom/sst/sst_pvt.c
+++ b/sound/soc/intel/atom/sst/sst_pvt.c
@@ -293,7 +293,7 @@ int sst_pm_runtime_put(struct intel_sst_drv *sst_drv)
 	int ret;
 
 	pm_runtime_mark_last_busy(sst_drv->dev);
-	ret = pm_runtime_put_autosuspend(sst_drv->dev);
+	ret = __pm_runtime_put_autosuspend(sst_drv->dev);
 	if (ret < 0)
 		return ret;
 	return 0;
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index da7bac09acb4..194fc3c23210 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -224,7 +224,7 @@ static void avs_hda_probe_work(struct work_struct *work)
 	pm_runtime_set_autosuspend_delay(bus->dev, 2000);
 	pm_runtime_use_autosuspend(bus->dev);
 	pm_runtime_mark_last_busy(bus->dev);
-	pm_runtime_put_autosuspend(bus->dev);
+	__pm_runtime_put_autosuspend(bus->dev);
 	pm_runtime_allow(bus->dev);
 }
 
diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 1767ded4d983..5faa152f3edb 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -315,7 +315,7 @@ static int enable_logs(struct avs_dev *adev, u32 resource_mask, u32 *priorities)
 		avs_dsp_enable_d0ix(adev);
 err_d0ix:
 		pm_runtime_mark_last_busy(adev->dev);
-		pm_runtime_put_autosuspend(adev->dev);
+		__pm_runtime_put_autosuspend(adev->dev);
 	}
 
 	return ret;
@@ -342,7 +342,7 @@ static int disable_logs(struct avs_dev *adev, u32 resource_mask)
 	if (!adev->logged_resources) {
 		avs_dsp_enable_d0ix(adev);
 		pm_runtime_mark_last_busy(adev->dev);
-		pm_runtime_put_autosuspend(adev->dev);
+		__pm_runtime_put_autosuspend(adev->dev);
 	}
 
 	return ret;
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index afc0fc74cf94..e5f93e353844 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -860,7 +860,7 @@ static int avs_component_load_libraries(struct avs_soc_component *acomp)
 		ret = avs_module_info_init(adev, false);
 
 	pm_runtime_mark_last_busy(adev->dev);
-	pm_runtime_put_autosuspend(adev->dev);
+	__pm_runtime_put_autosuspend(adev->dev);
 
 	return ret;
 }
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 81a2f0339e05..59771c362295 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -674,7 +674,7 @@ static int catpt_dai_pcm_new(struct snd_soc_pcm_runtime *rtm,
 	ret = catpt_ipc_set_device_format(cdev, &devfmt);
 
 	pm_runtime_mark_last_busy(cdev->dev);
-	pm_runtime_put_autosuspend(cdev->dev);
+	__pm_runtime_put_autosuspend(cdev->dev);
 
 	if (ret)
 		return CATPT_IPC_ERROR(ret);
@@ -872,7 +872,7 @@ static int catpt_mixer_volume_get(struct snd_kcontrol *kcontrol,
 	}
 
 	pm_runtime_mark_last_busy(cdev->dev);
-	pm_runtime_put_autosuspend(cdev->dev);
+	__pm_runtime_put_autosuspend(cdev->dev);
 
 	return 0;
 }
@@ -893,7 +893,7 @@ static int catpt_mixer_volume_put(struct snd_kcontrol *kcontrol,
 			       ucontrol->value.integer.value);
 
 	pm_runtime_mark_last_busy(cdev->dev);
-	pm_runtime_put_autosuspend(cdev->dev);
+	__pm_runtime_put_autosuspend(cdev->dev);
 
 	return ret;
 }
@@ -928,7 +928,7 @@ static int catpt_stream_volume_get(struct snd_kcontrol *kcontrol,
 	}
 
 	pm_runtime_mark_last_busy(cdev->dev);
-	pm_runtime_put_autosuspend(cdev->dev);
+	__pm_runtime_put_autosuspend(cdev->dev);
 
 	return 0;
 }
@@ -959,7 +959,7 @@ static int catpt_stream_volume_put(struct snd_kcontrol *kcontrol,
 			       ucontrol->value.integer.value);
 
 	pm_runtime_mark_last_busy(cdev->dev);
-	pm_runtime_put_autosuspend(cdev->dev);
+	__pm_runtime_put_autosuspend(cdev->dev);
 
 	if (ret)
 		return ret;
@@ -1036,7 +1036,7 @@ static int catpt_loopback_switch_put(struct snd_kcontrol *kcontrol,
 	ret = catpt_ipc_mute_loopback(cdev, stream->info.stream_hw_id, mute);
 
 	pm_runtime_mark_last_busy(cdev->dev);
-	pm_runtime_put_autosuspend(cdev->dev);
+	__pm_runtime_put_autosuspend(cdev->dev);
 
 	if (ret)
 		return CATPT_IPC_ERROR(ret);
diff --git a/sound/soc/intel/catpt/sysfs.c b/sound/soc/intel/catpt/sysfs.c
index 936ac9d503ff..0815aa118bb1 100644
--- a/sound/soc/intel/catpt/sysfs.c
+++ b/sound/soc/intel/catpt/sysfs.c
@@ -22,7 +22,7 @@ static ssize_t fw_version_show(struct device *dev,
 	ret = catpt_ipc_get_fw_version(cdev, &version);
 
 	pm_runtime_mark_last_busy(cdev->dev);
-	pm_runtime_put_autosuspend(cdev->dev);
+	__pm_runtime_put_autosuspend(cdev->dev);
 
 	if (ret)
 		return CATPT_IPC_ERROR(ret);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index b67ef78f405c..02c960a99754 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1291,7 +1291,7 @@ void snd_soc_pcm_component_pm_runtime_put(struct snd_soc_pcm_runtime *rtd,
 			continue;
 
 		pm_runtime_mark_last_busy(component->dev);
-		pm_runtime_put_autosuspend(component->dev);
+		__pm_runtime_put_autosuspend(component->dev);
 
 		/* remove marked stream */
 		soc_component_mark_pop(component, pm);
diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 463d418e7200..bfda2a679d3b 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -197,7 +197,7 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 		ret = tplg_ops->control->bytes_ext_volatile_get(scontrol, binary_data, size);
 
 	pm_runtime_mark_last_busy(scomp->dev);
-	err = pm_runtime_put_autosuspend(scomp->dev);
+	err = __pm_runtime_put_autosuspend(scomp->dev);
 	if (err < 0)
 		dev_err_ratelimited(scomp->dev, "%s: failed to idle %d\n", __func__, err);
 
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index d0ffa1d71145..96f1d3fd66a4 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -218,7 +218,7 @@ static int memory_info_update(struct snd_sof_dev *sdev, char *buf, size_t buff_s
 
 	ret = sof_ipc_tx_message(sdev->ipc, &msg, msg.size, reply, SOF_IPC_MSG_MAX_SIZE);
 	pm_runtime_mark_last_busy(sdev->dev);
-	pm_runtime_put_autosuspend(sdev->dev);
+	__pm_runtime_put_autosuspend(sdev->dev);
 	if (ret < 0 || reply->rhdr.error < 0) {
 		ret = min(ret, reply->rhdr.error);
 		dev_err(sdev->dev, "error: reading memory info failed, %d\n", ret);
diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 744a91a150bc..74a1cb7a1797 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -173,7 +173,7 @@ static int ipc3_trace_update_filter(struct snd_sof_dev *sdev, int num_elems,
 	}
 	ret = sof_ipc_tx_message_no_reply(sdev->ipc, msg, msg->hdr.size);
 	pm_runtime_mark_last_busy(sdev->dev);
-	pm_runtime_put_autosuspend(sdev->dev);
+	__pm_runtime_put_autosuspend(sdev->dev);
 
 error:
 	kfree(msg);
diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index bcdb33d03682..0d5dea038cf5 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -239,7 +239,7 @@ static int sof_ipc4_load_library_by_uuid(struct snd_sof_dev *sdev,
 	ret = ipc4_data->load_library(sdev, fw_lib, false);
 
 	pm_runtime_mark_last_busy(sdev->dev);
-	err = pm_runtime_put_autosuspend(sdev->dev);
+	err = __pm_runtime_put_autosuspend(sdev->dev);
 	if (err < 0)
 		dev_err_ratelimited(sdev->dev, "%s: pm_runtime idle failed: %d\n",
 				    __func__, err);
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 35a7462d8b69..749e8c342b4b 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -658,7 +658,7 @@ static int sof_pcm_probe(struct snd_soc_component *component)
 
 pm_error:
 	pm_runtime_mark_last_busy(component->dev);
-	pm_runtime_put_autosuspend(component->dev);
+	__pm_runtime_put_autosuspend(component->dev);
 
 	return ret;
 }
diff --git a/sound/soc/sof/sof-client-ipc-flood-test.c b/sound/soc/sof/sof-client-ipc-flood-test.c
index e7d2001140e8..713ea95aa4f3 100644
--- a/sound/soc/sof/sof-client-ipc-flood-test.c
+++ b/sound/soc/sof/sof-client-ipc-flood-test.c
@@ -232,7 +232,7 @@ static ssize_t sof_ipc_flood_dfs_write(struct file *file, const char __user *buf
 				       ipc_duration_ms, ipc_count);
 
 	pm_runtime_mark_last_busy(dev);
-	err = pm_runtime_put_autosuspend(dev);
+	err = __pm_runtime_put_autosuspend(dev);
 	if (err < 0)
 		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
 
diff --git a/sound/soc/sof/sof-client-ipc-kernel-injector.c b/sound/soc/sof/sof-client-ipc-kernel-injector.c
index d3f541069b24..aadf7dd805b1 100644
--- a/sound/soc/sof/sof-client-ipc-kernel-injector.c
+++ b/sound/soc/sof/sof-client-ipc-kernel-injector.c
@@ -66,7 +66,7 @@ static ssize_t sof_kernel_msg_inject_dfs_write(struct file *file, const char __u
 	sof_client_ipc_rx_message(cdev, hdr, priv->kernel_buffer);
 
 	pm_runtime_mark_last_busy(dev);
-	ret = pm_runtime_put_autosuspend(dev);
+	ret = __pm_runtime_put_autosuspend(dev);
 	if (ret < 0)
 		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", ret);
 
diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index d0f8beb9d000..83f6740af39f 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -138,7 +138,7 @@ static int sof_msg_inject_send_message(struct sof_client_dev *cdev)
 		dev_err(dev, "IPC message send failed: %d\n", ret);
 
 	pm_runtime_mark_last_busy(dev);
-	err = pm_runtime_put_autosuspend(dev);
+	err = __pm_runtime_put_autosuspend(dev);
 	if (err < 0)
 		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
 
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index ccc7d38ddc38..43f0df010469 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -239,7 +239,7 @@ static ssize_t sof_probes_dfs_points_read(struct file *file, char __user *to,
 
 pm_error:
 	pm_runtime_mark_last_busy(dev);
-	err = pm_runtime_put_autosuspend(dev);
+	err = __pm_runtime_put_autosuspend(dev);
 	if (err < 0)
 		dev_err_ratelimited(dev, "debugfs read failed to idle %d\n", err);
 
@@ -290,7 +290,7 @@ sof_probes_dfs_points_write(struct file *file, const char __user *from,
 		ret = count;
 
 	pm_runtime_mark_last_busy(dev);
-	err = pm_runtime_put_autosuspend(dev);
+	err = __pm_runtime_put_autosuspend(dev);
 	if (err < 0)
 		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
 exit:
@@ -338,7 +338,7 @@ sof_probes_dfs_points_remove_write(struct file *file, const char __user *from,
 		ret = count;
 
 	pm_runtime_mark_last_busy(dev);
-	err = pm_runtime_put_autosuspend(dev);
+	err = __pm_runtime_put_autosuspend(dev);
 	if (err < 0)
 		dev_err_ratelimited(dev, "debugfs write failed to idle %d\n", err);
 exit:
-- 
2.39.5

