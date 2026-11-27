Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797886;
	b=FfA/ruPNMUGOjWdcH1v17iMQ3fLJzavGa28NKcQnkg7Pg9lpZTE0kbOZotTNld3dx15j
	 1qNOFG829dhwUO7J/CQSJFbd/hgN+001KgCcmcnngUT+WMXM9cCkgjLIv0KbnV+CI5UWq
	 Ga3K9NsM7WVc9GhUcM+54Qs1Wqjax0gCNMiKaF2CdzD6VUdcMgck+nfBwI8RH3rO2oJKy
	 r3TRx8oxya9zo0x9sH5to+AIQepfsgADyNM4ZcYrEv2QvMnUPA4q1rFLpbAVMhecukIJi
	 zhx4sqLu6lxcRxDVaqQ0L1RSaXkLz5bT6hgUtLaaK4wD4U7J0TKy9JMX9OnkYtdMhHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tAy3vp8+oeUSdTCO1nwODghQxZqB4oaqZUsOXvmc6do=;
	b=LI0mnjLziluQr0+tlHKpImMSLVf0vdfP/vA9T8JsDtIyEOb/y3EeG091SDrnq9Z4xzX1
	 +daRhEcpZ16HYvJlK1++MEXYVHLSrXCd6ti/pWSR+GUQ8jJVSo7+qtJbJyX7qlogkCHY3
	 rJxWTMPvQCn4saXMMvFfkcr1B/URl65pb+ojATDhPhBMNByKz5BslbgN0STI90LMp6Fr2
	 vGlgAQCih3RbsvbkxQU2u3iHJRqaasP1YwzZExi2AwBLlbAaqrsDajxjWT3SHADPLTvT4
	 /4rttcZzdp2zViofaahI0/HV1r9jVKPyDL7Z4n4zLpiLzW0uHotmqaCsVcNagLsh0tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5vnAV4c;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71963606A323
	for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 16:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71963606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p5vnAV4c
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c515369b627so903329266b.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Nov 2026 08:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795797885; x=1796402685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAy3vp8+oeUSdTCO1nwODghQxZqB4oaqZUsOXvmc6do=;
        b=p5vnAV4cFgacoo/M9KlinZGRZDodRiI9TYOENAWWO2K8u39zjPivOEi/FPPpsz6vNH
         sU2byjRnNoKOFK69aRuCqbAY+qGOVqWL/hCaOcH1p/SQ6Skq/Yl1okrwwfv0XGjyDqI0
         XxY4fHSLCDkj0SyAJWZNY2GH/RBvT5GJ06DLpF+yZBwO3kXVyIBAXL6DkNxtqyaoBYRM
         1rK2Hy6uLPX+ChrJJtljZsBZT61Ic/iI0hJRGIDFpx3iCL4/ZtDnBE7Lc1KiS3tn97nb
         WGLF95xBlYcrahhWFRahC7DwdEOa+VJK+ROfFA5iy7RYNTEyJWFOgZqtVWwPgBp8enoX
         xLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795797885; x=1796402685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAy3vp8+oeUSdTCO1nwODghQxZqB4oaqZUsOXvmc6do=;
        b=HwFw9FEXOoOH1iNQKz8Hr9sjhWouUe6CIWbsmAoZ4FOIdFQD16GAOe3rhkztaZa5A3
         G3gjVVQax0m0K3ztl+IxOLiOC84/lnrKlF9n6Uva/sje9fqtKYVn5PQBw3c7K0lNQlZf
         ZJVRbOShkuJAMK4tfJG1wXn/RmLjBQvexJuQh/pxdKKAL67CQzEL3u6ht2Aay12Lq6l2
         JRa5sTpX9J4NUYULfIh9DXu/iaSoeRK+wzAdjAhnfCZTXS7bx+SkbaBAfL7pVFZHGmeP
         t255khpg4B19RPXEcatY13eoP/mrQCvl9OOadY1VxwHE7seRRS6Xi+hSBqZc6hkrac8t
         fmKA==
