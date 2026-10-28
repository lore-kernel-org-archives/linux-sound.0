Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184118;
	b=nEGWE2aKRU1QRDTWLGh9cXIxwLtaXrVbeyiDSimKNEbH5uyy0NZRzhr9mGTp0loQ3Z7Z
	 dTtR9lLdhrWaruRE3kegXUbDZ3PlDp0rY35uh5oebv5UtHdVgLRRAEVmdhJ0Ly3mCXL2Z
	 hAmi83mHa4uuMBT36y0K/RV6nEB/Efa1LWRsa8A4id9O/VZJebD8tL5HDB46mURJWFxlO
	 y/BJkrEJ9ns+3+j6JgdMBolM1rrgCrb3tOuSZXySbO7IXu7MJ740EHD3xUJIDET12T9pd
	 3w+d3BqS/id9y45ShwjjFXPH6QR5udbmSfmEBVNX8BHOyRLHqRF7sMwBZuk75lQ/Xvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VN5fEzxH2kFG0nlBiZiP3afHlKGS+YaXg+8uMnSRxhg=;
	b=jCazdR8rlalpSGP/hRah18hZaCmt2PwMAELcSERUIRSBXEnjcurmno/9F9T185i8BRzF
	 WUsO+92A6LYAuXsNVFmhJnxDaKq6GOTx/YdzHh/YMT7soudUsrHpmESDTZnaEoBmpjQda
	 zwZo1R1nRX5Rjjxd+t6mVTJ7a5lAd0EaQHgXnNPm0Z3BRibnrgJFfDv2V2ecnlrmuB284
	 Fpp8eKF9VPdbK2MTA782+WrcctAbPCFJhCP5Wu8UEihGNkd5mNAmx8F97XqnZHgpSxKwC
	 kkvRfZYUSv68LkqpbFh6nwGXOOcl4sB8+iBGH4w67k5wsp9P3V0S6nyTzpUXHmR8vng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=01eM8GzE;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3496A606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 10:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3496A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=01eM8GzE
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so1274229eec.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184117; x=1793788917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VN5fEzxH2kFG0nlBiZiP3afHlKGS+YaXg+8uMnSRxhg=;
        b=01eM8GzEbTOGlS/4wzn+IH9eCHPQ4B9A99Ciin3/ICzHqi/hQwxUEeauTHqf98cx9j
         pyvF1GFCeT/E2CHC55nmWP04gSNOISX7d0cUAuH7a7nqUAInAthT2sEkwxiqVvFJtM1D
         wSjZHFqatQMVVQd4Am/7etu2gEG1/ENqIwUYGtzojHtWMy2TesJv6R7qMMOS4vOdOmsP
         8egVD3fcEDY5BmGqK6a7XSe64w7HekLGFtDhxlnjDvImNSMNDtNHIUMJc77P/2YsP659
         hSyOSzUs4nOuGaoSWPYbuyCnp05JA3f9xJMAvhdEV2SQ49WzAWE/DYvIuXzPmrkvHIRV
         CRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184117; x=1793788917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VN5fEzxH2kFG0nlBiZiP3afHlKGS+YaXg+8uMnSRxhg=;
        b=GHs4S4X7+sx6mu8tWesDjZUtJb6TiUcls/ddX+QGvSCgN//W6sOKfhpADnNblrJ4GA
         OiAMWhkLc6qglhzlEbGzbjrDva000ODkA9GaaCkK4JFtMG7+2amRSp4CnbGzieK9Zl9L
         gc8qqVaf+0C9HnV3btVV0MxpS4uvwnYHX8nRnDVb4mEb3cf35V+KExt0jFEDukarBTmM
         nwF0arlW0BDhzFnS9iIYzR9MsPlwmt8mvwOESkPGbcZ+ywD0X7U9TshLtfyjPFPUC0H8
         lLbe9nQRFOKOHun9LC6e/2ixNb9sD8JkOut8/HI9OhwnQoRSIjvH4Z/3IEnXbHzf2R3V
         bvbg==
X-Forwarded-Encrypted: i=1; AKwUvBw95cZdXHi8Q0/cGuTzTu8e6Ek//7+VCn9074YbLJ0D+DoP3qP2RNr6EXSaDsDc+hLZ8fw6dy9P+G/dSw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJa393kptom3WBtuyj2JJsxrHSnv3+8iDYxB2CWY9riR81mzYlJ
	Ti0yaE2rOP1Rh/THZKRHVK5k8V7P2vFjxcV/SRniIOqBVQgxjT7md3W6
X-Gm-Gg: AYBFou04CA9BerqaPkfpmRBxDAjD6MjZrNNdQUbz0KALjVnhWofYNzr6wLneYZ21s3c
	aZppGq4mmtFGrPediozuN6UTycLykuaNF/1cLUwZVDPHhenryswV+RNjPHK1kOEmm2ccIoPKdct
	SHa75Ami4sCvP4wqAi5t8XREvzsuBy8mcTgwb9PKL5BTQLNIZ52Zgg5vZZvbMunYM5nBeD6we4p
	ArbTZ1b3cbq2kVVC/00GWFYMHRnc45tjMEMmdK+7Gn+bIOlN2Ipyba1aFHn/+qSFw8H6ly4WGO6
	LhYoOOTEdVd5dz3+wR8oqMhEvpGVjZ3W71kTTw7R8prgVIDICnHC1UDPTW8psfvVZuXQMOfrHtp
	P8VSmWZo46f0mQ+0TB4ZTW0eDxziBo6fKrYdeFWPOk/pP9nCaPu6UmOjhsz99QpDJp28yjIdxUf
	U4kxYKyklS3BA3nMHWoI/HX/G0hdWH6dgc7E2bJXO8EDeVRsFaroogIu63lHp8LjsyzgqC7GLJF
	ljGre96obQ5c059pwDmqDmV7fqxF6BoA+/0HVWcYCrCfpqWdG1CeK1F7MrfFAL/QskILJeGeIPR
	Otrdrc/SNwxS2jZ/u7HbAvJXah2t4yftnaKcwDr2/M5VQ76uhNiSiETJhlJupoemQGyrGtO/rKl
	nOZoucGVDKyWQxoAiqDFWjADcMoehe+FpNY86xvVcyWTH
X-Received: by 2002:a05:693c:880b:20b0:36a:16b1:3f25 with SMTP id 5a478bee46e88-36a2027d423mr3426321eec.5.1793184117071;
        Wed, 28 Oct 2026 03:41:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm7521881eec.8.2026.10.28.03.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:41:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/3] ASoC: loongson: Fix configuration and clock error handling
Date: Wed, 28 Oct 2026 17:41:35 +0700
Message-ID: <20261028104138.26973-1-phucduc.bui@gmail.com>
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

This series fixes I2S configuration updates and improves clock error 
handling in the Loongson ASoC driver.

Link v1: 
https://lore.kernel.org/linux-sound/20261022084040.31181-1-phucduc.bui@gmail.com/

Changes in v2:
 - Use FIELD_PREP() for register fields as suggested by Binbin.
 - Apply the same approach to the other registers in hw_params().

Compile-tested only.

Best regards,
Phuc

bui duc phuc (3):
  ASoC: loongson: Fix IISConfig0 update in hw_params for rev 1
  ASoC: loongson: Use FIELD_PREP() for register fields
  ASoC: loongson: Handle clock enable errors in set_fmt

 sound/soc/loongson/loongson_i2s.c | 58 +++++++++++++++++++++----------
 sound/soc/loongson/loongson_i2s.h | 11 ++++++
 2 files changed, 51 insertions(+), 18 deletions(-)

-- 
2.43.0

