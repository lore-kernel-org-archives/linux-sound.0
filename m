Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD171A73B
	for <linux-sound@vger.kernel.org>; Wed, 29 Nov 2023 11:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6onjRbp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6CACC433C7;
	Wed, 29 Nov 2023 11:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701257533;
	bh=FoQpCy80/A7NqecYX8XoNLwYAiGxzFge1aoT7zCvJgk=;
	h=From:To:Cc:Subject:Date:From;
	b=g6onjRbp37be+UMRU4JvdY3eUKTCkvMRbNQdJISR5P0C0cHBFzvn45SqowYRO6O+W
	 zt+Ut32KRpAA9xRfATcxZGQjXmoq2Lsx2rUL4iI6Eun4Qio3/42KHgeBNxFnSHt3w/
	 6ckbFvzNL91Eg52WEdie6zUUlHkQhFuAtExVz7qVs41p4h0y8ZonUHbW/2aIw7kGyp
	 eY5LcYo9Y5wfIP2A4yCpJxdzmhqrOziZInD6mmXjr4W7NW1kVDhP4PFHQoEe60KFiJ
	 A/oJm1U3ygRPM8lKEBCisgKnn+LyUjMcOQjGihOxXcaRcP7S6I3idBNy08i8vpG55C
	 sl6cXQOXhcCHg==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_rpmsg: update Kconfig dependencies
Date: Wed, 29 Nov 2023 12:31:17 +0100
Message-Id: <20231129113204.2869356-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

SND_SOC_IMX_RPMSG gained a new dependency and gets selected by SND_SOC_FSL_RPMSG,
which as a result needs to have the same dependency, or produce a build failure
based on that:

WARNING: unmet direct dependencies detected for SND_SOC_IMX_RPMSG
  Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_IMX_SOC [=y] && RPMSG [=y] && OF [=y] && I2C [=n]
  Selected by [y]:
  - SND_SOC_FSL_RPMSG [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && COMMON_CLK [=y] && RPMSG [=y] && (SND_IMX_SOC [=y] || SND_IMX_SOC [=y]=n) && SND_IMX_SOC [=y]!=n
x86_64-linux-ld: sound/soc/fsl/imx-rpmsg.o: in function `imx_rpmsg_late_probe':
imx-rpmsg.c:(.text+0x11e): undefined reference to `i2c_find_device_by_fwnode'

Fixes: f83d38def6b1 ("ASoC: imx-rpmsg: SND_SOC_IMX_RPMSG should depend on OF and I2C")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/fsl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index acb518f7ae79..270726c134b3 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -121,6 +121,7 @@ config SND_SOC_FSL_UTILS
 config SND_SOC_FSL_RPMSG
 	tristate "NXP Audio Base On RPMSG support"
 	depends on COMMON_CLK
+	depends on OF && I2C
 	depends on RPMSG
 	depends on SND_IMX_SOC || SND_IMX_SOC = n
 	select SND_SOC_IMX_RPMSG if SND_IMX_SOC != n
-- 
2.39.2

