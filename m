Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E151A0BE0
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 00:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777077867; cv=none; b=ieFaDZI/5p9NlH+C89D7IjvJ8y/KQ3TqAuPEQP2MrIqDONagX7BzWiEj/h05+lr5TTRaH+yufWEpnBDwVyYGTAaOw4G0/wHiIGCdA4cy4IxE6HoozrlfkG3kr/GVcp3V/CbXhdiubYZtT+oA3yhVkRgdcMkBwBzhQgQngT2UWCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777077867; c=relaxed/simple;
	bh=OM3g9FtTD35pKvRKldl4QuwFBMFj0CM7U9jz3AYWiF4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NWP4a90W6IaUM1cLERUiQuR4mesdZZBhIXbdcsq/2ZQ9kul6zE8nh9a6bZSoizRus12qtB6exzJyXrlFOwkOwPgRgGPKvIStTDk3wJnyDimICZQwDs0UCc3OtzgnjMuI8iPxHsT4PjSWDyJVFbA1MRIPm3fBYJsGiuB3VpZWIS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dA9orYsl; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dA9orYsl"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f69a286dbso6379024b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 17:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777077866; x=1777682666; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXELO0KaVcDm5nDbpYvDIqJfkxikSAl12jvPRMM61W0=;
        b=dA9orYsls4R9jRACcK0w/UmFd3NM+HGqQRHfdMfgAWliFnKbqoCy6d0Z+S+ZOZwupK
         YFYVCR8WOcWmZdZny6/D/aGFLZWEwkvWLO0S3MIdLz8W6aIzkC8iQR66GZwH6X8o3+Ji
         RNolSEhm0tWskBr+w3DvjzdBqJ7r13BogKhPfl+zGuhlGfQWP3/4gqUplULAkM3ZWZJj
         jHjZz1jT9qiBPftIm3j1GRsWTiGaiUXQM7XPSrP7xllfG/LRYt+yKD3/oLjFmog/5cA0
         7tjbWvFzM0Ozf83HSQyy/2qotb/GeY+12VktyVpSCwt1QqJX/Ab+5KHbwZy3AeBdyPYn
         bT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777077866; x=1777682666;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXELO0KaVcDm5nDbpYvDIqJfkxikSAl12jvPRMM61W0=;
        b=ry5XoTmW3s2AFet7OBVwN2XUuBvv2sS5U60X4oNmhQhDfe3+SlIoXxfUXJgv7cc6bk
         +9llN6IbotDxEmqsMPREcaMgR9M5TsPc8nUusurKEbBVLOFE21pi8JoQjKZPKk6rFukP
         i4bgPLk65uFPZBEhCnMThHBdWoFAIfgV0QpecTqL3P7csOm7ltt0kjHEdNwGTT1ja1fx
         j3iATAerHIKq+tO/O52IVbDslu4ql5xu3+kg6Ltqi2dp5hfO+B6lREuzMRmS8AsIMITY
         vMPdTbbKJhVufSj/dAyTB1K8om6grJ1u4ABnQ2vcYQQ5BBtPvwzIK9gNR6I+JO2a7o3U
         wLtA==
X-Gm-Message-State: AOJu0YxoHsdEdgYG+CjgqlKT2hhTTj63iulWjuPBRRnVZ7CamTpByLz6
	Ej9zdF6YkCm5hb+cnoxjvqh0IV6A/hQwHjgsshlkCIJu0Dv9jZSS8BzH
X-Gm-Gg: AeBDies1XTiSqecIRRHD9fHy9cLDQQ2RkdSYfqtkjXx7PG0li+0PmNoq+jZQ6hHlSAX
	Ud+Mal58o83ilU3PIIY4ptFrw2vN1Gg4qRH0tEImhuvpAtYLvoyFg+1jFfUs+fuApsNgnGAfHRP
	VWsJVunlANzw6nQ8mx80k0EoprGzVIw1KZTa87mxrkRNKkrWM8gvx08WwMZ6jxhGJEUERKb+tde
	SW5nQT05wrUZNuW9u+uj8aKwR45840yHroIdqmowLGJRCcZNJkjvdPAYxu/7rM3JyRK/A1NCW3R
	07nlimQviuIDAW90fmp9+UqeTrlW7WiSN5RI1DDN0+HuHnuWAKQheqky1S/z0N0pmTqTbrQdOnm
	ZmifhF+opHdKiWpLvsxjogC5+rIHugKp40L7dUUmvREVhxjHfAGY6Cdz4po1fBHhmVDuCxzJfca
	fTM12QjSUw23uome534DIy/0uiH/nsFjy7jZRPuOW8w+uNFxua0YpAhm1v9vNt1+iuXf6n7kecy
	tbP2AYADXz4pLKIdxTY0eLLMgu87pbT/hFN1R963k5uDVUFamQuOXOUCiAXpznolKE+1JcB6P/i
	MmzsReHNCg==
X-Received: by 2002:a05:6a00:8715:b0:82f:a89e:e16f with SMTP id d2e1a72fcca58-82fa89ee99fmr18683408b3a.14.1777077865744;
        Fri, 24 Apr 2026 17:44:25 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0566dsm24948385b3a.57.2026.04.24.17.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 17:44:25 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/4] ASoC: tas27{64,70}: Fixes for hwmon temperature
 readout
Date: Sat, 25 Apr 2026 10:44:02 +1000
Message-Id: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFIO7GkC/yXMywqDMBCF4VeRWXcgBuPtVUoXNh11BKNkrAbEd
 zfq8uPwnx2EPJNAnezgaWXhyUWkrwRs37iOkH/RoJXOVaYNLo3oIgTst3Fy2HIgwdaWJlNUppV
 REMvZ0z3E8P15LP/vQHa5ruA4TkXOikx3AAAA
X-Change-ID: 20260425-tas27xx-hwmon-fixes-fc8540e81950
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=OM3g9FtTD35pKvRKldl4QuwFBMFj0CM7U9jz3AYWiF4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJlv+FKkN2d9adi0KMv8sOY5lm1Wjd8bX8bmMh/68Wdtz
 fff08q3d0xkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTGBDRBoYgICFgS83Ma/USMdIz1TbUM/Q
 SMdYx4iBi1MApjpRnJFh5cGJb3V2ZJx7avnKNc7o0t5L3i4KrbvnnzJ85+vxn2vXaUaGf6eF026
 stLzg/f/k6SsZtgvdDK9JrPy8Tku/9OO1mvcl/AA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi folks,

This series makes some fixes to the hwmon temperature reading
functionality added as part of [1].

- The arithmetic for TAS2770 was incorrect, leading to readings
  which deviated from the true value sampled by the ADC.
- TAS2764 was returning the cached value for each read after the
  first register sampling.
- Both chips were returning nonsense values before the ADC was
  fully powered up, causing issues with some monitoring software.

Regards,
James

[1]: https://lore.kernel.org/all/20250406-apple-codec-changes-v5-0-50a00ec850a3@gmail.com/

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
James Calligeros (4):
      ASoC: tas2764: Mark die temp register as volatile
      ASoC: tas2764: Deal with bogus initial temperature register value
      ASoC: tas2770: Fix order of operations for temperature calculation
      ASoC: tas2770: Deal with bogus initial temperature value

 sound/soc/codecs/tas2764.c | 22 ++++++++++++++--------
 sound/soc/codecs/tas2770.c | 13 ++++++++++---
 2 files changed, 24 insertions(+), 11 deletions(-)
---
base-commit: 7a69564045595263837fbd57e9f67e0507b04d8c
change-id: 20260425-tas27xx-hwmon-fixes-fc8540e81950

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

