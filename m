Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776739;
	b=kfv5W3Wdi/1ReNg8zQpJeKwaLuBw6ajtJ52KeXp8dPrzrSwxmlNAiPhqrAoHPbhwtW4u
	 Xkt2rbtnS5rWCBHQ1qiGxMRneEAg2IWSIc7z99TEjEJA9DK1aIJYr7SqdZvyOYdgMSmZA
	 fWhixjf+edrzYUY8gFuSkcnWNV6cr1rywc1KsyuFm6oTEt27SBWLKrOTSa4yaeR8iWbPD
	 1eYtqokfBkg41OoAp6js7LFqyWX3kBZ+YA+xnU0IzzFHuFk1WiPrmRT2zXR4HWtCIzQqL
	 5dTqdDRTpwAQR5hDGrIlvLpawoPweU4u7+G+XdYrMinwfKDtTwfXhytQyWEUG6CpXHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=HGSOaAz+44Wh/SqIDKWUDm4wYs2aLD85zRQZSl074kU=;
	b=KeGw0XM7XUiC00tvDpcJBO3qEB3/WAtBvCuck1ok2og1BFqFX7l4VsDwliq6WQVBE3zC
	 W3HYjbcrLmd1J++q+R9uznWJnhQATSq9mI1GrKzdw/rFt/80NN19ZdFoHOsbGmK4QZMgp
	 G1poVrpKNbuFoWNOr+ru2nvkzEMlc6Vte1HLnC9xkMgX85JW1I3aNf2XliWV6dCtPx7yz
	 HAGpJmGVzU+/pkw6bOOad6QHdZththadYsQeZVoR2Z2jxygAqPm6g2WTpRXB4DH8SJUFm
	 xHAnOfInQS551v5dbC/hfPNdNHxortYfcsqZTSnr7n7/P8ABk5kvTgeU9jGJP8fHtzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VuC2JSsD;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F1A606A335
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 17:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27F1A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VuC2JSsD
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so6171075e9.3
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 10:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776737; x=1793381537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGSOaAz+44Wh/SqIDKWUDm4wYs2aLD85zRQZSl074kU=;
        b=VuC2JSsD/jDmIHJ21T3hUcmM8cbSpaEBO3LxxuAnaET9z1oXlWFd52EyJy5rQv/KJb
         IrnE5Wm+yWQljI1wDwO5q+8OpSsojUR+Be+YQMDcxrH/smQN/BGFnw3zz97glzCmo40P
         arZsrvJUFHjSmOp25gU3U2XDU92kW0lHG2kM4454+tnXoKuM5m3AkSXDr5VesnopRf29
         T/leHPFSI/H7dihSezImKHKMdDUVT4vIpjWL2zpIgrrojRFtqE3O2Tcz1fqdI8v2PfxQ
         v9A8jPSFbnict0JEzBOSoUpX30xpn+6m0Jb7JHbRZwsOVNjqTpXtMwpOT3ZZVkrtgiQB
         z57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776737; x=1793381537;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGSOaAz+44Wh/SqIDKWUDm4wYs2aLD85zRQZSl074kU=;
        b=dU7bPO52FFtI4v7Vo3am/yOZRh6/HLZr/oCwxJ6dpGsI1SvMVqitDNJ6LOArIqtJzM
         O3Q2dQVBPioCw83ktmlhOxiZEjoUc0nyq5PQonxa95tlg5rU1bDfMkJBEOv2OaOyYmXs
         nT4rLBTN1c6UkR6imIHdxFn7qEwdSuaJ884DhjUjekw1/RG7S2pNIxrIxwQNgSAZIPDC
         EKU3tLG9OXP95zLsGPh3S7HZWT7Rtgwq8wX0tMMOgdIxqFekJR4Rb1+S9JJ+8mjm8r06
         AWiVLS6COc2wLSjJGklDMliGfSo9I9n0ssCPl3LIN2+vY5ZS+qTdwxtobwC72ozfPD/y
         nfvQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUUu3Lf7ITY/PR+brq9cuRVdYB9ZyRNa/eyN1YUFvTkikLzWOc5DiRequUlH2RNiESOMOr8P1EclF9Ng==@vger.kernel.org
X-Gm-Message-State: AFq9FYIs5CxagZQE8Kxv5Uo1TjqatCeN5OOpBU5mk1RbpJMiSuVWfgzk
	leiZAGtILwHRCFjEOVaqVXz9+OxHixBN8FLsC1/hc/JjAycSRCXZ6ONs
