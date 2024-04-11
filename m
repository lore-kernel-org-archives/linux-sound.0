Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EA93D0C4
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 22:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712873061; cv=none; b=imRlBPBJPnDTiICQfsjDMSxfssrB938F75Y0UeiWscvUgfSE+a1XeZoWeUfvo+iN0SkZ91CwR4Sc6SSP454epyQKbXyUCvjVv5bgSTTRW41umd0l5WQSCVDOxBn1preS+n2XyLBa/xYR0hTlSesyqRwLneyDunb/v5whqJT3RBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712873061; c=relaxed/simple;
	bh=V80U71ZVk1BSbUWzsi/2PM4s6/P91O4qwdizAbM2i2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F9/N5T/ubzgDl82x96N3YpZVoNVQeJupiVKC4jdI2mMZHr2P+AbIkNlNt0k86B86AnlbAf/4eQ3gqZi9cTgcPDWQBZiJfrPyPBlsh/Afzx1sSvA+OIaQLGGRtYGUYqW6RgJqA8gXoXOkLeGcuEdG1tQm4ikv8qgW5vbqqlPf5ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVILE/ZE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVILE/ZE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873060; x=1744409060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V80U71ZVk1BSbUWzsi/2PM4s6/P91O4qwdizAbM2i2A=;
  b=GVILE/ZED5/m21SCWnFaT9wGy65gnJR1cYvoYhNSwOcCnFR8zN/DzWc7
   D+6+0tcjPwNMz2Z9s71Mrqv6noFtlR7P8X4s7W2TLJH9q9n6RZGK4956i
   wWEizXEg/aJNJune8GlZv95v2t87I2TzbsVS+RLYiQ2tP1aeWvKkgIhUv
   4U+xF7yUkBB0/WfrvJCz4nzil+qZvt7t3GC3Ga7z94jAT8oMQabvxxVAf
   +btF5McxNt3NQPF6gsI+jlxcFLHjgt5bFF/y4M0e72OHXleL1Q9JyWVoH
   CNPDUCN2lEBwpZiSmx9lUrkPiaAHrXWlcjWzrTbtCb2kJTiwua+Xp1v1G
   A==;
X-CSE-ConnectionGUID: TDrchq6hRt6Cx539ngli9Q==
X-CSE-MsgGUID: IqAfb2jsSS6ex6XAsTLvJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708383"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="19708383"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:20 -0700
X-CSE-ConnectionGUID: bIENvs6YTASXeV35ZC/E2w==
X-CSE-MsgGUID: QrMlRKCdSeWXMnRWhgs61Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21628764"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/12] ASoC: Intel: sof_rt5682: support ALC1011 on cml boards
Date: Thu, 11 Apr 2024 17:03:45 -0500
Message-Id: <20240411220347.131267-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

For cml boards, ALC1011 speaker amplifier is supported by machine
driver cml_rt1011_rt5682. Use same driver name for backward
compatibility with existing devices on market.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 326d23dd79de..735e07ea62bd 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -606,6 +606,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct sof_card_private *ctx;
+	char *card_name;
 	bool is_legacy_cpu = false;
 	int ret;
 
@@ -631,14 +632,27 @@ static int sof_audio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (ctx->codec_type == CODEC_RT5650) {
-		sof_audio_card_rt5682.name = devm_kstrdup(&pdev->dev, "rt5650",
-							  GFP_KERNEL);
+		card_name = devm_kstrdup(&pdev->dev, "rt5650", GFP_KERNEL);
+		if (!card_name)
+			return -ENOMEM;
+
+		sof_audio_card_rt5682.name = card_name;
 
 		/* create speaker dai link also */
 		if (ctx->amp_type == CODEC_NONE)
 			ctx->amp_type = CODEC_RT5650;
 	}
 
+	if (ctx->amp_type == CODEC_RT1011 && soc_intel_is_cml()) {
+		/* backward-compatible with existing cml devices */
+		card_name = devm_kstrdup(&pdev->dev, "cml_rt1011_rt5682",
+					 GFP_KERNEL);
+		if (!card_name)
+			return -ENOMEM;
+
+		sof_audio_card_rt5682.name = card_name;
+	}
+
 	if (is_legacy_cpu) {
 		ctx->rt5682.is_legacy_cpu = true;
 		ctx->dmic_be_num = 0;
-- 
2.40.1

