Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4B7257458
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 19:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741807657; cv=none; b=iDbTgEQsdRDpbgsKhIC21SO2+K5lHdw3gpCByRan2XcKoUC9r5bTlhCCYTztm92Q5j2Iomo94WaG4BB/0WQ0m4Xlb3Lz05nQOvyPyRxsRgHuRp5gPagf3BhaPBfIB0giBvF8OG19KzwtTrk+HOWd6GZyGa7wXoT+WHN4VLBRWTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741807657; c=relaxed/simple;
	bh=8J3A0ji22Y6h/FDPK1qt+T9Apzwb5fa5VQDP9nUjmp8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=to7bo3YpfV36wKoCN0R7Xh+Hhlmham2UzRTPZQqy2x/cZQQU4qQMWaSsSkVbbqI10xqV8dUXEzd82L2dogvcLe5SP40k/i2aHvdfvUlSvKLdFPwlYuxHvoJmR1rEa2qnASh54OHOBhpx91Z434s4hApJblMK/aNZQdcZXdnAxVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yF0Wr/YT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yF0Wr/YT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43935d1321aso181535e9.1
        for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 12:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741807652; x=1742412452; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9qNFJ58EulLJjjDnGlinq/XAWc4oXkkPOMl7PNRBj5M=;
        b=yF0Wr/YTsmak84RRHrPibwn2poRCOulMcitW8LTSLzzP0jbZwAG30BLhPBd+H0iLh8
         /3z56NyNlu3s//HR1k6oMpH6CTt4DF0AO7uL+PcF8R3BuQKZBGv39SFOHrUgbuRuqSWF
         U38O1Tgh2Q2yjMZL2I/wvo3iyTYs5sq6z9FNXNA6gjkHa5dcaCq1lbCb+CdXMd5DnbT0
         LQDC9BQQ//VZtEmYiWydsuwUrgThw+U2kkMBWLkKk+/SxOwiFoV3/Z7BdxPkFEU1vRYH
         kRu2xT0Y4rFjvlh37EtoDG8pIPhL4+HI4b9eN+Dk0PhHyAAGM4VcUN5Z8/8IGb1i2Jg2
         GGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741807652; x=1742412452;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qNFJ58EulLJjjDnGlinq/XAWc4oXkkPOMl7PNRBj5M=;
        b=ex661PXaiP/bnDiM4KyW6CYDl3lvbaTGhkDeQP9gP9MMmE1wkJahph9Y7F81FWrx/Y
         aIepPi2TnZKJpFPYTp/bKQRpaqk4+Vce0ErEaaiarPDoLwwqmTdhqluNgUkxLGleEvd7
         s+Wrrx5derLqvx2PswMhDq0v7Trs7Osh1xHMmfrY4A7ek7PZkypqEHxHoyEJb2AA2s3L
         DgIph1udOpvpWjjeacLv0UZkOpNURiG/c6Phjl8N5YcFqYCNBtSHWwGopWKPMjYP1R8A
         jmghkqXdAFZXj+9wd0ekEe+niORjde3XYc+IxJ7rxaViOeCirtdS3qYjtS1GqmSTD7YC
         jv5Q==
X-Gm-Message-State: AOJu0Yx1ROx8cOw1+5JgqezW5IViVbplIWOSpIfeFGrkhs6ca6FY910e
	yysJHbSk5bPqmaCIrW9rl2FMkRDO6j8Tq8LkG7XYexkcZXck4MNoSKqh1lPDBdw=
X-Gm-Gg: ASbGncvwUR1jn1HthnZjRUqb7LBOK74snNRKdgI5mKY/AxiUboojUVbufP9J6T5f4C/
	K2emwFvkskj+XJRgCVoFqqruNgxSIFBgNQ1KH/u9scvTT/Io4nNn57EfcnwFgpywWSw+oTv+6YD
	Rly8PZCaZ4cKVYuAsyRGOhWp082gMdSOroOup45Vy1zdC0lM4/bljQJfQWBzM/TcutIvgw0+koE
	M2h3aoO9fofqYZhx427lRVT+5Y1o7Boj4GXrlL6PpTcR+OathyWoPyupAJjt1rku1pV61CUGtGU
	7+hgCwqVr1nBbWPvGiOtS4JB8urBRXRHJjz/6R8BSt4MNu1Lsd0MHjehTpk=