X-Gm-Gg: AYBFou2PMt2Nn2F7R0J15OdEeCYaRhEiCyWx0dVqUAsnd7vi6vBXB3RqaAXTwTDEq1y
	to1ZmAeke9YJ8pLQ9jS9Sbxjco1+OL8MatmK7UaBHEh2YlR7xvNQLYA+DoRZz9c5z44oF5hXqCQ
	IJS2rE0NkKQ4/hFIGNPl+9yx8G2DMSP5NfKO6jyQxZA+WGQctPg1UpYvCqJR/QDkgecAm6rGfBN
	UhnQ2qDUxwB/xSVjY37xaEsxJHq/kN1UpdJjYo6LL7Q0R14P8AT6m1xr/usu/VIuMNkHc6JYUS5
	I/ASW/97O6aEuvW709WKyID48jU3eIEeOI9Zq6v7pX3B8a97CjmWS+lZTpWqtjFLo6UrxoOpMqw
	1KWkvg9G6SO7xQQf35b+Q9JP42nMNQGBPwG6R7r8U2AfDVFTx3H5OIFtO0VkN8r4GKNmE3jTeoq
	U26+G4sSjY0z2yNcjmdm3oN51VRO5vX8x6AVmpfNA95dmWdxeVh4GpfQSOVt+7IK+Bz6GBRiYWo
	06BBE8qeoe1s3gykdUXHG6GuPXttd61HfubKuGPkl9oJ/KM+oleqVz88NtxOr6SezJ0P0p9lH9k
	BuOXu0+e2QuEx2fQ7WMzJB7iGrZbahZ0kwzLrI/d37PFjG6v0o6XkqLrlmtYN0Ipzz7e
X-Received: by 2002:a05:600c:1d1c:b0:4a2:191f:7ca6 with SMTP id 5b1f17b1804b1-4a2191f7d70mr26099425e9.16.1792776737380;
        Fri, 23 Oct 2026 10:32:17 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2b0637460sm18913995e9.8.2026.10.23.10.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:32:17 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
Subject: [PATCH] ASoC: codecs: lpass-macro: release macro and dcodec clocks in runtime suspend
Date: Fri, 23 Oct 2026 17:32:16 +0000
Message-ID: <20261023173216.6245-1-ramonjesusmiranda@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LPASS rx, tx, wsa, and va macro codec drivers prepare and enable their
"macro" and "dcodec" clocks (which correspond to q6prm LPASS_HW_MACRO and
LPASS_HW_DCODEC clock votes to the ADSP) in probe() and only release them
in remove(). Their runtime PM callbacks only toggle mclk, npl, and fsgen.

On Qualcomm X1E80100 systems where the ADSP is booted by Linux (such as
running at EL2 on the Microsoft Surface Pro 11), keeping the LPASS_HW_MACRO
and LPASS_HW_DCODEC votes active while audio is idle prevents the ADSP from
entering low-power sleep during s2idle, which in turn blocks the SoC from
reaching CX collapse (CXSD) and AOSS sleep (AOSD) (both counters remain at
0). Also, calling clk_disable_unprepare() unconditionally in remove() on
clocks already disabled by runtime_suspend() causes clock enable count
underflows if the driver is unloaded while runtime-suspended.

Disable "dcodec" and "macro" in runtime_suspend(), re-enable them in
runtime_resume(), and guard the clock teardown in remove() with
!pm_runtime_status_suspended(). With this change, ADSP, CXSD, and AOSD
reach >99.9% residency during s2idle (~0.20 W system sleep power on a
Microsoft Surface Pro 11 OLED).

