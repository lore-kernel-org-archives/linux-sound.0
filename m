Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792746138;
	b=sqN3/QYBZoxcrqQQvbglnPN/W1AKzK9sipll7v/Kxf7/WP+5atd/X52yfIFB7O3HTxKQ
	 OLNWVKJaP5eAjL94Iaih6CK1cky6/GYcNfS+iLkw5TCbgdpBBbRG4GI24qkmknWxTsIG7
	 Mu3XYfjpXiUF99TLwm3HqT873d/TA0SRSYLzSyYsN8hzQdZopGssJwba95XU98wD8m8jP
	 e3W6ElQaGC22CfgLdnpiNC2DtLR0iEjatKcazojeRzPJcccrkHPJAMOQdu72nt3dA7li7
	 TxkqtGTOfO90nAjhyRK8OgczDIcCJDlHeBIdWsNdx+Gyd0s8qE23iuDLDFObEeQRMrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792746138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zk8PqaPx3bu25dYVKV81cX4OkbcAyjNl6LlTA7RhVAI=;
	b=lsOOWh/+X1Vma6D2FyJ39VD+2J8yvAmbjOQHTlTtZzcaAsjNL/rm8fMiqsIpWslg8uJx
	 2jLm2cOK/JBwzAVow/SrYUcxT+OTATrHVjFtbceEjg+2OjGDSWoIZtBI16i17K2Fk1pnB
	 Tus1oUVMbzZCRX7EhqMoVaCVOxxn7A8+L3BQe0vd71awrHm9qMqp+sQaixbGbHmF0Ryoq
	 7aXz2U1Xc21xKRGMlvBgMxN3D79T+wQ3J8jlS9BgmeOo8owt7HtsNEHEgbvokOX00ELup
	 kl9T+Fmj9KCwWjfGC9CyuSZNZxP8fMn6Ohue+74NUGQv9PtCBzylEkx4dbfhTJ0LrjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QEvT0wjL;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E011606A31D
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 09:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E011606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QEvT0wjL
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so386052a91.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792746137; x=1793350937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zk8PqaPx3bu25dYVKV81cX4OkbcAyjNl6LlTA7RhVAI=;
        b=QEvT0wjLE3Jnq0bzo5B4znv37EdSUY18YMu5mVtGQqK9pEjqoeeiV0AwIu/HUaLqo0
         iqRi7/NfFU1zmg2Nyv5KABLgBlosTNydS9dCFXlsGyZ2+NtS5Z2g4Pz4cYfygLdJHqRX
         OONvGu9Z/Rax08dPjj4cxAlLKmKQ3In33sUha9J4CyKw26iUzep8jWX3b6yzTrGEZg2l
         YGrjMB/DguIK6/lAOeFv2e++1gkdo9oakRVKoHrcKik5L4m0UT44mAEW31X6rA6mjn9d
         3LFns16u5TMI2kKw8EK1ElWOlRHpfHL/tvx4puStO7Vt2fvUGRLqWfU54YVydZaOeT6R
         3BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792746137; x=1793350937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zk8PqaPx3bu25dYVKV81cX4OkbcAyjNl6LlTA7RhVAI=;
        b=2yKGuKZn3xtI5BpruzX9Z9DQ4tYCN1Pt+4uEOkhM+t1bMIKPmCmdj+K7MSTHXbbZym
         xMAFw6nDH2gkYQnm+wfVB0DcvWNJfY7C1agoGpgx8WNyy1lHsF7kGqPH5goYFFj7UhE9
         FMe54/l6lVmM9HCHf+9BjDCc1K3drHE4wBWnpLdaTJw19pnB+VPSdseLjSraZheoEXxj
         CP3k3agpuQWWTWMW9nsxmEy5dOImy2WHL9jDX4aYuh3t3vMxszIPwXjT+uOfNjbp7qgP
         vLcJoiXNjkmXw7ON4ReYPgzE1e4ef4K6ifY47X0yd1G/1iZP9EKSLYIrJwWrt8a8RVvm
         8krQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlTDjTNOSQulGpzxnyjaqGR+lxbwWtThEFsXwWEBVTmp3Q3jgBW7dAfRY+bcQ7PEIf7k/CfxouiJ9kLg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL+wftnVl2TJWAEKoNF1g72fiE1DtHcVW9y6gP5MEGBvRtwX/Q+
	E9gLhCOk0k9nE87+FiKJSI5eJ/NSTCBQJr1OOHyxSzCnTOVTf5YdsZGb
X-Gm-Gg: AYBFou0h7IRuHkso1QibO2NlCk4zY88O3Z6YaYS6pC1Ljg9+FmnDkDLxf90ggIfqfDp
	FJT4s/EmumK2D/AIWk0BLu9G9zIgBOnAqqGEnqs3APTdjN8IqEHbCI4McYaQagVbEEdNKk+l8os
	peWVQv6zn5vLFgw/doFbOJ+H6SHGHXhqC22r+KK1mdv+7RV3Yjj9tmh/yFh2yrmga0gbz0ic3M7
	FvnJQzH/Sj7j8SsCV4Ik3L6ZPb3biwK/QfiZ73IzX/Xq34f87zOwF7hiNkLqgI5NzUGkSt+O1XW
	6UWgDULPme52h1VVI3RESOoe+iKiKJv8iy1BmcXxOPwpOJBMK7UF+mLEYZAGiJbyAgddAGSm0ur
	pupsiBzFtzbToIp/N7sLthExs02YWd0h4lZPxbTC+M+pl8YOWgfwVJBvIBQUt9vkuho05GuokIt
	hFWMw+jwLBHuXnpl+unFsJAUMSyH5S/yBNbLg7XemvrL7vcJBk5w/0ZscRvXF6H8mPQ4pUKgC+D
	JmPNUjOHRcEb4rQP0ZeUGBqC4mo+Kwxy9jlL0uLgmvKYFmSpTFnLFHbjOuK/qdwgSFfDyT1PoNj
	/8AQmGWP8D4/l/yH7lkyOQEtwbRRH7andsHomi9KqGNkhlzZ4WzF0OSD8A6Auf0kgojFvXk=
X-Received: by 2002:a17:90b:384a:b0:3a7:b260:9ced with SMTP id 98e67ed59e1d1-3adce0df80cmr1423310a91.58.1792746137510;
        Fri, 23 Oct 2026 02:02:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca62e477sm2718306a91.2.2026.10.23.02.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:02:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: David Rhodes <david.rhodes@cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Stephan Gerhold <stephan@gerhold.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	HyeongJun An <sammiee5311@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4] ASoC: codecs: Fix hw_params return values
Date: Fri, 23 Oct 2026 16:01:53 +0700
Message-ID: <20261023090157.518032-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all, 

These patches ensure that the codec drivers return 0 on successful
.hw_params() callbacks and propagate negative errors.

Compile-tested only.

Best regards, 
Phuc

bui duc phuc (4):
  ASoC: codec: cs4341: Handle hw_params return value
  ASoC: codecs: si476x: Handle hw_params return value
  ASoC: codecs: tfa989x: Handle hw_params return value
  ASoC: codecs: wm8994: Handle hw_params return value

 sound/soc/codecs/cs4341.c  | 14 ++++++++++++--
 sound/soc/codecs/si476x.c  |  6 ++++++
 sound/soc/codecs/tfa989x.c | 17 +++++++++++++----
 sound/soc/codecs/wm8994.c  | 12 +++++++++++-
 4 files changed, 42 insertions(+), 7 deletions(-)

-- 
2.43.0

