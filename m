Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E722F388386
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738837; cv=none; b=MdHUuutJ+UNyEqPSZdx3CYt0kVoS8hVEPAIoH9t1EfXL8+5tdBi0t0cv7oPBDYZfzvsUAaf3a+Yxu1wAysngBFdEAXf1ABSD+bxEPsLoDuX0SBAZqcA3aBVTl6zUXDhzqXCdatpi5/SgtAUsssGDQ9KNksPDriGMbNpKILwDIHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738837; c=relaxed/simple;
	bh=EO7Wt7DOU6+nQY6d+/v2RqUj0DHr7rPGEWnPMEK1hsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A92HLBrr3Q0psFNiXLbgi/bJo/hrzeme0Irk9dSmqJ7PsGxqlFsSjDyDfXVSBtXZRLH/IUZMYEJWahCXeJ78jSkY7Bt5d+4gORSTq65b66qkAmUtr4jSLKLZQ/rqSBMX9pUtNS/wo0DFsip03V5u/pPS1REURHwy4ICDVQcyxA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYrZQjjf; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYrZQjjf"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398a147688bso755491a91.1
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738835; x=1790343635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skaVQas2esAm6HNfYY4sXBxMDL3EKxsTuH/rubWzjqw=;
        b=WYrZQjjfcZhpBt3rijee5S2O7439f+28+BRBSEKAecsRRai6tAympcW7h3fNbqc58d
         pzy18wPubQWzKzkb2J6vhTXRcZvxQ50mJaI+4Uu/r6Tn+X/l/G3laKFlA7d+pxCEFQf0
         fCagfAI0g2UoHMSgzyfeuYp4/FIPD7JqNqchhfqPJNG2cjRoff54YT2ZBc0a9PyGqp1H
         q0RpyjcT9MISkryZJh/SUoiOqh7PjEuAt+aFQ2F7hV3aFPD4mgjAI+fJFG+y6OTND8AM
         WB7HFjl9eFDjWbp7didRN6BZF7xYLFLJ0vysbyZVmpi+1V9zqaQxLLlcfyBqQDCWH/QX
         5WLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738835; x=1790343635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=skaVQas2esAm6HNfYY4sXBxMDL3EKxsTuH/rubWzjqw=;
        b=VDq0TLZB/nYlWqOpR+5LLtCw9I7h4EN6w5otJO2mZAbwDKH0bxllhmX4JLXxOGvRn9
         l+CQTJLwC8XxUX4LnCbjgtJX7L0RiHLwk/+0/OKiHjleftoiYLOrKkHpK6DNFW3PXbam
         AxVfkb5DwD405xNaLHr6NCXoPInqfPhc28fD0LlZGuQ7qbqOojgqGEtc1wRHG53gsWA8
         4Y9tYkNUil3aWHfwjMq/a8R7MyX79MO400BNqvZCcH7hRdZNcjHJLUfUOH9C3xqR1n2o
         6VUw/DGm5mnghvpsMkwui4/oT1hrFDfI3NHSDBzZo2LUZ2r0TOEsliWbvQT2E9nwz0i3
         kuOA==
X-Forwarded-Encrypted: i=1; AKwUvBzL/8EJ6WI5diusywH5rTUJB4k8StDemkvWBSs7RGOXoohgsREx1XltawiNxiSg0uDDDTupaBxQ7Su7DA==@vger.kernel.org
X-Gm-Message-State: AFuF++nfgv+eqkA4Aptb6ASSj13OK/wBHZ0fPXFm3bVfUBwHvKO1wLrZ
	+rItElC2W2psxNT2PZe0vL6EScnSZbTlmqkv4JhmoMaumiEXGcsXNplP
X-Gm-Gg: AYBFou2J4LlDxbV/mszw8lpM55G7G74swkxu+pFxE2vyN4+MV87aAED5ULkhUVQKESN
	TkxkP44/WFPps/ekZq0FfntMQc9oi+k8QJ7wSlemibO2Tu0c1vlyeyBd6qbBjziGTfLjRtl7mve
	6PvRukRVX8vxQbMqgc+kIgATtwzAozXINZDj+p8GlWwdlGE0wXmsknrzCwovWhcK5W60IsiZhyk
	ZEalmRhLYyIVw45WKyQM/O3/LozQokpKm+Z8iU2mG2017HKjEJdu/Yt3tV01E17GQfYaJqiyaKf
	tYVzKxm5NhBqIRY/oLgmyaJYr/FGA39pbXrgXTh3lSz70aIYymHqvYN+mIwmCPRSQQHvn69lEfD
	ECohVXjKMDFdJUmulM7XE+Z9qnfdBbnET1CO+XPgbX1bHsxcDXXxE4oCfUj4cJAa05Txk4LqPJ2
	zrTNV/ts/pFVLUTLFu+nFnZCxL660UQIS8YROU/8HX3E2Mb5OygPGe2ivoLhMNwb0hKQJ6dlQHD
	cbp1LPO53Vb9LmGhpbuUKdBFkNwVN8cGXG7HH645UJMNlC7Dmr0MqshVa8e5OilVXHl+TKvCPJ2
	QsIzK128G3ME9QlwaWOxqc/7Gw==
X-Received: by 2002:a17:90b:17c5:b0:39e:1633:d29e with SMTP id 98e67ed59e1d1-39e54cc6ef6mr6089597a91.5.1789738835185;
        Fri, 18 Sep 2026 06:40:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 11/15] ASoC: mediatek: mt8192: Remove redundant error message
Date: Fri, 18 Sep 2026 20:39:07 +0700
Message-ID: <20260918133912.133799-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() and dev_err_probe() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 5aaff5bebfb6..45addf9f3790 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2192,10 +2192,8 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* init audio related clock */
 	ret = mt8192_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	/* reset controller to reset audio regs before regmap cache */
 	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
@@ -2271,7 +2269,7 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq_id, mt8192_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0

