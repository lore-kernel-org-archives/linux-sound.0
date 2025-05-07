Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AAE25CC41
	for <linux-sound@vger.kernel.org>; Wed,  7 May 2025 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620823; cv=none; b=M1HsPVn94oVyyxGXAVfCjRka+MTsb+CdTBGpjIsaD8Zz5IudQELO6NUzX/DGPjYxcKbXqYiWPaFjMDkfReZqcxheiLll2epSdyRoic4IEgbv8koH0P81NS+c7G+ezG/TL0bWtjbkrD+EBFh36ZxqLElqgOVeSi6CjiB5e6baLtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620823; c=relaxed/simple;
	bh=0BBXtgG6+DYTpVO/d/U2FQs0TP3wmyb0D0ODwvdy6tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mt0+jCY5eEtNmJc9yREMaNP+uIZ0pXbGi0BwHwil9GcHnfqWYQ6pe+GDm+fLJApNlNMSowIjjm00mBsoIv+Gz28o35PgbRXsfGHtuQhcYhN+PQilqmBLvjHyi2+TZuHa17vz+E7HsV7A3oXdaecfFxf/25KI5ozb7X16IeOZ5LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZ4oD94/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZ4oD94/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746620822; x=1778156822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0BBXtgG6+DYTpVO/d/U2FQs0TP3wmyb0D0ODwvdy6tQ=;
  b=NZ4oD94/Y/UOmOKjOgH1Ky8SgPn7H9qZ49L0qf5iQCoZBlJEf4nQOF6P
   uVW1NvWUj+oQPd20/BoHVfw1k+bDH+aOp0SNPLehIkb2uFfhCpZcbAZpP
   Am43E6cyjqRQLHHBTkMXcxebryhFmnKAKrb+TYYjw70cyqAvcXyDpumaN
   Re5AwLoOXovfET8YjZr8Hj3SKDJyju4HHSSb5JMHlb8GrcNONZ7Tf2TnQ
   kUGfnTf285zREjkbItcjziidnxLsS6KcorQhppYFZg4vM09cj9p7i89d8
   6rQj7tL/NDO8THN+UJD7Vae1SnWKaOmloqdv5CIhIVyPBW4lWp51Z3W8R
   g==;
X-CSE-ConnectionGUID: XH0EtRs2Ta+rqwXk3SSItA==
X-CSE-MsgGUID: AUZoXYBoS+ebJlbwKJXqcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65757072"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="65757072"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:27:02 -0700
X-CSE-ConnectionGUID: KKXHYBPuREiqIZ+QXbCpiQ==
X-CSE-MsgGUID: dCNIIOD9QEylTobhwaLAVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="173131940"
Received: from hcaldwel-desk1.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.222.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:27:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v2 1/2] ASoC: Intel: soc-acpi-intel-lnl/ptl-match: Simplify variable name
Date: Wed,  7 May 2025 20:26:48 +0800
Message-ID: <20250507122649.153579-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507122649.153579-1-yung-chuan.liao@linux.intel.com>
References: <20250507122649.153579-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

The variable name contains duplications;thus, remove the redundant strings.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c |  6 +++---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index a2bee667facb..558dc4c91239 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -137,7 +137,7 @@ static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
 	},
 };
 
-static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints_endpoints[] = {
+static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
 	/* Jack Endpoint */
 	{
 		.num = 0,
@@ -350,8 +350,8 @@ static const struct snd_soc_acpi_adr_device rt1712_3_single_adr[] = {
 static const struct snd_soc_acpi_adr_device rt712_vb_2_group1_adr[] = {
 	{
 		.adr = 0x000230025D071201ull,
-		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints_endpoints),
-		.endpoints = jack_amp_g1_dmic_endpoints_endpoints,
+		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints),
+		.endpoints = jack_amp_g1_dmic_endpoints,
 		.name_prefix = "rt712"
 	}
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 0454de04da68..f9510480d188 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -138,7 +138,7 @@ static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
 	},
 };
 
-static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints_endpoints[] = {
+static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
 	/* Jack Endpoint */
 	{
 		.num = 0,
@@ -288,8 +288,8 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 static const struct snd_soc_acpi_adr_device rt712_vb_2_group1_adr[] = {
 	{
 		.adr = 0x000230025D071201ull,
-		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints_endpoints),
-		.endpoints = jack_amp_g1_dmic_endpoints_endpoints,
+		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints),
+		.endpoints = jack_amp_g1_dmic_endpoints,
 		.name_prefix = "rt712"
 	}
 };
@@ -297,8 +297,8 @@ static const struct snd_soc_acpi_adr_device rt712_vb_2_group1_adr[] = {
 static const struct snd_soc_acpi_adr_device rt712_vb_3_group1_adr[] = {
 	{
 		.adr = 0x000330025D071201ull,
-		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints_endpoints),
-		.endpoints = jack_amp_g1_dmic_endpoints_endpoints,
+		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints),
+		.endpoints = jack_amp_g1_dmic_endpoints,
 		.name_prefix = "rt712"
 	}
 };
-- 
2.43.0

