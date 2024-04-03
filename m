Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835596FE1D
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712135705; cv=none; b=uWWYgWMp5OMIrNC5k7QSBq4toQ3rOfgfIl/qr69rufRN7L+bFhd/UTCtGrNWYa79HBVSglZXS8oTyvXuaOZppdpikl28DMgnKL+vj0BrPTWHTG95fPGfQIXdk0eqCXQl6JEzfb9/+VlDE/8gzjH05RnXc2J9p1VzJbZO3ndzcnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712135705; c=relaxed/simple;
	bh=R42RWlWUefH9vHZVCaBl8MfoWeK8wmzlj0AXLYQx0F0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ko/usqCafPO5jrjnNekyex/0sCSrL5/EolPqrKRLM1iZpFECSgEnTBndV3h2uxLYlIxoGnGk6SOzpgOCb269Kc0gc4eXlAW/98R707Fa8GKsQBtfXdkLjy1l8tVDKbq/Sw9L+OXIxx7QAeQiyLwJCE7IkWvkPjunxXkBsV875wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KO/p8Lkz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KO/p8Lkz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712135703; x=1743671703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R42RWlWUefH9vHZVCaBl8MfoWeK8wmzlj0AXLYQx0F0=;
  b=KO/p8LkzoiZ5Upm8Z3LitSBDtwdLqQENtS0O6qieBGn5OESQNkFoy3me
   6PHXYDJI/4s1neF4219jtPdKabdlTmzP8708FED0tVTe/TZRV3VgRkP+O
   JKpRhpalJ5OS90M1XY2tOu2C+9BYX9NIg9GQrJjWeFx1F6iVMlqQf16iE
   FeZIJ/q45KT8srrpNoZEweclqW6/IgDwILlrf2PhR3YRqmfgUjWw+JFJd
   vnqR+qc7POau0F6ZjZBuEExxi2bYo4RdW/B59fZDFg9e4jRMNmaV0hxbY
   4T9K5aT46xuVyZtpL0uCtPhWIjT3Fp3A3BdhLxBd8lUZW9ywQKEFXgotv
   A==;
X-CSE-ConnectionGUID: Z/yTwlNDRwOIckLxomg4uw==
X-CSE-MsgGUID: h2adqAx2Q3uNVRKsNDCx1A==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="10322573"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="10322573"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 02:15:03 -0700
X-CSE-ConnectionGUID: 1OE4lx6oSeCzJPo6fSYBAg==
X-CSE-MsgGUID: QMv4+h7xQCaxbQcEN5nmxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="18410539"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2024 02:15:01 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/4] ASoC: topology: Remove obsolete ABI v4 structs
Date: Wed,  3 Apr 2024 11:16:29 +0200
Message-Id: <20240403091629.647267-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240403091629.647267-1-cezary.rojewski@intel.com>
References: <20240403091629.647267-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are no users of soc-topology ABI v4 since kernel v5.4 and no
kernel code makes use of them.

Cc: Curtis Malainey <cujomalainey@chromium.org>
Cc: Łukasz Majczak <lmajczak@google.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/uapi/sound/asoc.h | 56 ---------------------------------------
 1 file changed, 56 deletions(-)

diff --git a/include/uapi/sound/asoc.h b/include/uapi/sound/asoc.h
index 10851bca7174..99333cbd3114 100644
--- a/include/uapi/sound/asoc.h
+++ b/include/uapi/sound/asoc.h
@@ -576,60 +576,4 @@ struct snd_soc_tplg_dai {
 	struct snd_soc_tplg_private priv;
 } __attribute__((packed));
 
-/*
- * Old version of ABI structs, supported for backward compatibility.
- */
-
-/* Manifest v4 */
-struct snd_soc_tplg_manifest_v4 {
-	__le32 size;		/* in bytes of this structure */
-	__le32 control_elems;	/* number of control elements */
-	__le32 widget_elems;	/* number of widget elements */
-	__le32 graph_elems;	/* number of graph elements */
-	__le32 pcm_elems;	/* number of PCM elements */
-	__le32 dai_link_elems;	/* number of DAI link elements */
-	struct snd_soc_tplg_private priv;
-} __packed;
-
-/* Stream Capabilities v4 */
-struct snd_soc_tplg_stream_caps_v4 {
-	__le32 size;		/* in bytes of this structure */
-	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	__le64 formats;	/* supported formats SNDRV_PCM_FMTBIT_* */
-	__le32 rates;		/* supported rates SNDRV_PCM_RATE_* */
-	__le32 rate_min;	/* min rate */
-	__le32 rate_max;	/* max rate */
-	__le32 channels_min;	/* min channels */
-	__le32 channels_max;	/* max channels */
-	__le32 periods_min;	/* min number of periods */
-	__le32 periods_max;	/* max number of periods */
-	__le32 period_size_min;	/* min period size bytes */
-	__le32 period_size_max;	/* max period size bytes */
-	__le32 buffer_size_min;	/* min buffer size bytes */
-	__le32 buffer_size_max;	/* max buffer size bytes */
-} __packed;
-
-/* PCM v4 */
-struct snd_soc_tplg_pcm_v4 {
-	__le32 size;		/* in bytes of this structure */
-	char pcm_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	char dai_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	__le32 pcm_id;		/* unique ID - used to match with DAI link */
-	__le32 dai_id;		/* unique ID - used to match */
-	__le32 playback;	/* supports playback mode */
-	__le32 capture;		/* supports capture mode */
-	__le32 compress;	/* 1 = compressed; 0 = PCM */
-	struct snd_soc_tplg_stream stream[SND_SOC_TPLG_STREAM_CONFIG_MAX]; /* for DAI link */
-	__le32 num_streams;	/* number of streams */
-	struct snd_soc_tplg_stream_caps_v4 caps[2]; /* playback and capture for DAI */
-} __packed;
-
-/* Physical link config v4 */
-struct snd_soc_tplg_link_config_v4 {
-	__le32 size;            /* in bytes of this structure */
-	__le32 id;              /* unique ID - used to match */
-	struct snd_soc_tplg_stream stream[SND_SOC_TPLG_STREAM_CONFIG_MAX]; /* supported configs playback and captrure */
-	__le32 num_streams;     /* number of streams */
-} __packed;
-
 #endif
-- 
2.25.1

