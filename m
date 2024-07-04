Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1601719AD9E
	for <linux-sound@vger.kernel.org>; Thu,  4 Jul 2024 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083452; cv=none; b=UIobCqmEdMZLKdgN8vOhc+oFpGIl2/t3BdnF7IbjuLoyUx8YiL1TMioWRJ8VGyXxQx26W2GK46ahbRwBE45zSnc0ujIjmMgcNmijax2TTbE+fSouwfKmOsTPvw79b4JMvDgOYHLb7JJWfUWE2QWqZeWSpBaNWLWl+pWR38oap6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083452; c=relaxed/simple;
	bh=fEfdO6IvXXG4UxA8M+mqsnb2ASqAKMSAndflNff0lyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pAnNdjWGY56rhW97x3XMYdIgQ/LYFudOGYVr37AYyDCoVfh9c9XmpPzZHgeuAa1AVKmU9QhmrLF1dXlyZauz9uMm9gm2jnAlEmI2Nsmz/nkUE+rlkr1QnnqmTnP5SeFQXb+kVP0Trmtsd+qfk3rwpYGOyivZGzR0hBTRup4XL5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NOB2pmVJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NOB2pmVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720083451; x=1751619451;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fEfdO6IvXXG4UxA8M+mqsnb2ASqAKMSAndflNff0lyU=;
  b=NOB2pmVJ0cUZe8gO5Tb2R1uGN+GbcdbFUXIilyT2ycHk6IgpUEOBf65y
   49WR4Mba7Gtaltn97UxjZScba0ViBO8rS7xNQlf8UCfwaAU21M11ueZCk
   NoAqr+7znjNFk6gNZrzgHj3F8LX245C90FUE+KRzGv73FOGPnbM2xpkaL
   iG8jxi3jAnEaZtvjPpJpUIPG0gObBRdm1VKU43ZRBPvNQGm1H8uFJxCvQ
   mXwbSAyF41Qq5gID0Z7xoAvSbmArs4qMAbg5/tLVDUgxhRpbYu2XmWa7M
   SdF1YGfxcJUAWzD0aVPnXZuVf3h4CkYNjdV3yHMLkAkmOJIPzLWSe4lT5
   g==;
X-CSE-ConnectionGUID: Bj3rZgDeSbaSkE1RUnoWVg==
X-CSE-MsgGUID: J/ilPWP5Q0WrHDblnWTgbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="34888941"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="34888941"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 01:57:30 -0700
X-CSE-ConnectionGUID: HcfdL6hzS4mXvUc0luNSbQ==
X-CSE-MsgGUID: HG/6zCzlRrOGJASFIhv47A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46604642"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.90])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 01:57:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: SOF: Intel: hda: fix null deref on system suspend entry
Date: Thu,  4 Jul 2024 10:57:08 +0200
Message-ID: <20240704085708.371414-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

When system enters suspend with an active stream, SOF core
calls hw_params_upon_resume(). On Intel platforms with HDA DMA used
to manage the link DMA, this leads to call chain of

   hda_dsp_set_hw_params_upon_resume()
 -> hda_dsp_dais_suspend()
 -> hda_dai_suspend()
 -> hda_ipc4_post_trigger()

A bug is hit in hda_dai_suspend() as hda_link_dma_cleanup() is run first,
which clears hext_stream->link_substream, and then hda_ipc4_post_trigger()
is called with a NULL snd_pcm_substream pointer.

Fixes: 2b009fa0823c ("ASoC: SOF: Intel: hda: Unify DAI drv ops for IPC3 and IPC4")
Link: https://github.com/thesofproject/linux/issues/5080
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index c61d298ea6b3..1c823f9eea57 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -617,12 +617,6 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 			sdai = swidget->private;
 			ops = sdai->platform_private;
 
-			ret = hda_link_dma_cleanup(hext_stream->link_substream,
-						   hext_stream,
-						   cpu_dai);
-			if (ret < 0)
-				return ret;
-
 			/* for consistency with TRIGGER_SUSPEND  */
 			if (ops->post_trigger) {
 				ret = ops->post_trigger(sdev, cpu_dai,
@@ -631,6 +625,12 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 				if (ret < 0)
 					return ret;
 			}
+
+			ret = hda_link_dma_cleanup(hext_stream->link_substream,
+						   hext_stream,
+						   cpu_dai);
+			if (ret < 0)
+				return ret;
 		}
 	}
 
-- 
2.43.0

