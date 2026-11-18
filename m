Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028564;
	b=2eAJGDpah3VmCR6+gjsiBp5OQiVPR+kBon9kQNLeR8M+Ccns48RX4N96NlesY4UGcpop
	 wX5UwuQjcsCnv9wMeLhvID2uyTb8M5LnGprksIaAwqbT9Bke9cW7PdukbNEnRUuFrKFu9
	 YGj/hjojub8aCHXwiF1ctFTrvdyOdHs3UcddUOLYZhPxumsMKEZHJXZQmdMWYByz+n1/4
	 8QoDq1z4mFSbbG4mdFeNcbSEl1l+LqSBKOrQzwkPeorKCMbGuwUbgFpR7BwDOKZmggHX3
	 4Y7NSKOYPdtrlqH196jAJKmDjGS029c9S+wPNWD5HdQH6yfK5wnXzGwT9/y1MJDBdtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028564;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lQ8Oii4WYXk9w9NJzlJ7rGnXWzKnHoScTT9KDu5/9Yc=;
	b=l6VqqpNyTJ25PdI1BjnmLy/ecIktSWgSj1opzNI8ru3uFwqTvVuIhcYCTP9V++hqDzu4
	 wI+uB1sDsiJ99+h6b8YPIxNMr0hr7yYxVKJ1P4jYub7SP/Wk7wFIRPTqQqTJ/5xtPoBBi
	 ZPAEewj5LCihiEgzJtziDzcJsIYBJrhauSa2kvLB8GGyzQ1nMbs8u7Yu3JtCA/g9kLvjb
	 HT4o7RE+77MtZdeugCZKRnF3IZ31DGVoBVR9UifMqUjbhDYv8LzIF5ttZ/lGL1h2A3Lzy
	 Ek8OEkhx3gAOSWqz4jv2tBubnx390kJMEzuhUyn6Pvy7gMaS/DcS0Z5u5/5PbklHljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=hEfQHq6m;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927C6606A32A
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 927C6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=hEfQHq6m
X-Virus-Scanned: by amavisd-new using ClamAV (12)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028562;
	bh=lQ8Oii4WYXk9w9NJzlJ7rGnXWzKnHoScTT9KDu5/9Yc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hEfQHq6mps+0mcMqIAo4aOoRx/EwhOWtFHOnV+/HmE+gKunjUDwUr7kfnYhhh5EXF
	 9yWl7G0nJvGFHAzvS7zfYHsRWEXZVJFRwLV3CZ6ZFUm1Hp7oxHXgMpZSqt7/CV/ZgP
	 3Ayp5x0eZCy4Zj8V7zMCDDSyh2aZORpkCuYB22DFVB/DUD5ERtT7AzhkTK7khVsgpX
	 VoZSyoA3I1LH2wjFbs5mX6nCaJG/AdNn4g6kIUoqm3s4GnBfuUbW50e8iqkgWL6lnl
	 H7RkyaTuW+z7TFVM8qHDAc+KGbB8hb/woY7916UkgShvpSR+XkH8AepZbqPgNOtr5f
	 dzQDKoqG5wT4A==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id DD9C81BEA17;
	Wed, 18 Nov 2026 20:02:41 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 02/22] ASoC: cs48l32: Remove orphaned function prototypes
Date: Wed, 18 Nov 2026 20:01:59 +0100
Message-ID: <20261118190219.316811-3-amade@asmblr.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118190219.316811-1-amade@asmblr.net>
References: <20261118190219.316811-1-amade@asmblr.net>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

cs48l32_enable_asp1_pins(), cs48l32_enable_asp2_pins(),
cs48l32_micvdd_voltage_index() and cs48l32_micbias1_voltage_index() have
no implementation in the tree. Remove their orphaned prototypes from
cs48l32.h.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/codecs/cs48l32.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.h b/sound/soc/codecs/cs48l32.h
index c1b4e13feae4..c8875b5e2603 100644
--- a/sound/soc/codecs/cs48l32.h
+++ b/sound/soc/codecs/cs48l32.h
@@ -395,9 +395,5 @@ struct cs48l32_codec {
 
 int cs48l32_apply_patch(struct cs48l32 *cs48l32);
 int cs48l32_create_regmap(struct spi_device *spi, struct cs48l32 *cs48l32);
-int cs48l32_enable_asp1_pins(struct cs48l32_codec *cs48l32_codec);
-int cs48l32_enable_asp2_pins(struct cs48l32_codec *cs48l32_codec);
-int cs48l32_micvdd_voltage_index(u32 voltage);
-int cs48l32_micbias1_voltage_index(u32 voltage);
 
 #endif
-- 
2.56.1

