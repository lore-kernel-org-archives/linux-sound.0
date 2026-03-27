Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9295137F746
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 19:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639839; cv=none; b=KUrA1SiHrOC2lKEetcCxZpaWCU0esF7F3RxxYmftLFFerHCyTv6IT8YVcpBYeIsVJVd7gpIkI3pnY66G0qGtG2zMkrW1KTpLIoGHVTR7IKJRl9MSiSRGRn8+S1RvcsnVZ4KQ0d1k5b8TWJfaKp5M8eMYGTVayle/PkNQRsbhB0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639839; c=relaxed/simple;
	bh=hNH8qx9y64RA4LXh7IO8aGvHh0Y+P4lj4r3ltErKPds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uUAEyuTvcepfyqmY2YLkVZEZUb6mGHc20IpbRKkpLEBz4zdG5UYED6Cqp3Lj2ArVq/RP7LYjWv3iSuM7msfcpLHZStY/E8RUYKKXJ4pT4+R9+RIDcCU+iDy3sHUEzIfmwJJERSALgIidunr3zVeD4slJEORaVq9FQXlArddEBxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5I7845O; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5I7845O"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8298fad2063so1491032b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 12:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774639835; x=1775244635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DT8od2xQPVUZ6gnMa3txETSLgvqmy0Pi0JXbpAYcPF0=;
        b=m5I7845OQZ3e092ZrzdaUoQ7PFnECRcpXNUja3m8cPvPaOihM7Kh/N3HQF7wkWTIIS
         YVTXO9rfTTczUD5IcOQUgMA5z2Zhy9ql2oLLZC1l1oLYBmZI8DONoaXe7j6dnJ+uPaAX
         ypWC59AY1H5O8EojB/fJubslQfesSbsj0lDm4v79/LcBKLL7r2xRFyrwK1CoIUEd/Jr/
         pbchOZ1++DdlxQuHXgv7SD+1JKLXmzqaNUzcmnEx4bnNNI0AZtRt06d4TIuePdR0GTmV
         XzVc7JjO+sCVZY/KLkxlx0gwXaw3LwJjx8CwBmwBDh1HzPs8xOJ1qcZGrfLDAC4rpXW9
         9IBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774639835; x=1775244635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DT8od2xQPVUZ6gnMa3txETSLgvqmy0Pi0JXbpAYcPF0=;
        b=k15ol9KUHlxU5gDd0TiAf1T3tX1ijOyHvHfN09zTalEoFOBdDwzNowBzfuWKJLi5li
         3BxtIas/AeQNiX8IsSS2Y2DpWp7n1ybIAztHq3C+1YrYyHEOHQOF86O4umdKR1tJib8K
         zpkm+YvHXF2bkI9ivEUzHIkoaaYYWLv+wlrGOJnKRNDqq59MLza5JCy9c9bV1kHhd69n
         vQ1Q1HEpDzjRfIK5qSsUUWpi7fs1N2C3LyXqu6hkEHcVxFucPNTKqtzM0qmhvavujXzD
         3O99rRWxJs9cOmQtN8VtG7dg0uHt8OsgPs94AgInuYaY8FZbulej3b4U8GjTmCQuiyYH
         oAWg==
X-Forwarded-Encrypted: i=1; AJvYcCXKzfAWm090X+wZGiXj9NmZVRXZuBeXR0+Cu9XoSDiF+FKbkIo72E8wgR8of52B0YEoz6HZ1t5XGOw4tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzY7cSukI4LnhK900ZHhy7+TNL7JUTGYCPI72OMuEduiQD2RN+
	nSYH76Rajnoxp0CR/T+e8FqMnHf/tvibg5uCorSzrJnvt2zvauWu3qwp
X-Gm-Gg: ATEYQzxPTHzzfwjWnfhGSfzmHzLyJHzO5rJdXhQ5lvdsiVZ5Dq1tiH+sIaieDHDhKtx
	ztg8ZhqwKE2bJfE1bsB+A55D1DklR3143leBmEashs347zMNSdoDAxCX4eRxT7owxnYrFAOjaEe
	qMDwcuNJk4qfTFVhGjmDWwvdLPSq16adNgU+e+32BPGDBt2qHsunIY42KOiXuMmx8Gz7jMLr9HF
	LlOcSKw5IppXOqldP0HlmJYiVqbOBd97e0ocLLxQKQabEJ0HTJB4JCP2v7p1X/qHu2v4cHuourM
	yV0eEqtgIv4/rwe1sa/+Am7mJZBpimir6xOGb0OYF3cNfBi/lMiXG9S4snauS0D4DnZYn2InZlt
	YI4T9s8wgk5oeDEV0mxHMzy7NIgwzGcHB1ZQFjsVqSCev/LbsXDrIv/DgvjkR1SreSRglV4JdcB
	BaboKTSSy5cMiw1w/640GoQAYSaPN769/IX6BV5cR7IA==
X-Received: by 2002:a05:6a00:600a:b0:824:a706:bd75 with SMTP id d2e1a72fcca58-82c956c2ef1mr3791137b3a.0.1774639835231;
        Fri, 27 Mar 2026 12:30:35 -0700 (PDT)
Received: from debian.killsync.com ([103.85.207.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8466e01sm25136b3a.20.2026.03.27.12.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:30:34 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: broonie@kernel.org,
	linux-sound@vger.kernel.org
Cc: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH 0/3] ASoC: Intel: Fix MCLK leaks in
Date: Fri, 27 Mar 2026 15:29:59 -0400
Message-ID: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

In three Intel ASoC board drivers, the EVENT_ON path in
platform_clock_control() enables MCLK via clk_prepare_enable() but fails
to call clk_disable_unprepare() on subsequent error paths, leaking the
clock reference.

Fix this across all three affected drivers.

Aravind Anilraj (3):
  ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control
    error
  ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control
    error
  ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak in platform_clock_control

 sound/soc/intel/boards/bytcr_rt5640.c   | 1 +
 sound/soc/intel/boards/bytcr_rt5651.c   | 3 ++-
 sound/soc/intel/boards/cht_bsw_rt5672.c | 4 +++-
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.47.3

