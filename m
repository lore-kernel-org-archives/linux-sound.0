Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108264;
	b=v95rv7I2qOUoXMzEQw59fpq3mG4kLLludKA/e32OJtNRrt8+DKiNzPLtgDeFBu5MBaJY
	 56A8gB9YwIspVGhOAxph4Qe/2JHKviBiCabCIrCvJh6QaOxwbK3IGbhqddPV0cYszMPQd
	 0AT2G0AMFgwjohnN6uP/G7yjhzPpBSwwvgLg4AF1N/qoM3lrhSZStw3M84JXp8wy5ZJZL
	 gR15huU25SJLWlEpbCS7eiFH4FrVaqhRthSNiu00RMv4Rg09aHI7ALDfgjSyBmm5mPpq+
	 mSKVNmDLbYAkgt65NWwoljRVc5hjBkLwz8adkwhyl+hkThcEZWm3OMWm/b457rudxjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=KDSgHG/fYnr0cS/UnUZIRPmooKQVdCYrsswn6mr/ZkQ=;
	b=jbQoSnLP6K8+yWgq8uEnVJh0QnS/D+Lv1VoWP0oLDlb0fZHXF2wUVgDYT1v21W36UmoE
	 DvGH0Imnkoa+09/jpDiHtLGX7RvOQEO+UL0zKpTF82cqi/XZV81fwWwd4Pq6wnjqj0v7X
	 RF80fxNKGevAQA9UsvYpKes9yrEp28C+Ss3MaK2ABqou50kEadGmzoPxKMd8PYdFz+hF6
	 MJRZBt6VV5QoVVkghcpgJM2zgmTBR9XH/u84BfIrR3rza/J731f+CkPJ662a7XT6gj/qy
	 kjNznBI0vAVuJtZniQ9GPlB6wQ33NaH1A1m2vWr9O3VFdFbCSZVPHGrO0X8e/DViFhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=npTwEEYm;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B97B606B402
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 17:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B97B606B402
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=npTwEEYm
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso5094457c88.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 09:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108264; x=1795713064; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KDSgHG/fYnr0cS/UnUZIRPmooKQVdCYrsswn6mr/ZkQ=;
        b=npTwEEYmuMn60XQb4gaI9CalvzEF5EIf5MlGVrAWfihsuX2fZPaUbfrk0Yb7Yt4BWh
         5xXuSyTJlImdynUZbaxSZ/UtTsif+wOBDgH2O6JhcjrIxIqr1VstxvD0H1CTcgF441xI
         wUOOZdpqzaC2w8SJB7MsGvFMM5nNjcyruFkQWcuOMb5CRDpN4WqfnmQU5CpXXrHDi235
         V/xtYMwWtTHV5BdXm3KjIrqPe5K7+FVcUgjQBSySiUzxu5QsN4TQ+zr94k7+UO3EVUnz
         hfa2boqcjJxXzkwcf31j+KpM7y7fyk4IH/pFh+zfCNFt2NMkZilWi+YYWRHAN2F60Idk
         O0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108264; x=1795713064;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDSgHG/fYnr0cS/UnUZIRPmooKQVdCYrsswn6mr/ZkQ=;
        b=b/yv1zzNBAf0OqlL5bdwUV0BfHLI1gTR3ji0P5l1s8z/Eu7axMhDps/93Zg+Elzgoz
         8mfOW4gvR1DiAYNcnN1ePQ4pm6bL935aCc2ypCdVdPOeGJ7YTj0lwnZN0bgodOm8k0MW
         Bk5KfWVOJi3At+D3bVQ9oWr/bWpxas/QtMJHeMImYlO5qURGqDScuZFWIG+keEcnpAxK
         liBxXmWYf0ksTX9+3rn8EC7qc2/D4ITk6Nkq7Ql+fiDZuud2LgQbO2Y0Od29ioTDABG5
         uFC84+mkUGKPFDoUthm+mOB5rMCRCmXQetibDzQgLTzFrdGWcBsBqb1RcjldbbaFji2L
         ZQ3Q==
X-Gm-Message-State: APuU4Z9Ye8nPdMC953egK70rQSbQEpa96foLT4DiTrGHs2QxQdMs4ZbU
	YGjx6hLxyG40pC97hWLU5pC5iPtQRBp3xm+21w4154buf6Bbqk/FOr5ghrlZFxpXbEfesL0/vBn
	x/cBcAGMG+Q==
X-Received: from dlag26.prod.google.com ([2002:a05:701b:251a:b0:1b2:450f:bfdf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:ea56:20b0:149:1feb:6d9d
 with SMTP id a92af1059eb24-1b55689e6femr295208c88.19.1795108263241; Thu, 19
 Nov 2026 09:11:03 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:59 -0800
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
Message-ID: <20261119171059.1537658-1-irogers@google.com>
Subject: [PATCH] ASoC: codecs: aw88395: Validate 4-byte alignment and init ret
 in reg update
From: Ian Rogers <irogers@google.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In aw_dev_update_reg_container(), each register entry consists of two
16-bit values (4 bytes). Because 'data_len = len >> 1' shifts off bit
0 before checking 'data_len & 0x1', byte lengths with (len & 0x3) == 1
bypass validation: len == 1 yields data_len == 0, executing zero loop
iterations and returning an uninitialized ret, while larger odd
lengths silently ignore the trailing byte.

Reject any length with (len & 0x3) != 0 and initialize ret to 0.

Found via Clang -Wconditional-uninitialized on an x86_64 allyesconfig
build. Verified by building
sound/soc/codecs/aw88395/aw88395_device.o with LLVM=1 W=1 (-Werror)
and -Wconditional-uninitialized, and with a standalone C reproducer;
not runtime-tested on AW88395 hardware.

Fixes: 06d2fe9cb423 ("ASoC: codecs: Aw88395 function for ALSA Audio Driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 sound/soc/codecs/aw88395/aw88395_device.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395_device.c b/sound/soc/codecs/aw88395/aw88395_device.c
index 3ae418c8b34e..2dd0b3b7de0d 100644
--- a/sound/soc/codecs/aw88395/aw88395_device.c
+++ b/sound/soc/codecs/aw88395/aw88395_device.c
@@ -1004,16 +1004,16 @@ static int aw_dev_update_reg_container(struct aw_device *aw_dev,
 	u16 read_vol;
 	u16 reg_val;
 	u8 reg_addr;
-	int i, ret;
-
-	reg_data = (int16_t *)data;
-	data_len = len >> 1;
+	int i, ret = 0;
 
-	if (data_len & 0x1) {
-		dev_err(aw_dev->dev, "data len:%d unsupported",	data_len);
+	if (len & 0x3) {
+		dev_err(aw_dev->dev, "data len:%u unsupported\n", len);
 		return -EINVAL;
 	}
 
+	reg_data = (int16_t *)data;
+	data_len = len >> 1;
+
 	for (i = 0; i < data_len; i += 2) {
 		reg_addr = reg_data[i];
 		reg_val = reg_data[i + 1];
-- 
2.56.1.708.g77570a6a1d-goog

