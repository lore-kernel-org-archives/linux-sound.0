Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8071A9F9F
	for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 00:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770943389; cv=none; b=FrcUwiMEQIepWNHBZltfRKOKqvU3jF71ZLRNArsIflKMv5DD4vUhzyGcHLmDlio3T/TAdTTT0HXDFoeKfMuo3IK91S0lPkuBKCoKxzN7nGMnlGoii2rgo176WA6gyqXi0DP8d36YSaHLxAGu7vE3b5qUjSUIYmW2ljK2BSb0hos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770943389; c=relaxed/simple;
	bh=eX1b6hoxdm5YaezC+qZwQompAMil3Cx1PPWkITr0krI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u0i8Xdc806wDHLqtMuWQaxJWTNxBUr4DND0YU6yzA28uPH+gE3KnU1+PUuDTlYsHWx5dOWXec24z79ojxJBuFoT6TxpugPNTsVVpdsL76mtgcvCb4+iEy8ILZo/V6Q3Q5lFAX3MOe2xox4mat2k3qxIYFMn+kwDaQSH+tQVynNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwbKh0b3; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwbKh0b3"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-823075fed75so217291b3a.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 16:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770943387; x=1771548187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wuUVGBnZtCkd90nI9noZVgkPTlo0+XZExiJqWCF4aV0=;
        b=PwbKh0b37e2QgmiOZwxSCAi/9vT2+HZ606NP9oU6JSxoDKNQLhrhpU/SFMww2zXi7V
         q/LxvR2rcMgVW5k78yIMamSmzatJkwOeS8u+IvFshR+xlAyXHttb+r1ElMb/IUdrdC+5
         ZLY9bcU0k0tddeo5WGVBLZXCLwt9faWA11wZGflnqLNseTOsKafW1fzpy0FWkA9kKIcE
         8DEC7NWzLKFZe+xkhoEtPOJPTzDcq3aqNXpW7CGbyLeBdFgqX0pkJzxsoNzENdZOG9FZ
         au5INh4LIYTwgVBd+u/R4oazaBrvw0yfG3ZV+mJiolCHejf07KYH9oqfmYzZkXJmnAnL
         j33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770943387; x=1771548187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuUVGBnZtCkd90nI9noZVgkPTlo0+XZExiJqWCF4aV0=;
        b=mIKJ3qpUskjfEri6nN3986ygZ/OxEQLLX6YYdy/JUrhdqFwrDRJYHyIx2Xji2kNwTW
         6Ja+XxDQS16fv2DjpEavtkecI5ubdQCcHmd9HfzjIKMZvIiX42gIMokKXPbadXqXcBa2
         YMEXd+lQrfrqI+FM9NSQAjf3cG0BkFAD7QkAoHaw82Z3I2WgDolHgmtbsjGxoI8as6On
         SDJeTbxM8813uELXSqAJIVrkQDVWKxZXw91Dg3QkT+A6/fueeqWHsqycs7AlQA34HOTN
         g6QwabODY7lGWJe5Cx6irgTG247pvQpFeedy56JtlThf+uAmL+lxVHXMCaLLjPytr3iW
         xSaA==
X-Forwarded-Encrypted: i=1; AJvYcCXyXb3rkDrZIGaHBbGhYJBRvHtwcm+GTZd2tzne7tHjFVTIi5n9aN7WEtML5qpZ0Q2aIUip7mjbKimhfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxBQsIQnangqOWubytcN9+jUP0e5ddCYf2zky15KIvc0Chvr9j
	uIx7oQyb7kr5fALKidD8IRxPPN3lSNUiEBC4MbwOe4pvNQYCQk04eQTv
X-Gm-Gg: AZuq6aI9akI7M7Z2vDV4ft8ImDwTiFRYSsyB3g0zakGyD7yPQQHPp8xAHz7Nh47npGX
	/OjuQI1WUfyx7XBPjs1R3w3uRmHLiE2EE86OSfz9HJrtvcwr8LdSL0o4atqM/jLxIAz8dpZuYl1
	Fcr2IGoE1mzR7Ql2OB+hhuvlSFWLye4il3Tw+OraL5bmoqhEVXMUh6DukE1btJpz298sjxBFMD7
	5KO1w6gH+DnUc7WQp/tUaAIHJD3mIt5yT37wqVQUh53ZHSEKLXTtG9Ro2M2q3mfMykBBvGuBJml
	OlLUYzIVE73/cbi9VHtlXPVMxJxLHGjJb/MJhUw49piFTaWuB2Jqebvuv3Euapxnex0Ad10s4wu
	tCR14r3wzseqrC9VxUk9hoHhlF/7K1LWaAig5rZybdwWMMrqd9yBa3BT+0BjJWXDHfBMWvjoZ3g
	==
X-Received: by 2002:a05:6a00:14c8:b0:81f:832a:174 with SMTP id d2e1a72fcca58-824c9d272b8mr170016b3a.16.1770943387382;
        Thu, 12 Feb 2026 16:43:07 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69ba2sm515751b3a.38.2026.02.12.16.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 16:43:06 -0800 (PST)
From: Mingyou Chen <qby140326@gmail.com>
To: vijendar.mukunda@amd.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	mario.limonciello@amd.com,
	venkataprasad.potturu@amd.com,
	Sunil-kumar.Dommati@amd.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v5 0/3] ASoC: Add DMIC support for the AMD RPL platform
Date: Fri, 13 Feb 2026 08:42:43 +0800
Message-ID: <20260213004246.16615-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2:
  - Reverse ACP CONFIG PIN from 10 to 14 for rpl
  - Remove the rpl folder
v3:
  - Remove rpl configuration from Kconfig and Makefile
v4:
  - Handle separate switch case for RPL platform (ACP Pin config)
v5:
  - Remove clangd generated compiler_attributes.h include statement

Mingyou Chen (3):
  ASoC: Add DMIC support for the AMD RPL platform
  ASoC: Drop RPL driver
  ASoC: Add quirk for Lecoo Bellator N176

 sound/soc/amd/Kconfig                         |  10 -
 sound/soc/amd/Makefile                        |   1 -
 sound/soc/amd/rpl/Makefile                    |   5 -
 sound/soc/amd/rpl/rpl-pci-acp6x.c             | 227 ------------------
 sound/soc/amd/rpl/rpl_acp6x.h                 |  36 ---
 .../soc/amd/rpl/rpl_acp6x_chip_offset_byte.h  |  30 ---
 sound/soc/amd/yc/acp6x-mach.c                 |   7 +
 sound/soc/amd/yc/pci-acp6x.c                  |  12 +
 8 files changed, 19 insertions(+), 309 deletions(-)
 delete mode 100644 sound/soc/amd/rpl/Makefile
 delete mode 100644 sound/soc/amd/rpl/rpl-pci-acp6x.c
 delete mode 100644 sound/soc/amd/rpl/rpl_acp6x.h
 delete mode 100644 sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h

-- 
2.51.2

