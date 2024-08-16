Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F57139579
	for <linux-sound@vger.kernel.org>; Fri, 16 Aug 2024 09:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723799544; cv=none; b=K3XaALafLopwlsCufKQVP2cLue55zqQCWBSx60ZxCjoKz3l+CxK91D98qrpgFOQeVlCq3Kj6Rgv4OzzrU7FJEtPADWPyI8Uuz02j7m/pgXB5jXmCLsUKHF5aTyNywKaNYVR0ViSs9HPzG6dbBkm4kWvncFcwu+G9fpPMMBRaAt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723799544; c=relaxed/simple;
	bh=uvPfs/sxceMFOcpt6ca5ZNnxd1WJmw0aOuCls/fF4tk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NGZo1+niTrurVNWzSnfo/cW69REQf2lUpzuivdgbKM14VkF7LlFLNVlnCNh9h82dd+gxBFGQx3HfPy5xvwL3zSga8iQ/1IJFnrAihY+mSSDvEmtX7VvTjUlb9yezcX1xc2hu0WNIYp0zqBElH/P7gpjFsDuTLuzyw9bgX/XjFT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YCf26TwE; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YCf26TwE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4281c164408so12146835e9.1
        for <linux-sound@vger.kernel.org>; Fri, 16 Aug 2024 02:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723799541; x=1724404341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WllYCtmCZzHsMxTLdu431wvQusgsnPG7xw41l1l/SJI=;
        b=YCf26TwEuMvUmoJU8bY5TfLXC3LSgXyVlzoa5ZaJ8xIqGiLWgOYEEoYVok+Db4v6I1
         yCmA/i6aqwVwqje5Tg3fxFFN5wNVHDD01txonwCZVGmIeai/CnN+aGzLuILcgil6OnLI
         AcncqUtEH65inDJsyCUmaJ67qcFszXMoCpdTfh7WxEpls/tHBd4ToeG0ltBraQ7FJJ7T
         5dcTa2PF6ElTgXcIAac2ez+Cvh1pQEYqFG/ceDADw+ZnjEUbb7i2Wxu6tpHJr3CQcoF+
         xpPwuvV50Srn6+eorocKfDxwzNUODFE7U290WIbP/+ouxDnlu7HScPma2Prd6vg5/Lhn
         MklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723799541; x=1724404341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WllYCtmCZzHsMxTLdu431wvQusgsnPG7xw41l1l/SJI=;
        b=AAmthyeew+iJSgvayjAoS3qOQ6STh2urhDlTTpulPQ3+zM1ZudPhAq5fPeCTSkxUfa
         j09xaX55V4uccpZ93Db9slBVfUday/WKqKVLSTUmWSnCtswsJhv1AQB5ZHFdhdXR7kGo
         0lNqCp5PUz2OFuIqSpncA/RFMsaDLw4MeIUKz9wlOlJNAFbWPgifuAyjGWOpXGzophfE
         1cT9ZtR1wYy6tY07q/ziJWeUXgcZHHT8a+C5uOfKvKfSE/0NFmrkrqEZn5kl9BgfhJP5
         zV6EhxN8UNGiZ31CjSuljUiLzxzh5Mt70FVDdd/JFyykzfYl17gp1HdgFgiFOV0VLzb2
         lvmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9jPvhjzkikNdyVldusV4VoZWgNjissJuqo0Jlc/tIQu6KtAtjikvauS87hyLjWlxLSL8iREsf+zB9XaWg9sCvD6fpppsCISWo66g=
X-Gm-Message-State: AOJu0YwlYCv1/1AIGS3ndl2S99+LwYErgaGAgfUC4ZickdWB2rAzWi/x
	NMwBP3u/tXF6YuWgvcZzdL1OCV8R0lsKg9OUT5Czov5mK2vfa3xtV5AwsnUU0LI=
X-Google-Smtp-Source: AGHT+IGvQ9bU4HwT1y0LssYKgZiF6iaa0214ap/5xVyvjFPYigK5l5fFUuG/x6CX2HWGTdPrbEznbA==
X-Received: by 2002:a05:600c:3550:b0:428:fb96:e94a with SMTP id 5b1f17b1804b1-429ed788f3amr15403345e9.9.1723799540837;
        Fri, 16 Aug 2024 02:12:20 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed6507c4sm17525635e9.15.2024.08.16.02.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 02:12:20 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amit.pundir@linaro.org,
	dmitry.baryshkov@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2] ASoC: codecs: lpass-va-macro: set the default codec version for sm8250
Date: Fri, 16 Aug 2024 10:12:10 +0100
Message-Id: <20240816091210.50172-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

sm8250 and sc7280 have lpass codec version 1.0, as these are very old
platforms, they do not have a reliable way to get the codec version
from core_id registers.

On codec versions below 2.0, even though the core_id registers are
available to read, the values of these registers are not unique to be
able to determine the version of the codec dynamically.

Add the version info into of_data, so that driver does not need to use
core_id registers to get version number for such situations.

Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	- updated commit text to add more details

 sound/soc/codecs/lpass-va-macro.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 8454193ed22a..e95d1f29ef18 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -228,11 +228,13 @@ struct va_macro {
 struct va_macro_data {
 	bool has_swr_master;
 	bool has_npl_clk;
+	int version;
 };
 
 static const struct va_macro_data sm8250_va_data = {
 	.has_swr_master = false,
 	.has_npl_clk = false,
+	.version = LPASS_CODEC_VERSION_1_0,
 };
 
 static const struct va_macro_data sm8450_va_data = {
@@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err_npl;
 	}
 
-	va_macro_set_lpass_codec_version(va);
+	/**
+	 * old version of codecs do not have a reliable way to determine the
+	 * version from registers, get them from soc specific data
+	 */
+	if (data->version)
+		lpass_macro_set_codec_version(data->version);
+	else /* read version from register */
+		va_macro_set_lpass_codec_version(va);
 
 	if (va->has_swr_master) {
 		/* Set default CLK div to 1 */
-- 
2.25.1

