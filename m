Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A752F90E0
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 04:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790915963; cv=none; b=eDzpTYWOSMhZCM7t6FVYhyM0c8+EpeWbdrHoRgz96igSanyxAkJz6P1h2JfjEaugPYJzWsHLQooIPUUhDmfTftnRoZxARz0WRKqra+TN4A4xCqWJgNIrO2RDe6xm7yNVW4VUzscv9zsJbpIqgogOjQYX8BOSrlwX0LQjqlI0CM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790915963; c=relaxed/simple;
	bh=epTpcBddRVLN4supKhKWX/WetjiI9TNTrTJ4tUyIpsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S45broc4FUCZffJ1CdiDq5eQmbbqdii0pGwKmZllSAu4EvREInWf/CLAtBUgwgk83OYkkuKRKzjdF93RrPpx5tAlJBcTVWqwYyKbybl+1A2Si0jQ5kcv3VsiSJMhNqfnMvH0rXJXmAu7Mu9+G//QYuHVbJzziKhu7v8JjorDlqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRRgcOLW; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRRgcOLW"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2e688de2eso23428785ad.3
        for <linux-sound@vger.kernel.org>; Thu, 01 Oct 2026 21:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915961; x=1791520761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=45yc2BneUr60+dVapMzgxfzf6J6enqjBi0ExeJ7Ehk4=;
        b=WRRgcOLWP56FvxbL9n4TNQ9PqtpglIu+LDX+C3iNGJL3KUPF8ziJQy5YChVKjYeAi6
         1271ogtcP0F+gBbP4Fk4ulv2ddJUk8qbL7+XO05yC51zEsMU8PwkQ3yjihLH5LbFMYog
         pqATfBJYzqiumS4caSQECXHqLJsuPy/iZ2I4PNGRektaYxLfiKHDNmUB9AZpp6D83JHs
         KzxrW1+eQ5VifSGaqma7Yca+uyBhWpB3osVlPUoLRo1DFV49cpNoRqoYADoCWWXL04wd
         ZpV1Fr1r+892IPX/IQtXdEibKEuYRiFt8bPK7Ag8DE8WfGSigfhdZtyyXPZQhK3y3PGR
         S/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915961; x=1791520761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45yc2BneUr60+dVapMzgxfzf6J6enqjBi0ExeJ7Ehk4=;
        b=gvxiEQFmlwXrjLXS3Dn92sV0SyYbhP780B5bfsOUnQrn7wITcIlw8eyjORvgH+2EIt
         8M0TdSfZHynYhwVRb5N+FnUleYv+Gde0iRyTMjUk3BJosleQzzUHLH4oP8O1I+FH879H
         CX2Lp0mXf1JLm5CiZe0eNwWP5eIxkwORQwegzPms6Z89fUssZRgGaLXtVacBNE5Y+iPU
         ZawSu/TswOk59Ww4TBaG9RiXVTxLAZk30J9M7RkxcSqDwtELbJ83uvJpM13ciRRgWvyu
         WWSFQFCV9/vGuOqxR95cHRjPsYaEdz1VAJR7WUN6fuS9onoH5e8/Qffj56I1NWzi5r1c
         xuAw==
X-Forwarded-Encrypted: i=1; AKwUvBySS6oojEZrncD87wihZBTJtbgqbAzZrLr5KD3eKzhYnckqgNYeAf9ULz3QWXjf7f7NF7CMyFL6FCjQKQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIrjg7fSB3G6sofF6NQTiFtAY2hZDstl8kmEF7Uny09HP2jk810
	3P7KrtIZ849OriOO3RlD/moCq9m3gJ9O1Y52j1McZpSqdZmWOLgSz3qM
X-Gm-Gg: AYBFou15Cevw2NpdoUHikww5JmhFygEdzRuyCs7aBT4D3Ha5y5aBpm/y4CGR7FPVcaq
	wrwkOTk3cAuJviHqKyAoe1T4Ql2tBmG+fn5KrBFDhuuqxMsJdUltsqg6XaV39m5x4nskcOQUXNB
	h4zSvujudwsb25kbcVUr+eGo97RG5WDeTV9ISfwsmBVwLSLbAgiMsBNyvd4W05cZZ7czWh6SBgg
	ycCAIKCv3+XSK3kxAJQnJAr1qWAI5IH7xneBiIAfPhTUfpa2BB1pB+k6KjhKecmmtLc8GIyYqWt
	QN6jhyygsCf2C3WU2cdjDjedcXHC50m4UU+2yKGhxiKTNKxR5NtUfaRX3/hahTheYU+SebFZMwu
	sX0TP1DA1K6EGigbcsefDHEFlH9fpkg7305tuCAvk9zHktQl22aesiCm6RpU2ffOSy+rY1UFiKL
	NXHthtOyol/ruDvl9e0U5HAQPYGNMbkaL73z6ZTCAz0QLMHISUyPN4IcklFQ2XbmGJR33JV7Ggq
	6lL+7i3m0RFtNkGNCxtSs6MaAbJkG2TOV/JL/3H+QJBnpxaRuAMtbofKO3NuBHaYs/za7ronENQ
	unTm46M2X5FSQw==
X-Received: by 2002:a17:902:ef4d:b0:2dd:c054:1983 with SMTP id d9443c01a7336-2e49b675cf5mr13473825ad.40.1790915961351;
        Thu, 01 Oct 2026 21:39:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:21 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] ASoC: atmel-i2s: fix clock error handling
Date: Fri,  2 Oct 2026 11:38:51 +0700
Message-ID: <20261002043856.97295-1-phucduc.bui@gmail.com>
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

This series fixes clock error handling in the Atmel I2S driver by
propagating errors, using optional clock APIs, and simplifying probe
error reporting.

Found by manual code inspection.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: atmel-i2s: fix MCK generator error handling
  ASoC: atmel-i2s: use optional API for muxclk
  ASoC: atmel-i2s: use optional API for gclk
  ASoC: atmel-i2s: use dev_err_probe() for pclk errors
  ASoC: atmel-i2s: remove redundant error message

 sound/soc/atmel/atmel-i2s.c | 54 +++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 29 deletions(-)

-- 
2.43.0

