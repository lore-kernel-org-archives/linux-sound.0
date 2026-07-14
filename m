Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1573655C5;
	Tue, 14 Jul 2026 01:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993492; cv=none; b=hVZIJqCK58mq6950dWgDSRARphAeyj40qgPmJVW18C/O+YHyQMoaMClr2Nexi9U2I7dT1Bxn1DRvPr/GlgJor9IXPE5aTuD+TS2WcfV5XG8kRJol+umHvYxGb7gc3S51HjxFNkvk3ZmhdyzbmUTz17GKMZfKAmIt0igrQ7P3yRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993492; c=relaxed/simple;
	bh=nF3rCVtY+OL+cdV3goVWBWxrvEkZhz8Rqy+0ysgbjL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FK91Nwhao6ZRTMFyzHMElWV9cvKaXNI84oI5hwgW6oTtthVSp9o3u/PLGR/OIdzZl5l53BWny9iQNJ/MQcdQoXJsS1rez2WSsRgmch5gtSXBjZMVmFXlg2bL0n4WaTxus8KoUngxBFfjiZNG7l3aYxhBLjoyQpVHQ8oQf6Apg0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SfWUes0N; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SfWUes0N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+vBVSAe41gLF0/LGe0VpsCrXwVXYW7rQ7Wb7b1sitdE=; b=SfWUes0Nc11TcnAEjLJ0+AVRtx
	7ubgOaeU6TwFcloAiOllAJO+VBV6QqTl7DOlxXbdB45DOfO567bZrAOX85c0ifY1vP52RdlTXNvWN
	yd0ex3V+Fyv9sl3lWcTNziorPecUZYB5OvrY64wss5VJcN0EOrHraB0QZqcV8gT18bxvzLPcFUQmK
	dWzi0laly4DiKm3OhZmjkRUEJ8V8e3fuKCqxHayAgHgttzpassTMyUBAkjRkkckf600I8ORzQb+wG
	y5EOcTQXNoRPB/NMWl2wRBw7xe/Yan4JHPaaNRDFnOAFKVtpZvVJHq0wck2hfBfzvz/55LRWZ70+D
	9EiuaXKw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCY-0000000AgsR-0Pgv;
	Tue, 14 Jul 2026 01:44:50 +0000
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
Subject: [PATCH 05/14] ASoC: fsl_easrc: use struct keyword on structs
Date: Mon, 13 Jul 2026 18:44:36 -0700
Message-ID: <20260714014445.569992-6-rdunlap@infradead.org>
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

Use the documented format for kernel-doc of structs to prevent
kernel-doc warnings:

Warning: ../sound/soc/fsl/fsl_easrc.h:606 cannot understand function prototype: 'struct fsl_easrc_ctx_priv'
Warning: ../sound/soc/fsl/fsl_easrc.h:641 cannot understand function prototype: 'struct fsl_easrc_priv'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
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
