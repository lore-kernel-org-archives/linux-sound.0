Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB8F382F13
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 20:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773518740; cv=none; b=mUnRJa9Tjs+Bjo220/gJtFNiZgh0i+obkUPQBwgTascC6Dmyv3hMBy7D6V45DkSL7YvOSTgOTpucPs7jjPcu5oJCoZWHMMphhEn17/pO6iu204leSNKJZ/oZaVw+29J6s4D3n4aBfk9MsCP5r1INfO3PN97xK+9J4+raG3YAYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773518740; c=relaxed/simple;
	bh=l1SmVyGi6e4F1kbXGyN75AtOvihKeX03EEKs/Zv+nh4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QczemNctEAVnX4LqUyTUteRyz18S0PJD5aBG6mHCfAbKNvg96KrEY0NqBGWjFwpIzhDUQQyBZHQx7viXlGvyKFqDJCO8xpO+Mww7Fq01b6iRz3yOrvDRBwAONAQ/a/iWhsiTItsLiph7mDJMUUd3vrm4wrKckKLlp8naRvXRirY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rKfA2jlT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rKfA2jlT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3B8C116C6;
	Sat, 14 Mar 2026 20:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773518740;
	bh=l1SmVyGi6e4F1kbXGyN75AtOvihKeX03EEKs/Zv+nh4=;
	h=From:Subject:Date:To:Cc:From;
	b=rKfA2jlT9IYUAGZsFfEfW3dMukHm5160JzLO0KqRsTMP4S9b+XamwiVQxa3b2cP++
	 rN1816NsahkZlnVhigE5A2gw2dcJ34jzIp/ZJdYMXVxM9s/meaO0ywF54Ygl/VB1Vz
	 NIq1Qfzbj1JaTSKZcPuQ2Y1sbuF1upk0KFwsTGPf/063orzshb8krM8Qi66Fm/3R3R
	 tRNWi6EApFi5rEHitVndag0Ia6SxOYs1wu33cvebYEowiPsdgk7AoX/376j9rakr2m
	 X1RupG9a0ApG0sGuzNCcN1PYh45k29nkzo11+gKLIUFW9bXlKACVgreueJPZiGmqbG
	 X3D3NqqKJxmSw==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/5] ASoC: amd: Move to GPIO descriptors
Date: Sat, 14 Mar 2026 21:05:35 +0100
Message-Id: <20260314-asoc-amd-v1-0-9a5de983ee4d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MT3cTi/GTdxNwUXTPDJEtDgyQTM0NDAyWg8oKi1LTMCrBR0bG1tQB
 zMVgtWgAAAA==
X-Change-ID: 20260314-asoc-amd-61b910b46110
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

After a quick look and test-compile I can determine that
all of these drivers include <linux/gpio.h> for no reason
whatsoever, so fixing it is low hanging fruit.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (5):
      AoC: amd: acp-da7291-max98357a: Drop unused include
      ASoC: amd: acp-es8336: Drop unused include
      ASoC: amd: acp-rt5645: Drop unused include
      ASoC: amd: acp3x-es83x: Drop unused include
      ASoC: amd: acp3x-rt5682-max9836: Drop unused include

 sound/soc/amd/acp-da7219-max98357a.c          | 1 -
 sound/soc/amd/acp-es8336.c                    | 1 -
 sound/soc/amd/acp-rt5645.c                    | 1 -
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 1 -
 sound/soc/amd/acp3x-rt5682-max9836.c          | 1 -
 5 files changed, 5 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260314-asoc-amd-61b910b46110

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

