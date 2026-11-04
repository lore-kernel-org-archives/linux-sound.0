Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800321;
	b=10Tosyb7By45v4IxcT6ANn9OTp0N1GOIdv2YKasHBb627iIWOEOkuoKkJHsNOjDK2nCV
	 317JdG5DP44l3p3BI0lZE6GtJYImqy7o6IIayCCQtQx1YW/n82V2mZ6Xncke4tCxJuJtl
	 bh+/97CNALB4bcErvHFWetuauEJNfpBkm5dscHb3zm+nmBxN2aZylc2r1p72TKPxfEKps
	 cCvMBCyu6M2FdNnLUmQyMVfaFL4dBKjGXayURYwjC3c38In3Yvv6tAGUs7jB3GfZr0H/T
	 cni7A+5GfuLIKD0tjQrBmIuo/uYt4MtgKKsgTtHSz/ocGtJWQSMRsorlItqdCzBzaqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800321;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=01M35NZZpeWjd4gnv+/XOBov4FxdMv9wcj9zzRZb8b8=;
	b=hoK3AvosT1nh02tfOxoImx/LlLsIKYx2UQKigNXBlGK1X1Q1OffsNvdb8F9RgoSO8iiz
	 e/GMmdreQg26hpEWuGSS+lpLrFqU9EhRZinq2ArMn9J3RwHq0MwaMWibaiDYiYKGqXXoF
	 yIuaNSK9O4ipNGlGoOrFi95MnLFNhbJQmO5fhXsWjfL2jaXbVRKbabd2Wol3rhkbWJLiq
	 IyORAezQiS9HswaazY0mXovaTD16R4mjXMYG06OfjQNGU3spCnpJ7//bWSupNTR2srXyi
	 JPPVCz3jGra20PK15VVRYDbNONt0CDalbRav8WVJRIDp5ARDy5Nq7nu9ebPaDxcMtdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbMwDCU1;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C5C606A32C
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 13:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27C5C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QbMwDCU1
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so11093925e9.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 05:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800319; x=1794405119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=01M35NZZpeWjd4gnv+/XOBov4FxdMv9wcj9zzRZb8b8=;
        b=QbMwDCU1GBBhi0HNBlNPffLMPbXZaDrj0/d19Jjl2+wLg360OT07xsf1if+9nb5vLo
         NGT/muRwG9UdP1eqVjFjyd4EKzi/216CFVu/48xCeYXkV25whP1XKU3SiQDNqU/jbkTz
         xSyNnDbOm2lf25kxV/RauWoXmSpmm1HoSZsd/WMa29zfcGldjRjgU1SNCYHTXIwwu5eM
         QXc7eTC9gCvqc9Brh1QkNdCLdPqWi8ldcYGBMe6crKUCjnmznFHDEtHDKv235CI08d07
         wd2v2DNEkZO10vYdlXXFvfo5HRjO+nd3MI7J3oC+FrxIZ3ySi1aloRp5hPujJTF+ypIL
         QUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800319; x=1794405119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=01M35NZZpeWjd4gnv+/XOBov4FxdMv9wcj9zzRZb8b8=;
        b=jkL3uyqnqzJ8tfRe++sDUK/5zthqistxEtngYKfDU2/6IOhXC1ggaBiWm72syfpEhS
         dwwqxQc4L1ZlU0hXMEZvXxFXA33RDl/Gmqc9bmxNnlY/6yEqxhFlwIJW/KqtVMqDLntn
         rK4/6Xhe8tCxOlcDFX+3y93aHLETfeejh8u5OJK5ww5aosLscszSiB5nf4Luec3T3rmq
         9wbystyzCHZ4sa8J+t8Ufz8yepsOwy9ZeCZBiUCXHJ7ee1rkz3iJ1EmUQjITY37y5GW6
         vB4bgArzDllKA7TZxu8+TE1Ize8rBIAwRxczOY1n0pJgApJ7pe1VIZk14xwPh0ytMWDT
         MiGw==
