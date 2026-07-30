Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FF1442FD7
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 17:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433440; cv=none; b=jfueLVYAvH0YYtNXhDPK4e5XfZlstbZgoQ8tQxMYrsIeEWoR0MRxDwEie9rzRTAYbCUAc6E8RWdM4VFZMKRwHxVwA5EejOIwnpKM2cwMTzfRu6M6VzNncQEO3LPvRh8wC1b7ZM1dsRAtUkqp0O9AQA4/hZElt+Nm+qT43sTf9b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433440; c=relaxed/simple;
	bh=eZ2VdMNGvLr/e9cJRpuWW4lW97u67G3BAx3dA5XzMQU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Du21Tei65nW1mPV3WAQ4Wl4wreFDDEEVRNxdNuAZEvji68kXmthqp0AIGhNmOYs2AML8bA9i6ePhPMz9b6NT1FhQsby8aDthSQfalskIecF5Ib8XiqEjlN/snxzXg6c5EIOB5O3bTEIY/F6pDFPwn+xuI+acPTmqRiHnvUTbuo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qHFE6kav; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHFE6kav"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92f03daaa97so5457685a.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 10:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785433438; x=1786038238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IKwR1+iwHoGPtyiGupDBuhusrAtW97W1M7h9bkSZgZ0=;
        b=qHFE6kavt8ZkKeUnYpf3U9ItWAw2KGhfwGHqo63i7pMy5paNMmzHV++pSxbxCNKhiV
         0eHbByp3CKfOUgU2elE9Wg9Db19Rxfe/9DVRwuIJCqWNRaXnzQ82NDVMxYwA1UwtcG33
         YEYiGGl9OR6fJvpuacCwIqWmx0s6lT44xVg8hYTQnuJVGRPNN9azXOgj2+2Bmu7Lvaxs
         tbDSu42xeFyybwbhRbVLzI6k+sunCxKWocC8c+MlmjF4oWAilScU4YSjfb8760H4R8/2
         HEucw4uF4Mtu+kb2WVtvsiHIZbWvKIJPqilfsuqnjfVkSogA5/8Pt+dCFI87MlOdtKru
         SFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785433438; x=1786038238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IKwR1+iwHoGPtyiGupDBuhusrAtW97W1M7h9bkSZgZ0=;
        b=putJMnfHKYsnlx4oUSa65lZV/DgfKjsRjdULAnYbjNSLXEn0IJE96KkrvU64KQtDrR
         RyrZ4rJUh5hf5SrJ3lsjVPbxLwXgEmXPtbJsZBg4HMWw3rtCt464lQXdaZtQib2kM9Hv
         meddQuhhhDfk2QAqKq9aI7yg78S6au5Lx4UOjDvaBLxbwczqC4CuvMN7u1kjpeuo4gDK
         Zh6C81iA41WEsUIkqnAbKy5vm5ZTYN+hdm86oa+nIpBLiqwcO+mnEspk4PnT2Wf1mXk8
         XhY8BZhfTCaSscUjyIDVr0YPwOU8VCbStE8K4NNNbnLmvec90HJECk/hH+yhDb0zCo+e
         1yZA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4/DSG7sRECJR3kQsJH8+VlEKQgnMZRib2WMz3Qm32rIk1hWSG6MgZSjSlOwWyCBGRvdV0FWh8f7Ir/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrMJFFbjRwS1XKsDadoYCosQYZQ8cWdquevPpqcA3OUMIowTUm
	hX4vpqbGMeWYaRvnK5W2YLalfQbWZGpUDToaly13753CwjT1jmmzwuwC
X-Gm-Gg: AR+sD11HhAvsRbdoxpKrr6+lCG9FT9Wl769BjdmPDgsIQuWBl2+Ev92erBzAhLt+zM3
	M7cX2XSS+kd3dz8NWTg96KmrZhLCaBF07kGddAVxRuci4y1w9ff2y015eiFY5g2tjhY1HcSQqqx
	+6AlxWwD9DLKs3lLF/CD/+T81mgfZMPuq9TO0GRR1buEUDW/1r8d691yAaJc6uJiddu5RZZNnrZ
	DbWp8NxoRUIQAFKm5Vs1cGcfGf2dzQXBCYAI6ezw1WYgnv9Q01se5dxVY5Az07Qyq6DNARY6YcN
	uMB4hxXIH9iRrZgHm9JFlPYbZN+zZgIInsRQUVoLgVQlNTgrjF6dFZ9mGJBdlFtFlogbi/LaaIg
	aGjCXR8PqKEwfSfSScv0jw1zORpqPZNiZ6dLnUjWz+bwJa6tNX8ZcvUlwCkjmWMjf7Q8bzWnXyJ
	pvdXaEcdRk+nFxzsVtv+bRjXAjej8H0xRaOYrF334jqLvgovYrdHuBYnaEXSQ=
