Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745AF44E66C
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069015; cv=none; b=SuKBO9LUZkLbbfnx1VRq00xXbErG2rP5eztDX6JHQXZcaPr80zRm08LqgqgSJEb9ZlKgTJPLN9Yyk5krLVBuVAVLf3fUXWIkw2/euJOimcpbEb8zStR3Z/VUM8pS7gOoaM1+tMPs3kd5CLggT2Au/h0h5cEjdYqpA3Qrc2WQKxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069015; c=relaxed/simple;
	bh=Gf1bdc0pewGYTFcj2IvO9qBuaOHZ36IbSkeXFs3YBeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qgh1b45il5svHtZwp+ZC4Hls02nnLCUYeUwBejxje/6XFwC96T7nb1u25tLy8lRF9pZ9UlztKVnAdaKB9zZWCzGYNr7+ucjhLZYqMrMdw9HkvyizRW4ADxz4y5o09NWP9w4//rpZYabT/9+SZO6fMwpmR3FnQLdN05lcrkm0YEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKxbMDBm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKxbMDBm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790069013; x=1821605013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gf1bdc0pewGYTFcj2IvO9qBuaOHZ36IbSkeXFs3YBeI=;
  b=XKxbMDBmBDUoEJjpoLgEJ+M3oYDgIKWT9TTHlyXEgbz0Ajd+IFj0E+nr
   it9VSHbAyibDUjr7A4mFb90S7l9bu6WsCzxIym+E28Wdn5a8bbEJ6XHhK
   AzY8lFJispDR1tuhDkAbeH0EEF0KrDSj/dT0fupImHjeCJuC1LoWectdn
   RXpVo83291/gjQq9K85qvSgiFMJRJduxa3lzsod/NDXZ4Bw832d+c/+Ws
   bRrhVkUIodU20VwHTBDoHA8lfiD+dB6amcfrS1J15OikF5fEVQ5Z4MQ7S
   ovU3akcvQ3+zc6lTXbiCKdDNQtvEjnQZsRYXuGYjc8xqhzCrA2oZZwzoS
   g==;
X-CSE-ConnectionGUID: XIS4/MpOSwyALOHptFhSzA==
X-CSE-MsgGUID: wIoH40lSSnuZr+E22TSi3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89576752"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="89576752"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:23:33 -0700
X-CSE-ConnectionGUID: JJOfitq3Rh+/vPz+tgL5IQ==
X-CSE-MsgGUID: lcrUadLyRu+wGFVNKwWtAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="277837554"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:23:32 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 5/7] ASoC: Intel: sof-function-topology-lib: add I2S support for sof_sdw_get_tplg_files
Date: Tue, 22 Sep 2026 17:23:14 +0800
Message-ID: <20260922092316.2296039-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
References: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Intel SOF SDW machine drive also supports I2S interface. Add related
supports for the sof_sdw_get_tplg_files() callback.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 .../intel/common/sof-function-topology-lib.c  | 62 ++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
index e1049bb85a13..eddccbebb5f4 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.c
+++ b/sound/soc/intel/common/sof-function-topology-lib.c
@@ -19,6 +19,10 @@ enum tplg_device_id {
 	TPLG_DEVICE_SDCA_MIC,
 	TPLG_DEVICE_INTEL_PCH_DMIC,
 	TPLG_DEVICE_HDMI,
+	TPLG_DEVICE_SSP_JACK,
+	TPLG_DEVICE_SSP_AMP,
+	TPLG_DEVICE_SSP_BT,
+	TPLG_DEVICE_SSP_HDMI_IN,
 	TPLG_DEVICE_LOOPBACK_VIRTUAL,
 	TPLG_DEVICE_MAX
 };
@@ -70,11 +74,15 @@ static char *get_tplg_filename(struct device *dev, const char *prefix,
 
 	/*
 	 * The tplg file naming rule is sof-<platform>-<function>-id<BE id number>.tplg
-	 * where <platform> is only required for the devices that need NHLT blob like DMIC
+	 * where <platform> is required for functions that depend on NHLT blobs (e.g. DMIC/SSP)
 	 * as the nhlt blob is platform dependent.
 	 */
 	switch (tplg_dev) {
 	case TPLG_DEVICE_INTEL_PCH_DMIC:
+	case TPLG_DEVICE_SSP_JACK:
+	case TPLG_DEVICE_SSP_AMP:
+	case TPLG_DEVICE_SSP_BT:
+	case TPLG_DEVICE_SSP_HDMI_IN:
 		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-%s-id%d.tplg",
 					  prefix, platform, tplg_dev_name, dai_link_id);
 		break;
@@ -108,6 +116,53 @@ static int get_dmic_tplg_dev(struct device *dev, int dmic_num,
 	return 0;
 }
 
+static int get_ssp_tplg_dev(struct device *dev, struct snd_soc_dai_link *dai_link,
+			    u16 *hdmi_in_mask, int *tplg_dev, char **tplg_dev_name)
+{
+	unsigned int ssp_port;
+
+	if (sscanf(dai_link->name, "SSP%d", &ssp_port) != 1) {
+		dev_err(dev, "Can't get SSP port from dai_link->name %s\n", dai_link->name);
+		return -EINVAL;
+	}
+	if (strstr(dai_link->name, "Codec")) {
+		/*
+		 * Assume DAI link 0 is jack which is true in all existing
+		 * machine drivers
+		 */
+		if (dai_link->id == 0) {
+			*tplg_dev = TPLG_DEVICE_SSP_JACK;
+			*tplg_dev_name = devm_kasprintf(dev, GFP_KERNEL,
+							"ssp%d-jack", ssp_port);
+		} else {
+			*tplg_dev = TPLG_DEVICE_SSP_AMP;
+			*tplg_dev_name = devm_kasprintf(dev, GFP_KERNEL,
+							"ssp%d-amp", ssp_port);
+		}
+	} else if (strstr(dai_link->name, "BT")) {
+		*tplg_dev = TPLG_DEVICE_SSP_BT;
+		*tplg_dev_name = devm_kasprintf(dev, GFP_KERNEL,
+						"ssp%d-bt", ssp_port);
+	} else if (strstr(dai_link->name, "HDMI")) {
+		*hdmi_in_mask |= BIT(ssp_port);
+		/* The number of HDMI in dai link is always 2 right now */
+		if (hweight16(*hdmi_in_mask) != 2)
+			return -EINVAL;
+
+		*tplg_dev = TPLG_DEVICE_SSP_HDMI_IN;
+		*tplg_dev_name = devm_kasprintf(dev, GFP_KERNEL,
+						"ssp%x-hdmiin", *hdmi_in_mask);
+	} else {
+		dev_warn(dev,
+			 "unsupported SSP link %s\n", dai_link->name);
+		return -EINVAL;
+	}
+	if (!*tplg_dev_name)
+		return -ENOMEM;
+
+	return 0;
+}
+
 int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_mach *mach,
 			   const char *prefix, const char ***tplg_files, bool best_effort)
 {
@@ -120,6 +175,7 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 	struct snd_soc_dai_link *dai_link;
 	char platform[SOF_INTEL_PLATFORM_NAME_MAX];
 	unsigned long tplg_mask = 0;
+	u16 hdmi_in_mask = 0;
 	int tplg_num = 0;
 	char *tplg_file;
 	int tplg_dev;
@@ -153,6 +209,10 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 		} else if (strstr(dai_link->name, "iDisp")) {
 			tplg_dev = TPLG_DEVICE_HDMI;
 			tplg_dev_name = "hdmi-pcm5";
+		} else if (strstr(dai_link->name, "SSP")) {
+			if (get_ssp_tplg_dev(card->dev, dai_link, &hdmi_in_mask,
+					     &tplg_dev, &tplg_dev_name) < 0)
+				continue;
 		} else if (strstr(dai_link->name, "Loopback_Virtual")) {
 			tplg_dev = TPLG_DEVICE_LOOPBACK_VIRTUAL;
 			/*
-- 
2.43.0

