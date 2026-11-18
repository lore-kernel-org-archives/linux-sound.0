Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966056;
	b=3Tzc7HeSamD+QST1+gsFZkuYvDHPFMAChZteTPr4JzhMr6a4ieMKTUsFdzc5kQVG1XeP
	 32wvzwFR7nw+zQ4zFW9f+3qkEJb5ZRE9JpuV5pv/BsMjiEGJc3DFktcConoscM7KtKukg
	 kQhJUl6sRc/+TJK0ceJLsQlNur5RJa6wo209I5fupSFSO922RemTlHaO4925SX86/ujb+
	 bfhVFQTYykuQgIVxIOQnaWiQXHevVSyZ8e+pM8A8ZmTR/PJajtO/DpqFlJwVDpMWCj7AJ
	 6CaB6cUf5ezZz8cfb85wFUOIcIapGjMkqRmgX/gTvwliWZ1M7uvKQ+tN/4rHnpH2JXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PHZG0bnEH5ZUBCEviVeul8atAzxQpR4ArhiU80Iqs1U=;
	b=ZkjmQI4WCl3iZdAWQ8bNoYddkIepaG10U3o25hSwgwbtNu9UM79Dc4U2/AbV0JeojXeJ
	 4QM/zDhd1A1DBme2/zugB45CoOB8atcFkr66KkojkmvjA7IQpjPxrq5mVbu5IyetR7xDo
	 Z4agGLCqIFmsgOqfoPHKfUVC+l8UbxsV7CTQB37If4rickqaCbhsgxQuZaV8bzAfRM+fp
	 61SPmcH2ZR9Ux9bqjVrYPxGwAxFHHZ8M/v+/fzRo1vx+WLCo9IS7xsZe6bnC/P8KulPTc
	 Pr0xwftY1G2YIwoiTGohdTmWIYXqegf2K3GhPSJzIyhLMwAsoeOtXHUuwocJB6Ag1Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cIxGV4xz;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60DA606A32C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 01:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C60DA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cIxGV4xz
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-920fed989b2so2966776d6.2
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 17:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794966055; x=1795570855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHZG0bnEH5ZUBCEviVeul8atAzxQpR4ArhiU80Iqs1U=;
        b=cIxGV4xzHPb8AnycsIS5fHQ+ETu8GWeOn45mTQ3MuAexMBjai42NmFlP3KPJhL1Gqt
         TSt37n6RdKFJvYJSYV7QmEQV5gv02XcZt2EAotbWfA4nmNnkVPl2lkqAzO3hvoWrxOVZ
         KStxxtF+uESBKZvlvURqBy1zQ3eTuIGim6NXE0ukzc4oh0xbIuwrs75Uxc3os1sJa9ke
         ORzRyJh8X+lKUKgZF/8agZoYgVlNezlOhf9vz5mzz348WNMR4wGsSuR3JgcfY2pf4pS/
         xNVrHVEzEw7iRh1p4yaqp9AJJvrR3xUDsA35wSxE6pz0wB7Nid5D1O3A9naU/VZjYKq/
         awtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966055; x=1795570855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHZG0bnEH5ZUBCEviVeul8atAzxQpR4ArhiU80Iqs1U=;
        b=gVHuH4RfOZq0LUbSZAA/RjDs8T+JENfIedfxpy5cuma9G2L4xbzsAJVur0dZIYDZyB
         PgjBsqRjIqQXJS7LDs5DSrw9e8WGmDf223x0yhh+aDOYQUrLFz6K3nwNxwDE68WYcRyF
         ouiATWIvTV6BIGhbhJ7Y3c54dUEmSf7CRcEdcDKdHe1dEtsusVhdlwYQXsngyGkki0b/
         ASH2EBG9H6j474V9f9HCvYTBtCBBXIB/YJBLcyIC4/R2JsuY9RqybNL37+uXsoMorBU7
         q2r+JW9GfAz4PhrcUwlUSsWUx+CVMoqfQ63NE9XWxCK5sOmnyvZyk/kUe6QOLYf5i/p2
         YE/g==
X-Gm-Message-State: APuU4Z85qpmKDE9EuL3BgzQsbV58DkRlUMUROM/plf48QrCZarBmO8Em
	r/OTw8ZH5Gg3Cno25iElx6bmgCZOpHy+3GR/I3eGat6K28K8K6svtwhf8KXw
