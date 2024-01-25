Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698CB7316F
	for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706196678; cv=none; b=rsmX2CkDNPRYg/mhW4uJ4Cl5TlIgzQrPtdrv/MFJnDsjsRVV9dDFx1+DxGPD8q0eBOo782vxEAA+Uitt5ePJH8hdmISuq6JNcka7U3BHpBt5YJaW3V3YZmTvXwSwED+MjY286+eYdBsQNZkn14Bi1oAVJBat0kHbji57ZAd7xn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706196678; c=relaxed/simple;
	bh=JhPsd+XYVzYVuRnn7sBxx/KvgxV7WjX72z6mVmTkqhk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ax6EMlXSdI9ykIdfuLMBqDghPcBIQo+qxYs0JL7MaY5hqA7FjYSbvN6E3InxZRgBI33+DlfXkOw9tlNNHpaR9cpqKeCSglNXKGFbELb3K3A8VdyhJyOu1U29SYViJ5+l62/JTNt3CUnMxt9COmXF+Biuib9Bs+Essl0zAnbn3SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uwIalc8o; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uwIalc8o"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e0ed26cc5eso2854862a34.3
        for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 07:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706196675; x=1706801475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NYK0H+CKAoklRasOR981W3Bz82GZLK+0/kJxDe4J3gw=;
        b=uwIalc8otI2cBDJW8UFBJV1fEtqsLbgcBB535e2mMRgSL7x54dUgaoghr32lTh6Xa0
         SQfDVMKIi+G6F+MkWFo2oZCXhr+MpzMgZVCNLdznBk53c5kLWb65kPcTIXf/ERHCN+dS
         ErvXNEbr0MOBg+XuI571nXTQVbHMVOwLLlshZMYr5lpBsW4N34CGb0OvxGEe2waVcOP5
         l+kXl5D9vm2+YJwvkwKhVgll2HTpcZZnTZfz7qH920Fwe1qYyvlZoEoRpr3pW8p6R4LJ
         MR9p7Zfq9KdpDwP3ii8f+IB1P1CSCEEd0U/jaja/POEAqLFi8SZ2Ci9l7Z/GGUf+70G3
         8ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706196675; x=1706801475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYK0H+CKAoklRasOR981W3Bz82GZLK+0/kJxDe4J3gw=;
        b=YiHjoXKQOlbWc7btbqv7oZyz1F/AzwEtWzZT074vwDzUtD6ldMNugBaYRy1KXyzXF7
         qSKGkxDdatOhpC5AvZKORNUS9NvCQInt/poCBNfZmLnMMTJLkRXXCmOJaDFwEm+4kA2k
         KevnkrNhtF+BWBcRn86rR9vW84w69scWi3xfH6Qz97SwOXiYwKke7AVdIp8/dhjjQxkW
         eKIlJCtBLMrOH1vjeLzgO++tpKlLhD/iJdN6NZUEZdk8aZy/ylFOlIGX2GAU2qDatSRZ
         ahoDeVdaLS845lqJw4qV1BtE41vF5TVRMAxFffOHKseX7pQdREm9qqKRmrnVvEJ4byGh
         8fLQ==
X-Gm-Message-State: AOJu0YxbznGR2Ur+920R7ckS3Lle1Dq/yOOLOxPIyTXDre3fwnUXj0g/
	vyoMANs5WdhmKjZEC6XZVyQxE8pQDnajUzZdT9FztW4ScT5zFWfBSq+Aj7WgHaM=
X-Google-Smtp-Source: AGHT+IEQzLbhD+YKInHXk9DGDwmHvSeNxQb2A7kdlkwqPHQz4iFJ9kjd/DWCpqFl/DPRheEcMOOZBQ==
X-Received: by 2002:a4a:da05:0:b0:599:c127:a5b with SMTP id e5-20020a4ada05000000b00599c1270a5bmr1010116oou.2.1706196675383;
        Thu, 25 Jan 2024 07:31:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id d14-20020a4ad34e000000b00599f1741917sm63973oos.43.2024.01.25.07.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 07:31:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/2] ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets on SM8350+
Date: Thu, 25 Jan 2024 16:31:08 +0100
Message-Id: <20240125153110.410295-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Changelog in individual patches.

v1:
https://lore.kernel.org/all/20230717140138.201745-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  ASoC: codecs: tx-macro: split widgets per different LPASS versions
  ASoC: codecs: tx-macro: correct TX SMIC MUXn widgets on SM8350+

 sound/soc/codecs/lpass-macro-common.h |   7 +
 sound/soc/codecs/lpass-tx-macro.c     | 666 +++++++++++++++++++-------
 2 files changed, 501 insertions(+), 172 deletions(-)

-- 
2.34.1

