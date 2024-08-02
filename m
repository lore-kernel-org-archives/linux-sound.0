Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8721C3781
	for <linux-sound@vger.kernel.org>; Fri,  2 Aug 2024 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722602788; cv=none; b=iTKm0WFItmCAHb+XjdGHZY2JQOg+KQwqGLgk3qdVdfPkdg9vw3tXzJqwsc0QaqBuFukW+9TbobocP2wNRWUdJUbgcDiP6vv/bynEorR6fjYQ/bYtgv3N7tHKKM2sUwz5kA2Wn+C1WrNOWCHwnWU+JZV0wM88BSzAFUfjdQc/yys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722602788; c=relaxed/simple;
	bh=fpxs6tDpDWLpeRh4dVFvDcdkPptt+K5RS8hhS8lBskk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QkW9LFnfJhXvMWkogGR1jJSjwxf5kR71w4Opw2HUUZ8mXGLfJF9ql5EpDaG8Vofsw8nq0jf7mxKi800GmDdQ9crxQsoVFHj9M6cQ/3HMOgfHYSvN7wBhqyQJJP8wreM6vaFstI+VMnYgif5hva7flJ++P3zEclb3v+sAYLqf544=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QU/t0yi0; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QU/t0yi0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722602787; x=1754138787;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fpxs6tDpDWLpeRh4dVFvDcdkPptt+K5RS8hhS8lBskk=;
  b=QU/t0yi0O+NMXL/J8x0cvLuWTNXNQTFJ4hA7/jWGffLsoIzsAXRtHCWh
   q0MYz+I9V4e81jKskT15wnKsmt67g6uZE7hC89StzTjqcfbVlkr4AKpL8
   sGijHyonpjRfWm6ZiHv3gsjGyk+mUkpsDxCXS076ntAF9cjUw4VORemKg
   1+fUuqmbq54/TQzqkNlyWdEWKpFZ/zso9OUyh6rz59K6fT9CHZiUjYkOE
   0o1mvzqw+aVBcuOR00loqh12ROsCmNlA86Eznz4r5jYaVumO/VT1rvO0n
   eLrt4u+Ohd0b5F9E4Efogmi7C37P39Rt3uXnY/x4P0dG6bCQHxqIxxJB/
   Q==;
X-CSE-ConnectionGUID: cDzNNiKjSNiPkFSfh3OwZQ==
X-CSE-MsgGUID: uUPvMm8xQmqZgaf2CEqN1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20199385"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="20199385"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:46:26 -0700
X-CSE-ConnectionGUID: PhUPz21JQ7SWHBluGA8WtQ==
X-CSE-MsgGUID: dSMUo1SuSQaG1MLr/Onh+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="60407872"
Received: from ltuz-desk.ger.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.245.246.89])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:46:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 2/4] ASoC: SOF: sof-priv.h: optimize snd_sof_mailbox
Date: Fri,  2 Aug 2024 14:46:07 +0200
Message-ID: <20240802124609.188954-3-pierre-louis.bossart@linux.intel.com>
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

Reverse the two members to remove a hole.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 28179a573762..6ecc58e11592 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -412,8 +412,8 @@ struct snd_sof_debugfs_map {
 
 /* mailbox descriptor, used for host <-> DSP IPC */
 struct snd_sof_mailbox {
-	u32 offset;
 	size_t size;
+	u32 offset;
 };
 
 /* IPC message descriptor for host <-> DSP IO */
-- 
2.43.0

