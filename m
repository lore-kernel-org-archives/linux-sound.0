Received: from MTA-15-3.privateemail.com (MTA-15-3.privateemail.com [198.54.122.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BA6125A0;
	Wed, 29 Jul 2026 00:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.122.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785283649; cv=none; b=Vl2sopz+MI5addLc2w52uRdU6dOP0h65LvLK30ud+Vu3DpY/pyzJnB4/m82It+Cg+VAIUvjzhG9+6tWgw9x6l4gxbTTb2Y716ajpBRXT5Ng+U1fxx6jqa2ZVk5RGFrbjLqi5nGgVL8l6BJplEcnKgDY2E/j9C57dpTIAc2fJ6vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785283649; c=relaxed/simple;
	bh=OrMIx5BfzWzyD3KgobcsmG4ljO1ic5UV98bJAhI+06s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lFiXo9n5A0uDbfyg3+34KKMTjvnRlF69kkTTcG9KWMnoR/0Ci9en/wy5VElHZazK4E0BC5x2K7Wq/i6l+UbvGdEZPmY7oC9zoTLqM3Rpr2TfAHpbNMsg7T/24EwNClbf9Sfd24/7Ez7gy+vt3O0ffCS8It46jgLIQQ1qRVgLWLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.122.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (K8S-PROD-WORKER-09 [87.215.145.39])
	by mta-15.privateemail.com (Postfix) with ESMTPA id 4h8t1F4ZRWz3hhTM;
	Tue, 28 Jul 2026 20:06:57 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Mark Brown <broonie@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Julian Braha <julianbraha@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: codecs: add the Qualcomm WCD9378 audio codec
Date: Wed, 29 Jul 2026 02:06:47 +0200
Message-ID: <20260729000649.263426-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds bindings and a codec driver for the Qualcomm WCD9378,
found on SM7635 boards such as the Fairphone 6. The chip pairs a
WCD937x-compatible analog core with SDCA function blocks whose built-in
sequencers handle the analog power-up/down; all control registers,
analog core included, sit in a 32-bit paged SDCA control address space
behind the TX SoundWire slave.

The driver implements the TX/capture paths (three ADCs fed from four
analog microphone inputs, three mic bias supplies) and is modeled on
wcd937x, reusing the wcd-common helpers. RX/playback, MBHC and the
SmartAMP function are follow-up work. Register sequences come from the
GPL downstream wcd9378 driver in Qualcomm's audio-kernel-ar tree; the
chip has no public datasheet.

The slave binding is now a single file covering both presentations of
the chip: the two-slave mobile wiring this driver handles, and the
aggregated single-slave SDCA mode of compute platforms, targeted by
Srinivas's pending SDCA class series. Agreed with Srinivas in that
series' review so it can drop its own binding file and the two drivers
can share the SoundWire ID table:
https://lore.kernel.org/all/06aef9a5-7e8e-4262-9b41-a9c43f588da9@oss.qualcomm.com/

Two dependencies outside this series, both routed through the
soundwire tree:

- the paged register map needs the Qualcomm controller's SCP address
  paging support, already applied there as commit 999f80904763
  ("soundwire: qcom: add SCP address paging support"). Any order works;
  capture just needs both to land.

- v2 has the SoundWire core program the codec's bus-clock base/scale
  registers (prop.clock_reg_supported) instead of hand-rolling the
  writes, following Pierre-Louis's v1 review. On Qualcomm controllers
  the core can only do that once the bus declares its clock:
  https://lore.kernel.org/linux-sound/20260728173542.61146-1-jorijnvdgraaf@catcrafts.net/
  Ordering matters for this one: with this series but without that
  patch, slave initialization on Qualcomm buses fails at enumeration
  ("no bus MCLK") and the codec binds with its bus-clock registers
  unprogrammed, i.e. dead capture; it needs to land first or together
  with this.

Tested on the Fairphone 6 (SM7635) together with the two soundwire
patches above: handset mic capture through the LPASS TX macro at
48 kHz across reboots, including UCM-driven use by PipeWire in a
Plasma Mobile session. The board DTS follows once these bindings are
accepted.

v2:
- the micbias4-requirement patch is squashed into the binding patch
  (Krzysztof)
- one slave binding for both chip presentations (see above), with
  qcom,{tx,rx}-port-mapping replaced by qcom,port-mapping plus a
  qcom,control-device flag, the channel-mapping properties dropped,
  and the codec example trimmed per Rob's review
- driver: single entry point declining qcom,compute-mode nodes;
  bus-clock and runtime-PM rework from Pierre-Louis's review; Kconfig
  style fixes from Julian Braha's review; sashiko-bot's tx_mode_put
  and mutex_destroy items
- rebased; per-patch changelogs have the details
v1: https://lore.kernel.org/linux-sound/20260706192229.144137-1-jorijnvdgraaf@catcrafts.net/

Jorijn van der Graaf (2):
  ASoC: dt-bindings: add the Qualcomm WCD9378 audio codec
  ASoC: codecs: wcd9378: add TX/capture codec driver

 .../bindings/sound/qcom,wcd9378-codec.yaml    |   54 +
 .../bindings/sound/qcom,wcd9378-sdw.yaml      |  182 +++
 .../bindings/sound/qcom,wcd937x.yaml          |    1 +
 .../bindings/sound/qcom,wcd938x.yaml          |    1 +
 .../bindings/sound/qcom,wcd939x.yaml          |    1 +
 .../bindings/sound/qcom,wcd93xx-common.yaml   |    1 -
 sound/soc/codecs/Kconfig                      |   19 +
 sound/soc/codecs/Makefile                     |    7 +
 sound/soc/codecs/wcd9378-sdw.c                |  441 ++++++
 sound/soc/codecs/wcd9378.c                    | 1366 +++++++++++++++++
 sound/soc/codecs/wcd9378.h                    |  244 +++
 11 files changed, 2316 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-codec.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml
 create mode 100644 sound/soc/codecs/wcd9378-sdw.c
 create mode 100644 sound/soc/codecs/wcd9378.c
 create mode 100644 sound/soc/codecs/wcd9378.h


base-commit: eeb306184b615ab6c6008126bc1fe0080b8e94f9
-- 
2.55.0

