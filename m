Received: from mail-m49245.qiye.163.com (mail-m49245.qiye.163.com [45.254.49.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8F52DECBA;
	Wed, 12 Aug 2026 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527673; cv=none; b=I0rnmllsgYGaP7qmVnYtRFBgXpObvElashddfVrUZylKUUdHsTIW62qkntHcYnYhTO3ORBxxOYI+yCVlYSqVjfvhtiaj0w2ZUpZGfAEBWloHJ/JhmQQGnwsxKp06Ds4ooW4m4pofUrtGeRlkoCDlI2SzuRH0o8z9Ao2ErrIg/oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527673; c=relaxed/simple;
	bh=InXn3TqLVWbLRMgs9YDP4Kwej98qn4Ez/ghxIgrVwqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D56Uo94hN+opkPDMNWbxdE52szQDOeizCwvgzPoPrkvFNhJsL/Q2a3Czi/GVM1uxIwxEBw4aJJztTmk9FNpI8IrzXKxMzygyvhYv1nQvZc6AWKFJJedU6Cx6HmE3tiaRB32nbZdubHvlgLUIKLpxu6r3wCgZ6nAYyTsKi/F4F24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=UP5aDKUj; arc=none smtp.client-ip=45.254.49.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="UP5aDKUj"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49b6d9f33;
	Wed, 12 Aug 2026 17:35:55 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 12 Aug 2026 17:35:44 +0800
Subject: [PATCH v2 2/2] ASoC: codecs: es8316: Add regulator support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-es8316-regulator-next-20260722-v2-2-e7078bc9bc9c@thundersoft.com>
References: <20260812-es8316-regulator-next-20260722-v2-0-e7078bc9bc9c@thundersoft.com>
In-Reply-To: <20260812-es8316-regulator-next-20260722-v2-0-e7078bc9bc9c@thundersoft.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786527351; l=1656;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=InXn3TqLVWbLRMgs9YDP4Kwej98qn4Ez/ghxIgrVwqo=;
 b=7IH+o/6jIw/2YARcxdPIoc8ZJ/6ntTimgoLSzG0rEnBw1Qhlvl+VYcw3pXTaUXMZqlkx4wrZg
 iK5BfgXNfILB4g5/Q5AVZ+BUJbNn6MKwl+lOLWuoHPgYvgz3vOljDUB
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9ff554109a09d5kunm921ee5013c51de
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSRgeVkkZH0xKSUwYH0NOQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=UP5aDKUjj+RLUmu2at0x9EjR+OhHJPuwmFeG5V9qiKCjc6whYzfaHwjqjAu6hOCyrveeUX0nfgODbr0lrkmJTxvWV8vPIG2BgWQneUrMaO4xwvHpVQpEDWWMMwtxh0371sh7/RtBKQij+1BXwKXpSmEkK13oLf8V5A0IJd+yndM=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=9ryxRayFZn/sNJpVa4V/vzQ/X7ITPFlxU2cTmLcGJKE=;
	h=date:mime-version:subject:message-id:from;

ES8316 has separate AVDD, CPVDD, DVDD and PVDD supply inputs.

Request and enable the supplies during I2C probe, before initializing
the regmap. Keep them enabled for the lifetime of the I2C device so the
regmap cannot access an unpowered device and its cache remains
synchronized if the ASoC component is unbound and rebound.

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 sound/soc/codecs/es8316.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 87f331868dc7..24ec8b211cdb 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -15,6 +15,7 @@
 #include <linux/i2c.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -31,6 +32,13 @@ static const unsigned int supported_mclk_lrck_ratios[] = {
 	256, 384, 400, 500, 512, 768, 1024
 };
 
+static const char * const es8316_supply_names[] = {
+	"avdd",
+	"cpvdd",
+	"dvdd",
+	"pvdd",
+};
+
 struct es8316_priv {
 	struct mutex lock;
 	struct clk *mclk;
@@ -866,6 +874,11 @@ static int es8316_i2c_probe(struct i2c_client *i2c_client)
 
 	i2c_set_clientdata(i2c_client, es8316);
 
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(es8316_supply_names),
+					     es8316_supply_names);
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to enable supplies\n");
+
 	es8316->regmap = devm_regmap_init_i2c(i2c_client, &es8316_regmap);
 	if (IS_ERR(es8316->regmap))
 		return PTR_ERR(es8316->regmap);

-- 
2.43.0

