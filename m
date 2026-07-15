Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B590D18AE3;
	Wed, 15 Jul 2026 00:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073935; cv=none; b=dWdtKZUIwklp9UqA/6PuwoeUtJDaN9yaiT2nHPavzDrKlrEbFAWT4xAeCM7P0cpxHLbxHCny/zLmXxcnvjpVB2Cq2VReCxsMq8kxeO/eEEDEEJa9oTSRYWNs2VjlEHFCBuqxjHWNWPD9Vb3ebavHvozOL+iyHZDvdbwXeUyR648=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073935; c=relaxed/simple;
	bh=umnHTaDhlExu53CxtYouwuuqQC619lb9/UjUbitiaJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCXhn8xVqDZbEbCvyYzCv2m0M9gl4idGkTnYOMoetut6dJDQv4EnsPTEBns7dFesps4N2FoGFYNgCdvsR2IQmDHB7OvNibGai9pubKhK+iytVnbyXFhEw7G4daAGBTYQCG5bmG+r7ZvJQYT62BcUBKF7QfeAINJcP8MvB7nWl9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WU8HVTkn; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WU8HVTkn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=7hW3M2QpgKenNW5fwTkZzoAIUk07IxCTC40ZiH/i8oM=; b=WU8HVTknn80YMCVD5fR5pB9pQ4
	DweV8LRwXGFDnTWFHfG3kl1cHwzt1QCQJllxiNG6KDH74mhoALqWCbDPY57ysNQAOtgvHGfFcmWwV
	uMTdwj4YnKk4BQAAdsx6trlI3fI4CXDy7FznyPDo8f2TpS1L25sN2Wo8zljWL6DHEZQUBjcmft1RV
	Z9lEaI26SOaEp+y0hYyMoapx1ccBouQhMzP30BPQDF7rO9KUT3y9yXgvUsHbuOUMFH9OCx4L8Yfkp
	SZds/3GInZkXoznc/ULZ2gCJQDcOVEdRM1MF9pbKs6SNV4rt1ZnYtbbz809KjNKg5jPWjNTUMbMIL
	bx+MHOgA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn81-0000000DTcu-1K4S;
	Wed, 15 Jul 2026 00:05:33 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	patches@opensource.cirrus.com,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 09/14 v2] ASoC: uniphier: don't use "/**" for non-kernel-doc comment
Date: Tue, 14 Jul 2026 17:05:20 -0700
Message-ID: <20260715000525.739874-10-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715000525.739874-1-rdunlap@infradead.org>
References: <20260715000525.739874-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a C-style "/*" comment to avoid multiple kernel-doc warnings:

Warning: ../sound/soc/uniphier/aio.h:159 Cannot find identifier on line:
 * 'SoftWare MAPping' setting of UniPhier AIO registers.
Warning: ../sound/soc/uniphier/aio.h:160 Cannot find identifier on line: *
Warning: ../sound/soc/uniphier/aio.h:161 This comment starts with '/**', but isn't a kernel-doc comment.
 * We have to setup 'virtual' register maps to access 'real' registers of AIO.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no change

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org

 sound/soc/uniphier/aio.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linext-2026-0710.orig/sound/soc/uniphier/aio.h
+++ linext-2026-0710/sound/soc/uniphier/aio.h
@@ -156,7 +156,7 @@ struct uniphier_aio_selector {
 	int hw;
 };
 
-/**
+/*
  * 'SoftWare MAPping' setting of UniPhier AIO registers.
  *
  * We have to setup 'virtual' register maps to access 'real' registers of AIO.
