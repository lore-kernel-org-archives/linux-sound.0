Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106757;
	b=Rc9KCVI5fmgMIEoPcw9uqmxK8gzOdax8W4wdkIKV+cqDV6mJUwxNlnc+YBYFfjP/ugE0
	 Y4A17yYMvN1rrYKZ7DG0S/hNF2Ys7D8pMh9jQ+/EbSxUZj8j+SSIhDNhzoTs4s0iefPUB
	 Kq2+mzdNVPE9hfl8zaYNxCTYcrWsVH2DW3y2VrIjkUAYiiYMahuMINi93HD1DUrleDaRD
	 14mB0NY7trQi+n4Bjvu9ldnQvuwDYg1cku20ZRGp3E8goQ8v03LduH/p+QhvOUA2C2IcS
	 5MziCN8sbAx3YSVO5FmWffjt2kpuZfC1X9RokdrJId/LIvHAxHW1krXonAZg6WX3AEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6O0qMt7R706tBKSv8aJIpJsbtDLBIWSkvJHnOSKH45g=;
	b=TT0A9bKU07a6IBgU0L7fQF6+2b572H5H4cSffjBGsQrNnYH13neoSOWg3BDCOQ8rPAjL
	 dm2Tu1XJsxuNVHKp9xl5tZsRuLMTQp3swCSPnr+PYTlvx0Fy3eSwpquChhnQ7Kv4UbUiv
	 8LFulu80pTX1zoTZ5kGhXIHfuMv90xLnZWIKys6i85Dh1d4Z05LxHQHA6FueKANLOK7ve
	 z9akBL8dzPdeghDB8Hs07BnhQNa+TovQAAhTIaKP9FnPldiK0t5J18NPFXt9/B6FC7CjU
	 zccq6VkDrygusnGhD+oJYtqDBBVgZ9sl9h6HL36tvm5bEoH54wpfXvviZgf93zjM6BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nUWp3+WA;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20783606A31A
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 13:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20783606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nUWp3+WA
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so6300246a12.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 06:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793106755; x=1793711555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6O0qMt7R706tBKSv8aJIpJsbtDLBIWSkvJHnOSKH45g=;
        b=nUWp3+WArFLck2dpE2UXYM/mHdzgi2fmEwfMGfE1kZf6mUiX34rl1YhoT2cy/aJTic
         +qb15nCH+SM13eTiXOT3eV8wxShNqqHfq0UlsfBpFgFC2nE1tAE61TaPLLBOA/yOP9Kg
         2gvDm2tpeRxo6Ghnk++wJBD75M5A89lp3xTb/ztQqnGhWQX7oRKsICrgeNaQYMN2GSl8
         n15G7uKtNJYsQyoNsGvRqfwuim3hydmULt8GC8by+K7LPKU3w20O8O5TO4e4mRmC0exb
         NyL58OV/NXgid+FNeqry9LerUS4kml4MUtZ4HgIcqubkigPWXO2iRv1ccqFrlNHUNae1
         XGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793106755; x=1793711555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6O0qMt7R706tBKSv8aJIpJsbtDLBIWSkvJHnOSKH45g=;
        b=PuX1uZr9CJCJOodvAGAxvxlGeyO3EuDF1ovjeXpuyxArlYclS4D99jkWTlMQSAnaar
         mlmoaHVG3NfYPqge176aadXtyRchu3VHzsaGiUpP2KtxbmwhALI6pZF1GnEgB7Yrtt0f
         0l+kOWoDjI/6edBxFcYpohsu6reKEqhQHG7t4/KnSwHR/SqKfVnAyxMiTokiQWPDaMSR
         MQNYm35udhnekdZh8SWW4eKBSrhqdKRknWlKtwbVp5G1+CCWWhM64JtkjAISGJj839f7
         PaIE/yzKlFZ9gMsgUHf44H/gxxJKu0rU/5pL1+0MXiotg/vLbE/rGzMlLUzD1fumUBDh
         Kx0Q==
X-Gm-Message-State: AFq9FYLFtyEpND38tHTVwD+T4V2etHcrkXpN0oktmlcy5ij4KeN4S3uK
	bcG0wGxEhUgyachIGcUJdb/Np6k2UjoPozmdzehEP9zyFaZ+cfcV6g6qAA1XWg==
X-Gm-Gg: AYBFou0kvmVrM8PVxkH6359KL0Jd9Q907N9UAoNPthdxJd5or1u/QJWxFOBSj0kToUe
	e6x9e7TeBZMLxUIVFdoI4WCJfQVzD5CZWWXdCsyMEITiyXq/IzJ8uNIRNxSg/IS8933Tj4gftiJ
	4jO6hk9Wun/CwdcLb0frs792ZhX9grIJB1tFLLZJo9emzCJakX3sBhRcz5BinKTGmvjwR/iCygt
	xYs1K57eQbpqFoUlGzO6HuFE2T9sRs6uzKzk6ByNahWDur092GPaXi0i1slG8y8Uj3UIST/EJBz
	k3dd+hEjtbuL2o6aWZDSmFfM/93CKm3rnyZnS+Cfs6G2aAgc6lIk8wSlOK6t/UtKggvNa++cH/J
	PgXBW5Z+oDO+eTz6eHN1JPFpE4XkGcCI95NSxxAQw/7mMGk2Xxwm4psPi9ekPNUOoHNQGUfNFaW
	00R9ZQMab+0oLkXC/6ZBmCWc9H2mRGSOC0JV6MbHUsAHupEXOcpkcApabb7tkJHqwcXGUg4QiHp
	55JC4ZrgNVRImJ+Awdtd56l/JSI3C0tANB/KcY0Ej9//zMCtVgFqjmH/VwV0Sj3wK2qVvhQkz7Z
	wXo=
X-Received: by 2002:aa7:d286:0:b0:6b3:8018:7643 with SMTP id 4fb4d7f45d1cf-6b44300a8d3mr7377443a12.45.1793106754960;
        Tue, 27 Oct 2026 06:12:34 -0700 (PDT)
Received: from localhost.localdomain (h-94-254-94-11.A230.priv.bahnhof.se. [94.254.94.11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445971a9esm5095008a12.19.2026.10.27.06.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:12:34 -0700 (PDT)
From: Mikael Magnusson <mikachu@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: pcm: update state after xrun
Date: Tue, 27 Oct 2026 14:12:33 +0100
Message-Id: <20261027131233.17692-1-mikachu@gmail.com>
X-Mailer: git-send-email 2.38.1
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

If the snd_pcm_update_hw_ptr call from snd_pcm_status is what triggers
the xrun state (eg, as opposed to an IRQ), the returned status->state
was stale and told userspace the device was still playing, so they could
get confused about device state and hang indefinitely.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222201
Signed-off-by: Mikael Magnusson <mikachu@gmail.com>
---
 sound/core/pcm_native.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 35152fae74..62a2bea043 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1132,6 +1132,9 @@ int snd_pcm_status64(struct snd_pcm_substream *substream,
 	status->trigger_tstamp_nsec = runtime->trigger_tstamp.tv_nsec;
 	if (snd_pcm_running(substream)) {
 		snd_pcm_update_hw_ptr(substream);
+		/* update_hw_ptr may have put us in xrun state, update state */
+		status->state = runtime->state;
+		status->suspended_state = runtime->suspended_state;
 		if (runtime->tstamp_mode == SNDRV_PCM_TSTAMP_ENABLE) {
 			status->tstamp_sec = runtime->status->tstamp.tv_sec;
 			status->tstamp_nsec =

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.38.1

