Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992831FBA
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272469; cv=none; b=dHDI7MkY+fyRrfAMmOr8VQUfOq2U6rGcUuM/udlk0+k1OXBvDgFFwVhp6DJC5gas8IRvwzNgI1U3ycG+C/HwEwMGpsBsmDTIFsk5BfAattiUinxxVlAGZi/LkQGLuk0RtvAkwx5Qzw3uIWBPcEe/oTIz9CPpSLPjsxe9Y4MLO2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272469; c=relaxed/simple;
	bh=Ih4hPWHUQ0BVIZi3ZlyMjC6ui+8DfUNPiSSGL7Ht/qc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y11yFN1V+51mmewBTfMA5oOvbDl/vtWkvZTd4y4BCbtjGpJGxk2D0FExJSGH278N3YfJez98JLeKfSBaVD5bjkfHM/f+KtqHMb+bit1vtNWj52Omrh4F0ODxu965Kgz1CgS8MphTJnzGoJKPgPZNasq62QNd7iM10ZBdnRR3M2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0r9Gerb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0r9Gerb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272468; x=1746808468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ih4hPWHUQ0BVIZi3ZlyMjC6ui+8DfUNPiSSGL7Ht/qc=;
  b=X0r9GerbEGjIiB0LnyMncrAHLN0yoisUqpW3wIQqtY8IR7/N+AfXEJZC
   lbANHF8rqwQLbG+Nj1O3jODxnKpRH8sb7RMGgyhWVfFqeOw4cJDUlerwS
   38iTs5+mxoKZAGqZbiglF9y5Thc8C4NXIhAT5DXYF/xtzHI5+PGqmZWAX
   mc6kAxKxNv3qE8JejIhha4abSBUflwXoTKvDgUqAD2vpfDU1H0iB0W3rp
   GRkEJ/E2CCrOqZmCPmQ+7EHs0cytYHAZMbfFrPnT9VNT9S11kX6nh6RFs
   IBENUO688VP0rBoE7YJOp/zHxr+FwqM93PEZKzi+F9uViTGzBlkEb6hFH
   A==;
X-CSE-ConnectionGUID: nfBTT3E3R22R9Mk+IGMExw==
X-CSE-MsgGUID: xx0Udt/iR6urW3lkAB9QkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017510"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017510"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:26 -0700
X-CSE-ConnectionGUID: 5PMwLs5nSZuWjhHWQtbj/g==
X-CSE-MsgGUID: EvuCzSuRTz6DYN2fal+saA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33760970"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/18] ASoC: Intel: sof_sdw_rt_sdca_jack_common: remove -sdca for new codecs
Date: Thu,  9 May 2024 11:34:01 -0500
Message-Id: <20240509163418.67746-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Realtek new SoundWire codecs are all -sdca version. No need to add
-sdca to distinguish the non-sdca version. To be consistent with "spk:"
and "mic:" components string, remove "-sdca" suffix from "hs:"
components string.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../boards/sof_sdw_rt_sdca_jack_common.c      | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 85c09513bc35..69161ea5b290 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -88,6 +88,15 @@ static const char * const jack_codecs[] = {
 	"rt711", "rt712", "rt713", "rt722"
 };
 
+/*
+ * The sdca suffix is required for rt711 since there are two generations of the same chip.
+ * RT713 is an SDCA device but the sdca suffix is required for backwards-compatibility with
+ * previous UCM definitions.
+ */
+static const char * const need_sdca_suffix[] = {
+	"rt711", "rt713"
+};
+
 int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -96,6 +105,7 @@ int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
+	int i;
 
 	codec_dai = get_codec_dai_by_name(rtd, jack_codecs, ARRAY_SIZE(jack_codecs));
 	if (!codec_dai)
@@ -103,11 +113,22 @@ int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 	component = codec_dai->component;
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s hs:%s-sdca",
+					  "%s hs:%s",
 					  card->components, component->name_prefix);
 	if (!card->components)
 		return -ENOMEM;
 
+	for (i = 0; i < ARRAY_SIZE(need_sdca_suffix); i++) {
+		if (strstr(codec_dai->name, need_sdca_suffix[i])) {
+			/* Add -sdca suffix for existing UCMs */
+			card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+							  "%s-sdca", card->components);
+			if (!card->components)
+				return -ENOMEM;
+			break;
+		}
+	}
+
 	ret = snd_soc_add_card_controls(card, rt_sdca_jack_controls,
 					ARRAY_SIZE(rt_sdca_jack_controls));
 	if (ret) {
-- 
2.40.1

