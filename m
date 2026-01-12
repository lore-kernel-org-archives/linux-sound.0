Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D881F33EAF8
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 11:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217516; cv=none; b=mbO7oA7WJKRaQdSqmtUjp8z2l7KimMLyeLVzYXtQ9O12hPWJK04hs4uapx1T2ym76I5rfv/AgyjnJdiTusZVifnLSx46wz9s14dceRzNmUdaVqSQw+ChnsbUhiGS6lOzKY0ZhuMjyNqrZEgV12doXbyfnHn1jFgzG33K7hDWbTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217516; c=relaxed/simple;
	bh=IuRDjpQ86VnGh8gJZiRI9gy2u6Sjg5nXrZKsCl5jjQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTBjM2fYN1/XTOPEVHjrs12j/Ixp8l2oc4KzPDnD3zIhmAcet0DC5PZjXJ1fQL6G6LSlxSE5kxOj4qbLHY+FWOJfBZzvxNXTiMJRvJtJjeRW9IBWi5bEkD8aW4+lHHuqe80P45HNk8u3UU2xawxxioc7+PFlbCioUxpQF7hy6oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H491yunu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H491yunu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768217513; x=1799753513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IuRDjpQ86VnGh8gJZiRI9gy2u6Sjg5nXrZKsCl5jjQs=;
  b=H491yunumNsV5WEYlgd0tM6+pv3GurCvKjBK5z78mGqI52vE94dmZAg5
   pwd5SbZx3GyTX89lq6aMG3uUdVGhc/p+MMqXdCT80I0wOvqs7o4MM8sHs
   p+Ry181h2EQUvLBrYnXd0725TM/FlPPIy8Hg4cMBQ1+5miQ7k6+aPBIyQ
   I6HhAn7TcUCe5xkQmS4gW85f1rScU48d5on8gTX1scVGtz24tXtHzlPpn
   SNFW0Mgtvkr09tafa7uehFC2fcDAaZNFLLNMCLql6ch8Te2MknwurY7sm
   VstM7N8ujFogW2fvH2Og8/lqBLrt7YDP1NAKZFi+5rY5xKBmtbvtqoJzd
   Q==;
X-CSE-ConnectionGUID: Mh3tZtAZSYurz7f7NkxVpw==
X-CSE-MsgGUID: E0eESmtJSf2OYHxW+NuXjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69539744"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69539744"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:31:52 -0800
X-CSE-ConnectionGUID: aPN4+B91Qqq8Lk7jiqXA6g==
X-CSE-MsgGUID: 6RwICQJPQLeB9wzTkLj4zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203224325"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.204])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:31:49 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	guennadi.liakhovetski@linux.intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH 2/4] ASoC: sof: Add domain_id, heap_bytes and stack_bytes to snd_sof_widget
Date: Mon, 12 Jan 2026 13:32:19 +0200
Message-ID: <20260112113221.4442-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112113221.4442-1-peter.ujfalusi@linux.intel.com>
References: <20260112113221.4442-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

Add dp_domain_id, dp_heap_bytes and dp_stack_bytes to struct
snd_sof_widget and fill the values from topology tuples with
SOF_TKN_COMP_DOMAIN_ID, SOF_TKN_COMP_STACK_BYTES_REQUIREMENT and
SOF_TKN_COMP_HEAP_BYTES_REQUIREMENT tokens.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 6 ++++++
 sound/soc/sof/sof-audio.h     | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 479772dc466a..a14023c4c3e7 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -158,6 +158,12 @@ static const struct sof_topology_token comp_ext_tokens[] = {
 		offsetof(struct snd_sof_widget, core)},
 	{SOF_TKN_COMP_SCHED_DOMAIN, SND_SOC_TPLG_TUPLE_TYPE_STRING, get_token_comp_domain,
 		offsetof(struct snd_sof_widget, comp_domain)},
+	{SOF_TKN_COMP_DOMAIN_ID, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct snd_sof_widget, dp_domain_id)},
+	{SOF_TKN_COMP_HEAP_BYTES_REQUIREMENT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct snd_sof_widget, dp_heap_bytes)},
+	{SOF_TKN_COMP_STACK_BYTES_REQUIREMENT, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct snd_sof_widget, dp_stack_bytes)},
 };
 
 static const struct sof_topology_token gain_tokens[] = {
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index a8b93a2eec9c..03c8dd29e071 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -454,6 +454,11 @@ struct snd_sof_widget {
 	/* Scheduling domain (enum sof_comp_domain), unset, Low Latency, or Data Processing */
 	u32 comp_domain;
 
+	/* The values below are added to mod_init pay load if comp_domain indicates DP component */
+	u32 dp_domain_id;	/* DP process userspace domain ID */
+	u32 dp_stack_bytes;	/* DP process stack size requirement in bytes */
+	u32 dp_heap_bytes;	/* DP process heap size requirement in bytes */
+
 	struct snd_soc_dapm_widget *widget;
 	struct list_head list;	/* list in sdev widget list */
 	struct snd_sof_pipeline *spipe;
-- 
2.52.0

