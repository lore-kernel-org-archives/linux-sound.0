Received: from mail-m49209.qiye.163.com (mail-m49209.qiye.163.com [45.254.49.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25482481FCE;
	Wed, 15 Jul 2026 14:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126346; cv=none; b=UnrY/03T3bk/HtJ6rJFvui7ZLly+dNJnOAk4j/HTOzZlfG0YxnHoSTmCjJPkEjIG6RfJ1f+alRfu/CCuTE06zZaKvnaMCmSOxUpnqyVDOwksNAu8LAwlx/myIJEVyIiz//55Rc6gNji4ozCLmCNN5bmWFo7PXtV8VnUNPKjW1Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126346; c=relaxed/simple;
	bh=5nb+2AzNbcMGDM8bfcBZvxtWt9xC71dpNJnpxq8QroI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c/zOe4FSQ8b82F9PwqmTlKa12mUKYNvZqmxpUd78YHtDhsNSbvxiXgojhJoouj2vIdAuv8JkuFeiqG39Q/3/+BN2dtlnYcs6Ue0N/OjYlqTLJ3t44KyHBPu4UskQItH3j1gRJwt628Goh+j7l2rvB9AKEfD6i0lwkD8cvVY+E3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=Gq+WrDzi; arc=none smtp.client-ip=45.254.49.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="Gq+WrDzi"
Received: from [127.0.1.1] (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 464e8f2e5;
	Wed, 15 Jul 2026 22:03:19 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH v2 0/6] Add audio support for QCS6490 RubikPi3
Date: Wed, 15 Jul 2026 22:02:49 +0800
Message-Id: <20260715-rubikpi-next-20260605-v2-0-67601d7a8581@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAuTV2oC/z2Ny2rDMBBFf8VoXRm9LZtS+h8li5E0qtVUdiLZJ
 RDy77Wd0s3AGe49904qloSVDM2dFPxJNc3TBuKlIX6E6RNpChsTwYRhhmlaVpfOl0QnvC30/xt
 DAM6VFSp0ZOteCsZ0O7wfpyfX1X2hX3bZX6Lgdd0Gl2eMZKwVjsGheT3MHVdcaaFZK1QnleGU0
 zyPkDOEtkBMbR0hnd/nWtvrCt9+zrndztsxAIsfD5mI3AWJEbwUlkkWgsWIwkbX62iVYdIay5T
 cWw4q0t2TlqFxiJ2RQUepuOt7H1UnIKLTzAbVWxuNAOOBk9Pj8QtJpo8FSgEAAA==
X-Change-ID: 20260605-rubikpi-next-20260605-fdda114824d7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
 Katsuhiro Suzuki <katsuhiro@katsuster.net>, 
 Matteo Martelli <matteomartelli3@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Roger Shimizu <rosh@debian.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784124199; l=3956;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=5nb+2AzNbcMGDM8bfcBZvxtWt9xC71dpNJnpxq8QroI=;
 b=1Lshf+r2AMRAxLnDb9tuCVZNHlXds8x4TGYnQKh1rcH+cjE3BrMTYo5b1tQggFJqZMKZFsN1z
 rXHutEOMTpxAjQKwGc7IRVeFIcBKZ6ktrg0ADZoO3IfyNNMg71UguvF
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9f6616d39d09d5kunm638899c211096
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0lPVk8ZGUJCT09LHklJSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lCQ0JKVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Gq+WrDziJ/HPpaSvoNbVfxr+HAxi3i6MkPM+NFeNBMC5B380Bd3eOKcxDGH+LUKBeGl2QlXJewcDyCXyoRSQT5IwF3EniTPvUllzVsVURg/cvibuHohwOjHPtHNSIN6suXgKzf3mmZk4IE8zG0rEvLLI57ImDkEbsSinAl8XkEY=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=OwRjAZBd7v7Q701JBzvsj3dd+LTCNH3tJ5RvPt1Vzgw=;
	h=date:mime-version:subject:message-id:from;

Add audio support for the Thundercomm RubikPi3 board based on QCS6490.

RubikPi3 uses AudioReach/GPR on the ADSP. An ES8316 codec connected to
primary MI2S provides headset playback, headset capture and jack
detection. The LT9611 bridge connected to quaternary MI2S provides HDMI
audio playback.

The series first documents the existing ES8316 jack-detect inversion
property and adds a board-specific Qualcomm sound-card compatible. A
generic Qualcomm headset helper is then added for codecs which implement
component jack detection but are not connected through a WCD codec DMA
link.

The sc8280xp machine driver board data is converted to a per-DAI
representation. This allows each backend to select its own DAI format,
clock programming and jack setup. RubikPi3 uses this to drive the ES8316
with a 19.2 MHz MCLK and to avoid unsupported sysclk programming on the
LT9611 HDMI link.

The final patch describes the two audio paths, clocks, pin control,
codec power and jack-detect wiring in the RubikPi3 device tree.

This series is based on next-20260710 and depends on Rafi's
q6apm-lpass-dais MI2S clock control series and Neil's q6prm MCLK clock
ID patch:

Depends-on: https://lore.kernel.org/all/20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com/
Depends-on: https://lore.kernel.org/all/20251008-topic-sm8x50-next-hdk-i2s-v2-1-6b7d38d4ad5e@linaro.org/

Tested on Thundercomm RubikPi3:

- HDMI playback
- Headset playback and capture
- Headset jack detection

Changes in v2:

- Rebased onto next-20260710 and Rafi's latest q6apm-lpass-dais MI2S
  clock control series (v5).
- Dropped the bundled q6prm MCLK ID patch and added a dependency on
  Neil's existing patch.
- Split the generic headset helper, per-DAI driver refactoring and
  RubikPi3 machine data into separate patches.
- Reworked the sc8280xp board data from global flags to per-DAI
  configuration and migrated existing users.
- Explained why the existing QCM6490 and QCS6490 sound-card compatibles
  cannot be reused for RubikPi3.
- Moved MI2S pin control to the sound card and fixed audio-routing
  formatting as requested during v1 review.
- Added primary MI2S backend clock subnodes for MCLK and BCLK control.
- Dropped the untested SPDIF links from the device tree.
- Verified HDMI and headset playback, headset capture and jack detection
  on hardware.

Link: https://lore.kernel.org/all/20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com/

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Hongyang Zhao (6):
      ASoC: dt-bindings: es8316: Document jack detect inversion
      ASoC: dt-bindings: qcom,sm8250: Add RubikPi 3 sound card
      ASoC: qcom: common: Add generic headset jack helpers
      ASoC: qcom: sc8280xp: Add per-DAI board configuration
      ASoC: qcom: sc8280xp: Add RubikPi 3 sound card support
      arm64: dts: qcom: qcs6490-rubikpi3: Add audio support

 .../devicetree/bindings/sound/everest,es8316.yaml  |   5 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   1 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 159 ++++++++++++++++++
 sound/soc/qcom/common.c                            |  61 ++++++-
 sound/soc/qcom/common.h                            |   3 +
 sound/soc/qcom/sc8280xp.c                          | 177 ++++++++++++++++++---
 6 files changed, 375 insertions(+), 31 deletions(-)
---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260605-rubikpi-next-20260605-fdda114824d7
prerequisite-message-id: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
prerequisite-patch-id: 2e26f868c659376d3a1dd4c3e3d34ddb24aa226d
prerequisite-patch-id: aa51a266a595ff79730f56920b7c552e53285869
prerequisite-patch-id: b469932718c83bffa60b62c84dfc4cc8abc199e3
prerequisite-patch-id: 2f1bd3efac328030dd8efe28fb95f84603868043

Best regards,
-- 
Hongyang Zhao <hongyang.zhao@thundersoft.com>

