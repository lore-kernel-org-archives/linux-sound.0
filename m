Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862AA3B42FC
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 07:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784533268; cv=none; b=S7DQXT8NrF7ZXXadmO9gfjD+LByTIQKPsHhjiwKibDiaf//9t3c8crgDMGJFWu+2neoIAhue1je+X661FdSkwatdDPAp+PhtNkqWuqOnEFvwzwzCM75cpbp5ANinIFH6QFkWrHhv//+d+QY0aDVzxaiKNOH7P2Wg9Rw8ERFcYNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784533268; c=relaxed/simple;
	bh=OZzoGHiDTikJl3CYGzEEUkUz6R97UYrqkpPesi2Dq1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ijfUesvnT7h5CpETCSRXiM58Ofdqn8RAu2UTPf9rGMeBytsKaentLn9plWE3/fjjc9gZwKesym5I5nkIEDoKIF4wYD5R8t+N6sGGqVlTnlh+lYyQociX5yY3viz18IITSrt87B8EuBUGAyE353S9ZoY6lVNghX+q+a4tfklmFew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NqAQ6lr9; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NqAQ6lr9"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so5970662a91.0
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 00:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784533266; x=1785138066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgdS1xQfEoAxbMyvnXhxLVHwgSMFRoTNpVUAudjrVcU=;
        b=NqAQ6lr9djQueSZqzG6d3WdzYidsh2ck1QjSV9ycoSDeKxVQ+KYuUild2GwEghIft+
         650DcwrX3CJ2MrlaxL6K2D+Xu3/eYWxLcACJ8AjvFbdS8JvLkaa/krEE03Caj7vHNbjL
         R5NfuVAPc3+gQmRJhByMhdBGCK3uWOJxzhLLtK653/nJlFygTc50evZDWp9UjzskmFGe
         kqfWQ3mr6wmEp27A/IQaWKvSE8YjxPo+Wy/qdZXKiprhINScMnVGlRG/5KQz/3rbo8/a
         1NxhEY1LmSLVlJwruTW3ljAUFEL0rI0PY4C+eK20RjHYUSHF2OD+8r7pg3/eAU/1pxRw
         tfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784533266; x=1785138066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgdS1xQfEoAxbMyvnXhxLVHwgSMFRoTNpVUAudjrVcU=;
        b=e4K6u7Vp8PEg894bXIt2jiBYgXJjW2rciLRce9mV5IWAInrjzpAG4/oH6vEfgznn4c
         xz2OngUqgjZLVEQtOF3HaBb/S7V79JotGuVHjeuVXvND62cHcQ71V8oByE4QIO9uDss8
         Z5sArq8AwRCTrT8EBB83IZhvjEpgJe3oEN64xgMCD33rMKwWk9Pr/PVhynyAX5qk36JO
         nWI9n7ctx/0yeaMc/BTcjkEx6o5TBeyrt2sF5jTb14Ah8EojfjPguGhUP72qGQjhcgL9
         WnepaL+uYVUP1qDJ2+MXpDvx7Z3NA4m55HUdXTBHX1Ur81EaoxoHQBn2Hx3v86+CnNBJ
         mh1w==
X-Forwarded-Encrypted: i=1; AHgh+RrLcM7gJNkO5om7O9rnoc1UeNjokAW/wCQ3yAXRKA1hazDehuQNPl12wPpK8JGVIR/ULLT7dG4p98yxzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyKqDkO8/5qdtLjfduUkFhCRwcdMf4UE57Mre0h/cWF1GM0kkO
	dEOJ2xN5DWnSXAcNSI05Ph3QaSgknWpUwHen54A+YZsq/uCwnKiwt9VJ
X-Gm-Gg: AfdE7clh2+1wlFrJeNb/UnFtAi+PTX7BY4r+xANNF1mahEVe26z1ZNiPSbSbf914EA7
	BMVxvGDXTySNY+ZptkWBaNOmAsPM10KZ6zuYMDdFuBNJ+K0aAvPjdXZTjPb7BYnKjzo5h9HSqTl
	YRMHPle+e2GFqXGRHWZX9DgDQ2B/9siIw8z359rVabRnFnKL2ys0+IAVLPVgJmjEHXf6qzh1LWs
	C+NZATyZ52yrkMpTR3zOozAMr5kpvE+NQGp++YH7no2vUyBYbN0aQqIDZ20eGbnTbmC4MvhVMT7
	nYg5FqODbLU+TYStljDwbp4IcALZ+JK1UmIX4JLrDC8Bwkghwya0ikGPZCP+3eSMGq+hnn/xO3z
	VWlzkhXaWiqGXzyVGuzxkylBRtZPue1VUkSzC5YYuu6HZNAhVkLnsQIn5uiJwvISJhL1LSrlmKA
	TxX7ECb+i5EUlmwLtwJHRAD+7PAsW51eEIjBSh+MU7tk9F9mw=
X-Received: by 2002:a17:90a:ec88:b0:38d:adae:4866 with SMTP id 98e67ed59e1d1-38e4b516544mr13416775a91.21.1784533266485;
        Mon, 20 Jul 2026 00:41:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e60cc2ad5sm470171a91.4.2026.07.20.00.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:41:06 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4] ASoC: stm: Drop redundant error message
Date: Mon, 20 Jul 2026 14:40:39 +0700
Message-ID: <20260720074044.87528-1-phucduc.bui@gmail.com>
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

This series removes redundant error messages across multiple STM32 ASoC
drivers. Since core functions already log failures internally, dropping
these explicit dev_err() blocks prevents duplicate log messages and
cleans up the code.
Compile-tested only.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: stm: stm32_adfsdm: Drop redundant error message
  ASoC: stm: stm32_i2s: Drop redundant error messages
  ASoC: stm: stm32_sai_sub: Drop redundant error messages
  ASoC: stm: stm32_spdifrx: Drop redundant error messages

 sound/soc/stm/stm32_adfsdm.c  | 5 +----
 sound/soc/stm/stm32_i2s.c     | 6 ++----
 sound/soc/stm/stm32_sai_sub.c | 8 ++------
 sound/soc/stm/stm32_spdifrx.c | 6 ++----
 4 files changed, 7 insertions(+), 18 deletions(-)

-- 
2.43.0

