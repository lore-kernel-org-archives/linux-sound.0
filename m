Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D26A381EA6
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783004044; cv=none; b=DF3I9dK9WG6vb13byZWpydAeSLxywAvEYGuE35RyxhF6UVO1rx6ufePyHAT0Y5foiziprv348XZ02s+lYMz1kTc3AvrV8sQJzCmNf1YjMZImYDQxAG/vH/rq7REf5XeeVUcZ3Sebivsjz88+OwCPGMT4UgexjBG0+/Ep5GgiHD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783004044; c=relaxed/simple;
	bh=xnvnSkh4mR8ONwsduDg/BLAZXZr6/CxgasUbEs0w6+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=isH/7rSeNejKv67BgFXB8T9usbSA9A9mR9wrBdCrK7RXhN4SQH/HKMuet2bE0Fit1RVc3aUd/ljk5B92yLCO7xlJyLsMcFxbHaX21q82e7OoMRFo/ms0ejJ9QIi8HfPmdKNQdzJgIafyILz0PMMn+lch2l4l9mZFStUMKD73YyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nq/Ym8qC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nq/Ym8qC"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c83474ddso4424095e9.3
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 07:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783004040; x=1783608840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kF1f5OWyBovrnxJrEidKvqNse56WBHXzqnAOUsyHHJQ=;
        b=nq/Ym8qCx3EKLOFZ3coOhZOgAykyFBl5VNKSJjNCGrSpuRzkj36WVP6b6WLk11V+uT
         sA8K7XfEnaLnDKGeTinJ8dkMeeol+rVweO9IAStQxrUMRxepuyKjTelCqU1xlFmH9atp
         OFQfD2SQrvR/awbqaxaXO9f952pf+VpDRcddjpjEx2nubP2Je7G08CgT7qRVElw+2rek
         8egnSfdyNJQl0RrfQ7fbT6lpSIEhKS+g2xcgrZwC5Dc00MrO4/FOxYUOj3/BDya7YGN7
         ix9xZQXeu6j6x/5iUhHXauQvhoQY0fGe29OxaUIchzrB5GYsObUBBFliIE3QZgq/flhq
         aTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783004040; x=1783608840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kF1f5OWyBovrnxJrEidKvqNse56WBHXzqnAOUsyHHJQ=;
        b=ENxROufT/e2BEjYu+Tf8WnG1BKQerBsI4MdMoP5lCwxpWxl3ooXtrncE79UkxK6s0G
         emsFKU8lyaqDZlcyaKuMU5lp9UsRpbuf5rPHtmIaAupKqhygHltxDgqAThQx3UuqwSla
         5qGARnyBkASsPzoIGzhPhoSl2e/t/DYu8Sm818uYwSV92YNc1MuB+UE8e7wA/tOtWnjw
         VRHxVkJFx1vI3B6Rf2odkMqf2zqNuj2skjVxEuPCkXD2djWTWst0i+e81rmwo9iahUtb
         2QfmPcBI916h+EE0yok6EOYdaxR5UmoORNlYooP3o9k2YpjDkxuvAOQjktErmz8E5jTe
         pL7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9MChGQPliWcJQKGNpqFNE5pYLHJ4kEEsfbTpWQYII45p6v8VnugEljKLskKjDdkKiHp21Jzjyz+IZQ3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YygCIfxLsmVe2JmOhHzNJwn8FBMEMzEXbjXv1mHABk4XFkjAG1s
	syqYSeizuekVS88w2zX6Z3Xi+GjQh1ehESz+luGvtb+eVvJw91FiRxGtAYBK/pJwI6S6FDtOYh9
	B+7FwNhX9ng==
X-Gm-Gg: AfdE7cnogVotEHCjVsnMQBIkZBMg/u+vHSBI00vu28NFw1jNHwytxofspprInDBwcUa
	T8jn1ssjPjWlyqKB4jbj+L3yCSR39PnPfcqZ9c3KefbwZak+M4p2aYhl9PMEuNdX2UH2mkRlc1i
	kvSN4zNM3Sz47TySxrbaFZWUUQ6UvnZDsMQpPqi+L7DfK/cA1LCpVfxwphrIaPlnJyLXp2NSrtW
	TU6arbJO7cIohT0sfsFiq1lk9Y5F2qloQRn8++HIy52fIP9ZUavL1jv1vViFS4f7GvKAlENbpFn
	xvivwSI8KJtp6GHJsky5M10ZrFyTjgPXAChJ6K7bJT0Py/ItmG12AgpSQ89qs5Z42diqeJgLJfg
	CQ4Sp5m5CEumWa9LmvmSySyn7A6vEwzTEdGYvp8eJt/x4lVvawgfLq6eSJlXvcEy7WnbOfE/pP6
	PuQ7hTOWmpjfjqsc/nDt+fgpJHdwCLXFL1uU0CHA92Xhl+F+i3v082yIkUORUwiiWYN/H8jR8WR
	M52
X-Received: by 2002:a05:600c:705:b0:493:b962:4abe with SMTP id 5b1f17b1804b1-493c3dfacf0mr54863745e9.36.1783004039655;
        Thu, 02 Jul 2026 07:53:59 -0700 (PDT)
Received: from localhost (p200300f65f47db04bdb9899c6dd79ae8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:bdb9:899c:6dd7:9ae8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493c63b6f1bsm49814885e9.10.2026.07.02.07.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:53:59 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Colin Foster <colin.foster@in-advantage.com>,
	linux-kernel@vger.kernel.org,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH v1 0/3] mfd: Initialize spi_device_id arrays using member names
