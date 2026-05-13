Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90BA3EDE5D
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 04:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778647979; cv=none; b=BAVrCqcz5vQuksJrbYIlFEi1aNVhHZC4cXSjz4D391Mo++CZrFyV7QnH9xslcSpBQXrQ1dcGeKeqS7NLkXCmhYOFg+/Z9UBlG6GeA+yZzs2PKjzO1bKujrp93AaV+EDKuFh5DSGZzncxsYc0BZvm5uTGcCEGPVw8USFxB8d6+oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778647979; c=relaxed/simple;
	bh=XYpw6rCkqj+Mhw43PGFGoD0pB2Oi0MaRB06nJOwNkOg=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=XAC1ioRzu+wA/a2Emc7afSbgWMAs99/fzrA1LNYZvkuQQthcpJ4OGdt4ZcU14du/95jiUDkiMx+t6srDTcvpAbW/aIowN0ERPVkibCe4VtZkWd4n4biFo6n8+GIiy1jZvzYMEngqoCXj6QUqUT33sL3biVx9w/43be8kgMqy6+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=APhCaY8s; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="APhCaY8s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1778647967;
	bh=unYS6C5TavL4Q58csPsAxiafXr6kgzCBwkUp28wjDYw=;
	h=From:To:Cc:Subject:Date;
	b=APhCaY8sP1GhnlvpaGyu/uk7zTJDJwOEhUiHxIHLJFtEB5IJRdA8p3cYfSRBcDP7x
	 6XCqmKYhcjRQ5GvbwzdmiZMpE9esthuNGmMIIn6j7219juYxZ3SXgkYJPrghMqSHcj
	 /w4BEV+SQXeOTlsPqxJgYE33OwkBqxmkKI2uM4O8=
Received: from xiao.localdomain ([223.73.200.143])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id D2C1AE81; Wed, 13 May 2026 12:52:44 +0800
X-QQ-mid: xmsmtpt1778647964tenw4dk6h
Message-ID: <tencent_93212098B8302E17913CEFCD29E77E07B407@qq.com>
X-QQ-XMAILINFO: Npv5yIQT4nxMLQZdzyNPE62tthhwxbkFWhXzvQ/oJlERTbCEA3dEd6fNd2qpCI
	 JZs2GyP32HtjFyEP/oWYyTV1Y+OYWbFjSZUbg6uaUU3v4sAgvgmgpQ1P6uuFHFJePWXsyhCeuh8J
	 h3bgIeL59YhxbMwkQ2yrpvflAjIDO1mg1tf/XnIh9yB6Ygt3R0Xp1elTs5Qk+Q/Sm63vhPW3dYzC
	 OmJs4BBSJJE1pHaX1wIX4ALxwM5BjRsFcrVZ9ks6X+pUgt62iBWdvi1nqXG+vP4/mBINsH5aSaMq
	 yGxARdLHYVsMkC8PTTIZFnTO+lM+cfsEGxSwdUH9kz0mibD4yDuuYnhAgQ8Pc3tjPXIRrkFEipRv
	 UIIBKq/nrbkW/8HPWM7RGz+x2oQZqwHVg7a0ZqTWKj8gSHzK/E1jjPldE78WYiho9ic0XRHmxqZc
	 LOyRkXHNaHtI2HSJQAPFus0j9KqIcEnyGSsS8HYcHkbiyS8UI7Z0Kr9cx8NdaUYm1xB/6JTPs3QS
	 au82uO+X0bkpSP5GgWfK6J8+6yjVS3ljs+9bX+HcdGSAQ7P8w2aXl7dSUmNl5fRU/K9vPS7SOQ7Y
	 fBusAo7N1qhvz+Pv84j9QzIdes++j6/+rP02RJ/FuI94HORM/2/pchyu+YKuBULY66HWeY9miQl1
	 4NLA5ZgeWhEISVev4WT4S1xFjXdbo+nm+stZVkJoX1Xsslwk4FgrGa4GNiSa7dW8Y9lATW4n6Q05
	 droopaFt0YWDDQynbbCxbRmRDVW6di5i7FwJ8WFgu5y5UgmcI/S0TNXxqLYGBmV5QbdflkKa11KI
	 OZQNpt5ZivgvJRejXmc3b7Uo/0bfUMBKSACh88jMLH6gZMvWMy/gyup+fJPJYONNvC2sRspfXGUO
	 9GYgshRsBDwzYzKW6kq9uGAA35mXDc1rcVMDmwDr7eGHQ10T7vPyfsQHOgvMLxwMh1TKnEGB5j9Z
	 EXlkmU+gSz7YXBddduU1JYvoeXdecJq0PZv+HdWDDfmhPP0UWA8O6T7YjEwIHO+2rx5W65HSBi+E
	 kwCUc9BcW625Lh2xvrWpr6KvfOuC/5KOX5efeCD4mt2ApjyD2kaiEnmh8G5AM=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Li Jian <lazycat-xiao@foxmail.com>
To: linux-kernel@vger.kernel.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	loongarch@vger.kernel.org,
	chenhuacai@loongson.cn,
	zhoubinbin@loongson.cn,
	jeffbai@aosc.io,
	Li Jian <lazycat-xiao@foxmail.com>,
	stable@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Yi <zhangyi@everest-semi.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ASoC: ES8389: convert to devm_clk_get_optional() to get clock
Date: Wed, 13 May 2026 12:52:17 +0800
X-OQ-MSGID: <20260513045232.1699498-1-lazycat-xiao@foxmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per Documentation/devicetree/bindings/sound/everest,es8389.yaml,this
driver does not require `mclk', so the DT node may lack this property
(even the example lacks the `mclk' property). Therefore, the driver code
should handle this situation by using `devm_clk_get_optional()'.

Indeed there is already null checking based on CONFIG_HAVE_CLK, but the
driver will not finish initialization, as previously devm_clk_get() would
just return an error pointer. Address this by introducing a simple
conversion to use `devm_clk_get_optional()'.

Cc: stable@vger.kernel.org
Fixes: commit 0319c26889f7 ("ASoC: codecs: add support for ES8389")
Signed-off-by: Li Jian <lazycat-xiao@foxmail.com>
---
 sound/soc/codecs/es8389.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 8d418cae371a..449d9574b03a 100644
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

