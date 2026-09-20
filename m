Received: from mail-pj2-f23.google.com (mail-pj2-f23.google.com [74.125.227.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE7D36C5B4
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880139; cv=none; b=GMVhwAULdABUuCH8iGU+hdaD5qLKakuXM3FItu0i71fcBU7jWdOggzAg7OdPCTBm+fP/tDfokAbeZLKjDejB7ZlbHPQjasgy3SY04u05OQjHuzCQWUGkPK5nfPba6GG+iVI84fmu6rF1hick/ZC5ZhUDTCzu5hNE+2NOwbb/IEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880139; c=relaxed/simple;
	bh=vjc8kzENgz6iKNAy+aA+ET9iiFQ96+MVJmNToH4ibVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGasJcr7Gk5WFnTl2pGSQca1mjAedE02a+9GHvTaT/sSoSWZ+mIdPGmaBQ34l9rIN9uqCHjOEkCKt/8q79oGKDm3ICd62szb7AA2PMMKOhfqHbJlQs84R3mgfJxnc0gl00wEEds3vOwEliyVAQMYIbaN2bFwYHQcCa7wrSlxU9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhNsfMsK; arc=none smtp.client-ip=74.125.227.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhNsfMsK"
Received: by mail-pj2-f23.google.com with SMTP id d9443c01a7336-2d747f066d8so6961945ad.1
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880137; x=1790484937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guh9SUKBNUNAFe1CPJL5pC07OGZIVIcs9iIVSylPf+8=;
        b=YhNsfMsK0qk6onzsVi58+SzI9I3WoyBfqN4CqEjUIBImnWEhhFpsM0ryqMru1niaN/
         TtBpZo/vEaOmhVFIp+tzkY4D9aJt6pwTlv0iEFtgCTEnXIX2aRPQuVph9lfLhLDf09Qh
         rEnips7XyrbCo8HIRrawhZBA2wkgrEohk1ILg0/RSsG2t5hky4HLwVJu4qCYTdis+XbL
         9f88hWyjeJkiN7qJSPxDZcuigFbPnSUU9rWpHr6oKgKO2qZRXIT3lNY7ErKCWY+zKQo5
         nHKEUpYaPbdBg26ozTzWt3LaHhDqJusFr0DtsSvAND35I0+Nhx/by8XPxbw32ppfI0KI
         7E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880137; x=1790484937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guh9SUKBNUNAFe1CPJL5pC07OGZIVIcs9iIVSylPf+8=;
        b=MPx91LmOdEJ0wWoCGO4Qzb91sfITsm/CqbFHdcRtEgdOzFeHqbKYne7xHhuulDICdj
         sxW3MidC9o7jLl7esBoeQVqI3jV8tbSpZYf+4A7IMbh0AA61JxJm+h5SsrQTh5Ybxzf0
         z12Q1vYua+aNzAa7wtMEafNHMmmLTLzDxoO5OcX+pDm7D1Z/sigbyzlqLNRqLElAeIN4
         Z/u3cHyeI8rAuqOcw6TXi8rFZ5dl3H7ZScVyRlDPJuN5H3QOQ8ICPO9D8hEOi09870Ub
         PFf9tWTn9WBU0Gx65WdAJiLPoQFwNj0PiTpEiyt1sfxZL1/IuQo8xnl155X6PWZsh+EU
         FLWg==
X-Forwarded-Encrypted: i=1; AKwUvBzz8j2m6H8mrP5es8l7neorcIgeyH2oBoUGzQBlJB3/slvydxxK9UhoxhiyvWyBYxRsvPMAeTZfjENAUA==@vger.kernel.org
X-Gm-Message-State: AFuF++m+8WdbM2yIX2lfpsVuydj9gsg5w1rrpNw6mPCAbr4nfqRstMcj
	P63TpEY9tiCYDFXDZwQxr4tOKOnVyYQuSEy2ZYFdn5bvqntb0dFpBkEa
X-Gm-Gg: AYBFou2hCTgOie1UYhdQ3+C76eqxyoYTkqLOPMFUCIlz0y3TZRqDmX9y29H4Z/5YBIt
	xfDr25fR6CYiq/s0LpJAnpI4vzRbc8ZDDGQulVQZ3lI4EAR3WV+DGIP4npIfaz+eInCJeUZg/Je
	ra+WwvJp4qeWO4kjNmeDm3oQTFhG0NDpreAMm11rT5hGUq/1oOe47O5Iw7VTreoUYB2wAHjqS71
	Fwg0q4Ly1PA3Yu5UPh+Vklq18WLXWo8QLd0SbUSmGfepeBRMeCoSxsSoZbWJKHg9aAbj838buvZ
	2ufJfr0tO3A1bbx8araz3x7USjJwYWOFDp5lo08toD5GI93gXW+mbrO714IBgwFS+KNZjF8XySu
	y/AiSoMjvDOca7qCe6TlbcyGR9QNhRC01rs1iPrRB8R7rBLp5rGNK0xjj8ArCapS7xE8HUIa6BD
	wKKIzyz5eNHp5y7Z8a3APCSBWjOphEhXKTvxDgjSmVj3zTVn/wfilzLJ0eq5GfV/mY18ISvkdGT
	gqNfVl6DxOuQGQuNsyNdfkNzmRfzBaoQWPT4C03pHvn1ha7OyS4MERcETGIOU0g3jIkRbhIy5T+
	kecNmu5p0+xIQ1BlMSxjy7NXn4wLJTlu/h2Z2dGzzOf/tMw=
X-Received: by 2002:a17:903:3b90:b0:2dd:c100:251c with SMTP id d9443c01a7336-2ddc1002582mr42342795ad.37.1789880136783;
        Sat, 19 Sep 2026 21:55:36 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:36 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:42 +1000
Subject: [PATCH 03/28] ASoC: cs42l42: Set a faster digital ramp-up rate
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-3-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=OmSPjK7SUuOGMGgXmxuIo+R2IFqwguXc6h4eMDL7B9Y=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+UPyfalrpv1r+xTfu2HLE4JBaWJnIbuCs4xLr/5f
 j7JPX+yYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNU3NBj+6VWfZumKncEUeYQh9bx1/ZJCiWl7v/0OePDm0bym69Z1Oxn+F3iHLD6
 yt/urYQ8zk7cEo0T99E9aWpIxG7Ysk69699SeDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

With the default ramp-up rate, there is a noticeable fade-in when
streams start. This can be undesirable with aggressive muting for power
saving, since the beginning of the stream is lost.

Lower the digital output ramp-up time from 8 samples per period to 2
samples per period. This still leaves some fade-in to avoid pops, but it
is a lot less noticeable and no longer feels like the stream is fading
in.

Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/cs42l42.h    |  4 ++++
 sound/soc/codecs/cs42l42.c | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/sound/cs42l42.h b/include/sound/cs42l42.h
index 1bd8eee54f66..b3657965d491 100644
--- a/include/sound/cs42l42.h
+++ b/include/sound/cs42l42.h
@@ -62,6 +62,10 @@
 #define CS42L42_INTERNAL_FS_MASK	(1 << CS42L42_INTERNAL_FS_SHIFT)
 
 #define CS42L42_SFTRAMP_RATE		(CS42L42_PAGE_10 + 0x0A)
+#define CS42L42_SFTRAMP_ASR_RATE_MASK	GENMASK(7, 4)
+#define CS42L42_SFTRAMP_ASR_RATE_SHIFT	4
+#define CS42L42_SFTRAMP_DSR_RATE_MASK	GENMASK(3, 0)
+#define CS42L42_SFTRAMP_DSR_RATE_SHIFT	0
 #define CS42L42_SLOW_START_ENABLE	(CS42L42_PAGE_10 + 0x0B)
 #define CS42L42_SLOW_START_EN_MASK	GENMASK(6, 4)
 #define CS42L42_SLOW_START_EN_SHIFT	4
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index b5d69d5516a6..c40e8da8f6eb 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -2422,6 +2422,16 @@ int cs42l42_init(struct cs42l42_private *cs42l42)
 			(1 << CS42L42_ADC_PDN_SHIFT) |
 			(0 << CS42L42_PDN_ALL_SHIFT));
 
+	/*
+	 * Configure a faster digital ramp time, to avoid an audible
+	 * fade-in when streams start.
+	 */
+	regmap_update_bits(cs42l42->regmap, CS42L42_SFTRAMP_RATE,
+			   CS42L42_SFTRAMP_ASR_RATE_MASK |
+			   CS42L42_SFTRAMP_DSR_RATE_MASK,
+			   (10 << CS42L42_SFTRAMP_ASR_RATE_SHIFT) |
+			   (1 << CS42L42_SFTRAMP_DSR_RATE_SHIFT));
+
 	ret = cs42l42_handle_device_data(cs42l42->dev, cs42l42);
 	if (ret != 0)
 		goto err_shutdown;

-- 
2.55.0

