Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82D49C4A1
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 17:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050226; cv=none; b=dAIbyMC44uuuY35tPS/rEaNoTmurzBJSs4ig0nX2lC2HSn760+5CDbPldzyfF10FQsdZcX6wBg2l6JT7ZXVOAk6YyeeyaCVpezmEEftREjAxhmeUNIu2HlcL1smVbdOjEOeOQuZ490uUO6Dx+CDTabsKEq/le8jrY6JZfFLpwvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050226; c=relaxed/simple;
	bh=LOhl3Aekc4RKo7oAx+FKR3eE5zK1tDJ8SzPFFk/DLWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rjaOylCkWWa4K+8OHX8rhHY2x6WGsFAru5SXDs7qCRW7XmUmpiGnGB0+dh64ik4i1aaQgA5Nm+HNSuaEE/QLsBy+RSmRPDcnNa67J8Ac2NSsOUbdseUpHWks4BxG5ab9mO5eInz7WnLRxJMkLm8KF/JlY/gff9F8doGf1jj4FRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CgNmc5KV; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CgNmc5KV"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5338f65913dso7121061cf.2
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 10:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050222; x=1791655022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsXt4MoLEnClFiQiLZ/irOmeq+7VrIzcy4lTR5NyCaA=;
        b=CgNmc5KVxHcqI5p+cT7DPLeAQOJlNlq67j5LX+48L/9JLzAmKq7PJHMFkPo3q/DCE+
         vUZkVeG1LiSVHplH2VaIFQDa4+FYJcSOKKwWrGos/cuUsaTQfPyR6t41CFv57vTpGuRt
         tSr+bEyvLvHAKkYOP1g3FYuHjI784WIBTEo1glLi0crP5x7hR66VOUetZrnp1f6Vb3vS
         Ol3cj0OmjzVfKQf5fRa0HGfGSgHxgV/aKOwzDeOEGw2xsu6ApyfdDVvilE93xyS7O+78
         4XNfAMNTyFyRxpa5Mjq1BGxgPhRRqv2liJc9x8YzO1X7WbvXfdjqayWwwDVdPtL83Bx2
         XIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050222; x=1791655022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsXt4MoLEnClFiQiLZ/irOmeq+7VrIzcy4lTR5NyCaA=;
        b=gmzxTdWJo794mLRptrObKFgZcuArE7C01wwc5mHgDBur3BhKcQIWw1FmDbdSsvYlW7
         MUDRwGpKgvBxoWd2QLS5vGPjI19mzaZ0fzoipM+nagKplkuWIcBfeexvYhz4YLdntAr1
         20wePt+HfuYuJ8b4GyViqhiv/oqodI7PROclvS+N+bMo0xb1YK2ZLRxiUApp/ShmdqQt
         5qmsjOuSBAm0WE7Uqu9pdm/xZVTKkaVGECaK8X5xhkpA5OcT1vp21K3n10qx5l9r0qyI
         dqgeDFy7HBEVRmWIvNImmMI8sw8fvENlhW0sRzbFNhIIETNCVCig18HrFSaK0RB4oEL+
         qD6w==
X-Forwarded-Encrypted: i=1; AKwUvBzRkbn5uqLRU/CiUC5KmzCYSm1EccLzZ2R71fWTayKc9PlQJQoxeRwOtZGJEizydENinzgjdmaFg2lm4g==@vger.kernel.org
X-Gm-Message-State: AFuF++kqFB5PgmzabvNXma7pBlO6AXUm61Tj1oG8P1B+/gjtMVhACFQP
	OrKGcT/29UkWjoyMIRLhvedSYFwWkRz2zhC+Uz4K7Noo2X7fQW9GepJ6
X-Gm-Gg: AYBFou1Pe0M++ftaBQxHiOC4lMxZBf+/b+h8PlE4hgfdnMKm+o4aqdE4fJ8cUmk9jtH
	EVRKZuGqp0nnEnVSrrAqs+6He5pGMAa6RrESyqAZjXs/CpLUNvIdAiu7krDk9O6zr+YSciPPd0u
	SrcryzeqgGZy1Abzg3SccLaPHgo5mY2s/f+xmCbMPJ7AeiCbu0F2vKUHBSQxLgZP/thCA0tjMFU
	iPXo90ZmLyJ4pc/KCM6615JAuKzMkNS2vRJffj+nZUtBtsPxsea/bKUYiwtEwZAJfRCXU03+SWw
	TiDhN2FepKyJFlI5XXpWyVf/JtP6wI2eS28TQRNPj4RB9S2jZ3MSD3uef0D+qrMn/yXso69J8eU
	03T4iH2jJYZK/oZviRfdrpqhIvDzNZDS8P9wwX8VJNnZb8Gi2Cn4Y5n1QHV+c1zrjy3EtR3xPIU
	LGXQSYXg3CU3j2V7DMq/oRhdPlOiJPDS5eHt/vu/gC+8xOYliBM8iZifb6whCJK8RosWocnsx/O
	H8=
X-Received: by 2002:a05:622a:260f:b0:530:ea8c:1b6b with SMTP id d75a77b69052e-53511b4fed6mr52480151cf.3.1791050222471;
        Sat, 03 Oct 2026 10:57:02 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398bf8196sm57217881cf.22.2026.10.03.10.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:00 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 00/11] ADSP for SDM670 and sound on Google Pixel 3a
Date: Sat,  3 Oct 2026 13:56:48 -0400
Message-ID: <20261003175659.23536-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a user for the SDM660 sound support code [1]. It also
adds the ADSP remoteproc for SDM670.

[1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com

Changes since v1 (https://lore.kernel.org/r/20260922015801.32373-1-mailingradian@gmail.com):
- squashed sound card and device-specific codec config (11/11)
- converted to fallback compatible (4/11)
- added compatible for WCD digital codec (5/11, 10/11)
- removed sleepstate comment (7/11)
- sorted subnodes of dai link (11/11)
- add review tags (1-3/11)

Richard Acayan (11):
  dt-bindings: soc: qcom,smp2p: add sleepstate support
  dt-bindings: mailbox: qcom: Add SDM670 APCS compatible
  dt-bindings: soc: qcom: aoss: Add compatible for SDM670
  dt-bindings: remoteproc: qcom: adsp: Add SDM670 ADSP compatible
  ASoC: dt-bindings: msm8916-digital-codec: Add SDM670 compatible
  remoteproc: qcom: pas: Add SDM670 ADSP support
  arm64: dts: qcom: sdm670: add adsp
  arm64: dts: qcom: sdm670-google: enable adsp
  arm64: dts: qcom: pm660l: add analog audio codec
  arm64: dts: qcom: sdm670: add digital audio codec
  arm64: dts: qcom: sdm670-google: add sound card

 .../mailbox/qcom,apcs-kpss-global.yaml        |   1 +
 .../bindings/remoteproc/qcom,adsp.yaml        |  33 ++--
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 .../bindings/soc/qcom/qcom,smp2p.yaml         |   2 +-
 .../sound/qcom,msm8916-wcd-digital-codec.yaml |   1 +
 arch/arm64/boot/dts/qcom/pm660l.dtsi          |  40 ++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 150 ++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 183 ++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c            |   1 +
 9 files changed, 398 insertions(+), 14 deletions(-)

-- 
2.56.0

