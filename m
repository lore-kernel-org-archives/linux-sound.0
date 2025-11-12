Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EBF339B2F
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962089; cv=none; b=EBFw5JKXgSb+sXMlpcz//UhGfF6ZdZKweU+erXBcRBRe7kNydVQWwUpP0XzTDg7XR+E0QqyihCkaWY0fpzVUfGulQwVixUgnuh+HPcTMLgkB9EDPDFBMDB/XN9nByzWceFBgx0XpH820mBT1PC1CGoq9+o606sp57HdxC35mvEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962089; c=relaxed/simple;
	bh=P70ux5XoL4sP7XKBF8mt9nEhNWg2Y0bKzzy2WXyp+MA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mfI/me/T/rD89nWE++tCxjx+EiQ/t7vShPkdkTcax4K2TlEP/LXk1Oc/xJDgzuUHONf96ET031B4Pq4W+ECLGyk9KMulm3W2TOXfFYfFCndDFPBUHV4nmS51cGlWjQz27DVqCAOehymxku9Zh9UtnXEDeanpmZW2766o6Yl9pqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V804Wny5; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V804Wny5"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so1334705a12.3
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 07:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762962085; x=1763566885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EcqGRuJDH5DuPAeW4wBjcQ/B5B6evG4AWgj1C7n+4kU=;
        b=V804Wny53F8rsoC0D2aHjH3g007OZpczWy9EsPNIadKYAww8Y8cJy0gMWtiyigO7EF
         ufLqCRVh/dAU0gvUeIsZq+Oz0TNRumgNEDnzdjcvd+9IsJr4O8q9nrKazJh8CS4HCvLF
         kcdlLpsV3fXSgH9z9e74m+FOBbfSECchh87NXSim7QqqQiWuc0z2sjq2nYjVFUf3MWqx
         qCm4kg6kSCwL7Q+HYonTH5oTUKRBOk1HBGVougmD56vv2FJqKTG7QI14eYD2dlxsnqxu
         LICNUx7WzbvFwBuQ/YWBSrXenMSRKrERAZw/l6bo4oFuSZHEoqc8Z1JJDqN66SKMZGKD
         hJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762962085; x=1763566885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcqGRuJDH5DuPAeW4wBjcQ/B5B6evG4AWgj1C7n+4kU=;
        b=DwvR2smmTssURPWithb+P5b7g16Qz+plV77w6rykmf5nEjTHPpwYoD25Iy1G2E2O0p
         nfNP4Na00tWybVUfOY52EpM5+nzxELAwHUXXvZiBuVNB/IWGQ5wZBD718CsoAaB2+F9N
         tlOYpYrr+TPsYMQSJytXPem5oSKZIMLy5vtZ3MwTbDAnE8C8BsnqZhGLO+ZQSt7o50ct
         aTLaUqO2vGAsCb9c/OiBzx4DSmOeziNq9CLIfs/CXGmMPYGwCQNmKNYYrGPQjqtM2LbQ
         +mSFyv57H/BurysTiaW9lwalhMX3sr8lRTcydii2N5N/DiwOQaHR/J2oyTSA7j1SbFIa
         /fWg==
X-Gm-Message-State: AOJu0YyELj1R7log082FWYt+UBLlYSyWxLVd8p7S4wTSklJw4LTGgKOK
	tw0MG8Qx+x6tfEfVQ8+zjlBZHgsUFFbR2J+2BheWqbke/TBm5LIpAgkd
X-Gm-Gg: ASbGnctTs+FRfxNhlOQngk96g7NxMHVhnYOEST1ea1gRoazZcNWsJQ2SzXz37NwGsUf
	HiQEclmSn3bmuFm81OHG40OtzNw45VXK1KemBtj2GGbL/PT1n40qTrdRTc+OyRg3MyBB2sx68SL
	GrwVG/tP5gij8EbERNooKCiH3o9jK82RF7Hx9PZJiiPyfsEdiF6re8j42Q5FrD/Xq4V3hhT6H5z
	rxlsmBmHkyAIsWyXqKVU7bCbMR0nioSNal0VYvdRrTqiVSnkWl8GfFkERkguHE2lA4BtV4tZWbu
	9lIO6W+lz2Su+QPdgIRkzciuMZe10UDm+7A0VoOGNlc+oJhtVZ8V5GyoaYuh/Cp8Q+Z/j5ARS54
	k/DOoqFtv9Q2JJrszCDXZx1bBwUabeXCjgsMRHeqKjyReY//8cn5+HfhnaRqKbHgluPcHuK43Jd
	Khyh3/stsXa5CSe7SBB6nRxowITgyZ9BcKtWQVxNOcCBxoZNmiQgbw5fyKBNIj5pTrZEjwhmwyJ
	OeAVQ==
X-Google-Smtp-Source: AGHT+IHX3eOJnJ6b2ckYQuN9nF0Y5Rkb79t/DFxTrsKsHI+zlzbswhY4DwsGngMKF9S9FWP+40tSmg==
X-Received: by 2002:a17:907:6092:b0:b70:bc2e:a6f0 with SMTP id a640c23a62f3a-b7331a054camr337287566b.5.1762962085303;
        Wed, 12 Nov 2025 07:41:25 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d456sm1670023566b.39.2025.11.12.07.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:41:25 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/7] RZ/G2L SSI Improvements
Date: Wed, 12 Nov 2025 15:41:01 +0000
Message-ID: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The first patch in this series fixes audio channel swap issue because of
half duplex to full duplex switching during the streaming that involves
FIFO reset which drops the word leading to audio channel swap issue. The
second patch fixes sample width value in the hw_params_cache::sample_width
Apart from this, support 24 and 32 bit sample format width.

Biju Das (7):
  ASoC: renesas: rz-ssi: Fix channel swap issue in full duplex mode
  ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width
  ASoC: renesas: rz-ssi: Use dev variable in probe()
  ASoC: renesas: rz-ssi: Remove trailing comma in the terminator entry
  ASoC: renesas: rz-ssi: Move DMA configuration
  ASoC: renesas: rz-ssi: Add support for 24 bits sample width
  ASoC: renesas: rz-ssi: Add support for 32 bits sample width

 sound/soc/renesas/rz-ssi.c | 193 +++++++++++++++++++++++++------------
 1 file changed, 132 insertions(+), 61 deletions(-)

-- 
2.43.0

