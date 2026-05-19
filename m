Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E7833F5B1
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 05:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169231; cv=none; b=rWaITCG+KO1PEdwl4wmU9LJ8KvdXYYpC2gEYuYZ/l3+mxPylhDgVxJJjiDdkxhag03qEj9rGV/ELkN/yTFS2NMl9pEz6CdvnBB6+MKipVf2Gl+u8K1TnjCQyl8LWGv2UOyv86jhqPu5MxauUZbg1Znq0N/qzjmS94viAQ4JY8yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169231; c=relaxed/simple;
	bh=LGUOcBBjpLtj4Y1JYl5LcWsQBF7rLYN6gfKM8t/7vPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hp50dCwoMiOQ5UXfXR+/Q0Bz0D7IrdUTxZzlE6+HmnOABDCRxgRnkyVru1m3hctaWQkpdFFPOPiYGseIMASc7YGUP7SL7zQQ0XiYmkTLhUBeV3qiNm6LCDiGTAE/n4Ot4E0xXzEKiY4pugXwhlmhGZyauNQ491qu7ko1S51pEnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGO4BLbt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGO4BLbt"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2be1dd4af34so12900095ad.1
        for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 22:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169229; x=1779774029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kyasRdVNP43J/qdjOUHHjkFB5jEV1GwjVuC9P7OygY4=;
        b=FGO4BLbtoMoiYMpLi2BosbQe4teyBWmjPLswLe4LXOdS8b1qxfa9Pem5vj8aVH6k4b
         NpCmuuPstiCfoE1gqiOKKako8rYYozL5UpM7/ZhhlbWaFl+Ae41hNB0lsYZNon7GZRuT
         K7Uz9+Hee+IxGv20K4trk2Q3djBcl+WjW30ONi8VW/X4ZYCiI7ze0bAI8az1p7L5/cZ1
         secmxkZC03ThhzJBHwilZql5G0wfHZPVwcE9tAzpfqhrE0zn+kuBNyOYWqoN/IAUyVb9
         xZBxoaYI2kUQO2rYHQ655WanGmuPmMz2wXsdtRPkYiuGbu2yjhDOOMeEUxlyf00ovnoW
         yY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169229; x=1779774029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyasRdVNP43J/qdjOUHHjkFB5jEV1GwjVuC9P7OygY4=;
        b=lXWdV5A0BohW053FxXjBc0aqsh/O+gQW+qzerkHuGs6qo3oXLX81CLLrenlSH+UCvD
         TvAb13ZVOk6/rhCEr9DumD3el5sDJPrv3GqO67Y66WaboVTeE8U29ToyiHGa21RnItdi
         PdrZAKJ5WwdJVKEIpn3QIiJnNUofKJfz5uC+8xdgb9BxC5Dhcnp7ivvaw8coq9HTooPH
         FlTn3dq6PpWhDl1+i7456K1F3Oshyrms1QUvPeYt2p961l9fvmkopbVpMmI3CHEYt6BB
         rMWnhVGu0Bjd0hQsJ3AQbLrLCkaMUKPr+VMQ8V3UhAP8ETvlflB+AvYHOw+zn2YB8dco
         0AGA==
X-Gm-Message-State: AOJu0YwqiuNFHEFT3M+g2MgQiyD9H5JXet8cOE2LHi0vzUzaDcnNQdt3
	EdxYtGMrzXVxeg/BxcrwPQagS3StPnlDmrDlvIUzN1e7E7Whd3xsbuin
X-Gm-Gg: Acq92OHdXihrl3mf2GAEIzhEOZ73oIYJnrcAUYJ6o+fMjVsiez1CtKPQf4ZKAWPonpG
	Vp/6W/5lTrHNS2e1xELFC1YsJMHKcMO6zt6f/kX/c+6oqpS7gysg2+4CKKkEzixQo5lFTCPiLwT
	kNRNn12T7TAIk867lk7wW9x4lXYsEUpJ03VgE7zW4KPQcca6VHAwnO3A3s8zAHzTujg/gvUprnn
	mcChbfTbccyqgCZ6j6hTQ8/TrllEHagZf0sOUmt37kx14rWJkVJI6xaQ3gr+TqrW+Noy3602zAq
	snjjykCxJE2gRmk+3yB+4uRzNgYo7uLgSH4fnTvUPsMO597Ib0+Gee3OOkiQFZMxQ1Nebq9Vl16
	bL67ry3Qq9vh15pIOh84611WtMBDhq5Sw+2qXW4uiyzqvwUaruoZB+dugsJUzIz90C5pQwg/eQw
	zEP5dUVx3Eb+Era83rXqCvDfu5nk3bAgyu9ixc4A==
X-Received: by 2002:a17:902:f64c:b0:2ba:fed:7891 with SMTP id d9443c01a7336-2bd7e92c24amr206379245ad.30.1779169229167;
        Mon, 18 May 2026 22:40:29 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:dc10:22f6:2ac0:a51b:5d77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd384sm172858725ad.65.2026.05.18.22.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:40:28 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH] ASoC: soc-utils: Add missing va_end in snd_soc_ret()
Date: Tue, 19 May 2026 12:40:24 +0700
Message-ID: <20260519054024.274741-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default case in snd_soc_ret() use va_start without va_end to
cleanup "args" object which can cause undefined behavior. So, add
missing va_end to cleanup "args" object.

This is reported by Coverity Scan as "Missing varargs init or cleanup".

Fixes: 943116ba2a6a ("ASoC: add common snd_soc_ret() and use it")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
I am still not sure how to test this change. Thank you.

 sound/soc/soc-utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index c8adfff826bd..9cb7567e263e 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -36,6 +36,7 @@ int snd_soc_ret(const struct device *dev, int ret, const char *fmt, ...)
 		vaf.va = &args;
 
 		dev_err(dev, "ASoC error (%d): %pV", ret, &vaf);
+		va_end(args);
 	}
 
 	return ret;

base-commit: 5200f5f493f79f14bbdc349e402a40dfb32f23c8
-- 
2.54.0

