Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480706;
	b=wx1CLIZZaJhUCK/sRnWPTZuskXQHMTTh15dYaJX9RrdliuIKcWGX92JeBi+TlvfWyY7D
	 x7CWN0cVoEhIahZ1pNWy3ySvsdpI8m4oP3O8OifbvCWJFwW1Do+dcIZay3JzMXYsPJ1jk
	 lcqyQ4K3pgdrnOS9cDI72C78EcZFbgD+zNfriYK36w9FaHjexc9v8mW80F8Uqa5WtOkyE
	 zNAJSLxSkUZDejbSYW74e1NTTSfFQVDDIM5fovaonZ1kLppMrlsLflcNYW9WhqwXV7bcm
	 1ZaK3zjPitcxCmZnm7XRbVfHEjgkyJJl7fmvVa6fheX4LwUKibTbZPsGzdXrw7MnvpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IFm8ieWHHt9ZUMBFOECdKzOj7Y+GHKcLVGVXGiF6fko=;
	b=Z9aucvjKaWOC9WJ+nbUhyBmS9Wna3ys7UeqHr1vesapCcRIPJsTqxI9FSYoN0COde2Sk
	 tEcv7qzEdxQoWQARnOmncVWWHAkSJmSaBf/0LtvgrPi9tW3Oz+ryo72mx3InNsF3FkBkF
	 5f37p9VxOG1J1SlTwpoGEw2q/RnxahD/WCpnbgnGTluKlFrJGKflYs07U8BNPPebBfDk/
	 1tAkHH7590vIx8cWtK1ETiCaNYlmOYqO6Yf+/P4syBYQVU06iQ7Q/Gv3GX+uXAAX6jE6r
	 H9dWRvHLAR7hNoyUsvCQkffSJO6CI/CREB1e4rzS3pIbpU5GPh9ihuKce5kQPDGaXcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jYQ+h8Jc;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF669606A88E
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 10:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF669606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jYQ+h8Jc
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36dbde64409so8151864eec.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 02:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480705; x=1795085505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFm8ieWHHt9ZUMBFOECdKzOj7Y+GHKcLVGVXGiF6fko=;
        b=jYQ+h8JcSC1XAyPM/EBf5XfH/84/nqCXJwZfgTvHLR4jKvi7+NlTCAbw0BBW6FCgCr
         Idsg9Ww/J9t7yWvr+L+bua7vQ7FkG5GnkwVGTqDmV9MlPDnyK4VMnDReZr4J/pdZW/M4
         tcjR2GTaHRMLWsvOwHhYR7/plyd3udggvJZ7GT/WYu8gDraayQiZKTsnhU/FCwxLOnGb
         FXKJdzMovoDNqaDyrTLPtDligf5mVl5E1iphxx4EXzkSo3bQV/6t6ziWeZ0H2jtut8FE
         n4i5jPA9YYMzkMfmh8vneU1cxu5KN+nG9G7cyhRXNj6H4zSGrwiXoOj2p4w/WdYk/OSj
         W9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480705; x=1795085505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFm8ieWHHt9ZUMBFOECdKzOj7Y+GHKcLVGVXGiF6fko=;
        b=iPtBhc68ClK1WBGKSNQJuGsMbmvEF2iSN1/z3lQ/uGbEyG8M1+tWv9z8vZRHIeZJNB
         c/eV0D9+pFykKVcQ4/QeDulkb5u7sGFMa4nUN6PLrDIO1PktcrQTH3J5WdGG2CC/pWo9
         xcua6DpIEgjpGRYH3Glxz8D/Kv9QTYAQiXa8KsmYFf5saDEpFEyn7QhK1T6LP+2CmbGj
         uj/Iua00cbd7I0NGWNLZB0mDYH4rAueW2PqOVu6XUVrQ/Anbbjj592NKPpeT4g5zZBPM
         4HhFE/35xVoeWv/NuvO6MnNpodcwbjcdpYPWvIeE8LSkn++2W9/4S4oGOoEbq9UrZ0yw
         qZ/w==
X-Forwarded-Encrypted: i=1; AL+hErEhcZ7MGygEI9wADfhaHbfTjpgsVH1p91eEY+SmHGBUbArWPQYtVI//NwIQumlRVTUbUGeFPsKpTCc8Xg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8KbywkcaHdUaZiTXmFaogiZLZpZiCYwM7nw0U7yEkSFu9g0unK
	0FmVxFm8YyqdjCYcscUAz65VP+5XBWFuydHAYJ3Sj48YtF3tHmZgeZ1b
X-Gm-Gg: AYBFou1KUkxB6PDJsfvuVxrfZCDtRYkqRaiXGcNOGKEexkDE43lj8Fk0N/XGWB3eL6Z
	SIaMbFzBm8YL0LAVt5QzTqY0dpPwhaa9RBf0Gy4zwjVEWvCGPKf83XYWHFsfwTxfys5L17h1Zqb
	YbmFGh/ZHbBJ701Lhe3ocXRkibPTAYKm6nka3ZEWwITiVsctLEx0JBuOEkve+0AlIBhPVDLxQmS
	rxFMJ8HaRVAkn/8kRvWzWcwGwmvKGDoyLzDa7n8Q2LOGxLfbSsviVk01lWWqN8ZcVzQ3jiPyfQC
	iZMCwwZPJMveaifueBADKMOapmdAvoR4HwOdZ5B3mt7rWGsI0pORA8DsFAOmrBKckBIanZ1/snf
	DvdOIxs2lbXXNJEbC3R2djroPdKipP95Ei5cHJF8ekWC/2qn+H0L9nYnm7WN2xdC+m+Ssj6PkSH
	m4X3ktS/E9Y6ptbjsh0U0x0A5GpCVeshovN6rLi6RAELJ6EdqRcJZImMRRiAS5rmRidmIcGMvrx
	f9dL5K915k6i3V40/YJkHXcV73oCim9jRc0OexP0NVspKvE18eUXIQrpHlh/be5H38zrM+NoQ/T
	POUEKSuhs8UaIzibSBl1+tHV/nGMYa/NWv//mFfDtiCEX//piQX/qJrqUhVOOSkNefDY9/kOP3V
	vAw36HHUsejubVfCO0VKXxe3+5ADQJHigiF6gQHA5Qtb7
X-Received: by 2002:a05:693c:65c4:b0:36a:31b2:8643 with SMTP id 5a478bee46e88-37686c3b663mr5085905eec.38.1794480704809;
        Thu, 12 Nov 2026 02:51:44 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23047232eec.9.2026.11.12.02.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:51:44 -0800 (PST)
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
Subject: [PATCH 3/5] ASoC: fsl_asrc: Fix runtime PM usage count on init failure
Date: Thu, 12 Nov 2026 17:51:14 +0700
Message-ID: <20261112105116.32274-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112105116.32274-1-phucduc.bui@gmail.com>
References: <20261112105116.32274-1-phucduc.bui@gmail.com>
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

Balance the runtime PM usage count when fsl_asrc_init() fails
after pm_runtime_get_sync() succeeds.

Fixes: 286d658477a4 ("ASoC: fsl_asrc: register m2m platform device")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index c91ffb5e0c5e..f7ac60724c6c 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1432,6 +1432,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	ret = fsl_asrc_init(asrc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init asrc %d\n", ret);
+		pm_runtime_put_noidle(&pdev->dev);
 		goto err_pm_get_sync;
 	}
 
-- 
2.43.0

