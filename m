Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB154418A33
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 11:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787224398; cv=none; b=F5qApPF+gyNUN7fYm8yaP6Tcr49eBYvrjlJHSPuWuwT5T62fMR7sl5BegmQ1k+LoIH6ogwUBS7zuVfLV1O4tRu6KnnXuCLW7Z8X7K/K6NzsQUKEJdqGZADh3sk1rr7/P8xz4lv2/lSanSBF+kTbCbW858PYm0dbX6cAKGmOSY/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787224398; c=relaxed/simple;
	bh=Jnlm9/ph8dUyerL2gOM4nsth+MKXkHZ9Tj8imw3s9XY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QAHgP2xV8u3gT57ogWSBv0gvNRRMftmH21ie3DvhJhXa4snOvR2rz03X2xQ9o159iWCasUZRZuFY/+vBVPVTjUWxK4AnLVs/7/J1TfFvTDaJU+XrQ7FbTv+Y3u5LP26w+9bCXM2WX2zcaPMlhMaRuDaiwP5rEuGZGVvmrkiv7+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJCLvluH; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJCLvluH"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84a652535dcso1228332b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224396; x=1787829196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fA2Qh6VZccXsUY57cmXDESi+CqIM725cXDSiwO02/c=;
        b=TJCLvluHFePR5qh3xyBkq3J1jVhhX4JYXhiXrLRYyZi3DTTe5N7co+etzcGhog+zfu
         O3NvAkjqCXmc0y1PGZw+XCZSUK8H4lDRKGNL6wkM9W9xku/DnTg90CzUmklp9q2lA0eV
         RCGk4TAcDve6cJ8X1rbi5wg5IDxU/cMPOHyjmL8ppDHrXIZbkShGGOit1suuXWgeRMmZ
         GxZeI9sANW8IZI9KyXy0rD0EejSJaIDQqF+HnsQ6nMRZfHJGuwdGSNyZ4EAUG/zVCaQz
         qTJXztEsuueGZ6E2XgTA9a9YLtP0qjUeDarl08fT641hKiuDayrUTmpGxwTBlZvh1Ovb
         Vk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224396; x=1787829196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fA2Qh6VZccXsUY57cmXDESi+CqIM725cXDSiwO02/c=;
        b=XLCjWuhn2xmg6Q/NlQ/FMRyOfP8OIoqAb2Vuy5LZYG4mznCJuteeNZySI+PHI2Rn1j
         74SQyrdFMooA4phL8xwHHb3kSEKcMNtG5BPrOSG5q9XLsl1tiidrNhOavw92lUaNLXDF
         KoTsCPiOVC1XJuSmmZrMjp+mz08gpKzhUaVA0hhWNSeoep/ph6zzbR0WDlnfl90amjYR
         99Lmxbv8/4oz3Mh7VQNiF4blqsTp1JHiEA43ltGwiGGXsWa3JkedLfRsLLfQFMKD1IJZ
         2hhBocWhL4G3ivDiOt4UsMItVX2G3eFOR7Sp2QQm5lVNCEQdNi/z4fQzMEZnuW5f8Rxo
         O1gw==
X-Forwarded-Encrypted: i=1; AHgh+RqtwUfx1T5UQpI7sXeswiUODk0suEWylJ0DtjRFKVezSXPP+MnneaBNhiMWA4AMME0tT/x1OUc4xJWfew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmV6VlaGujimtjaDnrezexpk/8ve5xEhoe27XZMubQ8u+6ijYE
	CGLlAiOGsxDlKf+EPvL4BLKGNZ1C30EbfJRo2T2ohQuTnVHaYRbRI+Nc
X-Gm-Gg: AR+sD12do3t2kt06CVXYXF2bSvvZs3LswBHr/O017qDgw8MJsJWW9N2H0w2yOcv4llf
	ttf3PTc5vbhHmyS6ySulJZUSY0LNSlszorhlnWY2V0EHacdy2uHXYwzHb2LTmLTKbe13lEm6Enf
	0obq+dYLzmpXopynsm1oS5fOGtx7XKxJINluw2FC0+UIlnJHNTT+8sJGb5787V3qY86xbkJp7fs
	a9saLmxUP9ehuouigj+fsHnJDg2QHXQgUjR1SI72Vd1KkFhIrJ5oSg4YYmZ6hP0UaTWyZWVkP4D
	UKF5eHl17xZO9g3eR5n3sFwG0uT85isr9OavgZLIGGYvlSf3XrZW/3RfD5c5oK0zvxSYYKMDGR3
	JFx1k1v2RUxC2R0vfOdBwA19LFnP1LpAlM6VbtSGyXKWFmi7s8TufBkhvIkLtrF/Yt1d9MZCW1S
	cWrGRz/LZ2IGAqoX6No6iwOswUPufvN3CrtB+bLjBnOgYxtJK7zx/o+dQrgOOdvgdqbC1kyxqmb
	xzNQMlo0oJikGoRzyHMDGsLmhIU/cJoFN+HgXv+b7f8gcG2EAIzT83vu+9QYlA1b04YUgym7kL0
	4o266rwQbommIZ8=
X-Received: by 2002:a05:6a00:a20b:b0:84f:d7e4:3404 with SMTP id d2e1a72fcca58-851d3911ffamr20072394b3a.11.1787224396048;
        Thu, 20 Aug 2026 04:13:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] ASoC: mediatek: mt8186: Fix clock error handling
Date: Thu, 20 Aug 2026 18:12:48 +0700
Message-ID: <20260820111253.97866-1-phucduc.bui@gmail.com>
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

This series fixes error handling in the MT8186 AFE clock code.

The current code can return from clock operations without cleaning up
clocks that were already enabled, and can ignore clock lookup errors
while later using the affected clock pointers.

This series keeps devm_clk_get() and propagates clock lookup errors
instead of silently continuing with a NULL clock.

The changes therefore assume that the clocks used by the driver are
required. If these clocks are intended to be optional and
devm_clk_get_optional() is preferred, the clock users would also need
to check for missing clocks before calling clock APIs such as
clk_prepare_enable(), clk_disable_unprepare(), and clk_set_parent().

If that is the preferred approach, I can rework the series accordingly.

The changes were found by manual code inspection and compile-tested
only.

Best regards,
Phuc


bui duc phuc (5):
  ASoC: mediatek: mt8186: fix APLL mux setting error handling
  ASoC: mediatek: mt8186: Fix AFE clock error handling
  ASoC: mediatek: mt8186: Fix APLL enable error handling
  ASoC: mediatek: mt8186: Fix MCK error handling
  ASoC: mediatek: mt8186: Propagate clock lookup errors

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 112 ++++++++++++++-------
 1 file changed, 74 insertions(+), 38 deletions(-)

-- 
2.43.0

