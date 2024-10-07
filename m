Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D249B1292CE
	for <linux-sound@vger.kernel.org>; Mon,  7 Oct 2024 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728288030; cv=none; b=om7e2lakn7H+PsADm6nTlvcDtTpC0KZ8SBa1Hp/24oIwwfXrLUC7lXwTC5O8YfjoPP3ZRKPeLUodSZWjV5gtRgpiqOfm66875hXB+tKz2ndeXLlwuWoHm29tl6n2/ld38eyEhwNWWVdG3zMGSnmVsZAE/KSjqP78KInGVskmZQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728288030; c=relaxed/simple;
	bh=sjFerIkSmPoG9Jl8i/4JlAunP2Z/GvzSWn19G04KXS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V16ep7ZkA6z/mUKXVC8JvGo324cLZgpNBfa29VXtnHcejR2KovslbHdN+DkJittUVUsBgOLenko9Auy7nhDWZCAH/Z4RrN5DUn1cwU2uOyHesSyWTDlQDq7hz1UAJ8/PzZ3e7R++gB1+qTwwW+wIWflEK5QIJsRIOHEXQoW9Uys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aisM377L; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aisM377L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728288029; x=1759824029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sjFerIkSmPoG9Jl8i/4JlAunP2Z/GvzSWn19G04KXS4=;
  b=aisM377L2IVfcgteFkFANUkHNzqs0MnBmrMme2uIrzQBXylwtps7eMmP
   WYB69NcsWoQPGfyioj65zcL9IctiurM4oXv6196mzYP8kYTk7+1ppLBN5
   Gq/SxxoSaMRpB1c9gxm0jmtG9sIVWWPs/4g7912FoBKPZht1wczG+Dq1N
   /MyPY9PdogheHgae1IyDXiG82VXt0GEgjP/ss6VMhQeKcB3yi4MHQ0Oxk
   ORMfD1Ivu2CaiLoTTY/6WhYlGYQ+rzazpTVj6vMl2nev8MzerJKp8+n5U
   iKcdF5jt+8SNroL7agRXX7uo58JSCw6fMWclasdOr+INlWiDLahF4wVi5
   w==;
X-CSE-ConnectionGUID: qCayTec8Qhq9Fyw0Yy7JAQ==
X-CSE-MsgGUID: urHHJijxRtO51LVPRF2TGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="30309332"
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="30309332"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 01:00:25 -0700
X-CSE-ConnectionGUID: x0hdaiigRL+H79jTcHx16Q==
X-CSE-MsgGUID: WCC6Gn2PTk+YsbBEwWlgfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,183,1725346800"; 
   d="scan'208";a="80176677"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.70])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 01:00:20 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/3] ASoC: intel: sof_sdw: add RT722 SDCA card for PTL platform
Date: Mon,  7 Oct 2024 15:59:53 +0800
Message-ID: <20241007075955.12575-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241007075955.12575-1-yung-chuan.liao@linux.intel.com>
References: <20241007075955.12575-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dharageswari R <dharageswari.r@intel.com>

Enable on-board rt722 based sound card for PTL RVP.

Signed-off-by: Dharageswari R <dharageswari.r@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c              |  8 +++++++
 .../intel/common/soc-acpi-intel-ptl-match.c   | 24 +++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 35d707d3ae9c..0a87aa9347ef 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -598,6 +598,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
 	},
+	/* Pantherlake devices*/
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Intel_ptlrvp"),
+		},
+		.driver_data = (void *)(SOC_SDW_PCH_DMIC),
+	},
 	{}
 };
 
diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 61b16bc1ba8c..7107f0151030 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -78,6 +78,15 @@ static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt722_1_single_adr[] = {
+	{
+		.adr = 0x000130025d072201ull,
+		.num_endpoints = ARRAY_SIZE(rt722_endpoints),
+		.endpoints = rt722_endpoints,
+		.name_prefix = "rt722"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt722_3_single_adr[] = {
 	{
 		.adr = 0x000330025d072201ull,
@@ -96,6 +105,15 @@ static const struct snd_soc_acpi_link_adr ptl_rt722_only[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_rt722_l1[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt722_1_single_adr),
+		.adr_d = rt722_1_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_rt722_l3[] = {
 	{
 		.mask = BIT(3),
@@ -147,6 +165,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt722.tplg",
 	},
+	{
+		.link_mask = BIT(1),
+		.links = ptl_rt722_l1,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt722.tplg",
+	},
 	{
 		.link_mask = BIT(3),
 		.links = ptl_rt722_l3,
-- 
2.43.0

