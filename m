Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EF867E6D
	for <linux-sound@vger.kernel.org>; Fri, 12 Jan 2024 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZlY5xQP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705059207; x=1736595207;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G63RKijQuZlfIn9oSkQ7V78SUoYWtBT/TkoG5eoaOoo=;
  b=fZlY5xQPxbkfi6qauQL1j5oiXwbm04sAWCF6I0AUGjSznHh5SqKcF7Cp
   sEChFNnBCQs4SdY35Jf/hu0vueC6rKTYJbRr8JoqiI2CuniouPmGkFyD6
   cw8zwq7Fm0956CQaBduSGdT5DO4KdmtMHdt2yjW1Dn5hznz4IUaBivt5J
   twe7NG6iFfqA6/6j/DN6w1C+urMO13EXsp+j17k6IuwefYtEHYCvwGmM7
   qhKRLoyfWYpuwQeCWK1u9hPJ0ISl70GmrugNnr35sLBRGHH0XmxUdfoQ8
   wkH3LEF2SugXVzbGaggJKEpi2tAwGE0QGXhKYEGcYlO+EFMPvqw1VzQDr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="6235025"
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="6235025"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 03:33:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,189,1695711600"; 
   d="scan'208";a="17373458"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jan 2024 03:33:24 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH] ALSA: hda: Properly setup HDMI stream
Date: Fri, 12 Jan 2024 12:33:49 +0100
Message-Id: <20240112113349.2905328-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 4005d1ba0a7e ("ASoC: soc-dai: don't call PCM audio ops if
the stream is not supported") HDMI playback is broken with avs driver.
This happens because for HDMI stream (unlike generic HDA one)
channels_min for stream is not set when creating PCMs. Fix this by
setting the value based on first available converter.

Fixes: 4005d1ba0a7e ("ASoC: soc-dai: don't call PCM audio ops if the stream is not supported")
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 1cde2a69bdb4b..3903faecbcfce 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2298,6 +2298,7 @@ static int generic_hdmi_build_pcms(struct hda_codec *codec)
 	codec_dbg(codec, "hdmi: pcm_num set to %d\n", pcm_num);
 
 	for (idx = 0; idx < pcm_num; idx++) {
+		struct hdmi_spec_per_cvt *per_cvt;
 		struct hda_pcm *info;
 		struct hda_pcm_stream *pstr;
 
@@ -2313,6 +2314,11 @@ static int generic_hdmi_build_pcms(struct hda_codec *codec)
 		pstr = &info->stream[SNDRV_PCM_STREAM_PLAYBACK];
 		pstr->substreams = 1;
 		pstr->ops = generic_ops;
+
+		per_cvt = get_cvt(spec, 0);
+		pstr->channels_min = per_cvt->channels_min;
+		pstr->channels_max = per_cvt->channels_max;
+
 		/* pcm number is less than pcm_rec array size */
 		if (spec->pcm_used >= ARRAY_SIZE(spec->pcm_rec))
 			break;
-- 
2.34.1

