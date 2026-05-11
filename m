Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319DE3DA5A9
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496327; cv=none; b=ZZZQicvN4ZtocOiHfKlLBOOjEq8PKJHZqBHFZXvLMdmmaJSnxttpTqza6+yJZaflMDZe/6HLUI8GhHVaAS10+62yGzlXoAh51Tewfr+knLm4rKNczpi6amG91Polc/oi0ZZF7iXVb5sInRRfdviS3DKLm+lFTWsvMeln6H8fqng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496327; c=relaxed/simple;
	bh=7x1TqayG/2++eQSlPW5R3QUNdJcDCcG0pfAFx+4Iue0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m8KxCvYxskAQK6nA74BjdgaYl1JchLSqyR+MGx9atzqo9o26O5ygGQGc8wIZoXLH4hWAfYkdrNNI28k0QtDDzjwF0h5Kcv5mSbEsZFIy9ntv+CCdRAaBQAskRTT/RyrmHgtQAlN8qr1FA3+8ImtdGr4wny4BPMQZPVva+fbG13E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=zYoZ/V0c; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="zYoZ/V0c"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43fe62837baso2096088f8f.3
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 03:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778496322; x=1779101122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wOVlaLbxyWEmDAGsS4rP7zIxUVqa6gm43xH+775xGEk=;
        b=zYoZ/V0cJfTTatQytEkBdkGIaMooMLLwXstGzmVb2nfC3dbqSKDYDyeY747lC853fz
         ghiGd34wLok1V0NLhZluoGFXQtFYDdb8z/jZpLyVWI6JApnCuBLXdqVHOOOXG+0raRf6
         3EGLdgRettH7RqNl/8WaBQXyGCi0fF2InYbKJZNhI1AF5tevzt8kXON6BNfxyeEI6Kvt
         bFMHA2kV77gMGVBl5s+9AI4U0Q/oj79RebgjQZa3nm8bk3VVZ2NZAurrGNL3xOz8liMw
         DNW2rF7WBe6tXos+RNNqLGz5GPTOIqMZfk9cPp2VBq8M9HBOQYgl2J3Wr+I/dJh6t5rA
         pOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496322; x=1779101122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOVlaLbxyWEmDAGsS4rP7zIxUVqa6gm43xH+775xGEk=;
        b=hh/ynhNPv9u6M7GQtVyFetjAuvzFjUWgEpXR9Pm0PD20JjrrZC5iAuEvBCj+nFlewZ
         oW1y7pZWrn8oBW6vvTvBALT/UAgNiSguzGW3X50MF9owGPyyaKz1Can8Fq0ci+bKVjxT
         KpPObOd/Eo9huISXihjeb4tWlgC0CYWBwJ/fHJEu0aO6P+0MMVnAIyOzzqcJGdYcL0Lx
         GUwuYm2AMZK525lSbMhwTl46LwHE+HLTYm04UBOSFk2vs2Cn7cebhoSS45oS6eoBn37X
         aST+AslvBGIk+fPpP/lpzbqJzPKXAXm0gKlDRxDDvBDiEsa5i5pktuHwcJ+7z+I8wZmX
         CObg==
X-Forwarded-Encrypted: i=1; AFNElJ9Zi9x9ixqUxZvKgWZIKOltO6YLwW3W7k2MBuFZuUzeXXTF+zunwYJza6FZYzdtri+Is/jtd94RUSecdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqtnQyGeZGCPdKxp9UIukfBczujxznV0X2bCb77ehPqbRfBL1v
	xtISg2wUBHgdeEFVSFLPDCfs4ZI/x497ZGce556ZvDn3m8lB7AeKqPtVXuevQTXD8DY=
