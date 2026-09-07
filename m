Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A808A438021
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 12:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782618; cv=none; b=tK2N7mcK3j+vOsdZhQjZ4IGW93lZfvemNUq/MEKk/3nN9pMzUcOHLFtf3EllOo7D0ieAPaRwhLI+YqBLUMTs2YO6EXnswNw87jv5ztYmwAVchWTo9jR4xAJKb7sWOOWP8dKBF2/nW9LEen8y+w9iZBLqYlBLhCOa77bOojryvB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782618; c=relaxed/simple;
	bh=MOQwV5fgdf+8j7ZOVMqEoztvTTu2JKxSmB9ceKguCDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XZcvvnqn4bGUfByJaU8PuenOFtJRgw+0VvP9N/uqVOieAHQvTHz2aXIvk9L6U/bfQYadzrPJGgdnpWlRQsFaPUeMq57E44MHotvGSkcOf1fY13NJnac37h+cRmYx4tw/1rg8MzwMPTtxLE9PEwFkzW5drzG+92Fg2uxF6xJuh6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1DqIKab; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1DqIKab"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d6f9e2f681so37828295ad.3
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 05:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782617; x=1789387417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1DjLmqmU48ErFE5Dn+s01Gf2tFCVAmNdh86WaQ5BH/U=;
        b=J1DqIKabLDbxFZlfF7jOfXzX3Wz9CFcXOuhzQIqoNuCOgGyYIRkfcCOS8s8M3771Xu
         SbMlJBDnkkWdXmgOpUjSMgwpS2CFyx3mDDBTovs+mWvvyNGjoMeov8oWh9GpktKLfndf
         xEpCBmZKAJ5jNL2vsRMTfpoLJ9jKalS8xWCLa/T0/e8JbEzWDg+9wIaAWWADW5T0soH3
         JPVACLKrjpF5UygeHnPIXufmLeYUKrsAVG/lde80LuKXlbT8g3NDVuSyDwtrd1m6PsWc
         zogQJbO9i0zsGMomVK9gWqnd7IzsvL4kyaPudpvmG9CZTZrmJfVkW0xX2MDDgQZdDp+L
         av8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782617; x=1789387417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1DjLmqmU48ErFE5Dn+s01Gf2tFCVAmNdh86WaQ5BH/U=;
        b=LCqpmcYf7Fisgjw9TpxVP9Nnk+SgBLpwgzSRRisnIU37b/8T1CGZiyOy9Soxxn8yR1
         LbA/tVenXG+l/SV9YqCEdPZTgDKNNFsJ0FXWb5Cod03FPXjrLJpxpc2WbHpGGKdSYAgq
         +OlK4kn3uAnc+1em6rJ43vd4FXNnKYb0spAlHzVn/57zy7CEFLhJ9FttlDkI3t2AQ1lT
         ts91e+oLC95kmANtQl4HzewWXvs1UaSMvje7JdNbYtVRqIFXMBRvzAtSn+Vl1hndPvp6
         EIfU3DxN+ZMR7RRape5G3NVzQ2uss++71yeOKr0Pn6Bu3hbk0K81MDJbcSMUJFpK4OC5
         /gKA==
X-Forwarded-Encrypted: i=1; AKwUvBxXTtiegz2tzgIxHVgban4qVDVAlCOIbKmfJqeJEUUs87egh/SfE+caUnsL6bCYU4TXt6OedaVEcdGR1Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lgH5ZzZiajp9XECEwLaFhRvQRYIr05dCZYd7iqQqQWgpCvS72s
	3ghYbCmM2JR7T1akMtl6zg/6KlUokdzRiOCw6Pi3cyx8Z6u00L0fg/F6
X-Gm-Gg: AYBFou3aKxc9eN45ZApRcYIVUVjaTeMYHl2IkB+s6jIU8WmbOkwdvFlSBUNxIsPZR5v
	Q1BDJUR7Vuj3vS0C8VBOLxgEfSl/DUXq8MarPfZJ+5m19ZYvBHNUePjDjeUF50CoCdViJg12MOn
	dnvhqLW/nMoPmRLc+O53bGHPLFsGIFGPCo+6lDHTmxdtORUMwT3WrwHK9HimN3UoTChqgh+F7p5
	cSOMWRu1f7ZxYlbRuyeIqjiLWFVCMWsHyJqie3UiiNenokHWs3iRH0oznCxu06xM5Ov3VcBwrlx
	rl/1CoE3RJoODtyjgGPJOmYWy8vKdGPP6MAzq3s69fEQY/0E7aE45/BTGQqx1SYPdBGVpils96W
	z3WvuepEynz0dLzo8BLY/0jKFGMvzedelwg2S5WDma3eABdJEH/cF4W0w3hC7YzFexkggHRnJsV
	5IlxFnE0mhauD4f7tHpNMHgER+7+L7MlQ8sPBHfQ2EMO8DKhyz+NNOlFGJIqR8wdeOwB8iUbS+p
	H9CvSm9LHd0pkYBDdFYCAJ3wQVIjmKI4EPozI93SMHytwMZxq2D46domGR2BBMbDcsaUdYbFP9n
	647E
X-Received: by 2002:a17:903:19d0:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2db126346b3mr282743715ad.19.1788782616991;
        Mon, 07 Sep 2026 05:03:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:03:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/7] ASoC: mediatek: mt8188: Improve error handling
Date: Mon,  7 Sep 2026 19:03:03 +0700
Message-ID: <20260907120310.135693-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves error handling in several parts of the MT8188 AFE
driver.
Propagate errors from clock, regmap, and runtime resume operations,
remove redundant probe error messages, and fix clock cleanup on
registration failure.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (7):
  ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate clock initialization
    errors
  ASoC: mediatek: mt8188: mt8188-afe-clk: Handle tuner clock enable
    errors
  ASoC: mediatek: mt8188: mt8188-afe-clk: Propagate regmap update errors
  ASoC: mediatek: mt8188: mt8188-afe-clk: Handle clock enable errors
  ASoC: mediatek: mt8188: mt8188-afe-pcm: Handle runtime resume errors
  ASoC: mediatek: mt8188: mt8188-afe-pcm: Drop redundant probe error
    messages
  ASoC: mediatek: mt8188: fix clk leak on error in audsys_clk_register

 sound/soc/mediatek/mt8188/mt8188-afe-clk.c    | 115 +++++++++++++-----
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c    |  34 ++++--
 sound/soc/mediatek/mt8188/mt8188-audsys-clk.c |  12 +-
 3 files changed, 113 insertions(+), 48 deletions(-)

-- 
2.43.0

