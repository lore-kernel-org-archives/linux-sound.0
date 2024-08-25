Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F53768EF
	for <linux-sound@vger.kernel.org>; Sun, 25 Aug 2024 08:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724576272; cv=none; b=opmPY6uwKNqBrFKylj7e4Q1DiYUfpLk4IU8Vv6uqYdzWS2YUS35Ixk5LdfttHtNmbYc7fvllV0Of9PSfMU/i2cpYyfQaJQ5FiGHjD6bMuglBTN1KqW/HIm9RW/3Ey58WUqlXWfzlPVtiyeYbaRi+xowqf2eWfKbXNFOMnZCKLfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724576272; c=relaxed/simple;
	bh=1J6BWW2PKL0LZoDDixa5BAHxaPBO3B1K4JK5Epy75ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AaXxv8zsE0yoN0xZNPJFNGFWCFt/2buxMFuK9rOKboCUWzh+MhwD8mjIiIoV1xTvsznMWQrnT8/mGb0+uXjIOYAVpJlig0hSKBU5VqDqZC+sR0Zdm1N+E4A+EnobXQ0PSetZeOAceuV7HLs1qWJVGawQ+vOrxssYqkL9JApuIVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fNcStfC/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fNcStfC/"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42803adb420so4100315e9.2
        for <linux-sound@vger.kernel.org>; Sun, 25 Aug 2024 01:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724576269; x=1725181069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RJtwn4ZxojcRke0143CcWqq6cxB8ohpeltqblKHrcIk=;
        b=fNcStfC/XRuhIFy0TnXRT/LHECsxphyP9N3esc38VvVq+JqI9MLiLkU6ERcCjH1wJH
         dWjnQiawQOY4unvIaqjaZRQDqPfLLZm9ukR6xtTFX/ys3Jh94Hph4PJ4kP30+oviDUkI
         DLv9BH4hVAgxcJKJmI4ic26kO/oL8RZGiPKeUcd6B5KYT14Ye2WirWR7pqIAiqi3jGmq
         nRFxZmpDloUaFAH//gIML25Hx71qpLmBTf/0IhX0xHgdJ81xDnT1bkTgg0b+HztOW8UU
         9HKBIXpf3Nd6Dujw6FH/6JcyHGFuT14gV1vqjH5WecRQElHMDIhhM8LMyX06tat8+/dG
         RT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724576269; x=1725181069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJtwn4ZxojcRke0143CcWqq6cxB8ohpeltqblKHrcIk=;
        b=hgZGRr+XmUTumAQ75L99u+cxV+g5KmfHa0hX3Oi8RhcmixxgaRcNAXLePQraOEN95S
         QG8bMSIDGMYsZijLzplMFIJ4+s0ujtRDFFfC1f2IjuaB3s61LqGgmUKxDawAPCP5Rswb
         gpApA7fSkx1ULDuDAo462kch/cka5rwcUiHWkVsZKH84xNZlyYzltUBOc1y3e5hYQdvW
         D23gS8eUhSvyVR7f7kjPrdR0GnN4cL9cu22jn0ssGknYo/IC/cZR8pPOCgMhRVCvJVOW
         ooEVjII4YxuAsjrpOXDcbbROgq9Ha65EwjhWfU/bFAOyapjRlDmxd5KajuG73aSz8OdH
         Br7w==
X-Forwarded-Encrypted: i=1; AJvYcCV8DjDvWF74wV94bguXl0RfoMjAa7IIg4qEAsgdlpqP/hQULkdseWN+8Es/FmB9lsRQlB2Fy7IciURLjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVUoHzfLBr4ojawBa9wuUpf/lkspM+nYCakbR3Jod49LmCi/BY
	i4p1sY07H/qCFfwdIoi2bgPqgZM1iwIRMUL782kEFoiXmk/woDqq+uJvlrEbtDs=
X-Google-Smtp-Source: AGHT+IH2giCB6AK7UOeGgPjHxZzeVMkrTX0peXsvssYIaa3ZOlWUGHmwGDlXFRjxw2dLm3mN2IDBOQ==
X-Received: by 2002:a05:600c:3b8b:b0:426:67e0:3aa with SMTP id 5b1f17b1804b1-42acc8d50f1mr30009775e9.1.1724576269155;
        Sun, 25 Aug 2024 01:57:49 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42b8a351d3asm57432765e9.13.2024.08.25.01.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 01:57:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: MAINTAINERS: Drop incorrect tlv320aic31xx.txt path
Date: Sun, 25 Aug 2024 10:57:45 +0200
Message-ID: <20240825085745.21668-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tlv320aic31xx.txt was converted to DT schema (YAML) and new file is
already matched by wildcard.  This fixes get_maintainers.pl self-test
warning:

  ./MAINTAINERS:22739: warning: no file matches	F:	Documentation/devicetree/bindings/sound/tlv320aic31xx.txt

Fixes: e486feb7b8ec ("ASoC: dt-bindings: convert tlv320aic31xx.txt to yaml")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6574b4910f8a..028186bb4e8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22736,7 +22736,6 @@ F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
-F:	Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
 F:	include/sound/tas2*.h
 F:	include/sound/tlv320*.h
 F:	include/sound/tpa6130a2-plat.h
-- 
2.43.0

