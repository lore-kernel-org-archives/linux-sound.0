Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0ED13959D
	for <linux-sound@vger.kernel.org>; Tue,  7 Apr 2026 08:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775551993; cv=none; b=kqX8f1gwczeRi1UOI6aUUXwCqOX9QEqQ0FIRbbezW2sz3ETTM8PnFRXNaFsdGWXan9u75wanc5R9SCdH6zXssrAFHagVpRinDZS9sEcA6CjTHCw5gxWwqwAiPTJe/T6L8SEobx5zRAcwIU1xuiWcbYbWHhgOelNEJS18Tn01jQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775551993; c=relaxed/simple;
	bh=Lu4o2CSeHazgb444Txpxm3UBLR62nyxz/BVlQFK3jDE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UiEgGbqYHTQBKH228MTh3jyWzZeZNpA2S4tAXEbPInMZl8Fb8p/0qDzTasKwWAEK2+6ykJLv1wbpriT+2pCC1PQe+fApW0PGvsVyHm9haZOiwkFWOGNbqC2u9GCxK4ddRbJjZBaSTGK5t24Qc9ntt08woV0dpMbvX1n9Ch4n7zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FTB5TWz+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTB5TWz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775551992; x=1807087992;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Lu4o2CSeHazgb444Txpxm3UBLR62nyxz/BVlQFK3jDE=;
  b=FTB5TWz+mUaCQ6a7jBspCx46KQBOueJam2EFHKdMg1BQJXAFF4UvHWFf
   ERKfFEebuvff31s5y0b3w2oQkE9ssl8Rd/RasbOfjS8AAJdVBzfHmyIz7
   cjeZp8LRkLdc44uX/UKubZVJt+4z1Fvzx0cWLz9czcDHZzunhOHd5czhH
   +Zwh+NS5C9/rSrsJt+Vdjfvh5miXVhsh1k21piyyDGRp/GGL4v9ebaJsD
   otSAUqpoCR9O1KUrjqRAGMfKUnLheFDI5jRFKsEiwdc037mHFmKNf8lVx
   7YGNqADnTDPbnl6AsT7TBdEqtEHoLK4BWDcg0piRfNb7Guc7YMCFcP+nT
   g==;
X-CSE-ConnectionGUID: oNnASsS7SESODN/EpHBZIg==
X-CSE-MsgGUID: ikrX9lmcS3K3eKBgjSHfbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87133626"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="87133626"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 01:53:12 -0700
X-CSE-ConnectionGUID: k7xBkW/QRhG1wnwM+S52ug==
X-CSE-MsgGUID: 9fqxHsufTA2hdyqL4ofcfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="266093327"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 07 Apr 2026 01:53:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/2] ASoC: Intel: avs: Fix memory leak in avs_register_i2s_test_boards()
Date: Tue,  7 Apr 2026 10:54:58 +0200
Message-Id: <20260407085459.400628-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Caller is responsible for freeing array allocated with
parse_int_array().

Found out by Coverity.

Fixes: 7d859189de13 ("ASoC: Intel: avs: Allow to specify custom configurations with i2s_test")
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 8a46285181fa..dd0e7cd5a7dd 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -520,7 +520,8 @@ static int avs_register_i2s_test_boards(struct avs_dev *adev)
 	if (num_elems > max_ssps) {
 		dev_err(adev->dev, "board supports only %d SSP, %d specified\n",
 			max_ssps, num_elems);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto exit;
 	}
 
 	for (ssp_port = 0; ssp_port < num_elems; ssp_port++) {
@@ -528,11 +529,13 @@ static int avs_register_i2s_test_boards(struct avs_dev *adev)
 		for_each_set_bit(tdm_slot, &tdm_slots, 16) {
 			ret = avs_register_i2s_test_board(adev, ssp_port, tdm_slot);
 			if (ret)
-				return ret;
+				goto exit;
 		}
 	}
 
-	return 0;
+exit:
+	kfree(array);
+	return ret;
 }
 
 static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach *mach)
-- 
2.34.1

