Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC28410D0F
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405265; cv=none; b=hdtfyIwutYoIm9FREPYKdXRzp5D9lRSOczqBS+qP+i6bYqzApVV4xwfb4lH9lI7lWqYRvJd8V6ljxgiP1tRGUmMGsZ27Mtwy+Hb9AXiM0t+caLnctk1E11tB3uJOawLRaWyNcjmhKhEIqAjAl9yexgYbSnpKhLprfGLSBRJ+zMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405265; c=relaxed/simple;
	bh=82fcUoDRl2nSb20Rd43SntUdptKnxIt4rrcadHELnrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q7KRkdJW6ZLgKTHTUbj87vJHmMV3l67GU0sJIkbMTg9Cuk4hGMH0cSCUu+0My50oljB/dpYQazVWqTqPzgLA4SAW20GrkRwu7F99mKjf5Rqz1SCO+WrpaVn03+aUnmMq7lRARgRoOriPKj4CrMbuyDQCKNyBYDSCqwx09rNX5zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/ONebwe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/ONebwe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc73e322dbso21661195ad.1
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 02:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785405263; x=1786010063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m229SVo0Mw5VKTG6jR9EKPhPNMFDGsLNCMKsN/tu7XM=;
        b=N/ONebweepsejBISkzhJEHQP/EUOleK7aO7rF6JOewIJxViSRhj3sZjg0zRt1tDtyS
         N5crBxir6oX6BC+lIYJctqLVLOprCWSJ8cU4pHp2NTgfSG+qGzZliPP3C26QS3/0bzLt
         U5BtIq0MJa5iPR/7jUmReOxvsuCTYBrS/b4iqs28paiY+J6/resoozmmEPLwy+PR2piz
         FGyvaxOnyglyHPzCM4gT5o0QmbCKQ6olzYE3w1EoDo3o+iCbl1JNneTlZVZNVP6luavc
         rF8w8dnDVaH2ugINWz/EZpBq8NUCi0jpX4jCbmfJ5j4vvO46AUwGjw6Q+KSsEY2MCpLI
         k66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785405263; x=1786010063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m229SVo0Mw5VKTG6jR9EKPhPNMFDGsLNCMKsN/tu7XM=;
        b=VgqlqO6SlH+csycivLo7Ns99Bv76CB+6BcG2B2eyNcebCyBxYJM1azEHSxnqfQrjBc
         Pjq3FgbHNTwI84xtwnfHfPNu1nJa0hC+wZiXmmlNJkVX3P/mY2KdQ1DDJ8gS57vaBBud
         Yhy5nCiLqRfUK5EYbYc2zu9KhkTuktMiWg/oUXiSDcWRNjrRdQ9QQ9palOhbMeLQYUsP
         n0yuJbOZRwCExrWDSNSaY/CFDJyCKmkvNbq+7FUBBcYzkcln1XT/biwQcyxhzREaq5b3
         nlMO8XCHt1fi5JdCAGmZjbB/F3Vovr9sOeUxvuvvdczge2MuwGukNMjqD8qWep1Mqc7D
         5emg==
X-Gm-Message-State: AOJu0Yx8qi33/S0FKKM2MG/GpyRpptDU+931jzizkxbJbpmJnbYGQRDs
	l0YWzwkoZLSNFaN0CRWqU8c/Tb1MxPDKLEEJa1/R16W2TuercfKffaVq
X-Gm-Gg: AR+sD13lEausen8aSCM/3kqgL4KxqM/HVYPbe0X5osX2utF4TxyxPhGt6cYwYY1FJXQ
	p3g9htgq6cVGbEYqCzx0jFOJi4S8kHt7NAmjSvvooaX0WoXvRz1DVHwgwv+kGm6ZdgUJVwiwfOD
	RqJh8jo7Bzsc6SdUlocWC6AioFkA3CattO88k8ZJho36+WVlq5+2IEHMzHrdNAzA2jCvh1fQqBc
	+R5cE9eMy5m8ge9xuGnjkfUKoNaVTapFYMupXdOJFBDT/tbedPPHTiuZxKigcET9ZiV9O81fOpf
	/isjSrBIVwXBbKYkBX5rt4FigqitEhRVaeZ93rgOW2h7/W0CPsGnPdQoajJNSHm8jhJO9YOyomc
	pgMySAqUmWXH/Ao8vNGbsqeJtxI2R8cK54datjwu7tdQWxmAgQSyE1fs/wSP31IhCAoiYre166T
	SlZbWvpA5qef7WdonTE/DbMwG89sQo8zwwWjWNS72aGKrQ9sxYc+Sa2PL76ZXDz+AaHJIfWSB8j
	z62G1xbhLTVySsrUNSfBlAdwwiGojMTJfk7bX628Ewk1p5GuBjrhx5YnIc9Hp+6rux/UOiKOEjX
	W13Ct12rEnwRQn8=
X-Received: by 2002:a17:903:37cf:b0:2ca:ecf6:9104 with SMTP id d9443c01a7336-2d035c1c89emr19751155ad.4.1785405263536;
        Thu, 30 Jul 2026 02:54:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c2dfb1sm23982345ad.72.2026.07.30.02.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:54:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Tim Bird <tim.bird@sony.com>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4] ASoC: spear: Update the SPDIF drivers for current ASoC APIs
Date: Thu, 30 Jul 2026 16:54:03 +0700
Message-ID: <20260730095407.33894-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

While cleaning up the SPEAr SPDIF driver probe path by removing
redundant error messages, build testing revealed several compilation
failures caused by outdated ASoC APIs.

The series first removes the redundant error messages, then updates the
driver to match the current ASoC APIs by replacing the removed
capture_dma_data field usage with the corresponding helper API, and
moving the DAI probe callback to struct snd_soc_dai_ops.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: spear: spdif_in: Drop redundant error messages
  ASoC: spear: spdif_in: Switch to snd_soc_dai_dma_data_set_capture()
  ASoC: spear: spdif_in: Move DAI probe callback to snd_soc_dai_ops
  ASoC: spear: spdif_out: Move DAI probe callback to snd_soc_dai_ops

 sound/soc/spear/spdif_in.c  | 12 ++++--------
 sound/soc/spear/spdif_out.c |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)

-- 
2.43.0

