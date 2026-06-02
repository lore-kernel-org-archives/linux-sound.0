Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9F13DCDB4
	for <linux-sound@vger.kernel.org>; Tue,  2 Jun 2026 11:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400708; cv=none; b=LgfPPLm9aPpaI/N8CqBuqkJnd5QfOI/MdB4k06nzq/2IMwiaf/c5/aTMdL1XCmNcqSWWKrMW7XynvsEnYqfCwBYR01du+aLSXMaiu9tdLcSegAj3AQeLJab4Peq16hi+9u6Q+D1LNsa0Gs3QLrONRGm9bxsMQFOCcBbFpUSJFMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400708; c=relaxed/simple;
	bh=jMX9mnAoMrDWCHNf1eDVHGV/w2HaBRXDp99gKsHpzSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WsA0114FegKf7mu3Oy3gE6f/38sNASnb5gVxDWWRT3UbYQW5vWFUy1PglJNAg6P9OiCea3C0Vs9qdUZC/vAUk9D/mtKTKyld4iXLWQ52VYvYnqzTAaV/Z2yivlJZdw4q1mLhOGMLXlcSewnsUjQJu4AV+AUgIFUwWIC0Dz0m9vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUcWbCZT; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUcWbCZT"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84232e83ca9so1077286b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 02 Jun 2026 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780400706; x=1781005506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnFWVx6VWhxeKMY/FKRW9Q1g3mwhdS1r25okhPrkiNY=;
        b=QUcWbCZT9ic2o8FG+3JUleuQWGpuTpwgXVsUQu71MzgVKM8rMcKHkkZL1kuYPXV8c4
         INg9fan/LlT+NX2w44i9StxtfpAS/6iAY/FujR1k88Upy8SHZbZLrJrjjFMNysFkkPNq
         7y2X6zNtFP+QWX4wPqJdmdsKjqVqgHhiu/Hshv3uGmGXIFnieXAFAs5KrqBCR+QTgZcW
         5VeC84pL1hwGs5D7vJV5W6RdvjwDXHcxyrUah5HpPh1ubX7gCgYhyqQgXng1k+Uy4/F5
         Rl+JxyqkEpjFHvDzIpLf3Zg+1euIMnONtxUxwyOXB/mvMcx0JbU13X4//mEtQjcFJsCr
         jPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400706; x=1781005506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bnFWVx6VWhxeKMY/FKRW9Q1g3mwhdS1r25okhPrkiNY=;
        b=RKSVY/uaWfkyaAhXx2sIigyXnTmIWZXaZroZYyltomw1F0vc2bbr/A4EON63R4kV9z
         6Syx+95RxO18QzpbNzM2HLTY0mzUMVY/mVL304WgRAQ0s4bpq4+P12fCJjdzt7xFdGQh
         vlTu/pFGe+cu9z/mGc0XZKOeDS951JlI1lg/xUyEYVZvMaeteMLahFsBvcERYRaTg94z
         lKtX9rvbN7F43jdjM3Yzg4TfdUEqWI2c2V2iGTl3InmzevjWeEV6Xtqwr0IZq6UZEMva
         cSQsyER45XzuXaSABSG5DYec5yCPch7AQ31XKEc7gGKgF7hft3KU3piIOjYPBrnzDRP0
         Wt5w==
X-Forwarded-Encrypted: i=1; AFNElJ8c+GrPLyQqAFFKExYMfRLoAs9b6SqwFi5xjETN89gVE9UN017GOmEjoO9bsEGWtFbK2R7ubY/4oVoujw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwczrBbjwAm5iTiQLTiuMH+lKA1FX5wJ1sYZ2WYwu5TOXuQ8aXc
	27T+9DfTsLUawAl8TNqq6At35QNA+pPZMukuDY63M8xD+ChIrlRFs5sH
X-Gm-Gg: Acq92OFqeLIZRVKehzMNyZvQCDRu0RQmksEl6Z63BaVi5EE1fYUC/M+XaHVfJ9uFnb7
	tmZY41NbRuVeMoDhyRIHIpVe92oztHZkcovOdh6FVO8UIfHEQ8nyZWrhpafNUNlzZJOGYdC5y6j
	pDpNA6fGyun+YzkBSl08uvtM0OKs9LiNBkkoVBz0yrtW3VbCZOImmb/wmuDOf5Cb6MCn4n6I3Cm
	CW2cZRveF5ZXwzma2AwcnJH1HQKXqUDzJNO1FSFKdDuGL4y87jHNHX4+u6fS55WRQzVZVN49LTv
	8KJVIyKNSbGeX6B+WtaMo+2fneuS9HZuvFk0knAaNI6dNVgwFtkbMhUMT7P2OJz2+MxpypGTSZ7
	nUpUsVPTtK8vG8X9xnf8bYa8XYIEohaeO89j6Ud4oRk9rH/+aljnDbbnCA4nCQShqXeKAZvKBoM
	wbNeV+zZ1C5dzcsX3g/YbtLP9rFVwda/rugSiAjZ/s38RUQtkehirm1kgSGsDw4gih15JZ
X-Received: by 2002:a05:6a00:2d8d:b0:842:5b85:63a0 with SMTP id d2e1a72fcca58-8425b856f49mr6797766b3a.46.1780400705444;
        Tue, 02 Jun 2026 04:45:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842263539a3sm12025224b3a.44.2026.06.02.04.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:45:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Chen-Yu Tsai <wens@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko AI Review <sashiko-bot@kernel.org>
Subject: [PATCH v3 2/3] ASoC: sunxi: sun4i-spdif: Resume device before kcontrol register access
Date: Tue,  2 Jun 2026 18:44:36 +0700
Message-ID: <20260602114437.50324-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602114437.50324-1-phucduc.bui@gmail.com>
References: <20260602114437.50324-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The IEC958 status kcontrols access hardware registers directly.
Take a runtime PM reference while accessing the registers so that the
device remains active for the duration of the operation.

Reported-by: Sashiko AI Review <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260514043314.62222C2BCB7@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.
Changes in v3:
  - Add Reported-by tag from Sashiko AI review.


 sound/soc/sunxi/sun4i-spdif.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 89eccc83a130..f54eb14c9ed8 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -428,6 +428,11 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
 	unsigned int reg;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(cpu_dai->dev);
+	if (ret)
+		return ret;
 
 	scoped_guard(spinlock_irqsave, &host->lock) {
 		regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
@@ -443,6 +448,8 @@ static int sun4i_spdif_get_status(struct snd_kcontrol *kcontrol,
 		status[5] = (reg >> 8) & 0x3;
 	}
 
+	pm_runtime_put(cpu_dai->dev);
+
 	return 0;
 }
 
@@ -453,8 +460,13 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
 	u8 *status = ucontrol->value.iec958.status;
 	unsigned int reg;
+	int ret;
 	bool chg0, chg1;
 
+	ret = pm_runtime_resume_and_get(cpu_dai->dev);
+	if (ret)
+		return ret;
+
 	scoped_guard(spinlock_irqsave, &host->lock) {
 		reg = (u32)status[3] << 24;
 		reg |= (u32)status[2] << 16;
@@ -479,6 +491,8 @@ static int sun4i_spdif_set_status(struct snd_kcontrol *kcontrol,
 				   SUN4I_SPDIF_TXCFG_NONAUDIO, reg);
 	}
 
+	pm_runtime_put(cpu_dai->dev);
+
 	return chg0 || chg1;
 }
 
-- 
2.43.0

