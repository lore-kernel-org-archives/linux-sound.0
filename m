Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7982D1D5146
	for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 00:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769398; cv=none; b=uSp+BTf7TxoGWb6gLA2yI0knfPjb7zAn5BeGhWAGl6tqVFIK3hufp/j+gYL6tpZyKVGybWPsCjZbZm2lKsqUi8IUJNOaOQ6BrKoHA6yo0najyRwyERXKqweYmPUlwchbn52uOdnv8jZ8iM8sIqntxZQJZoda9lpL+9eLb6/AAD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769398; c=relaxed/simple;
	bh=Twm6LPiVFKhBkReXv8a2uQA0ia+D8zP7/q1+jKrAeBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYWz4mAhN0sL324V6scfx+dheQlzAQEMxhNKlCNVEOTpsZDjip0wfWArv0YZr3VJT8QE7+v9EZnoTSwmEKGy7ME9NWXKng0SW5R8cXNTFOCVCJ1Bx5aZQah8BvILyzCuBhDIwHLl2P1NPwy145qgdtMj3Cg9Pt3NpFt4OYkcMhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KINwSMBl; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KINwSMBl"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65a35fc8007so919237a12.1
        for <linux-sound@vger.kernel.org>; Tue, 10 Feb 2026 16:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770769395; x=1771374195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilmuVxco0ouJOu862BG8br/jP+w/IBRqQTQyzbP8jPA=;
        b=KINwSMBloXPWqQao9rlvaswaEPeb2hPcxrKHHCLC01IqCsHrasDjVexLnjmzVts6wW
         5sM1HPhDJbI3S8gNBQ67tdj766WSteHLvR/YMChDgSa+TZIBJmyRN6qe9XTjrNn48dC7
         0unnN8zD1jPmgWdB5+VUI05l4H/EmxO/4tgmZVFOjjkHICmxYpnwwZVmoAi2gbhnobqQ
         uAoAqchbxM+F20wcVBPpQAhpwbL3rN8oYIPl600Uq48InpMBbHuCCzCJcnh5BW/QPYYK
         L3rkSOmecnrJF9mGoKxA+C1WoGyAuKAMlMLyazO8mMHxpK21E95GSqjPEdYfk2fGItOQ
         3t8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770769395; x=1771374195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ilmuVxco0ouJOu862BG8br/jP+w/IBRqQTQyzbP8jPA=;
        b=sXEbeqnFo7tTvqd7VEnmbazUldkEP1a6/V58kIafqhrKQadRTc79HBJ/JupbxtAHRz
         4J172zu5xLrAXLm+L+TywbcudS6OIOs3I1YKdcHP0t93GrO1n87Hf4OBrXrSQCtZnSCy
         6NenelTHcV+jijmU6NxChMf1yaWHcDkzxnSu2v+1XBXGxB3n/2d3nYZf2u7K1i+kcDCI
         PArytVJNPppK6UPd2E67pp2jASIKxuAG7dwO1zd3bAe1BOaTx5necgXxKL18OIjeo7Sy
         0u1iivq6P7BSq3eu5zDi9Z5c9bmfHML+VvIDV63KNHwziFBtbINrOgy2AyBlF3KcGLA2
         +8mg==
X-Forwarded-Encrypted: i=1; AJvYcCX6XYy596KS67MLBInGnw38DgpZHcWJ7vyCSYqmYLX8OZRFacHedYLArhneGUiFZbERqLwl5sfEpxrI+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJz3dV9lSLlIeLUGrVW4hyzaKNrRLkxyKI+Dw0wbYuzYWs4pE1
	DfRPk5YmbjPCnAx74AuSC5FAJ8HEfYxO2Odd/Rgz9but2xSqnM0abYkk
X-Gm-Gg: AZuq6aJA4U5uOVmN+oCf/kbQetGipXFDlClvX4Q3vZxezVjheiGfDihM0ryvwxzgkVS
	Z3u3dNd9jlcALNbsHkLmpw1amgPTELyLopYrfc3w5K5XF/7/Kz1nQAs4V8VIQEdDy2WUgMGwqRy
	15CldlAo1aicsEChdh71F6hWtrjPDDnLlBrFAxcyA0QTQxfg6EAFitBWNyRGk+2a0GnZ+mx5e3B
	E6pW6HVrVP5IYK4yjk4Q5y0Ozq64Znl4wlxMG76mZZC81w5kTSvfoFOb2sjCBZwsv0qwQxw7aid
	kWcPhJo1tiCRtPn7znMcIKtSwUAWA2HiNa8dYpC7rTuSQcbyNEHFj/9VIuqQyslS3V477ulIy8D
	mA2zMY0WBnydUBuOxy6RrHPqFzizr2M4yUKx/sTbg/TOGDbahb5hS1xlJyaw9IVar6MHt6LULUW
	+Jbl+BwI0ayWjPxw==
X-Received: by 2002:a17:907:1c1c:b0:b86:e938:1b3a with SMTP id a640c23a62f3a-b8f6eeb9fb2mr21327366b.17.1770769395276;
        Tue, 10 Feb 2026 16:23:15 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec1db0bsm9992866b.46.2026.02.10.16.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 16:23:15 -0800 (PST)
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH 3/7] ASoC: rt5677: Fix typo in the header file
Date: Wed, 11 Feb 2026 02:18:35 +0200
Message-ID: <20260211002255.4090440-4-jekhor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260211002255.4090440-1-jekhor@gmail.com>
References: <20260211002255.4090440-1-jekhor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in the DAC1 Digital Volume register description comment
(it was mistakenly named as DAC3).

Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
---
 sound/soc/codecs/rt5677.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index d67ebae067d9..876f7674015c 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -421,7 +421,7 @@
 #define RT5677_DAC3_R_VOL_MASK			(0xff)
 #define RT5677_DAC3_R_VOL_SFT			0
 
-/* DAC3 Digital Volume (0x19) */
+/* DAC1 Digital Volume (0x19) */
 #define RT5677_DAC1_L_VOL_MASK			(0xff << 8)
 #define RT5677_DAC1_L_VOL_SFT			8
 #define RT5677_DAC1_R_VOL_MASK			(0xff)
-- 
2.51.0

