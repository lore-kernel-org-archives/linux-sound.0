Received: from r3-78.sinamail.sina.com.cn (r3-78.sinamail.sina.com.cn [202.108.3.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D0547206D
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 11:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039265; cv=none; b=gK1ji1+pb/VHjNKeJcuUJFE9JTzdjV2CNbctAsujNnRDtPUegGqeFWctdCwEvJ7UJPF/TxMCTDKI8UVB+PFp/pa9Kb+Z4Mm1oDjtg5e33y61191UOF7nza6YQFaYXkgnA5yqaaqrTEvGyFdgdynsZjUefysg+93YK15kBKhm6ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039265; c=relaxed/simple;
	bh=ToVcbeBFL+PPckwuyFEJRhs8le/KMXsEpE43gG5e8so=;
	h=From:To:Cc:Subject:Date:Message-Id; b=P2lhQ2jr8gUbtr8z9QzwXPlh2PcYC/ZjXnJL1rrVR9B/TKrnM2WhYBsdzJsHQtICJeHgzhSBIeeAuJSzdORFPRE3UAxh0Aiz2T3dWEM8HXqB7+37ARTMrT0hSkSopbsOO7tGcpDPNNnY7FI0dtcGtJtOxXyqSyq0t7bdjNcyU9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6AA2920700005D89; Thu, 10 Sep 2026 19:18:32 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 0ABB35B2EB6E41C6833D56EDAD47E221
X-SMAIL-UIID: 0ABB35B2EB6E41C6833D56EDAD47E221-20260910-191832
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 0/2] ASoC: codecs: ES8326: Modify the configuration and add kcontrol
Date: Thu, 10 Sep 2026 19:18:26 +0800
Message-Id: <20260910111828.28027-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Modify the standby configuration and add the kcontrol related to HPF

Zhang Yi (2):
  ASoC: codecs: ES8326: Add private members about HPF
  ASoC: codecs: ES8326: Adjust the standby configuration

 sound/soc/codecs/es8326.c | 150 +++++++++++++++++++++++++++++++++++---
 sound/soc/codecs/es8326.h |   4 +
 2 files changed, 142 insertions(+), 12 deletions(-)

-- 
2.17.1

