Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7201B0F3C
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759211; cv=none; b=tCmAPeSPvajxBG2U0S79v2z98/5i+s5GXDCxwyS1IdOqaogXZx73PX+VtPyAwhoLXleBfcGS6O3JaoqMs7X1+0F7/AC81zFTL0rrUyQTWekRtyZBkvas76mZCVP80qAIv08Wqzx3iieAGqTnAFn0as5x1CIIZBNAk6hK4zMBEF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759211; c=relaxed/simple;
	bh=RCvT/D7pa8Mcs+dtiHT9AwDFV/snCSNIk2p+3i3Wt+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cGVrRZxb23hHkfhqA4FgZW/21wQufS3Ufawsd6mi7orlUHSD2qOmbVL+y1Na/m9YVWEu2tjZrOtcnXVnBxHvikWEwK3Tb9H4IJAMGjOYwRanEUSSWaOp5X98XJeMXBNh2KKybRmG71OZlmqPu1FsXvP60wrDK7csr2WkWKPCOMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsL9+rk3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsL9+rk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743759210; x=1775295210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RCvT/D7pa8Mcs+dtiHT9AwDFV/snCSNIk2p+3i3Wt+Y=;
  b=BsL9+rk3+tqOisUhj/90ju2QjgWRaRPJuS2roKhYrHpmEa/dtGiI1FOB
   NJ1mE5g5hdikfuVAL0QOK2tYtFMydgQg4bgjf3wXf/CFGF2EZPl++k/kZ
   5FaxL8GjdVtGr7qHb4HOi9V0px5QEP8SZ5fRP0gCk5LtXIXQRQvf8ha40
   mgrhmFmjEoCegaT+mDJrqWXyRfLcCT4Z4oHn+4UZb39LryzlIfkTn/uBz
   fznUb787WvUNcOdPLA3UPdmYVeJk7ugBrMwOPxkSQ1IILLU4VJfL8s9Sr
   +FKje1EJ+J+F+OHsMnJz2ZqRXfBe2ffASchT/ySN6gc9r9ym0mHoSj4Oy
   A==;
X-CSE-ConnectionGUID: jxInDID+SEK9XzGv8Bhk6Q==
X-CSE-MsgGUID: LeYw/0MTRPG8yFZLJEz+8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70566393"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="70566393"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 02:33:24 -0700
X-CSE-ConnectionGUID: Rua6OMwGT06V2V/enwwj2Q==
X-CSE-MsgGUID: LHBm1Y3hSvyJWzsGEQhykA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="158248672"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2025 02:33:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 11/12] ASoC: Intel: avs: Add boards definitions for ACE platforms
Date: Fri,  4 Apr 2025 11:49:52 +0200
Message-Id: <20250404094953.3657679-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404094953.3657679-1-cezary.rojewski@intel.com>
References: <20250404094953.3657679-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Reuse TGL definitions to define boards configurations for all the
supported ACE platforms.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 2d706edcbf92..7837c19a571c 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -394,7 +394,12 @@ static const struct avs_acpi_boards i2s_boards[] = {
 	AVS_MACH_ENTRY(HDA_ADL_P,	avs_tgl_i2s_machines),
 	AVS_MACH_ENTRY(HDA_RPL_P_0,	avs_tgl_i2s_machines),
 	AVS_MACH_ENTRY(HDA_RPL_M,	avs_mbl_i2s_machines),
-	{}
+	AVS_MACH_ENTRY(HDA_MTL,		avs_tgl_i2s_machines),
+	AVS_MACH_ENTRY(HDA_ARL_S,	avs_tgl_i2s_machines),
+	AVS_MACH_ENTRY(HDA_LNL_P,	avs_tgl_i2s_machines),
+	AVS_MACH_ENTRY(HDA_PTL,		avs_tgl_i2s_machines),
+	AVS_MACH_ENTRY(HDA_FCL,		avs_tgl_i2s_machines),
+	{ },
 };
 
 static const struct avs_acpi_boards *avs_get_i2s_boards(struct avs_dev *adev)
-- 
2.25.1

