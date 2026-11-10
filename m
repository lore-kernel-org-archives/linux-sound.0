Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304571;
	b=kQP2RTVuIXR8ixrMwe3QtipJDZ0IK4hIZY9mrO/wRPPc3+7Y6RMSOLJOzbTUTKWD7LjQ
	 KPF93UFYFiPV5/AgsSbDI2KfxrPEQymWpimVJNpIDr10lt1Twf79U3w54YZo85BWD3QjH
	 r+0vhBVxzKZ/hJ1KpINxpHH+wHYz761O8FOtbOzZqRrZ4ReAk662FulAn4KWPt7bKuaIl
	 Vxjkf52p16zrTu9+I+oHH1v8WAiPYPT0NWWRWWVWJXmSqtHPZBzTF4VDVkUGDX/zofVdP
	 pzX4raCRDrzoHs4LaNJcGIpk0jeWJmvGGxwrTf1nI3VssObel4LNyR7jJbkk5tlfZlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k7ESrloobDv7SNdQrKyuiHBRBGJ/v+HpoIq/NFIvBiY=;
	b=nrUKDerUSuZnu5aNLI3cjzB4K/4ft9cea/ETrzt9VM880YD/D/AfsX/543WHyxyzWOO/
	 B+n0KpbpOu3A9EZpBrH57ke2WtluXSN39UuJAkBmvaiXJNcn2usWnxQXVbyhz/x+zZPla
	 m/22Zg2r3uRM4MFqHIFBSUlq02X9hDZMLD22AyXN3/AK/2w3zFN5P1mddebuMgbBR+8z7
	 ZS3zjmbWZa0/JaVfhrNaMBIf4pZh0ze4XxhW5bylbsEWI/TbBqfWas2aDvWO3VMgL0mwU
	 Vb9ullNhxNkdC+V952QS/5IxXFsNkeC9o7H1cBS3AtQxds95Ye2EpUcjtl7U0K7f/Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HipcaoUQ;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E41606A32E
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 09:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9E41606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HipcaoUQ
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3ada81853so1549500c88.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 01:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304570; x=1794909370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7ESrloobDv7SNdQrKyuiHBRBGJ/v+HpoIq/NFIvBiY=;
        b=HipcaoUQg0pdDvcbtAXJBoPA32Fo2G+7P+Qt9wzwiOElVHvFFn4SltuB/XsXbCe6//
         Efb2bL/d7cEDCPkoovWwVLnbdDQUsVFkh+k0Mwe7KSKL+3AqwN2pHc7m7fpCOj65ZNzf
         +eCW7i9YbK1dilJwdSBnX9VHeIcSM5CKyRWoYy1m9h0K7OTJ+KykVz+TU6RwX4MGCKEn
         9FzIZQ3UNTJJ+Qj/k1rvzHCxYyo862hWqQOv3MnjMFwl7TQDZ7oIFImgoaiybqliYHnu
         LnDfCywsmj5txM6hfVUM2aTERhQWgD7TkVhSda2feVR+Qlnur4Nc5yJWR3NLn8LHsui2
         UxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304570; x=1794909370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k7ESrloobDv7SNdQrKyuiHBRBGJ/v+HpoIq/NFIvBiY=;
        b=0iMoftJSU/8zI036nfxVD3CGtlKRY+jD0W6Khc3T5Np0hg2WE9ddlRlhBW9nxiJjEA
         bX7jCPffRfrmkgAP7S4U6srnTmeuInFTvboCEy6d6IS6HGySJojl/z48HWkuzXOSXEeN
         e+LDKIxVSVnF6dOS0mpgsTlx8nLEZUh1c/fi7UxOibG2TJPeqGknYQAl3icOWeExOSwj
         0dJXhdVg0BpeK0aCUqM7dfQb877xy1nNXld/PChDzIcrDDHFUZmbtYZljiO1rYGE/kOC
         oVQxLxE0mG1O+ZwNDEb7NajZxN8XGYZ5Qfo/eOrjqu1H2IfP0HHjg3Y7+Wy2uvCPJI4O
         up/A==
