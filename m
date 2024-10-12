Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5B114EC51
	for <linux-sound@vger.kernel.org>; Sat, 12 Oct 2024 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728727807; cv=none; b=uYBzmfd64rwouIu1q5Dppvkhq4MK+CEIWdUL5fk1MbU2eBV1KpQsbRPNClUtgFMlWvLmee3QfOOhHIHPzy+7caBme04OO71yJbUPnGRIMP1/SHBHQYR2jWuK9PfwXXViMLxxGU+Kl8JCkY0j208b2CHf4MDUqaRLEGsJ+XEDonA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728727807; c=relaxed/simple;
	bh=/N/JcDO+6CWWbhryzqtCbbOf8//DbO7y9enT4qub5c0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=R3RRjdtYvnnywqkEGCpQVK/S3vxp40EKMo3SaIe1yWA2W14hZ7sUGzPVtxVHi2K/pdhKQ7d7VgYFJOSIl3hvDHsN0ocV8pyWvtjlKavUnu1aOKBfX14r0xbqRdLjNis4OOEWsGi64oCLOMn+fnw6kF18ClrjSI50kKp5UYoqRqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wFpjKRER; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wFpjKRER"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4304ea60a58so3128035e9.1
        for <linux-sound@vger.kernel.org>; Sat, 12 Oct 2024 03:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728727803; x=1729332603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MGmGeTLwIiqZ3Ze1waxn/VoLJ2wqz8u5IQzeHL1oriI=;
        b=wFpjKRERnB2paY83Ct4tKt1I3G/WP5G3idq+HG+/U0IOKXcuzJwwDv7kWO7vY0qpaN
         Ar1G7MGvH6fThVWOANkUFeC8YFaQoMm3EXt0ea3hD5d8vNphLqzhhAg+s8ocfRuprRkB
         o49tq5JZiLEVpT9t50GQ/sflkiVkJW4YLuCAqffeAMJuC8DoAHR91w+12tfU32td46Mo
         rJ7H5/uW6ktoJX/oqmIby469jkghA1++wLURC3uMcXhoGsAZ9v1diRpBvQ5sRM3dKKh7
         kSJA7ofwxP3Oy4lyBmmY3Cj3Mt4bVizk3xDyjeATbAVoXWXKdauvbr37xjDNLIqGOYAG
         yiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728727803; x=1729332603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MGmGeTLwIiqZ3Ze1waxn/VoLJ2wqz8u5IQzeHL1oriI=;
        b=uonCcpH9sHhfaP3Aw7GaNosxF87WmNzUA7xHQdgOIdomPIhftui0bo2RqsMgApQ9QK
         JMU8kUhiipZv36CawMY0PiaTvkv1aJavM/1XBwZeGdz32UwuaJlfBgXI3y2fsJ4SQrc3
         CqCXCfJaQi374vDLF1zSPQL1emEhxCRG6jB7olKYAiO4ljkx35J2lgdTSVj/P+4joxSP
         TFVBbkxE5xytFGd2JkHpb+JJbRiGyNEUMbBGdA9yNoZ7k6QQ/ASMaP7SCEq8DzQGU0MN
         8ZfTodThqjxDX/r1G61KnsvMdlXlRIya9KsQviQwWyi/mRMXxPQy9sske4l+AECCpzEe
         Zmsg==
X-Forwarded-Encrypted: i=1; AJvYcCVquQLBA4SR9uzTegNtvMoaNHR3PrznAZmFFNeYPVVzu1QvAfDHG2GCP8uiMETIciuEBfGhuG2yx5v4jA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMx9NRuOYp52tVuxXrdO1MF0nrr2uQBc5gqelRbcDB3dtS8J+L
	rL2/lS+Eewtr8bs1gUr3d9hYEoUVZGJWPqI05K7vqxIKHFOkWhHsrsuanJDtins=
X-Google-Smtp-Source: AGHT+IGOZaLCfa491XV9D3GxZzkODzZuwV2ZBJ7At8DabGFGe+8w2Ai750NiESQ8kKvTi0zY0Y95eA==
X-Received: by 2002:a05:6000:186c:b0:374:cd01:8b72 with SMTP id ffacd0b85a97d-37d5526f177mr2119893f8f.9.1728727802978;
        Sat, 12 Oct 2024 03:10:02 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6cfcdbsm5963998f8f.58.2024.10.12.03.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 03:10:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: qcom: Select missing common Soundwire module code on SDM845
Date: Sat, 12 Oct 2024 12:09:57 +0200
Message-ID: <20241012100957.129103-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SDM845 sound card driver uses qcom_snd_sdw_startup() from the common
Soundwire module, so select it to fix build failures:

  ERROR: modpost: "qcom_snd_sdw_startup" [sound/soc/qcom/snd-soc-sdm845.ko] undefined!

Fixes: d0e806b0cc62 ("ASoC: qcom: sdm845: add missing soundwire runtime stream alloc")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 762491d6f2f2..3687b9db5ed4 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -157,6 +157,7 @@ config SND_SOC_SDM845
 	depends on COMMON_CLK
 	select SND_SOC_QDSP6
 	select SND_SOC_QCOM_COMMON
+	select SND_SOC_QCOM_SDW
 	select SND_SOC_RT5663
 	select SND_SOC_MAX98927
 	imply SND_SOC_CROS_EC_CODEC
-- 
2.43.0

