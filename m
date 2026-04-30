Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9270A1A9FA0;
	Thu, 30 Apr 2026 02:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777515885; cv=none; b=erZ5VmkM7aSFe+Vv1tV0LYlhRxbwGuj1HY1DpbUfzTu/7MvhlW4i2T1DyMv6LiqZMoOQAKgHs0ERhoMY8+KdReFDp4/5JAvQmShoENdyx5+NHwxG18LW6F5cKmki+fnxZbMzlm68bZqJEoxI2/DZ7XAkz3SztMDpnmjPLf7UeWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777515885; c=relaxed/simple;
	bh=4aiOeKKb+UbTLE9+CaJtR6+QgqJn3MfH7aKnjY1Ud34=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iwLlffCQtLcR3B1JoXiyfKzYfaIueQHsQxgZHSuM04xPv+XIjiokmqu3dxmXZl3x1cTrG2p8+paWVw/pZFVn8VKg51lvxhed5f1m2VmNb/PwzQFFswIuln4WqatC4Iu5EtJyTK+19WivBrBugZMV3zyTJ8y7c+FEXHWmpkqWtuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=CBBEx6LY; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CBBEx6LY"
X-UUID: b6498f3a443b11f19781c1a04af40193-20260430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6csRNqYl/P4DiJM6Rj3s9FbYBxV7Gr8bzIMm3MDrQCY=;
	b=CBBEx6LYQJHz0qSNoUzX3FoDcC25lkipPA9WctFuVMOloOIeGHZ6xRuH/+tPRLjD29JvYXsyY1l6VFDDrRxw8RXM38cCqPgGLtf9Yxvmpj0/xojTNSEtVGD9r4xGIm5Z+za14VSgohVZceKS54xNIlagcvo1+xULE9uDjHw2DGM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f2418120-a30d-45eb-b53b-0a3dfbd71e4f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:6b01a8be-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|102|836|865|888|898,TC:-5,Content
	:0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b6498f3a443b11f19781c1a04af40193-20260430
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 498202924; Thu, 30 Apr 2026 10:24:27 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 30 Apr 2026 10:24:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 30 Apr 2026 10:24:26 +0800
From: Cyril Chao <Cyril.Chao@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Cyril Chao <cyril.chao@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Cyril Chao
	<Cyril.Chao@mediatek.com>
Subject: [PATCH v9 00/10] ASoC: mediatek: Add support for MT8196 SoC
Date: Thu, 30 Apr 2026 10:23:13 +0800
Message-ID: <20260430022417.32282-1-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N

This series of patches adds support for Mediatek AFE of MT8196 SoC.
Patches are based on broonie tree "for-next" branch.

This v9 series is based on the v8 version:
Link: https://patchwork.kernel.org/project/alsa-devel/patch/20260324015719.17543-2-Cyril.Chao@mediatek.com/

Changes since v8:
  - Avoid divide-by-zero when computing CM update_val for mono.

Changes since v7:
  - Fix sparse warning in mt8196-nau8825 machine driver
    (reported by kernel test robot <lkp@intel.com>)
  - Reorder DT bindings patches before the driver patches so that the
    bindings land first and match the dependencies in the ASoC drivers
  - Replace the deprecated pcm_construct/pcm_destruct callbacks with
    pcm_new/pcm_free to follow the latest ASoC core API

Changes since v6:
 - optimize mtk_afe_pcm_pointer interface and improved logic checks.
 - update mt8196_afe_private structure by removing unused member variables.
 - only reference clocks directly supplied to afe and set required frequencies directly.
 - update adda driver according to reviewer suggestions.
 - update i2s driver according to reviewer suggestions.
 - update tdm driver according to reviewer suggestions.
 - optimize platform driver and update widget rotues.
 - move the sof route from platform driver to the machine driver, and moved pinctrl to platform driver.
 - update the afe yaml file to remove unnecessary clock references.

Changes since v5:
 - restore the commit message for mediatek,mt8196-afe.yaml and only remove the string document.
 - add reviewed owner for mediatek,mt8196-nau8825.yaml.
 - use SND_JACK_AVOUT as jack status.
 - use GENMASK_ULL to support 64-bit address masks.
 - modify the afe platform and i2s dai driver code based on reviewer's suggestions.

