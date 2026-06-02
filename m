Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81853BF676
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 08:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387990; cv=none; b=S74lk/+A1LIjQI7ZqdTOSlu35OBlNhfIbvySblAt5vKOXdFV2mIJdPpfWPEVEfg3UVdBPzn8ndDz3QpbFyKOKHVCICRAbxfFvK7Ppx09Zgcee6bv1dPuygYrsibAZZZI7abMfn/7S8cqa33YcaCch/ouwoRA8r/Jw3q/hegSwcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387990; c=relaxed/simple;
	bh=UeDIkspKuUow/0IGBpq3Jeki/emZV6RFum5eICMqBVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oX8MZfQAzIKvG/r+x8K4wKZs1k3K3QRcaWjq9EMEGKgohk4Nd1haJUz5JniulTaEQEITdROu8mMjGIqJG99na0uL0j+m+VLWaJIYoPpZQNjPWWR7dZMp6ZMlSxs10duwmwAn5rXKqR49W2l1/pcX4e/q4IJPau/qBL/k+uUqVFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0g3Y4Du; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0g3Y4Du"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780387988; x=1811923988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UeDIkspKuUow/0IGBpq3Jeki/emZV6RFum5eICMqBVQ=;
  b=U0g3Y4DuZzkJ3Sjm107sfFgVLG2hcEKF1oHxSei626lvbMPFjJ7H2ksm
   F+KtYnK+wMbQnCJ+luVJYSp7hassynHY52c9lIa7S564itdzrSU1ppfKX
   biGkztSdytncwGcQnJsPXbwEEnJ1F9aFdQECcA4j/jXxfFZLWL6hzZico
   mmCZgSXUWNBn5jHTwl0m/jzAm6DswgD/9c3mUD1fhqfCTbCv85cUBXAFT
   3rC08AAcc4caFFl19nmxwBlGKoI5M+3rWZv7UoHXZBuGlG1oMLRP5sk60
   kZ3rPhFw5shkSS82TdhgYnMSGIZXROrV0LJsQpIsBfCPnI4mH98mfzBeA
   w==;
X-CSE-ConnectionGUID: PJcHr8METES3GBztPUL7ng==
X-CSE-MsgGUID: LdKC42i0QO+nyiMnYQ5kgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91742922"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="91742922"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 01:13:06 -0700
X-CSE-ConnectionGUID: vo7qyjgURZa2ioZIXYu8XQ==
X-CSE-MsgGUID: 8xqxcjz3TkSxaf4EDGeIvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="243949973"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa007.jf.intel.com with ESMTP; 02 Jun 2026 01:13:04 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	andriy.shevchenko@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 7/7] ASoC: Intel: catpt: Cleanup components_kcontrols[]
Date: Tue,  2 Jun 2026 10:13:50 +0200
Message-Id: <20260602081350.1752773-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602081350.1752773-1-cezary.rojewski@intel.com>
References: <20260602081350.1752773-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment and drop redundant comments.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/pcm.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index bfa94f5ffc8d..01b015b4584b 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -983,14 +983,12 @@ static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(catpt_volume_tlv, -9000, 300, 1);
 }
 
 static const struct snd_kcontrol_new component_kcontrols[] = {
-/* Master volume (mixer stream) */
-CATPT_VOLUME_CTL("Master Playback Volume", MIXER),
-/* Individual volume controls for offload and capture */
-CATPT_VOLUME_CTL("Media0 Playback Volume", OFFLOAD1),
-CATPT_VOLUME_CTL("Media1 Playback Volume", OFFLOAD2),
-CATPT_VOLUME_CTL("Mic Capture Volume", CAPTURE1),
-SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&(bool[1]) {0},
-		    catpt_loopback_mute_get, catpt_loopback_mute_put),
+	CATPT_VOLUME_CTL("Master Playback Volume", MIXER),
+	CATPT_VOLUME_CTL("Media0 Playback Volume", OFFLOAD1),
+	CATPT_VOLUME_CTL("Media1 Playback Volume", OFFLOAD2),
+	CATPT_VOLUME_CTL("Mic Capture Volume", CAPTURE1),
+	SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&(bool[1]) {0},
+			    catpt_loopback_mute_get, catpt_loopback_mute_put),
 };
 
 static const struct snd_soc_dapm_widget component_widgets[] = {
-- 
2.34.1

