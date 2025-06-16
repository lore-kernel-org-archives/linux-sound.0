Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6B1257458
	for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 11:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074861; cv=none; b=InqT/l3I9eEYVcipPXEWbc9tQ7KTBbF+s53qD8+RhK6SNayFwf0l5xZB0EK+Ehm3op5AELLZHa9ZbBmfKNcML3/F1cAznh/yDPkHS7M4u+yY22Ihy9l5bBdTfulraR/FBIDcnm3cN9u1kFJY/jItvsK+EN34OL4aoKHQ+3tyJ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074861; c=relaxed/simple;
	bh=02prJ0VqZ+GsFSoh42Mdecmpc0qDDL8ucou4yVC4PUE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mjKRLam/MUO9DusOWVTUgi2EBDyAS/S9NrFtyhF2Q7ydbE0aWSt3XBfgAHzUZA5Gzq4fbqVBelpytz0vSalV9y5ybjjhXJF9aqZZwtJbHrcPGGKk+dgZKy8bLhjBqCyY7wscO2EyS+uPC36AqLzQK3ZyJcB7VnzILYQbvCRzWqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wXbqDPBM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wXbqDPBM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-453486940fdso418865e9.1
        for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 04:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750074858; x=1750679658; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Axc5YR1xTLRmQrgaUwcSZbD+3O2bXFrl+qMuGw1iiww=;
        b=wXbqDPBM0/K1MF+mu2fGPBko+Dgn1j2LC+f+LfH3Ut/udryYxdBA7i2PACMlfOL3R4
         bVtRWuLCpdBMkzyDaidWOYTh7tqLc+HS2RlPl+HMFXes8+QJfOKXwYNR9QkMpjxeQY8X
         yRriD/tM3cDUJlVbuf2twRMLj6Xh0CU0FnJ+75hhomCJ+xZuM1nvvt6Z5qrIfXSfHruM
         SfE9VXIFb4weeEex7kl063X3tZxa9jIMhU8gKPyweIcbJDYjLhuebSB2kIVBTBfzY7BM
         EwTr30X/ugldFIVpyYmF5LNIJ/vdGf+qtXgsIyBbTa1RbnX5YWmljowt5IvzaEKnZIK1
         /egA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074858; x=1750679658;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Axc5YR1xTLRmQrgaUwcSZbD+3O2bXFrl+qMuGw1iiww=;
        b=gEfk8o/5FwkQzqd9v22H9tN7znledzzZivrmtX4/ssrlhIYn7b1LpZTqyaAUTvc8rR
         5ixq0ODEC9v2sinXuu1I6ZbBjsniYRsgLH9kBRenRm9jM4CThmqAEZMQ7aJGjvzLB34m
         6rpEeZHTlASG/ZuLnJrzCXyuytaMr6P4/LR9eKih7+bx1XgP+gCogwkrW8UY1mzd93hP
         mKFOZK8oyhYnisW7g62yTtDfbQb0KWlI1EVYo8mEBt9IHzdmjQzaTCtDcyYr3W3uB1bH
         AqJhpILSnNbPKMMTpQlnii18d/80Fdt0ksThYZw1Gh/FVkLXBiJrBXS6Zo4vx8H30dhD
         86aw==
X-Gm-Message-State: AOJu0YzJNGR2tpMwncaJX6tTqMsZKAAA6eGU0/+hQUErtnNru7wSGYld
	7piXSnGpPpXoLOoE485GmolLlUAyBrcbOv6k5AtV/E4EpLYXrxpwxJfsac8p4myW8Lc=
X-Gm-Gg: ASbGncsqwvwUfLkmjHewqICWcrQf8pTFk6J5+CLSAJvsu+RJ77NpA0/Ne0inxJ9iaEj
	S0CjcJHfMZAsuyVNAi8/8pMoSx6TVQA9UZi1Pp7rPZ0RFPNwQXI7SBWszCeEkESOYRCJMo2NmOi
	gJq4B6DPsO+/VyJy5GqXlKzepy3W/OPGT4gsvWrNM0XiGBXB0YpLRw0FTJHMO9Uv5lg3oNvr4tu
	iCgYxE9aoix9Xsn7OXyzmPtiqwEwixZzuMnep/yHTu1ffDuqrWk0FBXYhIzWzLhPMuNATFyx3+P
	52MP29TBk9spkGj2cL9lDLvA11ij1vmnQwcaH7ooo4z0sYJkAZ53DZjXQvrJyPeIzSTytPguJsq
	yozCk85zk3NZmUta5Kg==
