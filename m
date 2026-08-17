Received: from mail-m12787.qiye.163.com (mail-m12787.qiye.163.com [115.236.127.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154203B71B2
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 07:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.236.127.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953589; cv=none; b=Pc4x2+4jQWdc8GtfTvazGjJRfRbiAE3C8TuzgEV5Yukfy8ZrUfRuBcN0PU92bvBHttauGoJnAl1SKbaJ9y4gjrKa0X2hCQq58hOr2esKe9OetorwnG0z1qvZQvrhNj9kWUl/wEwRyb5/lPuPDRHpwaVPPeCa5WfIcjWAGDAcvlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953589; c=relaxed/simple;
	bh=Kb5ArOkgUb/gkPsu8CbkE2s2TFauZiDUGbAFmtiH7bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKC5adi3AeZvlJs1dNKMp79HJlh2hPdC/WF1IeAdnU/poJ0ym6KYjVycRNjbIvZKnrSbW7AOxptk2z9vNNIcqkUXGAm6bpep9cX9gg0254WtNXJanCpt2rgmd/KuRR2NOKG67B/i2vpbtwy+lkVAJYCUnrba5YRsw8T3SN6I9xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=fxsT+CDG; arc=none smtp.client-ip=115.236.127.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="fxsT+CDG"
Received: from localhost.localdomain (unknown [119.4.23.72])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a31dcd3b;
	Mon, 17 Aug 2026 11:23:30 +0800 (GMT+08:00)
From: Qianghua Wang <qianghua.wang@senarytech.com>
To: linux-sound@vger.kernel.org
Cc: Qianghua Wang <qianghua.wang@senarytech.com>,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	bo liu <bo.liu@senarytech.com>
Subject: [PATCH 1/2] ASoC: codecs: sn624x: enable runtime PM on first attach
Date: Mon, 17 Aug 2026 11:23:16 +0800
Message-ID: <20260817032318.3989-1-qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <4b1dedc3-91b4-4905-a402-d67e41bddfd5@sirena.org.uk>
References: <4b1dedc3-91b4-4905-a402-d67e41bddfd5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa00dbeea1509d8kunm432bab687347af
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGktPVkMdSx5PH0wYGBgZHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVT1VJSFVMSVlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++
DKIM-Signature: a=rsa-sha256;
	b=fxsT+CDGc6BE8EphwX5QYAN0nFZt86mhnmFSVg6/POzvxThPe5Q2mygMUd3HSCQr/6tYfuLAixLBOyQ61SqqXw3iK1PUvvRwWFy51Qf3nb89pI+CHvagQZO1c75k0A+WlhoqfKXcflK5nW6k1pgUvcHlhn7tNkB7uIykS9e9XSA=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=WwdTr5gJE3o9ztYGjiUjk9wOveT/FiHKck1v6dofLAI=;
	h=date:mime-version:subject:message-id:from;

Runtime PM was enabled unconditionally from probe after
register_component(). set_jack() can run in that window and
touch RPM before it is enabled, leading to mismatched get/put
counts. remove() only called pm_runtime_disable() when
first_hw_init was set, which did not match the probe enable.

Enable runtime PM from io_init() on first ATTACHED instead,
and do not use runtime PM from set_jack() until then. If
set_jack() ran early, take the long-lived jack PM reference
once io_init() has enabled RPM.

Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>
---
 sound/soc/codecs/sn624x-sdca-sdw.c | 63 ++++++++++++++++++++----------
 1 file changed, 43 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c b/sound/soc/codecs/sn624x-sdca-sdw.c
index cd18936037e9..8fd37f18fe5e 100644
--- a/sound/soc/codecs/sn624x-sdca-sdw.c
+++ b/sound/soc/codecs/sn624x-sdca-sdw.c
@@ -869,12 +869,16 @@ static int sn624x_jack_rpm_get(struct sn624x_sdca_priv *sn624x)
 
 	dev = sn624x->component->dev;
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0 && ret != -EACCES) {
-		dev_err(dev, "sn624x: jack rpm get failed (%d)\n", ret);
-		return ret;
+	if (ret < 0) {
+		if (ret != -EACCES) {
+			dev_err(dev, "sn624x: jack rpm get failed (%d)\n", ret);
+			return ret;
+		}
+		/* pm_runtime not enabled yet (before first ATTACHED io_init) */
+		return 0;
 	}
-	if (ret >= 0)
-		sn624x->jack_rpm = true;
+
+	sn624x->jack_rpm = true;
 	return 0;
 }
 
@@ -988,6 +992,18 @@ static int sn624x_sdca_set_jack_detect(struct snd_soc_component *component,
 		return 0;
 	}
 
+	/*
+	 * Component registration happens before runtime PM is enabled (RPM is
+	 * enabled from io_init on first ATTACHED). Do not touch runtime PM
+	 * until then, or get/put counts can go out of sync.
+	 */
+	if (!sn624x->first_hw_init) {
+		sn624x->hs_jack = hs_jack;
+		sn624x->jack_type_last = -1;
+		sn624x_jack_schedule_poll(sn624x);
+		return 0;
+	}
+
 	/*
 	 * Take the runtime PM reference before publishing hs_jack, so a
 	 * failed get cannot leave jack detection marked as enabled.
@@ -998,13 +1014,6 @@ static int sn624x_sdca_set_jack_detect(struct snd_soc_component *component,
 
 	sn624x->hs_jack = hs_jack;
 	sn624x->jack_type_last = -1;
-
-	/* set_jack may run before io_init; poll waits until hw_init. */
-	if (!sn624x->first_hw_init) {
-		sn624x_jack_schedule_poll(sn624x);
-		return 0;
-	}
-
 	sn624x_sdca_jack_init(sn624x);
 	return 0;
 }
