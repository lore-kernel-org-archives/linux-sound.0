From: Bo Shen <voice.shen@atmel.com>
Date: Tue, 02 Jul 2013 07:55:16 +0000
Subject: [PATCH 0/2] ASoC: atmel-pcm: use generic dmaengine framework
Message-Id: <1372751718-1437-1-git-send-email-voice.shen@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, richard.genoud@gmail.com, Nicolas Ferre <nicolas.ferre@atmel.com>, linux-sound@vger.kernel.org, Bo Shen <voice.shen@atmel.com>, linux-arm-kernel@vger.kernel.org

this patch series is based on next-20130701

Bo Shen (2):
  ASoC: atmel_ssc_dai: move set dma data to startup callback
  ASoC: atmel-pcm: use generic dmaengine framework

 sound/soc/atmel/atmel-pcm-dma.c |  118 ++++++---------------------------------
 sound/soc/atmel/atmel_ssc_dai.c |   33 ++++++-----
 2 files changed, 32 insertions(+), 119 deletions(-)

-- 
1.7.9.5

