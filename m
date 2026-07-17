Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42F739F16B;
	Fri, 17 Jul 2026 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279764; cv=none; b=TfhTWdlK2uiz4nbB9Kfa92whFoy+16oWsPfk04hq9ieyefRN8xSeR4G3zIYJFayn8THSWJHUyqWuyEQR4T+Fu2FYY4xbdr43r4UmkkqWwFnbRA+Qdr1aenLvp9MqXie5Pgohi9+TTvuSwdl8LruII1ZLjjMdixtS+k6m9fhWBvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279764; c=relaxed/simple;
	bh=galewZPZ52LvoDtlFg1kX9LxeyiULsB000MjoMD+noU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ul+SRGoKaP3EfaC5vSyDNYzF6k/kUCd19nGWLGpMtPA6cUQ/ccG8i5mkNa7y+O1v/qkgOygvyi1dQRYmS7rZOCZn0sQDgiJRo7axflr/GzVVecSSeDyv4iXvAp5kkN/mJ2kFOuAiAoK2I4XkntWQodvWry91OMn/ZQOko/8Ll5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KEUSYzJk; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KEUSYzJk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5M
	GtyLi2cAWpZy4oPmfLcAKod3bQKnsy1W54nKKkRzI=; b=KEUSYzJkMdcyxf3UV0
	FJhdvcvCOzs+js6GrhTJ4d9uhmEpWoXlQD4WM1oYiL0QjyC2trOPht08LER0TXTU
	U93hcmrVqrgGSpXmOwvxOZPYimQ3HQGbAOAtRD1DZLYDi02PT1Ikepfd59fB152s
	JolAG4CBsK7hK+f6Rzz2oEGBQ=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3jTm_8llqT1CgJA--.17062S2;
	Fri, 17 Jul 2026 17:15:45 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.de,
	david.laight.linux@gmail.com,
	wangdich9700@163.com
Cc: wangdicheng@kylinos.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] ALSA: Fix compiler warnings in sound subsystem
Date: Fri, 17 Jul 2026 17:15:39 +0800
Message-Id: <20260717091542.721877-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3jTm_8llqT1CgJA--.17062S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFW5tw15WFykJF1ftFW7CFg_yoW8JFW8pr
	Z3Ca90yrZ8JwsxCanrZF1IyF18Aas3Gws7W3Wjg34jk345J3WxtF4Ikw1IvFy09rZ3CF1Y
	gr4Dt3W5GF40yaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEcTm7UUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbCwAHdLWpZ8sH6lwAA3c

From: wangdicheng <wangdicheng@kylinos.cn>

This series fixes three compiler warnings in the sound subsystem,
covering both logical redundancies and a potential runtime bug.

Two categories of warnings are addressed:

1. "possible condition with no effect (if == else)" -- redundant
   conditional branches that produce identical code.

2. "do_div() does a 64-by-32 division" -- use of do_div() with
   a 64-bit divisor, which silently truncates the upper 32 bits.

Changes in v2:
- Dropped "ASoC: tlv320aic32x4: Use div64_ul for division by unsigned long".
  Per David's review, parent_rate is bounded by AIC32X4_MAX_PLL_CLKIN
  (20MHz) and will never exceed 32 bits, so do_div() is fine there.
- Updated patch 3 (fsl_easrc) commit message with concrete numerical
  proof that val1 can exceed 32 bits after >> 12, and clarified that
  the truncation happens when val1 is used as a divisor.

wangdicheng (3):
  ASoC: mediatek: mt8189: Remove redundant else-if branch with identical
    body
  ALSA: sparc/dbri: Fix "possible condition with no effect" warning
  ASoC: fsl_easrc: Use div64_u64 for 64-by-64 division

 sound/soc/fsl/fsl_easrc.c                   | 2 +-
 sound/soc/mediatek/mt8189/mt8189-dai-adda.c | 2 --
 sound/sparc/dbri.c                          | 2 ++
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.25.1

