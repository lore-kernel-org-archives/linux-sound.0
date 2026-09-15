Received: from smtp153-176.sina.com.cn (smtp153-176.sina.com.cn [61.135.153.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748623911C6
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 02:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439456; cv=none; b=kRc6Lci6D3wmmSn79xT+yBHRLCpkXFPhj3raLcuk6/rTo7l4uzw1C9l7yGPlVt5/v3f4dtL0lWLtAEEoMrl9sYW2x8BesUYQ7DhCORxg8TeE/ls6mrPKCxF9O890gSNrApckGS6NeSbLHHSmktMuNGtOqHifWaiYy1Qffwe6km4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439456; c=relaxed/simple;
	bh=+VtqtfioV8hwoYj4KLSWklTDfIKpY8Essz3TG1Xjvqo=;
	h=From:To:Cc:Subject:Date:Message-Id; b=MexaQ/YO3hs9ldHdnpC3DwDfVboGbL9YyvaDx2jsGWVhpqmXxtD5eTBcgglg+F5/Bi1IR3y0jfW4AUK4Q2mzQqEXRc/eQxdtvxaiMbRAjAVKO63fzy2ZYdxR1i9JhL8XYIyReCbzAK0NAFcREiL6s3LO8QWlMOk7+++Qn1zizmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6AA8ADB0000067D9; Tue, 15 Sep 2026 10:30:09 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: A25F72FD3B0840E7B7B2CEB837E85F96
X-SMAIL-UIID: A25F72FD3B0840E7B7B2CEB837E85F96-20260915-103009
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v4 0/2] ASoC: codecs: ES8326: Modify the configuration and add kcontrol
Date: Tue, 15 Sep 2026 10:30:04 +0800
Message-Id: <20260915023006.22940-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Modify the standby configuration and add the kcontrol related to HPF

Changes in v4:
	- In kcontrol, additionally check whether the input value is less than 0
	- Move the assignment above to the end of the function 
	- Add a lock in kcontrol

Changes in v3:
	- Modify the incorrect version number

Changes in v2:
	- Modify the parameters of 'find_best_hpf_freq'
	- Modify debug information in kcontrol
	- Fix the issue with the incorrect removal of the jack report

Zhang Yi (2):
  ASoC: codecs: ES8326: Add private members about HPF
  ASoC: codecs: ES8326: Adjust the standby configuration

 sound/soc/codecs/es8326.c | 148 +++++++++++++++++++++++++++++++++++---
 sound/soc/codecs/es8326.h |   4 ++
 2 files changed, 142 insertions(+), 10 deletions(-)

-- 
2.17.1

