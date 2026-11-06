Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980073;
	b=jzSjWNddtpMWIpvEmBXPLxSeA1yB73Q6pqLISfdz3VwogyD+zexJfm/Wf5DrMdWTZFeb
	 yxh4m+VMuPfowAdTqdsF5eGPaiLHtQ7cSRigiyAtJ7eFMx+Js4trny0wfhiRBOqOk691P
	 t0rboQa0I7hV0bmIjM/peV3hSfFZSoVYL0q/mLrb8yzi6Zjdm8sTq1BZ5Eyk3MbGdjNre
	 YDdj2nIttxb0kBncmZpwFSbZSp80sqF6jth4D675j0GHxclGtOLJsUYHalIvdjKxBv9KQ
	 Is+9DmXTRouSsyOaajmgT9le+dk+ZId+4OK7iHidERLYs0ud2di5RppbL3f0GY7gklQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=n9Bl2qyMLwhZI6siOeK5J5FuawHQRf1Z3uUbtTaYLLw=;
	b=QdwhO4cpjsfJTIMkXZDgdPoT014Zr97RvJdtmjV0/nNz0jadfFHUfogQuLxiVvt7CusK
	 0XB5hNBqlAfJ4VH5bdT6R0A2oZf3fyS+zq2p3qG+f4owtWyPw065rsY9X4zXXmDddLbOF
	 MRWzA9VOJjMbMPvt4Mh7hFhTCe35NUZ6/wY1JM4J7UTBgII2RHZ48sd5MLo7FYyiKqzJt
	 Z6txs/AZgHVumfKzBw1JLlkAxEfP2FHxi6vcUC9ajIKye+SZq7IxGjtiNCQM8aH7+7Zx8
	 U15hfbjB7vwyBeVatIUk2dVo2aYHE1iM+PsypMW/iHSd8BKQvXiyRR5Bfp03HqwOrcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Zp5Jdly;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3361F606A329
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 15:47:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3361F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Zp5Jdly
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3b0ae89de91so476790a91.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 07:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793980072; x=1794584872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9Bl2qyMLwhZI6siOeK5J5FuawHQRf1Z3uUbtTaYLLw=;
        b=0Zp5JdlydAitEnUdQY1Ani2PkHJoF/hfoTVPlSNbuyp4xTNOCawabm7MsbatzzOapa
         4oTUdhTu8ea76KF6R9Aiyr9PoYt2hXUyqwAzbPEzf3UX7kZZWJ1hJ76PZGkPbaUAVwh/
         PtTJgTKKSBR3JqYk7squw/GyvzlhFteflp4qxney7W58o3S554FdwcoSdAIxlaaRr5R3
         Ox87MgJvHxZHitrtK8whcUIYaRva0s3DW1JfqEv/7YtjADcTZG4Ul3psPqr+K+QzN3H2
         GLfP3MjzaR3rNzB3QknwYrE/7ksTAj05WImJZkTlgltpH3YFJ+hS7h0uBWUFgZfol/Rb
         UP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980072; x=1794584872;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n9Bl2qyMLwhZI6siOeK5J5FuawHQRf1Z3uUbtTaYLLw=;
        b=kujzazsU8SSFjEz742qH+Fx32Ca9/P34hOOiTFh8Z9hBVfo7ZCZTjfHs14ZMxythTG
         WE2mA0Eyzpn/HhWrPqSr4iwt4WFc89fZlgwmCDJSVoUdPrb/AM4Ksi8d9WJs5ZM/7cKM
         tWvQorxpX59VnyUK8K1bQioj1O0BekvSRxfBuS/lTEIy5KgAySBH9qu73gIzISut59ki
         gL20ItiMx2jquMRpeyIa50t+zkADtrmUcQUYuyLmvQ1E47M/H0D9BtfJ7P+8nWcdfXEu
         c/HwDrQc1CeLbMmAV4tv4QdywomH3BnaFmN1Y+0+Rs29L0vJiymoXTfaAlNQIEZZ50J+
         QWNQ==
X-Gm-Message-State: APuU4Z/Ug2FtVMcPmD7CWreigSAC99xImnEGGP6FCgBIbp0+URbT5ITk
	8aCmnP+iJFmYXj+Q8K1WRRNcCjZcZAIBklaHik7RGno7v1xaLlZhGB+4
