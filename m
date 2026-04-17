Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com [203.205.221.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585272DC789
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 10:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776423320; cv=none; b=FBrv7l/FhJwIa/SpB8DaxbwnvEIDKzOWOiOzqDXlcfs7kFYoQPsGWQKxjg4GS7cjg/Mk8Ufgq2eNNLPMGlEldF3iG3IoXQ3DVANu0hAI9jG9mqqZJBFZ8gAV+iypqVTMXpeyv4wLpw8xXzaz8fPKv12o1eu8bseq0C6UCkIwiAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776423320; c=relaxed/simple;
	bh=kGZTUbmhy4eiP4AtkmuUW5syAYqt5qNBlLYRQJxQV9E=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=LL3XePKtYmXKaM2pF6jAiNOF4/RSzk9qaYpYMwl3PGIcwrmbOHBZg5fZc4zFADQAEYiIYRXoc96mkqB9+F5CGipJegj92DxqqCNuQdNh3FXZwQ5u5B3Wgq9/lLDIaz8o1TvT5Q7trWwocS19X3CWq5qaz9X++maApFcgY6utlYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=WJNCZXVI; arc=none smtp.client-ip=203.205.221.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="WJNCZXVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1776423314;
	bh=g0Efm9iDp3R7/iYHI4l7Hyn3MNRts+Fud7okjcZrse8=;
	h=From:To:Cc:Subject:Date;
	b=WJNCZXVIh0GX9sHgxPwjKETjhDJBGRO8H0nHRYHyvSNDPuEo1qHFfoBdZ3zy30+mx
	 yIGae+rNUfdLWV7xNdLT1ilPHjSPTbPDYBY3s1DEt6db/vug4APtXrWzCN2E9q8eVg
	 4Q5P+m6zxiSDTua2gFbdPbUCtSm0VVosCrY+hbgk=
Received: from xiao.localdomain ([183.6.47.73])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id DCB9606A; Fri, 17 Apr 2026 18:55:11 +0800
X-QQ-mid: xmsmtpt1776423311t6dg2xkk7
Message-ID: <tencent_7C78374FB9F4B3A37101E5C719715D8BC40A@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GrLY9JPAV4Tas8z9VRmrw72MhQWxWkcIIVE2pz5liVyFNFBAK8r
	 KzjWeQC/jtpkjHbr/OLLZfZ2f6H3C1rE5wKG2ukHB68RuWlpLeqJib7Ued+jM8vobDDy70mosWV6
	 S3N/DLveoxXXm73/fckuojlZYEZEqlsa1LcS+51PtaLYe7N4AI69PBgiPS6vtZL9NnaWXmkDkFBB
	 StWSzzctJ4kibqR6fe8ar5M1MyvM0A85j/2efyXayao96xtvLok6j0AwA5DSwcTAO7XwXwf8j5VO
	 pCYadoyRUupIUrtYowVPBqrpopVGeOetscNfvh+rPAJA+84l+cGnXaZR2CkF/qRerYBV2O4ZZHdD
	 D1ymtNSNpvYZZf/dO1NUfUyU2WfhVkSuLTHN0YU5BRb+i92l8E5r1w1A+sa6L5wpkYRGKmxAjf74
	 Owe98hevo3Z1/CGrO/ndKuDnppyKCHBWpjbWKt1L6j2/2YJ8cqZEZZn//VmnmKoqv5Rb9/PbKvKg
	 bucyTtvr5W4k/egEVJSD55MJ99D0KCsaBVIJtudNMWaczYoXSJoGhp0/caOj1De8oGFl9tE6qf1W
	 fwmewHfcn5hfc21fXxXF/qzqtICT0e6+8u9cTZTtjS/zOG3r6VoXo24/SA8t8tXAx++XVAfibvXm
	 +vHEmBxdgBhKOcDNEiy5PjutHMDT9HYSpF5sNqX2ugIW8H3Z9Iu8hTkdVDihaHqBT5d0Ly7jceGa
	 QQ5IPPQlI8qksv9QpiXF2wW+j0mF3c/3xKAUcPGgqqBsSZDW2U8702o4RojHwdgFUQ1++dRNKMmT
	 pb1K7I1mLM8+q0+chAX50Umm0xRvExM1S8bqjXH+MmiIC5bMi2Z8nS2pK5ONMJ64AsldyBFeWytR
	 7ZCNpqeDAiLh4jUfd3V8or7RlbWIRTJh2cExo7FJNVh9BSZ9Is1kVfiVtKM/O1E4ydm+wHLrRvfG
	 +mZbjYM5ysP6et8gSVAy+p0M3W2Lz6yA5QYe2gbF3jcPf9IrRJD7MaIyni3zbGfW0qVAjNtElxdH
	 NlAdGPViV7pM6WRNtIbufvspXNHj+ZIU9YqbMFNPC4edaBAZVOd84fXhd58z0NpAkuYFEDZy+Grx
	 jniCIMoPK6jrtq1P9GPKhqKzx+OLUa3U2Nq6heGX2a7LiNFYRVoIe6J1SQ3DLEMm+eQXRr
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Li Jian <lazycat-xiao@foxmail.com>
To: linux-kernel@vger.kernel.org
Cc: lgirdwood@gmail.com,
	loongarch@vger.kernel.org,
	chenhuacai@loongson.cn,
	zhoubinbin@loongson.cn,
	jeffbai@aosc.io,
	Li Jian <lazycat-xiao@foxmail.com>,
	stable@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Yi <zhangyi@everest-semi.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Alexandru Ardelean <aardelean@deviqon.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stephen Boyd <sboyd@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: ES8389: convert to devm_clk_get_optional() to get clock
Date: Fri, 17 Apr 2026 18:53:14 +0800
X-OQ-MSGID: <20260417105326.55762-2-lazycat-xiao@foxmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When enabling ES8390 via ACPI description, es8389 would fail to
obtain a clock source, causing the driver to fail to initialize.
This was not an issue with older kernels, but since commit
abae8e57e49a ("clk: generalize devm_clk_get() a bit"),
devm_clk_get() would return an error pointer when a clock source
was not detected (instead of falling back to a static clock),
causing the driver to fail early.

Use devm_clk_get_optional() instead to return to the previous
behaviour, allowing the use of a static clock source.

Cc: stable@vger.kernel.org
Fixes: abae8e57e49a ("clk: generalize devm_clk_get() a bit")
Signed-off-by: Li Jian <lazycat-xiao@foxmail.com>
---
 sound/soc/codecs/es8389.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 8d418cae3..449d9574b 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -892,7 +892,7 @@ static int es8389_probe(struct snd_soc_component *component)
 		return ret;
 	}
 
-	es8389->mclk = devm_clk_get(component->dev, "mclk");
+	es8389->mclk = devm_clk_get_optional(component->dev, "mclk");
 	if (IS_ERR(es8389->mclk))
 		return dev_err_probe(component->dev, PTR_ERR(es8389->mclk),
 			"ES8389 is unable to get mclk\n");
-- 
2.47.3

