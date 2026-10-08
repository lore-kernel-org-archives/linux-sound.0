Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BB7472077
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465008; cv=none; b=Zp/T+36BABoNzyxyIT4UUp34aJHlnzQdaFHxyRwWFriKJZxeydPDTgvA+VHIJCrwAtSsy6LJgUAXnw44fLdMrj7NxXBo9n2lola6ClITUWJXnfdcuPITUpy97643NmElo0WiKCUrKuN2mNm97tmWmJbdcyR/rq/3kiwqOmFIHgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465008; c=relaxed/simple;
	bh=HKrmHu4lCgh7QTHtE6jbJNDhiEV19CjULeWm0rR2Kok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ojd0hGZDO+7O1tGS4dTFrY5Ii7aqRr9wPq1N3hzWRtMaVGiKoSTlWzDq4FTJ27K1p83CQ+v+cqdOZfm2V4y2MvYM4RnFlM+o41RU6nF3gNqlVUPAqOey3XnZREnbMOCLVgQ1MMNU4QczalGbm53M+LgxZNI+ekbm8o16a7poBxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeSX2nGp; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeSX2nGp"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-85377c8bc96so1776020b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 06:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465007; x=1792069807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zPwd6Nu3TO5xWYhjkTz+n9wKTQT66lYU8GaPDwJbBMk=;
        b=TeSX2nGpRfmxHDTN2pK/ucon0TvPGTbc8lASPqNuLKrAMehXsGwHldOfoMk4cqduF0
         QA6mGbmmeuzMHBi6kcI+O+63s487zFjWBgaHuCFSc7VjVyX2HHwp0Az2sXbUKbCeUOBY
         Amb3PA+42vJEXNP1KZr3IFxWG1KlrV8bFgHzcjtL6VtSx7zxoa5j8zclFaT1gW/SiCde
         HSD0e1QKlujYstOXnL4Ihfupdzb03dx/lK9wgcYrFi5qKx9MgEdYIMwYIzFspQ4UVU77
         23J7QFTjXPMGdg62clZQt15ruz1i59CfiMNmwfVZuzsIHLVRVOceIsoVmVcF23xCB7PC
         KY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465007; x=1792069807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPwd6Nu3TO5xWYhjkTz+n9wKTQT66lYU8GaPDwJbBMk=;
        b=nstGA9cjg5ojiB8OCuuArfj6/RNT/N9N2u3j4NOGAsVCZYy9xAPB0hooUtv5Ha3diX
         dTdioOqUc6zGsooCGs5S3D4K/rDEZ1Ifz0t0KD99kYQFqvRSg1LJuNMe6vwzA8fvdWCg
         ttpC2sawWZ7+U6fysF0UNlZei7jWN0BLdzqbkjUagQJ2bcvMfyrDYLeb/Kl9tTsQCweQ
         at3UYlnnmo8/m/KIqI0ch4royg52TB7Q3EcW2HwZVnNYBIhnwWj7Q5wEmcBocsovFcVa
         /prbOoq7RLSKhFAAr8Yt7zT39B313SX7avD8Ilj61MTKaFJIaf3sRTui0s8Chs3Cd/No
         oEvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkJj+oIVbAjAn1jVgoFo/AkMgYuYTUzOCpOJa4Uegj+yKloBDH1GQqoiDeBa9vjkZ2hI7Kd2CsHWy49g==@vger.kernel.org
X-Gm-Message-State: AFuF++lWbyHYGAuxr5rObY5LvEipd3tkjavBVo3cxdrTAm58Dwl/klig
	IbIHJlS6H2LyA7aROnJEXgfdK1+NecY8jXcMniYzZOp84hH/cKgR52+3
X-Gm-Gg: AYBFou1DSBCXDhsra4X5ZTGXf+HET9N57sOHTsR2hPUJnRnJtAkh8ucBThPVUqWLrC0
	X7TMVn4nNUFmEQH5U4V1aZcD9qQ7x/fb554XOg33GL2KgNDW2Y7Rh7za/If9Oo467vGi/6TwMeL
	jykZhhvTwLD1n/Q5PcJJw2v1w/zLe5eMZV7TmJFQy0fisR5E1n5Bi/EnpAM2cYiZtT8F/bXj51p
	AzkRwEcHywGkqCXAZ2871k01tk1txnipmzcUuSIwWMZr8aHeiJMPi1LaRZOGEiKYdqkRAn8W8SG
	MCxzCcnfVHHvUjs+YPTdUjjPQ0OSQCXEDAjh3ftjaUsADR1/KX9VJig/P8uMjTUQ5MYfxfZWVNH
	HI5sOMk8a8DT4HgKuqjvbZnwWavrOgzkp9mh3PGz3E8EulN16pS6aQZ4l7tShSFSwrL5EsSZZdH
	sDjFYuDQymFd+pdYti76jpQwxwzDDInuza2xBhFg1t5h9Bxs58g+t2mWTanrK14xGtRu+vzjH9M
	iOPA1Mtck3hV616UTJfQJw+nWSPItCuzHjA73QZzLdf3sUcG5HrjWApVpqfHr0Ejmg7mS6coaIU
	09a1qJ8QDLQO
X-Received: by 2002:a05:6a00:2d9d:b0:878:3538:8f7d with SMTP id d2e1a72fcca58-891b1f66b1cmr5344297b3a.43.1791465006765;
        Thu, 08 Oct 2026 06:10:06 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-893143368a7sm870761b3a.48.2026.10.08.06.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:10:05 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com
Subject: [PATCH 1/6] ASoC: cs42l56: Put the Limiter Cushion control on the limiter register
Date: Thu,  8 Oct 2026 22:09:47 +0900
Message-ID: <20261008130953.2446692-2-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008130953.2446692-1-sammiee5311@gmail.com>
References: <20261008130953.2446692-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Limiter Cushion control writes bits 4:2 of the ALC Thresholds
register. Those bits are ALCMIN, which the ALC MIN control owns. The
datasheet puts CUSH at bits 4:2 of the Limit Thresholds Control
register, next to LMAX, which the Limiter MAX control already uses.

So setting the limiter cushion changes the ALC minimum threshold, and
the cushion itself cannot be set.

Use CS42L56_LIM_THRESHOLD_CTL.

Fixes: 272b5edd3b8f ("ASoC: Add support for CS42L56 CODEC")
Link: https://statics.cirrus.com/pubs/proDatasheet/CS42L56_F2.pdf
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/cs42l56.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index ad45e8fdb393..54d23857b0ad 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -481,7 +481,7 @@ static const struct snd_kcontrol_new cs42l56_snd_controls[] = {
 			0, 0x3f, 0, 0),
 	SOC_SINGLE_TLV("Limiter MAX", CS42L56_LIM_THRESHOLD_CTL,
 			5, 0x07, 1, alc_tlv),
-	SOC_SINGLE_TLV("Limiter Cushion", CS42L56_ALC_THRESHOLD,
+	SOC_SINGLE_TLV("Limiter Cushion", CS42L56_LIM_THRESHOLD_CTL,
 			2, 0x07, 1, alc_tlv),
 
 	SOC_SINGLE("NG Switch", CS42L56_NOISE_GATE_CTL, 6, 1, 1),
-- 
2.43.0