X-Gm-Gg: Acq92OHyNTareOC3cBTzMMLMOTew1JRRs4/bgN7Nsvd+NDLwR4y3a1P45EWNdJWV2q1
	SQmUJtW78B9OGggOPBMSxbBkoh6WjZEhY0LlSydzd+v6K0afqc+WA1/Kq2MFa7He5qhiCJwrlku
	uK32JOGhY5uOdRpv/OLmbJ+5ROFdRNY797+Ry2DbFdGStFkpEuFdCv3lcWFL4S36RRrp5xqXLmV
	iTlPy6vPCh8/nuN3QtNQPnaQBdYHFXue6F02F//p0iIeLAZxa55KsjeqPmgfOx+J+eCv5jQ9PyH
	r2HvVKXFyduoCwXoGnoXT+ZskdXaZvcw8MOsk8P0E58StI00QseazcBRRWogCO2He8zRzjQPguE
	rLQmr5mJZDGaoqZLUuKtHfUV7BT9Fy1ubJz6/mD878tnYAlIMLsF+sfVme5bjX3ImWvAwovzfg9
	lbHb0fnGN5vuREicnFW8hqRcbCHw6I3B+32dh1L2ynoU/ghJbH1evXGOIWLbIop2gZhVp3XW/UJ
	yLSJwNTV/Rb6bo=
X-Received: by 2002:a05:600d:1:b0:48e:7f1c:8760 with SMTP id 5b1f17b1804b1-48e7f1c87bdmr73299395e9.27.1778496322187;
        Mon, 11 May 2026 03:45:22 -0700 (PDT)
Received: from localhost (p200300f65f114e0841c796eda31a14b3.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:41c7:96ed:a31a:14b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48e701e9585sm173619515e9.5.2026.05.11.03.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:45:21 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
	linux1394-devel@lists.sourceforge.net,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Subject: [PATCH v2 0/2] firewire: Simplify storing pointers in device id struct
Date: Mon, 11 May 2026 12:45:01 +0200
Message-ID: <cover.1778494203.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=7x1TqayG/2++eQSlPW5R3QUNdJcDCcG0pfAFx+4Iue0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqAbMtSfQJB+urLDepKUOwM3XGsGi4ClkgxuWT4 2Wr3Hym83mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagGzLQAKCRCPgPtYfRL+ ThuQB/4wOy1YCl/M/aHwWWEuL8QM3jQGotj7NpV+8wO+U+ai0N0cIfdgg9JAvL5oqGN71mlXM55 J0J60e4XZDlWwg4WVhuKSnnUkwAmUE9lYhfUR5oQxjXsu1WFTFB8w0qcRhSRFiLcD5rupeVQvg/ FErN96K2QNBFdDLNCy7ZnWOQXFR06+0pku101huDNXH1WWoCMn6UT0X8RhbUjrxI5ivQMKV5XMM GLUc1e4OyKRHATsD42BdEssQHQTjHjRYuWGGchGvwWhayOUYvDYL+QGesoziRxmv1LAMJkv+cFt 4CLoxcvo1u/1+9d1Pm1Vz02mQqiaFePn2Y5cXja+w/ZLJHpr
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

v1 of this series can be found at
https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre.com
.

The changes introduced here are the same as before, but the commit log
of the first patch is (hopefully) improved to better point out the
advantage of the approach for mainline. The second patch demonstrates
the explicit casts can be dropped after the first patch.

The patch series intends to not change the runtime behaviour, however
the 2nd patch introduces a few changes to the generated code. Looking at
these for an arm64 build they only affected register allocation (so
where x0 was used before it's x1 after the patch). I'm not proficient in
x86 assembly enough to understand the changes there, but I guess they
also don't affect the runtime behaviour.

My motivation for this patch set is to reduce the patch stack for Linux
CHERI support. This affects firewire because with CHERI you cannot store
a pointer in an unsigned long variable. But I hope these changes qualify
as cleanup worth to be applied even without considering CHERI.

For merging I suggest to take the whole series via the ALSA tree during
the next merge window, as there are no modified files that are specific
to firewire only and the second patch depends on the first.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (2):
  firewire: Simplify storing pointers in device id struct
  ALSA: firewire: Make use of ieee1394's .driver_data_ptr

 include/linux/mod_devicetable.h |  5 ++++-
 sound/firewire/dice/dice.c      | 34 ++++++++++++++++-----------------
 sound/firewire/fireface/ff.c    | 12 ++++++------
 sound/firewire/motu/motu.c      |  6 +++---
 sound/firewire/oxfw/oxfw.c      |  4 ++--
 5 files changed, 32 insertions(+), 29 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3

