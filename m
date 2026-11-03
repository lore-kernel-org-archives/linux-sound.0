Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=47.251.158.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793689324;
	b=NrA/1DL4cBfRMmQwBVX9rFPpA1VuKyFAasrlczTtYMvaRcjF6Aqi1OU63ZVgkLTpcBM+
	 qDOuUS+O5j4Bmgtk30hDMlRR4rV7FD0hPXsUtLEmPluBnqsUepbmR+1VpKB1TRQE2Eh2J
	 ADyFjMZMv3TcNvIGuWEaLp+IXQJNP9QqHyGlSSfVEtWAxXS9RcDOMSXDrljsZqrAI6aO4
	 NHjBNl9xA6euvlmMjm6BqDKjdIj0Jw+yZh6C3zupLrGEtJWHi4A0Sv7ccStDEOXeT3JPw
	 WTrW51Hij2RM1b89rIcb/fx1XBGKjoh0e6lsv6vlZWw2ESJ7H9HdnlxgXCxj8VgYfFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793689324;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=GFL336r8PyJB5/FWH8vrLZN0LvxwlMvARWGL4JCEU7E=;
	b=cCjBzEprxtfbEmHpUTIWbJpvPJt9NhdQ2L/HDMGCZ+mx/niRiv31goa2ZJD6LViJvo4d
	 Kma6R0YAzvE2wu1jTHspxE12+8dcAV9poUocW8j9XYs0gXAYVMaNv0+/talpfJ/8JSOWa
	 SQ91EKDAIRb9Fx71jkrZvo1Am5Re887Lnn/HsYMjlnfeQfkMaG76fxY7UxW9ejLKLXzOt
	 EIJT4iME1mzAfb6QZgojDvhMEwIn2oKVSZxz6VAP5780Eg+twk7e6xeJv/iyFyi8wXq3v
	 inNsupOBh/W/YCnaQBf+NXkEO3NAB6hf3hj5uWcnyIXYI3N0yDsKFWrEdYnQFghfOWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=senarytech.com;
	spf=pass smtp.mailfrom=senarytech.com;
	dkim=pass header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b="C/S4kgdH";
	arc=none smtp.remote-ip=47.251.158.245
Received: from mail-m158245.netease.com (mail-m158245.netease.com [47.251.158.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAE9606A329
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EAE9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=C/S4kgdH
Received: from Wangqianghua.localdomain (unknown [27.38.136.171])
	by smtp.qiye.163.com (Hmail) with ESMTP id 534bfea0d;
	Tue, 3 Nov 2026 15:01:51 +0800 (GMT+08:00)
From: Qianghua Wang <qianghua.wang@senarytech.com>
To: linux-sound@vger.kernel.org
Cc: Bo Liu <bo.liu@senarytech.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	Qianghua Wang <qianghua.wang@senarytech.com>
Subject: [PATCH] ASoC: codecs: sn624x-sdca: limit DMIC capture to 2 channels
Date: Tue,  3 Nov 2026 15:01:50 +0800
Message-ID: <20261103070150.115136-1-qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1a036da3d09d8kunma5bf73f331087f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSx8eVkNOTh9NHUsYGRlJGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJTFVIQ1VKSE1VSkxKWVdZFhoPEhUdFFlBWU9LSFVKS0
	hKT0hMVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=C/S4kgdHeBjXsLy8lnZvvMWC9MWiiOaGkOh0TckOFJ8ynU6YT2+bt2iY7HkS6YjZ0bGBuKA2H5RGZRaovRHqlb4BfxpLX6q09fctZlE+n5b3YTuRnB+kTiXDyFWJKaBniKOgeWayZQrhy+wLRCH52XmFCWnMHGFtNNGyXrCrvhM=; s=default; c=relaxed/relaxed; d=senarytech.com; v=1;
	bh=GFL336r8PyJB5/FWH8vrLZN0LvxwlMvARWGL4JCEU7E=;
	h=date:mime-version:subject:message-id:from;

The SN624x DMIC path only has two microphones. The aif3 capture DAI
advertised channels_max = 4, so userspace could open a 4-channel
capture that the hardware does not provide.

Clamp the DMIC capture DAI to two channels to match the headset
capture DAI and the sof-sdca-mic function topology.

Tested on a Wildcat Lake laptop with SN6244: hw:*,4 reports CHANNELS
2 and rejects a 4-channel arecord.

Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>
---
 sound/soc/codecs/sn624x-sdca-sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c b/sound/soc/codecs/sn624x-sdca-sdw.c
index c9e690482..cbe0af706 100644
--- a/sound/soc/codecs/sn624x-sdca-sdw.c
+++ b/sound/soc/codecs/sn624x-sdca-sdw.c
@@ -1669,7 +1669,7 @@ static struct snd_soc_dai_driver sn624x_sdca_dai[] = {
 		.capture = {
 			.stream_name = "DMic Capture",
 			.channels_min = 1,
-			.channels_max = 4,
+			.channels_max = 2,
 			.rates = SN624X_STEREO_RATES,
 			.formats = SN624X_FORMATS,
 		},
-- 
2.53.0

