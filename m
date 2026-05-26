Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A26D3C5827;
	Tue, 26 May 2026 21:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779832410; cv=none; b=dWahElMr/heF4zPuX2Qn7/1zbEvNRg6dHKcGUm52RUNgk+CEjRbqbPGeQ/LqocE+iqQCv4vEz9u/jfhWOx+71LTfkb/aGTDnvj9JWMAnqTSpgdNfrehMfWHx7ow78y3wkMLdgXsYFrZxF+nyG3eMWXabKdVjNF990C0Cwz7FUnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779832410; c=relaxed/simple;
	bh=Z7i8lViSv6JJ1Wb2q4peZ500jr1WqhEI/irNtwYd0yM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KLwrmQoXoy+uMYKijLOs24wB6K/dVKb+IjJc5pVcvopmZx07iz3LGib0LEKh1FJge1tDro5TFBQsZ2nRq5Mr3T4qaMG8+YEVQU2HXL0vMxri+dX8oMUF12mHfp6DlF4NsfNbcUDsZWlyfeYCohkDaDnbmyxxdcglU5SCmvITTuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=is2LqJIS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="is2LqJIS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BD71F00A3C;
	Tue, 26 May 2026 21:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779832408;
	bh=j+WRqdW0opK2mIMw+DrlyTkq0so/kTCQfVkQU6QUuOI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=is2LqJISc+4Rh2s0Be7yCQ4BNwKjJlifFnBbxDI0X1k2FUNg1F3XvGdIo/altXj8Y
	 KeR+zCwt499P/2vZA59GLkop8quq3c0aGDQBm4XfaX0TZRXuexSudBskmbZkLgL4fl
	 t9yphbxLhGF3RbGwUp5ngSeipqgn/59ist3gVn2ailp+TshkCXMPIT066UgoevP3zC
	 1YxAtNfNE/drqs7ikDWI5rxe+GrZd7TX41ZbnTR5XSDfnEFMfOhLNt7MOyOZUq/p6K
	 1lDuN3uGR0/9dLmdBdsK0D7WSXxsj+VcN90tl5h+YEonhVGi//++D67WHjEalGD6s8
	 7Ei2IcOaG8wwQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 26 May 2026 14:53:12 -0700
Subject: [PATCH 1/3] ASoC: SDCA: Make CONFIG_SND_SOC_SDCA a user selectable
 symbol
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-es9356-dep-fixes-v1-1-39ac16f43d54@kernel.org>
References: <20260526-es9356-dep-fixes-v1-0-39ac16f43d54@kernel.org>
In-Reply-To: <20260526-es9356-dep-fixes-v1-0-39ac16f43d54@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Maciej Strozek <mstrozek@opensource.cirrus.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Zhang Yi <zhangyi@everest-semi.com>, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1168; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Z7i8lViSv6JJ1Wb2q4peZ500jr1WqhEI/irNtwYd0yM=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFliYkHNk1p3PVl/ZWaHExP3arGI/Pez5i5Jf7zX47g1y
 zSP7AchHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiWZYM/xR/p9+q6D7cfCzY
 S8d/G4s3z8PbC+sN774T3yKUGm36z5mR4YeleIq7ndSTr/NXipiv5chMZGdof7w2w9eCbZJW9fK
 Z7AA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Currently, CONFIG_SND_SOC_SDCA is a hidden Kconfig symbol, so it must be
selected by a user selectable symbol to be enabled. However, it may not
be possible for configurations to select this symbol without running
into a recursive dependency issue:

  error: recursive dependency detected!
          symbol SOUNDWIRE depends on SND_SOC_SDCA_OPTIONAL
          symbol SND_SOC_SDCA_OPTIONAL default value contains SND_SOC_SDCA
          symbol SND_SOC_SDCA is selected by SND_SOC_ES9356
          symbol SND_SOC_ES9356 depends on SOUNDWIRE

Turn CONFIG_SND_SOC_SDCA into a user selectable symbol so that drivers
can depend on it and allow the user to enable it explicitly.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/sdca/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sdca/Kconfig b/sound/soc/sdca/Kconfig
index 87ab2895096c..4c0dcb9ff3b9 100644
--- a/sound/soc/sdca/Kconfig
+++ b/sound/soc/sdca/Kconfig
@@ -2,7 +2,7 @@
 menu "SoundWire (SDCA)"
 
 config SND_SOC_SDCA
-	tristate
+	tristate "SDCA core support"
 	depends on ACPI
 	select AUXILIARY_BUS
 	help

-- 
2.54.0

