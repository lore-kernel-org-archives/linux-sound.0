Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EA8136358
	for <linux-sound@vger.kernel.org>; Sat, 25 Apr 2026 00:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777077884; cv=none; b=mfxcTih6Jbd49uSTCoENsA87dZ3mKjaBHWZ476/nRSvoC2XsU96ijyFCAIliBJRPxw/LF618Y/6VVJlUaQIlVadog04RCudN6xfJR/fNq2aertEHWLMis2u6Jnj7yThWu7hUNK9bCGOXcCTzpaXQAaYG8BXExBpaTWDYPbW0O80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777077884; c=relaxed/simple;
	bh=GZIFJWy+12t4tHAc+/EGv6IOtnm4zthnhcUZSfsEkEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CJjSZq0O02+zpiHMpcZin1GxU90mcoMH9DfyJuLeWQAaxz56W1fQaN3xvQnKsn8k/HvVShdykK8qZRTNVJUri26ME7413LCxuXe6ZnSBlzYHDS3sJF3ygW1yG+ZQL41ae2MmnPACv2zKdbN6vCfI+f7bFMjZ5KUmsRvhDpuE3x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+0+Wry9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+0+Wry9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82f2766905fso3953870b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 17:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777077881; x=1777682681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhnWMqX0OboRHjbC1C9jxSbtj2tKGC5mQL6hqh/ROpo=;
        b=K+0+Wry9lixAGYIVuVCAtQLCIBBN3S1WlebE55a3iegNftuog+8Vcp8A7LUjqBOG1U
         yb85JZJY/Mx08O0cttgPcbpH1LeU/FNGrVKx3Qw0Ueeqda0NWRJGIS8DA4qZWYFoW5yG
         3PBALXwtxo769VPaw1he1dWXCZWsxYdxxkfLSQOw3hAlPzWf6jH9KoB5KVqEPZycVi+2
         zJN9JhWeSfLacRqAvYZPjPu+KG2eGizdSFRcqclb+c7wsfnTGeNJP/G+I15+pGgIIuM0
         zokLVco9jPef3HSLX/z9guwxTffvIadZgQFZVrsqAPm2GUYqLMK3tIf+1oEw0QNibmwE
         y3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777077881; x=1777682681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LhnWMqX0OboRHjbC1C9jxSbtj2tKGC5mQL6hqh/ROpo=;
        b=fH5ckkRnRJX3OwKfsfTeqmWdZtcsI3N3w7CXWZiwGeBLvKTGP0udjSyXlr0cUo5GI1
         j5FYUAoS60q6ix8BH8XaXk5UOjm+0aqxPUckqb0Wr1j54WrjUN2vb3fr6UvfFMvyWhf9
         Ui5hTBhbHIn8AidfG/azrRbOV1kjnVdzdAyBx6pcqVPw2knJEyufz1N9Nfmp78XQiGxT
         7GXemMbuBi+m68Ih/4Ii5Ni3pKVk9GaiDprlH0X8ca3iKU5/nd2MVpt11W3cdIGs+xLe
         9jnQTdkEyj3zRsfRQugmdb5yrLZI6RnLcg8hFESBuUatSfLSrcyKDeiMuKZe7bmJSKfH
         e1BA==
X-Gm-Message-State: AOJu0YzjQpuz+1R+cWMNh1Vf85F3bYea/muRW5WTQZ5i8OH51MbNz6Rb
	qwCRhLONi6JrXKsknJcwb3YFfri44FUfd3Bqxiooj+Mv2G2gs/CBeDIW
X-Gm-Gg: AeBDiesCaK9fDafLjRtUG5DxWyc9jbAdvU2I55YEQHifEAlDfzspo6COYXuVlL52/NT
	4mbxIvrQVEH6u4rFlWzZRla/TRYNaS593OB3C6xUK4RMDtxuzD97a3Bj7cqjBnhB/JRg7peJmbD
	b42qcAxE6AzpPzdmssOGKWyLSFESGUTOcejcO9ADmDrd5fELo/9ZfwIgdH8HfxYXWHFDzLjk4/C
	rs789TR6faUGrqiYF+qasVL75EHjaTBfBAuQDQTdaWNqedkz5M00Jf6aKBf7mqvhSBHXtV3jufG
	tmsctjTkH8O5hwVeR47BBMlugTQUxv/xMus2z5J8FNaeSWVLR/es9ljpO+QGEaVCumTSPuXd5Zn
	PaQ1/HUQiZV1lI7J+ds7sUuxYhSRNxWsqUylV4Yl9lZH89BxMoLHtgPCajFNOJSq/rUztIJbINK
	BsjJ5+RHDVFxUZr7LRpkPr1guPQ2yaWNzfU6p1zzrrGRFG043FG+0SJt24oUAQZ4lJpI0mxz5IR
	sOHg8DmA3XZkR9BiyS7DbKi23GTQ3Un7dnBYpXeWSNVa+4JRqRZBNm3UvZKv46BUhE4odSi3PKC
	y9gc2/M3bQ==
X-Received: by 2002:a05:6a00:1749:b0:82c:d7c4:4c6b with SMTP id d2e1a72fcca58-82f8c81dd75mr34959022b3a.11.1777077881389;
        Fri, 24 Apr 2026 17:44:41 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0566dsm24948385b3a.57.2026.04.24.17.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 17:44:41 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Apr 2026 10:44:05 +1000
Subject: [PATCH 3/4] ASoC: tas2770: Fix order of operations for temperature
 calculation
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-tas27xx-hwmon-fixes-v1-3-83c13b8e8f54@gmail.com>
References: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
In-Reply-To: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=GZIFJWy+12t4tHAc+/EGv6IOtnm4zthnhcUZSfsEkEU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJlv+FIOWK64Xa8ne6mbjW/P/okXW126NVIK/FU+Gbst1
 JAWE/vXMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmGrnzwy/2Y84r6772Boh/KBWcDPv24S77gvutnhMamc+yBL24aPIKkaGHvPl5jf
 nzWo5fNL5fVKC1L+qz3oOtZs6BNSOfC8K/H2JBwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The order of operations to derive the temperature from the temp
register values was wrong, since 1000 / 16 is not an integer. This
resulted in the calculated temperature value deviating from the
value represented by the registers slightly, which was most obvious
when the registers were zeroed (-92.265 *C vs the expected -93.000 *C).

Scale the reading before dividing the whole thing by 16 to correct
this.

Fixes: ff73e2780169 ("ASoC: tas2770: expose die temp to hwmon")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index d4d7d056141b..50501bcbe916 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -624,7 +624,7 @@ static int tas2770_read_die_temp(struct tas2770_priv *tas2770, long *result)
 	/*
 	 * As per datasheet: divide register by 16 and subtract 93 to get
 	 * degrees Celsius. hwmon requires millidegrees. Let's avoid rounding
-	 * errors by subtracting 93 * 16 then multiplying by 1000 / 16.
+	 * errors by subtracting 93 * 16 and scaling before dividing.
 	 *
 	 * NOTE: The ADC registers are initialised to 0 on reset. This means
 	 * that the temperature will read -93 *C until the chip is brought out
@@ -633,7 +633,7 @@ static int tas2770_read_die_temp(struct tas2770_priv *tas2770, long *result)
 	 * value read back from its registers will be the last value sampled
 	 * before entering software shutdown.
 	 */
-	*result = (reading - (93 * 16)) * (1000 / 16);
+	*result = (reading - (93 * 16)) * 1000 / 16;
 	return 0;
 }
 

-- 
2.54.0

