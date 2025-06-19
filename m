Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9336A18EFD4
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750330586; cv=none; b=WOxYQ5ihHlIWVEDHkuLOcY8VXCJr2QFU4TRcC5j9sGu5F1vkG1Wxizb9rVDHm+l/7iwOrvBREAt/bgyoZUvCWVndU/Rt+B+UxyxMsAbfl98MxlZ329j2o7+7NNub1oJ7/vKyN2Uio0t3kSFtCoIXK+u7iAFF/ECRbtBPA1HVsjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750330586; c=relaxed/simple;
	bh=ILDDp+LqQT559XOdmHqiInjkIed/sDnrR+UKZYtuHMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hecfMLfXE5837pulwEb6maUkdYOwABFdn8nZCV7EkdgsBigWWk0NwkA7Ho3phETIc+69F+GzgdoM5i9gufMA+LeqmtWonYY1ncxfdfpzJe9EEiVD9ZOar5xEi4Gw0fYF3DQyVn7UsVpTKyP0rN/MgLjAFygeQbgoFYQcmKBZhqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sf8AGbed; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sf8AGbed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750330585; x=1781866585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ILDDp+LqQT559XOdmHqiInjkIed/sDnrR+UKZYtuHMY=;
  b=Sf8AGbedYdjfipYnvIfoEhgkYoXwbFJvZJHZKtIjmNGRtDiTetHavZ4i
   rYBX0nC8d3BV5iLDxCzHFgVK+TyxtMCLD+a7I/lhXjr03rFAleRBIFGCR
   lWbhx9vXR3Xw/yuKQkqxkVs+MEhWMLiikuDQZ3TXit/B8LkSE2OqbYNm7
   BEPTx9gypnj6wvfqIAqfv0CzSAPY91VVHqRzZ69BgFZYiqwALbGn0YaRL
   KSKHsAoA47SAQsrQJ6hlZ+LiX79myq38KRowQm0K4pAMc7V35ZrBDDJ86
   Vxpc2oH0INZW8wNy2/WhmaP2sDs45n9AS33VaBEsQGimPqwJVP2CJmmoL
   A==;
X-CSE-ConnectionGUID: FPQwZ9OLQpCuUo+4sBKexg==
X-CSE-MsgGUID: cO+GfZQxQEeIE7etUhYmuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52282558"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52282558"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:56:25 -0700
X-CSE-ConnectionGUID: rq6GOs9jTcSM28aoMYqbLQ==
X-CSE-MsgGUID: cWPJQXaFRJakXWlP9oPLoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="187817343"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 03:56:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	guennadi.liakhovetski@linux.intel.com,
	liam.r.girdwood@intel.com
Subject: [PATCH 1/2] ASoC: SOF: ipc4-priv: Add kernel doc for fw_context_save of sof_ipc4_fw_data
Date: Thu, 19 Jun 2025 13:56:22 +0300
Message-ID: <20250619105623.4546-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619105623.4546-1-peter.ujfalusi@linux.intel.com>
References: <20250619105623.4546-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel documentation is missing entry for the fw_context_save.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-priv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 58b032820683..76dc54a2f07d 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -72,6 +72,7 @@ struct sof_ipc4_fw_library {
  * @max_num_pipelines: max number of pipelines
  * @max_libs_count: Maximum number of libraries support by the FW including the
  *		    base firmware
+ * @fw_context_save: Firmware supports full context save and restore
  *
  * @load_library: Callback function for platform dependent library loading
  * @pipeline_state_mutex: Mutex to protect pipeline triggers, ref counts, states and deletion
-- 
2.49.0

