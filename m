Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864503328FA
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 13:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679570; cv=none; b=Xhgm5dDCAjNTYH65O2w505dHTvg8AJksyfMA8BCYvcrn1uAWcy5DoJ/1hO9jibF0w7uUZUPUVCM+QKlL2n/csz7NBejVOBsqpdxVBTbbBmOhnQpwAINRk/eKCHEJkCK5AxWLsH+C96WvODqllq8j8pP+gc8i+owDYve7DcGoEtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679570; c=relaxed/simple;
	bh=QL3aLv7tfkJWceDD9z9IZ1f1wPHpKCE9Y2VUEZ48vIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UDVr9basJXBz5JnVzaze2obWrkXPnH28UkRSmDepcjBfGtZe0+UZaE52nr3x412NcvZs5+Old7wh8bXx+wpFg+NTMEebf2OmkstETlulVu4h6kb8gFcN4o2gf64jhjrHT+iytAqMGglf4Kg1Ln3oCoE5U3yNBJf4ek1S2yCtpVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=X1gfQdU9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="X1gfQdU9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so30203625e9.1
        for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 06:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1778679566; x=1779284366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9uFItAse7Ylvn/bLaUPDjvgqhYs6vt2DJt3kwbd8yg=;
        b=X1gfQdU9maH7aw9HwgDX7AG7SZohcJBkp9lZBcbLOyfO9TDE+mcYfhOtwMbF4oYagZ
         cK7jf6MbLWPTWEY2WAJRk+qVcPV86DUB6xp0n5bE4TiYJ3egTXkewIrCm2xGlyvqQ75m
         05T6Fabeajdfjkku20EDe/kmEoyCOUSzOs5Pf8iQTotqzE7wN077C5ic+DMCPNgkkxnQ
         qmVYjNXhCGaMxxuwLPpwQ9kOjtjmSx9T+2TiDt8JoH+sVsmOqDLcl/DNO0uRRAOkrA60
         9b0V+YolFApI5ngw2ZGEpjQyKXehbe5E42mY1k7s0YP9dJun/VAcPLSq3f4mxaeB+oRa
         hW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679566; x=1779284366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T9uFItAse7Ylvn/bLaUPDjvgqhYs6vt2DJt3kwbd8yg=;
        b=byJqI0spwS6/siyOQVgUcCq9JJ7f8hAKZAC9gXROh91XNsRxYboFf/8SpArD2JDnRJ
         7yqMHY4QJQEwkstAmXWQZl8geyy4yEb1e+9c/YvXENGrc53C9EycKVxsF2nWMVqui/m8
         m7U5rWFJ96NFWmA0Qr6NvyiDmb9Gh2G08xAXENpLJXlKDyQkUqpQ8ibyWombnX9c8wkk
         BcTwo4wHJr3lpCmwPnUp+bFZZv6WvZgaKRoiVmkpOphGiAhkxMhqaYR6nhzRUZ9+y5lW
         6oxBsc+jbIZKO5sPTiMqHsUAIioIBN5hmVrrBfwGb+do5xVWnu9I2gkx68Uiw5KRi9ZE
         UVfg==
X-Gm-Message-State: AOJu0YzMbGeaaDtMN2GYGRDSXQnw/hINEFQMbtuHBVLXAeGL3DM/E1tx
	VAIa3KRG62iqvQueo0R0ZpOj/Rb0SJ4pgZ4srGlNCLGDIeUdJTf9f1bpRevgOPp2dTs=
