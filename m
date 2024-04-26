Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F085014F109
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714144906; cv=none; b=WlcXwFGTA2oTy4JdmGgH9niAB2BJFTFwmI2i111toXIVptsPYmRVJ20A77hF9DcV6BF35DPJjSmbua92yQ/Fdo+ahwaPmQJgB8isAeTrTbx+fUkQAhcBSIwoc8DmZyhGAwNMKeSrKM95GjYqeH69qXGqBf0fTw7i6BQNvfYqc0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714144906; c=relaxed/simple;
	bh=UJY7grWSVVzmt71CoQKUJ8Ty1qxgNvohbcE1hvLC7tk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EBohwkw20ZAftaSidpoSUw+3dYwpmngfZSqvKowDYDzj+XgtDMuptqb5WuGXRFk59F7ecjNVA47hLCmZ6zxe6QyiHxoRF8ysfc+IfFFeHfzcKr4j1xe0jKI8OqI1/1f32NBNDGyL2IodH6xG3R8mrJlrVyuNzecOyQEO7m9h+0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LE6ku8Bd; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LE6ku8Bd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144905; x=1745680905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UJY7grWSVVzmt71CoQKUJ8Ty1qxgNvohbcE1hvLC7tk=;
  b=LE6ku8BdTHrH7XfZW6mQa6t85pS879fK4bAwMQylAoVvunFACmPUUWBi
   HNIIARKbnTPun8cRsvAcx+tgaGaM1HG0ykNbZyenfwaBfTTmQS5rYwauE
   B7mqQpHWGz3kP7pe2VyopVtxkwGCT5ACEsM3seYRsLekO+UltjEd48lbg
   buXPHYsdDYgpeGC7+ffkJrZyqgRf2ii/RsINvHgvdfcpTuYGUKWpBdDmg
   WIILSnM2Qe+DU7UfaFaV8w9L1nS/YJ4VKKQimt57/A92IsdtLin2VTtuM
   xoRy49D58LE9lkODFwKPEp+Oss8pqsqPH3p9nJ52+17awk1hOG1b/0EFt
   A==;
X-CSE-ConnectionGUID: mYxR7ChUTpOT82YdOI6rmA==
X-CSE-MsgGUID: tWHMnd+6S0u/efewWzeYNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290633"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21290633"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:44 -0700
X-CSE-ConnectionGUID: gt9LVAm6QmiwgOr3gOQCRw==
X-CSE-MsgGUID: RwChO4oNRTmnwcKIe8RYNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259034"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:21:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 09/12] ASoC: Intel: sof-sdw: really remove FOUR_SPEAKER quirk
Date: Fri, 26 Apr 2024 10:21:20 -0500
Message-Id: <20240426152123.36284-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two independent GitHub PRs let to the addition of one quirk after it
was removed..

Fixes: b10cb955c6c0 ("ASoC: Intel: sof_sdw: add quirk for Dell SKU 0C0F")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index f0622aa1b748..86bbf1c66ce8 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -421,8 +421,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C0F")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.40.1

