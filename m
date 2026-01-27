Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B934F364E95
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 19:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540928; cv=none; b=IK1NspPyJtngZBcbbTFxb4oSK3Blg00zhXKDxZFnhkMT298jU5nAagRknvDY8VGXOwjCRt63l1U896XqU2MqwYY+yLQkfZvlHZ1fcebMW6o5nd9ZW8UHGE6amWffRXnG90BVPrI64WHdU4o7IRAaZEJWWZMFXHFKpVXGj5E6vpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540928; c=relaxed/simple;
	bh=NJPV83aALQ0kqd42SvBkY3VtRID2IKOpShixJK7N2m0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=duFvrM0iLLdLQl1O6W8C2anuW8sC2Aaa+HfhJRCZZwAoVdPPHGw2Gy43b/1iOZu4plJrZGTK2Jfrj4FimqcJQUfnwPgnINstEQ2ZRVgdEhkx+8hGh78ZQpXwVzhHCLdLHS6V1rQfhslhEVgcw8CNqUhY6MvTVsE4raizN8nakEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eni8G+8h; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eni8G+8h"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso26865395e9.2
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 11:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540920; x=1770145720; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zXFv6WOP8W3azboFkG7Bd/jPVLZoa2VMLxSLFbmHKbc=;
        b=eni8G+8hmfbWfh3zgRnbblix2bTQHHjGH2iJPamoVpnEs8XRD3h0XGhz1oIhFC88kP
         DsZMGkJD3SXjetET3gYu2TfZjsvRZszyIynWKvILtesxsXImwtKOxdgrZstytKNpoKh5
         2MkFghL/8atSQJUlG4b8vwSZTv+oHtzWD9k52msfxR/OyqisnxQRg7mVBU7LVhk3t4UG
         kGa8MdARQsXziNzJp1Unw5JGYnjWVWfp16UuUZNoDetDgfQOE1zV3c+CVCDK5q/DzSc/
         zysvDAhw9vxFJY6W6cbhwfeb0fRblo3q2+R1dMcmvQQIWAp8IhlY0rMxx4fcqSW8UzRu
         w6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540920; x=1770145720;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zXFv6WOP8W3azboFkG7Bd/jPVLZoa2VMLxSLFbmHKbc=;
        b=mpg6M9B3Te6Bxu1+ZlhbOxzYqgshdtg/LrRwk4BqfTKFl2F5lsjUwTtfUVGdE3/dnm
         0a8LQAaYR1Y3J/NSRLhm8hXUSCOwShoP4YFm6RkPSkyi/WgH9thifaPLH77QNKY869Cz
         GG+hVfGf0K4o+EfXGFKBw46wJcDwtLbCrO3JXI2IW1ftNtZ8AcUjwS9rvsvdT/UbzbIW
         unoNErzD6JhnKihttKy/U/2WwSTl5KlFGIBJ6+8fNyVoUJEx1ZKujRJ9Lup5PoQ/5XbJ
         ASPhgTr5kRDlglV2YNjpizLY8nEp6mHT76X50xKL6wq5CE3uYU+mp1fcis3jhnLQYeW7
         df0Q==
X-Gm-Message-State: AOJu0YxZqELxxl8yHmG9SZAhLuPwKM/UHOX0Fg32RHvX1G6oAennECeT
	wr5GWhtqm9rfpSu3whdQOlka/mffrhuLonZ1oPHbgubbrUHL9VOT5BDb
X-Gm-Gg: AZuq6aKr9dukLfv61BrgwTsJpIIE7rH7zZkfKCffo8kzhGil1NcFnd9VF+DNbmq7WnT
	Jqda/8U9cG1lJyp+sWzUMvHay39uJqDlaP2edEpe1ezDAPZh3f+7kc45DpbS+vFOKKSi9LHA2ZY
	TaKo8/fWxwK+TFqIOqOmNV6h3yAJgtG+mQWJfb/0yYpm8fqPXBDRAtWxCRIiSuPRPEujdWvKSw3
	mMYwYlyViz6dEW/qCZQvtRNL2AiXfyofA9PzAzSICfnBB0SBkX60o7Q0EZTx98maYEcPehhHrIY
	T5s3lul+NRmjJw7CrtaSSKZQVjj1pNyK3ZJcvzhO8qOfW+VasQlCbxN4pa1xT4D6eOZbfS+bbLn
	Iwb/AoahD2Ih+QUj9dcfBm33qHfPPnQgLZBV6iiK6H+SyovRyldwwVJM2hCMttzxQpWjvblE11T
	RJrftOYlr5wpEoxXwjnSykykOmGLNRk5kUv6edQsupIw6C
X-Received: by 2002:a05:600c:699b:b0:477:8b77:155f with SMTP id 5b1f17b1804b1-48069c3f914mr33405045e9.8.1769540919784;
        Tue, 27 Jan 2026 11:08:39 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm74577805e9.2.2026.01.27.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:08:39 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Subject: [PATCH v2 0/2] ASoC: sophgo: cv1800b: document DAC overwrite
 handling
Date: Tue, 27 Jan 2026 23:08:18 +0400
Message-Id: <20260127-incremental-for-i2s-dvier-v2-0-5f66b841f63d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACINeWkC/42NQQ6CMBBFr0K6dsy0GBRX3sOwKO0Ak0BrpqTRE
 O5u5QQu30v++5tKJExJ3atNCWVOHEMBc6qUm2wYCdgXVgZNg9pcgYMTWiisdoYhCrBJ4DOTQEu
 uQYtoeu9V2b+EBn4f7WdXeOK0RvkcV1n/7D/VrAHhUuv+hq1rauMf42J5Pru4qG7f9y+xnVTvw
 gAAAA==
X-Change-ID: 20260127-incremental-for-i2s-dvier-9ec60a002bdd
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769540916; l=1049;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=NJPV83aALQ0kqd42SvBkY3VtRID2IKOpShixJK7N2m0=;
 b=BALvBEZkSNpptOqmEwB5MQtyO80EUcfyeXUyMbbmVZzVuUmopwgYKeiywgJJKQXQ00KP8BFtq
 7AqNTbv+MOoDiQh6P42kT3FpzcGOcasc24nWIxMoajEBf8soCo5aPTH
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=

An incremental patch on top of 
"[PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC" 
adding the explanatory comments as requested.
https://lore.kernel.org/all/20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com/

changes: 
 - added description for cv1800b_dac_mute function
 - fixed "extra change" from previos commit

Thanks

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
Changes in v2:
- missing Signed-off-by for the commit. 
- Link to v1: https://lore.kernel.org/r/20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com

---
Anton D. Stavinskii (2):
      ASoC: sophgo: cv1800b: document DAC overwrite handling
      ASoC: sophgo: cv1800b: tidy Kconfig spacing

 sound/soc/sophgo/Kconfig             | 1 +
 sound/soc/sophgo/cv1800b-sound-dac.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: bdc79da6c6206a12c9a13ed5e4eb1360d62b321e
change-id: 20260127-incremental-for-i2s-dvier-9ec60a002bdd

Best regards,
-- 
Anton D. Stavinskii <stavinsky@gmail.com>

