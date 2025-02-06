Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A193215778
	for <linux-sound@vger.kernel.org>; Thu,  6 Feb 2025 09:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835321; cv=none; b=G1uhlhk1Q6anZ/3BxVFTwg9qT4JmLcuk684u3VcR0eHai2mrdVKOI53tVIHGqye9KvCSCp8Fu+nbl1ZXfzEOCHFqSYbIHw3qIKDahTC10vg5IwHmSRej+pEFdhBkYfJrfU4aOcz273QuZVr7glyCRUX1Dy6VcneV2ZVNu1fOf+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835321; c=relaxed/simple;
	bh=vkGbh1vgXAGEB14lWG4iBxue1NAXf7FayVzOfhENFMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HA2N6eTe7PNqE2Ap498K5WG7jTNoFf1x9hdyEjKpUf3Jj+Hbm6ejQN7GJqyHLa4xwfrMkfbzV5LC+YBYgRVnhGQAZw41UGWJAAD25Yb8ABThB9XnHW9VLemGUPKsLK5TYHqrMfFg76v8Af4DfSojP7DX2pVNocErSXAmip9IHyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWE3I0s8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWE3I0s8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738835319; x=1770371319;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vkGbh1vgXAGEB14lWG4iBxue1NAXf7FayVzOfhENFMU=;
  b=BWE3I0s8F65CtbWM1LIq0OmQ8iYJR4VAuofELkQNTu/rXrlDkReVsuhn
   0zbvIxB5opd05KRknQyHIo6kO0H4UTlP3Jhpv3YSjhbtVQvBMzqCowtY7
   P/UBLc2TmmKeKgpMhjmQRI8oxD+yaiii4WhgS5G/g015+4yWI+Pm+HGYC
   ZAop1mEffjI5WfUIv2w1PX85PdiZIuIQOOsLZgSD9Drkb1Oz7tmmiucAj
   EcXPZu100Vu0iCTfiAuZ/UCJD1HQal9C8TMHEpE1LQnT6f4w9++WlUO+d
   GTuUw1jEX6aNiHk3/JjV4BZlGbOM8dbzmLmNFfNg0OaJtyKOhgphBFj9W
   A==;
X-CSE-ConnectionGUID: /bWnW8NORDiBlBf8+sScbQ==
X-CSE-MsgGUID: 0GSYFhuATHOgvLP0OWfK4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42266573"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="42266573"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:48:39 -0800
X-CSE-ConnectionGUID: DttguA7zSBmBQ8LH73wymA==
X-CSE-MsgGUID: 3PBPfLSZSuKwizJNNQl8aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111614670"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.33])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:48:36 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev
Subject: [PATCH] ASoC: SOF: ipc4-pcm: Move out be_rate initialization from for loop in fixup
Date: Thu,  6 Feb 2025 11:49:14 +0200
Message-ID: <20250206094914.21135-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of initializing the be_rate within the loop by checking i == 0 at
each iteration, move the be_rate reference initialization from the loop.
For BE single rate check we will have single comparison done at each
iteration compared to two in case the num_input_formats were higher than 1.

We still need to run the loop from index 0 to check for FE-BE rate match.

The patch also fixes bogus reports from gcc static analyzer thinking that
be_rate is used uninitialized later in the function (which was not true).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 18fff2df76f9..dc05e7490e6d 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -610,12 +610,11 @@ static int sof_ipc4_pcm_dai_link_fixup_rate(struct snd_sof_dev *sdev,
 	 * Copier does not change sampling rate, so we
 	 * need to only consider the input pin information.
 	 */
+	be_rate = pin_fmts[0].audio_fmt.sampling_frequency;
 	for (i = 0; i < num_input_formats; i++) {
 		unsigned int val = pin_fmts[i].audio_fmt.sampling_frequency;
 
-		if (i == 0)
-			be_rate = val;
-		else if (val != be_rate)
+		if (val != be_rate)
 			single_be_rate = false;
 
 		if (val == fe_rate) {
-- 
2.48.1

