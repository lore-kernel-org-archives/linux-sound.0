Received: from r3-82.sinamail.sina.com.cn (r3-82.sinamail.sina.com.cn [202.108.3.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E617F36826E
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 13:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789131836; cv=none; b=mkN4yZah79tE9JQrzRmykvedU/22Ip3haSgzPTBUZqYtyVdrqOtxn6TCsRaUnJDeb/GLG0Hpwt5vpqv8LlXAAGfmMWzT9UMElVFUb94B5Roi/HY1AUcLTCSmpHetCu3cKqvEinf/Ohf9TjuTBCBPGujNsISnLWWRjTuMCw4BcmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789131836; c=relaxed/simple;
	bh=Xsfi2MdW3Dhx6g6e4Dwk7eJVb6Xx65FLC6qns1AfWJU=;
	h=From:To:Cc:Subject:Date:Message-Id; b=q01E3SpQEGldeOhPX1TPuPQV+O2DZFPHgQR3EdQSV3r1PlBxgdf+VhVk/PCBLIz8hmmWBmKiwlxQF2Io9+lGCBa3jLJ7JUnieH4xybsTlfYxVqSFalTSX88nDClS0r775ObIjtLMsg+R8OP44dP6jFlCu1+4wC6udAftjOtk+kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=202.108.3.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6AA3FC2B00004A35; Fri, 11 Sep 2026 21:03:40 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 40FAB702898B41A8BDE7958578C2BB03
X-SMAIL-UIID: 40FAB702898B41A8BDE7958578C2BB03-20260911-210340
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v1 0/2] ASoC: codecs: ES8326: Modify the configuration and add kcontrol
Date: Fri, 11 Sep 2026 21:03:35 +0800
Message-Id: <20260911130337.4058-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Modify the standby configuration and add the kcontrol related to HPF

v1 -> v0:
	- Modify the parameters of 'find_best_hpf_freq'
	- Modify debug information in kcontrol
	- Fix the issue with the incorrect removal of the jack report

Zhang Yi (2):
  ASoC: codecs: ES8326: Add private members about HPF
  ASoC: codecs: ES8326: Adjust the standby configuration

 sound/soc/codecs/es8326.c | 145 +++++++++++++++++++++++++++++++++++---
 sound/soc/codecs/es8326.h |   4 ++
 2 files changed, 139 insertions(+), 10 deletions(-)

-- 
2.17.1

