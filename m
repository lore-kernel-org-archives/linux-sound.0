Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2259713C9D9
	for <linux-sound@vger.kernel.org>; Thu, 27 Jun 2024 10:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483513; cv=none; b=N5zhyk0oc1D2WZQ74erRaGuYs+RY3Tzy8XVTdZgDAJxNAvQqidqdfKixqIYFBJwBg7bl4Gil22qK8nhHMdBjJpYxu8Xt6Qh9Zdk7tlXj8JVHfbc5/PP2wWWBxBfZ3fdt5cykIKjti8QI5pBb2e7xJO7EudxSw1HOtHGx3X02qms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483513; c=relaxed/simple;
	bh=k2x0e/4Y/a3+pPZ4CWk+KqwHvptBYN8i0AcquIEu8/w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q7bnhsIO/To5/ZnYibH6Uzzu59N06zJ1D9Y9wGDDRLwAl0G5Kg88HTfiGRsi4ARBmShxNWIk3XL6o8UnaPw/xZTj3Tsj8KrET7jWrQDCSvRwvDSGp8a4PjO9wVFnMLXIaXQ/qxgi0/2EZFmPf7oG7lExB7KNf3+l3nIlUPk5mRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cHBQ87Q6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cHBQ87Q6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719483512; x=1751019512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k2x0e/4Y/a3+pPZ4CWk+KqwHvptBYN8i0AcquIEu8/w=;
  b=cHBQ87Q6hTLtYgJ6GP3W0YGnE6bqm7Xv0txyJJ6dNdga2ybliNNwwG0B
   h8Mk4CWHyHO9VOhjGWr5dk+IyDGAsPv7L9dqgHgDb+MlxOKe/z91U/Ntf
   dIKCgH4W2+LJ4yt6DFQiinnSofT/CBErhqKSrCltyMVC+vrkIel1jxrx5
   YqI+bZ+OH0adGCNJYQWkYRiCstCPEcXJDFZ/1ZadnQrK4Gd/gHHwQC/3h
   m8cvpWy9ap2aKAUsjFuSfxV4YEdb5HIQ7laE4o5gwqlvUWNZfXJ9G137z
   JrivR5+JvDDcuN01McrCtc1ifLTQHDhV6zes8oN7O4uVG/LFKUDJzEsQt
   Q==;
X-CSE-ConnectionGUID: UG20REkGQKO1PB3zMUhZSQ==
X-CSE-MsgGUID: ZDiSfn9iQYKTD5/PnVwUsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19487610"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19487610"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:18:32 -0700
X-CSE-ConnectionGUID: m7ErnX2VSpK1DkVtugwJAg==
X-CSE-MsgGUID: hhB197LHRLuI7AaVKa2iYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45080011"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:18:30 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 09/13] ASoC: topology: Rename function creating widget kcontrol
Date: Thu, 27 Jun 2024 12:18:46 +0200
Message-Id: <20240627101850.2191513-10-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627101850.2191513-1-amadeuszx.slawinski@linux.intel.com>
References: <20240627101850.2191513-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In following patches it will be reused to also create standalone
kcontrol, so it makes sense to name it in more generic way.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 72bd3823a0154..f85cf67f74b1e 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1096,7 +1096,7 @@ static int soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
 	return ret;
 }
 
-static int soc_tplg_dapm_widget_dmixer_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
+static int soc_tplg_control_dmixer_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
 {
 	struct snd_soc_tplg_mixer_control *mc;
 	struct soc_mixer_control *sm;
@@ -1153,7 +1153,7 @@ static int soc_tplg_dapm_widget_dmixer_create(struct soc_tplg *tplg, struct snd_
 	return soc_tplg_control_load(tplg, kc, &mc->hdr);
 }
 
-static int soc_tplg_dapm_widget_denum_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
+static int soc_tplg_control_denum_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
 {
 	struct snd_soc_tplg_enum_control *ec;
 	struct soc_enum *se;
@@ -1222,7 +1222,7 @@ static int soc_tplg_dapm_widget_denum_create(struct soc_tplg *tplg, struct snd_k
 	return soc_tplg_control_load(tplg, kc, &ec->hdr);
 }
 
-static int soc_tplg_dapm_widget_dbytes_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
+static int soc_tplg_control_dbytes_create(struct soc_tplg *tplg, struct snd_kcontrol_new *kc)
 {
 	struct snd_soc_tplg_bytes_control *be;
 	struct soc_bytes_ext *sbe;
@@ -1350,7 +1350,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 			kc[i].index = mixer_count;
 			kcontrol_type[i] = SND_SOC_TPLG_TYPE_MIXER;
 			mixer_count++;
-			ret = soc_tplg_dapm_widget_dmixer_create(tplg, &kc[i]);
+			ret = soc_tplg_control_dmixer_create(tplg, &kc[i]);
 			if (ret < 0)
 				goto hdr_err;
 			break;
@@ -1363,7 +1363,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 			kc[i].index = enum_count;
 			kcontrol_type[i] = SND_SOC_TPLG_TYPE_ENUM;
 			enum_count++;
-			ret = soc_tplg_dapm_widget_denum_create(tplg, &kc[i]);
+			ret = soc_tplg_control_denum_create(tplg, &kc[i]);
 			if (ret < 0)
 				goto hdr_err;
 			break;
@@ -1372,7 +1372,7 @@ static int soc_tplg_dapm_widget_create(struct soc_tplg *tplg,
 			kc[i].index = bytes_count;
 			kcontrol_type[i] = SND_SOC_TPLG_TYPE_BYTES;
 			bytes_count++;
-			ret = soc_tplg_dapm_widget_dbytes_create(tplg, &kc[i]);
+			ret = soc_tplg_control_dbytes_create(tplg, &kc[i]);
 			if (ret < 0)
 				goto hdr_err;
 			break;
-- 
2.34.1

