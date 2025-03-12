Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77C02580D0
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 19:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741807657; cv=none; b=iljQB/hzsVvSi5rUolCf6NXBapXTUCj5bi0mHRR2FutAo1wPa7/+MSZ7mXn8jdKyFO/lcQzKMMsfIC+MFi84HVgvDWowkV5stIuV5ucpQejfwqwWnHm37FuGffCZ4rAXas+eMGyNd7W74iZLnE+Hcv6Zd9tzSaUn3/NgriRSrhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741807657; c=relaxed/simple;
	bh=FKL/weB5CPeWneGPsiZ0VbwxQPs03W/Eqnc+Zbi9MsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NicOa6baGt1n8WV/wScMPYG4qe1lph3ulJcn5ZC8kJ+z2SLFKiMUyx+7ULe0qhC5YSiMkiYNqAj738I/RmDCqxsQdZLktCPU7saTUG5uXhLC23T1XgYgsuzFwGppDfYCVD/yTZnwLOZMvthHo1MDrDv5PJVL1SBfNNcX8k3YJDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3mltykU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3mltykU"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ba8bbeae2so230135e9.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 12:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741807654; x=1742412454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qbK7lmYRGi8wVIRtYM9Yu+84pO626UJc/Ub+6h4fj0=;
        b=W3mltykUTvkM/KyRQ/LxIpnNURuimCw4zne/kgt1XBdTTdX3RXc8HfKRSi6YNGgBUc
         E7L6ZUo5MKtKmuKIwX8iUhf4PvVxX7H1O5+evqVCA3gR/9NVuVNiCUiW0S0amWDkBPrf
         dJoFTXZ4Lg44H2Xi5fDz5C0H9QXaGZrEhUlnLb/kWeCbDCcBk7b5SP4+KE+ZFHiw4eyo
         qsBhzPq0aXvaXvRx1IDHTXzH0AbVN7F+j5xsoc1CN96/ieOybzqMfwJ7NEcUGWyFmCHx
         t4hP2iA1tsdR4IaorZyM2udlqPeeqKt9e7jOCZGf7rBCxGGXHRoipXjDUn5sqT7d5s1U
         ZPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741807654; x=1742412454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qbK7lmYRGi8wVIRtYM9Yu+84pO626UJc/Ub+6h4fj0=;
        b=Gn7df/96rxr8FlMVTOoABph6yY4yujepwnaSgS8Yvf4YohXiey8KiCfzPs1rg19rS5
         3DOPg8eam5QR1mJq4OqrndwZkzNGBkO/+1GrGYmuvZIDwey12Nkd9PzfHnVZhxd2TZs6
         w8Q0lOxAWPTSa1W0QZHnRgxUxSOLUirPIrr/QWpkKYrlifZS+1lgYvXckoYDh3vCTRLT
         PS8yxZWPehDFPKUiWs6piUwRQaOyQq8EqPo2OWsnVLmnFsTC+jkH3RD83ElL/uytvy+G
         MsgGhDQs+ziBahL3Pl4TxHCfGHb2Grnqaj/WEJ4w5XM00qZwVdCF7YeuEnoapFGfFxZe
         UpAg==
X-Gm-Message-State: AOJu0Yw37dl10i30NDobPbJaT8OXsrU4gUnDni+NzGEPcDIGerD6Ai1m
	1Nybx/fNPdThD5QpvSWqImDZV7Oz10F9zPRHsCKY4BpzC3tnM6381RHDKIiIz7k=
X-Gm-Gg: ASbGnctQjtwEEuehpKQ1zroXI3KvGqqID9p6bH3dvEqY/wZcyxBYvg14u2S1bavTOBw
	LQQLoT6II8z7NjsnY1lJE/9FbWDOdEHi5NbKXhiBTOUXV0tfe5+MBCsrAYdn5igI1CIEQqy3SVa
	NJzQwGJQzhilTvFal6rgLh5GWGyt17TBmgpaSNfOcvBev790oXSYABghNnzYHN9pdx76JYjja8/
	FuoQH4pUhAkPfTR4xOebHi0Woy+RxgvM8KqLU/yc9WRj+dqIVdQfwsPn95yJtBweeEcPYnDGjuv
	z/8xnwPK5FCQTQOIB5Ahv7PLV1lt1AGgITo9qDJZUMmeTlHEWNuZ4XU6dJI=
