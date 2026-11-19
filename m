Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108270;
	b=TqRFBIFeS0LyXFXuiT1fgde2VkQ3vlvLvCbQ4rdcNRhWOgNNiyj+KiQxJ6YBWLWdIwrE
	 ZfAe2JnTlHtAHD+fIbZ81FxUnk0fEGntxq2v8AvfxQn8UfY8Doj5oRsWsQRUfwjYdUzji
	 VD1U80MUHbKZgo/8TpmsYQKp0Z2tJCNxMq7D0SEdfXd/cbhLjYlHaVUljJZe1s+dG7Biu
	 sRA9Fa/+2QswJUEnbcnyqCggEMuPPL0WXT19ygzdfM9ZdNcF/C+jrALceNyUOu4lUqBSC
	 6VmgdRRqjbX6ktCzVwmwb3xFk8o3FSv+ccR94nxbtwLdB5lQOXRCbaWePwfzq9TNwUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=4VFgIkgO0QW6Uz1EsOOcOGBTY682MO/rz1J67OmLejE=;
	b=ZK7IjBq0+UxT75wJtRtXu78mnizU5PLWwrySoRVSbFQTXfRO1zCT0wZJ2I/UD/gdRPnC
	 ru3xMRsY82iQFY33n1jq+bBNN7roRR/XVVi66Uo7OCS70FNsMxNYx7iKoeARby4tLgetT
	 X4GMZWhdvrtvFHwE6ftvk3S78j8pqIrUFZsvL6qoHEE4w8JlBqSL7woMo99B0nZgWvxQe
	 0F+ayu6F6zLXMPo5/+XEjDMkEKofXeibX7Zn0XC9ABKelLpNZ68EkNMppwFGj+ctAry+G
	 23TmJYmpYnSbsGobqaSGyAKZrFT/g68GGh0CObtYiaJAGUCmVvqHOo8+vTLAgTAb+Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="lowx/aVS";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A8F606B416
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 17:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A8F606B416
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lowx/aVS
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3047800eec.1
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 09:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108269; x=1795713069; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VFgIkgO0QW6Uz1EsOOcOGBTY682MO/rz1J67OmLejE=;
        b=lowx/aVSQykwMLqnjGNj/79iso4pkAP7rg6f/3wWOIiz4v73UtR1RevRcayxqm43fk
         g+EpKB5gYdfYPhU8kCjR5q3eRGuv5YMT9f70uiF6qsQE866nsBSmZA6smrA4YKgjQ6NR
         pIZZq5pgToJmHSYAk/MzjJVM1kEA3QFK8WgLvGqwRqn/7e8aCvdHZFa55x+ap5j1iqJ5
         PzqLhIAR+3/u2dmF+qN8lvs8aXvngtNQ+LvNDh0ymN7VqRJfC8m3M2mcwi+ePrutWcwQ
         MlX31SDhoM/jNUIzcO1am/lknm0WRcMJEEs6225bVWsKFR1fMRd4g/GOhU4k7zf9+KCv
         djJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108269; x=1795713069;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VFgIkgO0QW6Uz1EsOOcOGBTY682MO/rz1J67OmLejE=;
        b=bPp4aKCJrDuhAxiGWKMqLzYcqWOEyh3ZnlZXd0luLRyyU4ftqO4OWDwL/s+vYoZN6O
         co15MlyDnmsjG8I78T7pkom/taFgAmJ7+2fGiQnQ3fn/eGY4EEzi3x7PRBy5UkAUbZfw
         hjM0ujHT8GRW3JCumyGTZz6L0H9dG/NLdiRpVkxejVbHCtJ1JCd6x6m8vq1H1VU/IxKx
         HTRqWWwtMC7pIQineBgz7Ld0nO+wyB19qKGV5P4dFh/yPb5qIQJxUOs5343g7kbh96Vt
         u5aBkEH3JudQUB6i6WqsP9FHMXbdQa2RpnC5XwRVZtl6Je9Yr0x/jHbZK/uVmGIWrBdt
         axig==
X-Gm-Message-State: APuU4Z+TkSEBZ2vsDD8WIvfITj53O24pKyzZwlCD0P4OWI/rxOZpyVIH
	uaSAptLUxVOKGgPReEZqTBC9dmSn8MfZQiKp7Dz4mIWZg0vd7Fg1c7ZQYYA7T2/omnYTsjbtjgs
	2celXzBIj6w==
X-Received: from dyru27.prod.google.com ([2002:a05:7300:4f9b:b0:36a:120e:b9a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:fc19:b0:384:b2cb:5f76
 with SMTP id 5a478bee46e88-384b2cb60ddmr1689970eec.23.1795108268800; Thu, 19
 Nov 2026 09:11:08 -0800 (PST)
Date: Thu, 19 Nov 2026 09:11:05 -0800
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171105.1538194-1-irogers@google.com>
Subject: [PATCH] ASoC: tas2781: Initialize subblk_offset in tasdevice_process_block()
From: Ian Rogers <irogers@google.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

When tasdevice_load_block_kernel() processes a per-channel firmware
block (dev_idx != 0) for an amplifier channel whose is_loading flag is
false, tasdevice_process_block() skips the channel via continue and
returns an uninitialized stack variable subblk_offset, which the
caller checks for negative error and adds to the firmware buffer
offset.

Initialize subblk_offset to 0.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building sound/soc/codecs/tas2781-fmwlib.o with
LLVM=1 W=1 (-Werror) and -Wconditional-uninitialized; not
runtime-tested on TAS2781 hardware.

Fixes: 915f5eadebd2 ("ASoC: tas2781: firmware lib")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/codecs/tas2781-fmwlib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index e6429b4c8dc5..a5e6734723ab 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -897,7 +897,7 @@ static int tasdevice_process_block(void *context, unsigned char *data,
 	unsigned char dev_idx, int sublocksize)
 {
 	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *)context;
-	int subblk_offset, chn, chnend, rc;
+	int subblk_offset = 0, chn, chnend, rc;
 	unsigned char subblk_typ = data[1];
 	int blktyp = dev_idx & 0xC0;
 	int idx = dev_idx & 0x3F;
-- 
2.56.1.708.g77570a6a1d-goog

