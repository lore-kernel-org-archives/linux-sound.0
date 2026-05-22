Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48C03CEBAA;
	Fri, 22 May 2026 13:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456922; cv=none; b=hI+r0xmuDcWMWMEwh5LzeqYF0gyUBmVvHQTKBAd4GYOUa1w+jUeFD5r6rt+T1vXBucJlIFeHiscngKd5zPLVAZXOq1Cdi6C/d4CIleyOhdj/sCncPopR7R2eeJ7VjHF9xkzuyiuhs2AXyQ1C4dq8f7eNT+x3StMAqpemrfSiH6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456922; c=relaxed/simple;
	bh=0w+1fxLfrsQiPR6qwApyiFR3hRHMFvNMFciPt6iBn6A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g/VJe8tmNFXDv5luPUdvMyQ6W84sRyxvxl3WXBnNkuDknGSOZ17ehrJESatiIV9/2XlU8Gz019S9GEX/gts8pi0JIUSjY3rBdEaUh09riny44/OzOHDMeJvC6zoCwd6YjV0+Bylj7p0waOczrwJD8WziHmyp5Ushj6Rp4chHOD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=chR9TsDP; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="chR9TsDP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779456847;
	bh=9m3e7wu+qTU7QzRh6oI2dmZo7m2MBG6NQV8ATp/ghwQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=chR9TsDP/0DxzklZkgW9T1+I8G0xZYMDWdRgK8j5EVoyofWPNHHUi/Fc8UmKbu16z
	 KSrLobpSiSOgQ+iJpMdjYtEbngdIUevAc+CgKKz7McvsEqDeyLeuszfzglpKR+RjQ+
	 +zvbO7ykDIbLYqeSgteeHeOWn4jaw2t3Y+TREnMI=
X-QQ-mid: esmtpgz16t1779456839t2efa2086
X-QQ-Originating-IP: Sx9RZBy4Lozw3S73Qj5zl3LyDNrCXiA+OG4sqZEPee8=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 22 May 2026 21:33:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3374282165072932658
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v4 0/3] ASoC: add shared BCLK rate constraint for cross-DAI
 coordination
Date: Fri, 22 May 2026 21:33:56 +0800
Message-Id: <20260522-i2s-same-blk-v4-0-a71a86faaa20@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOSQ7CMAwF0KugrAmKnZRpxT0QiyR1wEAHNaUCo
 d6dFJAYBMsvfb/vq4jUMEWxHF1FQx1HrsoUzHgk/M6WW5KcpyxQ4VQZXEjGKKMtSLrjQQYChQ7
 mPrNepJO6ocDnO7fePHI8uT35djCGxo5jWzWX+14HQ+9Ja/VJdyCV1BaCMuSmkC1WRy5P50msr
 aeC24mvCjFsdPhSMjX7UjAplJPKLGKYafyr6DcF5l+KTgo6C94EA7n7/Uvf9zf/ImTDTwEAAA=
 =
X-Change-ID: 20260429-i2s-same-blk-fe102b18c5ac
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779456837; l=3735;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=0w+1fxLfrsQiPR6qwApyiFR3hRHMFvNMFciPt6iBn6A=;
 b=TdVU40j5ZOwRtiLuDuv6Y/DGZeBKwK4WY1f68vJYt7JTZo9/2WWl6uABX/gjtEs8lMmIwKQzh
 FysSGZCjdc9AQ+ePATCnh1XXGS+SZLD1kpNdoEwrgH/1RsRH1yGqFxv
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MCB3AkYP0AZ2HUHLWB82XpImQNwbfs8cZ8l4GGOcgOaaE/G/rpDXwsiy
	4+GchCxgGhtiN7lEDG2Hj+ElfN4Lh/Gz1WDoqQ/fgJDspl1/88VphQFpMp1Kdvr/3/VWvcy
	34vHk0dQxYuw92u8IA3qXBD8ilQqhTbvXodAPSTMj1wFcWIeJyv+5JOv1/CHWVEwS9ZZdAd
	yuudjO6Al0tuP68gnv7j+4SXH1XUphZccrj0yU+Dfn/emUPoGZK0qk8I/4EuwRUq2DhpQyM
	5SEd6u5zTwm9ioyzS/zVLFc0Ryi9ncxr6dcq+tGL/jkaNrfyD1koJhJpEiMlb9K3noeOBJq
	+bY5pb6mHHpLIDt6G/6hMjpQVvpDRtA6SzPoHd46u9gtyhHlWNChyVlR4CgNArJYDN1AMMd
	6GQY79WKR3yLTajo3tiIae4ES7ZiYdKpA/vII3UpF5JjGAM/2i23yXJUqvHmdGdHAZtZZ84
	beVUebu3CEYbNKGgTIpL1vPepsxEzzwtcf2NXwadnRCB2QqeDFzaaMdAnnuu6Yh6ndZEehU
	6RJ6qRAn0kjuszzL4yIp4VEXy0y3kzZJ3dDG/f6g8uIHxLCcoivJfYdtRyy6M1tPZFTxF/W
	jPMksonkXCEbpP17Pf6ZMi5uKh3ezzSsrakPD/jnPAchDGoiV25Csc3ghAgkxXFPKuI77CB
	MFhUo9NgpcMC9x+sqCY1MEBqhZuIkXYFgQvBNHwD8jhX7hw7dPsEREvi3SR4ioGjl2dnY5I
	bDkBJ6jW/L+4tEv0JtZZMGbzTwwYTLk+E7P9t7EBWirywb9nuCznDtLQFL+BRpAtmicc6s1
	2EgGfI+E3c5jTE3TV67ykKrdQN4KAYw1knKsRPDPBOcvcqxhIDZJh0RTamZZoPZz+5HVSWy
	zNqNJBsipSmH5f7mM7kcKJdWEmyW+JDpUoaY/LLYBDxNKY0af8dcAMTE3n8QKN3ciNfDyFU
	m+oj89op1H7xYfOXJmgo5GnRuA+c5sfuPTecirpj4JfP7yxkrwfHla47/uHNHRdGoI0k3m1
	69YCCAGCzaYB7CX3IYefwuXRegCYOPkApUwYEbr4b3xknf87vQ4VCMZwDsXG9qNNZ9BmZNf
	HdUigqXE45ffgw8FJvY6cmQ3y/eDlYVqqMJ0xTxiAiiejgC6k23nVX390b5pMPs/0QuCuxv
	1P08cRv7zPzvFRlQ+OtgNPGePJL0cDgjqld0YcNDxVNsBe4=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On some SoCs (e.g. SpacemiT K3), multiple I2S controllers share the
