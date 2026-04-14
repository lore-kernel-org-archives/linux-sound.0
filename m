Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86CE3E639F
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776170695; cv=none; b=H37ttaglqCt7GVMAThYhqMciELlH1/wc7d8pI3J9mERSKmbSc6Z+RF6E38paIWQedbE9IShf8PLF7r01YnHJrHDNOwD7hVcTT3FccOGqSkojNrbBtOwX4JUAp7QI/9QYly3+63dWhVLwanPNqgDOxBnlEbCpOvEhdeilLULznRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776170695; c=relaxed/simple;
	bh=qJfJt9PAkRWh5bdivfcm4foBMsqtZYKawbpKtncgF54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gg8DBQIJAUmm9S0i3LeXA0JujvTU+LwWrD6TXS34XrMxI4iz7uis6O3jkgdwAAGH97nSBybanaEkKc2biTXaWjruWiJ5D1ZU+X/TTMovwLefOiGVAminBD12QXKP/bfG3QxpS9g5PDCJFPVFLsPwXehnqON+aRCsAGq269Lt0OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ei7/WXJ+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ei7/WXJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776170694; x=1807706694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qJfJt9PAkRWh5bdivfcm4foBMsqtZYKawbpKtncgF54=;
  b=Ei7/WXJ+K+4kgcBp7rSteyy/0s7F9XYyiPCaV3mSuPxUVEi7nUCR7qYB
   tabQHXQlYtnAxTm+1ehzQu7daJfKdOT38Yj/en8Ej3sBinvRh1vNqOShy
   4Opc6bEx4hEfxgG2RDNICsGXhix2oofWD1+aF5KgteMXw/85G7kSSjWBG
   stELu8IJVt1LXdmLtOiWnoGcMH1GUFGiNZbv+IJY9U7HQsjaLRKQnr3Xv
   rbm5kM32ubd/pyYxQ088D0G2v+MPsM/Yr9JBOzHyEJ1S0BjmTlBLkFesX
   g9M2EaCQl8H/nCltJgqjp5uw4F3WdN5C3rDCsDlGGoINOhRdIxjHthHy6
   g==;
X-CSE-ConnectionGUID: 0ijfXbjmQnSSrp/ky2bCeQ==
X-CSE-MsgGUID: 2xi6AOSORlC7FvMzJtdaVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77002733"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77002733"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:44:54 -0700
X-CSE-ConnectionGUID: LEzMrlFxTa68cqhB8LiLKw==
X-CSE-MsgGUID: tP7MNwJoTb2M4aCzUhD4yQ==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:44:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/2] ASoC: sof-function-topology-lib: add virtual loop dai support
Date: Tue, 14 Apr 2026 20:44:42 +0800
Message-ID: <20260414124443.3270016-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414124443.3270016-1-yung-chuan.liao@linux.intel.com>
References: <20260414124443.3270016-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The virtual loop dai link is created by the machine driver and no
topology is needed for the dai link. Handle it to avoid the dai_link
is not supported error.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/common/sof-function-topology-lib.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
index 0daa7d83808b..2f2c902ef90c 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.c
+++ b/sound/soc/intel/common/sof-function-topology-lib.c
@@ -19,6 +19,7 @@ enum tplg_device_id {
 	TPLG_DEVICE_SDCA_MIC,
 	TPLG_DEVICE_INTEL_PCH_DMIC,
 	TPLG_DEVICE_HDMI,
+	TPLG_DEVICE_LOOPBACK_VIRTUAL,
 	TPLG_DEVICE_MAX
 };
 
@@ -81,7 +82,15 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 		} else if (strstr(dai_link->name, "iDisp")) {
 			tplg_dev = TPLG_DEVICE_HDMI;
 			tplg_dev_name = "hdmi-pcm5";
-
+		} else if (strstr(dai_link->name, "Loopback_Virtual")) {
+			tplg_dev = TPLG_DEVICE_LOOPBACK_VIRTUAL;
+			/*
+			 * Mark the LOOPBACK_VIRTUAL device but no need to create the
+			 * LOOPBACK_VIRTUAL topology. Just to avoid the dai_link is not supported
+			 * error.
+			 */
+			tplg_mask |= BIT(tplg_dev);
+			continue;
 		} else {
 			/* The dai link is not supported by separated tplg yet */
 			dev_dbg(card->dev,
-- 
2.43.0

