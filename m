Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296D6322E
	for <linux-sound@vger.kernel.org>; Tue, 27 Aug 2024 01:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724723048; cv=none; b=IwxP3wG9HBDOjNVLDH44niPz7yuMAxX/F62ccDDHHdG+WFDAPLPGFqR2DMb22tHaWBF+kO3VG6yAnk884TjNFyRXYXao6/2QzvsA+UE5Wf/eZqFHVsXejP7zoFlTPo3etgUU2iylUyDOKbh5pYICSe+0VkTS5C+Aw8HL+2aqf00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724723048; c=relaxed/simple;
	bh=Mh88cm8V9fupie2apx+3RJbcBNZQHonK0QsbemxPlXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aNMJ4FQzKPqnXFFjwTslKInvBlj/h+F9K14nn2nfyMPTAV1k19o0GrnBCmURG1bi2rQk6oyyRKa2HpnjYtWoCrC4YkcOLcMUPJ3v6LVXUhWAnTbyqhO8PFf6VprY8vuNvrHvDb2cNB2q1i/Hrys6qreoggWxejDVi7tZQa3yAo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZS7vFaGi; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZS7vFaGi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724723047; x=1756259047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Mh88cm8V9fupie2apx+3RJbcBNZQHonK0QsbemxPlXU=;
  b=ZS7vFaGiq54hQpUy/DOHB2vkG5TvN+3fQ2gz76jJimLwEC/GcymyFHJy
   m4wsPyZnHtYiJm8iUZBnaH0sQxWdoaTpJw2XJpnGkjGdmCJ0ariL9/c2B
   M6W82hRbK7gxJiUwjCr+f28wAzVer87wVH7CfsqSqwRzQJvoEkzDWtdCM
   K+xuzfY3PUNuCZOCspQ3SHWHQVrTO2TZqLIZqLoqs8X9jLpgd1Se2/m/0
   ryo1t891BJbF2AxOFzy275UXgY0vRJH+owUEQj81HADRejYJnNX8lQBn8
   HT0C6Apz8SAh2oA5cfKw8j6PLMMSYkOJOpS50MagMAAAM0mVmOOyQ/gSs
   A==;
X-CSE-ConnectionGUID: Tf7HGWogRUWSja189Bzo1g==
X-CSE-MsgGUID: 4TpqFLWWSiyi5W/iQyjDwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22984936"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="22984936"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:07 -0700
X-CSE-ConnectionGUID: OAJtvnHNRzO0kJCy/DCzsA==
X-CSE-MsgGUID: ADZuQyPnTaSg2taZL9O0Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="63427926"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.39])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 18:44:04 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 09/16] ASoC: Intel: soc-acpi: Add entry for sof_es8336 in ARL match table.
Date: Tue, 27 Aug 2024 09:43:21 +0800
Message-ID: <20240827014329.6542-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
References: <20240827014329.6542-1-yung-chuan.liao@linux.intel.com>
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