X-Gm-Gg: Acq92OHU0RoKE/ju5UzwcA+zqueL2aq94ki/pVt8O+HBfQdDmTF81lR3r7s6tkQKbxc
	JUqVqNBCF+6AUL9sfcyiU++g+tj0WcX2NrRh7Kxz8WS++/dJgn8Cg15EqKZDrGsN9/egmtmmoe7
	TyiWyVYGkQKgfmTSrylmLbIvlmOho1eAQhmaumuB4EvHLCiz2fxKlb+Fhbvb1jbQAK2VMbT8T/H
	bxbqWrMEcvvBZ+WgY4oJ8ShuiHO9RX122iZw/48Bw3q6n03VZajzwLZRlEewvfFbUxX7mhF/WdE
	ecix+PQcSo8RjzxKsBFAEZ7zBapSIH+HoS34K+ddGVKsLY+7cMzsYGsVr91dt5mWtJRnwFgf28j
	94XTUPyWeD/Glvngq+2x5KWt8XZvTVsbpheoXTGWsyxgijanOAsRDWHIgK5SK6J323xFoVfDzV+
	vyd0PphwSvp10LMQ4TOO9CgqunHVTZXY9eEZ9ZhxCa6RZ4EVHkdqLkyeH/P/pNNH3Tqrm2vV42F
	PipcfMJ
X-Received: by 2002:a05:600c:524d:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48fce9c0965mr43813865e9.8.1778679565873;
        Wed, 13 May 2026 06:39:25 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-83-110-135-253.alshamil.net.ae. [83.110.135.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca383asm39627560f8f.28.2026.05.13.06.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 06:39:25 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 13 May 2026 17:39:11 +0400
Subject: [PATCH 2/2] ASoC: codecs: nau8822: add support for supply
 regulators
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-nau8822-reg-v1-2-c532e18e92ad@flipper.net>
References: <20260513-nau8822-reg-v1-0-c532e18e92ad@flipper.net>
In-Reply-To: <20260513-nau8822-reg-v1-0-c532e18e92ad@flipper.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lin <CTLIN0@nuvoton.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1602; i=alchark@flipper.net;
 h=from:subject:message-id; bh=QL3aLv7tfkJWceDD9z9IZ1f1wPHpKCE9Y2VUEZ48vIM=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSx1LNV5jXuXnkn6UzW39/Jt3t2m9+fLGkWty+W61h3r
 sP+zdYBHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx1x2KGPzwxJ7qWsGs+OPec6cLBy/Z8k1bdky/crFViwMJcn29pe4zhN8sr/9X
 1LEpzg63byrVP9azMNOqT8zbQvTD9zwu70pNlDAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

NAU8822 has four power supply pins: VDDA, VDDB, VDDC, and VDDSPK, which
need to be online and stable before communication with the device is
attempted.

Request and enable these regulators at init time, if provided.

This helps avoid -ENXIO errors when the codec is probed before the
regulators are ready.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 sound/soc/codecs/nau8822.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index a11759f85eac..c21a037e0f08 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -1153,7 +1153,8 @@ static int nau8822_i2c_probe(struct i2c_client *i2c)
 {
 	struct device *dev = &i2c->dev;
 	struct nau8822 *nau8822 = dev_get_platdata(dev);
-	int ret;
+	static const char * const regulators[] = { "vdda", "vddb", "vddc", "vddspk" };
+	int ret, i;
 
 	if (!nau8822) {
 		nau8822 = devm_kzalloc(dev, sizeof(*nau8822), GFP_KERNEL);
@@ -1167,6 +1168,14 @@ static int nau8822_i2c_probe(struct i2c_client *i2c)
 		return dev_err_probe(&i2c->dev, PTR_ERR(nau8822->mclk),
 			"Error getting mclk\n");
 
+	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
+		ret = devm_regulator_get_enable_optional(dev, regulators[i]);
+		if (ret && ret != -ENODEV)
+			return dev_err_probe(dev, ret,
+					     "Failed to get regulator %s\n",
+					     regulators[i]);
+	}
+
 	nau8822->regmap = devm_regmap_init_i2c(i2c, &nau8822_regmap_config);
 	if (IS_ERR(nau8822->regmap)) {
 		ret = PTR_ERR(nau8822->regmap);

-- 
2.52.0

