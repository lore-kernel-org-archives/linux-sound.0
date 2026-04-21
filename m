Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCCA3A3827
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776762856; cv=none; b=eflp/wc8vEHjlod6fJEA8YletIlGspGsdKEtKpYwBzR5yf8mUM502PGYzfrLaw00CnZhEaji+6pM5WQSp75S92GlXpYtfPB0Xb7UUbvucqHEjwk5eZ4rp5rm07vBYQ1zRBb2gkvQeB7SpMLOgcSgFv+6BxWQyvCAIW2XJ4Svm1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776762856; c=relaxed/simple;
	bh=qJfJt9PAkRWh5bdivfcm4foBMsqtZYKawbpKtncgF54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pMPAjE3okOCxI7Y7JLQmmqeIaKqzKlqYKAzBlGuBwaiefYXMAGJAz2vDNpGf1pfXYFQunL9JPEbRH5JjiVFtNiOZBKxvNuFWyrXRmzs4+zcLkvWTQWnBw7HKJD3ov0D2GEqDiXAG/uHh0JqAozA5ovBBd5rtieRGfjJyex1jFYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qfc+fu/0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qfc+fu/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776762855; x=1808298855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qJfJt9PAkRWh5bdivfcm4foBMsqtZYKawbpKtncgF54=;
  b=Qfc+fu/0kXt0f4S3PTrV13pIntesiIIP+sv/gb4T08Iz13wVXW5cmCyJ
   JmPnehQRU1GmvyRjhidmQwpDTYCMDJmNIEKnpBtLYJ8GQhjd+eh4uUGj0
   5SqcSrHdq1H6YWDvzcVBOv/+Mqq3f+LM/6XOOJSWc8J7rv1EyfPbSUHux
   3t9FkSer4CpfCI2qj2FiJ/QrqVrooLspi8LZrD9u76dU+8Wi5TN8gTuqg
   IiUICtZLrxl2qd2WKAAIuQAgtER4Yw8rdSiJbuV1Q2nKj1onHhvQQ0ukx
   apdIKWkiIQXS1zp2B+dCwaXoDntRVwzpJRSy9SRx2nPz+iNQbG55jONwD
   g==;
X-CSE-ConnectionGUID: KpPzzrrJQBK0D5otc3nf5A==
X-CSE-MsgGUID: HB9DPqARQw+0ssNT9TX6Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88308976"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="88308976"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 02:14:14 -0700
X-CSE-ConnectionGUID: BAZdYeYCQryfoJtcoTRwmg==
X-CSE-MsgGUID: JpPcyY0dQ+i9xpbfSAQ14Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; 
   d="scan'208";a="255254630"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 02:14:13 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH v3 1/2] ASoC: sof-function-topology-lib: add virtual loop dai support
Date: Tue, 21 Apr 2026 17:13:50 +0800
Message-ID: <20260421091351.4056377-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421091351.4056377-1-yung-chuan.liao@linux.intel.com>
References: <20260421091351.4056377-1-yung-chuan.liao@linux.intel.com>
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

