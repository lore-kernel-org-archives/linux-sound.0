Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CC415BF
	for <linux-sound@vger.kernel.org>; Tue, 12 Mar 2024 02:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710210837; cv=none; b=GqQKWA9ZFmFkKrL3SWbbV5UAZjWGra5AUBxO+4NxhV9ZhDWd36D5UCgYOE7HieycBSMAQ5JgJZL2mVVyfpIW/Nls2QrKlNN8jWU05ib8XIlTOY3WOThtiBV2s/bgBzLkh6dwT9FCLSZtvWvMA9pdqwo85yPobEx5qcTmg2TAEvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710210837; c=relaxed/simple;
	bh=l27e6lKZx7jLNyMIN5Nj7ktFynRg7mA5MoSkfJNJLrE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jkc6U3l3Yyg4/wFEY4HCFmCD54XLZ2qlhV+cGNMh0O1o6eg0K2oiv3mitj1kvT228EKBPsyQVO69fFSc2RlpiYAKOsdY7ODvc0F0GIGeprkqcXGgfcwMYrd87mlv2q2nwK2E53o+uKVHUaOjJWPMjSUDZQ0JP0pb2KN5UGPqfhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link; spf=pass smtp.mailfrom=jwang.link; dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b=jjsvsiyo; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jwang.link
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jwang.link
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jwang.link header.i=@jwang.link header.b="jjsvsiyo"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jwang.link; s=key1;
	t=1710210830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=slo0jZZdDZMibllmQvwXAHqC6xaA2PlPRLN9kHfjfLg=;
	b=jjsvsiyoguWz0Nmle3m/NJXTJUgxrYNEqEbTKwt9f5ATNWseVt6+EMu27zaTrAKp53+hOe
	h2Sj83Nt1L5972DYqacVWsZ+exnb0YbDi2jRr0ktPK4siuuAFhUFFi3p4tH1BRIzf1Co9J
	YtbHxh0F8b7lLEbxEEe+bGYVfhETs89zsHryw5VH4c1sq9JAisyVSWT2wrBp7+g246q1cW
	ceT/QLVXmFe8Pzc1H+ka2GMPjgMBAsXiH7gFZs3YBVlitPWvUL9RwNjgYUoNGSS10nHnss
	zLBjSe4KZuJOUc56gGDF9TnZaIMdzJidT3cfqdrti/20w1Nb3z6VdYM+qT07Gg==
From: Jiawei Wang <me@jwang.link>
To: Mark Brown <broonie@kernel.org>,
	Mukunda Vijendar <vijendar.mukunda@amd.com>,
	Sasha Levin <sashal@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Jiawei Wang <me@jwang.link>
Subject: [PATCH 0/2] Revert "ASoC: amd: yc: add new YC platform variant (0x63) support"
Date: Tue, 12 Mar 2024 10:33:24 +0800
Message-Id: <20240312023326.224504-1-me@jwang.link>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Please revert my previous two commits:

ASoC: amd: yc: add new YC platform variant (0x63) support
[ Upstream commit 316a784839b21b122e1761cdca54677bb19a47fa ]

ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2
[ Upstream commit ed00a6945dc32462c2d3744a3518d2316da66fcc ]

PCI revision id 0x63 is the Pink Sardine (PS) platform, not Yellow
Carp (YC). Thanks to Mukunda Vijendar [1] for pointing out that.

The mic on Lenovo 21J2 works after enabling the CONFIG_SND_SOC_AMD_PS
flag, which I had not enabled when I was writing these patches. 21J2
does not need to be in this quirk table.

I apologize for the inconvenience caused.

Link: https://lore.kernel.org/linux-sound/023092e1-689c-4b00-b93f-4092c3724fb6@amd.com/ [1]

Signed-off-by: Jiawei Wang <me@jwang.link>

Jiawei Wang (2):
  Revert "ASoC: amd: yc: Fix non-functional mic on Lenovo 21J2"
  Revert "ASoC: amd: yc: add new YC platform variant (0x63) support"

 sound/soc/amd/yc/acp6x-mach.c | 7 -------
 sound/soc/amd/yc/pci-acp6x.c  | 1 -
 2 files changed, 8 deletions(-)

-- 
2.39.2

