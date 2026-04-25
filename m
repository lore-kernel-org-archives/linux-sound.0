Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85689335BA
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 00:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777077872; cv=none; b=p6y3W11m7BS289CcKBAwm9UF/VPCUlNK8xvMdApL9rQqt9JqEeWWKfEwgidvK8K5Zx1/wKVe4BjCTGJY/XqeHlehHh0nkv2JqVFeDSkukjOWdDelLDcuzF/K2h+OK/A4fz3gVS7dzSqNoMeB11ThV+OPRZK6i6Ot2jfYjivv+Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777077872; c=relaxed/simple;
	bh=vbRWR4+e3gI1T28wrrTlg16+8udVjYCSiQQA8vBr/y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m2v7XIYLV1nacvhE7G3ldRYlEGn3kZ55U9sn+gMdeg89ruUK2aUy0ylJ7ZQYnA+8JcTPVvoDO4n9XOxdk4BeSI2RpBwjPzfbSKhkKYU3ZqGf7xgkMkLVkZ6t5Ly9uwkzPuWEFawisRalSmYL53O/reNe76dObM1vj4BNuE64Rrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExglKHg4; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExglKHg4"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f431c0ab6so3931386b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 17:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777077871; x=1777682671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xm2BMd5f70+IFDw9oIxnL0UFKMFjyAQAWO1QVmfPcuU=;
        b=ExglKHg4Pq71wWMzV9LCjf2dYdBiOGNQQFXBbrmEDTgbtGMNPkco/ikC1czmTgDRoa
         k194QH08KFnfS5VmH4F4uo8JDupi0VZa+OoS9M3jJhGddfdEqpEyodYjN5ymFF9x4vR/
         fgYROv44XMzfzJax1j250L7vOt2WUShlbDuS6Mfp83PKBnkhFijENxDxFDjRENQm/n0h
         y04oKCar3bULWClYowzlA+8JCCtlKrftniAU519qMKJxydxnnOEecscl0hy6bov1b+7Y
         LB8ZXNd0hnhWPMBZc58lgVS90ZPSsVTWx/t8j9ciMeFO8brXItav7LhTnoi9iTDaBKZn
         Dk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777077871; x=1777682671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xm2BMd5f70+IFDw9oIxnL0UFKMFjyAQAWO1QVmfPcuU=;
        b=Z3ZajTPUmrWyT+ylYfzlq+nFNfyS2nuQizWo6ahop2WaI+fc2FPOYjnTA1jkJh0mVu
         A3cjXzawdVeSnYKX2Rf4crD7xaefmdBNORobHFL7jw5Ub5CrtE3Gn5TW7jrH7Rvv/qKE
         AAhI4zdTmbkcwHzoX2QNUCRfFmeqNBXWCkKKX7Q7QGO9w09zn/9R8pG2m6RyKPsV4GsS
         fKgEPhCzy0T3I7ApfDEYDSF7742XPfBINh165wnB3imlXhBCJVlgffcc7Y+q/5S1OlJG
         BK9s8au+SXSovniT1bTZ6qe7G4MOAzOznNnQ8/TEL8ZMn1QgPjkbvciaPhBldncSVfKP
         o96g==
X-Gm-Message-State: AOJu0YxvB7iNhYX2BPUqCJ4LgXi2bOyNepNazu6aFjwMzgep6YlweW01
	0SknCq76T9zXZdisIQ0AcysBamItSUmdoqzpIwkpi/j+l9BZWCboqy4q
X-Gm-Gg: AeBDietYJKilgv+lrzoWzo+w5Bh/3Eg0dx04EAyn7g9/PJicNecyh8axM9zsZ/52kXF
	Mlhb3XGU5LyFBmyBZSVTTQeg4MQE1oPPy5NvS0qOiARVDjZIgootllKirnHtZpVO/p+wIr9p1pD
	HvNYS+O/YY9JOhSgEKTvYLY96I5T2Egsqnfo5XXOXe86zyR/CcXx5HeA/SFFwr/AIp8Tyorsx7E
	OJ853TkQMVUhD31CpL4tmYeBn8+U5TbttUcXDIFRjZUTQFlIW6cJB4G0bHLVcMQm2VbhoqOjdgy
	uyLX9KUZLiCl7c/1Z4DYD433s6fnZfE5MZspbo4WxDOLzKJWmgOMqkcT+uFRKKkMok0MNCocoW0
	lCTa9R9r4WWxDRTkPf72/SMT/HtExiXkkl0FmEB47fK5keVdoItJq9sgHQmcfzYjX8mGb3/NqdS
	TUXKPhDDvw6gPonIgL2Qz/49qsrGyW/N7a6s0xDjkunfTpjFeBFNjGMyr5sIfsAZivlbWSlckzS
	X1jKSBsFBM08drXbkAKYZQVKZ1kyaJbVkWw53COszPraoJNggrvy2Z0JT7UpheaqU8BWjj79Gsd
	sPlRFM+Nog==
X-Received: by 2002:a05:6a00:2ea5:b0:82f:1973:4b96 with SMTP id d2e1a72fcca58-82f8c91bc71mr39302406b3a.26.1777077870896;
        Fri, 24 Apr 2026 17:44:30 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0566dsm24948385b3a.57.2026.04.24.17.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 17:44:30 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Apr 2026 10:44:03 +1000
Subject: [PATCH 1/4] ASoC: tas2764: Mark die temp register as volatile
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-tas27xx-hwmon-fixes-v1-1-83c13b8e8f54@gmail.com>
References: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
In-Reply-To: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=860;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=vbRWR4+e3gI1T28wrrTlg16+8udVjYCSiQQA8vBr/y0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJlv+FIO8OgtsTpy6fl1eTM17fYVx6732x49qbnbds6Ns
 qfr/2X/6ZjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1/QeGfya9zcf4bhUnWwR9eVKyctObv//izaf1et6xErC9x+fhKMvwv7qyXiz
 Jr3/HBtUJoh9WJBczTwnbcXV5toDw1xeaVS7xDAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Reading the temperature register always returns the first value
read from the chip due to regcache.

Mark TAS2764_TEMP as volatile to prevent returning stale, cached
values when reading the die temp.

Fixes: 186dfc85f9a8 ("ASoC: tas2764: expose die temp to hwmon")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 423b7073b302..6aab6d2b7419 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -904,6 +904,7 @@ static bool tas2764_volatile_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case TAS2764_SW_RST:
+	case TAS2764_TEMP:
 	case TAS2764_INT_LTCH0 ... TAS2764_INT_LTCH4:
 	case TAS2764_INT_CLK_CFG:
 		return true;

-- 
2.54.0

