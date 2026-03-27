Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5C6391505
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 20:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642429; cv=none; b=ab27njpySvv/7lOMnASYn4WU4TJPG1xk92JmMk7Qjat8rnb+7K90utnFxUMK2UixRjttbpg2nt3iUGWsLyCvZ1k1sMMhTEmwzTeA3ce0YW1mg1KHhDbvJW6A4Umcef3NQ3EUQWt27U75HXtaxTdzQDeR32ptH6SMM7/Ez/Dougo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642429; c=relaxed/simple;
	bh=TjVGknSAJilI3+JfSeaNyhB80oxmwzYan1u/PMy8Js0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wabo2MFJIZttwg7LOFcYwo4MC5xWgntvSMzND+QQ5h1yqyz1ApUKhYTq/uuthLDRGrCIUH972XOEccNTwjp4jrVjEDMBhAUhu1L59/zx7nDi7OnFmYglxNFNAagrZgoiwE/hZkH2ZRcpyBAlIMv9SIbClohGpt03zIVPyuh5wm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vnhhe112; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vnhhe112"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35b905e9dc0so1561850a91.3
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774642427; x=1775247227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVdJ9tJ+PgmWLBLpiJUyHwy4D5WLplfE8CaKMLoULJs=;
        b=Vnhhe112wUfX7tjir8l9fKc7ARaHKD4ekgIQn3Yyc32Cc02LNQpaGSCm/4O2TRMhya
         lfVrixHxYl28b0+afLJmjat29BBb9kJK5z2OtbOiLCHEYwr+cRIQOlLeK/ELfN+bPrB4
         TKpfqxfa8ayT5cYvZyhpWoI0hLvfXvnPP5Cpe0eNud4F5W030vedcGaB81Ey1rxTvfFt
         D9vAevIkkpicii60bNk/J/TdGEC8Oj6rzp7/cKFc4oavnnFWCxYeZMYCY23KVYvcpXpT
         tT+4m/kM9Xs3nClt0sAGhgrZixDjQNWEBTEOrlo/Ena3WnTUgxeWiZCotvOZobkf3RKT
         yyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774642427; x=1775247227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVdJ9tJ+PgmWLBLpiJUyHwy4D5WLplfE8CaKMLoULJs=;
        b=dMY5qMlf937GAI7bYKdWmUJX9Z/IfmqDmtpG0iliuPa61quZl144OL8lWS7yqUF463
         00fsFfh37iR98q0JufS8YOx/7jAZ4MeLkcu/Od0cT+73bKDcrPZaqazUmAt0aCyjlLJ9
         pAR9MlcdtYh1GqOv1jNKz0+tt35JZRIi0H3QXtZKFEr4ez9nXFlziAoc9Njyw7qgHRdZ
         wwdNXUtT/O9odK/gJaFwjzL9Kzy/U86kjxqtP3OjJfiNKEVpwISlGjKQFNpxdHRYPHK+
         Tfmh3FOLRLuaz8eMFIHOY0CgqV8slnT7Aup3nNHyrVYbPD7JIiThDMRk+7EY/Sc4zCk8
         fNbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX80lA5diEVoM1TLwYfKli8ii+7kN1Dg57RUjeDe8WES2dtDOCGBnRg+demafh0Tlscae1nsmONmAVCUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi1N030YCEUHaHOkH7hAyneO1jgdtdT+SkmPuceHlwHqnivgJv
	OtfLvcnS7ADsJE9s9kjtcQbWpYVhkuth5y/V+3Z1suvpfbYXAM37MwGP
X-Gm-Gg: ATEYQzz92Ccb9/l5hg5ojCfXqfY6c6n4uXotfMZFEe0sHb1jOw3RhiM54kXW3D4yP4+
	pMi0HTKo8m+CmbYCvRFyaMrPPdfTBqH910b0IzBPVCn3svcHQc9m66n/S2v+wTXTQXiTsvc+Gjp
	ccmMhsw+jSq9JCfLVd2bf1w1diZzHaV2cq2oxeP4F/wzDNvO4vyjETyWIemIumgP56Ld/1wRib+
	OaXFQrPHEmShuGYbobwkK1q96UQU1UJyzOzo1dhmiJyM8qXKCFXLCvY4e4b67XrfwilCh6Y+hhm
	9k9UUxSYI9qGvfbkuhdstNk9I1iVAkPx5ONzQmI477fQOcmHtgTJTDUw+h+iWgo40y1oeKef073
	zKa5dAHp0ss1SJVZ0bpNfwMtfXQLb0FOA++YVtE8+9cNzP7RdKM7gjPfrLMqtv0qu/VKJkXOLHc
	CLLAfw0oopZsbjZrFAXirzAmvViuH6oO0fPn4AGyiEoQ==
X-Received: by 2002:a17:90b:2ec5:b0:359:ff8a:ee4f with SMTP id 98e67ed59e1d1-35c2ff081cdmr3743063a91.7.1774642427448;
        Fri, 27 Mar 2026 13:13:47 -0700 (PDT)
Received: from debian.killsync.com ([103.85.207.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2d8f96e9sm1534085a91.1.2026.03.27.13.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:13:47 -0700 (PDT)
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
Subject: [PATCH v2 0/3] ASoC: Intel: Fix MCLK leaks in
Date: Fri, 27 Mar 2026 16:13:13 -0400
Message-ID: <20260327201316.427607-1-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
References: <20260327193002.423897-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

In three Intel ASoC board drivers, the EVENT_ON path in
platform_clock_control() enables MCLK using clk_prepare_enable(), but
error paths fail to call clk_disable_unprepare(), leaking a clock
reference.

Fix this by calling a clk_disable_unprepare() on error paths after MCLK
has been enabled.

v2: Guard clk_disable_unprepare() with SND_SOC_DAPM_EVENT_ON() to avoid
callling it in the EVENT_OFF error path where MCLK was never enabled.

Aravind Anilraj (3):
  ASoC: Intel: bytcr_rt5640: Fix MCLK leak on platform_clock_control
    error
  ASoC: Intel: bytcr_rt5651: Fix MCLK leak on platform_clock_control
    error
  ASoC: Intel: cht_bsw_rt5672: Fix MCLK leak in platform_clock_control

 sound/soc/intel/boards/bytcr_rt5640.c   | 2 ++
 sound/soc/intel/boards/bytcr_rt5651.c   | 2 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c | 4 +++-
 3 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.47.3

