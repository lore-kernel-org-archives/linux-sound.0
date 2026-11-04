Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804529;
	b=VC+BzjglWRPsIUDQwWETJb1OqF7XOJZ11vy7Lm+GX15CTtZAgkoom1iwJ48gR53+f/Na
	 NRaMUGvPvFUVnOtKP3cQQsUVWG8fZPSQsQqznDLwDCWixNhGlgYrWGhaGlqDzDvhVOW7P
	 qqC3HcXJZCcR4Hx7A80CJDELVh66wVtmhW2GyvgjVSUST8eV2vaVpB+9A1JS3rBY/2J+/
	 jKJYFhydk8sEK3/BU6WsmhBO49J2cDA3+UEC5OtULtnujOS4HUjhLB2MqhYocC95BZA1f
	 qHywd9dR5hQZBGcDUkbmObil8FYiRQlW6nDK86KtHoxOb8UxEsrYYSf+fG+ek0ToU8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NhDXAxK7zSTJl6yEBVccSqn0jUP1G3BBGvx5RY+eCO0=;
	b=jgltWADr1+omvlOkdm9cwdIMlrV6+fAT0HbL6q8aL6B53aoZBvw1iVgZCEmwgn9+lnV3
	 fRW/WGjVyha5kuZKOf0w1M0EyiLhd1RvDFAAzMO0DOjP/Gw3WnP9tcVpLWIO57JO3t0lX
	 UAg0wVij7LJRdSbQEksvXrGBOrFY1q36JTgiwYCiKsTxU9+hQ2CvLAqVIadYCjloeJpXz
	 6zD96cTtGddslOQWo5TFEamXZPtzslJYPZbyG97oDfKqrlCbc75ndS1rr8enUcqvzpf1v
	 y7QNpfLqoCI666OL+GdPByKbQAW25JSD7NreiSZhtChEZoXlB0E4q9vrP+eW7/I25wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sLrvMirh;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A3C606A328
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 15:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A3C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sLrvMirh
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2761c69fbso1890449c88.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 07:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793804527; x=1794409327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NhDXAxK7zSTJl6yEBVccSqn0jUP1G3BBGvx5RY+eCO0=;
        b=sLrvMirh2ecuW2S7MRadWh1VKld0W3L5ypNP/I+48lkDU7us20FkyWVOVzpbfAlPlW
         GeoJFyBQ4xaq2wAGSzYIBs9RCiGSuomNpcRpKlS0eUloAIeTZFCH2v96y3rpIiKBezHt
         /4B2ant3dT1pS51g2HCehn44IGAMaCeh5g0Q/MEI54G0BxTh0byVOpVSdRsAWcy3J97G
         KDnENarjgTWtqLkpnpgCWyhM/BB43Y1FeKCHYMo0GmIZs8hevWFokPeR1oMPOtyz0WXt
         Eg3xyDXT47kIkuGPOkUfG/36i0NMz63W1Wh3W3AmD2Kxi3QL/GZGbYrracB+yZp0pYMg
         WbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804527; x=1794409327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NhDXAxK7zSTJl6yEBVccSqn0jUP1G3BBGvx5RY+eCO0=;
        b=wpuabmq8pDC9rnFS9CBngLbLWR7/4/d7VsBBFvO8A75gCqbUUGy7FpNH/IQHChG2Di
         wSjF1c5JQowmzgstZ+jWFK5OQ3dEzkMw9s+aWuOOdNnOpzaalsX+KndWHrhjJKVurwPj
         PDW9zbJbMr4WX5dz26shCnxTZAWKjuWR/gXn6wF+wCifPhhD6IvJTsPufptPdXqfhkWa
         b/eMUjN6L+49ZxXZ1bZ+uaMpdWkA6r4J4HcpVqLZjoSigonwzgfjGzQY8DWJyAljeku8
         ju9Dr5+SQwcbqnhnt/oCHz6qHwEvudbpqcZuLkBsnRDOG/kSjIwtS9Sk3ddfweD5cr/I
         RvoA==
