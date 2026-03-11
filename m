Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDFD2DA76C;
	Wed, 11 Mar 2026 04:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773204192; cv=none; b=TxTho9MOEbEvsFivlaVZOU51dRm7STgCPWf8Zfouo/7UQ1f60WBz0jX7x6hhmGVEpRGM7CR1niTHzevk2Fx9QKoBXF9IXBzOkRshje/O3kHz/6gT99p851vaOhWHf0xs7bEUfh2g7MyNCNtv5GvzHGfdqIjRWodLFleJX4lGqZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773204192; c=relaxed/simple;
	bh=93EXcXnifcaF7HDHeWtRgdbuE1QFQY7flspMSI1wep8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FuRkjuTjw/JaNx0CX96t9iGHX77bdCmkzO6utnmruSThUYs9wRFeYrOb8oBSzs0eaCernsogi0LuoiArr/Ku1czaauesBezHXd9oiv4DpIVNQeDCg4ANO9aQwkvWz6e3ZTdF9FpmXOYU2BRF3SW+Ah4a6iCgAx8+eN1+IeHSrKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HXLitwE4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXLitwE4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEFB6C2BCAF;
	Wed, 11 Mar 2026 04:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773204191;
	bh=93EXcXnifcaF7HDHeWtRgdbuE1QFQY7flspMSI1wep8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HXLitwE4myOuwJ/jzxsF+wCdy1/PH4Pq12VR8S664K67U0SXFInmKtzkGP+dIcvpg
	 YpjehWDyxciS6P48X0OC1+31YWXf7rqmppubU5r+DiGDo2pUnqKahKImTt1LB9v9Ne
	 wRpYnhM4ACfeZLmH9FE1riECgD1zsEFgwIDgT8F2Uv5z73NfEBhVZ+PURv6u30N9Gl
	 2dUaoHxj8+IhYxJitIqOdqun7u05O8LYkd7dW79jTKQy1TRYCbeHDRx8H6XiYnk0Ur
	 t9emrlEHaZL2gv3dustIx9kJwPdYAHjOEEk3Pyu7MpUg+cpsIXYS+H7kohnvzL4l18
	 wr188FBUObufA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BD2FD88F9;
	Wed, 11 Mar 2026 04:43:11 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Tue, 10 Mar 2026 23:43:05 -0500
Subject: [PATCH 2/2] ASoC: codecs: aw88166: Support device specific
 firmware
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-aw88166-fw-v1-2-2777563bb673@gmail.com>
References: <20260310-aw88166-fw-v1-0-2777563bb673@gmail.com>
In-Reply-To: <20260310-aw88166-fw-v1-0-2777563bb673@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773204187; l=2476;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=IUiKI3G7Quxrzr7+sMW/p+gunEW5XcQpZpT+LkFebXw=;
 b=Z3cLzOXp21cqtHEcGNTpuYnI7j7kXoHBjGXO1JnYqHrt3Rms60lwb6XDeHbVMK0a7+IwB4nKx
 X4Ba5qqv7bQCkbeMkv8rRz9+7yFCQdRV2oZ1ukvfAf1P9YZyE5mHbcH
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Teguh Sobirin <teguh@sobir.in>

This driver currently loads firmware from a hardcoded path. Support
loading device specific firmware when provided by the boot firmware.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Co-authored-by: Aaron Kling <webgeek1234@gmail.com>
---
 sound/soc/codecs/aw88166.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index daee4de9e3b01fb335975a65456cc79575533d7e..52d33a2f7cb12877138ea5083ad42e2777f8d323 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -1574,18 +1574,22 @@ static int aw88166_dev_init(struct aw88166 *aw88166, struct aw_container *aw_cfg
 static int aw88166_request_firmware_file(struct aw88166 *aw88166)
 {
 	const struct firmware *cont = NULL;
+	const char *fw_name;
 	int ret;
 
 	aw88166->aw_pa->fw_status = AW88166_DEV_FW_FAILED;
 
-	ret = request_firmware(&cont, AW88166_ACF_FILE, aw88166->aw_pa->dev);
+	if (device_property_read_string(aw88166->aw_pa->dev, "firmware-name", &fw_name) < 0)
+		fw_name = AW88166_ACF_FILE;
+
+	ret = request_firmware(&cont, fw_name, aw88166->aw_pa->dev);
 	if (ret) {
-		dev_err(aw88166->aw_pa->dev, "request [%s] failed!\n", AW88166_ACF_FILE);
+		dev_err(aw88166->aw_pa->dev, "request [%s] failed!\n", fw_name);
 		return ret;
 	}
 
 	dev_dbg(aw88166->aw_pa->dev, "loaded %s - size: %zu\n",
-			AW88166_ACF_FILE, cont ? cont->size : 0);
+			fw_name, cont ? cont->size : 0);
 
 	aw88166->aw_cfg = devm_kzalloc(aw88166->aw_pa->dev,
 			struct_size(aw88166->aw_cfg, data, cont->size), GFP_KERNEL);
@@ -1599,7 +1603,7 @@ static int aw88166_request_firmware_file(struct aw88166 *aw88166)
 
 	ret = aw88395_dev_load_acf_check(aw88166->aw_pa, aw88166->aw_cfg);
 	if (ret) {
-		dev_err(aw88166->aw_pa->dev, "load [%s] failed!\n", AW88166_ACF_FILE);
+		dev_err(aw88166->aw_pa->dev, "load [%s] failed!\n", fw_name);
 		return ret;
 	}
 
@@ -1802,9 +1806,16 @@ static const struct i2c_device_id aw88166_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, aw88166_i2c_id);
 
+static const struct of_device_id aw88166_of_match[] = {
+	{ .compatible = "awinic,aw88166" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, aw88166_of_match);
+
 static struct i2c_driver aw88166_i2c_driver = {
 	.driver = {
 		.name = AW88166_I2C_NAME,
+		.of_match_table = aw88166_of_match,
 	},
 	.probe = aw88166_i2c_probe,
 	.id_table = aw88166_i2c_id,

-- 
2.53.0


