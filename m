Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30993AC2B
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 22:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712873056; cv=none; b=tOGly7owspU8R8eNUtRAjlSUSAraLr2Dc0Gi/FZycECqeVktEJHrUq0QPi95iVfPFgbPIqH7FZlImCF6F0QrgbO9iXU4RE0N4QtSiYVQAP41wW/xWC+uJAnMqVFikFlv/2+lsimZ3owMLmHWZYPox7/F+MoZ+zzFiIU19ht9uMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712873056; c=relaxed/simple;
	bh=QpmYI3nCN/RiyTRwE47bcfkwM06N232vNmHtjvJJQbU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hYuQWLk0P8PDhaxgsj4kH+U8QcL0eQP3lGTFV7ABdEaP78NvptyO8DttTOjG05+Ld7zl1gEY40zaNRHYhcsEUi4fsZlbS1I/XO2UVPtnIGC0rhFVtgmHeQS++Y0HOWGHVljX5vZFiEGEo2LVCvm0uy5eQVZF/pWSqWNm/Htr0wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKX/IKhR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKX/IKhR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873055; x=1744409055;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QpmYI3nCN/RiyTRwE47bcfkwM06N232vNmHtjvJJQbU=;
  b=iKX/IKhRejeprlX41WSOgcyUFySUPVTtSq4cYDsZ+XWZuEtOjMRQRFoi
   BIvVhgVTXwMSSy17IdBgRPrS5gmTX73HmvlTvNKlQE2C79vd7CrBsfvpV
   bhmJehHow5GCoRTLy1DpWS++Qa40WkZVltTnj4xj8Pytp+09xZWQioII7
   wsF1BupKM8aZHNF2zBxIZIcsI8VMORlMM1i+9sIBMBvci5L3m3RgBAQyP
   5BUHBiY18J3yn5HG8ZRsBDl+zkhzP70BC6vquB1f7IPuIn2LRkjeWGOeE
   0MgXuiMPZf8h4JtHs0zgg6Z5qwZXEWcObxj/8gtCVDDiroPyIEdxM7f3i
   g==;
X-CSE-ConnectionGUID: g5ezX6RHRxiuiHceQ8qGMw==
X-CSE-MsgGUID: YE0RKXPmTxOD6d4g5iGyuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708347"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="19708347"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:13 -0700
X-CSE-ConnectionGUID: j2dPpetiTZ2o5SQfKuEuug==
X-CSE-MsgGUID: 0shJCrDxQ+6W4/ovGEazMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21628727"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/12] ASoC: Intel: sof_sdw: add JD2 quirk for HP Omen 14
Date: Thu, 11 Apr 2024 17:03:38 -0500
Message-Id: <20240411220347.131267-4-pierre-louis.bossart@linux.intel.com>
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

The default JD1 does not seem to work, use JD2 instead.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 8a2cd19d8be6..f191dc72bc3d 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -498,6 +498,15 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_BT_OFFLOAD_SSP(1) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "OMEN Transcend Gaming Laptop"),
+		},
+		.driver_data = (void *)(RT711_JD2),
+	},
+
 	/* LunarLake devices */
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.40.1

