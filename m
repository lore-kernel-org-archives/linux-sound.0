Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260892;
	b=1J1xOgAF3/7c9X2v6CRj/DnLYl0tB2OGBhwHrSX5nD6oEhaGRRiB5X8+qdGw2eX8K/FW
	 DlIhGYYUvNtdylz0NdPRjGHmNDpePBqUOtGCkaO6nJ8EYSqRINf3AFmT28BsR2Jbwfj3p
	 /xJZkYaHFZePgsQt+Tb5yU6E6mSQ9vn66JVAfm8aqQpFa1Dnj6RFaplzyevdjsCjVXEwb
	 4hlqYHOIpPsDNh0wKnhvxhzz03IOmopIRKwMOvsyk6JyWn61ntVxfQNstQjIPq6p3/ydU
	 VLGKoCJGfbDPnZsSny+aHMa5MpmQPaCVp2pubKObBm3U7FqnJfh9UuujXOSkI3UUB8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1lL/A9142Sdh0r3V89M9k3YCVDy3g1ftoZ9Xmx1uzUg=;
	b=iZsZGIrh5aGJ0R6jLlGlVJFCQVT9oa9rh1s8cEs9yCkuvQZ1ZEZhgi0yUaex3Jrf0OOG
	 bxJvIsbiMgKuku3XNLKIDBZ7xUvvtGmXDTOABELRHtVvy3VID4wkrbAsC7IwjpA9rvSEl
	 id+Q6+cjOlDLxuWRhAhl94/LFyU3DJ3H7zIwqz4A+K/gviYEteA+cyNGDwW60TNoNZYrF
	 9aDDgRFJqCHR6UfWECdxNGjyJ+/4mOB7QyIN1+xWeU3Sdb0dN/oAvMO2JxI2RqWaWuzbu
	 rWUep+4TAlXgHBMbLJToyxKI2HyQuphgjvj7fBT9yeu8eK/Bjezuv9z/9ZmmPmew7mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJt4FYuQ;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CE3606A320
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8CE3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJt4FYuQ
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab41538192so1362890a91.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260891; x=1793865691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1lL/A9142Sdh0r3V89M9k3YCVDy3g1ftoZ9Xmx1uzUg=;
        b=IJt4FYuQNVTPiglmu1TZHOko38v0mbRTw9/QFuR0TwMfhkeON3SZ6GQzJ2V0A4QbmR
         5ADtaR6KeiiExqQbfZ/esDRNbiydtRCWrWkEU3boNOOwLrlQCbQV8yNRKT9XlcN+oGCN
         GGWEBR4lTkhrLfOPNpOaD1/7rpwsjazC51kuJm6hYETrdth81I9aepn5JrBCbkm1C28b
         kHkz1qLaUMyTvyLh+W27D//K8TC+HTnb3M7Xnu/iWDlCmrI8P9XNcCqiWONMUC8dFZ08
         sSoUc/7uRN+X8UumFj5USz/3tP/yChopytCRaIuXu/q+YDAcuuIkNWdcudndf9MZ00Sr
         rWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260891; x=1793865691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1lL/A9142Sdh0r3V89M9k3YCVDy3g1ftoZ9Xmx1uzUg=;
        b=P7qlW51OEM8PZwSBHAB1Tj/1QUQds67YNq6Qm4p97sDnNzI/uKSuYhCPlZtHljN5bA
         1v+H5QOpxlphzfGse9J+F8l+b7N47oo5huJs1BcYzmE+OYaOcxihuZUlnWXJPqRlYTMq
         mGWsfJG+hr9RLRlHybE7A5Dn80zGF6w0Od9n8nDEpSYGdEhW5BqXTO4nZOmkgd6PBGf9
         MjvDLhqxcjTkXCugf8gTTzLMqTW1qM8bprMZcuNu1bVvT92q8Weh1wvJnH9yFk1LS47U
         qosDyLybjO70/KbQ1vs7zZcHLd79LL3OBIvkuz7twYx0AUnzeDT8/POxaYnBs+nquLqU
         sqNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAp42mxqVJvCb2+HLTyU9dZJyFp5KrYazYU3ETpl1TzrDJjH9K2kvUGYAa3+F7TTLGBqlxIr25Ly/u6A==@vger.kernel.org
X-Gm-Message-State: AFq9FYI8KuedILgLeHImR+CecoCvMenw/tjYry6ORFgrb+4PUh7M8jlO
	VLTawEoaYn6WzGqK7qKHu9gSnSYXeJHb4yFkaNZkxxY23PXPWrac+FRM
X-Gm-Gg: AYBFou0Ub34/XBDqTa5Y5yaX+GB4sP1DpXJvL3uTNXVSHi4Yl6xLubphUmzHGzPWV59
	klXyFTFu1Dgpi9xsg4ePnCHo3uMDRGbZqFFPHYfn8W62fM9jE+ouUqpD3BOV7r6KdVdV424BwQB
	sBs7hSMne6QJOt+bo4q7KQ0vJ5BiRtIYDiGnr/5Yl87EKKeQ1SY0QrUfQOtobj9oHt4QHenIigr
	4wH4ix3dx/mYzZ0GuFPiBV9yqGOugQCFBksDVtB73wfj08Gc2+hbeXMtbvh5KcS+teq/uOK4mjG
	GnKiLbHSoQVFBGEzVthUJ0PETZSbMPLE6nvKbqU9FnLtEN+XntocpiwDS9bDgErGhYcFS922CFp
	zd9m5tdVRvjp6GAN9Lzhnivs/ALuph18F5IC+XV8bkoikDtKc4tcds8dcO8YF+zL7KJiXp1w/dA
	8YtzRygKNKS9m0aRoChm6Rifz3pV7mYfVj6klWf0b3ysHFGA/a7qHIphgzKnhJ+X8MsAdDc3Jgf
	hglBXA+aWU4JU0dbVopUwXooqDUuVpkBADxBvbiUr6kkXBunvq7oD1tLordxK02nzc5LruXSCw7
	NVrcOEFOROJaODSu3gEzyjS9cI2TUGoonEISLD8W7PeBzffRSAWvvjZk7N5zJExwub2MzhpPI9n
	1EUv/pjn/ey8ykBhJVlSzIOpgOMCvwMtgFX+wH9pVXYbB
X-Received: by 2002:a17:90b:564d:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3ae583142ffmr4026140a91.54.1793260890899;
        Thu, 29 Oct 2026 01:01:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7fe923sm3380289a91.8.2026.10.29.01.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:01:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: hisilicon: Disable clocks in reverse order
Date: Thu, 29 Oct 2026 15:01:09 +0700
Message-ID: <20261029080109.12240-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029080109.12240-1-phucduc.bui@gmail.com>
References: <20261029080109.12240-1-phucduc.bui@gmail.com>
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

Disable clocks in reverse order in hi6210_i2s_shutdown(), matching
the clock cleanup order in hi6210_i2s_startup().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/hisilicon/hi6210-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index 1c9e235c3a81..7cede2689ed9 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -168,9 +168,9 @@ static void hi6210_i2s_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *cpu_dai)
 {
 	struct hi6210_i2s *i2s = dev_get_drvdata(cpu_dai->dev);
-	int n;
+	int n = i2s->clocks;
 
-	for (n = 0; n < i2s->clocks; n++)
+	while (n--)
 		clk_disable_unprepare(i2s->clk[n]);
 
 	regmap_write(i2s->sysctrl, SC_PERIPH_RSTEN1, BIT(5));
-- 
2.43.0

