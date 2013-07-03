From: Bo Shen <voice.shen@atmel.com>
Date: Wed, 03 Jul 2013 08:37:55 +0000
Subject: [v2 0/5] ASoC: atmel-pcm: align with generic dmaengine framwork
Message-Id: <1372840680-2253-1-git-send-email-voice.shen@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, richard.genoud@gmail.com, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-sound@vger.kernel.org, Bo Shen <voice.shen@atmel.com>, linux-arm-kernel@lists.infradead.org

This patch set is based on linux next-20130701

mainly implement
  - move set dma data from hw_params to startup callback to avoid memory leak
  - align atmel pcm with generic dmaenigne framwork

Bo Shen (5):
  ASoC: atmel_ssc_dai: move set dma data to startup callback
  ASoC: atmel_ssc_dai: add error mask define
  ASoC: atmel-pcm-dma: move prepare for dma to dai prepare
  ARM: atmel-ssc: change phybase type to dma_addr_t
  ASoC: atmel-pcm: use generic dmaengine framework

 include/linux/atmel-ssc.h       |    2 +-
 sound/soc/atmel/Kconfig         |    1 +
 sound/soc/atmel/atmel-pcm-dma.c |  118 ++++++---------------------------------
 sound/soc/atmel/atmel_ssc_dai.c |   36 ++++++------
 4 files changed, 37 insertions(+), 120 deletions(-)

-- 
1.7.9.5

