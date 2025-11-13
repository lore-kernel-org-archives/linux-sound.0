Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5204A28BA95
	for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 14:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763044040; cv=none; b=S7C3+P+PIdZcx3MquC84BqslWG4lSZO12U7Jxzpo0lEnzXeYC3ZPrf/dpCsNo/WkcEfX0XMf8AgJoKXmsQWrBR2XVUl+pWanovD/K0lWpS4asgrvL4Ug4cTXF9DvHepTOqLGeC5JEjPRngWKsjRFtfxIO4x7bA6lgAfjJYIlwUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763044040; c=relaxed/simple;
	bh=0Tw6q9uVnCB5RsC3DsVy4ZccNs7ur2RBRKPq+4D012o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dp71rN/ka46izlvblXui1FY9gXCElkU90SGaSiyWUn0DAegY8NlyJvj6yyS+BS0Q0yu2DGfRQWMRFnvlh/lG5GQ/g2Sz+gr1Xx5/2B+wCILGxIdVMrD0J6u7oZuk8KJ2sZGy9rfSarOikt8esWB8T2QgaliReBKha/XI3yg7Ljs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsycDSpp; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsycDSpp"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so357220b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 13 Nov 2025 06:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763044039; x=1763648839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UFXYEF7QB/i0A/FdoVAEDHxZYMr8pDZZX3lr2SNEpCE=;
        b=CsycDSppE1KSpDgiaKq+TAMob1NKpnbMq1D1lVw/J9USc8WH7u5CFqzDeC2lqnsG3+
         MM9uw9UJMgoG/gx77LPgibrpwpkkGRc+ol+7pPWMty++MOjdNCeNqkYsNA/QWSUaeRAS
         4E1RXaSpPFDB14wv1y6sAkWFMs6W3MOWUMM+CgtOCdMsA/toFdCl1rG9L66lYjEwSxYo
         OQxKwwfJu1jZa2Wpppg/kMboIvbczPP5dhJOxS45B2h1csmC0bcg6q3eJoLVcjK1EKTH
         2BhNyVwZK5qZpIaK83A1kwNE7thGe1wLgLKLsiPi1Ud7UtR+RFHYPX2VJL+fApyXrDFn
         G3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044039; x=1763648839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFXYEF7QB/i0A/FdoVAEDHxZYMr8pDZZX3lr2SNEpCE=;
        b=jwdDUYM+kd1kKmlmZlsSV9lMYc4BHb4uCbJX65ji2WARP+XxXwhH9g/ZUz9OVwHZiY
         MupAItC2RMUC9gRmkA+eSgxKQyWzuJ4N8R5ah6cNC6k9yB7ZuoqFl7iNDfwHGRq+iOac
         ViGSmq1QTyM+mk1f0hijNTvq7elXcqlwt2jOnjyW8IUenT0/0aWev9nSpc9F/e0F2L6E
         mu04DXfoAFG48ZJ+ZMdklcgvM2GkJxzIwG+Dddvj0bIbuOS1TVJDSqzbLfaPHf2VF3/j
         412Q0HSDB11iQ+Uiq8GD7l/7JclJ08ZLcjRACLsO7ESwVpXAqO13XJ+tntgc0PdmvugL
         wHfg==
X-Forwarded-Encrypted: i=1; AJvYcCWYNkBszimtmji0ClJJcuLnV1TOXBroN+OT3acwY3T2fL36uk+1P4noCY2F5GWS6IwJF+ecqqb5KtLOUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygS62hY8R1EQEVXPZAH1Qswru1RQOpzWuJvg6C0f6TOxSaejZh
	OokD0zbJ6DyvsVaa8kyOVAXBLSc9oXlZJl33cGKyVWK0h78KMiJr+Snz
X-Gm-Gg: ASbGnctA/PG8nu8wnjrhzr/1GBxwrwDr3W8yVxsxULKYCkXsST4jHxI76xIFKiZcpr3
	NqC1R1f52KQYXZ/L73DHlcEp45dYfimIUkLWu10MK8hYYH5zH2qxOcECUc8eT49lo9wa7zyPr4J
	BPvh3YNOUlgsoH9dnNBeIkWHVpyUS43OF0jIPLfJwcTcVg+kjPHgvmi+0W88eHtAmaP5iCPH92B
	7uk4LQJUt6tGoIf+SHOXp5wlmlI91uvW4LfrEphx1QLNOxYCg7fnozeklKaLxKZiz4bkbUf/OVI
	6KQql4WDToZOh8LrUZFo7H8x6TJkgr1zBVH6i9mhMpH7vnNow3q/2jX5hKBRa5htX8xMB6+P6Bz
	NpAcD0hXkbad3/zwQcFC6dEND3M/zQ5H3KpMMAcXAKyJq4td7PlzbZn96d7MjqrTmcC5iCj9sCh
	JTM/8geHx4Y3BXZxlj
X-Google-Smtp-Source: AGHT+IF3GrG7ZK+M9RU6VrohEraA5W5GhEDI6zHXa1dkOUqo9dFQeLn6sFP+g+cHtwCkgQIyJU9QrQ==
X-Received: by 2002:a17:903:2b0f:b0:297:f09a:51db with SMTP id d9443c01a7336-2984ed45caemr92249865ad.15.1763044038540;
        Thu, 13 Nov 2025 06:27:18 -0800 (PST)
Received: from gmail.com ([152.57.125.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346dasm28242755ad.7.2025.11.13.06.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 06:27:17 -0800 (PST)
From: hariconscious@gmail.com
To: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	sakari.ailus@linux.intel.com,
	khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH v3] ASoC: Intel: avs: Replace snprintf() with scnprintf()
Date: Thu, 13 Nov 2025 19:56:38 +0530
Message-ID: <20251113142637.259737-2-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

snprintf() as defined by the C99 standard,returns the
number of characters that *would have been* written if
enough space were available.Use scnprintf() that returns
the actual number of characters written.

Link: https://github.com/KSPP/linux/issues/105
Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
Thank you all for the valuable feedback and suggestions.

This patch updates usage of snprintf() with scnprintf(). 
As in accordance with the C99 standard, snprintf() returns
the number of characters that would have been written if
enough space were available.With scnprintf(),the return value
reflects the actual number of characters written.
Change log:
V3:
Dropped the Fixes, stable tag & updated the commit message.
scnprintf doesn't return the negative values as per the contract.
Hence removed the check of ret < 0 as it is unreachable.
https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.scnprintf
V2:
https://lore.kernel.org/all/20251112181851.13450-1-hariconscious@gmail.com/
V1:
https://lore.kernel.org/all/20251112120235.54328-2-hariconscious@gmail.com/

 sound/soc/intel/avs/debugfs.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index 3534de46f9e4..d224b25323be 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -119,16 +119,13 @@ static ssize_t probe_points_read(struct file *file, char __user *to, size_t coun
 	}
 
 	for (i = 0; i < num_desc; i++) {
-		ret = snprintf(buf + len, PAGE_SIZE - len,
-			       "Id: %#010x  Purpose: %d  Node id: %#x\n",
-			       desc[i].id.value, desc[i].purpose, desc[i].node_id.val);
-		if (ret < 0)
-			goto free_desc;
+		ret = scnprintf(buf + len, PAGE_SIZE - len,
+				"Id: %#010x  Purpose: %d  Node id: %#x\n",
+				desc[i].id.value, desc[i].purpose, desc[i].node_id.val);
 		len += ret;
 	}
 
 	ret = simple_read_from_buffer(to, count, ppos, buf, len);
-free_desc:
 	kfree(desc);
 exit:
 	kfree(buf);

base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
-- 
2.43.0

