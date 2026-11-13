Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546491;
	b=B6/ddlQKAPhyLhspjJoiG4Gj5Lbon80pxPEylUH/hoCdNUdBwcDTfivVqFSUS5M2FYG7
	 q2kJmPzAfMNpd2GWYrHyhbYY2uj2w9h7/Ua1ydofQrMa52lLEbUCta4vqO3raEu2l32Nc
	 FMPRR8yZhUbf09RePGbd9zbZzWqAI/tfF/3Yf2xyDIIX8+iYHbkROhQafYK+xyJHnIiIz
	 D6ajQ0jNg6NKWj5NbTbgJrl8VtcFm9ASzUA/nvxRwonANa3qN0K6ZkivKPbF/RxFYjNSJ
	 M4lN4G7Kf7/6u97jvYPGPTY1rNnd5fc8L/fIP4RKOoz4LQf661njT0PVr7LOnC9oGIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ADGcsJLWHH299RpecEFnjkTKrpHnNUktG/Mb17Rashk=;
	b=Xt4vRMD/bI4pkhf6cKRjJ0+fNC9HODYnrK+TZyPbMQN30qH0PEa30EugUclyNmW9tJT3
	 Xu6LrrITbUxF5aoZtkGoVRv/B+Y2x8tobwjbhERJovNnGc2fGOThnWJhPHokD4tczeuOo
	 N5cXrhgifF1w6B+p04TAqSroPGZWfIDJpPtpkxv3cE7y10ilX8j3vna8eL1/G5/amIf/v
	 eZ57OSCbs8WGXeqqNHhOE5nxDV5Jzr6dhHCJiDHDomBDAuLMCF5ruBPVvcB9PEPGuqVkZ
	 7oMQr648/X34/iCdNCctuakpHKDJ0yJEbUtH039UMI/Pgmka4OGnvWOkMrDjPwmRyRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yUg7n6xS;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78986606A31C
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 05:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78986606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yUg7n6xS
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so442378a91.0
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 21:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546490; x=1795151290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADGcsJLWHH299RpecEFnjkTKrpHnNUktG/Mb17Rashk=;
        b=yUg7n6xS6b5wr/7ImkqnG+YvinFqaLzxnVYRWY/iAcX9sO8IPGN5f8xkGEbuEdvcfE
         l8mZGzVXWy0HyDBQMXQSMovVB/Hb/WIiNZTQqn1CmWeGwwziPtXs4CaquD+yPQokF//c
         3PHcJScWVMhqLHL6L/EVruxlF1t1IkqPYcORGxgsg/kS8i7pAoJEVIEL0fUfvbHkAc02
         4QinmxWWvxe6T4sYQkKf4WrXjrBnrsCpS08UGvWH5dDpNBFQQONVO6klkt+BKMumHQgm
         504pDAniLq5XE+Q7pYBEcIJB8MWdq3zfWF024xsOvNycp+L9H6Aui+Cu1OaTBNWim1Fd
         r+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546490; x=1795151290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ADGcsJLWHH299RpecEFnjkTKrpHnNUktG/Mb17Rashk=;
        b=Y2TkhnlGjqWY6cLQPclWqkBZjClwJxlhYZFGYjgEcSWnHaEEdpgA8eN9+nnIHw0EqI
         IpvatMGskbfWxw/2n0B7mw6n53c6mYjDgxrnF4kKZ8R5YHvvTX6vhXSH9jjHmV9VvB20
         TQ1H35bgK847MEgjBWIGegwsCj4X2ZbQ26otY3uKdgzS6rposIIi/zpPIFagd7sYXGc2
         UTOG0g+uqEnqPPyUES8/ppKju5ZLlOkSRNnadzTk+p0OAv9C+YAMhz3JJm7qdek3zeOK
         WnAO0gQHSpnqZOTlzKf9xhw3mt47d2L3XAyVQW0nl04wOK4AVCqQ9KjZGGVQpctwHThs
         +WkA==
X-Forwarded-Encrypted: i=1; AL+hErHCK4eXxfbZbxHrwwGy5J4s9FXO5hp0fzE4HMpP9V23uBVj9Kgg6mWUVtvRqPUht2ODOtMjXBD6NJHZSA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vu6wVunM25Qlq+YWKBDYVq77/o4V5bD+Vx0LBkrc+IxQocoUd
	/wB3s9a0zPYx4wKdNrQxmty8BHa9kxn45MajOzvvcs/yXJgCHHXDVxOC5/50Ng==
X-Gm-Gg: AYBFou0NfuDFm5DrHPmtnGUfEl9smjfT9YkkqpZViIn/6Sybw2YCxkfB1qbsLUiNLVM
	xQoo4KFEk7pSIcjK5HPf/ghFOeRlPBxg68UQhGvFJdJecaMjaxgKKXpEnJHAV85VtPP0OnYU0QI
	ZehPyZSQH6sTEkuH4CdoestXRhHuzSnw9ObiCFx11F3bxukWgH0v4uUZqiHKpDs9GtQZ8A1NeLj
	AR02+o8Fs0+FAiG1NC/rkmkabnKLQmszJT6SXX0qkq21oEZO5Ag1UhYVo5Cde82QQ8lbMP+Yi/a
	qmshJlT1ZmRhmGVlIjafrU0dknR/O7SZAyVJQVGkdtT2Zlw49pLkRxt849WCkOoFpoZMwE2mrkh
	C9RLA+XnsA01qZG+I+cj3al1d0LN4AmWUW5CcGMdKu3cPQElnScbjZdNyxff1UsplRilxG0IvqM
	dJ6Cp1R5dA3Z1yfnS0YtL0cKLAhIxUJ3XzI9XOSeaYtDJdkomE3GvGHhmGrd1ELkK699fOdIsaE
	oW57TcqZpYGACn+40p1Y7maPVMWrPSnNoy4bPV8nEv3Qr5MNs85OTH/y0/Y80woXggrrML/2mXX
	XzLwfRIJdsrb6ZlRbNWYGXcofrgRI7kV5vWuLSc/rtRY+RUX7x4cGmo6dnH5KnwPyI2olAPiLP+
	C+NUZXq7Quz7WKJ+kCTmag7GKS95W2OghplooR/sZLzWD
X-Received: by 2002:a17:90b:5585:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b1b0a12f15mr1032070a91.24.1794546490576;
        Thu, 12 Nov 2026 21:08:10 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm7643420a91.16.2026.11.12.21.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:08:10 -0800 (PST)
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
Subject: [PATCH v2 3/6] ASoC: fsl_asrc: Fix runtime PM usage count on init failure
Date: Fri, 13 Nov 2026 12:07:24 +0700
Message-ID: <20261113050727.14053-4-phucduc.bui@gmail.com>
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

Balance the runtime PM usage count when fsl_asrc_init() fails
after pm_runtime_resume_and_get() succeeds.

Fixes: cab04ab5900f ("ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Change in v2:
 - Update the commit based on Sashiko's review.

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

