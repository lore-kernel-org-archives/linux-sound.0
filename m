Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9854B344D82
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 17:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668111; cv=none; b=mUrzanJ3OM3toN+bnL1DWs/WWGWX991xUMDlDOVX2NPwjPc5blbfkn7AnOiXrz5c09ye1qPFQZN+rQKIXo1ZKRIYz+EekDVf6zX/Pb2mjmNKmxTgU6UkbmxMedF5FiShjz1bDb/gV8ljfvhibT0Xs6B4ipXOtLlPCV7vtR+AgSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668111; c=relaxed/simple;
	bh=TVDvBDhhE1GFZeZZeFs+dGuWH0KASYUMZZiT5zbEg7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gyd8Ck+4Oj/JY7j2UIEWme5aFdkBflzTqOtlVAYaxuvi8xh82aakMvUx93ljFlsILogD5n6OFqzwgwZwp6Ro21pP7ItwYbSPc7JxC6se+jw4Snt97+DOGB0T3oz33OqDNAnzUgVkppcf6fbpRQ1cEMbPx5mKBklsce/DiCP9SjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lebtebPl; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lebtebPl"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82cef263bedso22630b3a.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 10:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775668110; x=1776272910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xz5Cydk8ycXF/+GGvFsNR7glut2xhT7NU+wPgS7bPP8=;
        b=lebtebPlpGDb8/bEi/NPyFcFExgcXkWDvCg+bENmCpmzFyD3VmYcrAbvCuQaW+0gsp
         MsJ881hdUgJV1HtO5vqcAt4UGTnkZdXsLjWzGYzGD1I1wPCuFoa7YSLUhvkrnEhc2300
         FQTZLvFrFOeM7jbNiR2DghddM/y6qLyzZX+a8etgN1IsCB25ziLQoHcQbat9lhCb+Y+i
         /8BJHXZJnyoANuviJk117j5yrd9Lcdob4j1JXDdkNfTDDD4SMtrnBg656FYN23Tr3WDK
         H2qih7yRAAe7zrXaLp+qNC4bR1G30zIFJvPZ2fsEQUUNcIoVk7456uUwjZF1mBH/1lmv
         4uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775668110; x=1776272910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xz5Cydk8ycXF/+GGvFsNR7glut2xhT7NU+wPgS7bPP8=;
        b=KPx/0VBih+om8WlQh0WDaPPlyoffcbO/HpA4pKK1TLonR525nKRKEGtM6zgPRl+UGu
         tVGVAlx3yUgfAig+X3gTrSBGiff73CXbeO1i1mwKc5uKHNOQZk3P0D0QQhVi8NtjTDGM
         zdafAlsytdKBXjgbZfuTgxheZTe8d7dYj6RbGotCSZTnrCLdpI2hDWvtPSkHUpL6ad9/
         Idnaj+lykdhiyP7aGS9DkFdW6KEEDXNXo4vlCpkLNQL/NosiB2Vsa7auJQ4sZr3tfD3j
         z4ar/jwHAj2u12cOd1g3SABSzGV1bqRdl3FC1UZEQQmnwB0I/zrm61vvxvC3HaeEgaZT
         GD/A==
X-Forwarded-Encrypted: i=1; AJvYcCWnZY0jHhLfqy0omGYk3q04DKosku+WKCNfJ+RhlQMCWhwK71BLQRBhYMQdKbI6WUqNYZOd29gESUHx6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSowAQPw+vHAJgQAo7UjBcL5V28LOT73JQ0e86WX+Se88ZNCaP
	BPiH+7eqHuYLavC2K0jmGqyeYzAgb16kLFfbemNc67f2qpSz4qmiSSr2
X-Gm-Gg: AeBDievxfSVc9H+bBesN9CgKSXQG2jffbVzSM+2XxSNg0exskFBIiegKLihlmxszvrU
	oi59zzMbJvorxGNW4CzRk982FuJH3ZvWPftrJj2LfW2CILgO6UXCgX6Pl9abAFyHyW16MVjRrbi
	QoMXDojdpoRLq9z6vGQEwtTUExF+rFM8dG3n+FVLO1buMe2yf0owfRB7iCPY39L2gWB7kwBEiBK
	oObukVPmjsl+EPbo5KWZ0sEXgg7nXeF9zVu/d6XbKWiYN3vJcDia2FCW/yNsx1CiI32ijyYtgHC
	yPspqpK89qqCqSd8HWr0sNcORyv/APeon1ekK4FWUUBqVDk1TI3CX2WVQ65ri5wSiyu2ka0DAsp
	Mi3lgae+mAZnR4+6g17Hm5dHuf9S42CHj8v6KnLQQ9yRWmblTZMsG7cv1FiT0Ru2k+6pzYomn7Y
	s1K4sSCtGtbPg2NaoOReZSJ0b4Y4K6r8aDbTk3BcQBjAkA/v+ZFM6t9rI5DO9B8/kBuEO5aUpWb
	fV9vSuadRLR/MvqMrm8hDsl8KBqKYzEGGFpwLjYKc5wkO+AGyKeG91W8g==
X-Received: by 2002:a05:6a00:429b:b0:824:b181:f492 with SMTP id d2e1a72fcca58-82dd8ad1516mr256957b3a.45.1775668109744;
        Wed, 08 Apr 2026 10:08:29 -0700 (PDT)
Received: from lorddaniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b2694csm21775091b3a.2.2026.04.08.10.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:08:29 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sheetal <sheetal@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: tegra210: simplify byte map handling in ADX and AMX
Date: Wed,  8 Apr 2026 22:38:16 +0530
Message-Id: <20260408170818.70322-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260407170308.100238-3-piyushpatle228@gmail.com>
References: <20260407170308.100238-3-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tegra210 ADX and AMX drivers both keep their "Byte Map N" ALSA
control state as a byte-packed u32 map[] array along with a separate
byte_mask[] bitmap. This is because the control range exposed to
userspace is [0, 256], where 256 is the "disabled" sentinel and
does not fit in a byte, so the two arrays have to be cross-checked
on every get()/put().

This series stores each slot as a u16 holding the user-visible
value directly, turning get_byte_map() into a direct return and
put_byte_map() into a compare-and-store. The hardware-facing packed
RAM word and the IN_BYTE_EN / OUT_BYTE_EN enable masks are computed
on the fly inside each write_map_ram() callback, which is the only
place that needs to know the hardware layout. The byte_mask[] field
is dropped from both driver state structs.

There is no userspace-visible ABI change. Control declarations,
ranges, initial values and handling of out-of-range writes is
preserved by treating values outside [0, 255] as disabled (256),
matching previous behavior. As a side effect each patch also fixes
a latent bug in put_byte_map() where an enabled-to-enabled value
change was not persisted.

The packed RAM word construction is also updated to ensure the shift
operates on a u32 value, avoiding potential undefined behavior due
to signed integer promotion.

Addresses TODO comments left in tegra210_{adx,amx}_get_byte_map().

Changes since v1:
 - Allocate byte_mask[] dynamically using kcalloc() based on
   soc_data->byte_mask_size instead of fixed-size arrays
 - Propagate -ENOMEM from write_map_ram() to callers
 - Replace magic numbers with TEGRA_{ADX,AMX}_SLOTS_PER_WORD
 - Use BITS_PER_BYTE and BITS_PER_TYPE() instead of literal shifts
 - Add <linux/bits.h> and <linux/slab.h> includes

Patch 1/2: ASoC: tegra210_adx: simplify byte map get/put logic
Patch 2/2: ASoC: tegra210_amx: simplify byte map get/put logic

-- 
2.34.1

