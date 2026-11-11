Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364130;
	b=gJToM2jpgZuEDi7JY/438OFDAdReGx/5IopEW5qFYbKUpVJYvbG8VqPTQ2RLa/FV2rZ0
	 W5LIignQyVkM9N4rpH/DW32nv5lt8Bdrs2GU7y/ydmNx9lNFr9V1O8kABErqWjMtvOPRm
	 7TgIMnFzRwFr2hZEp77I918rbLaWTLzQummdBi67tv0RErIfdTbnE3eUJvskYRZ7plO11
	 g57pyZlzw1oZnhAFJcDX/cgyRSh/wA8bJR8PTOtBtrS+WvfYxUnJS0e+n0X2L8NeHBSGV
	 0xb8IxEIKON62V6SpQbAcIWToa1pkqtGNtGErbDjGxLHRIbQ8ALNXLJcLhI+IcWcHFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ep0tEvCtZO5eEY5qcruxpg/MqMxSezdFJKxvhcjiEIM=;
	b=t2YqvKalYPzPNdMZEkhgz1dIY++tgMJiYAUknNFdmCrnbKbV3MzIJoSW8vXtJ7o9AWNq
	 NU9nxOa86EJBIXSxxHxAj4CwIIEIThXqjbBB3JtSpTVnz1iehYVqc1ENR7x9WQ+9Lk0kK
	 S5ykxdGpI168yK6eeI4YCSElygrW2pFW2oixkpmlocqzuALnSNaxep4FSx6D+haEt2J2O
	 cURM0eJwdWjB4qRfWl+bHekJi7/wq5O0ysZ+6AbzmxWqqMsig3cJ2rnFVLTXHgb4aNGmt
	 xT3iy3n+ZYtnWtv8Uin+hw+2/uLsQBxLG1RJw8z8AKNRTjQVhFumpC1pIj110T8INxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LtICmUkN;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98604606A330
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98604606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LtICmUkN
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36dbde64409so5641492eec.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364129; x=1794968929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ep0tEvCtZO5eEY5qcruxpg/MqMxSezdFJKxvhcjiEIM=;
        b=LtICmUkNQAnZAIXPMI7szx/lFOqwm+0CzhAVmu0wD7qN8HRBU6jkjqUF71iHCg6HEr
         IXWWrgjAutTLZingpHwe3vL+S/5W5/cIvA9UyPbB4ak0ZoUNr+Lf1AOSPIG6faEZ7AQJ
         Np0DUKG70ICah7uSCo6bLnjF3buY2f7UBg4tN/jP3xO52XhG+AUhvuJQMyHyLt1jy8fG
         c7Hb9xc2oZeZ6pzYVnQZpJySK9e8mEYPcvulAa5wDxG1nB3xkmEs0olCh6+1dQYIHh5i
         swI/XjCOH4s/UFvGVjFfusi1U0GJApHqgocMjMMKVWfR7iYaQ2oL7KjMUXYr7RQ+NGvu
         I0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364129; x=1794968929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ep0tEvCtZO5eEY5qcruxpg/MqMxSezdFJKxvhcjiEIM=;
        b=YHRd4ofYf2l5nnBa8ImecMWnIassMJBR7ObQ2db8yTplUZunzDYcla3D3B8gJdKXCb
         X/A4xxX18qLFcVy2qsa4NFjdx6Evl8VyduSqBzBkmW5O/j4vccR6o0cFqlk3Hgpp6Yvq
         D6tSqSPNWarzx7XOngjyzXGtqj8U9L1ErAgfrSFhMSgf37LgQlUCdQ1EM0jX06ceV4D/
         xT3OuAO5IOkwh9nttgljJiSszQWUcfQvL3qhGTPkdSiyNbHSAlCtXgcI+oLMt7bN3F8g
         rncH1EFFGLJT0oCStAV8619/+rL7LDHG5yw2RnrHcBsc6wpiC1ZX/6SDSCSbv4m9T7iQ
         DjWg==
X-Forwarded-Encrypted: i=1; AL+hErGWgvmxPNkmf80iiSTXPi6Kyf/cwzcS7DqrAnxAzhymkMJWWTNGwFJUt7/WWPw/q45glItR6CWSwfyMlw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ROz7pwQOucxvGHSnLEzTG/DN3bzayPsMQdUzde1cZLp92lKaL
	UEuWZl6f3bpHu6w585T9CWGcuQimAJYWioy/p9UrTXTL9PCZILWIp1y/
