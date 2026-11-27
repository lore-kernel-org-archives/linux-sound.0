Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793566;
	b=wuTRZKv3Pyh4RSwAChnkItI2WJ1sTZ/pfosiVYzdGuIwKmlD3elWscPTaICsQv7RCQHj
	 YwEZf3OjLY2ppLji9CozbkZjxNZkTpEoUYwoer6Ouzqhs8lKzYYvi0Q8y68ZCLq3XGaOo
	 sfFnyz1/jJBwTwMtRN0T09kVdzJuo3dU0HHmfkCF9hSW809OATBtDLngbqy+XD22PWmK5
	 O5L0Lcb8hACdBG2y1wOxXOAPfGMFisBCYclXUCNGnEv+HWTK9gOCiLkge+5xGVkZSCsOS
	 8oth0YPKTkpoubIwLqhG7xCNsLLtY2q7yGRvLWFSP6wxq7bZUCJjVbHyk5bAX+OsSIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793566;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=2xSkHmgwcY/UBC1h6KghOKuKRKbFTAGv0DCM6/0KU/Q=;
	b=u0UX0uFCTFH7val6RRZcOAMEjN0wGAlx5epvvb3JvAvCSFQ7pxV8WDvBM72yKmxwd9iK
	 U3rj7+NWjOcK6QoMJDEDb7phRNIh+xZZY2ji5FwZTCTDI9lzEv5aQzavK0qP6QMB+HxcQ
	 zx4riG+P/yNc6sUpjbGO3jBw2J6ZC0rCfPHbDgLCW/W7auA+tueu4HwmxOSR9n8HYOa2f
	 CopoOveHk1lZ1yr2h0GYfLPvg45LFpO9YxfsIDebZ/Hfh73Lo0Hf7jAN+CR9xN8PloPrH
	 +XWHojuFpXJMtWuFOi6KKuGuVEfg6tGwaB2vSfJSC1hi6T8UxfSUTHkQ0IUZA6AU+bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hMw9Mmff;
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961CF606A32D;
	Fri, 27 Nov 2026 15:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 961CF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=hMw9Mmff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2x
	SkHmgwcY/UBC1h6KghOKuKRKbFTAGv0DCM6/0KU/Q=; b=hMw9MmffvoYK+85EWJ
	rgTbegGzzCKWXUqJ/BsR+0TwVnWua53vClugIW0dGs1pA5hgxMAMyvk6llibiE/Z
	aHtKDRycKzcDoqL76YzOnFF/nAN6RIaaZtmDlE+XVb76ifovaRmS+Ko1KxDAz/bZ
	7ocqXp3w/RVcWawP5I3+8BO2E=
Received: from SYPC (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3n_FLoglr+1AILg--.23527S2;
	Fri, 27 Nov 2026 23:31:24 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rockchip: i2s-tdm: add I2S_XFER to register defaults
Date: Fri, 27 Nov 2026 23:30:24 +0800
Message-ID: <20261127153024.2348805-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n_FLoglr+1AILg--.23527S2
X-Coremail-Antispam: 1Uf129KBjvJXoWruw1DWFykZFy3urWrKryrtFb_yoW8Jr43p3
	s3ArZ29FWxGw1jvrn8JrnxCF40krWqya13GF4fKa47A3ZFkFs5uwnIgr1vkFW3Zr47Ca42
	kryqq34jvF4S9aUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UBa0dUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7QzYDWsJokwXdgAA3Z

rockchip_i2s_tdm_reg_defaults[] is missing I2S_XFER (0x1c), which resets
to 0 (TX and RX disabled). The driver uses a flat regcache and calls
regmap_update_bits() on I2S_XFER from rockchip_snd_xfer_sync_reset()
before that register has been written, so regcache_flat_read() hits an
invalid cache entry and warns:

  rockchip-i2s-tdm: using zero-initialized flat cache, this may cause
  unexpected behavior

Add the reset value so the flat cache starts with the actual hardware
state.

Tested on a Rockchip RK3566 board; no functional change.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 75e6cab..a6efd92 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -973,6 +973,7 @@ static const struct reg_default rockchip_i2s_tdm_reg_defaults[] = {
 	{0x08, 0x00001f1f},
 	{0x10, 0x001f0000},
 	{0x14, 0x01f00000},
+	{0x1c, 0x00000000},	/* I2S_XFER: TX/RX disabled after reset */
 	{0x30, 0x00003eff},
 	{0x34, 0x00003eff},
 	{0x38, 0x00000707},
-- 
2.56.1

