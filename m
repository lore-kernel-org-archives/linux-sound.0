Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C8547CA81
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198195; cv=none; b=elXejo/PkaQUhYAz9CDRj1UhGCTjmOkWt8f9yA/6XiBOVuXHWgHaXJYQvW7XvW9d4tiFXDBNUJE+NJJOG2Fhji0MT1DyVuM3Qyive2ACqaO+Z3un6jbKH1kRowWB3thtBKwAnCLOAwCK2FYy/pZasGRYJnXaZZm/nvs8h5aP1RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198195; c=relaxed/simple;
	bh=srpOY/YeSVH9cpBDRvuy4jhWcatwqPlft5VzYl8wWUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UadlI99t5Gza3tsfGwRhmyd8cuDHJhMJOvvUIOTJGiwirwAzR+sZfx59+4ZcHt6MM4WacgPW8gLtn6KmM395Nf4uVTFCwZwqmls4nrdULDLLF5Nc4Tkvb1qHGCfUlAVr6JVCuNQ5Wt0IlOIIRGtYkGcGAUneElXDt8EiBfCyp+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFrLtC8h; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFrLtC8h"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so253052a12.1
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 04:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198194; x=1791802994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SH0Znh1ZN4Qa2aqMJURXlEwFyEPWYynPhvibLKZzQZk=;
        b=AFrLtC8h+FPdWNXIW7dN2tOwwjvGuLNFFMCOm+BX1Di5VzydOhuw1MuprnwG7mrSWA
         GBtoAdu8lwc6ab8/gSk5GyB2mfyST8dVyvREtbaIadQSJnh1ZaMI0sbDtChVpncxMrp5
         FIAA53QOZreMGDKOPf0UJ3hxNpumiFKFnpPKA42al2crcVgdbcQ0ER9lUb33KwIvFOjd
         lPWllHWRvi3xtuOfv+EAuFxFnQV6gE7ayS2L6acwCjDmiNR9rO92EvsIJcpoRjDP75z/
         1bDu3ZKkXCeS/5ntS8s5M8IT8boMG0jWy6nTrBE6GWi6yC9viDc6v8YfveAXDXxrI4l5
         Jrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198194; x=1791802994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SH0Znh1ZN4Qa2aqMJURXlEwFyEPWYynPhvibLKZzQZk=;
        b=WBxoxZqbJ6h9l8KDXnYS7LEVqIQFyqFvkfyOEr6VRotHmttbcD8UQWFPLgi9omRa9Q
         Qn9jy8JKwZzQKhO9wPstKWZD0GOgfKjz5LSlEAAoErqMfqj7ytud+UMXagRAaOEukAPX
         LM/9txz8aE7hMyZmKYahgJUFlYrnK0KwIhMRv9HvLk/bXILW52zIoIGOS2YBLhk8MlH4
         NGWJ2IObxbpqppvkXN5TD9N6f4cPMonRXi/X/AXrG1BxsbdcTmEzXr86FHuH1kjDF1Gc
         7Tj1KMvpzey865I0XEESbZSFgY5fZd09yNrdYpvASvKrg7Ll5DqyD8cPN/n9EtowDO+m
         vzag==
X-Forwarded-Encrypted: i=1; AKwUvBy2k+3dKizrnRSAnmwOIX5Q814SGDbeQKhbHOH4v9UeXlZ2XckDi732RJYFGy9k+fEsWtJ40++Hinh/kg==@vger.kernel.org
X-Gm-Message-State: AFuF++k5ikoB8TjEftJFT73cpMu+l3C8D6Y6XEhvQVAMIOOmMa2ylMoV
	ZjS1BZGXh3qdSfFUbpg+xyNNqEclCtQOgkRyaDbOstJmUG3bpuIwlYed
X-Gm-Gg: AYBFou3qhV/Zcy0bg/NNq3HDVH1kCO1FYGV76njtG7AjetdsOVot2AxMyK7gVlTnLnG
	fq3dljN8O6ucPW/KyzETUPcvIUFiAvc/AU5hm5yBD5Ec+bJ8xdF0EO+6qJ1aA9cyr5/jr7o3txc
	7MEXYJ1Kt0vk0xqQrv0KciFkRLIJamEg7ukt6hOtoA+hepr+wzYJWBkUhSZiQzJ2OEyz4tOrbhD
	Vc4unOy+JZSLurF1RmlG09m2CSN0NQOhlRqo4lXj7xzVCMfBnYiIXg0htq2p+ftIoibbZdaNok8
	XwIE5I0YUPmWaWJe6SETWEQ1Bxyup+xSKErT/yRIgEexANwc9KYpb5V51iadHSjOKZh3AQ1KAWE
	StzGpfJIDqUNWq2XOkzo5B4787KzBiNcI3eNbLIw/+Hqy1VdgfU6814+vCii3R4atLt0rJ7dTzx
	EJ3DkYbRVbmN5On6gtoHmZnZVd/5/8f37Er/T/++TaaSlXTlSYnLffpgdO8GPxFxd5zznz2lTQh
	u8RS+HbNEW+KJTAY92PUi6Rw17RQI+1/6+mXgkOfj+thrm1XaeztACkCP2mGyC+9Sx75vnxQ+lL
	1L5YfLo02nFk1w==
X-Received: by 2002:a05:6a21:70cb:b0:3dd:a9a9:3967 with SMTP id adf61e73a8af0-3deacd7c65emr12182287637.43.1791198193691;
        Mon, 05 Oct 2026 04:03:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:13 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/14] ASoC: mediatek: mt8195: Fix clock error handling
Date: Mon,  5 Oct 2026 18:02:43 +0700
Message-ID: <20261005110257.50145-1-phucduc.bui@gmail.com>
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

This series improves error handling in the MT8195 ASoC driver,
mainly by checking and propagating errors from clock operations.

Changes in v2:
 - Check for negative return from mtk_afe_fe_startup().

Compile-tested only.

Best regards,
Phuc

bui duc phuc (14):
  ASoC: mediatek: mt8195: Fix tuner clock error handling
  ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
  ASoC: mediatek: mt8195: Fix register access clock error handling
  ASoC: mediatek: mt8195: Fix timing system clock error handling
  ASoC: mediatek: mt8195: Fix paired memif clock error handling
  ASoC: mediatek: mt8195: Fix FE startup error handling
  ASoC: mediatek: mt8195: Fix runtime resume error handling
  ASoC: mediatek: mt8195: Remove redundant error message
  ASoC: mediatek: mt8195: Propagate IRQ lookup errors
  ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
  ASoC: mediatek: mt8195: Fix ETDM startup error handling
  ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
  ASoC: mediatek: mt8195: Fix ETDM probe error handling
  ASoC: mediatek: mt8195: Fix clock parent error handling

 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  |  69 +++++++++----
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c  | 102 ++++++++++++++------
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c |   3 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c |  99 ++++++++++++++-----
 4 files changed, 198 insertions(+), 75 deletions(-)

-- 
2.43.0

