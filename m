Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6859B34BA28
	for <linux-sound@vger.kernel.org>; Mon, 13 Jul 2026 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965317; cv=none; b=a3JkVw/nddNV4aj8J281GZ8rSSp7SrCBaSDr02M3Quu9fpmG8hfyMj76SMpWgpUdHiKzuQO6wo79g0Lx6yW5vYL7XSIIwcd/MPvw7c5BNpWxwGpVb3+lQbC2pRzrg1GDL3IMmLgsX7w06eGavJDlAip01XrblQ6aD4W0/xws7x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965317; c=relaxed/simple;
	bh=TPVgEZytTH06DWdMYlF+cD4KhwvKQTQNWNqkOewtAX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vCU24fTsKUkIYSHWJOCZtaEYc6akenywGMCG6mOfL1eVVVIOj/Qny0UL1k6Nhaw85Q7fFgqUrB39kLAZQ1iReDx538GXy8sx9aTS5M+Na+DWKR4+/BpdEfglvzjLwaEe4JsbUsak+gZTuSNTOffd7zYUHeD7vCiBeIpgKKRA/0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hAmD1QKs; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hAmD1QKs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ePzvsVRatzWxP0bPU5Bk5zK1iUgrod3c3cdh7RrYZeE=; b=hAmD1QKsx2ubl3MHdzLrw+fp20
	6yYaWVZ2GjwlsKZNZpUPy8XVO/294Ib4vMp24bcH5PRxtgN5zzQHFg17pWd84z/6SHCTKic+THexX
	FoSzlhlqZ2rgPSFHNVIOTF5758TxGeBwvn10S5K6TA1f0sodlCAEG1kD9o95ngHbab0h26uAEu1w8
	01RuAxZgkLEeKTbTuzWtbb6RKdHqqtYeyuj46oO4jL+27COPGijNMWKg2NWgXoPpVqcxKw8Pr93Sz
	0zdGEy38zNiocPVgHM3bvJWiW/1exCSADz/RtlV+ISpGzCwoULiSFKg1ZtDD2kZYlZtVYYARpox7R
	z6YUyMnA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKs3-0000000A9bo-48SJ;
	Mon, 13 Jul 2026 17:55:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	sound-open-firmware@alsa-project.org
Subject: [PATCH 1/2] ASoC: SOF: don't use "/**" for non-kernel-doc comments
Date: Mon, 13 Jul 2026 10:55:09 -0700
Message-ID: <20260713175510.524728-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify these errant comments to use "/*" since they are not kernel-doc
comments.

Warning: ../include/sound/sof/header.h:182 This comment starts with '/**', but isn't a kernel-doc comment.
 * OOPS header architecture specific data.
Warning: ../include/sound/sof/header.h:190 This comment starts with '/**', but isn't a kernel-doc comment.
 * OOPS header platform specific data.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: sound-open-firmware@alsa-project.org

 include/sound/sof/header.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linext-2026-0710.orig/include/sound/sof/header.h
+++ linext-2026-0710/include/sound/sof/header.h
@@ -179,7 +179,7 @@ struct sof_ipc_compound_hdr {
 	uint32_t count;		/**< count of 0 means end of compound sequence */
 }  __packed;
 
-/**
+/*
  * OOPS header architecture specific data.
  */
 struct sof_ipc_dsp_oops_arch_hdr {
@@ -187,7 +187,7 @@ struct sof_ipc_dsp_oops_arch_hdr {
 	uint32_t totalsize;	/* Total size of oops message */
 }  __packed;
 
-/**
+/*
  * OOPS header platform specific data.
  */
 struct sof_ipc_dsp_oops_plat_hdr {
