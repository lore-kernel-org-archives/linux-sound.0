Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013738;
	b=KdiQsCzgH1HXbbl+Dql+CUwu3QTDlvl+HbX7DRyE/wQ1Hpfo8dcp9sD0e42oF/nWX7wb
	 CrczxJQaIdeRJOvCEMy+iOhLzDG1RucoS4GNPiZ2unQqKke9ldNykuPKeNwLIy2t2PDAn
	 39sGNQN2HpyCV7/Th1uwmHbtItlol3mH8dbjkw3fgGDosmEEYRE+xKRBrhcXpf1Qzi42j
	 08ZUD/PPGpYC+HlPK4O3SGbKciTE73nVWVmMyyXJ9vhmUfuMz0ls50YuN66Wmtei1jMYE
	 MpuZG7ZYaTwLg4q+7nakPm2iGwv+vjQ5lOY6vsGwITMWsxEuJqVHdkQG6T1+9j3xakQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ueFejEZrKtsOeSpK53EAFsxF9wHlmejap/cPAZ2o63c=;
	b=Zidp+Opav3GKlqWcvrmaFmZkwt7SERJkprOi/N/1BJDzf9/EbSlL7aqQoFtv+NnYFum8
	 SMZKIzxk6/DKcT/WEHaHR/iZ9Pbxu1EkF+1P/kB13lxPydReZdHKXC+vbG8tEuZ8z8mwS
	 eUSRyWoVQaQkNhECcDGaEMnokmgoZ8ZtsWi4InhaC9OPLwq59r4jQLEeq174ls2p0i4PH
	 ZIx0Kw2m7ucSFiSsn/L6LmlooqEuP1ZxLMkgOFzf4mXDhR2ZY09ZXI5ZhLOgYCrxSTBIY
	 oFlpzthqtORRg9oLN/dcuf0TZp0uLp/EKPC2AgzXz+Kpa9yo9gidLjjW0keOVr80zuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="K/ZCaCFn";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B5160A262E
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 11:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58B5160A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K/ZCaCFn
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso29113095e9.3
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 04:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013736; x=1793618536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ueFejEZrKtsOeSpK53EAFsxF9wHlmejap/cPAZ2o63c=;
        b=K/ZCaCFnHC+KWhwoXbaL/Nt4HC47qntoDJ8TPLIppmlu74hfqGjICbpN9pJevtvtAx
         eNQ2KlRzB7LneCU8dcIEi2Vop+9r3pTqlSt5L0irBquwocC8istdlOUSkA1EgxHpvsLd
         07csBCH7d24TWeJ5AKXE+H2GA96onSyRJRWmsPZB0cj5deeBHKm8TuOdRUvNXHtlDQPn
         k5uDJo3lDJnr8aEtQiFH6qMMsps1witAAs1evsF6VmAEGmmYYKgreb4q8mVc2RdNi+Ns
         TfYAWl3sK9pCB9glSowlPbUXkWkIZeblC76AJM++agE0iFg5c7m5qN9cuolsLNWKqabi
         SPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013736; x=1793618536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ueFejEZrKtsOeSpK53EAFsxF9wHlmejap/cPAZ2o63c=;
        b=Vqh4YBhpdgg+pQdCITpMxp35PlbB6JXovXlT2r1YMo4lhrmxZDH0xZPwTg3Opkc061
         ZB4q3tF3Isu216yq27ez3znbK9p3f3OmoGpNhshE3MPDEMl3hfM5ybdAz0EIHh4tnXjn
         C7ezG7mpr3fpEw/9/hjGZ49YuqDGylUuf/VHTgUdRBE1WZnolsnD3uz3/g7x4fKrvSUn
         PYaNpVWjnBs2fgng2/sna7Oz27jY48DlHHWB7MezI9y+I8mUQ3bf8Lm5Ob66IgwY/jD1
         abUrjhGZKhrpNKsjxM/8peOvhqLoTQgkdpYL0d1bgG+EiJTuU3gcI5EboIRPSI6KAzeM
         UdyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsoDa8sK58VSMNCAB35w4q7caMOigPvpmFLOWb/GW/OxuVF30hRfk7l9emqZjy8GUrQEFPHEvAXCJzcg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIGzhygS1nlkNNJzTpE/D2IidxUm9AJLIC/e7McNygpPuXFXDqZ
	V01e7o2HfuISZxpeDznJ8QlkmfGqH1x2wYNcl+4KPKrDvKQ8K1rLIt8=
