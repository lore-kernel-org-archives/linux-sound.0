Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0F624633D
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 13:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182905; cv=none; b=ihlUYRbEwUNzzuCAiOHi9JW3asaTqad9dP4p+PWUVIOG4MRN1Dj7qOfVDtSlO5TMr8f7ygMxQFEExkxhxIAxo0EKy8HFb967oJM66JcfdYAcj7eKkWIRuDM3yLo3HkiqIDxbf+fTKWSvuEL+edTUyyw2cEqqhN5+kk8fvoeiNdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182905; c=relaxed/simple;
	bh=xKZL2JbUX25WSqXUL157VYzfcc9xprOsRSTmXHqCVZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sWUolQtQ0KDvXPcbRkKrBZSF5uy8wxGQ62G9iqHlBL4on/PzTlP5reMmmi0uzxqaLTBnpJ2YpBPMAdtSIunMiPrvEzpEG2kb2WMZmvr0ct0gRi1ieaAEQEDBLDbS/nNMw48nSEHWcsyB9O1q+ZW74cgoeeVuzlBjFVARikAjG0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FgDOfEtt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FgDOfEtt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741182904; x=1772718904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xKZL2JbUX25WSqXUL157VYzfcc9xprOsRSTmXHqCVZc=;
  b=FgDOfEttnuwavY08pU3envsmYOW/fBo5ByB+Ly7FCxiMgqoRHgLRxoze
   cR9TQyKi46s9qaTV7tYQvVrjx4GcB/rrKZ1i7yg9BaDI96Qj3gAItvFkK
   SZp95DZq6mMNYyZEDffGPfQDPTTLF5RoghVJrWLYt9WcHPfPDbcifH147
   MO1uS00Dg+f5lUTPREieB9BKP0EtOZlTVD8GLUwxmwpVm4VIxjTspoLuG
   /qRI+F4EjhYGr7rdrY+tfCm4Tpg4zLQsvWIpJosZg7cKbZtCBskLN+Klo
   Tj3qMvo+QKdL1vljHSa4/bAugeQH6Trkk5C4fBorGVb84kVHGEMirkaTY
   Q==;
X-CSE-ConnectionGUID: iarHYRZTSNi/cPMb5hppBA==
X-CSE-MsgGUID: c66RLcaOQq6s1EAo9VRlAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59558062"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="59558062"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:04 -0800
X-CSE-ConnectionGUID: IuildJROSzae7eQUQ9j63w==
X-CSE-MsgGUID: vxeWAX9WTziNCWsxsv4FHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118847027"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.175.91])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:00 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/9] ASoC: Intel: adl: add 2xrt1316 audio configuration
Date: Wed,  5 Mar 2025 21:54:35 +0800
Message-ID: <20250305135443.201884-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
References: <20250305135443.201884-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

That is a speaker only configuration and 2 rt1316 are on link 0 and 2.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index bb1324fb588e..a68efbe98948 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -214,6 +214,15 @@ static const struct snd_soc_acpi_adr_device rt1316_1_group2_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1316_2_group2_adr[] = {
+	{
+		.adr = 0x000232025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1316-2"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1316_1_single_adr[] = {
 	{
 		.adr = 0x000130025D131601ull,
@@ -547,6 +556,20 @@ static const struct snd_soc_acpi_link_adr adl_chromebook_base[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr adl_sdw_rt1316_link02[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt1316_0_group2_adr),
+		.adr_d = rt1316_0_group2_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1316_2_group2_adr),
+		.adr_d = rt1316_2_group2_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_codecs adl_max98357a_amp = {
 	.num_codecs = 1,
 	.codecs = {"MX98357A"}
@@ -749,6 +772,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-adl-sdw-max98373-rt5682.tplg",
 	},
+	{
+		.link_mask = BIT(0) | BIT(2),
+		.links = adl_sdw_rt1316_link02,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-adl-rt1316-l02.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_sdw_machines);
-- 
2.43.0