same physical BCLK. When one controller is already streaming, the
others must use hw_params that result in the same BCLK rate, otherwise
the shared clock would be reconfigured and corrupt the active stream.

This series adds framework-level support for this constraint:

Patch 1 adds the dt-bindings for the spacemit,k3-i2s compatible.
The K3 SoC uses the same I2S IP as K1 but requires additional clocks:
a dedicated sysclk_div, along with c_sysclk and c_bclk which are
shared across multiple I2S controllers.

Patch 2 adds a DEFINE_GUARD wrapping snd_soc_card_mutex_lock() and
snd_soc_card_mutex_unlock() so that scope-based locking picks up the
SND_SOC_CARD_CLASS_RUNTIME lockdep subclass.

Patch 3 adds the constraint logic in soc-pcm.c. During PCM open,
every DAI that has a bclk clock pointer gets a hw_rule registered
unconditionally. The rule callback runs at hw_refine time: it scans
the card for an active peer sharing the same physical BCLK (via
clk_is_match()) that has already completed hw_params, then constrains
the current stream's rate to match the established BCLK rate. The
first DAI to complete hw_params is unconstrained; subsequent DAIs
must match. Two modes are supported:

  - Default (I2S): BCLK = rate * channels * sample_bits. The rule
    derives the valid rate range from the current channel and
    sample_bits intervals.

  - Explicit ratio (TDM): if the driver sets dai->bclk_ratio
    (e.g. slots * slot_width), the rule computes the single valid
    rate as active_bclk_rate / bclk_ratio.

This series was prompted by review feedback on the SpacemiT K3 I2S
series, where a vendor-specific fixed-sample-rate property was rejected
in favor of a generic framework solution:
https://lore.kernel.org/all/afFqgF6ZRwYdfUmL@sirena.co.uk/

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Changes in v4:
- Use snd_soc_card_mutex_lock()/snd_soc_card_mutex_unlock() via a local
  DEFINE_GUARD for lockdep subclass consistency
- Add DEFINE_GUARD(snd_soc_card_mutex) as a separate patch
- Link to v3: https://patch.msgid.link/20260518-i2s-same-blk-v3-0-2ba1c4f41db9@linux.spacemit.com

- Drop the SpacemiT K1/K3 I2S driver patch (previously patch 3) which
  depends on the not-yet-merged K3 I2S series; it will be sent as a
  standalone patch once that series lands
- Link to v2: https://patch.msgid.link/20260507-i2s-same-blk-v2-0-ede05a22f732@linux.spacemit.com

Changes in v2:
- Only store bclk_ratio when set_bclk_ratio op succeeds, avoiding stale
  ratio on real errors
- Hold card->mutex during rtd list traversal in hw_rule callback
- Link to v1: https://patch.msgid.link/20260430-i2s-same-blk-v1-0-3a1f04eb6159@linux.spacemit.com

To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev

---
Troy Mitchell (3):
      ASoC: soc-dai: add shared BCLK clock for cross-DAI rate constraints
      ASoC: soc-pcm: add DEFINE_GUARD for snd_soc_card_mutex
      ASoC: soc-pcm: constrain hw_params when DAIs share the same BCLK

 include/sound/soc-dai.h |   7 +++
 sound/soc/soc-dai.c     |  18 ++++++++
 sound/soc/soc-pcm.c     | 119 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 144 insertions(+)
---
base-commit: db490fe819ac280fe608b23d98c54a5467ef2948
change-id: 20260429-i2s-same-blk-fe102b18c5ac

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

