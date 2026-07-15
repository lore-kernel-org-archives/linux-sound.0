Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2077B249EB;
	Wed, 15 Jul 2026 00:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073934; cv=none; b=Za4MQWNl+p0Q6aQ3jjNcQeNBf2Mbi67xtu9kJYXyJP1mMj56Fah1uijHSNmgNybcL10+mmykTQpMPt446ZBlMvwwLY+gMQWFkPxOPR/anh+LwFhk7Au6lg5c97o6WNoypHYQ6/49wMeU0I+8qIUF6OyWPA4V63FYR04S7UMVelE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073934; c=relaxed/simple;
	bh=R+zXM81A5iireYMWuE2ZqCa1la2+O9CZ4VLgvEAAL1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYBp6d58+ETJTeU4dsaH6kNFlKVX8uPgyhSd1fhb4Qxq5Y3j2e05El2EC31TivU1FGt82HQy9HJY2etSGwKOlnvr9cueV8RE089LBN4AiLQUNqm/O3++GlntAu5qaha1OxqyxLfusJY2Hkc293lv/QVY/hvRUf1GMDhM3WggxbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LtPyVRC7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LtPyVRC7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Cja07B7b6DLmEF/XlIxcOw/U7wRYtezoqU3BZOcxKts=; b=LtPyVRC7z5Fv1G5lhVKLjqm4e8
	MVr4ZI54qkkNx5HdipAEdhwX2uZfcQXpkFyRNWDJRSM0e0hufIbxD+rLA3isL3EYb22rUxyWngj6v
	AlVc/vz1b4bKWmLJ3e+h6xOinoCFzIWW7tqzc+w2k3u4jeHRzuEdBTo4MtMN5UjVSktSOqTGw5uuD
	Fg27N7ZottEv3SS0cbb51/Q2VrrLeU71Z9cT4femzmZyM74o8QTxhkF08i0DcoMJuCaKqVhKaSJAA
	j8SfLBRG3HvscvqwHpH2oM16+Y/ZRjbZsyUhQ0qwvHpaq+z2qSCDyO693Ys2P18cX3DYz5IcLuPTA
	qE5TW4HA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjn80-0000000DTcu-365Y;
	Wed, 15 Jul 2026 00:05:32 +0000
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
Subject: [PATCH 08/14 v2] ASoC: fsl: p1022_ds: repair kernel-doc short descriptions
Date: Tue, 14 Jul 2026 17:05:19 -0700
Message-ID: <20260715000525.739874-9-rdunlap@infradead.org>
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

The kernel-doc short description is assumed to be a function unless
indicated by a keyword. Add the missing keyword (struct, var) to avoid
kernel-doc warnings:

Warning: sound/soc/fsl/p1022_ds.c:62 cannot understand function prototype: 'struct machine_data'
Warning: sound/soc/fsl/p1022_ds.c:182 cannot understand function prototype: 'const struct snd_soc_ops p1022_ds_ops ='

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
