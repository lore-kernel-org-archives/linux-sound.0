Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D05942056
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 07:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750662233; cv=none; b=azGTElhgdmqQb5nhVAehoZNX1RaOSmJQjRVXywuXTIL9YuU4n13AJ8eLSVREK6IUK5C8f8CTSOe/C7e3kf+rBcKH5tcDKb2Si+qGw6pAEbhoDEOLEVx9hXEZkSoEYbpWrz5pFJNNgu7YByeI6lctvG6eniFGw98RMpPB59jnGnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750662233; c=relaxed/simple;
	bh=P3kETJ8LidkPZ//hW+gPV08IjIWLb5wulVSUE8kb97w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=XHvq0CRTkWktsyoOfmxWF3FxrKy64WH3nZxg0ouHUgtSL+C/olFE+/As4y52neGafjATUBv0+wrUhe4eBh6oRM/nQe3FTL2rdDwEE+3MQD4vbkwj0c7sovcBWzPacwogpSMlva/ZpogPmvKSQ8h9kLBYLCR7kXWFlIjsZYjqWx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=D2+xuEaO; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="D2+xuEaO"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250623070344epoutp035f0dd82ecd78bc3242d5d3a9fb0b078a~LmgRxvwi30046300463epoutp03T
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 07:03:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250623070344epoutp035f0dd82ecd78bc3242d5d3a9fb0b078a~LmgRxvwi30046300463epoutp03T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750662224;
	bh=YTLfCfcDzwFqFf1VO++bPGO86I60DjAXQ5KSiJJ+9JQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=D2+xuEaOBg6NSOKaaIk/HyluydzNPAzVLDZjHgwcW+pwbdfC1/U/ELio0xiIDlMk6
	 W+VwwNkg4HXgLIzefoO2scSgdTXVQPXbakzNZLNSz57/f0/Y+sTk7PeMvCqBSGah6N
	 Vgc/Z9tNcwaSlh4hM1OxVYbcCP6hhHXrZa4Cy810=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250623070343epcas2p2a6da5d633764311650e541a9c297a3e6~LmgRfQtKt0483104831epcas2p25;
	Mon, 23 Jun 2025 07:03:43 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bQfFB5Jlvz3hhTM; Mon, 23 Jun
	2025 07:03:42 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250623070342epcas2p40b58c1bf858f69021e917deddc76015d~LmgP5NGdG0481904819epcas2p4h;
	Mon, 23 Jun 2025 07:03:42 +0000 (GMT)
Received: from KORCO117793 (unknown [12.36.188.221]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250623070341epsmtip2595ecbbd0cb912e76fe85f5f7c924f4a~LmgP1hbE20757107571epsmtip20;
	Mon, 23 Jun 2025 07:03:41 +0000 (GMT)
From: =?ks_c_5601-1987?B?wMy9wrrz?= <seungbin.lee@samsung.com>
To: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<gregkh@linuxfoundation.org>, <perex@perex.cz>, <tiwai@suse.de>
Cc: <pilsun.jang@samsung.com>, <s47.kang@samsung.com>,
	<donghee.moon@samsung.com>
Subject: [PATCH] ASoC: soc-compress: Fix race condition in soc_compr_open_fe
Date: Mon, 23 Jun 2025 16:03:41 +0900
Message-ID: <009401dbe40c$f3df4dc0$db9de940$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdvkDPOwqDp8ee4vSw2zWHcjHl49Kg==
Content-Language: ko
X-CMS-MailID: 20250623070342epcas2p40b58c1bf858f69021e917deddc76015d
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250623070342epcas2p40b58c1bf858f69021e917deddc76015d
References: <CGME20250623070342epcas2p40b58c1bf858f69021e917deddc76015d@epcas2p4.samsung.com>

From: Seungbin Lee <seungbin.lee@samsung.com>
Date: Wed, 18 Jun 2025 13:33:02 +0900
Subject: [PATCH] ASoC: soc-compress: Fix race condition in soc_compr_open_fe

If the soc_compr_trigger_fe function is called during snd_soc_dpcm_runtime_update execution,
the FE's DPCM runtime update variable may be changed.
Then the BE list connected to the FE flies away, and the BE cannot be closed.

This needs to be protected by the snd_soc_dpcm_mutex_lock.

Change-Id: Ibfd1712e6baf41a30afa357a91ada83d205f968b
Signed-off-by: Seungbin Lee <seungbin.lee@samsung.com>
---
 sound/soc/soc-compress.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index fc8db54352541..1a2a3fe6a2340 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -286,6 +286,8 @@ static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
 
 	snd_soc_card_mutex_lock(fe->card);
 
+	snd_soc_dpcm_mutex_lock(fe);
+
 	ret = snd_soc_dai_compr_trigger(cpu_dai, cstream, cmd);
 	if (ret < 0)
 		goto out;
@@ -315,6 +317,8 @@ static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
 
 out:
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
+	snd_soc_dpcm_mutex_unlock(fe);
+
 	snd_soc_card_mutex_unlock(fe->card);
 	return ret;
 }
-- 
2.34.1