X-Forwarded-Encrypted: i=1; AKwUvBzJeHKjHwK3cLDZCd7KH+s/yTDw16usKrm4Q+MeF6fWA0la3gvlFou2ULVDjVpQGNc9fiZQrYrFsZfXwA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8R70sAw0Sjq2WVr9z2StwUiBnaU27uvEtKrJzGryDXcNZsYeuk
	x/wLWBdJk0nl+TGA2YCZBzmu5gnBT5dD4Fny8TXfg6tE/tsWwKHanKQF
X-Gm-Gg: AYBFou2qdvA6ZKX5RB+hnhsH4IWZ0Z28jFEsAsD+XfcNNgw0PiU4o4oh63Ur+Z6jhsW
	Nzi+sCC71Fxo8y98X+tEvBX7rJhroiVOp4qvdeu5GWrs0nwWo74YKDkEFQNAoOr4FrztM25+L3U
	L5m3rLPEPVMP2v22340TycAQ8VGL+NWT3vtm2tpPKoPQHkz6pvav1An/obTXS6QyShT08tqUo3U
	KTLbUolE7CQ4GXYN+XU2x+229tco1mDeRgllOH0edf2mYvU/0HO/JRN4OUK2FiLoWHwWnNJeoqZ
	g3HfNY9vMrL2p/6/6dfsU/AsJ5Y4JxyetuujvGbj8MDaM4dHuwrHl75WK0U6aHuV5pfTphTJFH2
	GJMkFNy/GQyNElXbw5LmS0hikTdEc64tXMmZhjV7QoERUQ9YtcM9m3o/J+frAr2pxaOCOd1q0jj
	8hCZerQXVxbL3iwW48oxrUX8sfzj9Mbws9kp91V25SACtgLtVTx3nUp+hLgQBZPNFyBFL5afTPJ
	ffxJcJDBzYcp65z7AzpZpuEt5o1rvL2Ypq3z6+x4WsS1gn6k46PY6j/nWReUhLitH84fq+3rSt1
	GUwM2GEpu9T/kzpqgePlzOx7d491OLZXzSJpXSuSogcNUHNRar2Bf91J/mDP9X7JLZja2199Xdi
	Vj0Aw3jLiPYKsEiVkwD/5U4rXNng=
X-Received: by 2002:a05:7022:2582:b0:1ae:e0f5:2cdd with SMTP id a92af1059eb24-1aee0f52cf9mr24971896c88.28.1793804525902;
        Wed, 04 Nov 2026 07:02:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:5040:8550:f5e4:709a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm8735094c88.1.2026.11.04.07.02.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 07:02:04 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: bo liu <bo.liu@senarytech.com>,
	"qianghua . wang" <qianghua.wang@senarytech.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] ASoC: sn624x: use dev_err_probe() for the regmap failure
Date: Wed,  4 Nov 2026 20:31:54 +0530
Message-ID: <20261104150155.33157-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
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

dev_err_probe() prints the symbolic errno and stays quiet on
 -EPROBE_DEFER. The sn624x prefix goes too, dev_err_probe() already prints the device name..

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 sound/soc/codecs/sn624x-sdca-sdw.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c b/sound/soc/codecs/sn624x-sdca-sdw.c
index c9e690482..1a83f0a11 100644
--- a/sound/soc/codecs/sn624x-sdca-sdw.c
+++ b/sound/soc/codecs/sn624x-sdca-sdw.c
@@ -1736,11 +1736,9 @@ static int sn624x_sdca_sdw_probe(struct sdw_slave *slave,
 	regmap = devm_regmap_init_sdw_mbq_cfg(&slave->dev, slave,
 					      &sn624x_sdca_regmap,
 					      &sn624x_sdca_mbq_cfg);
-	if (IS_ERR(regmap)) {
-		dev_err(&slave->dev, "sn624x: devm_regmap_init_sdw_mbq_cfg failed (%ld)\n",
-			PTR_ERR(regmap));
-		return PTR_ERR(regmap);
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(&slave->dev, PTR_ERR(regmap),
+				     "devm_regmap_init_sdw_mbq_cfg failed\n");
 
 	ret = sn624x_sdca_init(&slave->dev, regmap, slave);
 	if (ret < 0)
-- 
2.46.0

