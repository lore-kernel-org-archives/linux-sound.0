Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418B318C936;
	Wed, 22 Jan 2025 06:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737528821; cv=none; b=diLkHAfIIsLMpvPLfEBDWECZSUnjCi47n+BUk2/kxx5GSWm75fLJIwOB1upzu1egoiiWGoudDRvXPTPSIprf9JKHazerztc297SrAVOFTdzb/Xy5ycpwe/Cf+7eyumeYtwqUgl8BzJFWkk2Pa8oLfUP4xbn/bIPMe1HC/vOWpw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737528821; c=relaxed/simple;
	bh=TOwmapLGpGzHfA3E6jFJcldiqBcNAc+eOv3W7iWGYn8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DIjP7Gco2YkC03aoxG5P35LbIrRJAxFuL+kSfaThQWSQi8XB70kyxkd03YDkB6LJM+QG2BDJ5LtfDjrzsEh29/bZ8UeNtKd2BMuj6bLMSBvsLrofKXgvc8Pos4XzsdhplWDrg5MIgt18QeUuAkOnvxIu3GWK0T54Wa8aRDVFrao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sL43wKhZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sL43wKhZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95958C4CED6;
	Wed, 22 Jan 2025 06:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737528820;
	bh=TOwmapLGpGzHfA3E6jFJcldiqBcNAc+eOv3W7iWGYn8=;
	h=From:To:Cc:Subject:Date:From;
	b=sL43wKhZg6fzOvJJLsIFXmY4yAr3mR6QxAJ4TG8sE3mOuIB0Ap4gWW+o4c/RsDyGc
	 9/3Yv0yblcv3oPt9eqckR0phn0NNzZP7oI2dcbgwx6luZvez1QiinjTzxwzGkgZQ5s
	 Y7zyAZ0JHG/3nRKyl1u2kaNq0gcH6FuKL8OGGzt6DECkgQyjCZSXQRhMekjFo0M2/X
	 ldw4ESnZylGxxIz0YLPypyy2nnwXaHx5TaLW6huZzFuCn9kT5AjmoEnm0SPrrhPhNe
	 c9DtqFVcA2Fx96vWqNNpDyLf0i/MGCr+yiJkRRqMUm1i/nWq0t+nvuWiZeJ0NoYpUa
	 1ohbi7YnHBnMw==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_asrc_m2m: select CONFIG_DMA_SHARED_BUFFER
Date: Wed, 22 Jan 2025 07:53:17 +0100
Message-Id: <20250122065330.1423248-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Randconfig builds without dmabuf result in this link error from
the fasl-asrc driver:

ERROR: modpost: "dma_buf_put" [sound/core/snd-compress.ko] undefined!
ERROR: modpost: "dma_buf_export" [sound/soc/fsl/snd-soc-fsl-asrc.ko] undefined!

Add the missing 'select' statement.

Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/fsl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index e5fbf5305ea2..c4cf3cff58de 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -6,6 +6,7 @@ comment "Common SoC Audio options for Freescale CPUs:"
 config SND_SOC_FSL_ASRC
 	tristate "Asynchronous Sample Rate Converter (ASRC) module support"
 	depends on HAS_DMA
+	select DMA_SHARED_BUFFER
 	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select SND_COMPRESS_ACCEL
-- 
2.39.5

