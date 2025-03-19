Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B51B25334B
	for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742375876; cv=none; b=gd+CJurk/jlBjXO/rS6lwI0668hVrqxxaVRqlRZ6gC9keGLRt9fHhDd6GjzHMNv7AVWqf7HczKTQteqvY7tf68F0OBXiKgTDi9iRM2CnGhCuvt4FBSQccHkXKPND24R06ZnSoalgcbDdPeXRPFN1aCi2kmqT6fhY9hoQT6e+61g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742375876; c=relaxed/simple;
	bh=ULRWIRzW3ClVMbPCwKcuXk3yCqOKBA/uzUXVWNbco5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iKLqlshMdsnZhg8ISYFVoipe4Rfm80Nm9uyKWNb2gtulrqMDZ2CDjBwLTNNjI7WeotWpYtRKgAzoL2SGJp7DaY5Z49mDnkpxs9pYiT2UA49t4yoTco0lhhyC2w82k0fUMlwvBhE4odOQs16pr6jdQScdR6WVONl11ANVUqeETHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v0GRtoYq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v0GRtoYq"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso38668565e9.1
        for <linux-sound@vger.kernel.org>; Wed, 19 Mar 2025 02:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742375872; x=1742980672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ySdR3tj80pBDLvsU4QQMajiIPqzNIK+BJx1XMf8UJs=;
        b=v0GRtoYqQoO0WTUTIXqtbK/IeO4I9Wco8GvnRvjcB4nxyblIwdeAbaguhXo/Z+Lcv+
         p4dnXhZM8Ai5AZtPmOEzVMDSCEaK5uVvQMhtr+bWd5AqFgyf3PbhrxB73ufXBk1qiLKL
         roeEsLl7hlgtKM7ltpWdophjkSshDavruRqDif7dGE4ITQAKNBmSM7MkGvKOnwOY+amj
         qqmNgNIK6b0Ub82dz+8GghTxHeItl+xfLmpAwRVVTD66dkBjnJTvq+DaWAkWwX9XRdDg
         4DjeueOtZmW3RmAt/HjOBU+kYNmJPUnTLr9x2cYzErnXBwRDDIGiow2XIHsUPhbpjWGp
         lRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742375872; x=1742980672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ySdR3tj80pBDLvsU4QQMajiIPqzNIK+BJx1XMf8UJs=;
        b=ib886vk3JABBDF1kdTmtkncixX5jeNQ1jjq4GEQwWQAfDVTdwp84tUw5M/ds7NK4LU
         4ryAf+7tNk8rvV7BcNu5uZC/2zC9sGQ+9Pl6MbRw/T3WCP/iSvEVrQn/QEFnB89NOvo7
         vFkV2Sp91gjrbbbB7/tljjWe8p4oX3G7MmPgaFPaR+sKTfbUwGQFeT0DgeMzYx4KGUqu
         aEqgNUqDAu8/5903r72A4FLwNPcQmjHt43vM+yK0lka56go3AS1SRy4KJXdx3umXeCK4
         l4PAnl2QSJfK0oDubFYCqa4zAnZM99GS/xg0KkjMgsixCS2rGsqUULzb/e9v4PWR691/
         dUhg==
X-Forwarded-Encrypted: i=1; AJvYcCW68xrSQcM5fnu7/cz86TgAng1mmELfU9u+G13kx2YGFz0riC8Swnbr43s2WmVQG4HLbN8C+iLGg/Pwmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yznzg6Eh3ermneQiwM3aWNQPbkKaTz+G2FwXeBJALJeYj1JkUZ+
	Xbl2UL1f7NHbuwyV830x9dLveiBGqTNrD+8cWkVHi3uYEwC/SFEo4QSDgZCXg9M=
X-Gm-Gg: ASbGnctVpA1BT2SExS+ue1pnkLZBZAabARzzk7iT0TM1avLqDlCgs/6T4YhasoXoKSD
	lyAYi2Y7KJkxHtSUVdq/Y74WrNE2+QhxGaH8mI+ylFnwvfVTdIhmOuNa3eryM2713obTHAiec1W
	6A565Mgg66RIE+yYXyfTYonoRJp3Js8Nbyzqy2mgFgJM4mMXzI4o3w8s+vmmjBxQ9/MbJ3B1J7k
	yLWs976QgGiCoH4jZjKK6X7QLEJMDZ8AmDjuK0/6NEpcqgSMplNQ1wO4i3KBnD6bH8jMiuNKuSo
	d+lI7QQfv08GI5CQy2iRBVvdvlTm8IIpft0bFctSf0oWkukZ0yrCIzHySFOTnzlDcsudtxX0CNy
	piAz6
X-Google-Smtp-Source: AGHT+IFGBgrP9XrQ3f2uafyicjPKMzKkkhYZU6En9bbVWfY5B2AqCcmoR4UU0JrQIUMOQW0ppC9i4g==
X-Received: by 2002:a5d:5f91:0:b0:390:ee34:228b with SMTP id ffacd0b85a97d-399739cbbd6mr1493601f8f.24.1742375872457;
        Wed, 19 Mar 2025 02:17:52 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c255bsm20023810f8f.23.2025.03.19.02.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:17:51 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org,
	andersson@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/3] ASoC: codecs: wcd938x: add support power on hp audio switch
Date: Wed, 19 Mar 2025 09:16:36 +0000
Message-Id: <20250319091637.4505-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
References: <20250319091637.4505-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi Switch is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable. Enable this regulator if
platform is setup with regulator.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index f2a4f3262bdb..a00845089e13 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3267,6 +3267,13 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 		return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
 				     "us-euro swap Control GPIO not found\n");
 
+	ret = devm_regulator_get_enable_optional(dev, "vdd-hp-switch");
+	if (ret && ret != -ENODEV) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Couldn't retrieve/enable audio switch supply\n");
+		return ret;
+	}
+
 	cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
 
 	wcd938x->supplies[0].supply = "vdd-rxtx";
-- 
2.39.5