Date: Thu,  2 Jul 2026 16:53:38 +0200
Message-ID: <cover.1783003256.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3505; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=xnvnSkh4mR8ONwsduDg/BLAZXZr6/CxgasUbEs0w6+o=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqRnty/yxLuXfqpkyn+N9SjKdq6zQf5RlY3lz4I 55PYGK74jGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakZ7cgAKCRCPgPtYfRL+ Tn6eCACqswh1Rk+hVIVYEKELUVvKdCmO7XKTWIrWdpQ/WlV0lqQ0YKOrgltvPWKMEUm2uG3Cyru clzgwExexTgigLBkspq263IUPvp7cK/ScLoq3veeoxtVpG3wNHil3Mwz5LKuwxjf+uVKmVokmnl Hnxb1CC4HTHZyPnpdwJBdO7PmNj+4GlSvJ52KUcs2f7WbrUY/u0MgbYFl0bYJCXwUnVyj4OVldu gDLZlTzgj/sCimLCa9vG+nNQvuERsiPBJ/fiwcApIv2M/M/cB3BLpz/oMjZJOaLK5aJaCWGNvjE CunjE3evQ4iBKLGvR+9mGYHc8IiSiTg1cvNAiBYIHqJ15gWZ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series targets to use named initializers for spi_device_id arrays.
In general these are better readable for humans and more robust to
changes in the respective struct definition.

This robustness is needed as I want to do

	diff --git a/include/linux/device-id/spi.h b/include/linux/device-id/spi.h
	index 812e7c3854a7..93d9cd45569a 100644
	--- a/include/linux/device-id/spi.h
	+++ b/include/linux/device-id/spi.h
	@@ -13,7 +13,11 @@ typedef unsigned long kernel_ulong_t;
	 
	 struct spi_device_id {
		char name[SPI_NAME_SIZE];
	-	kernel_ulong_t driver_data;	/* Data private to the driver */
	+	union {
	+		/* Data private to the driver */
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };
	 
	 #endif /* ifndef LINUX_MOD_DEVICE_ID_SPI_H */

which allows dropping several casts and eases porting CHERI to mainline
Linux. A possible follow-up change is the following example:

	diff --git a/drivers/mfd/intel-m10-bmc-spi.c b/drivers/mfd/intel-m10-bmc-spi.c
	index 94b9c99bb4f8..28a3cc84b778 100644
	--- a/drivers/mfd/intel-m10-bmc-spi.c
	+++ b/drivers/mfd/intel-m10-bmc-spi.c
	@@ -70,7 +70,7 @@ static int intel_m10_bmc_spi_probe(struct spi_device *spi)
		if (!ddata)
			return -ENOMEM;
	 
	-	info = (struct intel_m10bmc_platform_info *)id->driver_data;
	+	info = id->driver_data_ptr;
		ddata->dev = dev;
	 
		ddata->regmap = devm_regmap_init_spi_avmm(spi, &intel_m10bmc_regmap_config);
	@@ -160,9 +160,9 @@ static const struct intel_m10bmc_platform_info m10bmc_spi_n5010 = {
	 };
	 
	 static const struct spi_device_id m10bmc_spi_id[] = {
	-	{ .name = "m10-n3000", .driver_data = (kernel_ulong_t)&m10bmc_spi_n3000 },
	-	{ .name = "m10-d5005", .driver_data = (kernel_ulong_t)&m10bmc_spi_d5005 },
	-	{ .name = "m10-n5010", .driver_data = (kernel_ulong_t)&m10bmc_spi_n5010 },
	+	{ .name = "m10-n3000", .driver_data_ptr = &m10bmc_spi_n3000 },
	+	{ .name = "m10-d5005", .driver_data_ptr = &m10bmc_spi_d5005 },
	+	{ .name = "m10-n5010", .driver_data_ptr = &m10bmc_spi_n5010 },
		{ }
	 };
	 MODULE_DEVICE_TABLE(spi, m10bmc_spi_id);

increasing readability due to less explicit casting. This also yields
tighter type checking as the assignment in the first hunk results in a
warning if info wasn't a pointer to a const type.

If you consider the last patch mostly churn, just drop it.

There are no dependencies between the patches, and they are merge window
material.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  mfd: Drop unused assignment of spi_device_id driver data
  mfd: Initialize spi_device_id arrays using member names
  mfd: Unify style of spi_device_id arrays

 drivers/mfd/altera-a10sr.c      |  2 +-
 drivers/mfd/arizona-spi.c       | 12 ++++++------
 drivers/mfd/cs40l50-spi.c       |  4 ++--
 drivers/mfd/da9052-spi.c        | 12 ++++++------
 drivers/mfd/intel-m10-bmc-spi.c |  6 +++---
 drivers/mfd/madera-spi.c        | 18 +++++++++---------
 drivers/mfd/motorola-cpcap.c    |  6 +++---
 drivers/mfd/ocelot-spi.c        |  2 +-
 drivers/mfd/rk8xx-spi.c         |  2 +-
 drivers/mfd/rsmu_spi.c          | 12 ++++++------
 drivers/mfd/sprd-sc27xx-spi.c   |  2 +-
 drivers/mfd/stmpe-spi.c         | 12 ++++++------
 drivers/mfd/tps65912-spi.c      |  2 +-
 drivers/mfd/wm831x-spi.c        | 16 ++++++++--------
 14 files changed, 54 insertions(+), 54 deletions(-)


base-commit: 4f441960e691d37c880d2cc004de06bb5b6bd5e4
-- 
2.55.0.11.g153666a7d9bb

