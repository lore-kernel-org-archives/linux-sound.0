Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FE013281B
	for <linux-sound@vger.kernel.org>; Thu,  4 Apr 2024 19:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712257448; cv=none; b=VIOmV6Sko5Y+6SQcKDeD8pksA93ZgMVy1yb96jm+mbpP3t4gsAmYVY6PXqFAmxmairYVnHszyf+ebcf8WujQa6Agf2xcHndeld1MMu/g0wS7c6U0x0tEJZtkwwya5peUnLir5ZWXwQZeaDL9u9tuQqa6f/ZLPn0vKr5Z6UALHME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712257448; c=relaxed/simple;
	bh=kpEVEkeUvSQHtIiwegnx0xTZnOZz10AbI8oxN1072Tk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pzs2Ba9nFxJ9fgkNYfB0I5hJuOvapX7xlKX5rNEKpn5/tF2ADLIH0lIvT5ShOh/sY6rvPzbmS5YPrLPnf7ibWD6Ft2S1U8er8YWEeWM0J2WPGEYFTpJNCv6XqC+Qmev6FSDkzc7dGXxYyTFsZTxzzIWs+WM7gR7/7oqn4Iy9tlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BcMXR0V9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BcMXR0V9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712257448; x=1743793448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kpEVEkeUvSQHtIiwegnx0xTZnOZz10AbI8oxN1072Tk=;
  b=BcMXR0V9UXXv6lmIHGOYm4+SF/8FC9HYdGWSS/TFlhD3B/yx4lA+TkBJ
   EFCn4u15zH5XfGEA71NaXhVNMHtjUTKtRDbHTFm3sQMVrrKPqTAH8mPJm
   N+JEVoJfoRFOJPJUPsPYaRu82Bmo7e6HTxPg6zySjBNaCp2O/XN8Dlqvg
   WV55Pj9tlsI+UbpUWj7l1qa1zyK6kDlydhZyM8wV8Q+c6kRn1whlyJn5u
   /HHrY+geJ33TXmbBpFh4tm2ke/CmxUKk7DR/RFDd9TekVPYYrM87o0iBa
   tyDKgnBL1hhMYZQfEfiOt+0HJanVJRdhJiFqdYOtW5FBWeXdohMkZcFIU
   g==;
X-CSE-ConnectionGUID: +qXjfKxzRkGf1ABlG6uK5Q==
X-CSE-MsgGUID: YGekhO2OTiSRGv+e7mis4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7433869"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7433869"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:04:06 -0700
X-CSE-ConnectionGUID: yDlEFBh0QCy3ihaz907/og==
X-CSE-MsgGUID: cdvmRj1QQnKO6vMm2LFLMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="19492314"
Received: from sparrish-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.119.106])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 12:04:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Keqiao Zhang <keqiao.zhang@intel.com>
Subject: [PATCH 3/4] ASoC: SOF: Intel: hda-codec: preserve WAKEEN values
Date: Thu,  4 Apr 2024 14:03:56 -0500
Message-Id: <20240404190357.138073-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
References: <20240404190357.138073-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since LunarLake, we use the HDadio WAKEEN/WAKESTS to detect wakes for
SoundWire codecs. Unfortunately, the existing code in
hda_codec_jack_wake_enable() unconditionally resets the WAKEEN bits.

This patch changes the initialization to preserve SoundWire WAKEEN
bits. For HDAudio codecs the same strategy is used, WAKEEN is only set
when the jacktbl.used property is set.

Closes: https://github.com/thesofproject/linux/issues/4687
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Keqiao Zhang <keqiao.zhang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 9f84b0d287a5..6a13f38a8d21 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -79,18 +79,27 @@ void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct hda_codec *codec;
 	unsigned int mask = 0;
+	unsigned int val = 0;
 
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
 	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
 		return;
 
 	if (enable) {
-		list_for_each_codec(codec, hbus)
+		list_for_each_codec(codec, hbus) {
+			/* only set WAKEEN when needed for HDaudio codecs */
+			mask |= BIT(codec->core.addr);
 			if (codec->jacktbl.used)
-				mask |= BIT(codec->core.addr);
+				val |= BIT(codec->core.addr);
+		}
+	} else {
+		list_for_each_codec(codec, hbus) {
+			/* reset WAKEEN only HDaudio codecs */
+			mask |= BIT(codec->core.addr);
+		}
 	}
 
-	snd_hdac_chip_updatew(bus, WAKEEN, STATESTS_INT_MASK, mask);
+	snd_hdac_chip_updatew(bus, WAKEEN, mask & STATESTS_INT_MASK, val);
 }
 EXPORT_SYMBOL_NS_GPL(hda_codec_jack_wake_enable, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
-- 
2.40.1

