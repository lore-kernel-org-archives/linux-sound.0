Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A741F2046BA;
	Wed, 15 Jul 2026 00:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073938; cv=none; b=h+6mBTtlHTrBPWfSRl+ut/y9H0mpDORT6N4jVd9g9r7tSzv1MEsOaglxDuxUoIPEe+JVcdCbaG4Kupza/iqw8oHPv0jP8LJ38leuqSNaMNAb3vTHvRoTJLKtDiqa0y4Ps5dRkxf/UOZxlpT2n47Gd9KTXMfhS1HCdRJ6CKcN7IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073938; c=relaxed/simple;
	bh=drrZoGZRK0tHdkUbq2tyMAogLHu3sMx4ai/XXNA8qm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YpgYH48JY5T+IPnf+IZxnprqBHRw+Z9HiT6S6PqNyjsN6vM+gXPWi0nAvvxxkjlUrCio32B6d07bv/SuRLNknyzc8nELy93HsvWIrVh8EOsC5HNTbcqOo+fCUHoaFJwHaiynX71ou/aujs8CqdEdd6WE/wO1hNkA3l6OPjx+NN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dwvjszr9; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dwvjszr9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1/veRKqkCOO3tCdMqjMmmlqScA2diiWPP5iGYEMMiz0=; b=dwvjszr96Sl/xA7jvslf1Y5FWz
	guoWsAT1Vhx//VzkPfaOczFILPwpIfT4sG5aDBAtuXK/fsD/IvqI8RfUQ2FTUf06GfdKi5O4ptMuF
	JLen7WoXUA25092gzK0G3ckiP0z1m9TK2OqRB8EmVgNbhparCSawYJwo93Stgd565NOe4w7zUnzsi
	ryJ/2Xv1PxwE3w0RKLPUYWAqF1fPQALoW2gcNHBbk4zyT1AJg70/bNc/Ocgyg4GqLLAWnrD1HPWu8
	dCJCJL7SEG7KDK97hfIkWM3/eexRaYSCHLvxZOSEuSklmhn/kU70diKy4zmHjSxlveDII2tva1Tp+
	4M2O7H3g==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn84-0000000DTcu-1Gx6;
	Wed, 15 Jul 2026 00:05:36 +0000
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
Subject: [PATCH 14/14 v2] ASoC: wm8904: don't use "/**" for non-kernel-doc comments
Date: Tue, 14 Jul 2026 17:05:25 -0700
Message-ID: <20260715000525.739874-15-rdunlap@infradead.org>
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

Modify these errant comments to use "/*" since they are not kernel-doc
comments.

Warning: include/sound/wm8904.h:119 This comment starts with '/**', but isn't a kernel-doc comment.
 * DRC configurations are specified with a label and a set of register
Warning: ../include/sound/wm8904.h:134 This comment starts with '/**', but isn't a kernel-doc comment.
 * ReTune Mobile configurations are specified with a label, sample

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
v2: Add Rev-by: Charles

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org

 include/sound/wm8904.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linext-2026-0710.orig/include/sound/wm8904.h
+++ linext-2026-0710/include/sound/wm8904.h
@@ -116,7 +116,7 @@
 #define WM8904_DRC_REGS  4
 #define WM8904_EQ_REGS   24
 
-/**
+/*
  * DRC configurations are specified with a label and a set of register
  * values to write (the enable bits will be ignored).  At runtime an
  * enumerated control will be presented for each DRC block allowing
@@ -131,7 +131,7 @@ struct wm8904_drc_cfg {
 	u16 regs[WM8904_DRC_REGS];
 };
 
-/**
+/*
  * ReTune Mobile configurations are specified with a label, sample
  * rate and set of values to write (the enable bits will be ignored).
  *