X-Received: by 2002:a05:620a:700b:b0:92e:c116:bf11 with SMTP id af79cd13be357-9348701aadbmr378538985a.90.1785433437812;
        Thu, 30 Jul 2026 10:43:57 -0700 (PDT)
Received: from localhost ([70.54.57.80])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-933e733e17csm466012485a.36.2026.07.30.10.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 10:43:57 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 00/15] SDM660 sound card and internal MI2S support
Date: Thu, 30 Jul 2026 13:43:38 -0400
Message-ID: <20260730174353.108023-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the SDM660 (formerly "SDM660 internal") sound card
and support for WCD codecs over internal MI2S (represented in APIs as
LPI MI2S).

Like on MSM8916 and MSM8953, some SDM660 and SDM670 devices connect to a
digital and analog codec. The connection to the digital codec is through
special "internal" MI2S ports. The digital and analog codecs are used on
the Xiaomi Redmi Note 7 for headset (playback + capture) and earpiece,
and also on the Google Pixel 3a for the headset.

This series does not include devicetree patches.

Changes since v5 (https://lore.kernel.org/r/20260609162255.31074-1-mailingradian@gmail.com):
- add reviewed-by for LPASS ports patch (2/15)

Changes since v4 (https://lore.kernel.org/r/20260501153128.8152-1-mailingradian@gmail.com):
- name internal MI2S ports as LPI for public API (2/15, 6/15, 7/15, 8/15, 9/15, 10/15, 11/15, 12/15)
- fix capture stream macro (11/15)
- fix is_rx in q6afe port map (7/15)
- use NULL pointer in place of "NULL" string (8/15)
- change fallback compatible for WCD analog codec to pm8953 (4/15)
- add ack tags (1/15, 3/15)

Changes since v3 (https://lore.kernel.org/r/20260331193939.40636-1-mailingradian@gmail.com):
- rebase onto v7.1-rc1

Changes since v2 (https://lore.kernel.org/r/20260304195815.52347-1-mailingradian@gmail.com):
- add missing sign-off (1/15)
- use definition of last dt-bindings dai cell for LPASS_MAX_PORT (6/15)
- move sdm660 support to existing sm8250 driver (11-12/15)
- import WCD codec patches for MSM8953 (3/15, 13-14/15)
	Changes from original (https://lore.kernel.org/r/20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com):
	- add back empty line in WCD dt-bindings patch (3/15)
	- add Dmitry's review tags (13-14/15)
	- rebase onto q6dsp fixes
- rebase onto q6dsp fixes

Changes since v1 (https://lore.kernel.org/r/20260211020302.2674-1-mailingradian@gmail.com):
- rename sound card to drop "internal" (1/11, 10/11)
- use common headphone jack code (9/11, 10/11)
- remove no-op code in sound card driver (10/11)
- remove inaccurate comment about clock consumer/producer (10/11)
- add review tags (3/11, 4/11)

Adam Skladowski (2):
  ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
  ASoC: msm8916-wcd-analog: add pm8950 codec

Nickolay Goppen (1):
  ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660

Richard Acayan (11):
  ASoC: dt-bindings: qcom: q6dsp: add support for lpi mi2s ports 5-6
  ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
  ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
  ASoC: qdsp6: q6dsp-lpass-ports: add support for lpi mi2s ports 5-6
  ASoC: qdsp6: q6afe: add internal mi2s support
  ASoC: qdsp6: q6afe-dai: add internal mi2s support
  ASoC: qdsp6: q6routing: add lpi mi2s support
  ASoC: qdsp6: common: support headphone jacks connected to lpi mi2s
  ASoC: qcom: sm8250: add support for LPI_MI2S_RX_0 and LPI_MI2S_TX_3
  ASoC: qcom: sm8250: add SDM660 compatible
  ASoC: msm8916-wcd-analog: add quirk for cajon 2.0

Vladimir Lypak (1):
  ASoC: msm8916-wcd-analog: add pm8953 codec

 .../sound/qcom,msm8916-wcd-digital-codec.yaml |   8 +-
 .../sound/qcom,pm8916-wcd-analog-codec.yaml   |  11 +-
 .../sound/qcom,q6dsp-lpass-ports.yaml         |   4 +-
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 .../sound/qcom,q6dsp-lpass-ports.h            |   4 +
 sound/soc/codecs/msm8916-wcd-analog.c         | 144 +++++++++++++++++-
 sound/soc/qcom/common.c                       |   1 +
 sound/soc/qcom/common.h                       |   2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c              |  48 ++++++
 sound/soc/qcom/qdsp6/q6afe.c                  |  56 +++++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |   5 +
 sound/soc/qcom/qdsp6/q6routing.c              |  78 +++++++++-
 sound/soc/qcom/sm8250.c                       |  17 +++
 13 files changed, 367 insertions(+), 12 deletions(-)

-- 
2.55.0

