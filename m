Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbtsR0GO"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4519E19D
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 05:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701090159; x=1732626159;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kZLOygxvuWEPWWyBCeKU0iS+fkvL9wRcEYuTra47C1E=;
  b=UbtsR0GOHl7XHT7V26iUq7K/TZDpjbQF/6f2uJxtMd8eVXSMex5Cq6z2
   7JGYOBnk1EwRYS/WSWO4yWqW6zK8wqzrW++7HKYv6fvIZhbjbiPAZZeCa
   sPutqC1XwHFNx/2XjXTiBjd1bN3Jft/fEXf1JXbMS8zD2jc4D8rnM5WyO
   jRicBAubulWlduYv+e1uaLi9Yaf+Vc9ZQwOR8Rd/BeP6JZybtChheLE6R
   /m5Qh5WPLtwEA+tBv1T2LuSt6UKnNQ+XUhrJTrmYAha8gOsc2cl1wGBC0
   cmZiLtBh729o8q8OPf4Liy0xcqvpoyhGwfqTvpO+e7aKdSeFlHhF6tpOd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391568003"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="391568003"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:02:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="797228683"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; 
   d="scan'208";a="797228683"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 05:02:10 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 0/2] ALSA/ASoC: hdmi/hdac_hda: Conditionally register dais
Date: Mon, 27 Nov 2023 15:02:43 +0200
Message-ID: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Each instance of the hdac_hda registers DAIs to be used for analog and HDMI
audio.
When the system have more than one HDA codec - like most devices then the kernel
log will include the following warning prints:

snd_hda_codec_realtek ehdaudio0D0: ASoC: sink widget AIF1TX overwritten
snd_hda_codec_realtek ehdaudio0D0: ASoC: source widget AIF1RX overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi3 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi2 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi1 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Codec Output Pin1 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Codec Input Pin1 overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Analog Codec Playback overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Digital Codec Playback overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Alt Analog Codec Playback overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Analog Codec Capture overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Digital Codec Capture overwritten
skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Alt Analog Codec Capture overwritten

These are printed when the second instance of the hdac_hda is probing since it
is re-registering the DAIs with the same name.
Using some clever way of prefixing might solve the issue but that would need non
backwards compatible changes to topology files.

Pragmatically the hdac_hda instance fro the normal codec should not register
DAIs for HDMI and the hdac_hda instance for the HDMI should not register DAIs
for the analog codec - for example on a SDW device where we have HDA-HDMI and
sdw codecs.

To keep the hdac_hda vendor neutral (altrough it is only used on Intel platforms
afaik) add a helper function to answer the question: is this codec HDMI?
Use the new helper to decide which sets of DAIs to register for the probing
hdac_hda instance.

Regards,
Peter
---
Peter Ujfalusi (2):
  ALSA: hda/hdmi: Add helper function to check if a device is HDMI codec
  ASoC: hdac_hda: Conditionally register dais for HDMI and Analog

 include/sound/hdaudio.h     | 10 ++++++++++
 sound/pci/hda/patch_hdmi.c  | 13 +++++++++++++
 sound/soc/codecs/hdac_hda.c | 22 +++++++++++++++++++---
 3 files changed, 42 insertions(+), 3 deletions(-)

-- 
2.43.0

