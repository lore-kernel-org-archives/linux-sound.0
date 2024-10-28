Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D3E524C
	for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 07:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730100405; cv=none; b=XzOvi7dnc5yKQ9/BAMC26aPfaIxxklZcvBn2boI1CLhq1RzM+V97j4jNjTq35fsWNNslFBae9iAAKrfjW8lPTY5EQedkOFCuH2CajKNWPe0zqA32pWr1zlrRmVUR/qhXZrZR7uk7k8zK77j4mvbQBOnQt3Mn8gEKOCj/FxdzGmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730100405; c=relaxed/simple;
	bh=yCnW0kKk3ZB8E5q68pO9C1sOicID16a1zWhpKzNYj+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nM9Gwsh1eGbdrPKIuR3/uKzerwdyBXt9RZ9XdCZLrbOC+o1J/yN2KIYY1D+AazDTZ7Ol2l0Osggj2lLOJjkiV6xGa2yhpS3oyS1yDyc6IsOiUzuiDBG8pRxWShNGJKcZLYMMNXxpOoZCLP+p8e50j2zKh/j++HvnXo5S/qUBsOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kz0vrWrl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kz0vrWrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730100404; x=1761636404;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yCnW0kKk3ZB8E5q68pO9C1sOicID16a1zWhpKzNYj+U=;
  b=kz0vrWrl/Hdk8WQt2qSNtx1VwB5CscQRy97mczKvlsOiJ4AhP8PnCyjf
   OjGOxx9KPcDXXmRR5JtIXCIoFZE391XXkNX1XuLp8Jd1EhSksFxJfQsk2
   gv6l823lMdLG95/lRtNYgJl2XwL3WPNp6rNqT44ZSmY6QET1K5XdC7oLo
   hC5LEvGmUWptkUrk3tbXrNxur91QREsWLQIae7HUZVKms+2vQk8BocAss
   7JBTCOk/nzgCJNe5Uo6zJ10yDNpAV3TlRXZl42h9y664fpmcS9v4SglLO
   EmUw0aAP2ZSFVGViOs/NKKs+/vDWQK6v13RahAVPvfNsQbR2tyirgwvmg
   A==;
X-CSE-ConnectionGUID: Lpel3xjgQOymkZr55lbZlA==
X-CSE-MsgGUID: 380N09VQRcGdl1xmHE85eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47145536"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47145536"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 00:26:44 -0700
X-CSE-ConnectionGUID: DlbDxSbvRjWZwjggBcJrJQ==
X-CSE-MsgGUID: Y706sTVrSvKCa8xMdqcUFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="81975590"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.222.159])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 00:26:43 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 3/3] ASoC: Intel: soc-acpi-intel-arl-match: Add rt722 and rt1320 support
Date: Mon, 28 Oct 2024 15:26:31 +0800
Message-ID: <20241028072631.15536-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028072631.15536-1-yung-chuan.liao@linux.intel.com>
References: <20241028072631.15536-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

This patch adds support for the rt722 multi-function codec and the
rt1320 amplifier in the ARL board configuration.

Link 0: RT722 codec with three endpoints: Headset, Speaker, and DMIC.
Link 2: RT1320 amplifier.

Note:
The Speaker endpoint on the RT722 codec is not used.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-arl-match.c   | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 072b8486d072..24d850df77ca 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -44,6 +44,31 @@ static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
 	.group_id = 1,
 };
 
+/*
+ * RT722 is a multi-function codec, three endpoints are created for
+ * its headset, amp and dmic functions.
+ */
+static const struct snd_soc_acpi_endpoint rt722_endpoints[] = {
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_adr_device cs35l56_2_lr_adr[] = {
 	{
 		.adr = 0x00023001FA355601ull,
@@ -185,6 +210,24 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
+	{
+		.adr = 0x000030025D072201ull,
+		.num_endpoints = ARRAY_SIZE(rt722_endpoints),
+		.endpoints = rt722_endpoints,
+		.name_prefix = "rt722"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1320_2_single_adr[] = {
+	{
+		.adr = 0x000230025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1320-1"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr arl_cs42l43_l0[] = {
 	{
 		.mask = BIT(0),
@@ -287,6 +330,20 @@ static const struct snd_soc_acpi_link_adr arl_sdca_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr arl_rt722_l0_rt1320_l2[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt722_0_single_adr),
+		.adr_d = rt722_0_single_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1320_2_single_adr),
+		.adr_d = rt1320_2_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_codecs arl_essx_83x6 = {
 	.num_codecs = 3,
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
@@ -385,6 +442,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-arl-rt711-l0.tplg",
 	},
+	{
+		.link_mask = BIT(0) | BIT(2),
+		.links = arl_rt722_l0_rt1320_l2,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-rt722-l0_rt1320-l2.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_sdw_machines);
-- 
2.43.0

