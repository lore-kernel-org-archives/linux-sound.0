Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E459419305
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 12:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009228; cv=none; b=fcFQXcgLAkPkqbrGITSkQ5Ne8jULRpnwvyQtsQCFLqTwPXYL0qJCtDFKMCKAFG2S4FwoS031gcvWhqxkRL+hbzohRNj5C309IDpExGhiJURqNEZOncfleg2rosB2jsu7cjlHbuiTUmJHhTTFWjk7sbhV8YzmugSZVAiN8DMjzds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009228; c=relaxed/simple;
	bh=vmpPHzWQcVKPEyter5TRYy9rNPMmYOgmdhkqsB+Z4QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZvS8Yz1zg5jyDg4f0ljmy47g7ZJZIrWSVsMjf9qHLHY0PBYbaJKZWtViXfXNL13DViGKMVR/DxlsVBz+PP9o6NzbBXvQ5IOyA42CR3JEJm3qr3WvVyH0yp0NU/zhpejh0ippgUbzS/2oeNWpAIEeyi/Ov1iKYTIVXiwSj9w3dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbA9x+9s; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbA9x+9s"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so34119625ad.1
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009227; x=1781614027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TISoh0w7BDB0zbR5ef9JxLmIW0ux+sRqbIVLhaxSqQg=;
        b=LbA9x+9seDdhI0vz7BEA7oxGbegNymDMWyqfWIaI8Eg4wM43W6g3Ca2AVfA3wR3a+g
         cJa4T/tS5vRJ8wqL+KRWZjViDXEFDBYGEfeMb7x2GCfponxVs+w2UPpgATRXutns8BRB
         dkkhcXZnjaPY58Hq+OVO0iHSZn6F/munVS06sUwdcmEcZHapXHgIJvIpmmGJsd1Yx996
         TMMDgTs1yhNh7RxgvmlcsecGMqVhU10N8/D1NHTvbogdryd273tz+1AZnoDMp4ZXY+hy
         K9+LFkqpfQPHhANiymtyd68qqHMja0M/4IdPRZEO4cGFMXYD1Rv4Xe8+D7j2NDd1NXBo
         NR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009227; x=1781614027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TISoh0w7BDB0zbR5ef9JxLmIW0ux+sRqbIVLhaxSqQg=;
        b=FBBSKXr0DsK6RQyXT7nUTSQCX7JFxyso06k1W8EMTO2bI45uIC1p79Vtto6ecHikQX
         Y2zsXo3lpKuOdPG/89ZklnyVbq7AUtLIKqRMCp6cMkL1rDxQVxMQsqYHSF5r8NtZc7yU
         qPDt1WVSCAad7fmFRgoR8q3+qY8SQQ4F8WLgQOi40oL7MRJAoabqq1R2q/qc7juoet0m
         L0rcIm3mcSFUBNgPYnKjuVry9UkEUDteFuWpdh92ITcmA5slAzLxxGC54+lRPU72dTi4
         7w/SPDPGKBh1+hs9dysMyAQVZVIroHGOi07SkJRfhsbwf85l1eCKappDjJaED1IXxCJU
         onFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kOWYNR0u/TzcDhW62B2WSziSHGC2VNuOpfpQFh+PUjlawaov8WX4RsIlh2YfyryWuhEAnBf7nRhWgIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcAMex6rpercIp639WG6a1Bri1J3pYNRKDhz9YTKnrtEmqqzL3
	2iuH6Z7RP+4yckhEEY3yocDpamgx8VIfO6yvPJ32EvMalOyzjUbzJC/e
X-Gm-Gg: Acq92OEFnOdcO30sSM7OUJ0a96iwSOTFU7rHxOURSecgFmSpfjoUGD2joVP1OVZN/pf
	gbvruhCyICCovNN/mrkdK4w2iYee4ybxHpJQMie5+3Aco7vDpOBkHA1LdSY8XtlgnsjXKBwFq7r
	eDCMjqMX5wA3OuSHZk2+3bH7OB5Ryn8bvGYqoBKdZaLut6xGmoOuFKOZHq5OVvjXjjCzUNRFXZl
	iocqhYpOy/qs1qWQRQuqb15fyzkxJaMJo92oq8Ben1gri/alSUKdtSBxKdiwaMoPFlwbqGcDI3p
	oVRfQpcvjG/OaPYRL3Et6bdN4Wb9ydPQgeu358uwbyEx1bQ4+NV4eTqh0w1nD8raxm9jaLM5ptm
	uq0w4iwC7p83bwFhT9ihDa24pSN+TxSZoyGU2qdhaGj4tBUPQrVIkop1A+8QniG91wUziu92ljo
	rz0HgGcI5E5ASJklUcVlocr4WtqeOkvjM5qr6EJ9gFnz27aLdATAETW6WzntKCSr9WwfFQFd5Dm
	Rpah1ATG8Y5lFIE0TnRMXIi8kU=
X-Received: by 2002:a17:903:94d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c1ec508177mr181898005ad.7.1781009226863;
        Tue, 09 Jun 2026 05:47:06 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d40asm204686345ad.64.2026.06.09.05.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:47:06 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sameer Pujar <spujar@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH 4/4] ASoC: tegra: tegra210_ahub: Validate written enum value
Date: Tue,  9 Jun 2026 21:43:16 +0900
Message-ID: <20260609124317.38046-5-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609124317.38046-1-sammiee5311@gmail.com>
References: <20260609124317.38046-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_ahub_put_value_enum() reads e->values[item[0]] before
checking whether item[0] is within the enum item range. The existing
check therefore happens too late to prevent an out-of-range read of the
values array.

Move the check before the array access.

Fixes: 16e1bcc2caf4 ("ASoC: tegra: Add Tegra210 based AHUB driver")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/tegra/tegra210_ahub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index ece33b7ff190..efc8f3388668 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -62,13 +62,15 @@ static int tegra_ahub_put_value_enum(struct snd_kcontrol *kctl,
 	struct snd_soc_dapm_update update[TEGRA_XBAR_UPDATE_MAX_REG] = { };
 	int val_bytes = snd_soc_component_regmap_val_bytes(cmpnt);
 	unsigned int *item = uctl->value.enumerated.item;
-	unsigned int value = e->values[item[0]];
+	unsigned int value;
 	unsigned int i, bit_pos, reg_idx = 0, reg_val = 0;
 	int change = 0;
 
 	if (item[0] >= e->items)
 		return -EINVAL;
 
+	value = e->values[item[0]];
+
 	if (value) {
 		/* Get the register index and value to set */
 		reg_idx = (value - 1) / (8 * val_bytes);
-- 
2.43.0

