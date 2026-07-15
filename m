Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6856171CD;
	Wed, 15 Jul 2026 00:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073933; cv=none; b=ALznKITKTrsoNWGB44WPdat3YcIwOKrYDi01V30I4Kk0yyqOQQMb1C1ncf10xv9M2riqms7LqCqEIynn1pUNbTDd5zsPppprqHANPgeFNlic43QCyDSNW8GAK+gK5V0LQcP5RaeSzhvAZ9bDZTAtjqsRD4C6lCjYxlYyzgJVFY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073933; c=relaxed/simple;
	bh=dVvCTd9HiPk4BuQ/Qor/jCgpHdkxzguxFXKBEOCAJ8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KU8NEHq0cBMgwftetwhQZZ3Rlj9QeX8HovshUPdYNyE9KmsYyUY9lhNJSNJkNpasADTvmhovOaNESHeT8hYA7p77E3IKo2EXLHwBaOdQBjermtsQORUmpTqK7edJEeVuICfcjEMDwP9MQt4Gs8rHbDeNfdU9J6m8uoW4aOzCrSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=0Ud7qJDY; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0Ud7qJDY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=IR3qjoddWhjrLMEmYv+RhozuipdTVtOmJ2AYAVnZkBc=; b=0Ud7qJDY4gle6F10k+EC8mwaWX
	frHbP+h0NUsSuye5BAnnlKbMvIrd6KPAP5VQuQJUlEIVskHKOl+0qmflQpA6QJ1hL2W+Dwpf7qimQ
	wpe+GmOpcy1XM6ABd4NxpATKeQ5HANYuekDkhBDoPRQOPIodZU+0o+vp9V1ToOiz1nApWJ009bEtF
	ps5snFZdmX6Hh6AoYtao447Q7xJzTHygXx7RknJwGE03/m2lTryhvSi3V70GLdiXyoQEQ2gas5TeQ
	YP0TibbgzfiHa9qqajxQWuBU9777MCo2dk9kic2K+Ltfg0l7D4H6yTWQfNFz0voIJUy6TUrCz/I5n
	XmLfR6MQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn7y-0000000DTcu-46sc;
	Wed, 15 Jul 2026 00:05:31 +0000
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
Subject: [PATCH 05/14 v2] ASoC: fsl_easrc: use struct keyword on structs
Date: Tue, 14 Jul 2026 17:05:16 -0700
Message-ID: <20260715000525.739874-6-rdunlap@infradead.org>
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

Use the documented format for kernel-doc of structs to prevent
kernel-doc warnings:

Warning: ../sound/soc/fsl/fsl_easrc.h:606 cannot understand function prototype: 'struct fsl_easrc_ctx_priv'
Warning: ../sound/soc/fsl/fsl_easrc.h:641 cannot understand function prototype: 'struct fsl_easrc_priv'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: no change

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org

 sound/soc/fsl/fsl_easrc.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linext-2026-0710.orig/sound/soc/fsl/fsl_easrc.h
+++ linext-2026-0710/sound/soc/fsl/fsl_easrc.h
@@ -584,7 +584,7 @@ struct fsl_easrc_slot {
 };
 
 /**
- * fsl_easrc_ctx_priv: EASRC context private data
+ * struct fsl_easrc_ctx_priv - EASRC context private data
  *
  * @in_params: input parameter
  * @out_params:  output parameter
@@ -625,7 +625,7 @@ struct fsl_easrc_ctx_priv {
 };
 
 /**
- * fsl_easrc_priv: EASRC private data
+ * struct fsl_easrc_priv - EASRC private data
  *
  * @slot: slot setting
  * @firmware_hdr:  the header of firmware
