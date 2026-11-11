Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794359940;
	b=sEHRUM01su6tIyC3T08UCzjsSjsM3W59cCEE8PZvWodoer/zkhLhr35DHxTTNs9G8oQw
	 2E0rpyQPKzhbnLHAJFcF3BGv/owjgRRME9VqRyji2La1YUHHFOFhN5ZXH/bYOYwQoEN7a
	 QQa2HOs628kNFHu7DiIDRV3SrXhYJXovEfffiS/dTzvFrPWbG4C04VJq6JYEQQMK6EiG5
	 qbMqi9UYmFbk2CAXkHF3s2zLZq13bYbXZukoiStZWXlwQwBwXKozdAGmV5PpuIYy/LSsE
	 KQaXdETsVmwx4qDhdKAjJA4udMqDuA37e1MKm3qlENq4WHmbs7tqSqd8xa4raLJYVBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794359940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gNyPl8hvDz2s418waBm5wB0iV5wzq1cuI+c5xRhCVXE=;
	b=ASRvnHDFI6dAyUyQiFopBEEQ9kw4LO/FSgx3D98eHnjBo++CdChUtUIDu2+Sc7jvEAiI
	 sK6zdg9yvUQu2DUc0xOiLdb7nnz6BpxGOEnR1B81Y/l/oD4RKwE5LhNsxf4bt4hoN13Iv
	 +3zD/o9ok5iBiiKrAaSejkwJbhJOrXJUTrtMUtYuEZOubh9XyAn+Z5zFsMTEgnm8Z06b8
	 17mjDdvRltb4NGFuRXYfR4DjTLUlJ7qPVjwheDqKFCbPhMNGH0QFxfkTJxVBAxEkld9iG
	 3hD4rgQfLWOP3iKt7Isr66Zq1TSTUlHJFgRA1ctzsJN3pxHZnUFW+OPX43XfPTu+Y3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixHBnGoN;
	arc=none smtp.remote-ip=74.125.231.73
