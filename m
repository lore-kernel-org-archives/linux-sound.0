Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05A730E0F2
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 07:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135526; cv=none; b=M8mooiB4rOtwrNyxd0WeIcXDXEw7Hj/7paRg+EEC+0lElL1dbfXFZmwUaj7U0KsnAl1nI0ebV0r7TU2HyNMbHyW9lnRrhrfFYgNp/61YveaHkSP7n6QlNXuR/2X7NvNmZ2ztvFtrP+Qwq9fobWSHCIN31F3qYOAgu17hD6d/HJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135526; c=relaxed/simple;
	bh=Qbz8nuOiP9OofXx8GLDG3Qt+PgP64N4T7LZZ5fDHiXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IGNQSNOteKSxOehB56sTXWKXArGY/ozWdKAK7a0nVjnzcSEhwJhkPnRnJuun86hMcThiyzqNJT5/KEBya9eFFoVaVJmdIZbQXQDFoxBOJVMm4UBWqKu1ft/+oIrijkVWddiIuo2E14RFJQnfg2qZt5p22EwyUWtUyelc82s+iJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VU/c62Yq; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VU/c62Yq"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso3178748a12.0
        for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 00:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792135524; x=1792740324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EgkUxGMv2Qr4zxs3DXvVEMujKxYkVD2LgF7+k73Afuk=;
        b=VU/c62YqJeA7mDPRb7saWKl5oYuFQm9wnEI7DDQikdJEQy2bYIY1pvTG8GnyIAuIQn
         FAHJhVUM/qGQElv+Jsw041T1twI/uYFxLIX1RYiLB4S7lzuWl+r7Bfr2+9VXxXIZFpxE
         Ri2OjIALu13vOPMMUVoGIFqu1a3sH4OJe0UXkil6q37p+ppeRqYYyZ38JbPvmgpIW2tx
         PDm8IcbmomzuJtNrZK5q/oDcbCORnS/iA+dkhug16FJf5yNyQTHuIay8wfin3o8GzK2d
         TNB7oS92CacZpLKaiDZWqCsUdovxOuj+hgaP8J544/Mq89a1c7jB4RtgxwhvQ62h/2Gr
         O7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792135524; x=1792740324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgkUxGMv2Qr4zxs3DXvVEMujKxYkVD2LgF7+k73Afuk=;
        b=ejlDqRdqwfHp947eXXWsivlwc01LbM4OWe5G90HF96RFzWJ5E9NE/p/fC3CF98hAy9
         LOVjf7Mr9QHk6m1sGDClqcziBLcUAXabVcO+yh1K/6O29lPGV68lGNjz+aSdvLFFOPE3
         cQqw6itywhOFn5lmULYsaS875/UTmaoHXi9EuDMWZIwrl2/D+VAX5Ua8CiCd/H6nBcP1
         5/+9VjXg1sqdrtKRH40e6gUJI2dlay+KLXXwsXvLzESq7U8N/9XYX++xqUAa11xKkCW5
         rm/OO9JqWk7bfx32WOn6poeiBxhlS6Lvf/sAPccou8Er74kRgh/Woj7E8/sRMXAKGTIE
         3ywA==
X-Forwarded-Encrypted: i=1; AKwUvBw9cRv+7pVna10rzoSgppgy+acmazz1YO5lonqWFH/IP+hOqnJJIt8PlpgfspRBZalBQTNwKmvibDXNqQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYK17h3JYFZx8GMRsSLEevX1wgR8h+za/HK49XJuyJQ0MJloBTri
	syqL/vxAr/aWjQt5+iZAcdhEVU8DGGgwM+BZHOTFlnsEgqwa94oJrPHq
X-Gm-Gg: AYBFou1H1HsgiwQVxa3Mn5FXteO2832AusH/LlQFpzF7z3bilYYwaqCL4AMjJMF1+Om
	0XekI0l95X87LQxedSzDU1zILVx/FwsAiqfaP6gaxmKcpAl78Ui9hZbcU2xPtjyETYc/i4xLkLY
	Dl1PgnvppEtbEVuleWk8b1Navst+vLEa6I3fWXerEgR7Jog7oj7LwZHGTD1SLJRXZua+BrbK81X
	DCFyS4+gGkoq6/9/5BlKs8vZQMuKoo5v0aivBT9DPQEnJxfn2yGmxr3owpMFEGaY1b5kVuwxvjA
	RLWJ7T5XGjJDwxcXv6b1tMxMSn1k/as6duXhQvdk2QHbdDEgovQFf6TtmMpB/ABrhxpfwDvUneU
	/00yFwM4gOTQ9SMimub8u0TjvyCJswv79/3BMXG53ZEpquXh7/94XtBOKCdstENsNnmVAfAiCBG
	DA+8pM4Y79zmhIj8mQ9FqaBPvdaNnNao0W3K9RnhfcEyoHNad/OB3XXAt4nwWauVv19lU9GhtqB
	A1G9EvSWoGySFQNLJSIaR1Fmvornfi9tjkghHyrUrajadu2zODZiGO4OQN+UMLumUi2WITLfmpZ
	Fjz/fIdTSw==
X-Received: by 2002:a05:6a21:790b:b0:3e1:fe81:b195 with SMTP id adf61e73a8af0-3e1fe81b890mr2910731637.49.1792135524162;
        Fri, 16 Oct 2026 00:25:24 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549b6171sm615257a12.14.2026.10.16.00.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 00:25:23 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	support.opensource@diasemi.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] ASoC: codecs: Fix control definitions that write another control's register
Date: Fri, 16 Oct 2026 16:25:15 +0900
Message-ID: <cover.1792135144.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are more fixes found by the overlap scan from the first series
[1]. In each driver a control writes the register of another control.

[1] https://lore.kernel.org/all/20261008130953.2446692-1-sammiee5311@gmail.com/

HyeongJun An (4):
  ASoC: codecs: da732x: Fix definition of ADC2 EQ Overall Volume control
  ASoC: codecs: tlv320adc3xxx: Fix definition of AGC Target Level
    control
  ASoC: codecs: sta32x: Fix definition of Ch2 and Ch3 Volume Bypass
    controls
  ASoC: codecs: sta350: Fix definition of Ch2 and Ch3 Volume Bypass
    controls

 sound/soc/codecs/da732x.c        | 2 +-
 sound/soc/codecs/sta32x.c        | 4 ++--
 sound/soc/codecs/sta350.c        | 4 ++--
 sound/soc/codecs/tlv320adc3xxx.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.43.0

