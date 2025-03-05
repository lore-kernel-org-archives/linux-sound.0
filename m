Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8FD24500E
	for <linux-sound@vger.kernel.org>; Wed,  5 Mar 2025 13:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741182923; cv=none; b=ZwouYZp9t4wYhcvcDDrL8hyTA3fjAjKkkRzc4PgpfYAVpmzB61ucqDlZcRr7ZC+DAo4sd5PmTva47bd9qkevdpLk1Ue1Er3NJ4Q9IxaeEPLNnMYtXhN16XQPHt7/QkAF2TnJUpKDt8GAzWPXGHevkwZ5GUp3FYI2cTeKSVoQQtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741182923; c=relaxed/simple;
	bh=jRLSx7zH2NESTbmMhmpHJ5WeKcjge8krXmz/XW8FMPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j9fkPQBbOp/D4xyCqNVCt/L+cSm97K4lJDjMDFUldkHwds7bAocZd5dycGM8P7CSkqrYbDBXxOOQzFtQVIVGQzJYsTiwFZ4/TUdla99NsG4VTEobr5QdHfQieFf4PjU9ltMTZlVpmLUuPruEt4cU1IHfx6Tt/yFNb9GnWRwaJAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mX6UuobU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mX6UuobU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741182921; x=1772718921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jRLSx7zH2NESTbmMhmpHJ5WeKcjge8krXmz/XW8FMPQ=;
  b=mX6UuobUoaOwX3rhxc1EeKslA0GRTSSHJt/IySokOwMIlgW9rCyD85Vs
   2tpnRqnkhk5FcG83SkmoU6mLqxxtZ3xphGv3xQX11Jx69RojHiUlS/t7+
   YTKvyZnqrkDqiI6v2+dVqvvD4MLSqo50i50+++8vGPA03UOoHgmZywxgO
   +kNJb0eYmvisGbeJGkqJELoJYCrcY6lCeIH6y1Tm8a1rRl4BlWYtA1RI4
   iGa8sN//1BO+z2QszRmRafHrVuuyIYmG/fgiW30CP5eZ2jGMmyH13Im5C
   LdlHhVH1o4ZMwcTXRzCeQZcHfUWqBCEZrNUvL2TcXUG5+x/NMou7THENt
   Q==;
X-CSE-ConnectionGUID: AZohpdjvSMyRr9TPD1zQTQ==
X-CSE-MsgGUID: IqHlU5nBQR62Touh06qv5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59558090"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="59558090"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:21 -0800
X-CSE-ConnectionGUID: 2HG6dQ7LQiK1dU2NLjujEg==
X-CSE-MsgGUID: 2U7ayUNCTZCE0QyvjL8FvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; 
   d="scan'208";a="118847153"
Received: from bvivekan-mobl1.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.175.91])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 05:55:18 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 5/9] ASoC: Intel: add multi-function SDW mockup codec match
Date: Wed,  5 Mar 2025 21:54:39 +0800
Message-ID: <20250305135443.201884-6-yung-chuan.liao@linux.intel.com>
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

SoundWire multi function codecs are common used in recent platforms.
Add a multi function mockup codec to test without real codec.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../common/soc-acpi-intel-sdw-mockup-match.c  | 42 +++++++++++++++++++
 .../common/soc-acpi-intel-sdw-mockup-match.h  |  1 +
 2 files changed, 43 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.c b/sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.c
index a3d33997736a..d122ce69fa4f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.c
@@ -31,6 +31,30 @@ static const struct snd_soc_acpi_endpoint sdw_mockup_r_endpoint = {
 	.group_id = 1,
 };
 
+static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
+	/* Jack Endpoint */
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	/* Amp Endpoint, work as spk_l_endpoint */
+	{
+		.num = 1,
+		.aggregated = 1,
+		.group_position = 0,
+		.group_id = 1,
+	},
+	/* DMIC Endpoint */
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_adr_device sdw_mockup_headset_0_adr[] = {
 	{
 		.adr = 0x0000000105AA5500ull,
@@ -103,6 +127,15 @@ static const struct snd_soc_acpi_adr_device sdw_mockup_amp_2_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device sdw_mockup_multi_function_adr[] = {
+	{
+		.adr = 0x0000000105AAAA01ull,
+		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints),
+		.endpoints = jack_amp_g1_dmic_endpoints,
+		.name_prefix = "sdw_mockup_mmulti-function"
+	}
+};
+
 const struct snd_soc_acpi_link_adr sdw_mockup_headset_1amp_mic[] = {
 	{
 		.mask = BIT(0),
@@ -164,3 +197,12 @@ const struct snd_soc_acpi_link_adr sdw_mockup_mic_headset_1amp[] = {
 	},
 	{}
 };
+
+const struct snd_soc_acpi_link_adr sdw_mockup_multi_func[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(sdw_mockup_multi_function_adr),
+		.adr_d = sdw_mockup_multi_function_adr,
+	},
+	{}
+};
diff --git a/sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.h b/sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.h
index c99eecd19e03..f7ed5beaca96 100644
--- a/sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.h
+++ b/sound/soc/intel/common/soc-acpi-intel-sdw-mockup-match.h
@@ -13,5 +13,6 @@
 extern const struct snd_soc_acpi_link_adr sdw_mockup_headset_1amp_mic[];
 extern const struct snd_soc_acpi_link_adr sdw_mockup_headset_2amps_mic[];
 extern const struct snd_soc_acpi_link_adr sdw_mockup_mic_headset_1amp[];
+extern const struct snd_soc_acpi_link_adr sdw_mockup_multi_func[];
 
 #endif
-- 
2.43.0