X-Gm-Gg: AYBFou1XXhI/zZYklIjfPjne0dNN1GEUUaLg2eU9vt7o7LZeeNr4Tam/+77YJsPLPlL
	nXYjXp3ucY41SlQKwBM/twNMkzNf5KReoI0xhHWRLG9FtyGMIdndBuILl4VcSTBELkLk7Tt0PXY
	tlPvB3YEhnrKCmJSLRwaZfoCbhiH/7kMrL5Kcuxt82q5dRA3PF2HN+8TyzBvVCLYthvKQnScrBl
	SEA4SSnVf3Zc/XgWMap9bIJEVswNM5eNlkP+TZ1pQPcfMXHNyLxePgFibgJaNsosDVuAtnsc2Gf
	Au6MqE3SVqXAfikVIhv8oXZxjpgQzKQJ8CW1oXiSlKldYHvRTT3tPn3ySfUeLQNT7rXvmC57Cuw
	wzmrQnxugzySSTYxScLTqzcbE9b21ilgXR70Dq5LxJ+d00p8AqhXDh2zwLSxMkPVnKL4m7ZIMo3
	z+WW1MpkiawokmFs31I87G6vIptgrrOcn7K0Wa6TsI0/LADlcc0Y3mumHnMHlev14kLxA1U/DT8
	AcdM1kV0DwAozKdaQfPFTUvjYw9QCcIotIiJ7BF5Z1BzlEGySw+jFkgVm57msJQQldulod/g3js
	6eurK89vzR1HK0bm01nj1Fu+QkBp3QoGb+8E5FDyY+7dhBOy+Dr8Jojdcoder2O3oOcjL2vvdbV
	gg2RCrjPbI0Na8/Vc06NvT9a5DHPIOLshj3JeWTHjFcegABIcMT622ummRHC5AqzKPA==
X-Received: by 2002:a05:620a:2887:b0:93f:6375:aaa0 with SMTP id af79cd13be357-94999632575mr258573585a.80.1794966054585;
        Tue, 17 Nov 2026 17:40:54 -0800 (PST)
Received: from localhost.localdomain ([104.39.87.133])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7d3f19sm60825585a.38.2026.11.17.17.40.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 17:40:53 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] ASoC: rt5663: Stop jack work on probe failure and unbind
Date: Tue, 17 Nov 2026 20:40:51 -0500
Message-ID: <20261118014051.75468-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

rt5663 registers its jack IRQ before registering the ASoC component.
If component registration fails, freeing the IRQ leaves any pending
or running jack work in place while devres releases rt5663_priv.
I2C removal can leave the same work behind.

Stop the IRQ handler before disabling and draining both delayed
works on component registration failure and I2C removal. Stop
jack_detect_work first because it can queue jd_unplug_work. Keep
both works disabled through device teardown because ASoC link
cleanup can still call set_jack() after I2C remove returns.

Send earlier probe failures directly to regulator cleanup, before
the driver has registered an IRQ or started jack detection.

Found by a static analysis tool under development.

Fixes: df7c52168ee1 ("ASoC: add rt5663 codec driver")
Cc: stable@vger.kernel.org # 6.10+
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Drop the duplicate subject from the body (Mark Brown).
- Cover component registration failure after IRQ setup (Mark Brown).
- Share I2C teardown and keep both works disabled through component
  unregistration to block late set_jack() enqueues.

No hardware test.

 sound/soc/codecs/rt5663.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 58b165e8b6e12537196a775338de1da1667ad82a..5e95ab2666594ea1a8f2a59338cbd513c8c97c4e 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3520,6 +3520,16 @@ static int rt5663_parse_dp(struct rt5663_priv *rt5663, struct device *dev)
 	return 0;
 }
 
+static void rt5663_stop_jack_work(struct rt5663_priv *rt5663)
+{
+	if (rt5663->irq)
+		free_irq(rt5663->irq, rt5663);
+
+	/* Jack detection can queue unplug work. */
+	disable_delayed_work_sync(&rt5663->jack_detect_work);
+	disable_delayed_work_sync(&rt5663->jd_unplug_work);
+}
+
 static int rt5663_i2c_probe(struct i2c_client *i2c)
 {
 	struct rt5663_platform_data *pdata = dev_get_platdata(&i2c->dev);
@@ -3724,19 +3734,13 @@ static int rt5663_i2c_probe(struct i2c_client *i2c)
 			rt5663_dai, ARRAY_SIZE(rt5663_dai));
 
 	if (ret)
-		goto err_enable;
+		goto err_jack_work;
 
 	return 0;
 
-
-	/*
-	 * Error after enabling regulators should goto err_enable
-	 * to disable regulators.
-	 */
+err_jack_work:
+	rt5663_stop_jack_work(rt5663);
 err_enable:
-	if (i2c->irq)
-		free_irq(i2c->irq, rt5663);
-
 	regulator_bulk_disable(ARRAY_SIZE(rt5663->supplies), rt5663->supplies);
 	return ret;
 }
@@ -3745,8 +3749,7 @@ static void rt5663_i2c_remove(struct i2c_client *i2c)
 {
 	struct rt5663_priv *rt5663 = i2c_get_clientdata(i2c);
 
-	if (i2c->irq)
-		free_irq(i2c->irq, rt5663);
+	rt5663_stop_jack_work(rt5663);
 
 	regulator_bulk_disable(ARRAY_SIZE(rt5663->supplies), rt5663->supplies);
 }

base-commit: fcfcd6db32adbdfe81c1ded257200e3ea6815d9a