X-Forwarded-Encrypted: i=1; AL+hErEOEBtdu5o8xhPTsp674VCQHtlZS8gWLLRjhVArYVQpNGCrO2KWhfsAQ8e0Oy5xphCaAQUkWGZV0lNPyQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/6XgxZwvLiNNqJU0oZwKWiKWpqIUNkhU/KTxDL5ZW5OQCgEqVh
	ZWGHGILTdtICQmjIRj+b3Tjcmyyx9iwHcjCodm7CJp3SRLfUFtVHYKbS
X-Gm-Gg: AZFdTZf4as11PynLUeHJbscimVCtnVC7JsEV7+lVeC44M7SCm7MvdsGQHqfF1LXXTJS
	nlBQV66ODtyxKpwyxnHh6qT8n5DT4HNxCSbHn3+rbHoTQCvcstCXbLDmNdo9sCYyIYYVSDx9va+
	G8ilf09ZnYAqtDmoE3nvpFJMtYXHP/unvhvEQuw669qSrmc9H5oWfh92W49ur4ow1fnO9ryDIUR
	tcwIdvmd7Ld4RHQQJ/XTtknv6WffeZ6ZihuLzep7+BMEyydKup1HjwjfMD5pbAbrpkSSWy77ghA
	+8v20vXfr8P11mPWeeA7iQH8iWzxi6C7qyVkKvAS+1hy3Ibhh+46yuYkZpGP84JyAyM39RhCji2
	3r3jma9s/DsF1BInkS32VXshyZBfc9Yf9fPlMA455py7qjxyyGdCiQDdvndO+xsAQxk4otWnaMQ
	YsBYFiCpEhnWio2ThQqQsXucT5C8i/L84NJiIYqRHGVaSAL97q/qLRwJb1nI1JfHIhEdhJBUWcm
	ELC+hcONJUNFsk/GyWBpPSAoVIfEvT/sl6sptwgECVN9dRaUo0qCdfhAlTH7j5C3uKELFFb+lS3
	/eKwu5ASlaqeyTHmN7UA0OUyWivCpXv/hprWCAA4szPDiQANPHg6ibZTycHuJsp/jNY/DQVtAXB
	pMcmtQ5AgSxU=
X-Received: by 2002:a17:907:5c5:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c51a200609dmr869503466b.28.1795797884621;
        Fri, 27 Nov 2026 08:44:44 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b02de1dsm866092766b.85.2026.11.27.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:44:44 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 0/3] ASoC: tegra: Consolidate and update tegra_asoc_machine
Date: Fri, 27 Nov 2026 18:44:31 +0200
Message-ID: <20261127164436.292585-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Patch set consolidates remaining wm8903, wm8962 and wm8994 partial machine
implementations into tegra_asoc_machine which now is possible thanks to
conversion of codecs to use unified .set_jack callback.

Second patch removes repetitive, boilerplate codec-specific initialization
functions with similar content.

Third patch is just sorting, no functional code changes.

---
Changes in v2:
- rebase on latest next
---

Svyatoslav Ryhel (3):
  ASoC: tegra: Consolidate remaining separate codec machine drivers into
    tegra_asoc_machine
  ASoC: tegra: Generalize forced DAPM pin enabling via tegra_asoc_data
  ASoC: tegra: Reorder the codec structures and sort the machine OF
    match table alphabetically

 sound/soc/tegra/Makefile             |   6 -
 sound/soc/tegra/tegra_asoc_machine.c | 509 ++++++++++++++++++---------
 sound/soc/tegra/tegra_asoc_machine.h |   4 +-
 sound/soc/tegra/tegra_wm8903.c       | 188 ----------
 sound/soc/tegra/tegra_wm8962.c       | 152 --------
 sound/soc/tegra/tegra_wm8994.c       | 175 ---------
 6 files changed, 343 insertions(+), 691 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_wm8903.c
 delete mode 100644 sound/soc/tegra/tegra_wm8962.c
 delete mode 100644 sound/soc/tegra/tegra_wm8994.c

-- 
2.53.0

