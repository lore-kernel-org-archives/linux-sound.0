Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2474A0EF7
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 13:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465004; cv=none; b=VJScF1za8WJ7toJofJeFdIhKTS1NzngjQWti4nLhj3HdEqWKxRdO80nB2ebFxOq87t8Jfwake9DDkPuyRUPlQLBYWshd8abCG7ONt9IdpC93IUegNQC8P8vgEiAlWx88GSeP1vHODwWQvIgdzQIRXw1U7mHCUrLFdu//YPmGZB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465004; c=relaxed/simple;
	bh=SW4l0cDJ3LOi8NpL5PTyGXY7ehD370t12/dRJIqodm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pd1xvNapInB8hOviuzH8D5OI6Fnk3vCT75kNjw6V4zzZRzPCr+xZD4MUc7oB8K/UUNDmqnOoiVoBk8+zD+fUjLbd6hMLDWtXAM8YkgiJck2cehU+RHAgR7erdSia9DwidCToByTFH7NCWUfXLW72dnMLcLhk+M6Lrj59max4f4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwsSxyAI; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwsSxyAI"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbee846deecso3699400a12.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 06:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465003; x=1792069803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=42VIe5QqLg9nekHrsGmAKxJBRJzVEjE2smW9oVx4DL8=;
        b=dwsSxyAIJD0rWoIz9QB/bFBW1w9PIEiwvCo5z02xhbwTBrq4qUla13iNfsAYzSz7FC
         RlMdRWqaUBIrMcQ5u66ZROF6Gv+A2JVCzVu6KMrDeZdTyLeTv9+5xAiPd72BhHVpgYzV
         3Xchlt0Emz/bal/nmRf0lDhJo6AdMnonUMMAGwPiMkg/3MO200mc8u0uoNK/6VvJqTZZ
         1KKlh09QHo0MMXjno/yp6NXtuFrAkwGkbSWUIodUx4OBlOJ8s8ujq+nH2vdHebo5hKu0
         631iH2r4L+Gsk0CMyvEx7Woe36xM1jsU/s+4aY1K2lBF/uNdYKpG6HirXCytAAjxKgvh
         xpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465003; x=1792069803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42VIe5QqLg9nekHrsGmAKxJBRJzVEjE2smW9oVx4DL8=;
        b=SepW1+QWMqgmg8KVRM0jaP4pCtGFSNlujJ2iEbP/kDyb1lPmzMONaY+KEjfp+LeQdR
         cznbD/1EaMjh+ciOWBthJYFGVo9+T9WxQ/G5lXtgrzd26bZJdEK1VI64Cbcjl+akU1sH
         B9yEBlLfqv8k/Af2w6/G7A4iGoEryP5VNMwAAILqFxtrjLhEYoUltklHIg8gF8QW+fLf
         SAwuUyNUQnV7NbFSZAzZi61MIEi2WKULobjIiByaIpztBInGXSSn9b1211gku0lTXBK8
         pAtSxXZDnQWhmpjUYzNCUPVTK7QJ1P5wdMw9E5VhCzMFosBhrjMX9w/XdLBDI9e76e8G
         cLzw==
X-Forwarded-Encrypted: i=1; AKwUvBwvV9fLNwxHbrGuW8fmCHmdb3FJjSZaB8P0fm7CRMZsBxvsU16pItlmHhbA36gDBx440+gH43hBUNd9Fg==@vger.kernel.org
X-Gm-Message-State: AFuF++mZ7eskAwf5N+y0zdTpzGFgvRpvWPsG9vptplPNszVQLb5mM0sd
	kOmSGNYu3m4Er+csw9Ew6sKLIPAtf/lYp+6tMDCuevSq06GRBdQaVwDa
X-Gm-Gg: AYBFou0KpEPz+5ls773uL/lSRPMRZf6RB8Un2dRbT/torio3HG+Oa2OhdK6vonSvZBA
	JgM2+jfbCK6ZzKYhzFu/JqUfEC29H5dYyAjmXs/SyFt2rGwYzkf0v6AiNACb/TbgVgyO2b8Lobi
	I+nA6oq2R4PPU8RCzSswYLRUhVA8LjQM6T4rRDoWRVCGspbW9nUnutCobOkd/5mScnjruSPtS8y
	joROgOmLQJMJqGqi/NtguL34sG3yxc7ntC42ya3QQ7RpUmghXvkbd7Xd9q2Lwwyia4e7rHo2svz
	6G0HZvtqyaGl5b7Aq78s9QCs5d6NO+/KUljlVdZl5yg7ntG7ArBeISvg1J/dqtXLNMDXJWj+7Ih
	b4ixqUshS/IInmOQy3sYzMfTMtyrjksXop4bCfrtjGGZaKM5Qdco9xCB4xdQRgpKWcCWeYmectz
	sEyUCQkzQTdjhq6AskQZmQgqIcnVYhgJGImC4mFedmbntPbNqSPp7yqUV9/i+z+4TIrDq40K0xB
	Cfykm8eCGHcSG4Xc9L00PBLKcJfBizg5ve+up6totp80TIJ6MDrFMy/8xg2xjVrw70NxGlr6Uh6
	SOpNBhZlzg==
X-Received: by 2002:a05:6a20:6a0e:b0:3da:bea4:622c with SMTP id adf61e73a8af0-3e1340069c4mr4940719637.19.1791465000125;
        Thu, 08 Oct 2026 06:10:00 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-893143368a7sm870761b3a.48.2026.10.08.06.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:09:59 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/6] ASoC: Fix controls that write another control's bits
Date: Thu,  8 Oct 2026 22:09:46 +0900
Message-ID: <20261008130953.2446692-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the es8316 thread Mark suggested checking at registration time for
controls whose register fields overlap [1]. Before adding such a check,
I wanted to see what it would find in the tree today.

A script expanded the control tables of every ASoC driver built by
allmodconfig and looked for two controls in one table whose register
fields overlap. It found 80 pairs in 33 drivers. Most are real bugs.
The rest are deliberate, where two names drive the same field, such as
the AC and DRC mode thresholds in sta32x.

This series fixes six that I could confirm against the vendor
datasheet. In each one, writing a control changes a different control,
and the bits it should own cannot be reached. Most date back to the
first version of the driver.

One more is left out on purpose. The cs42l56 ADC Mute Switch writes the
ADC invert bits. The real mute bits are also written by the
cs42l56_mute() callback on every stream start and stop, so moving the
control there would let the stream mute override it. I am not sure
whether you would rather move it or drop it.

I have none of this hardware, so these are checked against the
datasheets only. More fixes, checked against the register headers,
and the registration time check would follow.

[1] https://lore.kernel.org/all/0fefbfe1-021b-46b2-8945-15956e75e37f@sirena.org.uk/

HyeongJun An (6):
  ASoC: cs42l56: Put the Limiter Cushion control on the limiter register
  ASoC: cs42l52: Fix the NG Type Switch bit
  ASoC: pcm3168a: Fix the DAC zero flag polarity bit
  ASoC: max98371: Fix the Speaker DHT Min Volume bits
  ASoC: wm8978: Fix the 128x oversampling switch bits
  ASoC: nau8822: Fix the 128x oversampling switch bits

 sound/soc/codecs/cs42l52.c  | 2 +-
 sound/soc/codecs/cs42l56.c  | 2 +-
 sound/soc/codecs/max98371.c | 2 +-
 sound/soc/codecs/nau8822.c  | 4 ++--
 sound/soc/codecs/pcm3168a.c | 2 +-
 sound/soc/codecs/wm8978.c   | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.43.0

