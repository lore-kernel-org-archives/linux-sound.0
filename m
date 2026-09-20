Received: from mail-pj2-f23.google.com (mail-pj2-f23.google.com [74.125.227.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2373CDBB7
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880157; cv=none; b=Sgn9DbLSj+b9EYrcQwITbseB9o5OrqRjWpQBF8dQL9+LC02wMgSxh2OoY0LkluRfxNuNruEBwmNJ9zqzxvds1lc2YCX3+q2pUkhGi2fU4fh7VDyE2cHdMUzxPVuSE44jB1EK4hrAcnuUBZWcuAVXap5x3AGWS2KQ2UvVZ9rICjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880157; c=relaxed/simple;
	bh=kx5kKJMfW173nOCJWUzv3mwvx0YJN3LDcuLBMFQLo60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sYLKghx8obZMkTU1O3wa6wpLjfxa4SbBbosPc2X2K4KUCdxyuz1F0Vx5LUKYKvAPZN0uNAE/b21n4PNvPVUmWW9BHnCxDzrtetE7SaWINIUpNOCIDtuDJldReBWrxvLf2K6yqwwGsJ2EGXXONXjf8THQm8Hd/UEhD0dN3ZPWhdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDx703Jw; arc=none smtp.client-ip=74.125.227.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDx703Jw"
Received: by mail-pj2-f23.google.com with SMTP id d9443c01a7336-2d747f066d8so6962615ad.1
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880155; x=1790484955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzyP2lP6mDo2Tguvti7VeQ501kHVG6IAx4yYOdJMaeY=;
        b=ZDx703Jw5n9A+cB5JIm1R79QkXxX1uF+Y4r8oUiS+Covuu6y7I9YfLAd9PlAGrcmGo
         os62ngVc8/IY2im4bMS9kfQi9khboUaKnznuwey31ryD7FzMj/wYZQ5yWBPfxSnSngip
         iQ5S7XqruYvCFAoLYo1ujnLn907PVIDG+n//Tsy5MhpeRSOCXFPAQjPh5tdcPB/n6GAo
         yLcm76phAkz1uxeBbjIwT4U96Bmq+4sGP6aTledyeZ2WBAU39LGDO7bee5y8wqXHqZTp
         fCTw3uq2OZXdUIILZnWNZ1WAT7DaZEClQpQf8aWYl5EBMEw/Z0MqRy3ePEN19MSWxrQi
         k1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880155; x=1790484955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzyP2lP6mDo2Tguvti7VeQ501kHVG6IAx4yYOdJMaeY=;
        b=YUKomka7CGe7DLjJb880FC6Aba3gjSTtZqX5F3BCCk7CNZl05rKJExvaSWD2xloNy7
         58wbo1OkwhBT0IoxS89axDA4k/7tfvbaxznPGdQqjGSch496VKqI2si15suXgrZM63c6
         eIosvKKziReFEogkUVXETXWv72b7RGZfnXYN4GOeRzmhjr4nXzbZYkLyejUa/bA657pd
         ZFkItaNwcuEHmDcIGnZmhDO46lzLDuxjF17PoxrXVmuiNwPGz+pXUtmGTKEJf6t3Sj93
         mga6upUu9ghZFeD43EQ6XXlP5SRcD5wL9PFU374p1TweuP2cQ6HNoTHtVjXOFx6GE3CB
         h2bQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxW2K67pqbv2JZlWWeIMuag2POwjJEyWqe5JGlSszrLNvWEpILp5EW8yK5a4VdN2aplXGQz4qJ17DeRQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mXKdGlNppBvNFXatDc7s4XElcHG7kUGI531qqGB59EfRJnM49x
	tZ/owRBuLkUoiAlthV74XmKu/CIOrMOl6ave5zwl2vUZc2BHyTwsYcj2
X-Gm-Gg: AYBFou2bzAeCAsjpG87uyV3Lh1CoPEK0g1K1B1FaTaqCZ4dQsWMVHzyiWLO7INI7e0N
	rbqKFJO/GScp9Xg5SbDZZFDjPFrcSHlzya/QO8X/QmffZJl04NNbaDkfnAeaZZLVuEKjj2r14No
	lkeCcfeQNLhhDn7QjTWwJwljy3R/oQvvqG3cGSmhE76UtUUEziL/If8sY5A68JTV5iIJ97AaEJ3
	4cFRafNbe6/d66TKCoK6qguOzqhbWz2qVEo/kkaNGxgvk70n/s9mOeJzxAQMwGI75q0AdBWloSo
	UmfqK7I4IHjcNvPYiKe0C9MwV6rDt+gWHQGJF4HoTDQ0M1fwHW8FZZWE22uk8O+/krx+Zew7xki
	CLUwOyQnE8id5E5xvw72jZyHdDULlCcfMVsnGi9VzNhYblXH9HZod9bhg6H/X+VXIQ81GsTDrCL
	W0ieFh+zcG/pPlOzu5ww6FieUCs9IHbSlp+m9rWCHTmBSZo0K7Nk2eFdBHD8nKa87xMYMpXx2zR
	MX6MO4TT5UYVIL36LyW/B88yA6Laps4Hdhjm0kvEm1xWs10S/ZoJQGl80xom0Z2DKzQzRs3kErZ
	opqBLSiHC0fBS/6vOeYfEY1gb9ES7Qb6tisEmnQsROnEy2E=
X-Received: by 2002:a17:902:d2d2:b0:2dd:ad73:5b5a with SMTP id d9443c01a7336-2ddb224f33bmr80978895ad.21.1789880155541;
        Sat, 19 Sep 2026 21:55:55 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:55 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:44 +1000
Subject: [PATCH 05/28] alsa: pcm: Remove the qos request only if active
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-5-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sB9amKGCujymCV5dzhnXLQgtXCZDFSeONKc8RiAMJk8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+UN5p3NCRDcX2rwtCeY+U1o1BqxOV9aeCT2Pg2+s
 cW76L9px0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKojPRn+adW6m8+Zu2WmcdojE37fL2mVgR13MvV2nf3JeWLWmeYpRxj+mShcjNp
 sw+Q7MyPW1PitzbHnSd8+notYbJv1bMt81fmGPAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Fixes warning:

[    8.502802] ------------[ cut here ]------------
[    8.503445] cpu_latency_qos_remove_request called for unknown object
[    8.504269] WARNING: CPU: 5 PID: 2790 at kernel/power/qos.c:322 cpu_latency_qos_remove_request+0x48/0x98
[    8.505499] CPU: 5 PID: 2790 Comm: wireplumber Tainted: G        W          6.5.0-asahi-00708-gb9b88240f7ae #2291
[    8.506777] Hardware name: Apple MacBook Air (13-inch, M2, 2022) (DT)
<snip regs>
[    8.519099] Call trace:
[    8.519402]  cpu_latency_qos_remove_request+0x48/0x98
[    8.520027]  snd_pcm_ioctl+0x86c/0x182c
[    8.520519]  __arm64_sys_ioctl+0xf8/0xbd0
[    8.521020]  invoke_syscall.constprop.0+0x78/0xc8
[    8.521604]  do_el0_svc+0x58/0x154
[    8.522026]  el0_svc+0x34/0xe4
[    8.522409]  el0t_64_sync_handler+0x120/0x12c
[    8.522951]  el0t_64_sync+0x190/0x194
[    8.523408] ---[ end trace 0000000000000000 ]---

Fixes: 5371a79be97c ("sound: Call cpu_latency_qos_*() instead of pm_qos_*()")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/core/pcm_native.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 6d32c12fb79b..88c83e5fd6cf 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -971,8 +971,9 @@ static int snd_pcm_hw_free(struct snd_pcm_substream *substream)
 		goto unlock;
 	result = do_hw_free(substream);
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_OPEN);
-	cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
- unlock:
+	if (cpu_latency_qos_request_active(&substream->latency_pm_qos_req))
+		cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
+unlock:
 	snd_pcm_buffer_access_unlock(runtime);
 	return result;
 }

-- 
2.55.0

