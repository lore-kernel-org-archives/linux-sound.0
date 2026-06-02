Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BC53C73EA
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 10:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780395425; cv=none; b=X8iCRibfMufxjGo5mL9MUZOSlEBDPoVlrGmxlYFm3GDp8UBYhXe/PRpMhVvnGpzREp8PB8NTvYBuwKo9TY8bFKi4hvVw3w37wTqLhsfDJQkopdcu8cOlnTMsqyafIDoRhgpXkSJbC+pokdpg7c3t1So2l7SFFHwC4fnFbdKeCx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780395425; c=relaxed/simple;
	bh=FTgoAa+xu/joTesi8Jf6xXuDhGFQReh7G4WALnJ4OLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fJybxf4T66fPpnxMLHLTF2VnTkSWeuVFbEY6RiXJqqw8zpvwgz8qv3YrqeozcuNtncRTX+PxU1JgVeDNNp9z38uJqLWaAw21WCb9R8smtDwnIUuVBJYSaBvUAxZUjDQUBZxmQ1Pr7ZXB4NGJhYzDO7GBanJzZihN3wtM41kbe3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4w3B3nd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4w3B3nd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so12394895ad.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 03:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780395424; x=1781000224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lT+JLRZTXmUkizcf52XaQYhGVpogr5HSaG3W4C826mA=;
        b=s4w3B3ndAsTBMJgGpJqRtyTgA8iCBV6fHNIWsezzuCsvkeh/o6FsfvDPaBdT4g1f/s
         VOoFrenophzfqWGpU2BJXOSoEolOutg7nhwGOLtmWbfeUol+u7vkTOL/ArZBJhJ0pz5V
         AMOFuFuzjh8sDHnlKti8xEKAKUl3XH1Mxh/m/Lvn31SoLsZtaVoPIu1gi6znlYwUe102
         rsFKtT70FVJb/2h3pjrNm4Dm6oUdJOtBnyu6KB/CHXBxfmr6nFXLHvIr53kRTLYLWVUG
         2EswZi0H0p4hImdROVcCX7psy5CgqKNkOS1MFvG7J4eS/YHhW5d8h156LQkYRUDAEw8h
         6pMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780395424; x=1781000224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lT+JLRZTXmUkizcf52XaQYhGVpogr5HSaG3W4C826mA=;
        b=sZx6D0nQdb4fNvnYJO9XTZ6Az13jcP82aTnyl+vGc8VRL+ktL00z8Et1Ew/cO1lzeX
         2GHZswTPsDxo9+XXWrr7r6PUUxH0g8MIn3LnqrDt6cb1xDdRmkO96Q8qmL87kfZFvtIW
         +chHjB0z0uOwsW1mv6J0ysTc+PdpnZAV+pH0h1dIqJ2mn9bYdvXfHiLkksqavN2ZKdk2
         eAFKpaMnVi0csYgs9ibKirAHFrjKe4dRmaZZmhgy5DNNVrWBCg9LTVQMUNyn7a8OTLfm
         N87SBC4eG0jbnIszAgAR1SqVyQvcrm2vBiB0+hZdotDn7ZR2W01w+FMcr3FRVKV5g45W
         GoKw==
X-Forwarded-Encrypted: i=1; AFNElJ+J2bnxMEMEZ2KUg+RIAhEdwYR7SjHd/7lpO/J8oKSWEdU+XtHJ1e1XhdCbqnFBlqkXvth37v/b8wsO9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGtG1dSY4w/7VDs+iiaGSH1fNgi6K0kKvZYMEXiM7szjepY8t6
	ouYNdMDW4NaoNkcZEGDKXCawg8efb+RH2+n+YMZtammCVL49s6vAjT9J
X-Gm-Gg: Acq92OHY6vxFH6fyqTfHgOdM8GXo4ycLkTmoF0Tyy157annC7VraDN/gd8sBB39L8y6
	c1zRYpzahsJwPHYTGuYH93ObGHHyrIro5T1/9bU7mFb+YRm17LKw/cuZs4SGRTnA+BrCztqwieC
	Oz0aMFMuY6RjVQb781e3sAJquaXGkqaYHbwONJLJ5N4NYzA+czYMuNKJGRG9WMu3IFDmIlTEU/x
	Nzz1Tu5MTpnMVA5Y+1lIGLajBVPtDusyoDubND6p/ki7ZrYoXyREDK8v/C/i3OvJnC/hbU7Wihi
	ompPy1NpE3mwYAWtJhz7uzklK5aKWipJZGWmrdFGJhvISeMNQsTktWRZ08xY49tHD4ja3VQ9dQh
	IUHjnDSJHz1dDeo1iP/ALAJ8PN4n4IPihLUBLzR+u8j1VZ9e4Cb9/zwdLrDXWXoyELlkDFepIz5
	bISTD6LPBDun6Ni2YoAme4/jXMUiS1DcXkignigXcmXKNMJ7ZGNIh6sFL0ptoLAri6aabn
X-Received: by 2002:a17:903:3848:b0:2c0:a4c3:d7a with SMTP id d9443c01a7336-2c10ccfb095mr31503255ad.26.1780395423749;
        Tue, 02 Jun 2026 03:17:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd84fsm132766305ad.23.2026.06.02.03.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 03:17:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Heiko Stuebner <heiko@sntech.de>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko AI Review <sashiko-bot@kernel.org>
Subject: [PATCH v2 5/5] ASoC: rockchip: rockchip_pdm: Handle runtime PM resume failures in set_fmt
Date: Tue,  2 Jun 2026 17:16:08 +0700
Message-ID: <20260602101608.45137-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602101608.45137-1-phucduc.bui@gmail.com>
References: <20260602101608.45137-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

rockchip_pdm_set_fmt() calls pm_runtime_get_sync() before accessing
hardware registers, but ignores its return value.
If the runtime resume fails, the function continues to perform register
accesses while the device state is undefined.
Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() and
return early on failure to avoid unpowered register accesses.

Reported-by: Sashiko AI Review <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260522110302.349421F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only. Please help test if you have 
    the relevant Rockchip hardware.

 sound/soc/rockchip/rockchip_pdm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 8f78f7bc1806..115e90d3bbfe 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -321,6 +321,7 @@ static int rockchip_pdm_set_fmt(struct snd_soc_dai *cpu_dai,
 {
 	struct rk_pdm_dev *pdm = to_info(cpu_dai);
 	unsigned int mask = 0, val = 0;
+	int ret;
 
 	mask = PDM_CKP_MSK;
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
@@ -334,7 +335,10 @@ static int rockchip_pdm_set_fmt(struct snd_soc_dai *cpu_dai,
 		return -EINVAL;
 	}
 
-	pm_runtime_get_sync(cpu_dai->dev);
+	ret = pm_runtime_resume_and_get(cpu_dai->dev);
+	if (ret)
+		return ret;
+
 	regmap_update_bits(pdm->regmap, PDM_CLK_CTRL, mask, val);
 	pm_runtime_put(cpu_dai->dev);
 
-- 
2.43.0

