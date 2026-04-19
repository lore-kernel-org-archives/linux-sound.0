Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C9B1B85F8
	for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 06:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776580964; cv=none; b=mhPQCEoeYHOILaS1m6SPtJhC5EDVO3rZgS/RcH2SLRictuGMBVDXsauTUANIi9tVQK4ZYWV6KcPb7UEN48EhSi6vKE/nd/7YfDSywYmZHBlHi3AM10/wwLGCNTX0jBz0KffokwooMcMpOzn1mRcQYVMCvyY1JguyFvxwoMaCv0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776580964; c=relaxed/simple;
	bh=Hrzh2UD8czEvZsax3/vjGyRTIiLbn2ZquVTk7JxRBOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f+M3a6PnjPjNK44HSxVYuUQaSt8lguf+P/gjnI/yiF0UmTvD8y6xesqL1JKGsoxy0ML2SjW2/OERpuWkg8M4USHE6mhJHxWCAl9WqUU4SWvhq+G5A2tw+fTb1g38izvaqdRt32JrAavqnYcGj9MiQ0FJ4pvHiDQumnwcIRGyAfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Voc4hCQ5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Voc4hCQ5"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d7213b6ebso1285911f8f.3
        for <linux-sound@vger.kernel.org>; Sat, 18 Apr 2026 23:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776580960; x=1777185760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7t+57IWlbKD0XO0gxJgAloWfoYu5tAXGyZjFjs+yhoo=;
        b=Voc4hCQ5otqPsoXh+yHeoztQSSkSmXVUNri62jjCq+GxkX+2WMs0bmSH3kdgRNQRGt
         os/EK/0XxnRR5t7z3vOaCHLs7w/gQ94pc09PcyoGGePIhmx6j/QqoTv8aFOoeJym+WyU
         oxqg34s86ainNFdGMJAyOMU6hCL/nFcv0oOHVyL+ccr8C8RCb3J9gS4ck64IwrA5PibD
         0Szw/NlALROGpTmSy1AZfLuNMGeG4gniAA697poOLdRWuqW/okwz2RRq2nODs8oTrWuJ
         wpsz1AJ+9ov6ZaHcu12f9fvwASsq3kxsnGscgXId/m3IKmY66ADxhGNi5WgXhwSl6g5j
         wKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776580960; x=1777185760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7t+57IWlbKD0XO0gxJgAloWfoYu5tAXGyZjFjs+yhoo=;
        b=CeJic80DvukzraYZKIMBFNEYW2bt9AnuEZwtV2jqwqglGvEjH3yg8saPsVqDk6e6Fh
         AUjNuwhA1A1iDEHIv0Z/PZ3NAG+ejHI6RkJbFgunqeJqQAWPfP2JbR6tCGr5+ih3tQ6Q
         2Dn5BBMoQokK8sxxpVvfX3CT478GCGVA2gSxv/rZw6fbFBYL902d+SOgbuKDwq/41RhO
         Sv9fuLLJ2Y1TUKA6wCFnpIlvFTtyvZ0f83nfupkJJRj1de1NFQ5fHU4WW9ym12dsRQvL
         XyeWTt4LKy/KSaFOF9hSdEo8+AG6xKgcVCJFRGaZ7uCRJBOX77agjy3sgY4azMSrZQCQ
         Ui9Q==
X-Forwarded-Encrypted: i=1; AFNElJ95A14tvKe3Kf245aU470LnAhjNHhOYXM2t+7AZSSU/KR23qaN3uAVpqhlQahwMTD+bklCFmO5NowE/OA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvhnx9P7nwUNzq5Lq6dbgPOiF0gfyEOdOM61AKXlPNWnQDa1sU
	qN7//RYYwECSsQ+BHZXiVZcF8J7l3gY5XHXAB3HB8dA99E1EOuKZEOqkXTDQsHwdLTo=
