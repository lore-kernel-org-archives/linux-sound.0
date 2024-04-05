Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6C31465B4
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308107; cv=none; b=d9x/huWcyDSsUE91CcjZQh0Ltlnr8kYX0JHLIUOt8R7fy31PXMJp8FOKo8Ym2OsBg9Hz1/EY+5rxIJxigs62TBjom2ap6oYUXKZBP54a/7WCaO6taM5LRmnj9bW6OiyuxX0v0PIgdD+Hh8hTHogNqCc1mj/jfMBFJ+3oATDjRdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308107; c=relaxed/simple;
	bh=A+RaWNl0uAuzryi863scci2ttj6MV/67NVWw5IM4vVw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eWx3rpxD/fSbXyzJhQhXtGzrQCVBLvU9xScm6RJ3xFKhGwHxUY9xMo0kYw783EC9AHez0bmMDejfH8AVPp8Y2idC3505QVhPw54JtlukYI0pLe3L/7yX31f7uiYS7WYFiznErUelUo47BaN7flLMIu2yNLPtIdkXb02oCNjeHVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KK/RgxVk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KK/RgxVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308106; x=1743844106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A+RaWNl0uAuzryi863scci2ttj6MV/67NVWw5IM4vVw=;
  b=KK/RgxVkht4SdTn9FymH7QQws2vfUa1jqBm22WAfZaRiGGFfYehGxxyA
   5CTTI7aaiX2WzkzdT3wHOhO96/Tkp1GzhMxKCzGrVDKllGO22v767cVPQ
   mgINFUCrmmTYatDZorEJQJg8xx0V3Wshl8boi6v/6HpEkEWq/lqrxe+wg
   lSEC8dru6ILyFEMT4cYDqnN4znKRaXA2Gh1UxRuY42sl2Zsp/BRn+uhlM
   YJ3kdnW/5Z0kUJi/9/YfH4X2dLGaMUVRQ6NH8zqVDRh8S9158CHNJvDew
   2fzAyjLB91sP7/AA2x1sBO6E2InaKrzCeWJxpjUyVeRrX9LrkhOnVF2yg
   g==;
X-CSE-ConnectionGUID: qFhlgYJISJyIivWAxyvKNw==
X-CSE-MsgGUID: SN03lC57QaiWQcp6VqQBXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787473"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7787473"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:08:26 -0700
X-CSE-ConnectionGUID: zvIWjhjbTNSy0k0A6X8rQA==
X-CSE-MsgGUID: wqVJDZEbTjmmSOhCNILeLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19042447"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:24 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 10/13] ASoC: Intel: avs: Wake from D0ix when starting streaming
Date: Fri,  5 Apr 2024 11:09:26 +0200
Message-Id: <20240405090929.1184068-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is recommended to keep the DSP domain in full-power when starting DMA
engines.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/icl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/avs/icl.c b/sound/soc/intel/avs/icl.c
index 3e0716160f5a..d279ec1e0ad0 100644
--- a/sound/soc/intel/avs/icl.c
+++ b/sound/soc/intel/avs/icl.c
@@ -109,6 +109,10 @@ int avs_icl_log_buffer_offset(struct avs_dev *adev, u32 core)
 
 bool avs_icl_d0ix_toggle(struct avs_dev *adev, struct avs_ipc_msg *tx, bool wake)
 {
+	/* Full-power when starting DMA engines. */
+	if (tx->glb.set_ppl_state.state == AVS_PPL_STATE_RUNNING)
+		return true;
+
 	/* Payload-less IPCs do not take part in d0ix toggling. */
 	return tx->size;
 }
-- 
2.25.1

