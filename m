Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793097881;
	b=INNGIhgMVK/ODqCa3GhqdrucZYfkPsiN6a0gZ5Nw+7UBpQb9N5lwh9OjDvXqPhXz16cK
	 gIQ25SsFmICTUH9W5/7S3Jqk7BVZUe0GHIVOibXmYUrFRcymhlThH6lGCXj1AyFyEEqFQ
	 pkaTE4hNxqMuXjv+ZyD6mt4G0830UUUniBOjtWLROrfbmnWHVYwM/wLXN1GoyEKbgz+qQ
	 riCe4QwDTIEjeXxBlshPjwpzH33A8IjBo4W0k9CHL0pWQy3093211y7G/88F2vxHrpEqs
	 GWeGrNj1HaBCP4yKpjOolSqfjQFvSHMyrBpuDG2DpJlwkmm0KPdCv3gMiXZsIAD/Wpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793097881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JYHZC9YZVYbyd0GpVUY032a9HNdLCs8lkGIdhjOteQM=;
	b=3+WiYtmeAisNpLUQBe4gtwln54dVPeYzuWEBFAACNCNV5GoVQvFyrUgB8+Q9siBm2O0G
	 7ppaGyt34LhW8ZC4yOBVbiUNORsR0Qf8yTiA7THDiJn8EzBFtV22eKudLB/dtLMTAfQqs
	 f4AODYjb/NVJHi0fbZ2WvFnG1RIiJN2b4eDiWUf+ZEtXUrBxTW+mqCKUEUs0cgMo1ROfz
	 AHnMH3vU3CvujZB4HmuZ7mn4pd8YVVkTXh3LFyomSG0MNvldYHF2ZamVYjR/Wv4qxdveU
	 pUW6dK/sX6GAcipGsZHaFye/N8xtOX04K030v4OQS53medJkR5aOai3tDljbAMDB74Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=It63ys77;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF1D606A330
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 10:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AF1D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=It63ys77
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso22671635ad.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 03:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793097881; x=1793702681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYHZC9YZVYbyd0GpVUY032a9HNdLCs8lkGIdhjOteQM=;
        b=It63ys77sAnM6efQWVHuna1Of5OoB0aw9oMmpYvbun+3XsW4BjAazCVz6XuGYxdthQ
         R34fsxVHzXQmUXvNxJh/pv66C0c0GCtvKTmfTCNetR6VQb2/cEpQmvKZGIPUmUM2ODti
         TBlH4kB7A+OJX1GckjfiFP+/jJjJChXbhlh95RzZ5f/4IuYelGAPoDO0XVf3AYNK/FxC
         /RhEwqS6eY5EkPNJpcJXFZPD792hw7y2gluxarNGavJ4iWvgU0k4hNXZfi7CwywrcV22
         VbYmFOaOexnQhOEH8O+GE7OMzQVEvUInS2o8tR4YGhFpoUyNudfls0Bw0ROydO+9vVEm
         zV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793097881; x=1793702681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYHZC9YZVYbyd0GpVUY032a9HNdLCs8lkGIdhjOteQM=;
        b=UIPvbPi6GSrhp9feuFHPedNRlDQcS3edcl6i3JS2OLy8gVj4GuaV+WPgr7bQrzWnqD
         WMI+FYu/nqSsvokU9O8NAhTdr4z530CVMuJJdjKc5BWx4bA14GTf14W7YQpJZC9AuzO5
         tvvAgTQwPPfBIPJwXn0iPne/2AA1gmdX4UNjy41Bdt1Us/KuPrlXRbJXKW/uJkm0GCuR
         nT3h9rkL/TVySp4pNP0ldutxfseDnNEnbIW/sJ19mKhkELBoDZ9ihodvsXJRInstEBG3
         d9fNJbL9YDjZIpl1nvG9PDixCZBZLiNdusXN2o8O/izFYoUepEpvdlk8fs3tMuE1TXz8
         ANQg==
