Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D523EDACC
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270847; cv=none; b=qMLz71ugiJDYeQaeMkCMSQyVHZaV/mTxfNi+x11Oem4K+cEz7Gtyvd/0j/KiwWF1oCcXsok8RrCMo4g4eTYfb+rrwPJEMoz/5UN03vSsH4r6iw40Tm6lkiQggVkNXmp1KrOFlIOff6vYTudxX6+xqcMW68RkDfGS/4MgJL++Zwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270847; c=relaxed/simple;
	bh=AZ44qVbwhbS1ciYLL9/k/0g6G9OnLSH1+z05vvyIPcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b4967MepEjlQoo4OnW84Xu0HsKP2Z7sog+EDIVjyRslOYkRgaMrYYbyklzYWqGUOVFWCPy1laA75Opx1diA4APLGkqqqLi+TNfdfYVN77m9Tqz/7ELmwOvlQwF8IzfZNJp803K7mUTxvwvGEmHCirrNxxXP+wC4qkh+5iWrC5xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfPw7ecQ; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfPw7ecQ"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30759632453so2066217eec.1
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 06:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270845; x=1781875645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOhKduHvhhi1//fmQnUUQw/ZgnpHeWjfQ6tgKhPwSdc=;
        b=AfPw7ecQAKOsepGTlFQJ5c0mtbgi0ALHQR8fshCKsiK5Zrke/inHm7Vipr5iqChFKf
         ZbFDcihOD3zhv83gnccRq4kHMbliBj/qThftBdEBhgBBjwoUAjkbge7eQZKwCeRiu20Y
         qAI9g66czlAT/9KrtZ4D5CKt5I+ZUUeiFu8I/WvDj/lc4SSKQFwvOxe9+kSoUU1vFN+h
         H7ix87KvJ4T0HzQpiZqMVgqUbK5GYcj77L3jRh79qfx2rJIGVqWFV4bryrW9kfPXrvVE
         ba4Cv2ti8HnLgiFgywN+TXTd1EllJQvvJlIS96Md/pL5XFGMGNlEQgLUdeukEu0i4Aea
         y2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270845; x=1781875645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jOhKduHvhhi1//fmQnUUQw/ZgnpHeWjfQ6tgKhPwSdc=;
        b=W0p5fP14tuFVriC6cf3NcwV3vIaXUcTd8hd3H0BejJk0SJ7YUqmnbPfDrbLTz6PA2U
         eQDH4zo4v5zMjJhzP+KX4KN4T6/4agtMNwgKKgsukLV9FLf54NzCCNYe9DFXNuxHMAiz
         6QC8wAKB/vgvwHHvKZThO3O8bFXKjiJ0DG3j1uN+6vpROZPlLjtK4UBRWHO5PlVQlJ3X
         oYH68Rsm6+FoStJ7dcK2CoqoT5iC4TA9sC8CdtW0BL7ckDETPbNjkrQhFbKbdfkq59/w
         zY4j0/c0182SSCwr8mCKWRV0XQJaK8QPJHj8c9fAHM7hvfa4YzXa8Anv2f7HMDQgiT49
         kG0g==
X-Forwarded-Encrypted: i=1; AFNElJ94om/EWSSyEANPe6LuDX+RWh2ZtMG1sxp/eDa5Q5oelvH+zEaFIKbMyrA9GMlAJWaA37H+WI7xnLsMPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz1sA7SwrNgRCYJS6fAVdIsozFlurihllWm62IYBka8U8H7F/Q
	GJY8cSXNWyNLLymNKrG/joyzU3uof5od9vtHVPPwFMD2IFs5hORVRRa7
X-Gm-Gg: Acq92OFEDGGdMhz5X+/Zz7S6nDJ7Au1Inm8QHquixI8jiFPsb/8vjzVehwmWCDbi9Yg
	txwQrowVeKLOGhLBoHeSjaexL8I5pj4ZoOxQWfR8+gImxZMvMax4ozKgMOlvdc99VJS5dtX14tX
	MEXWouvMekDFGssmtdHb1CVyG6XCMrUp6sPR3AB8hSfzD8fnWQGzYaGmUNQdO9Xao6/GbKCUfuj
	chT7R+tgz4E0q+LeMJmbFfP2076/Hk8BMlvDLmI2Du5/s7WflKVnYnRgsKjT4uAg8fdhe4NeRpJ
	cXwFmLEegUGLwbo5eim+0GnSdnodnE9wBqv7xu45pozn8gpAWYK0le5AQwcFqxDiGbhrk1UpH1n
	Cz+wpBf/F0SZyE9vF7jI8WUkBWR6IQlVsPvpZsszj1qiVYY6HiozEx3whal4D6hhmtjLbjxIh+E
	vI9v4EoTtHgobF8MOLy8ZRnBOe6UnQrerkOL6RYbN1pALz3+cAlc99QDY0y8oInu0lRrui
X-Received: by 2002:a05:7300:2148:b0:2f5:5dd3:1fcf with SMTP id 5a478bee46e88-3081ff97b78mr1839542eec.10.1781270845378;
        Fri, 12 Jun 2026 06:27:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:25 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/11] ASoC: fsl_spdif: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:33 +0700
Message-ID: <20260612132639.78086-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_spdif.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 1b9be85b34c2..ad1206ed9882 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -853,17 +853,15 @@ static int fsl_spdif_subcode_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
 	struct spdif_mixer_control *ctrl = &spdif_priv->fsl_spdif_control;
-	unsigned long flags;
 	int ret = -EAGAIN;
 
-	spin_lock_irqsave(&ctrl->ctl_lock, flags);
+	guard(spinlock_irqsave)(&ctrl->ctl_lock);
 	if (ctrl->ready_buf) {
 		int idx = (ctrl->ready_buf - 1) * SPDIF_UBITS_SIZE;
 		memcpy(&ucontrol->value.iec958.subcode[0],
 				&ctrl->subcode[idx], SPDIF_UBITS_SIZE);
 		ret = 0;
 	}
-	spin_unlock_irqrestore(&ctrl->ctl_lock, flags);
 
 	return ret;
 }
@@ -885,17 +883,15 @@ static int fsl_spdif_qget(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dai *cpu_dai = snd_kcontrol_chip(kcontrol);
 	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(cpu_dai);
 	struct spdif_mixer_control *ctrl = &spdif_priv->fsl_spdif_control;
-	unsigned long flags;
 	int ret = -EAGAIN;
 
-	spin_lock_irqsave(&ctrl->ctl_lock, flags);
+	guard(spinlock_irqsave)(&ctrl->ctl_lock);
 	if (ctrl->ready_buf) {
 		int idx = (ctrl->ready_buf - 1) * SPDIF_QSUB_SIZE;
 		memcpy(&ucontrol->value.bytes.data[0],
 				&ctrl->qsub[idx], SPDIF_QSUB_SIZE);
 		ret = 0;
 	}
-	spin_unlock_irqrestore(&ctrl->ctl_lock, flags);
 
 	return ret;
 }
-- 
2.43.0