X-Gm-Gg: AeBDiev3MiNgK1WWPKbAMTitl8iltMAhpI5kq6k0fVbFZB59aI6LuFXfgg9as5OVd09
	ijCkQQRz6C7mWJAwb0nMkOAHnLcHuQGIbtBzjRHGVx0ndtaDQpCQjncBd+zWnA5RKREpFQ3L5+d
	Yx3k4gG1SBaepii0FeeZVU8nKeTYLZH32Zphj3KdtL2fNasg4qbZWRyIyjD5mGTDx6SMsGnnxbH
	cPqCJwDTLqa6j9UXcnfmZthzZff+ciBHGrFlKH5IaoFhM79P0XlNZL2UTjBLAVQVInH7B5oqbim
	mEpxKei7MWwavFogzzU+O8FBAe3o5GK2dZAB1eBnvN/sxN3ujy4648jUoAUCgkWMB/qxPSKXyYd
	DKnbpxIrlO+U6teLqt2cjp5QFzop/StmRK9ceA86uI0S5nSaOf8FmRVBhMRE4eVnp1pD+WL4UBB
	e7+awC6mWdx25tW3GH+/gD4M1m36Y9e5z5tQtrEpA=
X-Received: by 2002:a5d:6a83:0:b0:43f:e46e:82f5 with SMTP id ffacd0b85a97d-43fe46e83cbmr9115254f8f.3.1776580960512;
        Sat, 18 Apr 2026 23:42:40 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43fe4e4633bsm18307375f8f.26.2026.04.18.23.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 23:42:39 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux1394-devel@lists.sourceforge.net,
	linux-sound@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/2] firewire: Simplify storing pointers in device id struct
Date: Sun, 19 Apr 2026 08:42:12 +0200
Message-ID: <cover.1776579304.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Hrzh2UD8czEvZsax3/vjGyRTIiLbn2ZquVTk7JxRBOA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp5HlIrQlrp2orjhLeZpm1XxBMffq8a6pL4DhUK gaWtcLkL9iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaeR5SAAKCRCPgPtYfRL+ TrVhCACwzM8ftOvErRcALUTcMo+8LFtp6RhbXRCRFcRoSMmvxSCDwivPTqEca2/8xDdn/S7J18J 1ELzkI5lzB8ZAVTmeNk0uCLMwFaXrHed/1GuOtZt+0ENbNDJ13hv2tTb/Q2Svq81TjQX8YZ98CJ MMY0Xai8n0pfpU0FkLT3pJpz6KOnmX0ewXdbCgV/cRmwNua9JcxEY6lptpnkmNmkPIhcJSzSQqg LkpkhseBmbkQMp5lz1SN/7h8pSOeDmJU4IGQ43tR0sANKVvoQja3cZBPJa1iyle4Hl4rt4KHNwG 3XrnHnPMR0cqF1lYRA4WGO3ayOAZi2Tr/j4iO0zSZO+mxOIC
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

<linux/mod_devicetable.h> contains several device_id structs for various
device types.

Most of them have one of:

 - kernel_ulong_t driver_data (sometimes called "driver_info", sometimes 
   the type is plain unsigned long)
 - const void *data (sometimes called "driver_data" or "context", sometimes not const)

A considerable amount of drivers for the first category uses the
unsigned long variable to store a pointer. This involves casting both
for assignment and usage.

An additional complication exists for the CHERI hardware extension
where sizeof(void *) > sizeof(unsigned long). So with that an unsigned
long variable cannot be used to store a pointer.

To address both issues this series replaces the unsigned long variable
by an anonymous union containing both an unsigned long and a pointer.

For all non-CHERI architectures this isn't an ABI change because all
have sizeof(void *) == sizeof(unsigned long).

The first patch changes the definition of struct ieee1394_device_id. The
second drops some casts in sound drivers. (There are no other firewire
drivers that could benefit.) I adapted all sound drivers in a single
patch, tell me if I should split per driver.

For merging I suggest to take the whole series via the ALSA tree in the
next merge window, as there are no modified files that are specific to
firewire only and the second patch depends on the first.

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


base-commit: 028ef9c96e96197026887c0f092424679298aae8
-- 
2.47.3

