Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382523;
	b=HHmn7IwThA9ESjs/up4xEp3E40OLnMh5wp9CjotTM2FfLQxjrpoRAvlvkP2aLRNJzkVS
	 pTtnhXK34IF5xirWVHK56ztGyQfc39wWoZvBxom1hQlp7B1jqgSr0Xg4VrU4oxhMu2J/G
	 rIvZNVNafmC9/cnZIRWQvOe8mudFPv5A2suc0Zb8exQClYX0XGoC3q7O0UCyK3+c4hb3R
	 WrGqeYdznFTTEhYkGUMZK1yLznawM62/PNUgzG1fmH5laFKNyfFuKWi635J4NHmKK5aj0
	 Jjc7WXMVbz7g5riFUufGukCzVghJ7epP+OjD1C+UfYlortpGnUIlMCG9DacCdIAWZrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FH4Kqn8dco80ci61ZbweWMHJrINyff7bOB9z+yUQ3m0=;
	b=F3z1sLbdeZcdBT647/o8oditq3++SlVY3CYCqxTklvpJ+upX7IYp/QsZkL9an3SSOooD
	 oF7LzBXkO0o3g8EsjN2IQ12RWktlHYdvclp4zaDh7fWxTRf3xRQeAc2vcfjI+5df2sxAp
	 wlerViZJKj/Cd5ubqSTbqLvxfvJvK/sap/9fzuIWT/WY2tIKDyXz56LYVraZepbTajZdn
	 OoysMKYG6LNOLKO7qym1NAOJCBNlntHgwahY/4zmb/Nr49h0r0ZXPaNj3J1cuaMgGYjRS
	 qZcnCtXShnwbkOvhwNfQboN9MWSA+BZYjEE1SKcuzuHbQVYuSZJFMNMrRq2A6lxZDzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P95Q9Rd5;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D300C60A260A
	for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 17:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D300C60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P95Q9Rd5
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e47347279so705996f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 30 Oct 2026 10:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793382521; x=1793987321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FH4Kqn8dco80ci61ZbweWMHJrINyff7bOB9z+yUQ3m0=;
        b=P95Q9Rd5PseHDYfFIJmu4dqQGnogqvpekgrmfUm+JlABfHnAe3n1sSaNYPJb0S5tjS
         Aw7PGPLvrnFvE/kiDqL3auS3EmW3J7zWa30GkzNFcRcwJV0Na1N47vHgnuEKkvyfsx1W
         v48KlD0cDLyzhhEu7LEA480GFCCwYW8U2+mBFGhSBJ30JOjbKLCVr1f3jl8l1F9etkcG
         5dRU8z5cmyDe20v6FojF/6tYYdU1U5Z43F1ajwOy+9ZA8LSOHjuzvvu6DHQXrd6erjZS
         AnjbwbZyk8IhdzO3YVhMMGbYJrYFQLxCge12JaLOwcmNsXNsuf94WPHpxOhl6qI6RagI
         hPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382521; x=1793987321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FH4Kqn8dco80ci61ZbweWMHJrINyff7bOB9z+yUQ3m0=;
        b=rIh8tTSJrZ60476JP3O5KZ7d2DRyr6g7532TXluiHcEblFSwt1YVvhhKU8+ZjIO+FC
         gF3yjkEec/7DDAxmyniWbXbmQWTjtnN+RA0+Q3v8+yZJV8PCRKz70GVmwsm+IdxtCVT5
         Jw+C/+Ci7Yx5MmJsJTPPf8q5Y3Ww9VI+3Xb6sC5/fQAmcu8ZNDCJhDSWk0zLjtp5OJ2T
         Wp6w+4E+Qd8kNwfUWLxyNIyiLrQqWlm/mKQpdcnZWRvg1i2tFW4Nfd8Wq2+sgcO9MIr6
         Z4a6IAZlMTQuZDuehprlD1KyggWUT/49B9w4J2mMOnUsKVT1TLi+J7RL8WrwnEN+vqCn
         iR0g==
X-Forwarded-Encrypted: i=1; AKwUvBwnpqqWkHLYJ8/KbvL91yaJ+d4qZIpUQu4aOqLPwbeTJH4RO6Qf41S6/qCC8EDxoAwlawfDlfzzyS7h0g==@vger.kernel.org
X-Gm-Message-State: AFq9FYL/IQkXHAIz97rLiNfBZ+J5nGdBCNkdJgE/Byg2MTWNzQuleQ0h
	9WGSrsv6kAvDdvJcJ2L81opuiPy7G+QvUBt7llzIEa7OBBQUwQmmK8M=
X-Gm-Gg: AYBFou1po57kZRCMFzwjzysnRiJx/rPrenCbYkTCUtC8bclLjsRobi6qA3/FyMZdotQ
	e4PFq2BcgUx5s1NcL2BTUKleIGPUDVkAgmR+mOA6LuF3JKaQ5F8K5LNpNi72tWGu+UEcRaWXNdl
	JlRBLzo+nJLuvXhoDzGf2pXPqD53Mw86bw92NyjNBOu7tF5/iQlYy94RPkREi2D2kXoaQIg5aMU
	sBIK+I58HXl8RvOmrLc3P8nKkgDjmCOOO/4qQQSc4IZpXrx+INCTvIdFCSknyS0Cuw+E3ASD5Ip
	GX/NletyD5VQJ0IrIRyzRCshk8wH/dhKghKuO6/70T9+FOoGB6kxleDL0C01XQPedPR25/8RygT
	ZL4lKTE0LzJsya3XlNAr8B1SLmpuN7+Ez3FG61G5rU9XN8OawvI3OvLYDir9mJdt0v7hg8Qwu4D
	WHV6HaqH10kw2Ga5k7IwzKJ8mXugO5dnTHtXmsL6BG9TqQ/fZSHgxDwLK7CqUc3R/ShituDTYoM
	qBva/jhYwwrheHz2L+ZxNOAjl0ii2LPvXc6s0kG5BPfD1aENjB8GUt/o4byZc4BMbz02r3UvWKW
	3pmx3iAcAIU=
