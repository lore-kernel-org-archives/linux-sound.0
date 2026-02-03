Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8B6318EFA
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 11:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118856; cv=none; b=CMNNoHDPMYvW5eNAml18tpS02ZkkEDeV2sTbxsj+Mjn4UQuZE+dqo7fOK+ziVFK5Qvuc1JwCeK0Rl5d4/RzCF+TzlHtfXukLe43QU2n90Gi1aFk4rA3/jb6b03ZeHSvdmiS+hIk+L1yczqhkeftOTOSWgz46wyx3pT4U/eZrDrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118856; c=relaxed/simple;
	bh=r4ZR/J08KuslVRCeD2qjjuqhxgUQOzRj0Nz2QAXG9sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KEBiUH6wU3f7yb2PI37m8wR1T6XT0T+95S0+kslVzH7hzsrH04sF5KB+1pOTl7fleOz/EkFFjk3lAJRXw3iIW+8R9guJhKorBBV80UBUSUyf5N+M5KbJfFBUSywzPAEl53LQ4CTftWluoCY9gxU6hanpV9K0vA2Yz7JI68Z7wmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6U+AwpQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6U+AwpQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770118855; x=1801654855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r4ZR/J08KuslVRCeD2qjjuqhxgUQOzRj0Nz2QAXG9sM=;
  b=f6U+AwpQk+Rpw4Qqx+KCaaw8NUkrG5+cdOezkkpnEJyrDEURXEhevmYs
   vAlzp6MutomwKXzHwsGPY1SGxZLJ+zy775Ga2c9TvWhsdMbh4b2pq86qV
   uvzslvVb+Nl53SBydTbTOrBsjycrOF0PQdIoaJ+HYzRD1e6DGYkIiBmZc
   UxVh0/zmqXu0GXm3bFB7P9JSiuAYfFa45OypZ7ltEFaEc/ANznM0iIZ2q
   sAVBn9QpbSpDzTKCkM5XxmOLOdFtuHxrns9gzNtfYgeOa3luFBcN4L21P
   UES+kFOnnK99+XOGh/f1QZ6sqCySx48TuYf8H1YqvmnXcYt4N8WclsE8Q
   Q==;
X-CSE-ConnectionGUID: DI4lTehHSzeLLJEXntOfKA==
X-CSE-MsgGUID: wiS+oL9kQdueW5Ed6B7Qwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82023854"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="82023854"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 03:40:55 -0800
X-CSE-ConnectionGUID: OREo9wjLSYCb5SvevGAaQw==
X-CSE-MsgGUID: Yib56Aj9TPGwzh39dWGMDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209547600"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 03:40:53 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH 1/3] ASoC: SOF: Intel: add hda_dsp_stream_pair_get/put helpers
Date: Tue,  3 Feb 2026 19:40:25 +0800
Message-ID: <20260203114027.3742558-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203114027.3742558-1-yung-chuan.liao@linux.intel.com>
References: <20260203114027.3742558-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently, hda_dsp_stream_get/put are used to get/put the host dma.
However, we may want to use a hda stream that both host and link dma are
available. Add helper to find the hda stream and reserve/release it.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 41 +++++++++++++++++++++++++++++---
 sound/soc/sof/intel/hda.h        |  3 +++
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 8fdaf1fdc338..36b647d987fc 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -210,8 +210,8 @@ int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
 }
 
 /* get next unused stream */
-struct hdac_ext_stream *
-hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
+static struct hdac_ext_stream *
+_hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags, bool pair)
 {
 	const struct sof_intel_dsp_desc *chip_info =  get_chip_info(sdev->pdata);
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
@@ -233,7 +233,14 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 			if (hda_stream->host_reserved)
 				continue;
 
+			if (pair && hext_stream->link_locked)
+				continue;
+
 			s->opened = true;
+
+			if (pair)
+				hext_stream->link_locked = true;
+
 			break;
 		}
 	}
@@ -264,14 +271,27 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 	return hext_stream;
 }
 
+struct hdac_ext_stream *
+hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
+{
+	return _hda_dsp_stream_get(sdev, direction, flags, false);
+}
+
+struct hdac_ext_stream *
+hda_dsp_stream_pair_get(struct snd_sof_dev *sdev, int direction, u32 flags)
+{
+	return _hda_dsp_stream_get(sdev, direction, flags, true);
+}
+
 /* free a stream */
-int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
+static int _hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag, bool pair)
 {
 	const struct sof_intel_dsp_desc *chip_info =  get_chip_info(sdev->pdata);
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct sof_intel_hda_stream *hda_stream;
 	struct hdac_ext_stream *hext_stream;
+	struct hdac_ext_stream *link_stream;
 	struct hdac_stream *s;
 	bool dmi_l1_enable = true;
 	bool found = false;
@@ -292,6 +312,8 @@ int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
 		if (s->direction == direction && s->stream_tag == stream_tag) {
 			s->opened = false;
 			found = true;
+			if (pair)
+				link_stream = hext_stream;
 		} else if (!(hda_stream->flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE)) {
 			dmi_l1_enable = false;
 		}
@@ -312,9 +334,22 @@ int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
 		return -ENODEV;
 	}
 
+	if (pair)
+		snd_hdac_ext_stream_release(link_stream, HDAC_EXT_STREAM_TYPE_LINK);
+
 	return 0;
 }
 
+int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
+{
+	return _hda_dsp_stream_put(sdev, direction, stream_tag, false);
+}
+
+int hda_dsp_stream_pair_put(struct snd_sof_dev *sdev, int direction, int stream_tag)
+{
+	return _hda_dsp_stream_put(sdev, direction, stream_tag, true);
+}
+
 static int hda_dsp_stream_reset(struct snd_sof_dev *sdev, struct hdac_stream *hstream)
 {
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 3be39c229c9f..9234e73f30fb 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -694,7 +694,10 @@ u64 hda_dsp_get_stream_ldp(struct snd_sof_dev *sdev,
 
 struct hdac_ext_stream *
 	hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags);
+struct hdac_ext_stream *
+	hda_dsp_stream_pair_get(struct snd_sof_dev *sdev, int direction, u32 flags);
 int hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stream_tag);
+int hda_dsp_stream_pair_put(struct snd_sof_dev *sdev, int direction, int stream_tag);
 int hda_dsp_stream_spib_config(struct snd_sof_dev *sdev,
 			       struct hdac_ext_stream *hext_stream,
 			       int enable, u32 size);
-- 
2.43.0