X-Google-Smtp-Source: AGHT+IFxBzA1CjBiytvmBHMoKUHzC09eJ11SY49j1nNlMfZkupbs5qfdSdty45s06t4JCu4IiJZMhQ==
X-Received: by 2002:a05:600c:5107:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-43d01c12945mr37427075e9.3.1741807654092;
        Wed, 12 Mar 2025 12:27:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a7903fbsm29331995e9.32.2025.03.12.12.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:27:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Mar 2025 20:24:59 +0100
Subject: [PATCH 1/2] ASoC: codecs: wsa883x: Correct VI sense channel mask
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-asoc-wsa88xx-visense-v1-1-9ca705881122@linaro.org>
References: <20250312-asoc-wsa88xx-visense-v1-0-9ca705881122@linaro.org>
In-Reply-To: <20250312-asoc-wsa88xx-visense-v1-0-9ca705881122@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=975;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=FKL/weB5CPeWneGPsiZ0VbwxQPs03W/Eqnc+Zbi9MsM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0eAh/LQoK52qOZjR6vj46xf8OTmRScxCMYReW
 EcB8rKjv9+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9HgIQAKCRDBN2bmhouD
 1x/yD/9ksWN3WISxFG+1/n+g7hrVsU9+/hkl3RcDOUBH7L8fobh9sViifZ+wwB47z8g+TQZHu9U
 TDFSQv01YwbuGxG3y7iNLlIWN+nWgVkbY+HF6aJtPeLaHCCwdtDTmwmvrWFIUDL7Q1/O/h24yyj
 tJ2nE9mobn3O0ekv5kVuCVAQKMlAbZW5H2EYmyoU/Ii8oYsTRWe1dy0lT2uEDu5b/pGCKXyFTvh
 VfBR6tLGCjzJYtYQNdp94KPNqoGSh+ymH3nNNJ2EZgW5JSzGv32qSi2hQ70lD0qF3S+TjC+rx6c
 LsoCw/UBYYM275w8JE5vDLbqXLExxV4en/Hj2wJJcpNWSvI9qf0lr8wF7IvHrBPa60ADWwGw6+z
 cbI0X6UBuarq2S4ueeOwK8uDpXRycLLkoYdXkv1jtdQn9pv+dDyriHByVqTwN/8kz0MdCkUaH8Y
 QlZDK8BfPwZvDfVE0UzZ6qAnF46xOlbdB2J/yzsdt3s9NdOWjmjyBFbVhS+7jgnpMUandPZAtvU
 +Fbg3TBkp61qMISvb6MOuMmnJXfdJB5JpBQwI2CuLW7r99zN9fPOnj7J+bseOmn3HUZEyBT2Vlw
 +zRoxOECSunwhCMpVn5ROsJhQJ7EK2XTZbu3qFqV/MC21ZWhd+ScF+Wir2fxPB4BkCEkDkak6CN
 YO6Zsp3q2DhFjJA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

VI sense port on WSA883x speaker takes only one channel, so use 0x1 as
channel mask.  This fixes garbage being recorded by the speaker when
testing the VI sense feedback path.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Srini,
I cannot get 0x3 as channel mask working, but I think it was fine in
your case?
---
 sound/soc/codecs/wsa883x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index a5a6cb90bb43c83de2b498f163d23c52f164ecb9..238ddf0aac3b28f2d0d8b08a069aa2dadea01ff1 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -568,7 +568,7 @@ static const struct sdw_port_config wsa883x_pconfig[WSA883X_MAX_SWR_PORTS] = {
 	},
 	[WSA883X_PORT_VISENSE] = {
 		.num = WSA883X_PORT_VISENSE + 1,
-		.ch_mask = 0x3,
+		.ch_mask = 0x1,
 	},
 };
 

-- 
2.43.0

