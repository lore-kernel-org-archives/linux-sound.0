Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB2633BBAD
	for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 05:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776317795; cv=none; b=Gy3BuoQuBcxdaIjVqboFFNBp3r9df9/TlLLD7Fsalh/clrlRybS47qTCkzjt98ENl5dBhYU716Z5iYf7LUBfwYA4f49sRcoaEbOlx65caToBZZADposdnB4D7hMmnzJGsaEKOoKMPaSKDudRaQevJ4tuN60GbeQfB1Mz5AjSSUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776317795; c=relaxed/simple;
	bh=qJfJt9PAkRWh5bdivfcm4foBMsqtZYKawbpKtncgF54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OpyuG6G8Mwr9BX4IQGLXswM+NPXXS6L/vK0Il+bf5px1ksIjprJkywKoZ/tve6Jvp3CNyxzc8Yfh3femldiw4X3CllZhftYRu4N4Ht3QMBHw+ajanqnGFAJEYAHm/xFvtQZvvz1XyTMHxS9EzW7ofXhzYfp+L+h9aAmWRTsAmAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C56a1FvF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C56a1FvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776317794; x=1807853794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qJfJt9PAkRWh5bdivfcm4foBMsqtZYKawbpKtncgF54=;
  b=C56a1FvFfKJBEpns1JKWLSNWvn99jYNuTUZ7/r7sXpAmTncacDwZlyok
   IRYwfT63Lo7LjgBk/5Mx3fPIvmEtmGKrTHOb68CGnyjzxliUuyx1bPdeM
   CRYQEGBk2oT/7onAvcWL7zCiOOYHsdJLY7ZncDOGvCvD3mERZQe/LEHtd
   TX8MNpfCRWmza3YfJ6DxbjayACzq+M2uIvEPCayg3As7voqM4tEmn0vdv
   EadKG0qQ9xvcRbUI4SjhsZuZSSJ/thEQbg0Q+FVaHtr4WUGXkFFa7jZ78
   6DoLbXAHWNb6YNlY10oOVFp9vG3pvRCwvWqW6YahzsQrydRWtzHbsfWvK
   w==;
X-CSE-ConnectionGUID: wsdKPWu+RZuBuUCUfGW3Cw==
X-CSE-MsgGUID: 2gbI7gi6TzeEmll/ntTrrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94712473"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="94712473"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 22:36:34 -0700
X-CSE-ConnectionGUID: 9BpUUbcETimlYJwN9vz7lQ==
X-CSE-MsgGUID: 3LThImOCQ926vDum8Cum7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="230477951"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 22:36:31 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v2 1/2] ASoC: sof-function-topology-lib: add virtual loop dai support
Date: Thu, 16 Apr 2026 13:35:51 +0800
Message-ID: <20260416053552.3464661-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416053552.3464661-1-yung-chuan.liao@linux.intel.com>
References: <20260416053552.3464661-1-yung-chuan.liao@linux.intel.com>
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

