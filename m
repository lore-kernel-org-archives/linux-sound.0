Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC47E3F1AB7
	for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 16:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784995450; cv=none; b=iIAFTHSa9IEJgjwfxPETd/jMjhLZWR4ucpRDFQ+x5TOWfhYdwJhb5hQyrataDePl0ll55Z6sEXQl++iJR/En7D7701wviXRbgkJ9avvG/IlcoEAwElV3qjoLS1b/AWRs5ZdTdI6riMJfAkidL9w4X8q+w2ENItGyKOhxEQv2VQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784995450; c=relaxed/simple;
	bh=jKNau2Jp3w8kXsZXkN2dT2k9Gfxstnz10AQQGpZh7t0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAnAML2S+lbvgl9p/GeNthsRYY3y557wk2vDM1PxpRWyP2f7S4JFun6XXop34sEhP+Z6TnJJZyGni8ds0CRzs5Xj//W4oQtaSupJFr7G8Q4qhNAwJDddob4IhbtjEdih6pUdP7YHnilQ6imwV7ICyvVy+DzaCFbtx9xC0psQLdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIP5nY9s; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIP5nY9s"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so1027855b3a.1
        for <linux-sound@vger.kernel.org>; Sat, 25 Jul 2026 09:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784995447; x=1785600247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b+iaDxI8w/adsDf0nAv56q2sZiIDOJGK49M5xG0vhiM=;
        b=dIP5nY9s0ZqD7zMp6n+lp03bQF6oUKNcdDt/WGGQcgYMp/0LJz1n4SxQOETkAhrxWX
         JY8pI5KY4YhbpxQCBKO93cxAPEB6L21bbGDbjhX6SuFKr5O3fYtNWAE/g3PQP2xT5jSr
         +ulglEJKOaODVBpnxQZVcc3doIeYD4luWnkvm/3b3UDtXM/RVN7WA5pMUdEYv6q6VX4u
         gM8pHWLb6WwewovlXgXgr/vA91BFu/69d7vIBwWxHKs/R5hXaiMhIEetKc9qpQOda9m2
         0R2MOmak/+O+pPtvJ02cR3o0gEIEy0V6MPksnqLUnobkT1B/Zkdl8jUyUmVJZkj/NSLO
         jKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784995447; x=1785600247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+iaDxI8w/adsDf0nAv56q2sZiIDOJGK49M5xG0vhiM=;
        b=qJXIb4xBeJkAgRZ9vaSh+agY87Ntmy0jv04bBHRSmJ79vaGfTsym0at/hh9Y48O6b6
         bbOs+mPvijXsJ4DwH4lgivJisXWx9qyqH7ZcT3n0WuAZoesfgISmTogqyJCzEqHZNZfJ
         JN+gdEOLVxd3XoPxl+oUOjbh2pHAOqWM3T/Ra7OYxYW8f2dG8tCtNXxgrpfUAW4gCjIi
         XNjtFnHf2WQtE+14Nfx5wV1ySMwnxdd223CHeMRPtqnp8uNT9Gcoi0hq99CinjpMr5Oj
         y6cdImexHN0E13XzmE+fND0uUBMDOoVXPQOzortrmmIRR6gvtDWSdZSOFLODOK+bLUPs
         zJDg==
X-Forwarded-Encrypted: i=1; AHgh+RqZRnFLi5xxU02+dcoGFraXQjXpXpUlTboXSKY9VW6c3VP6Tazocqc7piAW7ZC6TtGRy0OspOrRD74ZGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrAZjKvBETs8smkfT90311u766C1M3qRtGWXzXkHkyFnFBIAeX
	PVy4/Rks7zCPqVlJaFQIvuvhYTdvY752JeWwkt6FSSKMjNH5ag6xlHNp
X-Gm-Gg: AR+sD10HY32mgxrvyrgxYZjzA7HfKm3LAOpXlCb2cnXAHwPM2iIQNLRGTbS7ZYTswOo
	D0+M46FeluWMHdXl7kIk/isn64v7Mm7vAJ6RHXorK9gczTUKtOMl4XXQH9cBpH06mMPmhqBMI1V
	YZ7mVNdJeI5PxRiFpyYPz0r26z16sUpvtF2w4w3Hni58nM86MiL5FKRxu+PEliEOC2vK46gPk4+
	V74fV86eMliwITlfwDp5svBCDANUwPqyych+u0P8il51wgU6ZkwYC/9dhXTkVa0QbR1IEBa4eQI
	CyrxFlX0X2UMnG/w5Ti+VNq7MjaBcYgp2zbJlI7LeVCQ2wPO4yERXg8nCqs/6q7ASOkrzxB0mE4
	UhCWLpffZA4FyG+lH0ZhXBjBybQ6S7HNpb+0EX/l7S6/GB8vcOQGkLpSWzLYsAhXNL3BJ9hOGW0
	1mvNztcLk=
X-Received: by 2002:a05:6a00:27a2:b0:845:cf73:c1d8 with SMTP id d2e1a72fcca58-84e5940a882mr2082288b3a.14.1784995446789;
        Sat, 25 Jul 2026 09:04:06 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341d8f0sm1171554b3a.44.2026.07.25.09.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 09:04:05 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 3/4] ASoC: samsung: smdk_spdif: remove conditional return with no effect
Date: Sun, 26 Jul 2026 01:03:42 +0900
Message-ID: <20260725160344.916838-4-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725160344.916838-1-ekffu200098@gmail.com>
References: <20260725160344.916838-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 sound/soc/samsung/smdk_spdif.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/samsung/smdk_spdif.c b/sound/soc/samsung/smdk_spdif.c
index 2474eb619882..515e4dfc1432 100644
--- a/sound/soc/samsung/smdk_spdif.c
+++ b/sound/soc/samsung/smdk_spdif.c
@@ -130,12 +130,8 @@ static int smdk_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	/* Set S/PDIF uses internal source clock */
-	ret = snd_soc_dai_set_sysclk(cpu_dai, SND_SOC_SPDIF_INT_MCLK,
-					rclk_rate, SND_SOC_CLOCK_IN);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return snd_soc_dai_set_sysclk(cpu_dai, SND_SOC_SPDIF_INT_MCLK,
+				      rclk_rate, SND_SOC_CLOCK_IN);
 }
 
 static const struct snd_soc_ops smdk_spdif_ops = {
-- 
2.43.0

