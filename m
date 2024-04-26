Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C860E13FD78
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 09:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125413; cv=none; b=cN0aE7hPfNKldCoeQdHQtn8HBR7+cmJ86SSQclG4y0v+FYV1+k5jYi1FeKYYStXJoY3CXSS/K4FdzHvXHLHwIc57DQQktxUjkn4NXxtSy0/cqS+DkPbIxaHS6RwnryT5dt9qW2na3EhSYYlVVP2IYkFLFeqPn/LqDsRoWGQDqBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125413; c=relaxed/simple;
	bh=DUVgDs0/gvFlo4f+lMztb4TNTC7UqT0l2BjujtY77hY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CipSD9II1VwHG/EV3Zs8D498FmsA8+JR/rXHh48rEQ1spRPbWBuGFEI8Tqqohv7ClChCb+Q5yYEYXurg/fgvPww+kaz/7v0NhX1DlTxtuHw66LO6XGjvReV059NumI1ePTx3Kmr4Zb89tENf31WAPLj0RX5P22DAW9YXwENE3w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8/gPIc0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8/gPIc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125412; x=1745661412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DUVgDs0/gvFlo4f+lMztb4TNTC7UqT0l2BjujtY77hY=;
  b=I8/gPIc0/8ypcPwRIU/ZVjUt+saDtVxggCSe9OoxXCmWSJ/a0Ni18oQt
   TMP+VLO+zhDhaolsYzKxAyBBwnV2OZfSby8fFWeu2gUdYIGyHhDbcrW9h
   nqZotf9UT/TBgXOaY7kELVnxyl1hZnu9BZZh9QisdtyVVSn/Ijwm6lckY
   V7/I5c5Yag9u9R4YFQVNDLN84LCR9tsQxK/Loem6tHwCQjXh7L4ViPcmx
   L6qidBjr2lqcM5rDSJ2HzDZp4QRG+bEAOAz2HDYBiFCOhPkcy2CsfvStM
   yBZWDxULXYznI300d8we73lljaRbj4KBYaKRnJYL+/G2wteLp61pYR1eF
   w==;
X-CSE-ConnectionGUID: hcDcAscXQAuipFX9Vhhk8A==
X-CSE-MsgGUID: Z9sGzyHAT+KRZ1NuTK5PZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409182"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20409182"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:56:51 -0700
X-CSE-ConnectionGUID: JimNMcCbRmCgssMA9AEfhQ==
X-CSE-MsgGUID: VXfDG88vQIuOE7DecZbNLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25460546"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:56:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 1/8] ASoC: pcm: Reverse iterate DAIs when shutting them down
Date: Fri, 26 Apr 2024 11:57:26 +0200
Message-Id: <20240426095733.3946951-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During startup snd_soc_dai_startup() is launched in ascending order and
the exact same thing is done during shutdown procedure. Reverse the
order in the latter so that it is symmetric to the former.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h | 4 ++++
 sound/soc/soc-pcm.c | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 0376f7e4c15d..a4747c3d0856 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1225,6 +1225,10 @@ struct snd_soc_pcm_runtime {
 	     ((i) < (rtd)->dai_link->num_cpus + (rtd)->dai_link->num_codecs) &&	\
 		     ((dai) = (rtd)->dais[i]);				\
 	     (i)++)
+#define for_each_rtd_dais_reverse(rtd, i, dai)					\
+	for ((i) = (rtd)->dai_link->num_cpus + (rtd)->dai_link->num_codecs - 1;	\
+	     (i) >= 0 && ((dai) = (rtd)->dais[i]);				\
+	     (i)--)
 #define for_each_rtd_ch_maps(rtd, i, ch_maps) for_each_link_ch_maps(rtd->dai_link, i, ch_maps)
 
 void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b0e1bd7f588b..711b2f49ed88 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -724,7 +724,7 @@ static int soc_pcm_clean(struct snd_soc_pcm_runtime *rtd,
 		}
 	}
 
-	for_each_rtd_dais(rtd, i, dai)
+	for_each_rtd_dais_reverse(rtd, i, dai)
 		snd_soc_dai_shutdown(dai, substream, rollback);
 
 	snd_soc_link_shutdown(substream, rollback);
-- 
2.25.1

