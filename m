Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801B18991E
	for <linux-sound@vger.kernel.org>; Sat, 26 Apr 2025 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745676931; cv=none; b=PPs8/28OeGBx1dr4XqHHxkx/mbU0YalB4EqMj/pGw478SB4cCAK1JgDzZjQB0o4XRkJ4B43YEJamls54EbsGNh41HzUnOH0efkg7ofXFsLk6wU5wsOjdjfZaJPI2AvAzQ9MbJJKvW/625vuwEG6NxRECHtCpN+KDdwMWG2XDg6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745676931; c=relaxed/simple;
	bh=waxnxui2QviIgVgc1bJMLxZrKM8b8gL7fbw12cESlfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EN48BlNtYZNNcER7VELsFV/+a0UDpe/NAfUq7gqh/lc7LFqD3f++I4dHtRfPZ3szAfPXMtE4SZle8OHKscJ8iY6cYORjYgYtdBg87PEP+GGdsBYmr7gGM7jrVFo3aPJM2OPnjGvWIM81KBQyzEGqOfY2puo94GLSTqt+9xh3yYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bzn62s7J; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bzn62s7J"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745676926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mUBNglOjxjHnOAYE8awUGQe+npyVpW3mA3ETw0TrBFM=;
	b=bzn62s7JydhnsLQL69Auu0A6opRMbBOQUOOo/ciBxpsgYxEG+TYfYzlWa0GI3N+VHZ9R1c
	g+8iCN4LeHP3Zv4TgWRFBv/lq6DhsErIcjI6IzKeOQjhV51ZUkUsKrivzu0zslPJQjL5/T
	Qb2IFBUx563z5s1i4qJIcA6wm92DEsQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Intel: avs: Fix kcalloc() sizes
Date: Sat, 26 Apr 2025 16:13:41 +0200
Message-ID: <20250426141342.94134-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

rlist, clist, and slist are allocated using sizeof(pointer) instead of
sizeof(*pointer). Fix the allocations by using sizeof(*pointer) and
avoid overallocating memory on 64-bit systems.

Fixes: f2f847461fb7 ("ASoC: Intel: avs: Constrain path based on BE capabilities")
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/intel/avs/path.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index cafb8c6198be..8f1bf8d0af8f 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -131,9 +131,9 @@ int avs_path_set_constraint(struct avs_dev *adev, struct avs_tplg_path_template
 	list_for_each_entry(path_template, &template->path_list, node)
 		i++;
 
-	rlist = kcalloc(i, sizeof(rlist), GFP_KERNEL);
-	clist = kcalloc(i, sizeof(clist), GFP_KERNEL);
-	slist = kcalloc(i, sizeof(slist), GFP_KERNEL);
+	rlist = kcalloc(i, sizeof(*rlist), GFP_KERNEL);
+	clist = kcalloc(i, sizeof(*clist), GFP_KERNEL);
+	slist = kcalloc(i, sizeof(*slist), GFP_KERNEL);
 
 	i = 0;
 	list_for_each_entry(path_template, &template->path_list, node) {
-- 
2.49.0

