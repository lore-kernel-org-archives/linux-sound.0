Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351A91DED63
	for <linux-sound@vger.kernel.org>; Mon, 15 Dec 2025 11:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797636; cv=none; b=C17T9YZ3WJa3L+xIaHLtOcagZj6YAmtTKlTUrF7L610QW2rofjV8cy2HZYviC/29F0S6AbwQM6fS0Je6RIhE9QgnMvKsFrt3Zs5MMvdeZxMUKQapD+W5A3v2qQGTVDu4vRllHF/E6UJx3KgMf2NK6j+deZ2frPy6s7tdVSyNr9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797636; c=relaxed/simple;
	bh=ikaFf617sSEwv6QrXzPONCzBKv0q0xAiNPJouaeY0eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NzV+2T43BlGmb54xaiIMg8hTD8Re9lQ6AIy0+pHsEFIcpAQWEm7MZGxxRNkasTnKkTqn63gpkqRdl4AoNpPfe9gQYdJPsbDXWSeLqAbvHkOi7/4Lhqsr+y9V0CNPyIT/09reKA+eks2xfSwO4k8x9zpqBjvHnCR4p12PODbjlVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RRWs13kZ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRWs13kZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765797635; x=1797333635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ikaFf617sSEwv6QrXzPONCzBKv0q0xAiNPJouaeY0eI=;
  b=RRWs13kZl0cMX2QNCijwQShuLxoXdGUJhLVoK4YVoovox+PitSGPoECZ
   P/Lh9MNjmx1tHdExc0FRD2evNS/ctrBpFfHPKxqUIf6VaeXrVNfwYDB7j
   D9vWrObj9Ac/cTtxVqwOSWymClZOHdh2aDFlxpgHKCt9RBkqGfQOOnFMG
   BxoS2ezHxOtt44pzOYGWdB7a+5IGNazbD5B8KBgDzy/RZLY+Ie9ZfyT48
   rR83xbmgs+co+mu/rSem2Szx7Y7FqLBJgdOQHSGSf3wRhzqsqRkuX4cDc
   zJNkSDrecYHJ7YvhCRBuJdMUjLYbYLReS/F/vGdhy/2jY161sE4pziBnT
   w==;
X-CSE-ConnectionGUID: 4J9g+1OMRhu/ZgF5HAqd5g==
X-CSE-MsgGUID: ybvsLuUNSpK9rWmBRmUq7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67731757"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67731757"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:20:35 -0800
X-CSE-ConnectionGUID: Ng/cnv9QS5S6fsByEUcCqA==
X-CSE-MsgGUID: PB/q4UhCRg+7yrRWKybeTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197690215"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.95])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 03:20:33 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 3/8] ASoC: SOF: ipc4-control: Use the correct size for scontrol->ipc_control_data
Date: Mon, 15 Dec 2025 13:20:43 +0200
Message-ID: <20251215112048.16331-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215112048.16331-1-peter.ujfalusi@linux.intel.com>
References: <20251215112048.16331-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The size of the data behind scontrol->ipc_control_data is stored in
scontrol->size, use this when copying data for backup/restore.

Fixes: 03f537690f40 ("ASoC: sof: Improve sof_ipc4_bytes_ext_put function")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-control.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 0a05f66ec7d9..80111672c179 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -66,7 +66,7 @@ static int sof_ipc4_set_get_kcontrol_data(struct snd_sof_control *scontrol,
 		 * configuration
 		 */
 		memcpy(scontrol->ipc_control_data, scontrol->old_ipc_control_data,
-		       scontrol->max_size);
+		       scontrol->size);
 		kfree(scontrol->old_ipc_control_data);
 		scontrol->old_ipc_control_data = NULL;
 		/* Send the last known good configuration to firmware */
@@ -567,7 +567,7 @@ static int sof_ipc4_bytes_ext_put(struct snd_sof_control *scontrol,
 	if (!scontrol->old_ipc_control_data) {
 		/* Create a backup of the current, valid bytes control */
 		scontrol->old_ipc_control_data = kmemdup(scontrol->ipc_control_data,
-							 scontrol->max_size, GFP_KERNEL);
+							 scontrol->size, GFP_KERNEL);
 		if (!scontrol->old_ipc_control_data)
 			return -ENOMEM;
 	}
@@ -575,7 +575,7 @@ static int sof_ipc4_bytes_ext_put(struct snd_sof_control *scontrol,
 	/* Copy the whole binary data which includes the ABI header and the payload */
 	if (copy_from_user(data, tlvd->tlv, header.length)) {
 		memcpy(scontrol->ipc_control_data, scontrol->old_ipc_control_data,
-		       scontrol->max_size);
+		       scontrol->size);
 		kfree(scontrol->old_ipc_control_data);
 		scontrol->old_ipc_control_data = NULL;
 		return -EFAULT;
-- 
2.52.0

