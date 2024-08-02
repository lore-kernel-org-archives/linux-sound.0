Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836A01C3781
	for <linux-sound@vger.kernel.org>; Fri,  2 Aug 2024 12:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722602790; cv=none; b=BfxemtxbjLrzCSkUG4jsOuV3RtO1gleRfzKKdArhGBA5wDGoMAGWklNocD0p86UDH6MSpTIZ3DuTW4iENxUAp39JFCS7WUcOIuUX3JjOz/D9DcKCU9zA/cLlAz7kPfXtNKdysoCngX/aBTOlMU4ZvwGMARslnekqFFpmdqhsc84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722602790; c=relaxed/simple;
	bh=5foePlp2+cV6Hcaj7mVVBKfwSze+k9WjEGjj4Z0R3rM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q3SJGLkf04Z1chlDJslpt3mz14yPBCeYLFXLjP4XzXLuidWWpCIbnl6OPT97agz6bujL7WoE6BphJlNbjhQaT27KrQAcc9/5+3dm8SA9330cTos6GG0R5UrGr37nZKv/il/RLioDmrhMdvnk11mNVXhbU9GBlBCDEGwh9uNuzfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqeQ+Kt3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqeQ+Kt3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722602790; x=1754138790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5foePlp2+cV6Hcaj7mVVBKfwSze+k9WjEGjj4Z0R3rM=;
  b=AqeQ+Kt3GaZKyR/UxwKxKDwplHPqYYa4ZKDPvz8/KDaWvI71Zjns5LIg
   xhV5RiyJwmq2iwfBlcTFVTq6jhhPqoGLGy2rnNcl0O0zgFT+/g4ADCFft
   XyErOC5fUDHSau0pp4+IrizqRVRiywxnW+Ak3rYi+mSpffwCJ6rG4k2WT
   JNf6wnf1w+eRQan4ZFBCG0bTluliOkISo/Cjk5gDOlG3EMMZJ+PhA2ouW
   Ztf+5ycYvIkqvcAgdIi3T9c1HLypYKC3mFfdz9LcKmkXuHRf45C3j0dFk
   SxaTkqlD4bBTVSALUFmIhgT3uEyNn1PFyh6jyV2x46dqsirQSbmjbx93E
   g==;
X-CSE-ConnectionGUID: h8tAnnN7SziREdv+fNKrVQ==
X-CSE-MsgGUID: 8505dMcST6WwT0CLRFW6IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20199390"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="20199390"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:46:29 -0700
X-CSE-ConnectionGUID: yAC/kB31QJmlUPxIkGuiRg==
X-CSE-MsgGUID: GpK/gihXTRaGT//6H3+6jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="60407888"
Received: from ltuz-desk.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.89])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:46:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 3/4] ASoC: SOF: sof-priv.h: optimize snd_sof_ipc_msg
Date: Fri,  2 Aug 2024 14:46:08 +0200
Message-ID: <20240802124609.188954-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240802124609.188954-1-pierre-louis.bossart@linux.intel.com>
References: <20240802124609.188954-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move waitq to make sure it's entirely in the same cache line, and move
ipc_complete to reduce padding.

struct snd_sof_ipc_msg {
	void *                     msg_data;             /*     0     8 */
	void *                     reply_data;           /*     8     8 */
	size_t                     msg_size;             /*    16     8 */
	size_t                     reply_size;           /*    24     8 */
	int                        reply_error;          /*    32     4 */
	bool                       ipc_complete;         /*    36     1 */

	/* XXX 3 bytes hole, try to pack */

	wait_queue_head_t          waitq;                /*    40    88 */
	/* --- cacheline 2 boundary (128 bytes) --- */
	void *                     rx_data;              /*   128     8 */

	/* size: 136, cachelines: 3, members: 8 */
	/* sum members: 133, holes: 1, sum holes: 3 */
	/* last cacheline: 8 bytes */
};

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 6ecc58e11592..843be3b6415d 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -425,11 +425,12 @@ struct snd_sof_ipc_msg {
 	size_t reply_size;
 	int reply_error;
 
+	bool ipc_complete;
+
+	wait_queue_head_t waitq;
+
 	/* notification, firmware initiated messages */
 	void *rx_data;
-
-	wait_queue_head_t waitq;
-	bool ipc_complete;
 };
 
 /**
-- 
2.43.0

