Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36762E8B83
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045082; cv=none; b=QQwM/dDCEg5dwqVVMK+18PKWfgoevvqVFrjcAwoah9NbwaGFO/7DJzxK+y8ZT+1VIWqk9x/ee9YwBUSfBlJmTOXfh4RwMhJ7b+8Tz0ZKYeGRiRJRTsxbEjG2btHP6mlBgrWMFg8pXT/Q4P+//ZlkDtlfRNVVl1IQcHR1jcvSn+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045082; c=relaxed/simple;
	bh=QU6aWdGrPrs9sm29TPY3TTfbdgnUIvDUFW283zBRxI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QMTwA7iYviOHoIBmel3zA/I0qDJI9w805xFpmFgcLqD2egT4TbiKzBjqONUMdMlceHlI5UDvpNCLpKMo0RC25JDLSXce1sKN/pV+fx4A4IsF68C/Ih1wKsZ+N0ZyRxigsLrZEl56TJH7PzjZ5HYEcdRhonO7pP3EDErgpTFFFxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpo4a6xu; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpo4a6xu"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb750so2136471a91.1
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045080; x=1789649880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4NZ9nNqE+pb8sFgTxYUMCE97tLV2sG+CG+J95kQTKcM=;
        b=jpo4a6xuGRjX/OPY1hPWy5SI9OoPFfJFzUufWecuNV/9Z5uZC75ns6mf+zAxL3EBVv
         78paC6OjCZu9pqOhRf8JWSMJCEPfnSOBWXFzANblQypKveJStKoolrpcMEBusvg93aqH
         iFbLlRv9da5SWck0UnasmG+DkWYGom1Dv1DTxvYfJtnkswDiyCrGU9wPROEfQct/y8mw
         uBIfy3czjn0yXEUzzF2UOxAjJeRcHJMOTGHfXt5r5Ye9rvUvWT1+JcJQvrH9RxC3/Hh0
         KtuVSYTXaSlMT8kuFnEeYoAyqJAsL+nWmBqm0Pmiy0kRgusXcT48A7eWL1OnyN1AgRQa
         PpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045080; x=1789649880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NZ9nNqE+pb8sFgTxYUMCE97tLV2sG+CG+J95kQTKcM=;
        b=Fc3p2GCEiWfICNt0DwHoq1FZsPRCR1VDke6V976FUKGehrXojXw0quF2TfO3mMpT7Y
         yVqlFWDu8Kaa4IknecB8kfJv2MgZWNQ1rJhSHyl9fPTuc0ciCfRwUgo02asAf8NjsuD2
         E2Hn3f6vWiUja5heAHnepGh0m/As8Q71KP6Y7/R6npW6mkgIvrz75iS3Te/STVHbsM0M
         xUbwtf/cjAEU2E9a7lcY6MOc0MEEK6R9X2u4CQQxLuSf1DoKQ6DIPnZHjmIt6OXUecYA
         lCfdhe8AdBZ0UnP01P5FJ5y81EK1tTRN3AuHv/DShSK7Y1dbZHZm2eUlO6LMrfz5ogRm
         VWkA==
X-Forwarded-Encrypted: i=1; AKwUvBxvEgwgh1u5Yxm0w3uFQH56WZbWPj3k4iLFiT33noV6m6axjEzzjE/Gs5VqISD6cZL0EtCIfV4CR/1JXQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lJlgdKWd1qyGVNvxGBp2VxCd4kH0Mh/HZogW4hXdA5SlpUcimj
	fl4ohgu1jjbOAZgO8tNYvL9+tDNupwp+mbq78sl4q5uEIo0By85dC0kb
X-Gm-Gg: AYBFou2kC2tVvq+vJqO/ymZeQw4a9UUqMLQY/h6+cRn4qXoHRJs0+jeWzR0cjOMohrI
	JnhywnU7n0ZijWUzcJZjG77fTX5B3vIpa+b+3+JPfuXb/kSya6+SJzdAZAK7VQ4XfUBGTgQhXAw
	53LhDw/blBhqkVKtx8lkxMVyf5VHnNmz3lJe1kl+Q2+8/kzGPT84Mnje5zrKDwYh6fQzgKkI5Fo
	ze3JruM0Y6kpkAq83HVmJpu4bpaMqUXsSwcJAa+doRmpO2+JDd4qp8ZRpyJuXgnNh8YxyVdPVMI
	S+4G0tYgwpHYvgvg/bNOVR40GXtz4DXHHjo/2xrX3VoBI9E1Z9/8lQ3Sa/f4AemjEMc6SYl+d10
	Hfk8k1OLUA+qyAI8zfnBKXQXqdcySRBMRI1BanIFxxnShueJBp7UPeMY4/AOBIT7P+wDxT/1dUz
	ZnYAyURp2KETRwUz14Q0f1Pc5RlUd6/d1qAQMgtNBtyc/Izz+ymDuEJ4SNenJKV9eIczr0QDudS
	vEpmqd8WRbM0w4OQJtVPrZ9vxKD7lU6qrjYMDfP4axFd3Tl7J2Ll0xlJfvvfVkEtYlTSmfE4wlA
	jpDOIvCXn9AAS/o=
X-Received: by 2002:a17:90b:1d45:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-39bac1d89b4mr18062671a91.9.1789045080229;
        Thu, 10 Sep 2026 05:58:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:57:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/13] ASoC: mediatek: mt8189: Improve error handling
Date: Thu, 10 Sep 2026 19:57:29 +0700
Message-ID: <20260910125742.150902-1-phucduc.bui@gmail.com>
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

This series addresses part of the error handling in the MT8189 AFE driver.

It propagates errors from clock operations and runtime resume, validates
clock parameters, and removes redundant error messages.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (13):
  ASoC: mediatek: mt8189: Return error for missing regmap
  ASoC: mediatek: mt8189: Propagate APLL enable errors
  ASoC: mediatek: mt8189: Propagate MCK enable errors
  ASoC: mediatek: mt8189: Validate MCK ID
  ASoC: mediatek: mt8189: Propagate reg_rw clock errors
  ASoC: mediatek: mt8189: Use dev_err_probe() for clock errors
  ASoC: mediatek: mt8189: Propagate runtime resume errors
  ASoC: mediatek: mt8189: Remove redundant error message
  ASoC: mediatek: mt8189: Propagate APLL errors
  ASoC: mediatek: mt8189: Propagate MCLK errors
  ASoC: mediatek: mt8189: Validate sysclk frequency
  ASoC: mediatek: mt8189: Propagate TDM clock errors
  ASoC: mediatek: mt8189: Validate TDM MCLK frequency

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 136 +++++++++++++++------
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c |  49 +++++---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c |  17 ++-
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c |  17 ++-
 4 files changed, 155 insertions(+), 64 deletions(-)

-- 
2.43.0

