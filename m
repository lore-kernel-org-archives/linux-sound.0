Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B486D148FE2
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145148; cv=none; b=JlblSTDyMECex/8qI6dOlxPKv+nF6WlFVxCDG776DpdVFKOCH80apNsKVWE6zz4nWLJnIFAZqkxIHFEzXeBhyedpTdQ6jumjRMmYkIWAJ5zzfLAMvzA7uRHJ6icnizs1AlE7VLAcyQzypazzWna8Oi21v6lLURTBgYRYvBZewCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145148; c=relaxed/simple;
	bh=PRGg5luhnmqlK1tlFztMwBxbOIOGfJoQrFyKkJT+oSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FFYtWEJUccigMSzc/uOOGrmb6o7Zyp6+62ec0twwyuKW/DDw4eqvgw4pR53SbS1EJLEvUrtCvKEp4KC3sggZf1PATdlIGhSugdg/B5f8R4+Wr9CWY84UJ2+wOedvZTsvxpEJQPX033GBGhVbBm7hzSANngSQgFdXYpZ8UiFsYao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2ibViGv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2ibViGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145147; x=1745681147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PRGg5luhnmqlK1tlFztMwBxbOIOGfJoQrFyKkJT+oSU=;
  b=X2ibViGv0xvEVau5X15Lynt2zSGs6wF7GAAt1q/kWBJW7R5ZBivpk0JL
   muTzGLiTzsxJoGfJMK+ZCMrm31yo4AY5FkJ/2kgQ8ZZBx1UCbDHD8ns8F
   eGwAiBNIx8gq2so24S3+Xo1jtAZXZ4Fwil5smmKeB3GM7ac4K90h/cZBy
   qMq+V9O4RurmVskfOsj+e/uvi48D3K7pzIYqgt92K02y+pMD9Rz7Vbb1M
   G0mme26tEum7OJFAAZue6X0QefkqymKP8LY0F4HkZUkUmThRHGuT8I/6N
   vrH870qSCFOu7wEkwwV2zaQ0mxVSO8sAEzN5EmH3zt5ZSJ2CMVumcB4Lm
   A==;
X-CSE-ConnectionGUID: qs7+UY7/RBSnjMNjMFam2A==
X-CSE-MsgGUID: x8ZsKZ/gT8GrDWkJkRaC3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291324"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291324"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:46 -0700
X-CSE-ConnectionGUID: sSsRKk1mTS6RwqTBSCr/Kg==
X-CSE-MsgGUID: /lUoq8JtQeG5Imf4hnWuhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259579"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 12/23] ASoC: Intel: sof_da7219: support MAX98357A on glk boards
Date: Fri, 26 Apr 2024 10:25:18 -0500
Message-Id: <20240426152529.38345-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

For glk boards, MAX98357A speaker amplifier is supported by machine
driver bxt_da7219_max98357a with sound card name glkda7219max. Use
same name for backward compatibility with existing devices on market.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index cc5e99b21456..d7b605896f89 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -348,6 +348,20 @@ static int audio_probe(struct platform_device *pdev)
 
 		/* overwrite the DAI link order for GLK boards */
 		ctx->link_order_overwrite = GLK_LINK_ORDER;
+
+		/* backward-compatible with existing devices */
+		switch (ctx->amp_type) {
+		case CODEC_MAX98357A:
+			card_name = devm_kstrdup(&pdev->dev, "glkda7219max",
+						 GFP_KERNEL);
+			if (!card_name)
+				return -ENOMEM;
+
+			card_da7219.name = card_name;
+			break;
+		default:
+			break;
+		}
 	} else if (board_quirk & SOF_DA7219_CML_BOARD) {
 		/* overwrite the DAI link order for CML boards */
 		ctx->link_order_overwrite = CML_LINK_ORDER;
-- 
2.40.1