X-Forwarded-Encrypted: i=1; AKwUvByXuA4UFTbCmVgrokwczA13cwL3LOFPIMl+l6hC/6NPAkt2/i7K/VwkA/aGWUmYn6MG5qUHqyb3B48vfA==@vger.kernel.org
X-Gm-Message-State: AFq9FYK+9Waq7ipgC4a0fc6X9OlUdO5JKIUzIEPvMCux3a/N3CS4nbc7
	rjRAJ+umnWN51qwU6HOT4Smrbl25h1TWKqtGER0w2yslMgZxzvjVDXEA
X-Gm-Gg: AYBFou1hw14SGzEwTKPP/kiY6lCaKdAYxIwtoCaFb9grGPgaR4qGQXtbaui4MA913+5
	yjPKOhzeKZLTPhZlmRVwcORgOOoe7yeRTe63IK32xj/IqbA+R1ZXs3FAdC4RBr0c+qLN4yIdpkK
	G/tbF0rQE1Xov84i7KqN/fm4IMV/UhEPYqC2MF7x1EDu5vD55dznJ7+vF5FWPdAOv6H6fHSH/fc
	ZQ69J1YtVr0KyuBitIMPsUoV9TedskkDII2+ZuI3kus9ubm7rk0JjJIMSOkGFd/wrwpzvmeDy9Q
	DltGLnGsxZ3piZ8qwq/lYnKFXUevMnGV8e7KGZsCn7O0rWIV2exOM6Tmjs0TyzQkCH5zsVn5l+p
	1VR2ON1SoVKjuMYhAcJhOFOj4opGL+4+Ycfn/dTnbnbG4FFeGyIw3epMupoc3WELV4g0a9peTku
	mDpIRokcEVqRnWPaCoxmxrCR4KvR6mvwMO0Du5LWBUYgaQUrsLB7IkUpuYezFvBSntEIrOkxoEX
	+rZCRXiqJB4aJgcYXNUX4Cn4Mi3lfuPeQFyT1OHkkbCBgsR5s8uahk6HGMU6BCXptEgcMNEw7KS
	oeAV7U25gD0rFhKI6y+kOP01qi50SuiM6IXYbynLqDpgz+8erok/8wT3vO5dxod8eJEY2xA=
X-Received: by 2002:a17:902:eccf:b0:2e2:be61:a882 with SMTP id d9443c01a7336-2ea9c6c8bc8mr82214925ad.11.1793097880831;
        Tue, 27 Oct 2026 03:44:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6ca1bb2sm7187525ad.68.2026.10.27.03.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:44:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: img: img-spdif-out: Fix double clock disable on probe failure
Date: Tue, 27 Oct 2026 17:44:17 +0700
Message-ID: <20261027104417.7150-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027104417.7150-1-phucduc.bui@gmail.com>
References: <20261027104417.7150-1-phucduc.bui@gmail.com>
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

If registering the component or the PCM fails, the error path of
img_spdif_out_probe checks the runtime PM status and suspends the device
by hand before calling pm_runtime_disable(). By then, the asynchronous
suspend request queued by pm_runtime_put() may still be pending or
running, so the suspend callback can run twice and disable the ref and
sys clocks twice.

Disable runtime PM first, as img_spdif_out_dev_remove does. This cancels
the suspend request queued by pm_runtime_put() if it is still pending,
or waits for it to finish if it is already running, so the status is
stable when checked and the suspend callback runs only once.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/img/img-spdif-out.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/img/img-spdif-out.c b/sound/soc/img/img-spdif-out.c
index 39a37e4830d8..d93b3a135d79 100644
--- a/sound/soc/img/img-spdif-out.c
+++ b/sound/soc/img/img-spdif-out.c
@@ -386,8 +386,12 @@ static int img_spdif_out_probe(struct platform_device *pdev)
 	return 0;
 
 err_suspend:
+	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		img_spdif_out_runtime_suspend(&pdev->dev);
+
+	return ret;
+
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.43.0

