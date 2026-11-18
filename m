Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.128.243.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028621;
	b=RKGxFZaeh7aThMaBpoHmPV3VEG1leT5225lcIbHZ4nKU9diLpl3IG+mTItb40VQG2UU6
	 OQqpnbnWFbFw2Npors4pVWVIKcnWD6k/Rwtv+5K6qHXcY1vdw/Qu3289Z8G7EZRWdYc0q
	 HpW/2FK35vAeD6FFy7CF4u4JuLwEZfGIwrZRRAjO5lyo39TsddcUglwhIatqSyInDGZ1j
	 Ru3rebPBc85v03qBhR7nct+jQxy9OaDU6ieyMOMfeXfiS6Z/Q/dNzr2GBov2GldDDl/H1
	 VIGlc0sOkDR8VpbYAyGgdD+dSGTxn/yojo8vqcZHRjU4x73bwmKvmpAmz3aVlDruk6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028621;
	h=DMARC-Filter:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=75LYT97um79zzUlKS12ZqqszMmnygLbR1DiYRhqBwtc=;
	b=0GcKPbueKEUt3zYpjFHTsEyApVxPUyC/LlBc656i3WxB9FcQjKDHdU02cacJ+MayPt9+
	 lIZREcm87QZJXtB6SwT8Q+liLVmjJCQMMo1U5JjFtOh1fvsUNoRiobqOi1Q5MeF+ZhW8f
	 5EV1Xf6ZHNnm9Zbr01oQ9QjkdLfhSy5LPh+S/SBoYKHjML/E9RKYnkgHvX1ls9L/7dP3z
	 vZstClEXuV5nMPhkc60I5mSqgXREscvDfQNT0M+PddTbG7SRVsBJxzaVYVeAzJzBsO0go
	 sjXRdCR0LVRmH5gNSiA0bQofavH1F2OaFRVQOkcxIiajJxKvBq2QYEus7tTcaCLJaGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asmblr.net;
	spf=pass smtp.mailfrom=asmblr.net;
	dkim=pass header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=s4sSiH60;
	arc=none smtp.remote-ip=85.128.243.59
Received: from shared-aoh59.rev.nazwa.pl (shared-aoh59.rev.nazwa.pl [85.128.243.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E65606A32C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 19:03:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3E65606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asmblr.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asmblr.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asmblr.net header.i=@asmblr.net header.a=rsa-sha256 header.s=1706450368.internal header.b=s4sSiH60
X-Virus-Scanned: by amavisd-new using ClamAV (4)
X-Spam-Flag: NO
X-Spam-Score: -0.625
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asmblr.net;
	s=1706450368.internal; t=1795028618;
	bh=75LYT97um79zzUlKS12ZqqszMmnygLbR1DiYRhqBwtc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=s4sSiH60bdxs+CGXqNHMVRfuV6kkNcatJr9bk3f961/f5QTvthCBp1MAebbg5WmzV
	 17/apq/YnkDEZbCMWfzIXPXRTVvkL5HvWSzhPOuAmWVTFDEQ5uKjiJfx+W7xoVCUOi
	 XgDgVt2lfPZj099aQGB4jEe3G+u37oPJpHFbrkhIgeN7HKrck6SRmkuJLr6HOGvQBp
	 4XK6BfpDS9C78a046pv5Bq4t88pxoN4zUXw/td+yDNjudinsWh/P3nXbug4g43qJS7
	 z+nr6Gsp9ZFAeSt7Wp9yTrn54vKRcoh9MlMfEQpJXJ8owhOMxhAI4/exflytcBXVyA
	 nwvdPNYcD/wMw==
Received: from milkyway (91-150-220-230.dynamic.play.pl [91.150.220.230])
	by server753313.nazwa.pl (Postfix) with ESMTP id BDDFF1BEB0B;
	Wed, 18 Nov 2026 20:03:38 +0100 (CET)
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
To: linux-sound@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
Subject: [PATCH 12/22] ASoC: SOF: ops: Remove orphaned snd_sof_dsp_register_poll() prototype
Date: Wed, 18 Nov 2026 20:02:09 +0100
Message-ID: <20261118190219.316811-13-amade@asmblr.net>
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

snd_sof_dsp_register_poll() was declared in ops.h when DSP HW
abstraction operations were introduced, but was never implemented.
Remove the orphaned prototype.

Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
---
 sound/soc/sof/ops.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 4afc92490fbe..3f4519a2327d 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -725,9 +725,5 @@ bool snd_sof_dsp_update_bits64(struct snd_sof_dev *sdev, u32 bar,
 void snd_sof_dsp_update_bits_forced(struct snd_sof_dev *sdev, u32 bar,
 				    u32 offset, u32 mask, u32 value);
 
-int snd_sof_dsp_register_poll(struct snd_sof_dev *sdev, u32 bar, u32 offset,
-			      u32 mask, u32 target, u32 timeout_ms,
-			      u32 interval_us);
-
 void snd_sof_dsp_panic(struct snd_sof_dev *sdev, u32 offset, bool non_recoverable);
 #endif
-- 
2.56.1