X-Gm-Gg: AYBFou01Fviw/O6Jr0FDDIGS7zSKB1KlyT2kkQxyf3LGzOMkATsH1XqWskbK3uWdW0p
	TkPb9K9n8pcZSgmM4Nly3FelRfBaQtSRXbkoaUhv1Ltmou8mWBnmUyTN0wrqRtkHa3uOSgbVJz/
	hUFOQPzVrKD78vUmpNa4bJEaq6pKwUXeC5l/vvfSvOQhogw7+Lw3awXuOrjN7btvESTsHY1kxOe
	pitXZELATICEgE2TCw5Hi5ZdMjYTMWCLx3hDrSOjyu3T+Nke+pBjgV36DUmc/wUpZBvHSXm8FkG
	j5Ydmb5mJviRfnNvZNeehQ0QWi0xZf5M3o7wr3RsmkBbgrzsf5ui7YKouPKmZowUJ8BZxpU3C6I
	O8cS8f3jngFwNQG5nCzs5b86yzIzuUDZPUeD2V+saqcNTdFFjWky499soUXQVRKaKYBjYwzSAIq
	BpKg/jpwlcUk7cDIATkIjwOdW/Ikaaywzb3vANYBN2s+/LfzFUn27r4j773wd6kxVhWawq8C+8a
	aJ/yUrs0DBY9V31WAGD4JYi
X-Received: by 2002:a05:600c:870c:b0:4a5:4589:24e2 with SMTP id 5b1f17b1804b1-4a545892686mr70915305e9.7.1793013735596;
        Mon, 26 Oct 2026 04:22:15 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm129141265e9.0.2026.10.26.04.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:22:14 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 1/4] ASoC: rt5668: cancel pending delayed works on component remove
Date: Mon, 26 Oct 2026 11:22:09 +0000
Message-ID: <20261026112212.2519775-2-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026112212.2519775-1-tristmd@gmail.com>
References: <20261026112212.2519775-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

The rt5668 codec initializes two delayed works (jack_detect_work,
jd_check_work) but neither is cancelled during component removal.
If the card is unbound while these works are pending, they fire on
freed resources when snd_soc_jack_report() dereferences the cleared
card pointer.

Track successful IRQ acquisition with a flag so that disable_irq()
only quiesces a line this driver actually owns.  On component remove,
disable the IRQ to stop the handler from rescheduling work, then
drain both delayed works before resetting the codec.  On the next
component probe (card rebind), re-enable the IRQ to restore jack
detection.

Fixes: d59fb2856223 ("ASoC: rt5668: add rt5668B codec driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/rt5668.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 4154bad276101..01b14c62fde7f 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -62,6 +62,8 @@ struct rt5668_priv {
 	int pll_out;
 
 	int jack_type;
+	bool irq_acquired;
+	bool irq_disabled;
 };
 
 static const struct reg_default rt5668_reg[] = {
@@ -2213,6 +2215,12 @@ static int rt5668_set_bias_level(struct snd_soc_component *component,
 static int rt5668_probe(struct snd_soc_component *component)
 {
 	struct rt5668_priv *rt5668 = snd_soc_component_get_drvdata(component);
+	struct i2c_client *i2c = to_i2c_client(component->dev);
+
+	if (rt5668->irq_disabled) {
+		enable_irq(i2c->irq);
+		rt5668->irq_disabled = false;
+	}
 
 	rt5668->component = component;
 
@@ -2222,7 +2230,15 @@ static int rt5668_probe(struct snd_soc_component *component)
 static void rt5668_remove(struct snd_soc_component *component)
 {
 	struct rt5668_priv *rt5668 = snd_soc_component_get_drvdata(component);
+	struct i2c_client *i2c = to_i2c_client(component->dev);
 
+	if (rt5668->irq_acquired) {
+		disable_irq(i2c->irq);
+		rt5668->irq_disabled = true;
+	}
+
+	cancel_delayed_work_sync(&rt5668->jack_detect_work);
+	cancel_delayed_work_sync(&rt5668->jd_check_work);
 	rt5668_reset(rt5668->regmap);
 }
 
@@ -2531,7 +2547,9 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
 		ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
 			rt5668_irq, IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING
 			| IRQF_ONESHOT, "rt5668", rt5668);
-		if (ret)
+		if (!ret)
+			rt5668->irq_acquired = true;
+		else
 			dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 
 	}
-- 
2.47.3

