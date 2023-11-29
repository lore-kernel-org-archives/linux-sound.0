Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHO43IZe"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96CDD44
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 04:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701262375; x=1732798375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L9bbJWoQMIIHaeUsfS4fLqEci5gtCPfK3LJW90mngWs=;
  b=lHO43IZe5AJfnrvygFwHMsROiQllIE0asR9AKTnRZFhs+n5xqHSbGMlK
   mKrLTJ1UY6Y9zyzc7AJqyoAKmueSdyALk7IT9I/bxiEn3hX/v8HEurn55
   po13cdSbBx8tDqKh08U9BCmTeq//HVL0VfEgNkdGGnp7aiwy9ZBO5BhFD
   piLw7wVwnLtwNa7/MEHUPXbPhTNZPgpdZg8LfYOMRgzJl5bcubAA28160
   PuJI6uCmxLKm2a1OhYb0b/NWv7OuhEO0LsGhJqWNDxjKA8sbxVuUMDRRo
   r5cNzaMID0Db7ExSgJrxMM6BIEYnLxE7qCnI2vwZ1fHEPel5ND9bKJb5i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392022872"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392022872"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:52:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="17174592"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.44.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 04:52:54 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 01/13] ASoC: SOF: Move sof_of_machine_select() to sof-of-dev.c from sof-audio.c
Date: Wed, 29 Nov 2023 14:53:15 +0200
Message-ID: <20231129125327.23708-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
References: <20231129125327.23708-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the sof_of_machine_select() function to sof-of-dev.c file and provide
an inline stub in case of non OF builds.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-audio.c  | 22 ----------------------
 sound/soc/sof/sof-of-dev.c | 23 +++++++++++++++++++++++
 sound/soc/sof/sof-of-dev.h |  9 +++++++++
 3 files changed, 32 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 77cc64ac7113..4972a66c6007 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -1007,28 +1007,6 @@ int sof_dai_get_bclk(struct snd_soc_pcm_runtime *rtd)
 }
 EXPORT_SYMBOL(sof_dai_get_bclk);
 
-static struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_pdata *sof_pdata = sdev->pdata;
-	const struct sof_dev_desc *desc = sof_pdata->desc;
-	struct snd_sof_of_mach *mach = desc->of_machines;
-
-	if (!mach)
-		return NULL;
-
-	for (; mach->compatible; mach++) {
-		if (of_machine_is_compatible(mach->compatible)) {
-			sof_pdata->tplg_filename = mach->sof_tplg_filename;
-			if (mach->fw_filename)
-				sof_pdata->fw_filename = mach->fw_filename;
-
-			return mach;
-		}
-	}
-
-	return NULL;
-}
-
 /*
  * SOF Driver enumeration.
  */
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index c6be8a91e74b..432b511bf8c4 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -41,6 +41,29 @@ static void sof_of_probe_complete(struct device *dev)
 	pm_runtime_enable(dev);
 }
 
+struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pdata *sof_pdata = sdev->pdata;
+	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct snd_sof_of_mach *mach = desc->of_machines;
+
+	if (!mach)
+		return NULL;
+
+	for (; mach->compatible; mach++) {
+		if (of_machine_is_compatible(mach->compatible)) {
+			sof_pdata->tplg_filename = mach->sof_tplg_filename;
+			if (mach->fw_filename)
+				sof_pdata->fw_filename = mach->fw_filename;
+
+			return mach;
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(sof_of_machine_select);
+
 int sof_of_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/sound/soc/sof/sof-of-dev.h b/sound/soc/sof/sof-of-dev.h
index b6cc70595f3b..547e358a37e3 100644
--- a/sound/soc/sof/sof-of-dev.h
+++ b/sound/soc/sof/sof-of-dev.h
@@ -16,6 +16,15 @@ struct snd_sof_of_mach {
 	const char *sof_tplg_filename;
 };
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_OF_DEV)
+struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev);
+#else
+static inline struct snd_sof_of_mach *sof_of_machine_select(struct snd_sof_dev *sdev)
+{
+	return NULL;
+}
+#endif
+
 extern const struct dev_pm_ops sof_of_pm;
 
 int sof_of_probe(struct platform_device *pdev);
-- 
2.43.0

