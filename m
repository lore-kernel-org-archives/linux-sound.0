Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C076D3F0ABD;
	Thu, 30 Apr 2026 07:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535250; cv=none; b=AHyMRl3z1q7zeDJazYj/dALJFhSNZiOKcPp0c4+Xeqln7/6wULw11laqxu78Ig9qAIsETL/7yUDT0O0aZ+utkWMCKdyLzAX9XdLFIEEJi2/3QmTDlS7aFsvTGd3ryQ5ioBe4cHzFBMTZPSgiCBnN6TDwGCBUndzEPvrGz0XL1Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535250; c=relaxed/simple;
	bh=8EdyFF2IQ7n5G05qUCBq/h28gJtQar6PAqNTr8YiPLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cnKWvwPQ4+WXstXr//IYQLHOIPihfLNTwd5IkOG4WGQahIVrU2t+mAZ1m8uVzD+ZGnL3zXkAKv7PpqFXtgJ4PIgotWTv2NuTyJ0aA+cLHzS4fHFmJfJgQFdxha4bvhSlDvBVxJh8EBrA8eKtAxkyNMBmUxi1RBgYGK87pRTxnSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=sSGQ724r; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="sSGQ724r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777535181;
	bh=6CgneJAQi63bJAKSC7+dw4i4saxKV1iqTjT5qvR6Elo=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=sSGQ724rG36e0241r7XrcjKVgWuMzhs9CwAZvSfwkqthwpSBourEekMVtr6qe8+T5
	 Ai+mD3K84vWqCVyPNuvMFGFWhintK7IsmO3NpEuTA7sHDiQERg/9+Rw0bi0816W53w
	 //6SqXm7N4T9yHka1NwbSsQ4ubJrx4mTKQW5EAdk=
X-QQ-mid: zesmtpsz8t1777535173ta1cbc1c7
X-QQ-Originating-IP: SdolTqF3qYn4IDTcyraxg/vDR+JO5622cU0JsdsuAd8=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 30 Apr 2026 15:46:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8530770086429927008
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 30 Apr 2026 15:46:01 +0800
Subject: [PATCH 1/3] ASoC: soc-dai: add shared BCLK clock for cross-DAI
 rate constraints
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-i2s-same-blk-v1-1-3a1f04eb6159@linux.spacemit.com>
References: <20260430-i2s-same-blk-v1-0-3a1f04eb6159@linux.spacemit.com>
In-Reply-To: <20260430-i2s-same-blk-v1-0-3a1f04eb6159@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777535165; l=3088;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=8EdyFF2IQ7n5G05qUCBq/h28gJtQar6PAqNTr8YiPLc=;
 b=4R9zbq7R6GTzzPZzJE7gsXGBf4y5jzcLsAFMf4cwwNsmkL1t6qbzgIiszt3QerXhkLx9Yf07T
 6+2jnVo7onwBQVwf0Mc5wUO9jSIdstf3vSsenuN0/PLMVfL29qGyfw0
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NsKw77UaNFtD7HxjkJNmjTbqj0BtCRjT7UBH6+4RRa4B/hECHutsrdRV
	CqV/sSUtoRvjvneuVf7cByomvxIfPEodFM+p1YC2YJgxJFIU3YgxafGi/w594XmU6QlxCNb
	7j6/Kt98XUiq64VYiv59igCOwPTCG/a7HZ5AQ+hLmLd6roCPqcBXfzq9YpxANmUCIYH/1YS
	KwgjijTovyyjt/CHco1X9aCwP4AHQrduKucOBbFIpqD5lkr7kbmPQD181Ov0jP7WtSkAoCL
	wvvdvQN8PKy6LbRJSJfJPbUm8PRmyuVWLBSNAzvOL/LAiFHwFr0hcv4/vLudyoEon12ZRQ1
	RiJOUM2VfoE4Jpr9AJocknbvLzcSZUgEVECPrdhmDHWzlv9E8lV/3CzljpHARaaKWUcNQup
	huaaX0qiCMR0r0agRB9S+uHDkFuia0pdg3RkiNa5VWkLKMK27xQK86DMFvzAj2DoHBJenwl
	aOWd3V6sPzOaii97MSKLmM2gGm5n4zNV+Nv7/WJDDxdYhqLUkrIfN1d4I645dAQAFCVwOdv
	isD5rSBRmacyIC7Q8orfzAfyVI0JfVb0nCO6EnXMfZAdOmDioKbuiM/OcJAiHMA2J1dtKRO
	bxRNXgIecxutigcNZP5uLKAOGM3uMydKCa+120O4Ae6pWuX4C9w/dI8cPqSjRhdq2t682cC
	V7lJnaI6ECysbDTG/4XOiLy6ZulG8Z913jPZaoduQgpU+RinvluJmfdPCWLuJquz6CsNrjC
	/CyapvIjT0kii4hpmohD+tNuZWW8nAiPh7qCaIT4ReZP4nx7QPidgGMsVSTqzeB2zlo8p0B
	qFNHYJUgP++CIvphA2KPq1MlAXbQJmxEF7o1Cr2OmbgcrZhVmVNHCrO3MjGEkfMRT09hxPm
	hyMbs1I+FsKLURNzR0wDHFFLpAn7nzKvdPD3QXkfVCX9XbdeOunDgooWBeLg2i4b8Q9Y7EO
	J7Pe8faZaIsEUof3YVX7n7aCXE8h3nxRVlfYqV4Afj0Blr1tr0bXem/HOeiFD2cGruYItWv
	w2HjJkktVfJYYH0Cwj49G5GbNun4/jrllzjtAyh72KQ3gdChXDc8TmIjjuLBbd08T1qoNdh
	5sgGL2HjbpCaR/NR77VpE5ecdmijLHRrlUb26xCSmNg
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

