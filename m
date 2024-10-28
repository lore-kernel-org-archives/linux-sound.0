Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE4918FDC6
	for <linux-sound@vger.kernel.org>; Mon, 28 Oct 2024 07:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730100404; cv=none; b=HdCDBk8XWZqOja0FJDmPyhXJa/6HP1h9nAKeYKtFCHaaVdnrZ93fCCfCIEabchhYY0lcWiaJCeveovd+WwIdZqc7EjOLCyZyJkjEbMjE2PJR3QKx0O7cQPbgzrcJmKSY+OU5fvk4bGP3fXACMtKfmEIZG3P33g8nDE6cs2DV584=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730100404; c=relaxed/simple;
	bh=TymxpPajPsQj2xkkQFK4tbiMDrDpujDJhIEskniPUeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQQN1Jm6C6MLuL3belMPO7/AyQSebC8ZJcW8TgsSvuQjzeSYPctk6wTkgVjueEkQaspSKcK3aByDIZtTjhGs2p3UTfNWjy2S3liVebPYDDuGAAnv2kfF9FvbliIamaR9qzyYe87IVUtq7Xm7LPI1Z012of5+vAuwBMMGtZwRmuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imwKOV+E; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imwKOV+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730100403; x=1761636403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TymxpPajPsQj2xkkQFK4tbiMDrDpujDJhIEskniPUeQ=;
  b=imwKOV+EIDSPJo32gU8b4WGnZQUaTKS8JpZqKIMdEpu8u2ryN/XMpRFg
   TDBw+Kkf93zsjeTKZMbmNWLrs52r3CkDZQBRmMvN5YZ0AaWQ9gvWXrGMr
   jRQsxPGPzRZP5c2qXmV293KuFaSVYWLrDMEuvFUbNbbYTpMVPritHqZ+A
   hSezrenurs6YYS+D9FPDDfmrD+wyAACvsz8cR4oIFCRdHe+Xwhe/T0YfP
   YqAgH2bthpqacEXCqspkZZ6/pSrqtxmMIvRM33cevPxWJwrfSpwivSmDq
   Jd6ugdKQhR9hPQ77822dcc6cHCGARBzannvDp8S23X72WsuRSBfz9ESOh
   A==;
X-CSE-ConnectionGUID: kHizhZ0MR2CFRNoFM/ielg==
X-CSE-MsgGUID: b8ndOAPGR1arS47W5VYdwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47145531"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47145531"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 00:26:43 -0700
X-CSE-ConnectionGUID: QX7qeCmpQMiF/B84gx6EgQ==
X-CSE-MsgGUID: 4m7H/94wR0alviiJlpUzyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="81975576"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.222.159])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 00:26:41 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/3] ASoC: intel: sof_sdw: add quirk for Dell SKU
Date: Mon, 28 Oct 2024 15:26:30 +0800
Message-ID: <20241028072631.15536-3-yung-chuan.liao@linux.intel.com>
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

This patch adds a quirk to include the codec amplifier
function for this Dell SKU.

Note: In this SKU '0CF0', the RT722 codec amplifier is
excluded, and an external amplifier is used instead.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index a6e391791bad..5614e706a0bb 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -639,6 +639,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CF0")
+		},
+		.driver_data = (void *)(SOC_SDW_CODEC_SPKR),
+	},
 	/* Pantherlake devices*/
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.43.0

