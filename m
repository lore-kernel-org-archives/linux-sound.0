Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3D2346E5D
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 20:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773518784; cv=none; b=ffxTE3T4ChrQkIsXeginS6moD27Q3uAIHvgdH3XpnljUBX4N2XVg3vuHgaOEt7dtYGiWYi3+YHwnsVUo3qYYmlScfaQDIHclAFXaqyhZEqYio3R6qxk4PcLPxhnyRZju3RtFdHEtII8Zbu0sTh8D/6bv4ivFcPXd8cGTlH+i9AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773518784; c=relaxed/simple;
	bh=gga96APA4d4vPBtqeY2+hg8KE2T9YHQssrzwiUu+u1E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sPCbWqC0kNN8BqHdx96/NEmx1iyvddTZB97mEccCnZvXkedkVvKCAPvGzj8M81owLNiEWvTlIo305cGw5Mu/HrZBI14ZH8ey+D9X0jszxeQ88obwB4wEoX8VImTwmsFoOwg5PTFqEbcdjwSVgBDFE1Thcl+mMv9J0PmVII8IYCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkRB2r4m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkRB2r4m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409DAC116C6;
	Sat, 14 Mar 2026 20:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773518783;
	bh=gga96APA4d4vPBtqeY2+hg8KE2T9YHQssrzwiUu+u1E=;
	h=From:Subject:Date:To:Cc:From;
	b=TkRB2r4mk1hV3obZJE/RtuM2PFqD6dsQBIPlpLLs5Aivw7/RpoI+1mvbN1HmTtJZ9
	 29wnToDLh1M9TxA8tXQKBVSae+26eFXaSrMBOb31qVyzyO0FIYAmy7imungm+8okKa
	 vWRZ36oSKHbN4BxydM1B5pVKfMdSDmnSAMl44fWlZKUwGFDGXWtwjxyGDEfz5pW//j
	 Gm0uU/kFjraFto0Zk3p99ND5EAARtRr2YcdtxTd/VilLKVv/s5NzqEMuYzisNrDE7p
	 AiBg5M7SuzJXfTRHYZ6yvb9TNQjxiEbawI9PrYAsPWCujQMMRRxPJ2uotsRgtebeDc
	 rdvh/iwmDhGiA==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/5] ASoC: amd: Move to GPIO descriptors
Date: Sat, 14 Mar 2026 21:06:19 +0100
Message-Id: <20260314-asoc-amd-v1-0-31afed06e022@kernel.org>
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
      ASoC: amd: acp-da7291-max98357a: Drop unused include
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

