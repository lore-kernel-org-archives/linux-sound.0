Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A215688C
	for <linux-sound@vger.kernel.org>; Fri,  4 Oct 2024 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034915; cv=none; b=N4uKgWVvcfQmHY68Tt/lfhsa6AoGsE4r39Uv4z0s9DniB5+9o6dkzQDPEuMYypYd9MaHzsFUAa6ChYPMcd0HcFICDkIvlbXQdkQ3EhOn3Kuv4vX/hiakRrvL5nijPyCH+3coqiKjlr4LpKj25UQ9y4TSZazcKnRYJVflPyBTxXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034915; c=relaxed/simple;
	bh=zWGaV998JgqpgJUyunum9o1Lk+jLjcRy5kf2ZAyf5n0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KYQ1jzPLbGE2fpXG8eJjKo9VE4JG2F/nDQ+7IuysnhlzY7MXLrP9nH2CQMDeV4Ca6YW9Qb2ZTYiUPF5vyLoj3JO1qe+r/YXJvn47XpLbGzWn09w1Kwn4Z2zuhhn8kB8wjUmBeON8KRITSHYaTDzTUFUnws+GdzG198cOoE0stvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwtQ3Rqn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwtQ3Rqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034914; x=1759570914;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zWGaV998JgqpgJUyunum9o1Lk+jLjcRy5kf2ZAyf5n0=;
  b=kwtQ3RqnulMJhVA4egdOBNAUx3EKL6v6Vv+U1e+BRDnqYgPzw7jZ8a2A
   Qd7m9aX9WePG5i3tJAfWv90TbjFh+lQsCClex2NbSj0t/K3G6rTTpmynm
   py3avz6PuP7DZ4S0cMrDvPSrjiCTIt07YLbmN61MAjWxJiLhDjOOm5e3y
   JwLyP4KXb1MYRwg1fWxK70jmqJjoF3rzJKzPDyy2psZjAg7NkbWxlbU6Y
   VO1/FLcKon+xbo7QlNx+SNDFaYBUjYyS3iM2EHnGSwjvqu8sWRrvIWoDi
   J9GplffI/MQkG/zlj3qyYf7/59YIu0JahS0aUoDMathpA34lEN+cXia4/
   g==;
X-CSE-ConnectionGUID: 2ePIjIBxSEi5iroaav/0vA==
X-CSE-MsgGUID: i+bYFJ6tRpq+Vifu7W//eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27136222"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27136222"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:53 -0700
X-CSE-ConnectionGUID: FXM2C4UbTUq/fmMnOKLPGg==
X-CSE-MsgGUID: 4Hel8LcBQG6Vac/OGDW04A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="105492109"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:51 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 829B8120F46;
	Fri,  4 Oct 2024 12:41:45 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoj-000Thd-1g;
	Fri, 04 Oct 2024 12:41:45 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	bo liu <bo.liu@senarytech.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Gergo Koteles <soyer@irl.hu>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Simon Trimmer <simont@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 48/51] ALSA: hda: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:45 +0300
Message-Id: <20241004094145.114167-1-sakari.ailus@linux.intel.com>
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
 sound/hda/hdac_device.c         | 2 +-
 sound/pci/hda/cs35l41_hda.c     | 8 ++++----
 sound/pci/hda/cs35l56_hda.c     | 2 +-
 sound/pci/hda/hda_intel.c       | 2 +-
 sound/pci/hda/tas2781_hda_i2c.c | 6 +++---
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 3fbb9793dcfc..0cac8e008ff9 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -582,7 +582,7 @@ int snd_hdac_power_down(struct hdac_device *codec)
 	struct device *dev = &codec->dev;
 
 	pm_runtime_mark_last_busy(dev);
-	return pm_runtime_put_autosuspend(dev);
+	return __pm_runtime_put_autosuspend(dev);
 }
 EXPORT_SYMBOL_GPL(snd_hdac_power_down);
 
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index d68bf7591d90..50d5b1e86d8d 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -805,7 +805,7 @@ static void cs35l41_hda_playback_hook(struct device *dev, int action)
 		 * This ensures no amps are playing back when we start putting them to sleep.
 		 */
 		pm_runtime_mark_last_busy(dev);
-		pm_runtime_put_autosuspend(dev);
+		__pm_runtime_put_autosuspend(dev);
 		break;
 	default:
 		break;
@@ -1232,7 +1232,7 @@ static void cs35l41_fw_load_work(struct work_struct *work)
 	mutex_unlock(&cs35l41->fw_mutex);
 
 	pm_runtime_mark_last_busy(cs35l41->dev);
-	pm_runtime_put_autosuspend(cs35l41->dev);
+	__pm_runtime_put_autosuspend(cs35l41->dev);
 }
 
 static int cs35l41_fw_load_ctl_put(struct snd_kcontrol *kcontrol,
@@ -1463,7 +1463,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 	unlock_system_sleep(sleep_flags);
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	dev_info(cs35l41->dev,
 		 "CS35L41 Bound - SSID: %s, BST: %d, VSPK: %d, CH: %c, FW EN: %d, SPKID: %d\n",
@@ -1992,7 +1992,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	if (ret)
 		goto err_pm;
 
-	pm_runtime_put_autosuspend(cs35l41->dev);
+	__pm_runtime_put_autosuspend(cs35l41->dev);
 
 	ret = component_add(cs35l41->dev, &cs35l41_hda_comp_ops);
 	if (ret) {
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index e3ac0e23ae32..fe482e4367e0 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -91,7 +91,7 @@ static void cs35l56_hda_pause(struct cs35l56_hda *cs35l56)
 			  BIT(CS35L56_ASP_TX3_EN_SHIFT) | BIT(CS35L56_ASP_TX4_EN_SHIFT));
 
 	pm_runtime_mark_last_busy(cs35l56->base.dev);
-	pm_runtime_put_autosuspend(cs35l56->base.dev);
+	__pm_runtime_put_autosuspend(cs35l56->base.dev);
 }
 
 static void cs35l56_hda_playback_hook(struct device *dev, int action)
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index b4540c5cd2a6..a462b0745c16 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2351,7 +2351,7 @@ static int azx_probe_continue(struct azx *chip)
 	if (azx_has_pm_runtime(chip)) {
 		pm_runtime_use_autosuspend(&pci->dev);
 		pm_runtime_allow(&pci->dev);
-		pm_runtime_put_autosuspend(&pci->dev);
+		__pm_runtime_put_autosuspend(&pci->dev);
 	}
 
 out_free:
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 370d847517f9..7e89b27643c7 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -160,7 +160,7 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 		mutex_unlock(&tas_hda->priv->codec_lock);
 
 		pm_runtime_mark_last_busy(dev);
-		pm_runtime_put_autosuspend(dev);
+		__pm_runtime_put_autosuspend(dev);
 		break;
 	default:
 		break;
@@ -698,7 +698,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	if (fmw)
 		release_firmware(fmw);
 	pm_runtime_mark_last_busy(tas_hda->dev);
-	pm_runtime_put_autosuspend(tas_hda->dev);
+	__pm_runtime_put_autosuspend(tas_hda->dev);
 }
 
 static int tas2781_hda_bind(struct device *dev, struct device *master,
@@ -741,7 +741,7 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
 		comp->playback_hook = tas2781_hda_playback_hook;
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return ret;
 }
-- 
2.39.5

