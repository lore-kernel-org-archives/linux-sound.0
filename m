Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD8D18BC36
	for <linux-sound@vger.kernel.org>; Wed, 21 Aug 2024 07:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724223650; cv=none; b=JU4cWfOYB2HeugTZUTyO41NzMMkWK83j/POUZE4evbk6F/OBUODrIu8wmJPv3O8LHx17AtWEQVTaTSLcwSYFPwUgVtR4zjeb4i8C9yEWW2Ikv7b2rBRI9tDTh7/gCykfDpS+fLDUcOhnbfdP7lJA4wD4eAaEjP0YRAC+FHn2oi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724223650; c=relaxed/simple;
	bh=SdzzK5ESTsrf2b+s0cNEeMQxEP25YRTv9jY6URGt0FQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PzxCzm4yuQpr0tsYSBnFk1Xxi1XtxXnWsv5SH6qLqpok6WR9h6IsXPnK8afrT5kXeQtnO0RKGEj9rjy5kgRTPntEp2F1NaN4Ey9lT2K4aqpsUSOND8wuZFnjScmkKhRKetu0kvqKtNfNpTfG/3CBRszWj7QSS8hAsR9/7hh6uLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wpcfb5J1dzyRC9;
	Wed, 21 Aug 2024 15:00:23 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 394441401E0;
	Wed, 21 Aug 2024 15:00:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 21 Aug
 2024 15:00:46 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <peter.ujfalusi@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH -next 0/5] sound/soc: fix some macro definitions and usages
Date: Wed, 21 Aug 2024 15:08:10 +0800
Message-ID: <20240821070815.2326534-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)

Many variable in macro are not used as we used macro_check
script to detect and mamually check, let us address these
issues.

Hongbo Li (5):
  sound/soc: fix macro definition on TWL4030_OUTPUT_PGA
  sound/soc remove unused substream in macro soc_component_mark_pop
  sound/soc remove unused substream in macro soc_dai_mark_pop
  sound/soc remove unused substream in macro soc_link_mark_pop
  sound/soc: fix macro definition on STM_SAI_HAS_EXT_SYNC

 sound/soc/codecs/twl4030.c    | 12 ++++++------
 sound/soc/soc-component.c     | 14 +++++++-------
 sound/soc/soc-dai.c           | 10 +++++-----
 sound/soc/soc-link.c          | 10 +++++-----
 sound/soc/stm/stm32_sai_sub.c |  2 +-
 5 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.34.1