X-Forwarded-Encrypted: i=1; AKwUvBz51nSQuN6GQkcjCQ9neiapzkEjT4M8tXezucA3lA9ri1Qs+ryitEsNQ9TGqT7OxTRkXVnOghJM9o4/Cg==@vger.kernel.org
X-Gm-Message-State: APuU4Z//IBfalBb+GDVeCb6j+l/LGpkOVSkTWu5QkaU7L+Qo8Ue47FO8
	o3d2/2eXawDVjIQ3NqbOGr1fLRrmoooQ5vbB/SFPFvRQmHLuYpByjXeM
X-Gm-Gg: AYBFou36oKIHuNCQ5m+HkVeeq3YJwbCU0pt1t9jaA/M05NTf45kgvjxbng0lLsC5rZ8
	U7c3cjGrjaENzClIlBDD5WobUWQSXwBvMsVVB0l3Uf344W/auokYc/kGG35abuX9lgR4wL2GArm
	maO+mvYWAEjMlF55B0Rlj5477jFdl1me9HeiSEb7UX5m8nucOfK8GnV/O0O5OEDomozASTKgeI2
	WgX975q4S0WvrNGB/Armxjg2qxmO2Ki2au+2OW/aFrk8dGbdShz3huX2OTIjgw+AoURE+8CPbHv
	jpDiylJhAnovFdmbHR+i8b9Ilr1ZIFW/7lh/SoVQaFRhp3BVSFVJHsc5yCDxAkEds8EThWoK9oT
	JELg7cBj6ZG1dqhS47xbZzEX3ndCegsmlUb3AviWpo/wdeowycgQpG1ancwYpUQfukWRQWlZhRK
	xp6dyq5COXpmjtEhiTiRfZBNieqMVq+Am1U8UT3N6eeCrJyKdKx6zKoOIQI6rzG5n8awGfaSM1X
	qc/CPPQacfh1MC0KqdQ9WE8vKMwj4CdThS2bpQsEAyzBfeF0UwtwoS3e5dryKqAwjdm04oLjEVI
	fDsDKD//mgbaRrH8WJEsNIKIZA8ZZmEVmAGksfJ7LPzWtv/1+vuVt2SFx9QE5mzlp7iw1n/zArm
	xWw==
X-Received: by 2002:a05:600c:5246:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4ac16acd947mr378511775e9.4.1793800319429;
        Wed, 04 Nov 2026 05:51:59 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4134ff2a3sm50795495e9.2.2026.11.04.05.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:51:58 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH] ASoC: Intel: kmb_platform: select BITREVERSE
Date: Wed,  4 Nov 2026 14:51:42 +0100
Message-ID: <20261104135142.3723042-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmb_platform calls byte_rev_table, which lib/bitrev.c provides under
BITREVERSE.

  kmb_platform.c:(.text+0x1473): undefined reference to `byte_rev_table'

The driver can be built into vmlinux while GENERIC_BITREVERSE is a module,
in which case the symbol is not there at link time.

Select rather than depend on: BITREVERSE has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_INTEL_KEEMBAY unselectable.

BITREVERSE is the symbol to select rather than GENERIC_BITREVERSE: it
selects GENERIC_BITREVERSE only where the architecture has no native
implementation, so this stays correct on the architectures that do.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_INTEL_KEEMBAY=y and
CONFIG_GENERIC_BITREVERSE=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: c5477e966728 ("ASoC: Intel: Add KeemBay platform driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

 sound/soc/intel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 63367364916a..3d361778a48d 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -87,6 +87,7 @@ config SND_SOC_INTEL_KEEMBAY
 	tristate "Keembay Platforms"
 	depends on ARCH_KEEMBAY || COMPILE_TEST
 	depends on COMMON_CLK
+	select BITREVERSE
 	select SND_DMAENGINE_PCM
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
-- 
2.43.0

