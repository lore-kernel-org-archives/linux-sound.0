Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569115;
	b=VK6hm1HpS7oVrbIRv4evt5c1+Rc2uyDhZO9zL9C1Hd5ZkM0uV5+LQlA/ctE/uSpLOgqW
	 8j4dcFIeHFx+bfCreDANj21QqoHYLLt6JeUdxZ8MMC1LV10PKpZfJ5h5PipJRZbhtCysm
	 l92XQCzMJVw3ugZ1BlJL165hQeXwYObSLv0eFgIJ35iEakItV/epO7fIHquQ5AzhhK6qg
	 Cr2KlnxARJ1CkSP60hALzojT/aODty21/+yq86emOlyBpmZpKxQU+pOal+/AKmvUD0w9l
	 XwtxbsrW1i8IgJdzosGODl9i2+79qh4W/GTg4vMedDmNwsXOG0MowxLnvqCFvWHCDSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569115;
	h=DMARC-Filter:Received:X-Sender:X-Auth-ID:X-SMAIL-MID:X-SMAIL-UIID:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	bh=AGw2hK0aTVeOMHhhXcPcjW8jQFD/OmJ+6ZBh4L/eayI=;
	b=I/42BoezDlT70+wkbfJGXXQct7lds/scdUNlqCkBnpaRofcgAU6lx0Ik3x+wa8o0qE8R
	 TmcJfsR5tIj+NTnQEZkG18jP9nOvq0xZV0V03GNg6bzHc7NSqTKDPYlGYUGyPE+NyMvOX
	 OPFA7/woblf7WVrrmIGKnLc8A5dDSk+0O7hY2ilzzrzMmVk2mAk44o65Y5jVpeUU6NE9K
	 uAljM4DYEvclwZFCzxYp8MgLgYUqVmLig5JshzMxdNGScqZyI3ucbqthzR36fDAjVNEfp
	 KbV/hJJKcPW1V7wQRwQsrbkjBKX3glOrP44njrSLzV2vBSSa26w/F72Y09Un6jsO7WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=everest-semi.com;
	spf=pass smtp.mailfrom=everest-semi.com;
	arc=none smtp.remote-ip=61.135.153.175
Received: from smtp153-175.sina.com.cn (smtp153-175.sina.com.cn [61.135.153.175])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB24606A31B
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 07:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FB24606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.37) with ESMTP
	id 6AD86F0A000060EB; Wed, 21 Oct 2026 15:51:39 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 4609F028CF5344EEBED6FEADDB072432
X-SMAIL-UIID: 4609F028CF5344EEBED6FEADDB072432-20261021-155139
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH 0/3] Modify the initialization and headphone-related settings
Date: Wed, 21 Oct 2026 15:51:33 +0800
Message-Id: <20261021075136.16155-1-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

To support different versions of the ES9356, the code reads the chip version
and performs different initialization configurations based on the version number.
To improve button performance, we've adjusted the timing and settings related to the headphones.

Zhang Yi (3):
  ASoC: es9356-sdca: Modify the timing and configuration of headphone
    events
  ASoC: es9356-sdca: Add writeable_reg
  ASoC: es9356-sdca: Modify the Initialization Configuration

 sound/soc/codecs/es9356.c | 101 ++++++++++++++++++++++++++++++--------
 sound/soc/codecs/es9356.h |   5 ++
 2 files changed, 85 insertions(+), 21 deletions(-)

-- 
2.17.1

