Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546483;
	b=lLOelxjl3igRttdI+iqZsOlRp4S+7IF/47E5yWAk9ZiMOOHyZwEXMSkTAPv77tu+CeP+
	 ERcYhJ4ibrwzYeLRuxaHZ+jklQUN+/8WXeF3aTLCaDILaYmbf8IflGJUfGHfvm6BWVw9e
	 1D1VWyBCePtbRJEDQ9+JVyZI4JpBMUIbWJIiufRWfvO/N+1jjGtDBUNWkGYkz8SFcM304
	 9M5UDJ5HSsqLQQjZfpS9cusvbrpHgIuQyG9tpuURXHeUuleNxDV/a1RP2nJdNwshlBbs4
	 pg8qWPBYDE1Xe6/FAj9YxG4HbHnGvWyXUGTyyn4sCxaNXm0Vzw4JT+OWvcWAjtff4VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h+bOEewGQp4neyd9SSV/bwg/g3p32KtwElAVtEDUsaQ=;
	b=JHbJlKQOwSSEFAAgjzVRaYhLU/P2TvZKz9BumiaRWrHcazlE2n8UCzqOYkY5baT4krqv
	 Fje0e31B0Xe33h8zB6aZLQ1CO1vzCNDuuJU7ifVMwZq2q0i8cw3BQEcxuuz2kkLxKQb7c
	 aokk7FPsyDcz+sTZdsvwhcam2wxdkVD7zSuc0IH6EgL7//L7W9S0hdmpu1kbnvfoNfRiX
	 poDGuYmyMlFMEjT2AcR984So3YOv6tkF7LNcaJUJC1ebUqA+58fj3VRUg2Yz//d3jr4SX
	 MU1TTXxYJ3FtzOm0ejK5eycarhbSnMjV6Jbw9CN4EwA91vZQqUD5c0Tme13PXL0/Jow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vsE+DKDJ;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E211606A32E
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 05:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E211606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vsE+DKDJ
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so756678a91.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 21:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546482; x=1795151282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+bOEewGQp4neyd9SSV/bwg/g3p32KtwElAVtEDUsaQ=;
        b=vsE+DKDJ4uXACsfIe0fiHuspI6GznnUwDDACNkexcKA4lMdYsQWE4wKeNMU5BB8eht
         Kk3Wqh/AV3akujMshNo1lZYjjqdIAdGKsBZ2MIFLc2GU0zVMis26LeD/px8s+Dv7DLsK
         6m7h14DnGzUH8Sizij3L9tb5xmj0nY7gMCgMT4205pR9tlLUdUiJWC3ga4rLe4+THhS/
         Sn0AbxBjsFB1IQe+VWt2f48Gmps7REYyUnK9uQ1mPlQFS/4JSQ+p+89w3y8Lg9vbbb7P
         SQkPl/rhPDNj9WOwN2KtZU3KON1tIw0Zn520BrrreZaokG5Emdq7NJFr83MeyYuH9ymH
         YqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546482; x=1795151282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h+bOEewGQp4neyd9SSV/bwg/g3p32KtwElAVtEDUsaQ=;
        b=vvApDDlXFqlyR7ordgNt7UWfG6GUMRpEgU+hxupHnJAHcaYnPnlD7JVawroo6vJDvr
         kbWDZ/nBzScIiwXP16476eXx1CGjuXU2WZriUGvRJmXO6RN7SwK9kafuKb4e4nzAuvY+
         HyEG7rxnl5/96IzdFndAEnNHM5OD5hUQ2qR2KKNDAuRr50nqVhR/R1R4hbxTE/a3r40l
         /vT55nvUBiJghkjogaJPFFU33xsOHECrYxI4GHhNjPArTsOwF6x3Lyu3n6nC3u2sH2oL
         39kCzdWcGgZoN4XgubUs2LSqiRGcERFWZWVYfIedbR1seTgnt4cFvh3oPVULYvI0iHCG
         SKpw==
X-Forwarded-Encrypted: i=1; AL+hErFSXhi0UBnXghDzaeghaIs+NPK9ulRYnMqhn2VsNHczFZmMTlgETxUNWXcxej4UqzlLy3nMmsQ076sGpg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9e8mkVoRvOUGGvh3CCysiDkOyY35TLMVsyRqE+5JKiY65QvtOo
	SqCJgB8yxhmJQsMhzk6fCeKVV1dWDbPZuIFolMmkMCwbtRNUDiDeWbem
