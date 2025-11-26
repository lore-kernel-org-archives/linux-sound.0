Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA33306D54
	for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168754; cv=none; b=LM1RAqMjOq/qofngxtReZ8u0CtdqX6hIMAcL72ExXuWbUzNRTvDP7a5kU2t+hMtqjuYkxBP4afYhkqc9RRdk+AqXYAnQtBKLUZcc0Bjt9tnGNuFUrIltiqJxrRMq8dnydqY9BmySec0mY7Oy69H0kvYg1Uk1rN30Q+7qfa/LZDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168754; c=relaxed/simple;
	bh=3M73N2AariqTlY8yn8Twg3H8JvBd0HiNvIu4NGbZDbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MXwS4KmBx0xrBXMXF+pwZZR6VDaAnyKnWlzyivoYEGnmRFuiVBkFLT2GtahKphxqXLarVSXlGlG3VvKo2o9w/NpMysdi0cxfOiFMsg3B7Ae7A3cE/K7X2s/48evE10iFMPdoj2vstdi6/6M/LOeHXdzN3oh/Vp+us9AtnaJpx6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rXeB33O7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rXeB33O7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so56023895e9.1
        for <linux-sound@vger.kernel.org>; Wed, 26 Nov 2025 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764168751; x=1764773551; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tB73pe6/NtX8eM3PTQbggN9wppvlKOL9jZo7eXvreFA=;
        b=rXeB33O7p8a1snjBMv/8ycfYNykMWnUIaTrZfcG6uSoz7uELyoIRjaZkRrmfjna65L
         L5ZoqVCO2ZWhAfprji5Dwr7k1E1igZR1rT8eTIH2yQ+61jwu5XSx0hVSE7LM3WLjX6wd
         ODTGQDS3rJYRCZchoQSZb4NQFyHJ1T6l0+T3DkJIKOO0D+p/7P2kmaSIDJCNmbM7ejXO
         iG5QiP+jGmWXBNY9g+Xmqe9tzkmAY3df50HRMdHFiu6mZ7QvSHz99USFL4zZUvcmEt+5
         +SHcvUwDYY6EzSutb/2WCciXcTf3wk6Xd3FOimopKyw9pTSmoJRCGkXViR8QHIR0UpwI
         br5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764168751; x=1764773551;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tB73pe6/NtX8eM3PTQbggN9wppvlKOL9jZo7eXvreFA=;
        b=DBhdL7bo4BM8dRINhvoUIxYzKo5ibH8zydn1nqYu5Hw0alAWNROy8c34OI4XMa30Rs
         dJ4tXbixNdZ4KEAr37C6yzyDq4lwj32v4YY7GQP8UANEaD9QJ3vCQEVbSOPSKiPu3F+i
         M5lifpGZuzXhD1qRYR7Iup+5GUJE0EyOE/9tPkLyYZ61nnvblot5VYWArDZJR00T5m76
         cHr+WERszPJe6E3vXQKH0efDgfQtgHxGqurJKrPLbs4kkUvX86kDWIkSYkrtDbSDshB8
         fcyGOd8ADSTggfdbnb1wd/NNbmGh7Zj8I0uiRG9PhuLS90tX2kPySBvv/7sk0mlkWWvP
         HEoA==
X-Forwarded-Encrypted: i=1; AJvYcCUczVC+VXIcfaPp/MyXQVRAvSkqaqnq6dDr7zHcfKCo4KNxe6+rOVvMBrBj+Bls0sCVWfdDCt/oRZuS9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwql4y6/sZm74TO5lxzI6v5d71ogU88QDnbGa6oAMCKHMwoscc
	KlbpOsKmxdd9qL3H8uS6AofpiKR2Lwu6DNAYlZLy8Ksdu5k7wwKErrcqSFgVc8getHpqCXFuK+s
	up1BQ
X-Gm-Gg: ASbGnctCesIMMnjQtMPymO0I7zQnkxDyZRP7DUmsZ6hTCRlESL6JJ3ofWGeasOZ0Frh
	VIMdHOq1JWPLU8Mp2SaYd1o9BzWK0i/e4dZCiZFz+146s7izXR7RpDwALPVlt4NcXysKWiB51Gn
	uX3hZf+7x7u7cWF0Dqa8xlx/WeczsI4XTetcN1cDlbdFTeKxD0Ky0AzSzOSfHTowXlFGAgyvOWH
	pGkOgThGbyYwpOZqexBjKUJ8gxlyXq3X+tWynGecJct34AHe9v1d0fzgEFEonzK0hszQ2y5UBo+
	ipqlr37Y4e3GIO4MfIJGRzo0Zu7ISyFnKrzKAOZ//RFpy40z72j8ENbgRTBZCopEUgisoZuOnvP
	7Xzn2Xzv7TyBKWA++8N2zAWlWsC92cK1kB40TRbwtQylFDMNdEIn4WJBMTj66RPbrNOyTuFYz24
	wpLtAi+PGRcBh5vIM=
X-Google-Smtp-Source: AGHT+IGCLmd8tRJyaKxnoPAOY3teB1a8/mQwQE4e51HEL7L4ZyHqrgXF4lwoEPkRwuQbHk3YrwrBYw==
X-Received: by 2002:a05:600c:8b37:b0:477:9cc3:7971 with SMTP id 5b1f17b1804b1-47904b1ac02mr55156645e9.20.1764168751196;
        Wed, 26 Nov 2025 06:52:31 -0800 (PST)
Received: from localhost ([41.210.159.101])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7f2e454sm40974088f8f.2.2025.11.26.06.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 06:52:30 -0800 (PST)
Date: Wed, 26 Nov 2025 17:52:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cyril Chao <Cyril.Chao@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8189: remove unnecessary NULL check
Message-ID: <aScUKqCEhSIZoOmg@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that the call to snd_soc_component_get_drvdata(component)
will dereference "component" so this NULL check is too late.  The probe()
function will never be called with a NULL component pointer so just
delete the check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
index dcee8e11eca8..166ece74270e 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-pcm.c
@@ -2352,12 +2352,10 @@ static int mt8189_afe_component_probe(struct snd_soc_component *component)
 {
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
-	if (component) {
-		/* enable clock for regcache get default value from hw */
-		pm_runtime_get_sync(afe->dev);
-		mtk_afe_add_sub_dai_control(component);
-		pm_runtime_put_sync(afe->dev);
-	}
+	/* enable clock for regcache get default value from hw */
+	pm_runtime_get_sync(afe->dev);
+	mtk_afe_add_sub_dai_control(component);
+	pm_runtime_put_sync(afe->dev);
 
 	return 0;
 }
-- 
2.51.0

