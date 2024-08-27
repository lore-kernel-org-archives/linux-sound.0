Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898DC1BC076
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724761977; cv=none; b=rl6w1yefBhQMc0NoverwhtrIStMs4Jv4lVwWWg2FGE5c+EpBVWCgHBXpPVMm8NhFXsc8drJ9th4dZqURfF+llvIs9Xj/dfnVrA4OL1hvS2bI0DTTWfNPmh2SCdjYvyI1C5LPZUmZsQI+2cLv9Z0uog6Kz9zbzoIHC1Rgl9/r2ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724761977; c=relaxed/simple;
	bh=Mh88cm8V9fupie2apx+3RJbcBNZQHonK0QsbemxPlXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=reiRAV2nMi2CkN9lRIAVlvsf+QbFfyZGi9bZLl4qaXonF+V12GEfgso/uvI6tQWrB3rXNsyQOrUpVkXSaEIeYLKUPlhLgVwLvtwmaOtB6YhWXjRkESN1JjFYgxLNrdl20fVoG+jhjz2fUPmbCI1Ct2vOPctZ2R49DlwTRkBExOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wgzwhg3D; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wgzwhg3D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724761975; x=1756297975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mh88cm8V9fupie2apx+3RJbcBNZQHonK0QsbemxPlXU=;
  b=Wgzwhg3DQDI3C9bOPp+XE9Ot/WXwpcBc3iIZP54PjI33BwwN0dwzeZ4Y
   zEUOzQ9pLBfDgurpU7cE3BFSnab4cw1VFNDv87+y8rc4e0U80pQ6mG4NR
   Y5cZzf9sZZCpTZ13bc54SQGAiBERIfXP+XiAiZ4RQk6vJ3/D0TQQPDc4a
   aLTc4qWvXmEKpsyQtGf27ciEBCjfORoHo7mzknLoaxrVD3USPivzy+Cl0
   Hq5DCPZLbZGsBM+D9F+06mZfMIUyhO7vXfLKYxmWw4YyMTbL/AqZ19H7r
   Rrec7RS8GiVRCzywi6o+ERZQjuGYwZGiI6P4nkFfH1aq+fSbpx1kr+3iL
   Q==;
X-CSE-ConnectionGUID: quV0cwuwRcSLI58pM8KXNA==
X-CSE-MsgGUID: 7YtFlxEnQ1mbA9L5BXHE4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="13235516"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="13235516"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:55 -0700
X-CSE-ConnectionGUID: LAa1rJxrTH6ztjZ63cK7Ag==
X-CSE-MsgGUID: +gpkA7SNQ6Sclrlf7KapnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; 
   d="scan'208";a="62676802"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:32:52 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 10/17] ASoC: Intel: soc-acpi: Add entry for sof_es8336 in ARL match table.
Date: Tue, 27 Aug 2024 20:32:08 +0800
Message-ID: <20240827123215.258859-11-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
References: <20240827123215.258859-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Adding ES83x6 codec support for ARL platforms and entry in match table.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-arl-match.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index cc87c34e5a08..304f974dc960 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -95,7 +95,20 @@ static const struct snd_soc_acpi_link_adr arl_sdca_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_codecs arl_essx_83x6 = {
+	.num_codecs = 3,
+	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_machines[] = {
+	{
+		.comp_ids = &arl_essx_83x6,
+		.drv_name = "sof-essx8336",
+		.sof_tplg_filename = "sof-arl-es8336", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
+			SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
+			SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_machines);
-- 
2.43.0