X-Forwarded-Encrypted: i=1; AL+hErFJRpq/vbrWU/sAnN1mYsOcrIPQOuxTkOBQyQ+N3nEV1T4aGjfiCN3JBpJzR0zYBq2e1ewCTxV0JWcvCw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vo1H/Ltvuuk5gmkBwKcBridsZxo+3hN6Ce/Teh+6GiqSFRyCb
	fmu0xcwmQjy2ilR8vjUB1L21A3xuC1qSQqXQSp/LMciJj8qmwnX6BANE
X-Gm-Gg: AYBFou3iDp+3kRgSfWg0xSVz2usYT5ziI9h0rvnUB5LoVuIzDajk2W+AD7uv965UJyR
	4UBlX8KVXfoCWUHVlv5jxb6K8IZfPF0RdM8dehLAqJ60wq8mk6j0LyV0F2Dl4IpnS68UH6Qca3M
	9zMQ+AlNjjizHSzfFU6/xcbkt7PowQkIUgBAF1ck/HhipmohvFNQJy2lbWe2QCsFryno4/zawms
	F9z0Sw/oSisv4RjW5WQhlHxC/jQmut7chExXrKrTIEow3Re+hh80jEzNgUtiBfO6aYQzTTbtjFE
	JvjYX+Kjth/08LoQ6KCfBP1l+St4tyXGwMp7FLY5ROffS77p4CsqofGJLM7hNWUm7xJs0YbTUo9
	wIk5Y0/nypO85JQraO3buOdxrO0vgnM98NQ+PO3EzsPBSr0EnVCENEqo7zvDvWd6PLSJ/doD37N
	rN56x79bPFX+xvT1da0D9r3GXuwyWr9FVAVlH/LCfL135mzuJfQE1b8acnphgAbHAx0gtVx94wy
	ppq8t3nNLSUyp2ikDGilQmOAXmMHLraP7BjzRwoTDNYKsvt5cxwM+Pe4L/l+1pn63wepvFq54ZJ
	TX3hltwmiEXRnC9Po3/vL3k3cgbj8ZNX+mSdQ4kXhtmo5J+RMZdfbHx7iQUIrAaWKwQf1BX/3W+
	gcY0WFca0Io2xEA0BLJVzIbAVoHqExt/tcCVlPevn/bRmUsNCywBDhV17gPwOdfU7qw==
X-Received: by 2002:a05:7022:7f01:b0:1b0:c224:5bdc with SMTP id a92af1059eb24-1b3b5fd1a6bmr2337472c88.14.1794304569837;
        Tue, 10 Nov 2026 01:56:09 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b75d42sm5203801c88.20.2026.11.10.01.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:55:55 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/6] ASoC: dwc: Fix bit clock rate in TDM mode
Date: Tue, 10 Nov 2026 16:55:20 +0700
Message-ID: <20261110095525.504660-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110095525.504660-1-phucduc.bui@gmail.com>
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
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

The bit clock is computed as rate * data_width * 2, which only fits
a two-slot I2S frame. Use rate * data_width * tdm_slots in TDM mode.

Fixes: 221acc16aee1 ("ASoC: dwc: Add TDM mode support")
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Move the indentation fixes into a separate commit.
 - Add Maxim Kochetkov's Reviewed-by tag.

 sound/soc/dwc/dwc-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index dbda943cfaf3..1f4d06a82333 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -332,6 +332,9 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
 		} else {
 			u32 bitclk = config->sample_rate *
 					config->data_width * 2;
+			if (dev->tdm_slots)
+				bitclk = config->sample_rate *
+					 config->data_width * dev->tdm_slots;
 
 			ret = clk_set_rate(dev->clk, bitclk);
 			if (ret) {
-- 
2.43.0

