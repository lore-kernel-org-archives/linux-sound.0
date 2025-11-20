Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5F32777EA
	for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 23:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763681402; cv=none; b=O73kWBTMUlGrZulJf2E55Fb3U/QVRW5cPAevgDVFvgG5hiFpfpzxHMLaY8gVr+oLA9Jq/U12bw9vqY24OiH7BPIno9V7d8D6q+rIqtKKPYS/IigI1YC5GUONI/s8YKjUFl7ziKg7zwNXGIzLecbMMxMz6XfrDmZtFu5Xl4UH3a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763681402; c=relaxed/simple;
	bh=W4DaM94tPPtznOp7Un8ESSuQT5CGLy9fqdfzdwLWV8o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ci5Y/zf7jrWV0fgusKDgWQRhVm37TXSmC4ok54UbF9rA2yGdEWzMKsqrN8vCJT0a0bhYwI2TUvajdvdqU+XxYh3RufTJX93NHWEUqJY5k1JHaeNupGXp1AGOKI1SkZIVW2J11iOq+dVhQQ1GQRcvm+CTZLiA5tMibj1g/RpRkIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3f6lNzQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3f6lNzQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso14010315e9.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Nov 2025 15:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763681398; x=1764286198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o99Q6btqe94dFwhCkqr9jpNEkkVzeqWoyeDeppPljwM=;
        b=T3f6lNzQRhJD2eJlcNSooGaayyfU53A1iUmsnGTqIQ/bH8qNcUq1eOOrQwAzpbMYi1
         p208yWw1X5XMSXrKPCugOP2Cb0YELEvqs8mnkPrPhiDHYowRUb732Jo4Yi4pZ2GsGDxH
         HGhccfgZUKspYTG9GHL5KLRFDITmAA/br6EccUnJ0AxOdl8x4+gFt1drogCFsB5oWrSH
         Qdx8t3l8eYsnaKJY/SG8PvuoIVcJJ97p++taTk/iOHDhw18tcPo/tUlpjBf5ER2nc9SK
         IVj5Y+r3YIudE/R6bqGTgHTtmFh0hcI8pAPQhMTDsIM+c+IK7K7hqT2Wiw9Lgscw76AA
         tU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763681398; x=1764286198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o99Q6btqe94dFwhCkqr9jpNEkkVzeqWoyeDeppPljwM=;
        b=NcalTfXeGMx40VwYY8ypDVStTJBDSj37PTTgMb4eKjycN/fp8Q274aGs+vU84iM73P
         6fK1MhjOjBwm4ygh7PJUv5UuwBrF7fDirBP27FbxvJlFHSq95TldD89DBBFsDNqi2zCO
         k8sFP7qeaDuWyMxwrbeOUWJ6W/YLtHzG+43MRfjz39CQaP1ZTn0vuuc2Lw9LNDfnpUyL
         iT0bWsHb3Ghz6FLGZwV2CIEvxOehCORbbHDm99CdvndbQTkUbYUKsjYQsygEj65qHOnD
         Y1/0TwmA84jII7EyFRW4ZHKE2Eie//8chwvoLD91bV0IT6GMvUZkTCqX9MPwmE/JAo7Z
         X9mw==
X-Forwarded-Encrypted: i=1; AJvYcCWb0zo76c0xnRePC9QoZpJcFR1672Iq3rQc5oWEmu2AZsXquRdwT9JVZJ5u3G78qmyLr5c/zwqR10iBuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQwgjW76l5ZUgB0q4qYx0K8i9hEXm9cTYTTwqjVUfhetBaSGSI
	lM0fpaIHq57N47f9vLNSq++NZzAqg5NxMod8IrVMSDY3v0+jLTSQiH9x
X-Gm-Gg: ASbGnctQqNg2HYg8GDxEoS+LksuIFhxHhsTgbbvwKs/M1BygSTjcohO0d8oR47Lyf68
	41A5u3VsMTUHyF64N1jm6YP7/WhT54MNMhnsPBmPaeTugRDs5Vi0e9GeODjV2HOVmUhyqRXgQTi
	UhKHc+aE/RoQ9j7E29S3xcV1txo0t2lI4ZNkk1tqfqK8KnDqDsZ4f8WWITDzlwkwq/yMpBeHjYE
	5FW8tiP9lmU11L71Fv2Fa6bie+DlZVYX+j76dMW8UsnDNNHgbeSed8Ld/GnBAI73Yvs5x7bZgoX
	2au9ez6wpi69/Mtgw3l2j3jERJofLWVMA714bm9Ze0XxeGBmzODK5TtdgG23HdGmtBJz4FgP+FO
	LvLtG9etCsklP2SEK63nu/xORNHlzy/ForzABxPC4sBCIPRCqxhQIZ0zhG7qahh+QElba6DnVGc
	5qW5o9KhIIAlyDNcuuGsty2WQRx4kr7E0+6eO9FUBz
X-Google-Smtp-Source: AGHT+IENcKDSU9p5/g82mvjpGvvEKuudRdiDvyXXEFjAWRPw+rHnGQTHf31HMHlBDVIX2Yzva/jh6w==
X-Received: by 2002:a05:600c:45ce:b0:477:79cf:89d4 with SMTP id 5b1f17b1804b1-477c01ff270mr3630625e9.31.1763681398280;
        Thu, 20 Nov 2025 15:29:58 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9022sm7776315f8f.36.2025.11.20.15.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 15:29:57 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] ASoC: Add support for Airoha AN7581
Date: Fri, 21 Nov 2025 00:29:09 +0100
Message-ID: <20251120232913.32532-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all the patch and documentation to support Airoha AN7581
sound driver.

The card follows similar implementation with Mediatek with
the codec present on i2c but with a simplified implementation
register wise and additional frequency supported.

Christian Marangi (3):
  ASoC: dt-bindings: Add Airoha AN7581 with WM8960 YAML
  ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  67 +++
 MAINTAINERS                                   |  10 +-
 sound/soc/mediatek/Kconfig                    |  20 +
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  39 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 456 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 371 ++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        |  61 +++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 170 +++++++
 11 files changed, 1244 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

-- 
2.51.0