X-Gm-Gg: AYBFou1JzSWW/+nfpDetZLSQHEqlcHvsnOOa4p9fRg51dp4D/BEYKWwa08KHTKXVoOB
	QFkZRj4UjIUCuqZfNntzA7+Sc/gDjGggLyeGLU+VQ4buudlyAFfu+fbzPPr3bGgsh/Tr3izogPY
	EmqdoCS1ZIMS5rOUn2fDFXdcsyqwxfCSPpxPxCaGj2k+V07iQ2TZYT6qtfYg5E305xPd35OkRbz
	MrE0m0dl9iX7HmVXMo6rZkuifiCogkSosWxyLb+oqHI9bHqeklpx6+C+//Csd5f0FH8EnhZiFgt
	AC0B++PSGiFaHOE/NMIaXqqJFBldUpD98hKAEw8SfwmRuu2Sg7svf6IxvikvJnEp1mMw/Bxv9AJ
	sm4L1Wc9Hcudg6e3UVLZj5kithwJ5d5LJ5AfWMaI0zj8ibOE7Hc93lixuNwUwJP97ZvibHoJ0wI
	QzSvIq+pyguoH7js2ubnUbqwazZJoYglVq4IXIxveylUkAxm0TT4/AU3RF5BJwOcWTDDu5flut8
	5b5heIhGWUZ7+bGteA6mKSRfSM9x5h6vjRA0mQDZx+uKWgMQhkcAuxUsM1bICuJXQ3kjoJKn6dJ
	6fyeHnlwfGgAxuDghayXu15OIGeQcFz8p3ZjLsbmFdiy+mB3GSVdc+3jnGsTzpLBqo42ZIwtXwq
	M2sjmNYJISsnPshkpdNnG8dg0KwuQkc0NGn74KEx4CI8ytw==
X-Received: by 2002:a05:701a:8148:20b0:194:f017:5a01 with SMTP id a92af1059eb24-1b3c039e744mr1031438c88.42.1794364128579;
        Tue, 10 Nov 2026 18:28:48 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm10054285c88.14.2026.11.10.18.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:48 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 6/6] ASoC: dwc: Remove redundant error messages
Date: Wed, 11 Nov 2026 09:27:31 +0700
Message-ID: <20261111022731.8243-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111022731.8243-1-phucduc.bui@gmail.com>
References: <20261111022731.8243-1-phucduc.bui@gmail.com>
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

The underlying functions already report these errors deeper in
the call chain, making the additional dev_err_probe() and
dev_err() calls unnecessary.

Also fix the indentation of the affected code and correct a typo
in the DAI format error message.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add the indentation and typo fixes to this commit.

 sound/soc/dwc/dwc-i2s.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 55a5dca7b79f..8144a5843062 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -331,7 +331,7 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
 			}
 		} else {
 			u32 bitclk = config->sample_rate *
-					config->data_width * 2;
+				     config->data_width * 2;
 			if (dev->tdm_slots)
 				bitclk = config->sample_rate *
 					 config->data_width * dev->tdm_slots;
@@ -417,7 +417,7 @@ static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		dev->frame_offset = 0;
 		break;
 	default:
-		dev_err(dev->dev, "DAI format unsupported");
+		dev_err(dev->dev, "DAI format unsupported\n");
 		return -EINVAL;
 	}
 
@@ -752,7 +752,7 @@ static int jh7110_i2s_crg_master_init(struct dw_i2s_dev *dev)
 
 	ret = clk_bulk_get(dev->dev, ARRAY_SIZE(clks), clks);
 	if (ret)
-		return dev_err_probe(dev->dev, ret, "failed to get i2s clocks\n");
+		return ret;
 
 	mclk = clks[0].clk;
 	mclk_ext = clks[1].clk;
@@ -830,7 +830,7 @@ static int jh7110_i2s_crg_slave_init(struct dw_i2s_dev *dev)
 
 	ret = clk_bulk_get(dev->dev, ARRAY_SIZE(clks), clks);
 	if (ret)
-		return dev_err_probe(dev->dev, ret, "failed to get i2s clocks\n");
+		return ret;
 
 	mclk = clks[0].clk;
 	mclk_ext = clks[1].clk;
@@ -968,10 +968,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
 				pdev->name, dev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to request irq\n");
+		if (ret < 0)
 			goto err_assert_reset;
-		}
 	}
 
 	dev->i2s_reg_comp1 = I2S_COMP_PARAM_1;
@@ -1012,10 +1010,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, dev);
 	ret = devm_snd_soc_register_component(&pdev->dev, &dw_i2s_component,
 					 dw_i2s_dai, 1);
-	if (ret != 0) {
-		dev_err(&pdev->dev, "not able to register dai\n");
+	if (ret)
 		goto err_assert_reset;
-	}
 
 	if (!pdata || dev->is_jh7110) {
 		if (irq >= 0) {
-- 
2.43.0