X-Gm-Gg: AYBFou2xXoUWi5CbQ9/563hAZAlW8DPF8kv+rEE5mhIrVSQ0BHVKPVN2hr1ApMAs0sX
	RFm4pMH/xsr4CfKisQSKqZVbEG6PDdVuQvOtkuMJsoULb+WZISWGwQE0B78jbyRd6HfLk3Ih/yu
	9t/j69dZzwDZFPF0FV6eYu541h2H1fjrOCpwGCQl5tbXB6OTYB0PF+j8XzGa/EO5aYNZBduDeY+
	Mz6NEt2QLOSocmwEFNiE/fWJW3JYUDv7cBzbSBvpKazAmHnjsTDJt4Zcm5pgDbK7IRPTzFQPBM/
	Zy9wQOY3GFQl32LJZDo8R9juWtU9LLaFnAfwxpm7bi9QPx0ngpLtx/krhjL7B0NT4Nd0RmM8UUc
	tfaQhUAlahGpcPIPhbvllAOhyVVdb1ElOCki3x9uFPrKWXy1FC/2AsZIA3QMsd4SMorY5gZepnO
	NQwPQ8TSjrHTV85jC656Gald8J+0lNrx0z8XQFX1TcG0Nc9WmxUroPlPUR+6QaBRJR3svx+5CI3
	Kou/dfO8YLiL48tJr9U/s9GVOvqG3FOjrTMNA1v71ICGFuTAI1fBkGuYMHT2FRXunOuYHY9n/t4
	2ofOgERg/IA2YxaMOxafyZPIRw8hs9nNZQXo1Ng=
X-Received: by 2002:a17:90b:5244:b0:3ac:9df3:6b07 with SMTP id 98e67ed59e1d1-3b0db6c9b39mr2962218a91.24.1793980072399;
        Fri, 06 Nov 2026 07:47:52 -0800 (PST)
Received: from 192.168.215.47 ([183.13.87.136])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c0dcsm8448897a91.1.2026.11.06.07.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:47:51 -0800 (PST)
From: Zachary Huang <zuzhenhuang365@gmail.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, zhangyi@everest-semi.com, Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH] ASoC: es9356: fix the capture gain dB scale
Date: Fri, 06 Nov 2026 23:47:37 +0800
Message-ID: <179398005797.39773.18432202435074682955@gmail.com>
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

The two capture gain controls are declared with a TLV step of 3 (FU33,
analog mic) and 6 (FU11, DMIC).  The TLV step is expressed in 0.01 dB
units, so this advertises 0.03 dB and 0.06 dB per step: with a value
range of 0..10 and 0..3 the whole controls appear to span only 0.30 dB
and 0.18 dB.

The hardware steps are 3 dB and 6 dB, i.e. 0..30 dB and 0..18 dB.
Measured on a MECHREVO WUJIE 14SAH (ES9356 on SoundWire link 0) by
recording the same signal at all four FU11 settings:

    FU11=0   rms  523  (-35.9 dBFS)
    FU11=1   rms 1007  (-30.3 dBFS)
    FU11=2   rms 2011  (-24.2 dBFS)
    FU11=3   rms 3794  (-18.7 dBFS)

That is about +6 dB per step, matching the hardware definition rather
than the advertised 0.06 dB.

Because userspace (alsamixer, PipeWire/WirePlumber) derives the volume
from this TLV, the capture gain currently looks like a control without
any usable range, which is also why the default setting seems impossible
to raise from the desktop.

Assisted-by: LLM
Signed-off-by: Zachary Huang <zuzhenhuang365@gmail.com>
---
 sound/soc/codecs/es9356.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index c54bf05..ce48b1e 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -74,8 +74,8 @@ static int es9356_sdw_component_probe(struct snd_soc_component *component)
 }
 
 static const DECLARE_TLV_DB_SCALE(out_vol_tlv, -9600, 12, 0);
-static const DECLARE_TLV_DB_SCALE(amic_gain_tlv, 0, 3, 0);
-static const DECLARE_TLV_DB_SCALE(dmic_gain_tlv, 0, 6, 0);
+static const DECLARE_TLV_DB_SCALE(amic_gain_tlv, 0, 300, 0);
+static const DECLARE_TLV_DB_SCALE(dmic_gain_tlv, 0, 600, 0);
 
 static const struct snd_kcontrol_new es9356_sdca_controls[] = {
 	SDCA_SINGLE_Q78_TLV("FU41 Left Playback Volume",
-- 
2.53.0