Changes since v4:
 - modify the mediatek,mt8196-afe.yaml commit message and add reviewed owner.
 - modify the mediatek,mt8196-nau8825.yaml commit message.
 - modify the audio common code based on reviewer's suggestions.
 - add reviewed and tested owners in the audio common code submission message.
 - fix cm update cnt calculation issue.

Changes since v3:
 - the AFE TOP CG index is added to the common header.
 - remove the audsys clk register and directly read and write to the regmap of afe cg clk.
 - modify the clk logic according to the suggestions.
 - remove the macro definition of MTKAIF4
 - remove the tdm cg event and directly read and write the tdm cg reg form the widget.
 - remove the i2s and cm cg event and directly read and write cg reg.
 - afe hopping and f26m clk cg are placed in remap_register_patch and enable.
 - the yaml file is modified according to the suggestions.
 - replace SND_SOC_DAIFMT_CBS_CFS with SND_SOC_DAIFMT_CBC_CFC.

Changes since v2:
  - remove the mtk_memif_set_channel interface modify.
  - remove duplicate definitions from the header file.
  - move the afe gate clk to the audio driver for management and registration
    and manage the afe clk gate in each dai driver.
  - delete the useless clk source.
  - the i2s driver adds i2s clk gate management, removes the additional dts
    configuration of i2s4.
  - the afe and i2s dai driver,memif and irq data structs are encapsulated using
    macros to reduce the amount of code.
  - the volatile reg is modified as suggested.
  - mt6681 codec is not supported, the mt6681 keyword is removed.
  - the name of the machine driver is changed from mt8196-mt6681.c to mt8196-nau8825.c
  - remove the i2s4 configuration from mt8196-afe.yaml and make the modifications as suggested.
  - change the mt8196-mt6681.yaml to mt8196-nau8825.yaml and make the modifications as suggested.

Changes since v1:
  - modify mtk_memif_set_channel and mtk_afe_pcm_pointer interfaces
    are improved to support mt8196.
  - remove duplicate definitions in the mt8196 common header file.
  - cm logic is merge into the afe platform driver.
  - modify afe clk to return judgment logic and remove useless clk sources.
  - refactor the mt8196 adda dai driver.
  - remove the gpio module and use SND_SOC_DAPM_PINCTRL to manage it.
  - removes CONNSYS_I2S related functions that are not supported in i2s dai driver.
  - fixed mt8196-afe.yaml and mt8196-mt6681.yaml syntax issues.
  - modify log printing in all modules.
  - optimize the header file included for machine driver.

Darren Ye (10):
  ASoC: mediatek: common: modify mtk afe platform driver for mt8196
  ASoC: mediatek: mt8196: add common header
  ASoC: mediatek: mt8196: support audio clock control
  ASoC: mediatek: mt8196: support ADDA in platform driver
  ASoC: mediatek: mt8196: support I2S in platform driver
  ASoC: mediatek: mt8196: support TDM in platform driver
  ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE
  ASoC: mediatek: mt8196: add platform driver
  ASoC: dt-bindings: mediatek,mt8196-nau8825: Add audio sound card
  ASoC: mediatek: mt8196: add machine driver with nau8825

 .../bindings/sound/mediatek,mt8196-afe.yaml   |   113 +
 .../sound/mediatek,mt8196-nau8825.yaml        |   100 +
 sound/soc/mediatek/Kconfig                    |    30 +
 sound/soc/mediatek/Makefile                   |     1 +
 .../mediatek/common/mtk-afe-platform-driver.c |    56 +-
 .../mediatek/common/mtk-afe-platform-driver.h |     2 +
 sound/soc/mediatek/mt8196/Makefile            |    14 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c    |   581 +
 sound/soc/mediatek/mt8196/mt8196-afe-clk.h    |    64 +
 sound/soc/mediatek/mt8196/mt8196-afe-common.h |   205 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c    |  2503 ++++
 sound/soc/mediatek/mt8196/mt8196-dai-adda.c   |   845 ++
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c    |  2613 ++++
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c    |   675 +
 .../mediatek/mt8196/mt8196-interconnection.h  |   121 +
 sound/soc/mediatek/mt8196/mt8196-nau8825.c    |   870 ++
 sound/soc/mediatek/mt8196/mt8196-reg.h        | 12068 ++++++++++++++++
 17 files changed, 20843 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-nau8825.yaml
 create mode 100644 sound/soc/mediatek/mt8196/Makefile
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-adda.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-interconnection.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-nau8825.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-reg.h

-- 
2.45.2

