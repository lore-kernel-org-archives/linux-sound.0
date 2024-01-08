Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3A912B6B
	for <linux-sound@vger.kernel.org>; Mon,  8 Jan 2024 09:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsEO4uei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704707274; x=1736243274;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ASSjpbjO8aF0tdA7Tjli4C1f51XyoMqpdYHbTxnrNVk=;
  b=TsEO4ueijOtexK5BtXn+R8xRAD8d0XZcv1rvVVW7LGUtIrbUDCeKvchN
   Rhfa3oO5vNAFs2t92sunVXBfajL2ivfUTjSgVR4VpG55fqmEJyB/6j/XN
   tHdcYBJYAJ4rBArcPZP06LDJEe/C1o/pSn3v2MTxM3qDkoFBKQE+G8yxb
   fVfr4BWo1wsc7ZSiK0fBybnPoiX2Gtq/hcIXX+4PaAaCJZswx5fKjxMHT
   OUK6zaDYQ+BQYKFna5kvFUI7F+NLhHxTSouxp6eMoj11AnNUqnhNGM8/a
   NFkgS/rRSRvCD0Ke3KvQJV3ISPRbGWie0dfnA1OyN2sb9DrNpMlddTYe4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="5208167"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="5208167"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 01:47:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; 
   d="scan'208";a="23113035"
Received: from scivlik-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.36.203])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 01:47:51 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kuninori.morimoto.gx@renesas.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 2/2] ASoC: Intel: bxt_rt298: Fix kernel ops due to COMP_DUMMY change
Date: Mon,  8 Jan 2024 11:48:42 +0200
Message-ID: <20240108094842.28782-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108094842.28782-1-peter.ujfalusi@linux.intel.com>
References: <20240108094842.28782-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change to avoid dummy components will leave the component name and
dai_name NULL which will cause NULL dereference when trying to access to
it in the machine driver when applying fixups.

Link: https://github.com/thesofproject/linux/pull/4759#issuecomment-1878641868
Fixes: 13f58267cda3 ("ASoC: soc.h: don't create dummy Component via COMP_DUMMY()")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bxt_rt298.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index 4631106f2a28..c0eb65c14aa9 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -604,7 +604,8 @@ static int broxton_audio_probe(struct platform_device *pdev)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(broxton_rt298_dais); i++) {
-		if (!strncmp(card->dai_link[i].codecs->name, "i2c-INT343A:00",
+		if (card->dai_link[i].codecs->name &&
+		    !strncmp(card->dai_link[i].codecs->name, "i2c-INT343A:00",
 			     I2C_NAME_SIZE)) {
 			if (!strncmp(card->name, "broxton-rt298",
 				     PLATFORM_NAME_SIZE)) {
-- 
2.43.0