X-Google-Smtp-Source: AGHT+IFc4gbHbMQDr8/rSMbHEP9yPiMBWXiG9ezpmI6xwNwZDE9d6F1rlpy758Gz8IvrBC2ZvFtPLw==
X-Received: by 2002:a05:600c:b91:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-43d01c1fa4dmr37678165e9.3.1741807652636;
        Wed, 12 Mar 2025 12:27:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a7903fbsm29331995e9.32.2025.03.12.12.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:27:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] ASoC: codecs: wsa88xx: Correct VI sense channel mask
Date: Wed, 12 Mar 2025 20:24:58 +0100
Message-Id: <20250312-asoc-wsa88xx-visense-v1-0-9ca705881122@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIrf0WcC/x2MwQqAIBAFfyX23EIZRvQr0cHsVXuxcKEE6d+Tj
 gMzk0kRBUpjlSniFpUzFGjrivzhwg6WtTCZxtimaw07PT0/6oYhJS4+goJh/ba63sIsnkp6RWy
 S/u00v+8HiW9BMmYAAAA=
X-Change-ID: 20250312-asoc-wsa88xx-visense-e5cfda65e2bc
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=716;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=8J3A0ji22Y6h/FDPK1qt+T9Apzwb5fa5VQDP9nUjmp8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0eAdaFsakhYnGyr0q1TLAq6ZqOsdPYoG7LOWa
 ZlIAIQyU4uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9HgHQAKCRDBN2bmhouD
 1y/6D/0UdCfnE6ub6lMVKwcmd6uyIO+GVsH8EH/FlIcPCiUsJItZyWD48h4T16L/+HJKqbktC1u
 gjg5G0sACnZK8+pn47T6lOFBApvpjffw6b7u/d9oeiydL/Wc5D+wwObX7APc0Z46Yt5SD26MCm/
 FYzaHmELKaR7wWbL637UnVsdtajjpSDbXROHdKdveGcT/YcR30zGTD8nBwaSbQoffevFhXcNXek
 e312VtHcBeH8Y0QXuZypSStCp2YFchpvqZmGB/F7Y6kpdN95s8wOejhIZSGRTHgSsLLSW+4d4mw
 6jkMmdXyaFr1yPYHHcLa3d+iAGP4ME4jBLr7ZziygOO34RmJCY24pU4Kzfu5OixefL7Cl42Y+jY
 ek/VfEu2BasnacQWC2irbPBht4pu4HuzbKiuTeiJwzwA7rSwWCaRXxfmZVnI3sl1/jFp0+PVmHI
 dJ4YnY/EStueDh6brMs6rces6MMjwNhrmj3UwaQw3Ep51KthTlBAKmwPgJLLhrSaCw2GBrR+7Xt
 WYJOilkcf0qxmsEskoKdl0TqNtO1QjoE3vr4kG0rGemZLlZgWR6Mrh33VD/gl71qR48016CYXhP
 6zJ1nbJ5SfuhEMJzoLPZvLy9CTYApHhqfRhJdsPXK7ICXehEy6zUyroO9rY+o7UjMWcJDY0vmaj
 3UCHKE5FI582lKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

VI sense port on WSA883x and WSA884x speaker takes only one channel, so
correct the mask.  At least this works during my tests on different
devices with both speakers.  With original mask (0x3) I get
noise/garbage.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      ASoC: codecs: wsa883x: Correct VI sense channel mask
      ASoC: codecs: wsa884x: Correct VI sense channel mask

 sound/soc/codecs/wsa883x.c | 2 +-
 sound/soc/codecs/wsa884x.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: eea255893718268e1ab852fb52f70c613d109b99
change-id: 20250312-asoc-wsa88xx-visense-e5cfda65e2bc

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