X-Received: by 2002:a05:6000:2603:b0:48e:932:aef3 with SMTP id ffacd0b85a97d-48e6e30417amr7527190f8f.23.1793382521184;
        Fri, 30 Oct 2026 10:48:41 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8e5f4sm4492926f8f.40.2026.10.30.10.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:48:40 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mark Brown <broonie@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Bard Liao <bardliao@realtek.com>,
	Misael Lopez Cruz <misael.lopez@ti.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v5 2/4] ASoC: rt5659: cancel jack_detect_work on component removal
Date: Fri, 30 Oct 2026 17:48:35 +0000
Message-ID: <20261030174837.1839402-3-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030174837.1839402-1-tristan@talencesecurity.com>
References: <20261030174837.1839402-1-tristan@talencesecurity.com>
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

rt5659_remove() resets the codec via regmap_write() but does not cancel
the pending jack_detect_work. Since the IRQ is registered with
devm_request_threaded_irq(), it remains active until after the component
remove callback returns.  The IRQ handler (rt5659_irq) schedules
jack_detect_work, so a late interrupt can queue work that runs against a
reset codec.

Track successful IRQ acquisition with a flag so that disable_irq()
only quiesces a line this driver actually owns.  Guard the
cancel_delayed_work_sync() call with a flag that tracks whether the
work was initialized, since INIT_DELAYED_WORK is only called for
specific jd_src configurations (JD3, JD_HDA_HEADER) and cancelling
an uninitialized work is undefined behavior.

On component remove, disable the IRQ to synchronize with any running
handler and prevent new enqueues, then drain the residual
jack_detect_work synchronously before resetting the hardware.  On the
next component probe (card rebind), re-enable the IRQ to restore jack
detection.

Fixes: d3cb2de2479b ("ASoC: rt5659: add rt5659 codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/rt5659.c | 20 +++++++++++++++++++-
 sound/soc/codecs/rt5659.h |  3 +++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 3097ee6d4e89f..cdf499fb36d67 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3667,6 +3667,11 @@ static int rt5659_probe(struct snd_soc_component *component)
 
 	rt5659->component = component;
 
+	if (rt5659->irq_disabled) {
+		enable_irq(to_i2c_client(component->dev)->irq);
+		rt5659->irq_disabled = false;
+	}
+
 	switch (rt5659->pdata.jd_src) {
 	case RT5659_JD_HDA_HEADER:
 		break;
@@ -3684,6 +3689,15 @@ static int rt5659_probe(struct snd_soc_component *component)
 static void rt5659_remove(struct snd_soc_component *component)
 {
 	struct rt5659_priv *rt5659 = snd_soc_component_get_drvdata(component);
+	struct i2c_client *i2c = to_i2c_client(component->dev);
+
+	if (rt5659->irq_acquired) {
+		disable_irq(i2c->irq);
+		rt5659->irq_disabled = true;
+	}
+
+	if (rt5659->jack_detect_work_inited)
+		cancel_delayed_work_sync(&rt5659->jack_detect_work);
 
 	regmap_write(rt5659->regmap, RT5659_RESET, 0);
 }
@@ -4271,6 +4285,7 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		regmap_write(rt5659->regmap, RT5659_IRQ_CTRL_2, 0x0040);
 		INIT_DELAYED_WORK(&rt5659->jack_detect_work,
 			rt5659_jack_detect_work);
+		rt5659->jack_detect_work_inited = true;
 		break;
 	case RT5659_JD_HDA_HEADER:
 		regmap_write(rt5659->regmap, RT5659_GPIO_CTRL_3, 0x8000);
@@ -4280,6 +4295,7 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		regmap_write(rt5659->regmap, RT5659_IRQ_CTRL_1,  0x0040);
 		INIT_DELAYED_WORK(&rt5659->jack_detect_work,
 			rt5659_jack_detect_intel_hd_header);
+		rt5659->jack_detect_work_inited = true;
 		rt5659_intel_hd_header_probe_setup(rt5659);
 		break;
 	default:
@@ -4290,7 +4306,9 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 		ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
 			rt5659_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
 			| IRQF_ONESHOT, "rt5659", rt5659);
-		if (ret)
+		if (!ret)
+			rt5659->irq_acquired = true;
+		else
 			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 
 		/* Enable IRQ output for GPIO1 pin any way */
diff --git a/sound/soc/codecs/rt5659.h b/sound/soc/codecs/rt5659.h
index b49fd8baf4e7e..e10b3844501b9 100644
--- a/sound/soc/codecs/rt5659.h
+++ b/sound/soc/codecs/rt5659.h
@@ -1813,6 +1813,9 @@ struct rt5659_priv {
 	int jack_type;
 	bool hda_hp_plugged;
 	bool hda_mic_plugged;
+	bool irq_acquired;
+	bool irq_disabled;
+	bool jack_detect_work_inited;
 };
 
 int rt5659_set_jack_detect(struct snd_soc_component *component,
-- 
2.47.3

