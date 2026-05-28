Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2311D39FCC5
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 09:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959187; cv=none; b=duMUTjCbNthvltYnw6CkCnrQBr2FZanat/Eemjuc9jlW3wISXAv/R+oDireVY6W37POlU7U8kcH7niH4NlEuLR7+KNcpBLJcbd43TYU0xphKJowu9VJoRUt9VTQa+IS3ieEBZDqMGvAE4y4bmMGFOykEnep/7KCJnwB4D48seD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959187; c=relaxed/simple;
	bh=j6jOumpq5gAt03JpOtXtKkMmLQ9/IfPUPKwsJ+irT0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NM+3mfgKQgbUvs0AX0YSrz6g8bt6NGvRw/HRcb3w6164fQjvIL4YBAESOhuJ0Mb5ymBe3/Axc8daS9tcME6yTq8irVHGhYYkpzLwJ24OOZvJph4afJSP54q8+P9dzsJ/dmCim74RYdihjDzDKTjZnlAhizpigi19IWkXP0vpvDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=RGcKKiQY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="RGcKKiQY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4903d5c67bfso37692885e9.1
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 02:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779959184; x=1780563984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXwHjuQDu8ibUYMF90MOYbBP5MlSflxyRi1EYtgFSNE=;
        b=RGcKKiQYyTos6iDFAbPDXsHRP1NbC8eKogXuzPQnFSOkoq43ZuUT+5oSSJs23XghUi
         GLxh3wLIAGocoV0AzOtx4yAXeL3fDl5pQmuKuxyuN7I3KsCN2OUlLT1JH8GU25BQC0Aj
         15PhbEi8Co/ZGsOh7iOh3bYkF9JGfdaJ1SjPTlQ35ZyHSCcZoB6gsCq6c2nLPDLdeSIp
         lkKzhkckXrCURbbmYxRM7aitt8C+2ugbrcNTDYugjgUkwqNf86GeJREwrBRvp6AZVXzC
         qx3U7K16fMlFvaEPAV61C/DjdQBgCbR2oSKAOSoVCyfuHF4D/gOxi46O2FC2STXLptOf
         18Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779959184; x=1780563984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HXwHjuQDu8ibUYMF90MOYbBP5MlSflxyRi1EYtgFSNE=;
        b=TR8gw1x8CbdYVyanzPDg05yNo4ouyhAtND+BKdHhyX7wGVe/zvoaEd4GbimNnesMcn
         zc9Hp/IMbs7W+WErU8wh5M8OGAyRoO4WEFNkjhtDqwAOAEbxs2pn/yhcecdlVexTfsev
         dE9G49Tubi8SJvn/+oeKDMMNSZsC9RJtoFnqvS9z1Pcui17KSBaMnlO8SfsJo9bWcqqt
         beHLbnHC7MpLANwTTAdkomX2hzQMxKiaWkW1mOIsQWD3gTZPsip73fk6tJCAx/BbAFCP
         McaflAqEqpmvkDOg5TfCVLRSLXiC5kLx1qi8Xjk7Gw68L591cgrUy69sqxgcTcYkzCaE
         2G1g==
X-Forwarded-Encrypted: i=1; AFNElJ8gVpHpy8NBeO5xrAPcLSyuJovRQ/5pCrmfGrW91VFJLqpSIKRrtqmMi34Ezg2X52YrmSQkfXg43/JT1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVtJ7BIDi4XFcYywV7MhVqgEzIwctIEQqjsVRq44/1Skhof+Rv
	m4wJdrQkZ0SeEoi3I4h/CbPsCXYdgfcQIsKZMGUwj4ovIfjUbCEBTFkS2IUEMyWznho=
X-Gm-Gg: Acq92OHq5yLH6v2AA900PBBXlYo0PG/UGQNN6/qmVZoH+YvE+PkxUu0m7VUH3gGdaad
	pQQL5JZa1IZqAkLc3Lx9+WNYsddkk7zv67HdBx3YrhQNN5YgbdKoZHQlUAb6d2I0s9FXfvU2mkm
	uOf62D9/n8x7OIRp5Ay7y6mMEOHr4SzNdjh71kixRgdsUfB+CmojZHpQjowy06dtzknP+9naUfe
	OHvKcVP0CNOsIKy3K0G286TQzBf6j/hKAcb11Pw2bGBXo6It3fEjraMB0rqfUg70lXU6T8LT3yv
	DKQ4xu5yglI1A+0O4vYKNdrpGOwtn3rvEMY7oFbCC5VezE46nbXAW0WC21VscmBm+2r2wmS+IWR
	0WiC5zWZuQ3yIc/64or14a8fy1OG8P6Xw69m5TKXjsP8QYwjfsphO2lCk84+2/v7iHhglNJs5b8
	JBZ5kUBN82vs7up/oJAzEu90X4K5gY5DFJ5elW8rqSi+rWL1Q6dh4Z9W3Kk6r8DdjhVfrXv2iBx
	hW/UHwz/sbMeR6Fhbfw9ikHZOUocxUo4ktf
X-Received: by 2002:a05:600d:644d:20b0:490:3cb4:f1b3 with SMTP id 5b1f17b1804b1-490426c5a3dmr316858035e9.16.1779959183906;
        Thu, 28 May 2026 02:06:23 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49092a92594sm25459615e9.13.2026.05.28.02.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 02:06:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 1/4] ASoC: codecs: mt6357: Drop unused assignment of platform_device_id driver data
Date: Thu, 28 May 2026 11:06:00 +0200
Message-ID:  <11da50a7e2ab846fa5f008a07d0fe55c7f9ae2a2.1779958164.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
References: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=979; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=j6jOumpq5gAt03JpOtXtKkMmLQ9/IfPUPKwsJ+irT0M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGAV6JWW05p9YMuTnCUN+tAfzN5KlSlBte2zuO Fe1Vyee5uCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahgFegAKCRCPgPtYfRL+ Tmv5B/9QxmexYBMfr9rLI+7CIDpTjP/vYDNsSTrpVxW9VUTCBqpRAepHU/7+5jnlEOMw3i2QBr1 bpY3pgGiB2hzS1a9rHS6aBewtcB+AHs+QT+il1Ddcdxe3XxMyZ0ysDXnbstnK5rrCZOpHtSY2BV A0Tg83dKjiZpl65ycXph+21NMIgxARJPosjLKsJBU5DWkuubT1nSlKsSqRtb2c5NEXOPkYNX8SU H2GmPWthgRl6Z30z+dQ1A7+AS7mTXllZnT8M+9m2OH5k3TO88Ui3cYju7+wltsJ6wAa9HAGfMES M4nXnd2xR5w7av8C+pvvGsa5mnZwoS0L1W96hJnZXlsyYUph
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly set the .driver_data member of struct
platform_device_id to zero without relying on that value. Drop this
unused assignments.

While touching this array unify spacing, use a named initializer for
.name and drop a trailing comma after the list terminator.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/codecs/mt6357.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/mt6357.c b/sound/soc/codecs/mt6357.c
index 674cf7df9df4..3b07087e1cab 100644
--- a/sound/soc/codecs/mt6357.c
+++ b/sound/soc/codecs/mt6357.c
@@ -1834,8 +1834,8 @@ static int mt6357_platform_driver_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id mt6357_platform_ids[] = {
-	{"mt6357-sound", 0},
-	{ /* sentinel */ },
+	{ .name = "mt6357-sound" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, mt6357_platform_ids);
 
-- 
2.47.3

