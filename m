Received: from mail-m32113.qiye.163.com (mail-m32113.qiye.163.com [220.197.32.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A653B2D8DD0;
	Sat,  6 Jun 2026 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780773271; cv=none; b=m+pvRnnpPK6AeVw01nc3bT82To0XH6XR2TAfgkdVN53n8IXbE7wLfnPqBEwC58Vo0K6t88nCF1/ODDm/a7So0wEEL1HuM+xA157s0ndbLY5MU2K/l5uqwJYpjx4a0Zq9wxQqxLoH199bBVuBrLtuWTeEEcSM3NdgnkMsZcHkM2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780773271; c=relaxed/simple;
	bh=IABZdxqTlxrkAaJmB/SbLJ3bBbi85l6Cufavt9VzJr0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TqYGUNBsME0uYA82W7XdqOjNHkn4sEJARYy6o/aSU1ZLYxd1Bvgkr0ZRkBR0g+mVzEUYWnWAaNy6QvO8IGB7LaN6QLo9trjJ/DQrUENshzWzU8oqaN7Bb9+YsggOYGajPg+e94ymcghD8Mt62g4JL2ItOdekkvUTHUIrdCzO1NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=aopiUIlB; arc=none smtp.client-ip=220.197.32.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="aopiUIlB"
Received: from [127.0.1.1] (unknown [113.235.125.44])
	by smtp.qiye.163.com (Hmail) with ESMTP id 415a25036;
	Sun, 7 Jun 2026 02:58:40 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Subject: [PATCH 0/5] Add audio support for QCS6490 RubikPi3
Date: Sun, 07 Jun 2026 02:58:16 +0800
Message-Id: <20260607-rubikpi-next-20260605-v1-0-7f334e16fea6@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMhtJGoC/z3MywqAIBCF4VeJWSeodKNXiRamU02BhVYE0rtnB
 S2/A+cP4NEReqiTAA4P8rTYCJEmoEdlB2RkokFyWfCC58ztHc0rMYvnxv61N0YJkVUyMyXE7+q
 wp/PtNu1nv3cT6u2JwXXdXt+yonkAAAA=
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
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 mohammad.rafi.shaik@oss.qualcomm.com, rosh@debian.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780772320; l=2048;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=IABZdxqTlxrkAaJmB/SbLJ3bBbi85l6Cufavt9VzJr0=;
 b=DLy1KBU96IPFfCZ47AKDLWzKxCnoAj166h4I62bkXoOa+LJHHZHYy5DPgo3PS9ihpBxEUr8uL
 cLWYb6N2+F8BecqgwW9+IOwtINiC6bHopXjhNRr7jbaPflmQrIHqNDb
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9e9e4d33d609d5kunm343af971138ad4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHx8aVh4fSR1MSUpNHkhDT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJTlVPT1lXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PS1VKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=aopiUIlBTgUq8fNPkhb+/npOJ7x+bkViNOTC3EtoXmw310p5zdTdJEvuVNBucvnifx86PXkbXQ8JVCmcRAVm7Lgr/+L102K+Lu55yaLYjjkojT3JCZILtR2OGlEBY2WY8uEqFm4TsGr/m/dhc6p6kgh7xpU+VN/Kb/vWVv0UAH4=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=hQ46BKVamGSK3m9eVxhd/n4maC8WpfGZkI/xp74gi4o=;
	h=date:mime-version:subject:message-id:from;

Add audio support for the Thundercomm RubikPi3 board based on QCS6490.

RubikPi3 uses AudioReach/GPR on the ADSP, an ES8316 headset codec on
primary MI2S, HDMI audio through the LT9611 bridge, and SPDIF TX/RX
on tertiary MI2S exposed on the 40-pin header.

The series first documents the ES8316 jack detect inversion property
and the board-specific Qualcomm sound card compatible. It then adds the
missing q6prm MCLK IDs required to drive the external codec MCLK.

The sc8280xp machine driver is extended with per-card data so the
RubikPi3 MI2S DAI format, MCLK, BE parameters and headset jack pins
can be handled without adding DAI format properties to devicetree.

The final patch describes the RubikPi3 audio hardware in devicetree.

Tested on Thundercomm RubikPi3:
- HDMI playback
- Headset playback and capture
- Headset jack detection

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
Hongyang Zhao (4):
      ASoC: dt-bindings: es8316: Document jack detect inversion
      ASoC: dt-bindings: qcom,sm8250: Add QCS6490 RubikPi3 sound card
      ASoC: qcom: sc8280xp: Add per-card data
      arm64: dts: qcom: qcs6490-rubikpi3: Add audio support

Neil Armstrong (1):
      ASoC: qcom: qdsp6: q6prm: add the missing MCLK clock IDs

 .../devicetree/bindings/sound/everest,es8316.yaml  |   5 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   1 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 196 +++++++++++++
 sound/soc/qcom/common.c                            |  75 ++++-
 sound/soc/qcom/common.h                            |   6 +-
 sound/soc/qcom/qdsp6/q6prm-clocks.c                |   5 +
 sound/soc/qcom/qdsp6/q6prm.h                       |  11 +
 sound/soc/qcom/sc8280xp.c                          | 319 +++++++++++++++++++--
 8 files changed, 575 insertions(+), 43 deletions(-)
---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260605-rubikpi-next-20260605-fdda114824d7

Best regards,
--  
Hongyang Zhao <hongyang.zhao@thundersoft.com>

