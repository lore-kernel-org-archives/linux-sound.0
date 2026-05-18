Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB193E16A8;
	Mon, 18 May 2026 06:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085358; cv=none; b=CWIXTQhz6l5ave6G6zUt+RWSaKhUDDJwU1vqH05+we5vmYhuZTrvUTBpLdhUSydMgV0+4x7vN6xIjisykAzGMpwxq5dWIAhp6yl8Hq51ru9TYav/fdW+mBHbf3dLqWixz51wHqAshdr7GTjwJ7VOJRmbJoBQl49b27uKRP0c90w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085358; c=relaxed/simple;
	bh=1mwkK27wat3YT8iMzLIy6NdZUCf9abiRVzIXCFfX8YM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RELCefHBX6kwgqtAhv5rXrDWpaEjYXIX7nYpOeTMC33A19OTWaBPbZwzpNW2UqCXOz2IjLJx9IEW5ISHDh9YxmoUwgKGLOCNVw1Qd0Y9Uhsob8eOTL2kE54yiRjF0VzOjw0uQEuTiL7JDupMGFmgG35N5NfxBaLpqGNQ3VadV/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=gLIMhUxI; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="gLIMhUxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779085279;
	bh=A2GVc1zUASYJfBwZSmdjdr/k1l/maHysDboFhXRAjps=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=gLIMhUxIA9W0GdQZx1TmfJprXKwqo5Vd7+82iivlgpPM+N7aAhme5gpuh0T6GuxtE
	 /XL69TPjgoP32E39I51KSflAUDWYaPlb0Vv3RrzS/12Ae7bthyVID+w7kADdBDCpQk
	 KlMmf22P3xbZ2T2muMYiAGVIGzsLxqjj2uesC24I=
X-QQ-mid: esmtpsz21t1779085271t883ca148
X-QQ-Originating-IP: Pbl0CTrtAi2tf3tDi0PXsBa9DAiuGWOeYS7By8MJNVc=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 May 2026 14:21:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17729067457664645122
EX-QQ-RecipientCnt: 11
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v3 0/2] ASoC: add shared BCLK rate constraint for cross-DAI
 coordination
Date: Mon, 18 May 2026 14:21:07 +0800
Message-Id: <20260518-i2s-same-blk-v3-0-2ba1c4f41db9@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Nyw6CMBQE0F8hXVvSXl7iyv8wLtpyK1flEQoNh
 vDvApoYjctJZs5MzGFH6NghmFiHnhw19RKiXcBMqeoLciqWzEBAKmLIOYHjTlXI9f3GLUoBWu5
 NogxbJm2HlsaNO51f2Q36iqZfjbVRkuub7rH9ebn23nQkvmkvueCRklbEqFOZ5Mc71cMYulYZr
 KgPTVOx9cPDR0lE9qPAomCBIlEANovgrzLP8xP1wqcjCQEAAA==
X-Change-ID: 20260429-i2s-same-blk-fe102b18c5ac
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Yixun Lan <dlan@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 jinmei.wei@spacemit.com, Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779085269; l=3542;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=1mwkK27wat3YT8iMzLIy6NdZUCf9abiRVzIXCFfX8YM=;
 b=uGkYO+Sg9CMiW6Anhj8kwJMWbxLiFgIjzTfzxHtW71nft6nY1qXh3bJNHtoiD2A8XyTKzN18d
 YQwwq0TyBkwBW56gfLFhg96EjGyIyXB1ZrtReMciSpd8jZ8ol1MIch2
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M5M6uoxaDPdfOZ4ka9qvQJ39SO/HHtqCXyuUuhKGpq2cGyRjLuGDKdAP
	gjUUT/fFjY1AleJ8L+AqWZ2pvoxYpn0KC2yVEI1EAjkUJ6Ry74xcnBupPOkARmbkxWJSQQh
	Ll19noa2zVcCJqK5djPT3k+mRX2c9kRuxM3PukQkuDbXRRmHz/BYBC308NnhX+P8t4ATZ9D
	Y7vcSS8kkRatrxHMwNxLr/jddnBgDj6wdyAYNAweNYQyvYL4ZqcPaZxsfI3KHyG33U1GSWo
	CBxiebPR0uZUHzk0EYvAr3fGm/cE3kog3mki+CacUHtkT29j6QWgzG8DokMZTAsRFlh/qR/
	ACz50MTTMAyBp8y4ZBt4NI98SZokWHuaAH0Y33w/0THXHYIxIyk7d5AfNV3wZHpte6L8hMT
	EKWayLf8JWAwgAfirvF643fptN26sdbgiV6NBSbpLrQkdZo+DF3MEws4dWDV4SSPnc9jzOg
	Wu41NKFzY481QEAJe/i+K4PBltDkCwJs/GkwMvqffTdi36Doyz3dCPZlDvSx0qaMTocyJ3B
	K+kP0qTkQL64qKHQIp9Gz33Hacj9GfTF7b52rWAPgIkQFDfRewgo0h4IC04pCS1w/s/iUck
	0LnVXyVveA/xQDFcfeUCQYVtgwOyDaSI4FN+r/r04qTMchXKrf/pyzuNEYohcMIlHYSqr+g
	xhzH/TxcesRgD6gmtG/B/e1BIoOSKatYJm+tBA3NpzVXw0E+OFyBn1kR0IVPa2b4wzstso3
	3cBdNOK3eQaSs5WcIz1/t8c1Olv8Oov0Zx/2cgosK3bRwuF+H9ZNNlwdk87DgCQdJoU8PjK
	GbKwBzvXBDUJV9dgcXTlCzyvKUEYD92KQRx92OClMKiG+Bq5EcudbemS7gplhCHzysTX/nA
	pF0k/OpUpfDO7ugIIV2FGo5KHkvfxh4/1UHTjCkhjfG4iKJfroHrjbC6kH23GwHnMSKT2C5
	MI3iT/ihwWCnhRss8mzipt8Wc0xB9vygnFZ/kpanOROq2tagBp+KYCi74qFiPls7l9MaJYH
	OAGWF1SVif7jPIue1Z/1wdbRBne58jAZcuHnIY6EjTWsRK07CT2HNgmgjEXxb6z8Q+ri+Yn
	exJB6HEeYKHJ8gL7c4edW3KhyHnPmNENC3DwKY6cT8jEVLxB+ovLSPi9BGvDpxH7AdpLQ0W
	4mWy4Z4VMgcfvl7JaxQBdy8U7Z+viX7xZHUnyMqH65sHSIDzo+UgYePfWfyjFS97dl/wtHI
	p1ZzTDrQ=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
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

Patch 2 adds the constraint logic in soc-pcm.c. During PCM open,
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

Patch 3 wires up the SpacemiT K1/K3 I2S driver: a single call to
snd_soc_dai_set_bclk_clk(dai, i2s->c_bclk) in the DAI probe. On SoCs
where the BCLK is not shared (c_bclk is NULL from
devm_clk_get_optional_enabled), the rule is a no-op. On K3, multiple
I2S instances share the same c_bclk, and the framework automatically
constrains their rates.

This series was prompted by review feedback on the SpacemiT K3 I2S
series, where a vendor-specific fixed-sample-rate property was rejected
in favor of a generic framework solution:
https://lore.kernel.org/all/afFqgF6ZRwYdfUmL@sirena.co.uk/

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
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
Troy Mitchell (2):
      ASoC: soc-dai: add shared BCLK clock for cross-DAI rate constraints
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

