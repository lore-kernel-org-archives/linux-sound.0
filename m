Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF39C37F73D
	for <linux-sound@vger.kernel.org>; Sun, 29 Mar 2026 16:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774801964; cv=none; b=N1JXFE9CyQ7GaQ73JUki3J7wdStuWLrBdHqP22WTkFNRy5TeJPA/H4A76tHAVZm7picN0d/cVGPF0frCTc4jf+wkrwuFiS77EMKUZN1m9M93/w907fjEpFXBUoLqzgua8L7KUDBTK/lqK7YhrhZ5WyBIlQ2o5o309M8ljHSHLhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774801964; c=relaxed/simple;
	bh=OsH+XaU/LdG1MgJog3EKxeHIfWRW4v8IQt4TToAq+Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZvEb6p5GmVfBxWvwgHlk7/tgrDWLyTW1MvNM7R3bnA2VF/uchC4OvJO+9amWfaz4JfFafMqOoV0/CX41sXL5CzWQ+QJkqBgzaSk5n1+oefjUq/LFEQl98TE7Ay/XOey5vKYbmSWWaCZzitX+0vkBBd0Jid8OJZtsx6Jn7vFpv8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AqG0hTn6; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AqG0hTn6"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774801959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+uWaFI1B5um5iR8rXjg5h5IEWXydoejLkEYSf/v/l50=;
	b=AqG0hTn6ZiJ9nsJnODLi1h38MUuY0POMQJMSWiQV+44K71ciFwxsfMHOAA9AZkFbOsvcDZ
	gXHzpL5FeJGrt9hBI53X4ufzZuDNSU8JSywt0t4tUZkdb2eD/cKBNpwm4uQ+CcjlIiDLKm
	uZKd6Ny33A50wSJUXClO2idBuGSSsVY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Alexandre Ferrieux <alexandre.ferrieux@orange.com>,
	Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: inline i2c_check_functionality checks
Date: Sun, 29 Mar 2026 18:31:46 +0200
Message-ID: <20260329163152.366356-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3489; i=thorsten.blum@linux.dev; h=from:subject; bh=OsH+XaU/LdG1MgJog3EKxeHIfWRW4v8IQt4TToAq+Zw=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJkng39IHL9h0l938trh5au01yhoxGZ++fLwVuUjR8Esc XuOqgelHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCR6ARGhjV71622Wple3HPs 1sTko8dlrgTpXf4xbeOkg0GuOdnsr9YxMuzQzV767mnM7tVHNhqVWqk+frmlaY+U+6P7x8uMN3L xRTEDAA==
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Inline i2c_check_functionality() checks, since the function returns a
boolean status rather than an error code.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/codecs/aw87390.c  | 3 +--
 sound/soc/codecs/aw88081.c  | 3 +--
 sound/soc/codecs/aw88261.c  | 3 +--
 sound/soc/codecs/max98390.c | 6 ++----
 sound/soc/codecs/max98520.c | 4 ++--
 5 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 613daccca3af..37ca42a25889 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -544,8 +544,7 @@ static int aw87390_i2c_probe(struct i2c_client *i2c)
 	const struct snd_soc_component_driver *priv;
 	int ret;
 
-	ret = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C);
-	if (!ret)
+	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C))
 		return dev_err_probe(&i2c->dev, -ENXIO, "check_functionality failed\n");
 
 	aw87390 = devm_kzalloc(&i2c->dev, sizeof(*aw87390), GFP_KERNEL);
diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index fbd1fd12381a..8c5bb3ea0227 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -1253,8 +1253,7 @@ static int aw88081_i2c_probe(struct i2c_client *i2c)
 	struct aw88081 *aw88081;
 	int ret;
 
-	ret = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C);
-	if (!ret)
+	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C))
 		return dev_err_probe(&i2c->dev, -ENXIO, "check_functionality failed");
 
 	aw88081 = devm_kzalloc(&i2c->dev, sizeof(*aw88081), GFP_KERNEL);
diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 43c03d3cb252..45f70fc78f87 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1237,8 +1237,7 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 	struct aw88261 *aw88261;
 	int ret;
 
-	ret = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C);
-	if (!ret)
+	if (!i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C))
 		return dev_err_probe(&i2c->dev, -ENXIO, "check_functionality failed");
 
 	aw88261 = devm_kzalloc(&i2c->dev, sizeof(*aw88261), GFP_KERNEL);
diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index ff58805e97d1..65f095c47191 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -1015,10 +1015,8 @@ static int max98390_i2c_probe(struct i2c_client *i2c)
 	struct i2c_adapter *adapter = i2c->adapter;
 	struct gpio_desc *reset_gpio;
 
-	ret = i2c_check_functionality(adapter,
-		I2C_FUNC_SMBUS_BYTE
-		| I2C_FUNC_SMBUS_BYTE_DATA);
-	if (!ret) {
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE |
+					      I2C_FUNC_SMBUS_BYTE_DATA)) {
 		dev_err(&i2c->dev, "I2C check functionality failed\n");
 		return -ENXIO;
 	}
diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index 2bf8976c1828..5bc3d95ade5a 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -681,8 +681,8 @@ static int max98520_i2c_probe(struct i2c_client *i2c)
 	struct max98520_priv *max98520;
 	struct i2c_adapter *adapter = to_i2c_adapter(i2c->dev.parent);
 
-	ret = i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA);
-	if (!ret) {
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE |
+					      I2C_FUNC_SMBUS_BYTE_DATA)) {
 		dev_err(&i2c->dev, "I2C check functionality failed\n");
 		return -ENXIO;
 	}
