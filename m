Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB11318B9C;
	Wed, 15 Apr 2026 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776266614; cv=none; b=Elo9W2EjoFpF3yLjFGgqhKK2tHbHQtJAjS5F9sO9Psk6G0Wb7P5wjOy/xqR99mzCm031fcH59Ujswlz9yfue+a6adys3OL6kLLqKK2GKVEZncLb31vBKlWaPZ6tS+uq7qutjtZMM5SgFuMOtL7ThMT/vJaSuSIiJ+0zihQhJOqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776266614; c=relaxed/simple;
	bh=0YVgNbHhY/0nECOT4HC2itCTck9XqN3jzadMCFPYGxg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQvG2w8k0HvuL3PkVvj1LnaW8TUJBhUCtNF3qrYIMmUrg2uXzVLXC7ck1pegrpDr557cAdprvvgx179+wV1urIWCgFAgfB/rCM4oAttlOMk7OqGfa0iT3oAAmsOrYlx376h96QNTsDR0FPsNvKJDNYHOx43We2HY1ShxN6fwnBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wD25J-000000002dB-1dYA;
	Wed, 15 Apr 2026 15:23:21 +0000
Date: Wed, 15 Apr 2026 16:23:17 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/9] ASoC: mediatek: mt2701: HDMI audio support
Message-ID: <cover.1776265610.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This series wires up on-chip HDMI audio on MT2701 and MT7623, from the
DRM bridge down through the AFE into a small machine driver that binds
the AFE HDMI BE to the HDMI TX codec already exposed by the
mediatek-drm-hdmi driver. Bindings, DT and a BananaPi R2 board node
are included.

In order to survive vblank or late hotplug of the monitor, the fix
submitted separately [1] is required as well.

Everything here was developed for and tested on a BananaPi R2
(MT7623N), which turns ten years old this year -- a nice occasion to
finally land native HDMI audio for a SoC which was truly ahead of its
time.

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/a3e22cbae528c9a38d854a586d1736b860998d41.1776265222.git.daniel@makrotopia.org/

Daniel Golle (9):
  dt-bindings: sound: mt2701-afe-pcm: add HDMI audio path clocks
  dt-bindings: sound: add mediatek,mt2701-hdmi-audio machine binding
  ASoC: mediatek: mt2701: add AFE HDMI register definitions
  ASoC: mediatek: mt2701: add optional HDMI audio path clocks
  ASoC: mediatek: mt2701: add HDMI audio memif, FE and BE DAIs
  ASoC: mediatek: mt2701: add machine driver for on-chip HDMI codec
  ARM: dts: mediatek: mt2701: wire HDMI audio path clocks into AFE
  ARM: dts: mediatek: mt7623: wire HDMI audio path clocks into AFE
  ARM: dts: mediatek: mt7623n-bananapi-bpi-r2: add HDMI audio machine
    node

 .../bindings/sound/mediatek,mt2701-audio.yaml |  10 +
 .../sound/mediatek,mt2701-hdmi-audio.yaml     |  47 +++
 arch/arm/boot/dts/mediatek/mt2701.dtsi        |  21 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi        |  21 +-
 .../dts/mediatek/mt7623n-bananapi-bpi-r2.dts  |   7 +
 sound/soc/mediatek/Kconfig                    |  10 +
 sound/soc/mediatek/mt2701/Makefile            |   1 +
 .../mediatek/mt2701/mt2701-afe-clock-ctrl.c   |  22 ++
 sound/soc/mediatek/mt2701/mt2701-afe-common.h |   6 +
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    | 281 +++++++++++++++++-
 sound/soc/mediatek/mt2701/mt2701-hdmi.c       | 114 +++++++
 sound/soc/mediatek/mt2701/mt2701-reg.h        |  35 +++
 12 files changed, 564 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-hdmi-audio.yaml
 create mode 100644 sound/soc/mediatek/mt2701/mt2701-hdmi.c

-- 
2.53.0
