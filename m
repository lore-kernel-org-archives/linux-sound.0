Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA5A370D6E;
	Tue, 14 Jul 2026 01:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993493; cv=none; b=uIe0/B5pT6MxEvWiUMSgb5Xk/HjeaV8OjHiT3fzJhb9E0u9LDwJlOGkR6EBkX0ytNYMiW4NzXGsQ2gktlknHs/Bb2OTalAkSWdxyJsDqizsahfHtZ/oWzCb0cyqjmAq91FsNf23KeTFqDVgUG2z8HPYwfVrKneEbXv0EeCeqrHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993493; c=relaxed/simple;
	bh=4mcoxSqkx/+CLnke4IDJhUTNww2PHhTHbHnjCFVdTyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTZucqtSk3o78+TGR5G++/0EVZGf1Zc49WN7gc+pYf8RYsSBTm+28FBgb5dtLvn9UWO36JezEfx/WpjKcyk+H7AiIT3a8xhVWnqMWAlfxvmwdlLDwcozXnhL/x6LIP0qkwqB3iyPFk+J+4P+C36wob/O+f79kwc6woE/jpH0fGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tGcKHVi9; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tGcKHVi9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=O1RY4YTRO+E3JFGGHiFCdt1Y9JLMfH6rQLhyRiyEVpk=; b=tGcKHVi9AwCj1XFCaN4NL2qKtE
	gS+AOSrXnV1NfEHSP54O2iaBlMxG8IlSFG/ZxxDJAQyVmW+uyry2qu09vRflGZdAaS67qZDdkNUDL
	6srtLBsd6TQHehENmG79eNts3QyQ2mlKJTg43FtnWyqtAojZkUVj1HcSVwRg7dKy9zYrq/hfWR6mk
	YKgJk8OmIo+c1n7ZzgMbFwBQ070VWsxhzssTvpWga787JNCC2VCWIA/LO9Qi3yLDfOiGtAQQVSoU7
	zNscJJyE+WLWRef5tOaVkKM5AWMZScPThHqTD1AVTX2vh5LsWgzfmMUuwG2VVd4JaF3KW7sxJ3N/J
	uyTO8V/Q==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjSCZ-0000000AgsR-3mCf;
	Tue, 14 Jul 2026 01:44:51 +0000
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
Subject: [PATCH 08/14] ASoC: fsl: p1022_ds: repair kernel-doc short descriptions
Date: Mon, 13 Jul 2026 18:44:39 -0700
Message-ID: <20260714014445.569992-9-rdunlap@infradead.org>
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

The kernel-doc short description is assumed to be a function unless
indicated by a keyword. Add the missing keyword (struct, var) to avoid
kernel-doc warnings:

Warning: sound/soc/fsl/p1022_ds.c:62 cannot understand function prototype: 'struct machine_data'
Warning: sound/soc/fsl/p1022_ds.c:182 cannot understand function prototype: 'const struct snd_soc_ops p1022_ds_ops ='

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org

 sound/soc/fsl/p1022_ds.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linext-2026-0710.orig/sound/soc/fsl/p1022_ds.c
+++ linext-2026-0710/sound/soc/fsl/p1022_ds.c
@@ -55,7 +55,7 @@ static inline void guts_set_dmuxcr(struc
 static phys_addr_t guts_phys;
 
 /**
- * machine_data: machine-specific ASoC device data
+ * struct machine_data - machine-specific ASoC device data
  *
  * This structure contains data for a single sound platform device on an
  * P1022 DS.  Some of the data is taken from the device tree.
@@ -178,7 +178,7 @@ static int p1022_ds_machine_remove(struc
 }
 
 /**
- * p1022_ds_ops: ASoC machine driver operations
+ * var p1022_ds_ops - ASoC machine driver operations
  */
 static const struct snd_soc_ops p1022_ds_ops = {
 	.startup = p1022_ds_startup,
