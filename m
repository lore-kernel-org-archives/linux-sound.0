Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340400;
	b=453Ys+A5WbEhY+92sS1IlCdeUSzscYLJ7SMMlC16fkI1GFZEcFMNzQjX1o7oIARkFMs8
	 uGTXQ3o12a65RbChA+jmsVocsIHZlc/UWu4sPmxlAJJT9ElbWaTHtx7+k9LC/AtezTbZG
	 ATfKuO6lvln8WvxqNH+7kbaO0ag/+uudiYmXuMpOiRaL7dgNpMSdloEq2AQ6S0Kn0aCLn
	 OIPBv3XJAmN6zxOgTmaKaSx2KxRiMndHw0cskkn/bbsgwXXIrjVeWKAMFINUMGrV2AV3F
	 qVuD84AiL4mQLfUyEtUvVDR3kFbAEjPW8Kx48oVzPOAkbx19fgGym+9s3BiQHLvMaEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340400;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Z1RtlHu+RDNXGhn7EU+GW2A2dLpZK49R+xP5kRvHRbE=;
	b=a520VFdhd4s7iEYSO+TE8kbC+KqXSdtz4lWPQoEsSmsytYltEJzQsDBnUX8mjpCd4l66
	 QJIZqhkpdBJpVE686eUcApUsBPAF5/nbJln9EdqovS2FuihIuYHN506mUb41C/fN0sNYv
	 XuI9VUFcx8EpdNDWe+ULAhaTpzkC2PQGiHdoD3T1w4iM38tqYu0ouFoBucJppKjudhN+0
	 wfyviDVYdoQGxy/Q8zSDNifJbab2A3b+faIVTOOmdYJmr4hkqZCcIC4DU+oPzQTfYkykX
	 7oxw6jGFkPmRQzHPyprrKjmKj8i1oCB9o39V5xfCIk4G2xaVHtUysYUQORdxw9B+XKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BlvHFrR7;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B027606A339
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 09:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B027606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BlvHFrR7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795340400; x=1826876400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e4T7rfPDT0g5eGmz4Wt9C/RLB2XIUReSUzofzOAENc0=;
  b=BlvHFrR7HOjXtbW73CHgtag+dmv1+ONp8dclDa+Ufh6Z+WduNzgYcCkz
   En1X+Z01xUROX5X37AdXqKVeLTAoLAwL+OzWirxMMTy0JM4qKVDFOZk4a
   JobauVDCxkY19wwbcUm/YkExAhxpDSed3oa1IWOOd4Hqjm7bXOxs8KfN4
   usfVNvkwByLwB2UNJ+rk1Oy5KOIhnWniy6nUpqLtkTPNlUEfz/M2xgVZG
   jYaP7u/yAuFjfI95yksB/Yw7XeO1YswQou9EeelPtT3bs6dhPQHr9bEzS
   Y3GlcjLqKmn61HrKlJoTX/DqBW1++zuFJrxQund9PAt8UPY4v9DYDAWjt
   g==;
X-CSE-ConnectionGUID: Z2wYBykERDC8moi/8YASvw==
X-CSE-MsgGUID: 65ozxFU7TrGUcK/UI7V7Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4051528"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4051528"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 01:40:00 -0800
X-CSE-ConnectionGUID: 1zxiOL/AQjmSvgb/w5HAkQ==
X-CSE-MsgGUID: 78Sf7wMoRZ6QObCg/hmlEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="12759938"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 01:39:59 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/3] ASoC: Intel: skl_hda_dsp_generic: add HDMI IN DAI link support
Date: Sun, 22 Nov 2026 17:39:43 +0800
Message-ID: <20261122093945.2138118-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122093945.2138118-1-yung-chuan.liao@linux.intel.com>
References: <20261122093945.2138118-1-yung-chuan.liao@linux.intel.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add HDMI_IN to SOF_LINK_ORDER so that the HDMI IN dai links will be
createrd if SSP_MASK_HDMI_CAPTURE is set to board_quirk.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 34c8b7fec3ae..e7f5869ff12e 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -53,13 +53,14 @@ static void skl_set_hda_codec_autosuspend_delay(struct snd_soc_card *card)
 #define DMIC01_BE_ID		6
 #define DMIC16K_BE_ID		7
 #define BT_OFFLOAD_BE_ID	8
+#define HDMI_IN_BE_ID		13
 
 #define HDA_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_IDISP_HDMI,  \
 				       SOF_LINK_HDA,        \
 				       SOF_LINK_DMIC01,     \
 				       SOF_LINK_DMIC16K,    \
 				       SOF_LINK_BT_OFFLOAD, \
-				       SOF_LINK_NONE,       \
+				       SOF_LINK_HDMI_IN,    \
 				       SOF_LINK_NONE)
 
 #define HDA_LINK_IDS	SOF_LINK_ORDER(IDISP_HDMI_BE_ID,  \
@@ -67,7 +68,7 @@ static void skl_set_hda_codec_autosuspend_delay(struct snd_soc_card *card)
 				       DMIC01_BE_ID,     \
 				       DMIC16K_BE_ID,    \
 				       BT_OFFLOAD_BE_ID, \
-				       0,                \
+				       HDMI_IN_BE_ID,    \
 				       0)
 
 static unsigned long
-- 
2.43.0

