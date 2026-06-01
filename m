Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EBF390C85
	for <linux-sound@vger.kernel.org>; Mon,  1 Jun 2026 09:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306210; cv=none; b=DYFihhU73VZTcpj+FBD2M4XLdy7GLChPreXWnCN/O1W2zfjvCIrAkVZMzbsF52RPCsQWb3MwJ9NTq98v1J4SyYHAaAI6NMaN1qPdQ6FUIcBsih8/n0mC1BUUcwVOdZboalRTFpQi78aONrw3VVIGdnmQT9yKXpbxDAVpgumKf20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306210; c=relaxed/simple;
	bh=WDBD7odW8qeNfAPZ82pQiC+MuUy5bvT0fucchfMOiMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QvxgJRP9en4YBMw8QCPoKPrHvgrgyE5wCOBOy3YTDABK53X/pKXiYi9/4OIya0QPNTbocx4Ygeuwn2wkGNVjlBu9ZSRuPyH0LFRQXhQeRufimYXvX4IzqqCVUQDBWOla9G6wTJDH/dlWhtcQm9d+TG6+kicN8Sjxk6XKfFvnIXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.59])
	by gateway (Coremail) with SMTP id _____8DxFOgSUR1qO0sPAA--.36724S3;
	Mon, 01 Jun 2026 17:29:54 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.59])
	by front1 (Coremail) with SMTP id qMiowJAxXcIJUR1qGOqXAA--.23311S3;
	Mon, 01 Jun 2026 17:29:52 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-sound@vger.kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v3 1/4] MAINTAINERS: Add entry for Loongson ASoC driver
Date: Mon,  1 Jun 2026 17:29:36 +0800
Message-ID: <9451dfcd6ff3048eac0656d3720908386128b7fc.1780304703.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1780304703.git.zhoubinbin@loongson.cn>
References: <cover.1780304703.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxXcIJUR1qGOqXAA--.23311S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEFCGodH18GJQAAsZ
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xr1UJw4DWF1UXrW7WrWUZFc_yoWDJrc_Ca
	yIg3yxWry8AF17G39YvF4xtrWYq3yfC3Wru3ZFqws7Aa4Utr9xtryDAwnIkr17Xr4ruFsx
	Za97Gr1xur12qosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j5ID7UUUUU=

Add MAINTAINERS entry for Loongson I2S ASoC drivers to track
changes in sound/soc/loongson/ directory.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 792bbcd4d40a..4d5a8d7f7acc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15050,6 +15050,15 @@ F:	arch/loongarch/
 F:	drivers/*/*loongarch*
 F:	drivers/cpufreq/loongson3_cpufreq.c
 
+LOONGSON AUDIO (ASoC) DRIVERS
+M:	Binbin Zhou <zhoubinbin@loongson.cn>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml
+F:	Documentation/devicetree/bindings/sound/loongson,ls2k1000-i2s.yaml
+F:	sound/soc/loongson/loongson_*.c
+F:	sound/soc/loongson/loongson_*.h
+
 LOONGSON GPIO DRIVER
 M:	Yinbo Zhu <zhuyinbo@loongson.cn>
 L:	linux-gpio@vger.kernel.org
-- 
2.52.0

