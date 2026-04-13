Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72861DD525;
	Mon, 13 Apr 2026 07:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776063666; cv=none; b=s/0eH0LPGIRFGwt/yBU332kHEX3vgr2ONO/oalxpGhEY6iM9xgQhdWdtgJIecSbgk24tW5o2XW2jj6aue2evFVnpbOSBtX1kB7anSSsJmZ1srZgJNT2IuEVq8vuY8wYdP66B+BqNdghbltcweOOuLzsRgbURQndP4X2r25nPeHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776063666; c=relaxed/simple;
	bh=1HKOvPLmiRhDqs3UVxUan8MSLQViwHCe0xQrbCM5ryE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C1uQa4ifFUbbh9sKCEljfy68APPtxUxaSODXzjWdN3Cjky85IRHaeGLD7XTaDhL65O64wKFM/c6o5ldmzuZdKb1AktFsRRnEpOuSA/0I1nK2eXaDx5t6hF8Xrv3sTEsYpvRvqE8R0AdxpCBv3Xir7Pgks6oVz1ksz1ks0CX89R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TEvM/DN8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TEvM/DN8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AACFC116C6;
	Mon, 13 Apr 2026 07:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776063665;
	bh=1HKOvPLmiRhDqs3UVxUan8MSLQViwHCe0xQrbCM5ryE=;
	h=From:To:Cc:Subject:Date:From;
	b=TEvM/DN8fUc7aUhBFrZz9QSigO1P4bURZfHMNzbOUH0un59KHs9TtTxOZj/bmccDt
	 Js2UI0Wspsh3QTAy1psQjJD3nTUoHb/sd9sK1fJ4/y7Xd6ZQP5pzEJNrnBPnt9r6bI
	 b+GIWMnJjiiw6aATYw+WyhB30ju4D8KIs4lJO+6s3FYT67QNHmC3pmzimfThIcpoWO
	 JXUe94JQq5jw4q/sMQPca9JyDUE8ondkX1U7Ye+eHqTlwN8eUAhpqwex/P0uQ11+H1
	 FjCsdgCS7CfTtOpftWumWXGeLNyGT9HLdtTvL9KC6mYaCUoF84daJWDiXUl+Kgkx+s
	 8f7CZjK/sq9/A==
From: Arnd Bergmann <arnd@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tas2781: fix unused-const-variable warning
Date: Mon, 13 Apr 2026 09:00:45 +0200
Message-Id: <20260413070059.3828364-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When both CONFIG_OF and CONFIG_ACPI are disabled, the ID table is not
referenced any more:

sound/soc/codecs/tas2781-i2c.c:102:35: error: 'tasdevice_id' defined but not used [-Werror=unused-const-variable=]
  102 | static const struct i2c_device_id tasdevice_id[] = {
      |                                   ^~~~~~~~~~~~

Remove the #ifdef checks and just include the ID tables unconditionally
to get a clean build in all configurations. The code already uses
IS_ENABLED() checks for both to benefit from dead code elimination
and the ID tables are small enough that they can just be included
all the time.

Fixes: 9a52d1b7cb4a ("ASoC: tas2781: Explicit association of Device, Device Name, and Device ID")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/codecs/tas2781-i2c.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index c593f9da0c5b..8af30f4d68da 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -122,7 +122,6 @@ static const struct i2c_device_id tasdevice_id[] = {
 	{}
 };
 
-#ifdef CONFIG_OF
 static const struct of_device_id tasdevice_of_match[] = {
 	{ .compatible = "ti,tas2020", .data = &tasdevice_id[TAS2020] },
 	{ .compatible = "ti,tas2118", .data = &tasdevice_id[TAS2118] },
@@ -146,7 +145,6 @@ static const struct of_device_id tasdevice_of_match[] = {
 	{},
 };
 MODULE_DEVICE_TABLE(of, tasdevice_of_match);
-#endif
 
 /**
  * tas2781_digital_getvol - get the volum control
@@ -2083,7 +2081,6 @@ static void tasdevice_i2c_remove(struct i2c_client *client)
 	tasdevice_remove(tas_priv);
 }
 
-#ifdef CONFIG_ACPI
 static const struct acpi_device_id tasdevice_acpi_match[] = {
 	{ "TXNW2020", (kernel_ulong_t)&tasdevice_id[TAS2020] },
 	{ "TXNW2118", (kernel_ulong_t)&tasdevice_id[TAS2118] },
@@ -2108,15 +2105,12 @@ static const struct acpi_device_id tasdevice_acpi_match[] = {
 };
 
 MODULE_DEVICE_TABLE(acpi, tasdevice_acpi_match);
-#endif
 
 static struct i2c_driver tasdevice_i2c_driver = {
 	.driver = {
 		.name = "tasdev-codec",
-		.of_match_table = of_match_ptr(tasdevice_of_match),
-#ifdef CONFIG_ACPI
-		.acpi_match_table = ACPI_PTR(tasdevice_acpi_match),
-#endif
+		.of_match_table = tasdevice_of_match,
+		.acpi_match_table = tasdevice_acpi_match,
 	},
 	.probe	= tasdevice_i2c_probe,
 	.remove = tasdevice_i2c_remove,
-- 
2.39.5

