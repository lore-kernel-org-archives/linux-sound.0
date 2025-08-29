Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500AE1DF256
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 10:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756463075; cv=none; b=hJFVUmKywBWgPxnR6cF1OHVb/1cAYaF2mtoWBKhXQp3YJUNxfgY0p4tPjdqvyqBL88KCqXAgf1IJokQtfTz2U78IMR+FSl5yX5Vzxegr/svKysacAl1pVRywTsNBMT+ZAxaRyBNj0z9tJHSsm999vaD+KxmVQ6sWv3Lt5Caeq+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756463075; c=relaxed/simple;
	bh=K1M8pRFMxFSi7jFU84uIkFtkasHNdZEAuxfyBw0sRlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtBzQzhYUc57FXWg05KQYlM103qA8cHrYFO6xtM2ziuFzTMj9Asil7KQ2Y1kkRBH1kCVI2J/aQ9XX7vNXTV97VjTo5O+RVW4LoKVci6UUzri135UyNPKpFvF1pDq8fTImjTv7plG2t03cGmt0zPnLTtU7cmxqld0tL9/1NeRu18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FzVSgtHV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FzVSgtHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756463074; x=1787999074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K1M8pRFMxFSi7jFU84uIkFtkasHNdZEAuxfyBw0sRlY=;
  b=FzVSgtHV48XHXMxUIaSyhrnFdTPZqeOiekX6I0kBaj9EXEXR4sHUcI4w
   awkBe60cHOTnCi4vGNf5VGXfSr+DC0og4utpV7SYcuSTRiofuK6uwBgJw
   6AYfGTH5SZf427WXV5shxk1fG8TS/dHcdEYjKyiLmDvNrGxz0lXcDJ/Z9
   n9sCdzSZRshYJX6wCbk6PDUmM8gdRSDpRS8bwEaCT76zAAKdrQ2Yxxoi3
   nK8Jj3HHjWYQsUKfc4gsgjqGyuwxiweKb3ouJteCVh8iGkhsgQruym0X7
   VzTlpBnTD8gIrL45E9+RYyZt1uyxL/b/W/ufKsNdGGoBC/2uM8ZEdscDr
   A==;
X-CSE-ConnectionGUID: 7QK+yHKkQdWPOxU2TBnRUA==
X-CSE-MsgGUID: MDfanUtoRPubGRdEygroxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76342706"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="76342706"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:24:34 -0700
X-CSE-ConnectionGUID: mDZ7asyfSaeKOCnWwxTMjQ==
X-CSE-MsgGUID: vk8bcByOSVmxWeyLiL50tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="194001728"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.56])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 03:24:32 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	jyri.sarha@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: sof-client: Convert sof_client_dev_to_sof_dev into function
Date: Fri, 29 Aug 2025 13:25:09 +0300
Message-ID: <20250829102510.15159-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829102510.15159-1-peter.ujfalusi@linux.intel.com>
References: <20250829102510.15159-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the sof_client_dev_to_sof_dev() from the header file and add it as
a function in sof-client.c to avoid it's use by client drivers.

At the same time mark the sdev and list of sof_client_dev as restricted
fro core use only.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-client.c | 6 ++++++
 sound/soc/sof/sof-client.h | 6 ++----
 sound/soc/sof/sof-priv.h   | 9 +++++++++
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index 4c7951338c66..2db12753f79e 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -611,3 +611,9 @@ enum sof_fw_state sof_client_get_fw_state(struct sof_client_dev *cdev)
 	return sdev->fw_state;
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_get_fw_state, "SND_SOC_SOF_CLIENT");
+
+struct snd_sof_dev *sof_client_dev_to_sof_dev(struct sof_client_dev *cdev)
+{
+	return cdev->sdev;
+}
+EXPORT_SYMBOL_NS_GPL(sof_client_dev_to_sof_dev, "SND_SOC_SOF_CLIENT");
diff --git a/sound/soc/sof/sof-client.h b/sound/soc/sof/sof-client.h
index b6ccc2cd69e5..8b267b0b9ff1 100644
--- a/sound/soc/sof/sof-client.h
+++ b/sound/soc/sof/sof-client.h
@@ -18,8 +18,8 @@ struct sof_ipc4_fw_module;
 /**
  * struct sof_client_dev - SOF client device
  * @auxdev:	auxiliary device
- * @sdev:	pointer to SOF core device struct
- * @list:	item in SOF core client dev list
+ * @sdev:	pointer to SOF core device struct, resticted for core use only
+ * @list:	item in SOF core client dev list, resticted for core use only
  * @data:	device specific data
  */
 struct sof_client_dev {
@@ -29,8 +29,6 @@ struct sof_client_dev {
 	void *data;
 };
 
-#define sof_client_dev_to_sof_dev(cdev)		((cdev)->sdev)
-
 #define auxiliary_dev_to_sof_client_dev(auxiliary_dev) \
 	container_of(auxiliary_dev, struct sof_client_dev, auxdev)
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index abbb5ee7e08c..0f624d8cde20 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -838,7 +838,11 @@ int sof_stream_pcm_close(struct snd_sof_dev *sdev,
 			 struct snd_pcm_substream *substream);
 
 /* SOF client support */
+struct sof_client_dev;
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_CLIENT)
+struct snd_sof_dev *sof_client_dev_to_sof_dev(struct sof_client_dev *cdev);
+
 int sof_client_dev_register(struct snd_sof_dev *sdev, const char *name, u32 id,
 			    const void *data, size_t size);
 void sof_client_dev_unregister(struct snd_sof_dev *sdev, const char *name, u32 id);
@@ -849,6 +853,11 @@ void sof_client_fw_state_dispatcher(struct snd_sof_dev *sdev);
 int sof_suspend_clients(struct snd_sof_dev *sdev, pm_message_t state);
 int sof_resume_clients(struct snd_sof_dev *sdev);
 #else /* CONFIG_SND_SOC_SOF_CLIENT */
+static inline struct snd_sof_dev *
+sof_client_dev_to_sof_dev(struct sof_client_dev *cdev) {
+	return NULL;
+}
+
 static inline int sof_client_dev_register(struct snd_sof_dev *sdev, const char *name,
 					  u32 id, const void *data, size_t size)
 {
-- 
2.50.1