X-Google-Smtp-Source: AGHT+IGK+tjTTJ8c7IWrPMjC4mNJIkszghBU1YhqBDcjTY1QJn0mBt4ZAVrGF0h+GliE7t3u2AP5dQ==
X-Received: by 2002:a05:600c:8b81:b0:441:c5ee:cdb4 with SMTP id 5b1f17b1804b1-453418d03bcmr24960315e9.4.1750074857638;
        Mon, 16 Jun 2025 04:54:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4534172d2b0sm73485315e9.35.2025.06.16.04.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:54:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] ASoC: codecs: wcd93xx: Drop enums for chipid values
 (minor cleanup)
Date: Mon, 16 Jun 2025 13:54:07 +0200
Message-Id: <20250616-asoc-wcd93xx-enum-v1-0-a20a1b538509@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8FUGgC/x3MQQqAIBBA0avErBvQSqmuEi3ExppFFkolSHdPW
 r7F/xkiBaYIY5Uh0M2RD18g6wrsZvxKyEsxNKJRQkuNJh4WH7sMbUpI/tqx7zpHsldOGAelOwM
 5Tv9zmt/3A0CkqmNjAAAA
X-Change-ID: 20250616-asoc-wcd93xx-enum-844fe185f0af
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=867;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=02prJ0VqZ+GsFSoh42Mdecmpc0qDDL8ucou4yVC4PUE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUAXh4fdEUeN1mFITIPIKloYddzv7IJ5Ztjwb6
 /5e6Gfq0MqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFAF4QAKCRDBN2bmhouD
 1wqtD/4+dLjTdI0+yzJwDYJ9vFNIy0nSi1OSX1t4zVfDBVGcrIkx9dGHJD2s0MA4sNrwnK9ErXP
 BGI1BsM26eWmthFR/78QlweynU17aMRwbJ58iuBZ++DlKow8HiTyWlI8oRxFF5rONDuRzVx2c91
 aV1ZGsRbFZm8gr7ZHEggEk8S1cxQf9r8Uo8Ze0p5CHSrObyclPONAUVnwiAWvPbSf5xZrOt6ldO
 6UIlkqhlgbOSuE5MR/EWjovOrownpxBm+F7gBEQxIsioKOnWUDbUEjWVB/djNmxGI1mgivLHdzj
 Pn5r4QN5gSAW/8Ai6Kvc43A/dDj5qv8ybCkACjOmoumFrudj5qZ1heLdlccDMjRZZpP1z0jm2yf
 aYky7+1FzWNGLET7UmVQCoAb4wcFwZQHN8OAxlq0rBx4UEeMwmjBMnRf0HCCL01obhDUxRI1eSD
 IGWWM6RoCsoyjnQaA82W4W6hkIAdtXzne3FbDiTAWcE18K/XAa6FLc3lTCkDO2oUI1XSVkNWrQZ
 Z4urSCeaFZQ1XWpKiMC2mVphun5YIsSAd+ajbn7tmzwWpGbZ4FKa8DMZo9cbrG5U9OdZpZtleRe
 4OFQ8PzkRj4cgA72EuQMj30ceDrl0NCJHyBPo2xqbitaZDO+PkeB5isVKvyCRw44FudewtdDvzY
 curIW/BLZDgilmw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Minor cleanup while preparing for adding WCD9378 support: do not use
enum for values which are not an enumeration.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      ASoC: codecs: wcd937x: Use simple defines for chipid register value
      ASoC: codecs: wcd938x: Use simple defines for chipid register value
      ASoC: codecs: wcd939x: Use simple defines for chipid register value
      ASoC: codecs: wcd939x: Add defines for major/minor version decoding

 sound/soc/codecs/wcd937x.c |  6 ++----
 sound/soc/codecs/wcd938x.c | 12 +++++-------
 sound/soc/codecs/wcd939x.c | 23 +++++++++++++----------
 3 files changed, 20 insertions(+), 21 deletions(-)
---
base-commit: 050f8ad7b58d9079455af171ac279c4b9b828c11
change-id: 20250616-asoc-wcd93xx-enum-844fe185f0af

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