Received: from mail-oa2-f9.google.com (mail-oa2-f9.google.com [74.125.231.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBBB606A31C
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 01:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBBB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixHBnGoN
Received: by mail-oa2-f9.google.com with SMTP id 586e51a60fabf-4abbe52a747so1239861fac.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 17:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794359938; x=1794964738; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gNyPl8hvDz2s418waBm5wB0iV5wzq1cuI+c5xRhCVXE=;
        b=ixHBnGoNmKLHQjnp1EcyhfIGBb4m/7l4WLpuZeHvcXjjRCFSyz6DiGp+CUUuZyL+ni
         sc7rZxVGjrXwtLjtapYWMxcVvz4WZXQhUqirQ0embkyJvK80VU2yv0WPJa/LWjjvJr09
         AiP+81YK5M0TG7Z1djmSyh0qoTsF+q/HU5yYIWBHl0wxl7BwrdqfXfmNg7Nyqvti88E1
         pKd/OISxGMwBdHXLr+6vH6utbPQ/DGkbOtVYU0JO3mtOLHJEAddsSZuLvqsfU5AX5/GO
         NUDrOPTHrgyX/zlKuTDRhkbNiNlKLPWEN/DSBXJXV4RUgC5ymdOXq6DbNfVeEqVclr/w
         /juA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794359938; x=1794964738;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gNyPl8hvDz2s418waBm5wB0iV5wzq1cuI+c5xRhCVXE=;
        b=Z4Z2AglP5I/QKTvuC1BIDI/TgICt8z11pzVa0PqTQAFrNVEgRzHQ5WE3JJ3I5g5HhJ
         tZl+1qAen+oDulJGFgyfKuaU1q9JVcR3o7l7CzMv4/ZzwaJS6vzx4kMDFbWc3xARYSaw
         FO/rZglVurhTJCc1cMGKHX1WMakaMruO5VdiX4K9AxAtZao0Wlo+PX/5pbvHZnvuSl5g
         GTlyXXUlVxBf7X4PoRm/2TsDG1EGKrB/376BK/pYbLxfdnqefqzqu7xo7gKrMtEOKx9M
         xo0oztVduMrSUbYRQZNBI6cx+F1oOgmUt9s1nCeTO1oI89iN4ey79x6B71VPIDaAqwxb
         Wneg==
X-Forwarded-Encrypted: i=1; AL+hErEkst1D2icstVzPRtMKe6kqBwxrdHvLcLFi1Qa140ZoBs2p8CXFKm9GKSubSdeDuKZmj8PvG6zZBX6OVQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/M1y5sirct42sWfw3lCkidfjcJUEOoSb7p2PrZdyCHHeLPOMo
	12gtqsYaEVK0HKZBIYKyaLZFn8PZnKrga8Zye2m1Qd9yHSzMOUwgF/p1
X-Gm-Gg: AYBFou3xIwCdFbBY8micx/y8voWP3k1K3KBGRUSmUofTUwzuHw5kp4ta4COIa5ZaCNo
	lTTuYaNXgA5uM3hFftD8h+DxDKJ8gFsiyVtpehex2iQmncu8Q38XRC2CvvFIl3eCxoEhrcklxZ0
	DANg9h+dNVtCrXHKOYBsXnL1RnjRhjSwbGhtRaFwh0CEmpahb1dgcuzs1A7uOX+sm7BzB/m163J
	pVGQ4BIVvzpJ7BqgoEoKrTK/7pByW8uwRkQXS6oZefI03Zp46GGQ2QMfPqTf1C1OK9gS0v98W1D
	xIoOZl95oKPbvzAgXICBxeHqsf2EyObFwlnofMXoZx0rAcLuSKyLkwgtGqwhSqEdfJpjsnqIrLd
	br1MHIY8nPEq6Blom92N6cYP9a9yWXlTrq4aJCUDc5MyVNSh/0uoxqevR/T4l3LkF1eOHDHj0ez
	4SvWzipxTvUl5oy4DZI/1N1HGlOGfyHvGOTef4NGYzEKMgKD7D2Yw4/ilpkLkefnHeW0031xq1P
	I9zS5W2eKNBEhTwU+pR6PS7UJOm15uVakBW6Dnq9QU1vayDRVs9EOf+K2k9RhDMkEGMB/jf+pgL
	sQQNB1l8InPTrdNKRPeHFqaz
X-Received: by 2002:a05:6870:f61d:b0:485:d1ab:793c with SMTP id 586e51a60fabf-4ae46b8c334mr1051565fac.29.1794359938319;
        Tue, 10 Nov 2026 17:18:58 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23095c16sm2489357fac.17.2026.11.10.17.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:18:56 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 10 Nov 2026 19:18:53 -0600
Subject: [PATCH] ASoC: soc-core: start the runtime's component count at
 zero
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-rbrue-asoc-rtd-num-components-v1-1-fa0c9e0cb361@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqDQAwAwK+EnA0YW0T3K6WHdU3bHMxKolIQ/
 17oPGBODHGVwAQnuhwaWg0TcANYPtneQjpjAuzarmfmlnzyXShHLeTbTLYvVOqyVhPbgsZb5om
 H4d6Pgg3g6vLS7/9/PK/rB3kgbNJvAAAA
X-Change-ID: 20261110-rbrue-asoc-rtd-num-components-93a1b188469e
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Kees Cook <kees+treewide@kernel.org>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794359935; l=2050;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ISg7w++wXHyL53KnX6PWd5Fq+DoqRxUq2YHTwfGGjcg=;
 b=wbo217doE1MovnyyC6sTYiw+dP+3D+mWK2mBBMyznqJSZf1dme7lbFHchWw868o9OFxhx2Ggp
 PP6G+cKDim7AjA3kswBmP0IQsZkiRCi7R8woGpbbXASTnjxZ1KB/DIl
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

Since commit 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to
the devm_kmalloc_obj() family"), soc_new_pcm_runtime() allocates the
runtime with devm_kzalloc_flex(). Since components[] is
__counted_by(num_components), that also sets num_components to the array's
capacity, but snd_soc_rtd_add_component() treats num_components as the
number of components added so far and appends after it.

Every component is therefore written past the end of the allocation, and
for_each_rtd_components() stops at the first, still NULL, entry, so a
link's components are never found. On an MT8173 board the RT5514 link's
init can no longer route to the codec's AMICL widget and the card fails
to register:

  mt8173-mt6391 sound: ASoC: Failed to add route Int Mic -> AMICL(*)
  RT5514 Codec: ASoC error (-19): at snd_soc_link_init() on RT5514 Codec

Reset the count after the allocation.

Fixes: 4dd10fbbeb9c ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Since v7.4-rc2, every ASoC card writes its runtimes' components past the
end of their allocation, because devm_kzalloc_flex() now sets the
__counted_by counter that snd_soc_rtd_add_component() expects to start at
zero. On an MT8173 tablet (amazon-suez) this left the card unregistered.
This fix brings it back.

This patch was developed with the help of an LLM.
---
 sound/soc/soc-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 68b54e509b65..7b3d980ef10d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -388,6 +388,8 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 		return NULL;
 	}
 
+	rtd->num_components = 0;
+
 	rtd->dev = dev;
 	INIT_LIST_HEAD(&rtd->list);
 	for_each_pcm_streams(stream) {

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261110-rbrue-asoc-rtd-num-components-93a1b188469e

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

