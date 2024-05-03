Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1D415381D
	for <linux-sound@vger.kernel.org>; Fri,  3 May 2024 13:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714743189; cv=none; b=PvkyaSxWmkQX6zbw4ztj2X7V3GfUpW8usB0Y4VzR9P1+5RBCWoS49E7GBITn/CY3GvkrgXsgfGGXtEuZdBV0syHNT0GQTmQcQ6hiIuMRc+wJLuHU9ykabI3VqpgXtQqglfWm5zXumMRR0FZSocfcwQPEOYM0UJJkdvQYmnq/7Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714743189; c=relaxed/simple;
	bh=JCpC4jGCK6QJrTZBRMOqATgz35wNaz+JCvtUF81DMiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AqExjK5k+2EFbsV8V/5N0KJfqghc7MMALKG3XRfgW2jct7Fv4na0e5CjV11JLxnURJeBWje2h4I2CUvq/KtZyiJTdtZ85Br+8F2lgeGvtzHil+SYn9CRn9nwpkzAcjH4XlmrmxGwsNXUmkoVFaY4maaCX9MPo91T4vVH556Jl6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Idmmugpa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Idmmugpa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714743188; x=1746279188;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JCpC4jGCK6QJrTZBRMOqATgz35wNaz+JCvtUF81DMiQ=;
  b=Idmmugpa1Tnn41DmwurCrZQZzVB1Bw98Ib61NJ54i8PmTrFNvWuiPOWQ
   p+Z5faByMy4aTmEgSQWmEi2/pjtwEMVntW54eFEL4O177QZlUV/XIvn9q
   zKzJRQn3hPTKJkF1nXw37P+y/wvx1LFDIPaS72vP8HTs/9z/P9zf31VO4
   jMVsjUWCaTnP2WDYICnCCK9epG7NOQkZ9K0iFOrLYwRBKb+eVRByUpPdy
   hD2b2d8RoCGmhvqnlej3YD0hJHw+Z4MSVJ8cohZ+QlUJRVe4oqMEG1Gr+
   t0ffisKXhpNq64ccPfmB8/Nh0iNalAe4isRjmP/6KK4fkyN0fgtzvLBh8
   Q==;
X-CSE-ConnectionGUID: 9TeVuQ7QRoW0Wf2HVxze+Q==
X-CSE-MsgGUID: cluEXO+OQ/iYz0nLCKUnHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="13499107"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="13499107"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:33:07 -0700
X-CSE-ConnectionGUID: f9ghJ8ANQHSIwIACEiFdjg==
X-CSE-MsgGUID: JftdetwhSZGPnUZcXmaijg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27501214"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.113.3])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:33:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 1/3] ASoC: SOF: Intel: discard SoundWire configuration if HDaudio codec is reported
Date: Fri,  3 May 2024 08:32:51 -0500
Message-Id: <20240503133253.108201-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
References: <20240503133253.108201-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The machine driver and topology selection starts with I2S, then
SoundWire and last uses HDaudio as a fallback. That assumes that the
ACPI information is correct but there are of course exceptions to the
rule.

On a Lenovo platform, an external HDaudio codec is detected, but the
ACPI tables expose TWO RT711 jack codecs. This patch skips the
SoundWire selection in case an external HDaudio codec is detected -
which only works with the additional assumption that no one will mix
HDaudio and SoundWire.

Closes: https://github.com/thesofproject/linux/issues/4962
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 9 +++++++--
 sound/soc/sof/intel/hda.h | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 8ac8c10b83bd..d4f039ed4ad4 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1809,6 +1809,7 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 	u32 interface_mask = hda_get_interface_mask(sdev);
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = sof_pdata->desc;
+	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct snd_soc_acpi_mach *mach = NULL;
 	enum snd_soc_acpi_intel_codec codec_type;
 	const char *tplg_filename;
@@ -1981,8 +1982,12 @@ struct snd_soc_acpi_mach *hda_machine_select(struct snd_sof_dev *sdev)
 		}
 	}
 
-	/* If I2S fails, try SoundWire if it is supported */
-	if (!mach && (interface_mask & BIT(SOF_DAI_INTEL_ALH)))
+	/*
+	 * If I2S fails and no external HDaudio codec is detected,
+	 * try SoundWire if it is supported
+	 */
+	if (!mach && !HDA_EXT_CODEC(bus->codec_mask) &&
+	    (interface_mask & BIT(SOF_DAI_INTEL_ALH)))
 		mach = hda_sdw_machine_select(sdev);
 
 	/*
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 7804c5b50c26..8b495264f23d 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -454,6 +454,8 @@
 #define SSP_SET_SFRM_CONSUMER	BIT(24)
 #define SSP_SET_CBP_CFP		(SSP_SET_SCLK_CONSUMER | SSP_SET_SFRM_CONSUMER)
 
+#define HDA_EXT_ADDR		0
+#define HDA_EXT_CODEC(x) ((x) & BIT(HDA_EXT_ADDR))
 #define HDA_IDISP_ADDR		2
 #define HDA_IDISP_CODEC(x) ((x) & BIT(HDA_IDISP_ADDR))
 
-- 
2.40.1

