Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4368137F74C
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 13:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925996; cv=none; b=gk34KkDnTvT1zaVMOAHvyZfyKKY2NlHQGtstKWT6fZl/z0WaWEbRjCPBp1mi2l7UYjWZy/hXBzLzFKUNKvpFOyDCXIrysM8H4EpwCjyuKFADBDQQHhG9MKbrkKhhZmRpJmRdQuv8Cayiv7ZfNv8PUqRDjhnhJ+xy4Sb55Wysdkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925996; c=relaxed/simple;
	bh=MCx2N3prAUvO8MqB4noVmeheqznOyy7WsBMuY4aEAtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PNKyc4cY6hHxwWiY2RGk7xj1eJt1hMvf/FxCpzPWAlb4gUyfAJoRqLefvp7l1BJwZtEIZm3ZKT2+aRPB6RDe7vaMetBUxprznXKEUKV6olmITd9KP1eZA56FEv+ZvlSNEhBbAimuEkji90f8ycIWs86EZpqBdZXfuqlPsy5mSYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcEeqrQ1; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcEeqrQ1"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-307263ad0cbso5505388eec.0
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 06:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925994; x=1781530794; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5KkougDEniPNaB4zp+jheULTstkgfTv6Bq66fUj4K0=;
        b=pcEeqrQ1rXSkw4a9YhYtbBwLi0wiTtajYkk7MOctLEfub3YlVN9RSKkvry0I8vHxKF
         OCy+sxy60liWa0bsvCvr+jTQqrNM4CJnpEhT0BwIvG4pP4mEuWRlTjWjHKx4Vby2maxg
         8ieN+NabylhRwt6BpubHfsG8XFrpLTJGQrVY5KXZcMh3l6xX0EW8al2vwIJK/qvCQNtZ
         S6Y2GWu7yUhpco4pTMpHzHBNaRrLQrNh410EgVp/9UeXEZOEYKFadULTt7zsHL0S81lB
         NcuvskIJ2OeGrHWaEaYpqq+jF6vM2XxXk8zhAxUkzpEx9U4CAuoQlOX8vRXTWPkvsdtk
         9IoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925994; x=1781530794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v5KkougDEniPNaB4zp+jheULTstkgfTv6Bq66fUj4K0=;
        b=Y5SZ+QYHbRdLk63AXJeYm5HYCAZOQSi0G/vLI/4QpP3IMW06tOUQf/nFwyISQSn4Mv
         uZRSUycNGV8iWPM2tpLxbiCXDnYny5JNB0CexC9tA8S2s3/iAprVJJUt6OXD6XTRxvND
         J2aZLX2hcmy0AgNTZmxZVgfj1/oSi4XIgpLiti/U1O7nSIMYXRPUQP02cBPv2yOMSel6
         tk0upGf/YoVl2kFXroI1wXaFJAOYX7AUleGGYwtqStgzqiNTQ0vDOKXdSAdnDmERyXcv
         fxlKM0YAhnaGUTwnR+zCmGf1YpTjVdvD0oJ32Aj2hv+oc9FHAH3IjGIQMYcocnW133P6
         vmqg==
X-Gm-Message-State: AOJu0YyW0vL8Bp+qxMMvnnuKLL+ijHaaafGmxepkEd86X4Jx7eijwfAG
	eb+S+OEDEoDQfVQp6werRp5+hF7+3xLoro9NyEG4bpQ4ysmV/J/yQBbp
X-Gm-Gg: Acq92OGVpw2sMbATDr8xDazYtr/Ko+L1at3jelNaq8xxVHIsaWq4RcBkQjByblfgDjS
	Zna3nPvtZtKcFPdLrI6zAt56+uMWHT1W62AL/n67/AGECKDauGQmmLRwb/CfHhutQ3pe39AhzHi
	vugpHpIDoYbwJb7UycPiyBnFPn9URw+BomsmxRt69nDRYXalrqo9X7U+h1emN6ftQlwBI/9etI4
	MUkIwdvpmjuOgEiQK3uWCgJ98zIbZeXchCastviFl472rIgCrL70TTibDjzXuJnLCo9ZaAzubAa
	ipfR+COE1DbfaxcrOZM4c8hYCpjqIDzYxlL93PcgMGQclF3pe4XAE8XRcrN2XoG3i7qoi2lkv/C
	p7bVDAnH7WyXulWjqVmbUUKBEPtu5V+SewdYwyKttQDy0JKbveLMez/AlCwyVBDU0MELICiykHd
	JwK1jkA9tU1blgr/lcXyPT2ZWQH5eeY+sU7b9quAG2p4arn2Mxy1QSBg++qu5B2MdfzkrzupO1Q
	CrC1r0tE4RH
X-Received: by 2002:a05:693c:3003:b0:304:d835:27f with SMTP id 5a478bee46e88-3077b15d304mr7307289eec.22.1780925994137;
        Mon, 08 Jun 2026 06:39:54 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm23893449eec.5.2026.06.08.06.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:39:53 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 08 Jun 2026 10:39:12 -0300
Subject: [PATCH 2/3] ASoC: fsl: fsl_qmc_audio: use scoped child node loop
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260608-asoc-of-node-scoped-cleanup-v1-2-9e3ac518dc2e@gmail.com>
References: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
In-Reply-To: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Herve Codina <herve.codina@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=MCx2N3prAUvO8MqB4noVmeheqznOyy7WsBMuY4aEAtk=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlqxyQ6WbXOHZl573lk8fKZWS9rEjeZ7J/2YxvT62vSk
 utzDuowdZSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBE3n5k+Mm48r9C6PqddYW7
 uKUX3W660TnB1a/qr6303zidBctYjqoxMuyLmB/7u3zl96m+jSwPQpazaHlsyeq94VPsoy/x/EV
 /FzcA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

qmc_audio_probe() manually puts the current child node before returning
from the DAI parsing loop on error.

Use for_each_available_child_of_node_scoped() so the current child node is
released automatically on early return and normal loop exit.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/fsl/fsl_qmc_audio.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 76e014dfb6d7..d0f644573f49 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -905,7 +905,6 @@ static int qmc_audio_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct qmc_audio *qmc_audio;
-	struct device_node *child;
 	unsigned int i;
 	int ret;
 
@@ -931,14 +930,12 @@ static int qmc_audio_probe(struct platform_device *pdev)
 	}
 
 	i = 0;
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		ret = qmc_audio_dai_parse(qmc_audio, child,
 					  qmc_audio->dais + i,
 					  qmc_audio->dai_drivers + i);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 		i++;
 	}
 

-- 
2.54.0

