Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6F62652B6;
	Mon,  2 Feb 2026 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026038; cv=none; b=XOsw5dJl5DzzkgiNiD7iIqxVmx4gnosrxOAcZZdbfWHQ8g6RUHTUL75tqwBbTzLUc610vuF1kRy8ImqnWzqN/r+AhXtRBkRy0v1UqVXsMOWDn4RbvpM2FL51EaGv2ql0vmJF8cwoR3xWkikAPasU8JnZPFexg6vrpYjJPHVxIII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026038; c=relaxed/simple;
	bh=rljyZq8r/TJdianIVGUUDKNS2P0KZdD4ZxicZpb3IkA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gS4EkEU6EPMFefnqRlzP70TmDgjApTPfrNHVoDpuOFpP5H9vgEOpbRXDZ7HoJE/Zz/Zb9bNurk0VIKpyLlkPsk6NtCvXnbtFIZO4WIcyQkUM5DOfMAMG56YKur7d4Tm86AYU3drR+LefC45x/hsPltLaWI+OKKeji6JIYQdL2bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/Z7LMVZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/Z7LMVZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB310C116C6;
	Mon,  2 Feb 2026 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770026038;
	bh=rljyZq8r/TJdianIVGUUDKNS2P0KZdD4ZxicZpb3IkA=;
	h=From:To:Cc:Subject:Date:From;
	b=t/Z7LMVZmzWY/Es0DoOgIT35NrmJnDGZFaXImiS9b0v5IARfSB0QHN9q3NraSrVYA
	 gkKfih9jiu2uFBEYE3AtEXBsJg/AMXG0FWHT65Eun+LirmF8pe7llApiv3aMaQtet2
	 M9U8GCskbpnO22lwO0DHekYBen2bU+qZV88+pGyba/IWjpIROrgQRexTv3rQASJzLQ
	 TnQqGxv4Gv0eZuO6pQWPRdc1eP08DsS0f3d58xzNUqN1HqVPCu88oULhfZAPHs+/c5
	 Opq097zsLHSsK4rWWVxk9oR/GiWTgPti+Xt5qvbqL1ZsHpU156BcE3BdpMUYMg9lRy
	 N3KdP5GyATyvA==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_sai: add IMX_SCMI_MISC_DRV dependency
Date: Mon,  2 Feb 2026 10:53:50 +0100
Message-Id: <20260202095353.1233963-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The sai driver now links against the SCMI code directly, causing a
link failure when that is in a loadable module:

aarch64-linux-ld: sound/soc/fsl/fsl_sai.o: in function `fsl_sai_probe':
fsl_sai.c:(.text+0x1fe4): undefined reference to `scmi_imx_misc_ctrl_set'

Move the dependency from SND_SOC_FSL_MQS to SND_SOC_FSL_SAI. The MQS
driver depends on the SAI one, so it still gets the same dependency
indirectly.

All other drivers that select the SAI symbol need the same dependency
in turn, though that could probably get replaced with a 'depends on
SND_SOC_FSL_SAI' to keep it simpler.

Fixes: 19b08fd23b20 ("ASoC: fsl_sai: Add AUDMIX mode support on i.MX952")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/fsl/Kconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index c4a00b22bc2a..828524c90f17 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -19,6 +19,7 @@ config SND_SOC_FSL_ASRC
 
 config SND_SOC_FSL_SAI
 	tristate "Synchronous Audio Interface (SAI) module support"
+	depends on IMX_SCMI_MISC_DRV || !IMX_SCMI_MISC_DRV
 	select REGMAP_MMIO
 	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
 	select SND_SOC_GENERIC_DMAENGINE_PCM
@@ -32,7 +33,6 @@ config SND_SOC_FSL_SAI
 config SND_SOC_FSL_MQS
 	tristate "Medium Quality Sound (MQS) module support"
 	depends on SND_SOC_FSL_SAI
-	depends on IMX_SCMI_MISC_DRV || !IMX_SCMI_MISC_DRV
 	select REGMAP_MMIO
 	help
 	  Say Y if you want to add Medium Quality Sound (MQS)
@@ -309,6 +309,7 @@ config SND_SOC_IMX_SGTL5000
 
 config SND_SOC_FSL_ASOC_CARD
 	tristate "Generic ASoC Sound Card with ASRC support"
+	depends on IMX_SCMI_MISC_DRV || !IMX_SCMI_MISC_DRV
 	depends on OF && I2C
 	# enforce SND_SOC_FSL_ASOC_CARD=m if SND_AC97_CODEC=m:
 	depends on SND_AC97_CODEC || SND_AC97_CODEC=n
@@ -330,6 +331,7 @@ config SND_SOC_FSL_ASOC_CARD
 
 config SND_SOC_IMX_AUDMIX
 	tristate "SoC Audio support for i.MX boards with AUDMIX"
+	depends on IMX_SCMI_MISC_DRV || !IMX_SCMI_MISC_DRV
 	select SND_SOC_FSL_AUDMIX
 	select SND_SOC_FSL_SAI
 	help
@@ -339,6 +341,7 @@ config SND_SOC_IMX_AUDMIX
 
 config SND_SOC_IMX_HDMI
 	tristate "SoC Audio support for i.MX boards with HDMI port"
+	depends on IMX_SCMI_MISC_DRV || !IMX_SCMI_MISC_DRV
 	select SND_SOC_FSL_SAI
 	select SND_SOC_FSL_AUD2HTX
 	select SND_SOC_HDMI_CODEC
@@ -364,6 +367,7 @@ config SND_SOC_IMX_RPMSG
 config SND_SOC_IMX_CARD
 	tristate "SoC Audio Graph Sound Card support for i.MX boards"
 	depends on OF && I2C
+	depends on IMX_SCMI_MISC_DRV || !IMX_SCMI_MISC_DRV
 	select SND_SOC_AK4458
 	select SND_SOC_AK5558
 	select SND_SOC_IMX_PCM_DMA
-- 
2.39.5

