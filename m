From: "Figo.zhang" <figo1802@gmail.com>
Date: Sun, 07 Jun 2009 05:37:27 +0000
Subject: [PATCH]sgio2audio.c: clean up checking
Message-Id: <1244353048.3355.22.camel@myhost>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

vfree() does it's own 'NULL' check,so no need for check before
calling it.

Signed-off-by: Figo.zhang <figo1802@gmail.com>
---  
 sound/mips/sgio2audio.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/sound/mips/sgio2audio.c b/sound/mips/sgio2audio.c
index 66f3b48..e497525 100644
--- a/sound/mips/sgio2audio.c
+++ b/sound/mips/sgio2audio.c
@@ -619,8 +619,7 @@ static int snd_sgio2audio_pcm_hw_params(struct snd_pcm_substream *substream,
 /* hw_free callback */
 static int snd_sgio2audio_pcm_hw_free(struct snd_pcm_substream *substream)
 {
-	if (substream->runtime->dma_area)
-		vfree(substream->runtime->dma_area);
+	vfree(substream->runtime->dma_area);
 	substream->runtime->dma_area = NULL;
 	return 0;
 }