Add a bclk field to struct snd_soc_dai and a helper function
snd_soc_dai_set_bclk_clk() that platform drivers can use to declare
which clock is their BCLK.

Also cache the bclk_ratio in snd_soc_dai_set_bclk_ratio() so that
the framework can use it later in hw_rule evaluation for TDM
configurations where BCLK = rate * slots * slot_width.

When multiple DAIs on the same card share the same physical BCLK
(detected via clk_is_match()), the ASoC core can automatically
constrain their hw_params so that the resulting BCLK rates are
compatible. This commit adds the data structure support; the actual
constraint logic follows in the next patch.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/sound/soc-dai.h |  7 +++++++
 sound/soc/soc-dai.c     | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 6a42812bba8c..df010a91b350 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -17,6 +17,7 @@
 struct snd_pcm_substream;
 struct snd_soc_dapm_widget;
 struct snd_compr_stream;
+struct clk;
 
 /*
  * DAI hardware audio formats.
@@ -188,6 +189,8 @@ int snd_soc_dai_set_pll(struct snd_soc_dai *dai,
 
 int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio);
 
+void snd_soc_dai_set_bclk_clk(struct snd_soc_dai *dai, struct clk *bclk);
+
 /* Digital Audio interface formatting */
 int snd_soc_dai_get_fmt_max_priority(const struct snd_soc_pcm_runtime *rtd);
 u64 snd_soc_dai_get_fmt(const struct snd_soc_dai *dai, int priority);
@@ -473,6 +476,10 @@ struct snd_soc_dai {
 	unsigned int symmetric_channels;
 	unsigned int symmetric_sample_bits;
 
+	/* shared BCLK clock for cross-DAI rate constraints */
+	struct clk *bclk;
+	unsigned int bclk_ratio; /* BCLK = rate * bclk_ratio (0 = use channels * sample_bits) */
+
 	/* parent platform/codec */
 	struct snd_soc_component *component;
 
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 2f370fda1266..6c5a02562e74 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -116,10 +116,27 @@ int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 	    dai->driver->ops->set_bclk_ratio)
 		ret = dai->driver->ops->set_bclk_ratio(dai, ratio);
 
+	dai->bclk_ratio = ratio;
+
 	return soc_dai_ret(dai, ret);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_bclk_ratio);
 
+/**
+ * snd_soc_dai_set_bclk_clk - set the BCLK clock for shared clock detection
+ * @dai: DAI
+ * @bclk: BCLK clock pointer (or NULL to clear)
+ *
+ * When multiple DAIs share the same physical BCLK (detected via
+ * clk_is_match()), the ASoC core will automatically constrain their
+ * hw_params so that the resulting BCLK rates are compatible.
+ */
+void snd_soc_dai_set_bclk_clk(struct snd_soc_dai *dai, struct clk *bclk)
+{
+	dai->bclk = bclk;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_bclk_clk);
+
 int snd_soc_dai_get_fmt_max_priority(const struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *dai;

-- 
2.54.0

