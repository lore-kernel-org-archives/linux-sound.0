Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCEB1E289F
	for <linux-sound@vger.kernel.org>; Fri,  2 Aug 2024 12:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722602793; cv=none; b=iiyRB2YA1/tYtySRKyhM3WDhiMBcLO+X+9OjGR5wrech1qrfgHsRx1SoFm0IKCB+aVhPXckriyGojfyYTVEvh2oehl+3VbEQwkaSUUagNvB0KVCHTnrm4e5JawGCE7m1KjRQNylY2DfZ06n+aNk5mhrjLNJP9nKagLRrfAvA/uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722602793; c=relaxed/simple;
	bh=z+Sp/e05K5Vs3Docgs64RMH7lUs8XWU9ixiBYYv/QaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SjO6QBantW8mJTb7levtXLXLfiQK7kfY7lkOjdKI3tKPs3wuQbPDoGzvZbL0CV6AkY8N9zrKt/YhejyrCFbWkm452OZVCp1CCg6B6veEkMwp2YqdysAEB/QymRp8MjTlAzRgkudDzpuLjDZG+RdSM3Wh9ZFKS4Lei5tvtIkkiIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a6h+j6Yv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a6h+j6Yv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722602792; x=1754138792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z+Sp/e05K5Vs3Docgs64RMH7lUs8XWU9ixiBYYv/QaI=;
  b=a6h+j6YvPdZXEeqJ9JL36dYcA9HsnxjijJ+3J+RHmbZDg3MCmpyw9RX5
   IdUpSjRBeAV7xDd+DfSE3CqkXdsD3xqGzFeWcNsmQZfiIr8rVoPfRVVnJ
   Ifh00K4W/zwySA7nnTkYYlHaC/Snu47g7wFSrzbLI5+hlaHyB433iF576
   9dHZLanShcAG4cQMQ+XDLkqUKK+q9IM8pWlPdEnbsXv+UekXsH0b8eyM2
   ZtQw6lZJbojpuaYjMHUd5WIuQ6U++la6/v2H2Rwt76im9ufd6d2Izv56u
   e9VhbXxFfnZN6KrOgY9nnIWdPW6W9wldkSLe5JU9594Srtf8+41nAJS7T
   A==;
X-CSE-ConnectionGUID: VYKbMWVUTyqFICMunVhVhA==
X-CSE-MsgGUID: 8rB8Sep4TI2NNrRqcwM7fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20199395"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="20199395"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:46:32 -0700
X-CSE-ConnectionGUID: pZCeloacRgK9OLuASgvsNg==
X-CSE-MsgGUID: XTmyxUFeRwGIlTlhgtT5BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="60407902"
Received: from ltuz-desk.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.89])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:46:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 4/4] ASoC: SOF: sof-audio.h: optimize snd_sof_pcm_stream_pipeline_list
Date: Fri,  2 Aug 2024 14:46:09 +0200
Message-ID: <20240802124609.188954-5-pierre-louis.bossart@linux.intel.com>
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

Invert members to remove hole.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 49be02234fc3..b9b8b64768b9 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -314,12 +314,12 @@ struct sof_token_info {
 
 /**
  * struct snd_sof_pcm_stream_pipeline_list - List of pipelines associated with a PCM stream
- * @count: number of pipeline widgets in the @pipe_widgets array
  * @pipelines: array of pipelines
+ * @count: number of pipeline widgets in the @pipe_widgets array
  */
 struct snd_sof_pcm_stream_pipeline_list {
-	u32 count;
 	struct snd_sof_pipeline **pipelines;
+	u32 count;
 };
 
 /* PCM stream, mapped to FW component  */
-- 
2.43.0

