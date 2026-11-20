Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169067;
	b=M+T/TZks1+1WP3MrYy7odAZQ/o63lwuj8CnKxb8FIHK+z0NQzeOSLc0+ecYRJB5PxnzX
	 yLj7HKjTqZ36MS71F2puySRsDEWjfK/SF+P5099Q0fJeFFrjuHhOoScibvEBZLB5R1Xwe
	 DFVH7tsHCfANZMRPAJBa7JXhWro/HT2fyD/32IEcmxAao6Qly3kFTc77eVihboE3UzgRP
	 2o2m823/WSf4ku8FyWYuOcK+pa786sHcE8HaW/swObjPgCbs3H7JPzLnfLZ2Ar+P/7ugB
	 UMpUIMGWwHqapY9TDwbafnHELt3aiHvgkxkKGQohfH29/9Cyxi5uvS/cjgcWbkIrRZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lmmBhmNLI6X/YEoK3eoy0+dFw9XJT8YVwQjaeh+3Oek=;
	b=Btoyrc1H6fueI+Ow7+pMBNkAs5NWTpOKunyv3P6iF5K5I1UGesrKIo0MDa8mTxydtxTF
	 L1CC3yOdYcd2dI4P1q/5k+Rm1GecUL+PlCjmLzNb1HfKlt1IHZeBtQmI1Z1bHqzNQfBOV
	 mQR76ez0rZ8FB1OE0Vjg91g4GPPSpuY3F28gO2c7rYFj87HWYDgw7ElDMdxfnVJSl1EKE
	 GXN6/Xu/ky26LtQlCWaqjWYbfCpjq6ifKI6hTT5ngGIW9a19ZnSSk481Elrzh81VRK1AL
	 wMSF31eG7bd66PVEHuxoOcbGnXU5Ma0wh/swUy6AOYq3/BcILsZfH7nVKRJd98CVHGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYhegRtB;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954B0606A325
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 10:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 954B0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BYhegRtB
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9d7791b00so6178155ad.0
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 02:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795169066; x=1795773866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lmmBhmNLI6X/YEoK3eoy0+dFw9XJT8YVwQjaeh+3Oek=;
        b=BYhegRtBsgi5AtmDSa/ZiSPpHJlDcOCqCcFjFdcBrD5xolD+l+zguPhEfK8XLP/mDo
         e12fLcPt2o7Me+ql/gtc7eTeHurPyepx+CLa7Oz+nNvTuQ77QKBGyIYGba4u7ZtqBWQ/
         hHG7wTw7DdWAjr+AT18xGcYVnt+3lJMH8N+n6AxL6PeVkn9ItjCCSKzb8/eVudnRe9tv
         RtfF2mjbt9c1VM6fTyDFE5jnul9NRetK9zwr6HH1EWMDPICSTOQEfmrgE5nBtipfJl6C
         KE0DFauDto8VeDl2GGaAmNoncIEnnyaRn1oxROtZupgcPHrVdRMq+Nqi0ZXeM9JaBqe3
         cQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169066; x=1795773866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmmBhmNLI6X/YEoK3eoy0+dFw9XJT8YVwQjaeh+3Oek=;
        b=mOtaezHvnF6ZmkOv50dhM+u104Y7D3PRAVXLsRAyzuGlvvjYYvGiBs4X0UwCSsPrAf
         JUUFtKBTwaY4PPo1hWI1d5RskJpQ5//pWO3jnNy3kZfw5VmwN8fFZXkdlcLFVVyu3muf
         Kk/3ji7nDkiJu7ggikn0nfAcjJl3zDq3SXD+/RbZBM3Taz/Q2K/7Nrkm3nFud2GVZg+s
         lfNmVjI4FPj7Tta3/3EDovoNoYYzWsYxZzYSGS66uMqD5W/TK8bTQBKrpeoSlM7+4iz4
         zw7pWaC+szCC3hvY4KgyykS/ypMcu58DD7IBFeJfyBCrFfW3n1JwOjGHi+PWBgA8XiXz
         MCfg==
X-Forwarded-Encrypted: i=1; AL+hErHtg+R8OtWYeJRntdOVGftyQZXS0EExZmK6o275k5BAVxJdxUyXoxxQkXrcWr9bX1OP/DFquWdppWSwSg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9V/AxXhILtRid5NTgAckduA3qzTOkoutFCu/seb/k5zhpUw+PP
	5Ob8lqwx+zJhQWmxVg1EP8bwaBfOZ5ORCzw00+38Kz4w9d1jlvQjR7yx
X-Gm-Gg: AZFdTZcP/G3zL8M9MCBmNwU0Atf10W4tceq71jStbyAvvGby3z0Dr3KHJPLU7Hp9NqA
	OvjpFSDpfzkueROYbQMNmTXH99U230Ob70sqEiHLhgV2jtJAypfhBw7fgl/Y0/De2IyupK/Z0++
	0HQ/F1lydgc2frPslAPiXV/gFbtT9B2OeBpj7Ugvf3KltKHg42dOq1O/QWj2BArmgI3qFXwyYLK
	NZwsKfxi/vJ0ogcAdxHbXtOasRjBF/p5YFLXf8R0/e26+TfqDzQZ/IdKacMsHjUMzdoyRqOyMRv
	h4Kwsy87jl6VxGpRZhpLNr1m39w8zXMbOxT7c6uAV4Qs6uIGAkvY/5sEM5+8SUSemJCMHsO/5Ak
	4rbAzbDHsgLNriC9N/4N55cVszHp4L2S5D6gDxriubrtTwOA8g+jRNDfF60UMFG9DihL/T+jB7Y
	YeJC+S9EmcNlBsVnNmmxs5YisM079V15zV+h4bOGqxC9K+ZAoiEt+Rte7MTPMNjYICSlmBS7ltl
	T/+VDWG+8aj5txJuKMfDyFycx+v96W/swN6hmGoELlzC7SoK+FW1cSmhnkFVf5Pmpto1MPZY1zX
	cB0IRWGPt56xZBF6HEHDng9Zzm3zKMRbdOjk3og3kzyGAWFs+JtISDEd1nl3hfhRGJ8d5s90ERE
	JqOMsoLQA4zGtxzlqVCNuOaa9C0vW5/cor5RRnPrEIzxz
X-Received: by 2002:a17:903:4b07:b0:2ed:379:1592 with SMTP id d9443c01a7336-2f03f14473cmr23954385ad.26.1795169065871;
        Fri, 20 Nov 2026 02:04:25 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm11797365ad.18.2026.11.20.02.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:04:25 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/2] ASoC: atmel: Mark interrupt registers as volatile
Date: Fri, 20 Nov 2026 17:04:06 +0700
Message-ID: <20261120100408.8053-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series marks the interrupt mask and status registers as volatile 
in the PDMC and SPDIFTX drivers to ensure they are read from hardware.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel: mchp-pdmc: Mark IMR as volatile
  ASoC: atmel: mchp-spdiftx: Mark interrupt registers as volatile

 sound/soc/atmel/mchp-pdmc.c    |  1 +
 sound/soc/atmel/mchp-spdiftx.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

-- 
2.43.0

