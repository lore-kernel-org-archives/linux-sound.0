Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C2A37F001
	for <linux-sound@vger.kernel.org>; Mon,  8 Jun 2026 13:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926002; cv=none; b=iebgkBNFypJAyjzuBGFYAMkZiFe4Soocc2lRf/iBUq6PGxr6KgwUv7ZSiFxeMHjPEYyn0krbs1yJNm6RUKf9lZNRba2kl0ngKCgsb1tfApYOna7MIhN3iRMyX/dPEKWGkx84sbO9F9+VY/eft7FLZ5JkKu+YyMsNhuxLAgzkRYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926002; c=relaxed/simple;
	bh=vyC7w6pskJBgaLu4nRRhMfqupYy0eXGTyLVkdxR3pJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kULU8Mntxd1kaUmE+TuMagaQnLXCzFw9Rj6XyRjQA1z/l3V8FA2PyiIGus+lIw3xi8aJDyHbCd/Q0yV6X2pFjg4zB3TV5Ju82y0oep+fzdgnOmSw1Sxs+2U+d6LpbnIB9uOe1FKHLeRyQ4nYWVasU4IYS6Ti5YhGUDEjBr/QaqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTbq3s+E; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTbq3s+E"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304f590dd91so4579217eec.0
        for <linux-sound@vger.kernel.org>; Mon, 08 Jun 2026 06:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780926000; x=1781530800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+CdAGYIEklPCYPkGTaICLk240mHu6t2xegNP8dRyKY=;
        b=cTbq3s+E0EgjDUhBeyGay8XIgIKawmRsPEGPUMy17wZxMclXJi5iE7y68hUxDzebaY
         g1Q6VHnBnjG81OS30/HWK5FFcbEnDmtvfzLtUQzEuj03j9T4BfrkNPYdvrpJGSGQ/AIq
         sbXOfEbmxsRpSYq1Ihuq2RYivGD6VRyHTYNnyJsv7b/yQrGKZrfEuLmYy2Tt0M0ccW00
         fAR4lGrc7xz52nvRQmDV22Ng8RvUA4Zk99L1TTD4fpxkjW1Qjykd+FTPmjYym6yQBLig
         7BH35hkyYG2OQMFU8RYBbZJz7PlJCAcCRCyOamFEfxl9ls+S3mxzDaFNMdujSE9dj1fM
         /nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926000; x=1781530800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r+CdAGYIEklPCYPkGTaICLk240mHu6t2xegNP8dRyKY=;
        b=aipL3UgHeuav6XsSbuZ6m8yv96Gu8JykOLb0gTRQvLnZwyBRk41VbF6iPtCRKpHcRg
         rC9LyROdbeZI+Y/Dd5O2qFbjmI1ZNdF1puRMrtI5GqVw0RdR/8ZXuQ3NniD9QFaqf7GE
         xQbUtK03O+Cvxf6nWn/iZW6snLeNv1CN7vNla7z19dHsuafWRHpJZjMHnyP3Ao0iBRB8
         5OzzjFviNQvbxNlMtR3NzxUgA5VkA83SUjRty3+HlqXQjbQSdUg5BPEI1aJtkBnStKUT
         1FTqOUiNyEpUXk/Qb5PTw2jl/07o4U+hseWP+YtCwMggdVUXmsx2C8zIYhUDiDwTH/X5
         X6YA==
X-Gm-Message-State: AOJu0YzRQGKDoZ8Ea6hD90AYWz9KtJ7if+rL4XGTAQCjsFVhsg9Do1b9
	MHixyAhHDvXnlWKoF6KFBS1aX6a0qYPP98Qbw+df8ZivO3OyYjP5nDJy
X-Gm-Gg: Acq92OGlNvXka2TaG2RRUM5vOChY99SlF6wdW9SHbRSuqzs4jkftrN3xBv8u5kzKmwt
	JvTgeuOcs16G2sYhWBpfJrXRha16nzQb7y4Gy/VGxL/klw5gKIy2q8fgI3c5tToON069PdklzfS
	65l4J2YOi1AoTwMB1B1vMUnBOzsJwgY5qp3RM5daMzTS+2V0qxHAYhMiuiR1Lvuj44yB0iaUAIm
	NI3Kobj2KnugvjySZ8TZ97FJULHDHmeDfz9lUhkh/hbZ/DfiymqTqmpY3S49yzypl/vezpRuFFE
	ZlEvRVJhicIvFT9/zEH7+Srv0ye5hZ03EQCmSMGUl12N5/Wxznb/oihlMZvb/PUzBpAga9YOwRd
	B3A/uoloSVG/j00FTWadtzllqJjwjyZUrUv18cJWYzT5Y7ZtJ9/eDyO3p/uJWUPUmopHvQORFBL
	byWxKHXE7sHz8BfkwEUqV662U/XUztPg3SefdF6s1PgOvR9S6XdEn0OHxwpqaoectcLWEvupIkv
	GhxGL9vwiTE
X-Received: by 2002:a05:693c:65d9:b0:307:91f5:8eee with SMTP id 5a478bee46e88-30791f5af59mr3853798eec.12.1780925999720;
        Mon, 08 Jun 2026 06:39:59 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm23893449eec.5.2026.06.08.06.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:39:59 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 08 Jun 2026 10:39:13 -0300
Subject: [PATCH 3/3] ASoC: bcm: cygnus: use scoped child node loop
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260608-asoc-of-node-scoped-cleanup-v1-3-9e3ac518dc2e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1564;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=vyC7w6pskJBgaLu4nRRhMfqupYy0eXGTyLVkdxR3pJI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlqxyRKLkZwS7AE2Tf2p92fUXVnr8gKwS6tnBXNy1btW
 jiJT2laRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzkchYjw/9Qn6uF35RTdtpk
 X+d4MWXhlgeaC3X+Lbn4/qig9NQvKk4M/+tcorM3x6i7Oc46NWO+9mLXuXL6M27kyvu1n9gTu1u
 MnRUA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

cygnus_ssp_probe() manually puts the current child node before returning
from the child parsing loop on error.

Use for_each_available_child_of_node_scoped() so the current child node is
released automatically on early return and normal loop exit.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/bcm/cygnus-ssp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index e0ce0232eb1e..47706ae0a31f 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -1298,7 +1298,6 @@ static int audio_clk_init(struct platform_device *pdev,
 static int cygnus_ssp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *child_node;
 	struct cygnus_audio *cygaud;
 	int err;
 	int node_count;
@@ -1331,16 +1330,15 @@ static int cygnus_ssp_probe(struct platform_device *pdev)
 
 	active_port_count = 0;
 
-	for_each_available_child_of_node(pdev->dev.of_node, child_node) {
+	for_each_available_child_of_node_scoped(pdev->dev.of_node, child_node) {
 		err = parse_ssp_child_node(pdev, child_node, cygaud,
 					&cygnus_ssp_dai[active_port_count]);
 
 		/* negative is err, 0 is active and good, 1 is disabled */
-		if (err < 0) {
-			of_node_put(child_node);
+		if (err < 0)
 			return err;
-		}
-		else if (!err) {
+
+		if (!err) {
 			dev_dbg(dev, "Activating DAI: %s\n",
 				cygnus_ssp_dai[active_port_count].name);
 			active_port_count++;

-- 
2.54.0

