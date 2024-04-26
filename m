Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378CA15575F
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 15:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714145145; cv=none; b=Z1+usjOHeSvqvH34/+D6eB/8K4WIM2dQedjMs6HL2aVJnBBX2UooYB/8k1BmXR3ZNouWC+U9+IMMHXQArkQGj/mOVk9zrZf/fcyqLrLi8mfbSjPjIUyYhrei18+WCjrw9LXWVesVS+GOuctWkRpO8n3TNpw0UcoEpnZrMQpiHb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714145145; c=relaxed/simple;
	bh=2aq0nHn6IbnZHNu46EkbGXm35IXWPUwj6ke+P365UoM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mSLoS9C6z1ZlGuXZq5VM/JAmdT7kXF8ACLoW/nlVwUpQavF/3qj84JIMGxu+CZHwZHdXGGfc+UOy8MOrBA7kaeF8LMmnm23Mo00mei8OMrY9aRc23j2gIK3PfndIb6Th12cAhmHDcBbbAxuj61/66NrgnEcuuISGjLr4BtjNVb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D49zuN8U; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D49zuN8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145144; x=1745681144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2aq0nHn6IbnZHNu46EkbGXm35IXWPUwj6ke+P365UoM=;
  b=D49zuN8UHVPCE95uMeE4nQBZzv5FZ6Rq4zbuD50g/zycSRZL1qswYn+D
   NkQNi6NzxqI1vj6un0c1G/2jCYBvVK++kvkz7KFSsrUXdlyKcvPIHpRUo
   DI1QYnEmyCB/XOmsgkxxpKy7zyzeGGd7yvz7L3anaAIFKZoLI5IBK88i3
   uQPqdBdALq6u5oq8yUGA0OPyIf8pKYUAD1cL89CeCNmPCteBLBBFn+CAQ
   wZ/BHmRp8j09ZUyCK7f5mBbEOXsgB6XtTga8FNmK+YL+VGwiqahRCec9B
   gTlXhrRSGPXIH7E7UtaqhY4SI3k3C88tJDtDqAJddESSGaKKT5kKuFN48
   w==;
X-CSE-ConnectionGUID: dAY5NzZ4Qb6O3UBdkpLRhw==
X-CSE-MsgGUID: 0XQm4VOfSfCUQ6z0qmEIAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291303"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="21291303"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:44 -0700
X-CSE-ConnectionGUID: 2TW9sPgjTOKpiI7RsuAv9w==
X-CSE-MsgGUID: aunn/L5FSFSepFaasOBboQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="30259557"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 08:25:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 08/23] ASoC: Intel: sof_da7219: support MAX98357A
Date: Fri, 26 Apr 2024 10:25:14 -0500
Message-Id: <20240426152529.38345-9-pierre-louis.bossart@linux.intel.com>
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

Add support to Maxim MAX98357A speaker amplifier.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 0abb71a10a72..610b5a8e0860 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -267,6 +267,9 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 
 	/* codec-specific fields for speaker amplifier */
 	switch (ctx->amp_type) {
+	case CODEC_MAX98357A:
+		max_98357a_dai_link(ctx->amp_link);
+		break;
 	case CODEC_MAX98360A:
 		max_98360a_dai_link(ctx->amp_link);
 		break;
@@ -393,6 +396,7 @@ static int audio_probe(struct platform_device *pdev)
 	case CODEC_MAX98390:
 		max_98390_set_codec_conf(&pdev->dev, &card_da7219);
 		break;
+	case CODEC_MAX98357A:
 	case CODEC_MAX98360A:
 	case CODEC_NONE:
 		/* no codec conf required */
-- 
2.40.1

