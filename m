Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8796325B0BE
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 01:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790903746; cv=none; b=k0PtTAII90W/e24dghQX0iCUh/WTw7cEvXnGV/DfY9R/rVDmcn2jssq+VRRfFhGoGJrEOkmceJ7SZgW7EViB3aeKUdmvx3nnWo+gGQHjibUMYf4P1apWq0GiUcxmuGlb04wVUAdqjzO2mMXHKaWjxskbimrMLbKF67q1sKpIHro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790903746; c=relaxed/simple;
	bh=KI5c6cL0kfc7TRzQOfmnvqt7e2ioOL1yJuoYgqxQt78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NFZOBlHWagcR+c3vWDvcVH6q4k3SYDvS5vk4LYA3paUO9ZvgOLEyPF+/sPYieYLlrYHQt/LdWngdPCR78YYgs5JfB5n19omUgfGK/4pseZrqpJPNOGFZ0jPVTPZ19+hk6GBAbpFKM9fWAaXoabk5YLJDgc1rWcM6CPhRF+m2Bu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2xf40us; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2xf40us"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790903745; x=1822439745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KI5c6cL0kfc7TRzQOfmnvqt7e2ioOL1yJuoYgqxQt78=;
  b=h2xf40usMOsB/hQIdswEN071htbSNyHuQpv75UfUn5OyM8XXH1GhdXYn
   KCoLFp+Cn9wLxrKxbydCquUgQSQ6z59CJTpHTXPuiC6igTUkjuIyfhfx4
   HL45qzQ/AtR9Qmv0rptK//cx0InaM4xxoGjQaCx9RJ5Jft8kCB2V7zaLe
   bFoOfGyiIaqzt3aagtrRxkGTq4cJ1NApl9s9lQOzH8PMgMbheBK2os2Gq
   tmCT0mKbWeLCS8p1jzATFmEXmWbi1CUZdNx69mBESXWJdb93X7Q5PAGOo
   fRTRaP2XLuuGLypy1mMfGApwMQFRlcyLFo55jL6kFURCZPbMCn9YHtKZM
   g==;
X-CSE-ConnectionGUID: +gP6x40PTeamxQ2V5zZpDA==
X-CSE-MsgGUID: uwtsquMPQ+ivjBh3L7RdTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90442081"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90442081"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 18:15:45 -0700
X-CSE-ConnectionGUID: TJ4MST73TSWCP28TBgNLjA==
X-CSE-MsgGUID: ge/McYyiSV6pHlLvaGuZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="279894206"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 18:15:43 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/2] ASoC: soc-acpi-intel-arl-match: add rt712 on link 0 config
Date: Fri,  2 Oct 2026 09:15:31 +0800
Message-ID: <20261002011532.3468261-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002011532.3468261-1-yung-chuan.liao@linux.intel.com>
References: <20261002011532.3468261-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
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

