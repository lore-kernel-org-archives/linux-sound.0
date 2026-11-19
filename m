Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087625;
	b=48oIAkJvrvu88KKOwV2pFHkQc4q45JyntpEe7+lqsRNLs1lV3Q4qo5FYPPlqmat2xuUO
	 fdgnZJrBmsl9nqxt20RQONl2IT4zDt/SbT2GrCV1o1WYJarEk2Bw4wmPGJTEaSEAfIlBs
	 bYlXfErWQ0h7FyeQYOtAJy7J6MlCm6WIAqLDqHfpL8GR9gX++l88EFse3L5KGCM14Twmb
	 oqPy0wsx1BC6Yy8+c/lurtWXX8N+CL+90R0BEae8yfN1s8y4bmHgJXbodR7/x6aBbyy3P
	 WdEgVywmiw4r2oL/O92wy30OEqS0/Hg+Ezt7WysIqQGnRt8egLU7pdK80ezEZ8DnPBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087625;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	bh=ZwmznZi4LmEI+WwCiSeUov8gHxMOm3CO1Z0c1k+OExA=;
	b=S3SxDxpgpbPOBJk2KbKVV/I8n+0EeAGZmIpOvx523vJXbO2fU/0xfWLmokDQkuNR6ufu
	 8h7TV8igJyZ8DpPJhpVDcvz0RIvx9mzZ+jwKPrFZMi6dl3ouxxEQK9i4k0+N2tFgVqIkn
	 cYIp+E8l8OOjAaLJPabrej7dNbQqc1NtJGyB0YdKicG20pj7ZiAilU7FVri+qYTbyFX4S
	 8YshSrKKcaYM3u4Zo40nny2dXx99am8ba1TSZgGIxpkdjH7bH/pvLFHNVSNloV03YA2vH
	 3Y+SekwNdfjZ+eyKpmNfgMveopkAuNBND8+JUfMWP7jVWB77RlmDJBP7ipjxA60LwPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=61.135.153.176
Received: from smtp153-176.sina.com.cn (smtp153-176.sina.com.cn [61.135.153.176])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C138606A324
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 11:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C138606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([112.64.39.13])
	by sina.net (10.54.253.38) with ESMTP
	id 6AFEDCF800002D23; Thu, 19 Nov 2026 19:26:49 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: C38BC63E5CB9496D907359F68D7659BD
X-SMAIL-UIID: C38BC63E5CB9496D907359F68D7659BD-20261119-192649
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 0/4] ASoC: codecs: ES8326: issue about pop and Configuration
Date: Thu, 19 Nov 2026 19:26:43 +0800
Message-Id: <20261119112647.6728-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

To resolve the pop noise, several delay settings were modified.
To improve the codec's performance, the initialization and clock configurations were adjusted.

Zhang Yi (4):
  ASoC: codecs: ES8326: Modify Clock Configuration
  ASoC: codecs: ES8326: issue about capture pop
  ASoC: codecs: ES8326: Modify the Initialization Configuration
  ASoC: codecs: ES8326: Adjust the delay during calibration

 sound/soc/codecs/es8326.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.17.1

