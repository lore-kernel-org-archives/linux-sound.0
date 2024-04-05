Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C21611E
	for <linux-sound@vger.kernel.org>; Fri,  5 Apr 2024 09:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712308089; cv=none; b=ZdZlMAaAL3oMWC2Vwr3Kizp7gSk6vyzNnM63/KCajQcmjuapWJGUIaU3Ltyue6wu9vuneTnysFsCDH/WTb+gVDouLncOj1W+O1lqG4uBd59xmztnZ8/7aSBs3CDOqpbQn8Z9cdVyT0cyvfVWtXqW6wIN/cetFZKCQPoTL3QnYe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712308089; c=relaxed/simple;
	bh=dxCLzaInWEDf5H8sovQbT5x3OpdikXTGyLfkyz6cQ0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O6vpf1mPM19g7RLKaA5FAKAUqUvxdHIrJr3qJduocyQha+z8WymfOtH8P1kn5RnmB5Lg5doIQOaD3bm9YshmQHjnKobALPQD9v6KOmYaltZE8EAjIsZ+DSH2Xue8iH/+kEC/7dsKujp8hxpKhNkV8RSx2OQm6zl1YMpnLYhFAAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mv3U8p6q; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mv3U8p6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712308088; x=1743844088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dxCLzaInWEDf5H8sovQbT5x3OpdikXTGyLfkyz6cQ0s=;
  b=mv3U8p6qVuBLk5tyJIYKaIdgxYtaGwLziforeWXojqP2nU9aesLfQbgW
   GDJWUQVVupaM6/R0DcxBNQ7UsHHlOqqop15OWb9PB++ONxOVxvOny/oh5
   nH4mBKwqOGGaQ5Y8TOHkQPhEbMqgcdiHsoaQkztgmRWl+XjQBv8NwGr0I
   z1HZV+tJSPbjBYOcxAwyVo5g9+0Z9c0nx0Z51XNoLWFIIL726FkdUHylZ
   9f46yFrBnoJvqwDny4ir5NszScrvRn6VWZ+BFbsTKLX/hXkFAV25vlD0W
   LOGlPBkXf2R47jZzvr4RdCa0moFUfiYf9qzwBJ2TEjQ9I9o/F3RdwbtPE
   Q==;
X-CSE-ConnectionGUID: Rs0oDMJnR5GPCKm4EgMtbA==
X-CSE-MsgGUID: uKOHv+eaQSqq5Swxb+6STg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7787403"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7787403"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 02:08:08 -0700
X-CSE-ConnectionGUID: 2UhNxsTeSLyumSvGXGHIVg==
X-CSE-MsgGUID: RZThk3YiQX2P0wyvKq62Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19042412"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orviesa009.jf.intel.com with ESMTP; 05 Apr 2024 02:08:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 01/13] ASoC: Intel: avs: Restore stream decoupling on prepare
Date: Fri,  5 Apr 2024 11:09:17 +0200
Message-Id: <20240405090929.1184068-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240405090929.1184068-1-cezary.rojewski@intel.com>
References: <20240405090929.1184068-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Revert changes from commit b87b8f43afd5 ("ASoC: Intel: avs: Drop
superfluous stream decoupling") to restore working streaming during S3.

Fixes: b87b8f43afd5 ("ASoC: Intel: avs: Drop superfluous stream decoupling")
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 2cafbc392cdb..72f1bc3b7b1f 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -356,6 +356,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 					   stream_info->sig_bits);
 	format_val = snd_hdac_stream_format(runtime->channels, bits, runtime->rate);
 
+	snd_hdac_ext_stream_decouple(bus, link_stream, true);
 	snd_hdac_ext_stream_reset(link_stream);
 	snd_hdac_ext_stream_setup(link_stream, format_val);
 
@@ -611,6 +612,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct hdac_ext_stream *host_stream;
 	unsigned int format_val;
+	struct hdac_bus *bus;
 	unsigned int bits;
 	int ret;
 
@@ -620,6 +622,8 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	if (hdac_stream(host_stream)->prepared)
 		return 0;
 
+	bus = hdac_stream(host_stream)->bus;
+	snd_hdac_ext_stream_decouple(bus, data->host_stream, true);
 	snd_hdac_stream_reset(hdac_stream(host_stream));
 
 	stream_info = snd_soc_dai_get_pcm_stream(dai, substream->stream);
-- 
2.25.1

