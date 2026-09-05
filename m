Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0A536AB6B
	for <linux-sound@vger.kernel.org>; Sat,  5 Sep 2026 14:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616892; cv=none; b=FengMUFo5dONlwH+Gw4qjdUI/GB4ab3uE/75v0dAzRtl25pLW9ZpYSXCnhaMyiP4YN39QIlheQ/KFu1cfRlFq6368xqIDUNtWCwl8D8QtbaMKXcw4pIsyKSfeq8ArguthrZEYs8J3x1055J4W0QiowaSKPM3lf0kIQ+/JLSLQTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616892; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ApiAEOvcsUenPwlXOqIaHJxip00Mh9L3v+K+k/eA1zzvo946ne/8EgceYvM9LDpcGAehx5OvbphXsC/uqHula1LKRk1atqvEbFz/efzu8lRBdeOdMi3koNJIsRIP0UeKw5NDxkTzs+ZZCYlIRdXRlMfCz4tvkncB0s+RwDrHBlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZpV17zU; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZpV17zU"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c652293bcdso2418469e0c.1
        for <linux-sound@vger.kernel.org>; Sat, 05 Sep 2026 07:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616883; x=1789221683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=MZpV17zU6O8ZzOYCM6mSh6Pc5bMWELB+jnQuQi5HQCi6EKwnfgmZ0AEBpaSpAQDW8S
         16IVmCmWPcQCQ7FUoAc2mjdXI6Vun4CESOtgp7TZ/BbzPL1ysQvKYMFBk+jIWWhuCbdj
         gBI6DgINw00GjdIA9p44lmwqHYK57/id3xwbTs5uCy8v4cZNIxLxiIv0AMx2XLjAnH3C
         Ea+l+j6WgNoLX1w28TuRU6e+lpGdTNOmLFjggreQG9OFR3L71bhcUPSJ4VvBiNxuPuvq
         ddKBGzFKZUmonKqMeFOYYTi1Tw6vtCRVa1cj6NAo3DraG3ex8OCKO8Q8YmVB4pM+sOEV
         hYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616883; x=1789221683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=HG2340zTju94xUW0ZJpQD5VYEeH5EgTKwjZGDl3tcqAV50gdKfkdOPgny7MY83l9ir
         Io2qNfT0zBxdJ6pNktOC5f6imTOPHuYBJ3pV3P8fsID6m5RP9ewJ5oyGRGesVfwhSm9W
         ezeAhW5fOYTM7+B58bIpSta0QEvxURVYbYinWxfTsyXsGnJscK/qH8BHk4EVEiuqPV8T
         wW7uUSqPRGdzQSLojLRWHmDVQJEvtfhnS2cypOTY3EqY3IQBWECSbHJ3LBFpk07pN/5A
         QdJyhG7cGuNGjSK0mKm/EtmaLE7tlY2nvGAHqVPa1sCHpBsb5j72EtMr35KEOeb6guif
         Bhyg==
X-Forwarded-Encrypted: i=1; AKwUvBxYW5m5gd98FbyWUTspkZNUxPfFF1qHQ1Xh0DDYvZRJZhAARdm/Qcaw/uZ73P9kZBTLgb5g/fOUy4ETLA==@vger.kernel.org
X-Gm-Message-State: AFuF++nKo265rPVeW6OmBm5vYygHr1tTYcs/kJTQshun78waeCeV/FYj
	s0mgZaA9D8Hx7nErgbMFZR34NxNjyQR0OQ/D8DPOcLohpnf16NSDqMi9
X-Gm-Gg: AYBFou0hwkB+pW9umWe5JPQ64UyI8fhQ/jBMmEwcUP8tp6p4nZJi0Myhu2C092m3MwA
	3ENDeLOhJmJlLnX300Rk1mNtfXheoTxjOCNiGUncWJlyAMc2KvP21FWhrXdTNDuzjPcTRlhW5dA
	YB192XQpvY/xHfssdTCysXXG7WcuONrEh/04k2Ig3nMzlQXrx0cMg/ET9vUjDDPVaLex/wba1MQ
	RJhA2/gol5aWBPKQP3iXOb351gPkJexblXBhha4ahs5gLyYN6GPawIIbzGOVaZB7wWyEY8/cTh3
	tDsKwZExXLZKxxJ5U1Jx7UaYBlhi+NW1yN37llb2V1IM9FV3EFbsHNd/FY1MeCHaSBvojIOUir8
	47v9SJlKXOWkYQINxk/a5O8d80M8u7RE5ZQ9Xy45y+H5tQiIq0vWXg80mKbXwZxBPvrBbFkgWEA
	w0hTiNn96Yajrdm45hfxloP2VmBVC+EBBfnwvA2d68KcSkNguwDYWifaHcD4A/VYbgVl0mu4m5t
	GpMZPqBcQmjPmJEop2NtYBwilfnConv
X-Received: by 2002:a05:6102:1484:b0:785:1d9c:633c with SMTP id ada2fe7eead31-78a4a8436b7mr5213627137.7.1788616882765;
        Sat, 05 Sep 2026 07:01:22 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm3706877241.9.2026.09.05.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:01:20 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v11 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 11:01:11 -0300
Message-ID: <20260905140113.21638-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