Assisted-by: Claude:claude-opus-5-5
Assisted-by: Antigravity:gemini-2.5-pro
Signed-off-by: Ramón Jesús Miranda <ramonjesusmiranda@gmail.com>
---
 sound/soc/codecs/lpass-rx-macro.c  | 28 +++++++++++++++++++-----
 sound/soc/codecs/lpass-tx-macro.c  | 28 +++++++++++++++++++-----
 sound/soc/codecs/lpass-va-macro.c  | 35 +++++++++++++++++++++++-------
 sound/soc/codecs/lpass-wsa-macro.c | 28 +++++++++++++++++++-----
 4 files changed, 93 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 6233aa9..9afebf6 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3935,11 +3935,13 @@ static void rx_macro_remove(struct platform_device *pdev)
 {
 	struct rx_macro *rx = dev_get_drvdata(&pdev->dev);
 
-	clk_disable_unprepare(rx->mclk);
-	clk_disable_unprepare(rx->npl);
-	clk_disable_unprepare(rx->fsgen);
-	clk_disable_unprepare(rx->macro);
-	clk_disable_unprepare(rx->dcodec);
+	if (!pm_runtime_status_suspended(&pdev->dev)) {
+		clk_disable_unprepare(rx->mclk);
+		clk_disable_unprepare(rx->npl);
+		clk_disable_unprepare(rx->fsgen);
+		clk_disable_unprepare(rx->macro);
+		clk_disable_unprepare(rx->dcodec);
+	}
 }
 
 static const struct of_device_id rx_macro_dt_match[] = {
@@ -3976,6 +3978,8 @@ static int rx_macro_runtime_suspend(struct device *dev)
 	clk_disable_unprepare(rx->fsgen);
 	clk_disable_unprepare(rx->npl);
 	clk_disable_unprepare(rx->mclk);
+	clk_disable_unprepare(rx->dcodec);
+	clk_disable_unprepare(rx->macro);
 
 	return 0;
 }
@@ -3985,10 +3989,18 @@ static int rx_macro_runtime_resume(struct device *dev)
 	struct rx_macro *rx = dev_get_drvdata(dev);
 	int ret;
 
+	ret = clk_prepare_enable(rx->macro);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(rx->dcodec);
+	if (ret)
+		goto err_dcodec;
+
 	ret = clk_prepare_enable(rx->mclk);
 	if (ret) {
 		dev_err(dev, "unable to prepare mclk\n");
-		return ret;
+		goto err_mclk;
 	}
 
 	ret = clk_prepare_enable(rx->npl);
@@ -4010,6 +4022,10 @@ err_fsgen:
 	clk_disable_unprepare(rx->npl);
 err_npl:
 	clk_disable_unprepare(rx->mclk);
+err_mclk:
+	clk_disable_unprepare(rx->dcodec);
+err_dcodec:
+	clk_disable_unprepare(rx->macro);
 
 	return ret;
 }
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 0cbf506..fc4630c 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2390,11 +2390,13 @@ static void tx_macro_remove(struct platform_device *pdev)
 {
 	struct tx_macro *tx = dev_get_drvdata(&pdev->dev);
 
-	clk_disable_unprepare(tx->macro);
-	clk_disable_unprepare(tx->dcodec);
-	clk_disable_unprepare(tx->mclk);
-	clk_disable_unprepare(tx->npl);
-	clk_disable_unprepare(tx->fsgen);
+	if (!pm_runtime_status_suspended(&pdev->dev)) {
+		clk_disable_unprepare(tx->macro);
+		clk_disable_unprepare(tx->dcodec);
+		clk_disable_unprepare(tx->mclk);
+		clk_disable_unprepare(tx->npl);
+		clk_disable_unprepare(tx->fsgen);
+	}
 
 	lpass_macro_pds_exit(tx->pds);
 }
@@ -2409,6 +2411,8 @@ static int tx_macro_runtime_suspend(struct device *dev)
 	clk_disable_unprepare(tx->fsgen);
 	clk_disable_unprepare(tx->npl);
 	clk_disable_unprepare(tx->mclk);
+	clk_disable_unprepare(tx->dcodec);
+	clk_disable_unprepare(tx->macro);
 
 	return 0;
 }
@@ -2418,10 +2422,18 @@ static int tx_macro_runtime_resume(struct device *dev)
 	struct tx_macro *tx = dev_get_drvdata(dev);
 	int ret;
 
+	ret = clk_prepare_enable(tx->macro);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(tx->dcodec);
+	if (ret)
+		goto err_dcodec;
+
 	ret = clk_prepare_enable(tx->mclk);
 	if (ret) {
 		dev_err(dev, "unable to prepare mclk\n");
-		return ret;
+		goto err_mclk;
 	}
 
 	ret = clk_prepare_enable(tx->npl);
@@ -2444,6 +2456,10 @@ err_fsgen:
 	clk_disable_unprepare(tx->npl);
 err_npl:
 	clk_disable_unprepare(tx->mclk);
+err_mclk:
+	clk_disable_unprepare(tx->dcodec);
+err_dcodec:
+	clk_disable_unprepare(tx->macro);
 
 	return ret;
 }
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 58a5798..16f0d44 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1703,12 +1703,14 @@ static void va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
-	if (va->has_npl_clk)
-		clk_disable_unprepare(va->npl);
+	if (!pm_runtime_status_suspended(&pdev->dev)) {
+		if (va->has_npl_clk)
+			clk_disable_unprepare(va->npl);
 
-	clk_disable_unprepare(va->mclk);
-	clk_disable_unprepare(va->dcodec);
-	clk_disable_unprepare(va->macro);
+		clk_disable_unprepare(va->mclk);
+		clk_disable_unprepare(va->dcodec);
+		clk_disable_unprepare(va->macro);
+	}
 
 	lpass_macro_pds_exit(va->pds);
 }
@@ -1725,6 +1727,8 @@ static int va_macro_runtime_suspend(struct device *dev)
 
 	clk_disable_unprepare(va->mclk);
 
+	clk_disable_unprepare(va->dcodec);
+	clk_disable_unprepare(va->macro);
 	return 0;
 }
 
@@ -1733,18 +1737,25 @@ static int va_macro_runtime_resume(struct device *dev)
 	struct va_macro *va = dev_get_drvdata(dev);
 	int ret;
 
+	ret = clk_prepare_enable(va->macro);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(va->dcodec);
+	if (ret)
+		goto err_dcodec;
+
 	ret = clk_prepare_enable(va->mclk);
 	if (ret) {
 		dev_err(va->dev, "unable to prepare mclk\n");
-		return ret;
+		goto err_mclk;
 	}
 
 	if (va->has_npl_clk) {
 		ret = clk_prepare_enable(va->npl);
 		if (ret) {
-			clk_disable_unprepare(va->mclk);
 			dev_err(va->dev, "unable to prepare npl\n");
-			return ret;
+			goto err_npl;
 		}
 	}
 
@@ -1752,6 +1763,14 @@ static int va_macro_runtime_resume(struct device *dev)
 	regcache_sync(va->regmap);
 
 	return 0;
+err_npl:
+	clk_disable_unprepare(va->mclk);
+err_mclk:
+	clk_disable_unprepare(va->dcodec);
+err_dcodec:
+	clk_disable_unprepare(va->macro);
+
+	return ret;
 }
 
 
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index af521e0..7579eab 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2842,11 +2842,13 @@ static void wsa_macro_remove(struct platform_device *pdev)
 {
 	struct wsa_macro *wsa = dev_get_drvdata(&pdev->dev);
 
-	clk_disable_unprepare(wsa->macro);
-	clk_disable_unprepare(wsa->dcodec);
-	clk_disable_unprepare(wsa->mclk);
-	clk_disable_unprepare(wsa->npl);
-	clk_disable_unprepare(wsa->fsgen);
+	if (!pm_runtime_status_suspended(&pdev->dev)) {
+		clk_disable_unprepare(wsa->macro);
+		clk_disable_unprepare(wsa->dcodec);
+		clk_disable_unprepare(wsa->mclk);
+		clk_disable_unprepare(wsa->npl);
+		clk_disable_unprepare(wsa->fsgen);
+	}
 }
 
 static int wsa_macro_runtime_suspend(struct device *dev)
@@ -2860,6 +2862,8 @@ static int wsa_macro_runtime_suspend(struct device *dev)
 	clk_disable_unprepare(wsa->npl);
 	clk_disable_unprepare(wsa->mclk);
 
+	clk_disable_unprepare(wsa->dcodec);
+	clk_disable_unprepare(wsa->macro);
 	return 0;
 }
 
@@ -2868,10 +2872,18 @@ static int wsa_macro_runtime_resume(struct device *dev)
 	struct wsa_macro *wsa = dev_get_drvdata(dev);
 	int ret;
 
+	ret = clk_prepare_enable(wsa->macro);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(wsa->dcodec);
+	if (ret)
+		goto err_dcodec;
+
 	ret = clk_prepare_enable(wsa->mclk);
 	if (ret) {
 		dev_err(dev, "unable to prepare mclk\n");
-		return ret;
+		goto err_mclk;
 	}
 
 	ret = clk_prepare_enable(wsa->npl);
@@ -2894,6 +2906,10 @@ err_fsgen:
 	clk_disable_unprepare(wsa->npl);
 err_npl:
 	clk_disable_unprepare(wsa->mclk);
+err_mclk:
+	clk_disable_unprepare(wsa->dcodec);
+err_dcodec:
+	clk_disable_unprepare(wsa->macro);
 
 	return ret;
 }
-- 
2.56.0

