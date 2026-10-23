Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792753136;
	b=nVBQFkmehA4kSFcmBbRPT1SAfbZMBc0DOn+Bm7M9vMN/EIY7kUZVoYoEBsBTDrlOmFQU
	 XNobZAt///nz7p5ZmiXuLWpx6EU0SKZLb6C7LRTU/6Hg1iEZlP5JX/3TIrwWtd+zZ+m6f
	 SDiRjrmPasPWSRq3EVOltfKUAamnAy0zqielxRhreGTyNvRYwAsR9eS5lO4ibfEghIYxn
	 Xa8/tE3AsuCLShq+oR1r1uKp9enQ75T1SE9SF8xsHkQcDJne10+L8H6IUcOzUew9N2+PO
	 zWayJzPNkgCWcJKKsZsDoFCL9Ej23K1uFCXkKnTxtcqL8HwCSJ2R91ONyG0WIq7aYNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792753136;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=kGYseArAuIqiaod/PdS9D8//l5pGHhvNfGgQW0KVItc=;
	b=2WTGUIEPXGBpBUIkXSVmKARcmJNBrhXkA2Xwio/K4eYg/cmCwfWcEIN0Ba9vy4nSqek+
	 LwLyB/qq1gg/yhX1gIxbcEYAO1jlOMzks1BsKnLrhRVXlbp4qwjRfTCIWFBqWzs60az7T
	 BsADmu2QlfLzbSDdqcf/4zItjPrEQXtI0pEFOLtU+sde7nYNNJnyQMqEKTlSv5uFCxdTG
	 eRPqo16On2A5nAC4hYDNmGYbpjSkNWWIWrvK3IA2pqmkNh1RPHIeSSHLfeZtlOhGfvzTA
	 sU1SlnbU2mnB9ueKY1Fvn7P6aGm1hzykmACxNir2xXFCjOhumDatElg2YlrDQ5xGCIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZK+wog4O;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F4D606A31D
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F4D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZK+wog4O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792753135; x=1824289135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KI5c6cL0kfc7TRzQOfmnvqt7e2ioOL1yJuoYgqxQt78=;
  b=ZK+wog4O4AAvkPRAhQG7NesyqJ3d/4dOxWd2aQ8lt3WvhZI92N8Cgil/
   an4pETmvDfOd92nyw1/5GFoWKsKJFmleDMY2hwJPTnPZin6BcgDbztgYA
   lpDNuCyl8fKshQI34We/9Fw4t2pgPDFgd0lvB8mvLhRZ32FjODmktnMKe
   eSrASkCn/LhSbjJ+XdvdeN+zY70l3LPhHC7XwT/jWcqPkmdzALGNjrIPN
   97ZdMAZLQvWewpQSXr6MuMDPCUg6hIJUGlGa2net79g64nnKLnm3hL54J
   fgOuxr7i5OT/25IHIvp5yCteibO+lBEeg41tjZp4H3afU6jfRCYJAdIgh
   w==;
X-CSE-ConnectionGUID: W2QFfzO9SZuWO0PyITHRAA==
X-CSE-MsgGUID: i4G3ncJcTt+xOTlmTM6T/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1605838"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1605838"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 03:58:55 -0700
X-CSE-ConnectionGUID: 1LdiB2HMR7KwhHDz/eTTVQ==
X-CSE-MsgGUID: 69IwVHsZTb2FUXz75A/3Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3681770"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 03:58:54 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH RESEND 1/2] ASoC: soc-acpi-intel-arl-match: add rt712 on link 0 config
Date: Fri, 23 Oct 2026 18:58:42 +0800
Message-ID: <20261023105843.2257167-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023105843.2257167-1-yung-chuan.liao@linux.intel.com>
References: <20261023105843.2257167-1-yung-chuan.liao@linux.intel.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add rt712 on link 0 configuration on ARL platform. Export all supported
endpoints and the endpoint will be skipped if it is not listed in the
SDCA DisCo table.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Tested-by: Patrick Daether <daether@pd-digital.de>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../soc/intel/common/soc-acpi-intel-arl-match.c  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 575889a4c69b..09bb7302ed25 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -482,6 +482,15 @@ static const struct snd_soc_acpi_link_adr arl_rt712_l0_rt1320_l3[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr arl_rt712_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt712_0_agg_adr),
+		.adr_d = rt712_0_agg_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_codecs arl_essx_83x6 = {
 	.num_codecs = 3,
 	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
@@ -646,6 +655,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-arl-cs42l43-l2-cs35l56-l3.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0),
+		.links = arl_rt712_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-dummy.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = BIT(0),
 		.links = arl_cs42l43_l0,
-- 
2.43.0

