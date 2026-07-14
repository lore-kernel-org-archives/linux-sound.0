Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D183655C5;
	Tue, 14 Jul 2026 01:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993497; cv=none; b=Qia/mN9BeA5dK64eA+7hsgebSUw+05Vs1a3y0hv8z8zdoDgP9ndhfLHTfuj/wzirTBqPF7YBmeEpNPkOTgkqPRsJfxCquAH7iohbOJjdLmraTXfiovyFuzXDAZn8qvsx2yhJu943dymwdKfXIxQvNoBv//9T/7ZmH9C8nC6+z4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993497; c=relaxed/simple;
	bh=wg4TJh1wl5RoWYQcJ/t9SgJLVLeMgMp6mEmbl0Ypta8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mtzkub8/Na16X9YK2b93FGufIm4dnf7T1fjIoY8aU94cQvmDlKg3aw1SSUo1Gt1SqXRGKJi/ztN2j8/cAkN57jJkCcFcWK/pIo5pWt+wiOpm+h3sAPOdQY9RzGzUyTlwdiR3Sk1VaRiRpcCd4p7NS4APc7FNJ/eS541Iz5yHdZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vM0exWra; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vM0exWra"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Wzo+p7kjYg1zo7BvQPSNimvM1GKqs370chQONJWgl9E=; b=vM0exWraEZ+kdHXAEppLxIFTfI
	OmYMJ/qGZ+LrbRrEhYU3k+gOEMto5M9WhQrXiM0/P5vXLhB3olLHmvhW85Re79hPTpvJHSjIkidOx
	MtUzephqKDGpelmORpwQtfC7D2wBVvYG/o6dulk5Lk66bXvw1UeAgsaz9A2364arzbrk8z776VKi7
	qwKrqtQQaMiJ5efVBWz73dKgknQjCt3KVl57K6fQfTwOG60eTeCPeyZ3AauIx5sZIdFMf7Ue1NwpM
	vjC/YZBg08hf8ZVJ0hsZeGOUoScyL8xuE0i1fEhcJdBMQZ3PVeIHs4Aej2L9KEk1EeOyxCd9xm8Ih
	8FoW6qEw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCd-0000000AgsR-1Kwy;
	Tue, 14 Jul 2026 01:44:55 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
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
	linux-arm-msm@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 14/14] ASoC: wm8904: don't use "/**" for non-kernel-doc comments
Date: Mon, 13 Jul 2026 18:44:45 -0700
Message-ID: <20260714014445.569992-15-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260714014445.569992-1-rdunlap@infradead.org>
References: <20260714014445.569992-1-rdunlap@infradead.org>
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
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>

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