X-Gm-Gg: AYBFou0EodRkJ0SDGXVa5wqc1s/X2WO4EOUG0hmLlrE3pnpSsaPJPg4hOXzVxqEQkmo
	wp9dyjVCLLlswORonSI0qLuXJRLYgAy/vbt2yeKB2LJoJ1zFi3fgr6+MrHgo+JB0gPYloxu84UW
	qJ+6Pw/J2NNcm/HiH58wcakf5ax9jE0sQTnPVK6hQUg0uWifPjAq594VCh0JQuR+myYkt+buA9R
	Knc73ZeEO2cJRs6s9N/cv8jH9SWxM/UnF1IfMNnh66qhVJhvu+iWqnC7qxpYBZzvuSe1DiYcohw
	iGU082a+f+d3Sqix1HjCwcRm+RGdJRDKyD8g7wNXCqltoog++dLrwlByE1ovxw4pjM6m2b+pvk9
	7gfM8Zph3Hd/2NpP8yAaA/C13t42NyMMei0gaU1EJXQo0I4dYa5T0oCGcXuXhxHVlyf9qV2lY+X
	2ZIF47jD2BMgX7AdW+gF3llyK9cBm5jjfjbrW3Tt/OArcHiOZmFzVQ/8p0ysCG1QoEMuNyOM6QH
	AZ28aM8hLj5/hJ60pl7wfOMi/hDrNDP+6CNkYJlhbgYjUHf3Tx3m6JB4HDx3Dkha7xXbeLndFJz
	DenMgGsuDOj6q9PGJy/x/5OyPNbZu0/KifLIm4ePbRGTNn0Qur/aQEEqoPLKYGRtkXmA9JFVijC
	gx6beU6yxPEThqkQL+dG3Z8HX2YnSXwjYtGqK4N99mYDG
X-Received: by 2002:a17:90b:1cce:b0:3b1:3598:f881 with SMTP id 98e67ed59e1d1-3b1b0a4adbfmr1144305a91.53.1794546482206;
        Thu, 12 Nov 2026 21:08:02 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm7643420a91.16.2026.11.12.21.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:08:01 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/6] ASoC: fsl_asrc: Improve probe error handling
Date: Fri, 13 Nov 2026 12:07:22 +0700
Message-ID: <20261113050727.14053-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113050727.14053-1-phucduc.bui@gmail.com>
References: <20261113050727.14053-1-phucduc.bui@gmail.com>
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

Use dev_err_probe() when retrieving clocks to avoid logging errors
for deferred probes. Also remove redundant error messages from
the probe function when failures are already reported deeper in
the call chain.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index faf348dd582d..055593d5d37b 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1301,22 +1301,18 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(&pdev->dev, irq, fsl_asrc_isr, 0,
 			       dev_name(&pdev->dev), asrc);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to claim irq %u: %d\n", irq, ret);
+	if (ret)
 		return ret;
-	}
 
 	asrc->mem_clk = devm_clk_get(&pdev->dev, "mem");
-	if (IS_ERR(asrc->mem_clk)) {
-		dev_err(&pdev->dev, "failed to get mem clock\n");
-		return PTR_ERR(asrc->mem_clk);
-	}
+	if (IS_ERR(asrc->mem_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(asrc->mem_clk),
+				     "failed to get mem clock\n");
 
 	asrc->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
-	if (IS_ERR(asrc->ipg_clk)) {
-		dev_err(&pdev->dev, "failed to get ipg clock\n");
-		return PTR_ERR(asrc->ipg_clk);
-	}
+	if (IS_ERR(asrc->ipg_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(asrc->ipg_clk),
+				     "failed to get ipg clock\n");
 
 	asrc->spba_clk = devm_clk_get(&pdev->dev, "spba");
 	if (IS_ERR(asrc->spba_clk))
@@ -1325,10 +1321,9 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++) {
 		sprintf(tmp, "asrck_%x", i);
 		asrc_priv->asrck_clk[i] = devm_clk_get(&pdev->dev, tmp);
-		if (IS_ERR(asrc_priv->asrck_clk[i])) {
-			dev_err(&pdev->dev, "failed to get %s clock\n", tmp);
-			return PTR_ERR(asrc_priv->asrck_clk[i]);
-		}
+		if (IS_ERR(asrc_priv->asrck_clk[i]))
+			return dev_err_probe(&pdev->dev, PTR_ERR(asrc_priv->asrck_clk[i]),
+					     "failed to get %s clock\n", tmp);
 	}
 
 	asrc_priv->soc = of_device_get_match_data(&pdev->dev);
@@ -1443,10 +1438,8 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
 					      fsl_asrc_dai, ARRAY_SIZE(fsl_asrc_dai));
-	if (ret) {
-		dev_err(&pdev->dev, "failed to register ASoC DAI\n");
+	if (ret)
 		goto err_pm_get_sync;
-	}
 
 	ret = fsl_asrc_m2m_init(asrc);
 	if (ret) {
-- 
2.43.0