@@ -1122,13 +1131,30 @@ static int sn624x_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	sn624x_sdca_sdca_irq_mask_all(sn624x);
 
 	regcache_cache_only(sn624x->regmap, false);
+	if (!sn624x->first_hw_init) {
+		/*
+		 * PM runtime is only enabled when a Slave reports as Attached
+		 * (same pattern as rt722).
+		 */
+		pm_runtime_set_autosuspend_delay(dev, 3000);
+		pm_runtime_use_autosuspend(dev);
+		pm_runtime_set_active(dev);
+		pm_runtime_mark_last_busy(dev);
+		pm_runtime_enable(dev);
+	}
 
 	pm_runtime_get_noresume(dev);
 
 	sn624x_uaj_apply_io_defaults(sn624x);
 
-	if (sn624x->hs_jack)
+	/*
+	 * set_jack() may have run before RPM was enabled (-EACCES). Take the
+	 * long-lived jack PM ref now that runtime PM is active.
+	 */
+	if (sn624x->hs_jack) {
+		sn624x_jack_rpm_get(sn624x);
 		sn624x_sdca_jack_init(sn624x);
+	}
 
 	ret = sn624x_sdca_jack_function_init(dev, sn624x);
 	if (ret < 0) {
@@ -1149,8 +1175,6 @@ static int sn624x_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	if (sn624x->first_hw_init)
 		regcache_mark_dirty(sn624x->regmap);
 
-	pm_runtime_set_active(dev);
-
 	sn624x->hw_init = true;
 	sn624x->first_hw_init = true;
 
@@ -1692,11 +1716,10 @@ int sn624x_sdca_init(struct device *dev, struct regmap *regmap,
 	if (ret < 0)
 		return ret;
 
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_enable(dev);
-
+	/*
+	 * Do not enable runtime PM here. SoundWire slaves are only powered /
+	 * accessible after ATTACHED; enable RPM from io_init() then.
+	 */
 	SN624X_DBG(dev, "snd_soc_register_component OK (DAI sn624x-sdca-aif)\n");
 	return 0;
 }
-- 
2.47.3

