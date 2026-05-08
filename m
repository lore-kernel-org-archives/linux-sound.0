Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEB1390212
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 09:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233684; cv=none; b=CtLr2zGOK3LbZr3kFza9D+hG1jxARa3Xa6udbCBdS17vbFetHWTUb/yHJ43NHBSNv9sd1iJhGS+d+rA98Jk7LkhD3CJ69jhsOn7jWCbmOccvg9+xYwYq49Yt4+eXaJjPALFP37zwpR1+69UWEqS4Uz7+nWipgEY+6ZtLemgAkxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233684; c=relaxed/simple;
	bh=IyX/70NgQ7RFLUfUwHyHb5kZw5OSTUCjBeWmwhgC2u8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=smoL+8nvhKF5MXgBhGI5eLrqMSzbZrLbzfqaBMqcpYmkF5z8F8YCMNHvbUwaqjtXvHoQqP63UJGvt3wCdObNUonlspMUzsH2YwWVgiT6J7tjNLpDxpSz2wyETCY+BSMGnpMKC6VMnejrSdtSAb22ifZOK2Liip5np7wR5gRLz3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIVLw7oK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIVLw7oK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778233683; x=1809769683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IyX/70NgQ7RFLUfUwHyHb5kZw5OSTUCjBeWmwhgC2u8=;
  b=TIVLw7oKR786faayFDbfP4d5U9IcmRsF32tgh9EmWQqFjYk9eDErjeaR
   g6WBPlbCxmQQd8n2bW7sZm2o5aVWGzyBQXIzapt9zTSocYdcXHbNJjlT+
   MJeXPokAH2Lxe4osktlG8PieIkfwVoWRzhwCAkTV9zCrPyD70P6+5MrHX
   +x8d4UKQEDxwJNcevNZre/PeMXaC9YBgpBh5hOS25hgfpX1HUxdn7lMi3
   IJWmWb+vRpUV1x9Nx28/MA+ruZaO7lSUqGLSfOBP9SeZizXrQMQjQeQ0h
   rI2isT9OdAIpXE6VcCMm7S+/YRiqwbQwolT4iGnS4lHpwGyQ3s4p7EyHI
   Q==;
X-CSE-ConnectionGUID: Q4CkSAsCSGWUDoKqcBYjPw==
X-CSE-MsgGUID: WUtdRv/8QEuYXhGplUrqFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78221315"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="78221315"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:48:02 -0700
X-CSE-ConnectionGUID: a+Y7v9ucSj+HPGwja+KYdA==
X-CSE-MsgGUID: oOQcNN4DSmGCjoohcfKJXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="232380720"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:48:01 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/2] ASoC: soc_sdw_utils: Change comment into proper kernel doc
Date: Fri,  8 May 2026 17:47:50 +0800
Message-ID: <20260508094750.1246796-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508094750.1246796-1-yung-chuan.liao@linux.intel.com>
References: <20260508094750.1246796-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maciej Strozek <mstrozek@opensource.cirrus.com>

Update the comment above is_sdca_endpoint_present().

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index da626969a657..d8378d1b435e 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -1843,20 +1843,16 @@ int asoc_sdw_get_dai_type(u32 type)
 }
 EXPORT_SYMBOL_NS(asoc_sdw_get_dai_type, "SND_SOC_SDW_UTILS");
 
-/*
- * Check if the SDCA endpoint is present by the SDW peripheral
- *
+/**
+ * is_sdca_endpoint_present - Check if an SDCA endpoint is present on the SDW peripheral
  * @dev: Device pointer
  * @codec_info: Codec info pointer
  * @adr_link: ACPI link address
  * @adr_index: Index of the ACPI link address
  * @end_index: Index of the endpoint
  *
- * Return: 1 if the endpoint is present,
- *	   0 if the endpoint is not present,
- *	   negative error code.
+ * Return: 1 if the endpoint is present, 0 if the endpoint is not present, or negative error code.
  */
-
 static int is_sdca_endpoint_present(struct device *dev,
 				    struct asoc_sdw_codec_info *codec_info,
 				    const struct snd_soc_acpi_link_adr *adr_link,
-- 
2.43.0

