Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC8F442372
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 08:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363000; cv=none; b=kkR7B0Nkp2BhpKMR34hjwGYfQ7SoHqYA23qYZ+4dtk0Tq8kwXmnu2G3VJfjABH1cmZw16X0DeC7K4NTrjrZpJd3ISF84/onJ+FLxOojaREfwG4/aJ73/IXlz6xlJQmeVNCQKEiElH6cDRWWCFKFUVCAWQfse4oWOOJSQ5PoNdQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363000; c=relaxed/simple;
	bh=YZBzxgUi3DYsie3N366Lk1fsVfKGjWuoLKdgmiL5bhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RseP+3upQdqK4lt+j06oEQy+AjXyHA4mIDKDih3qgUf3GJEqU+Lj4JN6QbVpkXV7LoX9odz6nEzt8JXSMPDDCpF+1Pa8X5LeEXLj9i6Jvp+VHO6XvoIrGQsIz5mIGts3dNxLAVMbguvoQTekHUrr8dlCsv2EbEBAtLUwHMiZGOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6v9D7ko; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6v9D7ko"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791362999; x=1822898999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YZBzxgUi3DYsie3N366Lk1fsVfKGjWuoLKdgmiL5bhM=;
  b=J6v9D7koOb6uMojyWmmPQZe0ePaSG4KpnMtof2BdM8zylIZBYuPjT/AJ
   fF//61rFM8WDeqUYsnkXkRlrIn262oq3zd/A4q5mzY2srVJHXwIrG+H0c
   5bHISnyVJjTCkKQUwk+BFJv6AkY1YC9V7UXGMRAl3MjEMdA+u9gf5ikUW
   HuMbTRwNWEg7PkaGv6akjqKiG6Ebbw6+Z6R9BLI4jg5OKLEqGiBpCw3fY
   NNZND1JG9v+PXXgvKNykRzj2OUOrtDdOHPn093zRlJLgYWQ/zz9C9eaQI
   9qcn1dcdQev1739LfTUJU2Rv+AkfHQ4oV/kCHW9z0+Ep8Pf3LoWWPOLbV
   g==;
X-CSE-ConnectionGUID: /bgQ9IJpRv+Eys+EV5Lgnw==
X-CSE-MsgGUID: wL87bR3nRYmQ+VerQ7OwPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="113885"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="113885"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:49:59 -0700
X-CSE-ConnectionGUID: qDWddizxQPa5RukMcMLC7w==
X-CSE-MsgGUID: h+OC/L9rSMeP3USf8PqJFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="280670566"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 01:49:56 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v5 07/28] ASoC: soc-compress: Stop running dpcm on free
Date: Wed,  7 Oct 2026 11:49:34 +0300
Message-ID: <20261007084955.1256-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
References: <20261007084955.1256-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the last trigger that the compr device received is a DRAIN then the
DPCM is left in running state (no stop trigger is sent).
Before we execute the free we need to send a STOP trigger to make sure that
both BE and FE is in expected state and prepared for closing.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/soc-compress.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 9fd2eeeeabb4..a941ed0908c6 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -312,6 +312,16 @@ static int soc_compr_free_fe(struct snd_compr_stream *cstream)
 	struct snd_soc_dpcm *dpcm;
 	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
 
+	/*
+	 * The core will not send a STOP trigger on free if the device is in
+	 * DRAIN state, but we need to stop BE and FE before we can proceed to
+	 * free the stream.
+	 * Run the STOP trigger if the DPCM state is START (DRAIN is not
+	 * changing the DPCM state).
+	 */
+	if (fe->dpcm[stream].state == SND_SOC_DPCM_STATE_START)
+		cstream->ops->trigger(cstream, SNDRV_PCM_TRIGGER_STOP);
+
 	snd_soc_card_mutex_lock(fe->card);
 
 	snd_soc_dpcm_mutex_lock(fe);
-- 
2.56.0

