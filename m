Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F9120CCE5
	for <linux-sound@vger.kernel.org>; Thu,  7 Nov 2024 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730986782; cv=none; b=syeQv+PbgPvCyvK7r54oPfvxDCTLtoxuKWIO1Zr9SodG9z8IRCibKjK35VtGf5j4nb8kR+qMYDFtkgwnHJMEOUed2aYzgmH8sxT7ze2SDPeG2YM/akNHjUmC/CQ9pYt8oKT2TjMQR/8lAeFGQxEIeL/nvz3E29B3PRkNJ6kM5Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730986782; c=relaxed/simple;
	bh=2BlsdBJChCstmGMmVv8EtRoLmNdjk249JBdgHPL8c0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DOoW615B1hlcG9u91OA2ohWOUxxbPPXnadBsmJPT4ysTdHdaUL/eBWjpc6+5HDcSAUoiU83fpqjczhEW3wzFxtN9JL9q+jncabMRtnrBSxbUFK/YXhJUkyo9dY+FTbjqJ3jtDyAbY1+X6R7CCVqKFXYkR4bb32S6+1ya80m7R58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUbjUK3k; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUbjUK3k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730986781; x=1762522781;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2BlsdBJChCstmGMmVv8EtRoLmNdjk249JBdgHPL8c0M=;
  b=QUbjUK3kXXUKhUazVYVP+EnLTILIBK+XhIhd9x+oJHdMMdR9zaEjlDPe
   Hf7TFjyaLKdfTqbZAMWREoP1S6avhEOHaXHzXYAH6wDXnxwknI5J/SlXz
   CsfYN7r1DAf6Ub4z5hieGb7+WgB+SCA9c3QRednvrGd76rMJjHhI07kAT
   Zn1D2YkQyN3sLofLekZzpxwxh7Bk4Yoo7CM4AYO8WOIkBQdP7PEHEjg/i
   dX+ojnShgnRwaR7D3/VgMqX/7R74EAQWczha3wjsnXhJN4RpH63LsS89L
   +ErOLaEak5qGa1wCSii9cXy7uymZHsb0qeskip8l8/4ymO1zhy2xiWnG+
   g==;
X-CSE-ConnectionGUID: J0U/+ElfRQOI6fy44kKC4Q==
X-CSE-MsgGUID: DxoKcGpUQCeMwTIrtB2rQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="30711596"
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="30711596"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 05:39:41 -0800
X-CSE-ConnectionGUID: z80YuWsaRw6zq5e7eRb6gA==
X-CSE-MsgGUID: lm3R4AKlQYOdzkIlUalEhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,266,1728975600"; 
   d="scan'208";a="90205096"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.205])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 05:39:38 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	liam.r.girdwood@intel.com,
	cujomalainey@chromium.org,
	daniel.baluta@nxp.com
Subject: [PATCH 1/2] ASoC: SOF: stream-ipc: Check for cstream nullity in sof_ipc_msg_data()
Date: Thu,  7 Nov 2024 15:39:31 +0200
Message-ID: <20241107133932.23252-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241107133932.23252-1-peter.ujfalusi@linux.intel.com>
References: <20241107133932.23252-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nullity of sps->cstream should be checked similarly as it is done in
sof_set_stream_data_offset() function.
Assuming that it is not NULL if sps->stream is NULL is incorrect and can
lead to NULL pointer dereference.

Fixes: ef8ba9f79953 ("ASoC: SOF: Add support for compress API for stream data/offset")
Cc: stable@vger.kernel.org
Reported-by: Curtis Malainey <cujomalainey@chromium.org>
Closes: https://github.com/thesofproject/linux/pull/5214
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/sof/stream-ipc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/stream-ipc.c b/sound/soc/sof/stream-ipc.c
index 794c7bbccbaf..8262443ac89a 100644
--- a/sound/soc/sof/stream-ipc.c
+++ b/sound/soc/sof/stream-ipc.c
@@ -43,7 +43,7 @@ int sof_ipc_msg_data(struct snd_sof_dev *sdev,
 				return -ESTRPIPE;
 
 			posn_offset = stream->posn_offset;
-		} else {
+		} else if (sps->cstream) {
 
 			struct sof_compr_stream *sstream = sps->cstream->runtime->private_data;
 
@@ -51,6 +51,10 @@ int sof_ipc_msg_data(struct snd_sof_dev *sdev,
 				return -ESTRPIPE;
 
 			posn_offset = sstream->posn_offset;
+
+		} else {
+			dev_err(sdev->dev, "%s: No stream opened\n", __func__);
+			return -EINVAL;
 		}
 
 		snd_sof_dsp_mailbox_read(sdev, posn_offset, p, sz);
-- 
2.47.0

