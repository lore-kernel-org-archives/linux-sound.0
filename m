Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886C4350D41
	for <linux-sound@vger.kernel.org>; Wed, 27 Aug 2025 14:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756303303; cv=none; b=gdSEF/Ay3U7wue5HYFhKCH9/ow3Jw9NyHjeyM2pojHgGBz4bsFgS9KZqeSRWCu+bni3UBZbG3VhKn7QUHgP+YgWhrA90ce4apXBKDI6y908BVtVDqcKPV2w7e+S+b7wFqu4Yd8ijkfgUu1w6dLlQbA1psL6iFNvVkZqH7XDyRK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756303303; c=relaxed/simple;
	bh=c6RgilQmJ/2Ixks3uyeRAP8Ok/WKB2Yai9+Fn1AUexE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aS9wo8fhPnWpECZCjrijDigiufq8gZuuC2ED7NZurjzN4qi628jBJF05OTxmh7pYsYNDmExo2sTf01FsJZzswUfcvWHt+StGChUIhPHZG1jdrgPjpNXDCZP6AcGu0nRTvddGwHDoxjF2FymmPUaab/0ULVAAJMfu+//eiZZg3yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dS8jB6+M; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dS8jB6+M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756303301; x=1787839301;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c6RgilQmJ/2Ixks3uyeRAP8Ok/WKB2Yai9+Fn1AUexE=;
  b=dS8jB6+MImY+kz3TtaOO6IuY9jdqXe9cHIfjrYmTymrAEqMnxQBLv+Un
   sM2kJBDWBjJcTtduYEfmoIEWgplHT4uaO/I5puH5YivqL1ioN6/bgKEGU
   AWRQz2b/8SldH89gid5FC4u0o3Clxi3u3duzxW9DVYHlBMCV7AZDYX8fZ
   MIKC6lnQ1auStYUdp+LCgWhI/LYyCHDJCobig7FcAJoUxy/dmW91B9791
   gR06RJxaWE8Ml4FGMr1HNjovSRSq6jSRiKXxatTv3KeHc9vnyj68FVMFP
   7DJvGwI8f2JeksWhGyviPBkyWhX4YAxM9p/5T1rmNfMCzQTkpIY4eVZ9J
   Q==;
X-CSE-ConnectionGUID: 8YSvCkK/Rp+g357Tihrb9A==
X-CSE-MsgGUID: sFZzbOGzTxOEVBUOi+drNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58473775"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58473775"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 07:01:41 -0700
X-CSE-ConnectionGUID: csSNnX0QQVOrUuw466vemQ==
X-CSE-MsgGUID: p5ilpdRvS4Oe2ybbTgP1nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="170016788"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa008.jf.intel.com with ESMTP; 27 Aug 2025 07:01:40 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/5] ASoC: Intel: avs: Simplify dmi_match_quirk()
Date: Wed, 27 Aug 2025 16:22:27 +0200
Message-Id: <20250827142229.869139-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250827142229.869139-1-cezary.rojewski@intel.com>
References: <20250827142229.869139-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No functional changes, just code lines reduction.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index edf20d7816ea..4b0a8482af2e 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -58,19 +58,13 @@ static const struct dmi_system_id kblr_dmi_table[] = {
 static struct snd_soc_acpi_mach *dmi_match_quirk(void *arg)
 {
 	struct snd_soc_acpi_mach *mach = arg;
-	const struct dmi_system_id *dmi_id;
 	struct dmi_system_id *dmi_table;
 
-	if (mach->quirk_data == NULL)
-		return mach;
-
 	dmi_table = (struct dmi_system_id *)mach->quirk_data;
 
-	dmi_id = dmi_first_match(dmi_table);
-	if (!dmi_id)
-		return NULL;
-
-	return mach;
+	if (!dmi_table || dmi_first_match(dmi_table))
+		return mach;
+	return NULL;
 }
 
 #define AVS_SSP(x)		(BIT(x))
-- 
2.25.1

