Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5E51DE3D2;
	Mon, 28 Oct 2024 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130221; cv=none; b=nVhQ1DktEQ8eeZeYPHInoz9JBQ0n1Puk3ECa2Rb1yKvA+ISP/1Icl+f9SVb+2ynLuwj5BxXI5yUJYXKKOpECLD5LZrMkBfYBlZZGx+/UBtiIEZb7KkXl42Zh4J20pYlDKftmoT/DpygfdyXyN6bLsM9vo5iIFFbR58Jue5is0pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130221; c=relaxed/simple;
	bh=9yAAeMLN9OIod/3f3TPfdB/RXfFmIQlQOi6c1h8WWQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lQO9QtSY51fvJ86SH3Sx7LNG518f2Zc6DbauXOohssBGZgmp1u/YE/8gtsbHt+542ed8DPpr/NBr+5jQDoAk464ZxOH2bFLGoLP/SQBwI9NimcAo6dTbM8UQTns6pQ80xLjk7ttA7D6vghfMcKRbPXGD9Zy6PRJsYR9x/U+W0+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZQ2ZYiK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZQ2ZYiK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE9C1C4CEE4;
	Mon, 28 Oct 2024 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730130220;
	bh=9yAAeMLN9OIod/3f3TPfdB/RXfFmIQlQOi6c1h8WWQw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OZQ2ZYiKYuv5AZLYMtGHfWDODH5eGISqQEoCKEGj1jpchoO14hdK/vq+HBvCYcaF/
	 hc1azJA48gPjXOpw0l6Qduo+dgwlmIdqlvErlYt7egmuHkWk1aqDlPpHIvK/uHtcgJ
	 J6OklcWMzrMquih/ZKz9XxXlcu90UJv1VJZpNGw71j1lQ7MzC9kjw0IG0irFAsy4HY
	 nQR0RzH/S0BzRRE58Y+dGqeWY/wLL7fTEgVCpgQEgirMWWa3yvaEvOFYSgDeAuz4B3
	 X6tvPXdvESA/T/oEk2g+uf/NdcAGfxZHIRXnqMfPLzuHJrC1FETP14UKOzoxp3MfzH
	 JFtZWrNsDE1gg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC826D33998;
	Mon, 28 Oct 2024 15:43:40 +0000 (UTC)
From: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
Date: Mon, 28 Oct 2024 16:43:38 +0100
Subject: [PATCH v2 1/4] ASoC: codecs: adau1373: add some kconfig text
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-adau1373-shutdown-v2-1-647f56bbd182@analog.com>
References: <20241028-adau1373-shutdown-v2-0-647f56bbd182@analog.com>
In-Reply-To: <20241028-adau1373-shutdown-v2-0-647f56bbd182@analog.com>
To: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730130219; l=634;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=N9cgwu1zwzbWD0Fw9Jji5tH1Q286lBcXZ7unQPQVoMc=;
 b=bZajh8COAzo3ueYiEtpERuzBybdCOmSlIp7naGoorXVvjZd5C+Z9EVkceVvWEnCoBCxzxY6qN
 gJc9NwNPJasCuRral1nBov4XDCHfkC/b6/3y99gxIDYXKOwezGuTFkG
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: Nuno Sa <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sa <nuno.sa@analog.com>

Add some text to 'tristate' so that we can actually enable the driver
when using things like menuconfig.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6a6125e94d2d..72643907cef7 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -464,7 +464,7 @@ config SND_SOC_ADAU1372_SPI
 	select REGMAP_SPI
 
 config SND_SOC_ADAU1373
-	tristate
+	tristate "Analog Devices ADAU1373 CODEC"
 	depends on I2C
 	select SND_SOC_ADAU_UTILS
 

-- 
2.47.0


