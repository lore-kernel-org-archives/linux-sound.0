Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7E8192592
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 10:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729853161; cv=none; b=igmPbfUwVb0BCZalsDTeuidNocMr2kDZw+udoYlg28T5VelIXc/zpF5eTBgloOg9sT/Q/aeOZ3jZFEOy6B+bXXjOMEAWtsUgn0XoF0mHYLx5xXjH3U+pHmRuCxCKbVseeh5gRu8zw9Ga+ObN5OCnBtMSsi7Hc0GiWJj3G1/s5GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729853161; c=relaxed/simple;
	bh=glzZvvtMnrNVA3ZU2o91oo33HmV5OMU7rrTm5EWNvBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hkLBGSDSI/wpa4QMsKaLH53HpTu8MfFA7pLHJTBrxVAUzuYoLkLHL4LFBIKSQerhfLq6AkWg9j5uPMHnMZ/3UNG81Yev5kWDMKwottIB91QfLE6tYbN/hlWmNcp4MVZJqV0DvUhzigD1hM881Z3tyHQO9HlTpMUSS2ogsTttsFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kniwZhWZ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kniwZhWZ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7db54269325so1251897a12.2
        for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 03:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729853159; x=1730457959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qYdMoYNHEEjU8R4jRwxYNDvg+V+aPZxty5Pm7LhAwc=;
        b=kniwZhWZtx5HQPxo4BPTHhrVzAuBNflyupyvwRpGTa2tMpQH6Bo6Yzu9lp7xHBmorS
         CcjHKxA7UyUAAamb7ZVqWqK0zPhctY5CQTqhKI5UNI6MlBeeiuJtI08dQHilqOSd4RNC
         Nb5finrktQM3ZV1d6DhqUm7D8vS5lHzgzVp6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853159; x=1730457959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qYdMoYNHEEjU8R4jRwxYNDvg+V+aPZxty5Pm7LhAwc=;
        b=HAEiEcdKq1E1D705sxbqeG/Y6R50iKkQ44mF2COULXMDGSb19NxVj9QPKioFfHSCBk
         WbBS+qKoB3GWvg2W45OSIZaqJ6v33iaGnjzH0LmCJ0P477qcXM87QT0qwjZMVD2/YPrb
         CznRTOT5kSeCusw2MGg6qBfPzJABvSfRQojVdf+j3qleoJ7rlGIjLwCmV4cjy0yu3n5u
         T5hXbW9jciYtkBBbqGReTsbaBTJdaVMU1FaGokNcv2Yyu0tapTsCT33CQ4zMQPDP2rBC
         aoKraxrGHKzfxyQKM4y+I/U+Obu4Ffw0dID6SMwUpXbA/jv9DHBAOWvF7JuiRhSafjfz
         jk0A==
X-Forwarded-Encrypted: i=1; AJvYcCWoavMNDU1nDotjXCndZqKVIln2NRpXS7WKIR/TX2g7i/SZh6wyJ9kRqQkJq7cgQa25urEskbQc5jIoCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFMl4ofEluPdygFMG/+kB8ZbcRzBfxqg4wDpknUL2ire8+mU4e
	YseKHJgJUpBb7JjjWABveRMAA1eCmYpvh/KCaN+zG9MkvMS3I8+SatvdxwD+5g==
X-Google-Smtp-Source: AGHT+IE/jF3qeEh2sSM6HPYBIUpFWAzndUsngpMsqXOHaVXBbGKPEsKfMjMtDshVaZr1AnM6b0wOrw==
X-Received: by 2002:a05:6a21:31c8:b0:1d8:b962:6087 with SMTP id adf61e73a8af0-1d978ad70efmr11190210637.10.1729853158931;
        Fri, 25 Oct 2024 03:45:58 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ebe1:dd63:343d:8a4c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0d089sm829548b3a.99.2024.10.25.03.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:45:58 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Steve Lee <steves.lee@maximintegrated.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 0/4] Update properties in two ASoC DT bindings
Date: Fri, 25 Oct 2024 18:44:40 +0800
Message-ID: <20241025104548.1220076-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi maintainers,

This series includes four patches to update two ASoC DT bindings. The
goal is to fix dtbs_check warnings found with DAI links and audio
routing configuration on some MediaTek SoCs (MT8195 and MT8188).

This series doesn't introduce new properties - all are either commonly
described in existing bindings or are available but undocumented.

Patches 1 and 2 focus on mediatek,mt8188-mt6359.yaml, adding two
vendor-specific properties and updating the DAI link pattern to be more
generic.

Patches 3 and 4 focus on maxim,max98390.yaml, referencing
dai-common.yaml and documenting a hidden vendor-specific property.

Regards,
Fei


Fei Shao (4):
  ASoC: dt-bindings: mediatek,mt8188-mt6359: Add adsp and dai-link
    properties
  ASoC: dt-bindings: mediatek,mt8188-mt6359: Update DAI link node
    pattern
  ASoC: dt-bindings: maxim,max98390: Refernce common DAI properties
  ASoC: dt-bindings: maxim,max98390: Document maxim,dsm_param_name
    property

 .../devicetree/bindings/sound/maxim,max98390.yaml  |  9 ++++++++-
 .../bindings/sound/mediatek,mt8188-mt6359.yaml     | 14 ++++++++++++--
 2 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog

