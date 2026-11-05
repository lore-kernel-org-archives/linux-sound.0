Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875407;
	b=h1KQejJ+tvY+eEFjKq2jaM7rRaO2tmBYU80R8BRct4OZXqCD9iTyd5NqPYjWEHvfu1jH
	 94bjMolXIgXounj5rRL6pGzUDTUYvwTSPWkUOGqz2wNgo2aWhJs9AK7vR5lPC1k5/CaHk
	 nuZFxYsD5z1zzr5SYSgGLPWgXypj8Hc3DiJ8z/nPz5kryx4sNovdi6VPLZ8aXexP+aIDI
	 QGNULjUPq9gW0H2B4Oq5z9R8oKDaqn3ifEgye6e8uXMvn9fXpHHl8s8I+PVqH8D5eo0Fj
	 PNqcZ92N9O3dyXWnrGL3prS5vofjegUVw4PatXG5+HCNNysbmHdKIk1rjpw4GbwF1rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ggzT8mm/DyquJidfZW7gt7MxdM7xQZcIv/Px9dQuRS4=;
	b=oI/F5FodT9UESQ2JD0OFeZXIsJVkyBRAZT1xxg2/HDEcwIu71X7bKIY5v7sU1Ely/w8r
	 EIVCnw0O0Ucq8DD20PIQMIT/ciQzUPNx9DQSBLdBzqPQJTdtFk2r7zjDIOxZGi32T8bER
	 vIGHQzkQTPzWSiME9b9LdMFNzUex+7f4tiqPROvPo6+KzNEHgABxClgFkBoUeaM3J/v2s
	 aW7EmU+4I2NW/GW1Ap09nt5S2LX5SOIAuqX8BPtc7n9SBb6gyuBZ6ZRHjWF8hbju7t4/5
	 mYQ3d3QaK0MXV9QxEf/EWV2yp847/yJ9dETlD4OMV3xclBhIjAc3SkiEpjwJGyd2jgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+Iu66ek;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01AD606D82D
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 10:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C01AD606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+Iu66ek
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so2403151c88.1
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 02:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875406; x=1794480206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggzT8mm/DyquJidfZW7gt7MxdM7xQZcIv/Px9dQuRS4=;
        b=C+Iu66ek3VinbT8/MPOhlRsbKMqQ3FAWq/TZ3wYPG/y0/SnDe/RSB7aM20rwagl5Vz
         n4KlcP2tFcJ2RehOI3On/jvgvISbdMDvBM0BFFt3nDa6CAJjIrPfKDtTS65G/ukRLZOd
         N3thR+4g9zWBB2Fy8pmQt8nFnb9AQpOfSefVfU4HLhpPQCl198hFdlgDTjGFfj6gRpQb
         3qpinC6FunicPqO+4fgIl2ZthVFxgkd3vM25zj1sgtaJN4FWJJyMXyP4bjA44BM5n+LF
         oDK+DtTiacBEQEvsOlEOK6V2vTX4shCQeCqi6OoidlDQg20yUjYx0M+K1fOMDuT27JnW
         ovPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875406; x=1794480206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ggzT8mm/DyquJidfZW7gt7MxdM7xQZcIv/Px9dQuRS4=;
        b=L6yyeE5PaEuJwlFvY1GqVd+pBopwnK6Y8AolGsF3WOupBtzMXoOsEGO+0GkOcGJSmy
         DuT9zxs2j+Kg237+wCmrxLHLmM2VQXxwljk/eVw4Gukda5h/wxzTGRKqBQ5pmrKJYAIO
         xddXUope3Qh1jNx5SwaC8mHP5N9QAkz5fEashceZ6ZMSdV0oW1H/nQYrguZMDiChZ0id
         3nI7MjTiwLhtyDA/MoWdrA+OGC4dhUzT3fXuqCnACCtGUpslAbafvDGRknWd2UpLsmbY
         u8gSAlU84emKlu/jLC28dSU82N4K8mYpVm0ubrjHh1bYiO5+gni+oTIAeC8mtxLzXOfr
         pc2g==
X-Forwarded-Encrypted: i=1; AKwUvBzZQDqI8BxXyKR9dwlVN4VR/MQ1GPf13vUdhe8CvOspLWN3HtMDqitKLH8PYyeMMIM199dDi6aYq+/rTg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Zn+044/ZoUUbB+5olOdwBnJfw2xXfjtzMLDfqNyJ9W26ErGuc
	pBQzglxOs4Zi34SGm/bQPtKpkmKLLYWwbIQh0OS2Wok9p5yRuMn7Qqye
X-Gm-Gg: AYBFou2+v8wiboAHvt9YWNMFRzmaBLFiRRu0F6EiFKj7vndDp7MWeipb30Dz3KZl5jU
	oAogcN7gUXFyGo14KLI4u+j7KkYZB2VRUmgZdETdVEcj6dXroArvXWtjIwQS9lZ81PxbOeS3xD0
	X0VK/q29avJeMjBBazWCcvwgO5hk7uT8WqilKgP3/zDbKy2UT3qeULBTkgkOZX1IfhjXlDfU9Hr
	h23tYhDxdFZ/5Ezj5UfVncdpGVRqEpjWLlA/BuQqg+8lRHaWiRh9P9i+6PMh2U81WmJ/i9/jE9/
	+zD11bit5wbi0RMrcAafslS48Az39X+xCWRYekvE/Kd7PYdleQOoGOL3PO8BdszyUqhF8gbsbRm
	puRGVZMHtvuLABFnM48S9Mnvh/Dnx8IL9/4492TETWCmw9KFvvcf0WCtZz/IcWs88GQtf+W+6Oq
	nTxq+F73SvTupc/B57C081GpYOD5g/n28NhRCVnPMDqTkWS9kD+97juSYtdEvco7het6ph6HIje
	BNXT9WCmUdzP9CjqpsmVrAxVkydDdzhMCMcoNnjle9rbUJfc/CpJ1ZimZRXq+/A9kiR1/p/QeBW
	nEu3auShs6G+zuKoYRHcPHPEKAUGC5G56bbIV2WmekPbcY2mZ70QaCWsautOFRANU1Rlh1ajMZC
	47rzjZeCg7/y0Era5/QU8KZLXPmFsoCQ2zzbrx0ON+Te5
X-Received: by 2002:a05:701b:2310:b0:1b2:4e79:bfb0 with SMTP id a92af1059eb24-1b24e79cc85mr3514890c88.23.1793875405837;
        Thu, 05 Nov 2026 02:43:25 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:25 -0800 (PST)
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
Subject: [PATCH v2 03/10] ASoC: fsl_sai: Remove redundant error messages
Date: Thu,  5 Nov 2026 17:42:30 +0700
Message-ID: <20261105104237.38542-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
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

The errors are either reported directly by these functions
or already reported deeper in the call chain, so additional
dev_err() and dev_warn() calls are unnecessary.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 44a34f48a0cf..5532fab80be0 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1615,10 +1615,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	/* read dataline mask for rx and tx*/
 	ret = fsl_sai_read_dlcfg(sai);
-	if (ret < 0) {
-		dev_err(dev, "failed to read dlcfg %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -1698,9 +1696,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (ret < 0)
 		dev_warn(dev, "Error reading SAI version: %d\n", ret);
 
-	ret = fsl_sai_reset_hw(dev);
-	if (ret < 0)
-		dev_warn(dev, "Failed to reset hardware: %d\n", ret);
+	fsl_sai_reset_hw(dev);
 
 	/* Select MCLK direction */
 	if (sai->mclk_direction_output &&
@@ -1715,10 +1711,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
 			       np->name, sai);
-	if (ret) {
-		dev_err(dev, "failed to claim irq %u\n", irq);
+	if (ret)
 		goto err_pm_get_sync;
-	}
 
 	if (of_device_is_compatible(np, "fsl,imx952-sai") &&
 	    !of_property_read_string(np, "fsl,sai-amix-mode", &str)) {
-- 
2.43.0

