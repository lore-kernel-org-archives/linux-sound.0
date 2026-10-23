Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769245;
	b=30T5Sl8yW0U62InYJICsegT9IG11zAoPcKSU/Ny7Dh+96Ny3/m8ItS9FiFxHCXVtFMbt
	 0gqXprFK3rNN5hZCecMDimK2/8dIt9yJ+xMXMlUWjFNMQ8ThVXxm3nffIbUDGb/8A6xEP
	 w4Z4p88K0m9RVu7JAwN/8EJpOIi46+Ov9v5P6ZtgKZcqsHyuIqyDhQdGAsIGNtOgUoHpi
	 j9g+xnOR7rJpQcOKGJJNqOTX7u59kfZvu5ecevJsq9WKMlprL6jeo2+6eKwLNHuaOVQeY
	 t7DxWLpMvM/eUTa4l0xk0vzsUDmoNgMW+mIKuTa452NohswVMIJIdCj8T16by68F0kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ulO8TPekTBB+OWa2HIRbuFwUD+ZmDaEZk6DpzvHpZKk=;
	b=PEKRpRRqRLLLerNdAFyriRU54atbMn7kILQmcoSU8c4AE9Tc+Q501MHVmWamEWMgiRJ6
	 Ir4ENDgbpiIvuRI+3rsURVeWXMTUjyL5cArinH0q5GTtCMo1GkYJ2FK7OFvRfcik4rapZ
	 SeceyZVWffobSrRAgalNzMBTpsXtr8dKTWzqoBv7mL2FgjcZR64PapWrGNaQ8QCGE5l2R
	 9sMPTYcqMsW2TnHwR/RMF2X4/NCfDfhEmelLlC/el+xzyUcMS7y/V/y64KebcNztBAkKl
	 0joq9e1B39YCzQsp1wYZouvZA6iPeXpAqlzhZjxTiBO1hdMZ3EHvqxIPmyE8ypKlwBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=TTjVk6Cz;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49628606A31D
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 15:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49628606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=TTjVk6Cz
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1563894f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 08:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792769243; x=1793374043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ulO8TPekTBB+OWa2HIRbuFwUD+ZmDaEZk6DpzvHpZKk=;
        b=TTjVk6CzoVl7KUAxAw2Q4rRnDuiwQ1Wm2zq+vRYOHrDrZmozvBHxJyroCyRsZEbxCk
         99GQlSRadA1d5GM1iQT4266Id7y388jf12FltrCLxAmqYTX28GiRxywaLycVfeWiHksG
         tBpbeXPKe/X4eVn+Dm6k8i1oC+Pa2qwFEftVgIldCfpJSUFkQXfNKFvnVs5vpqTCinhG
         i8N9uaCmHcKL5VkZvdm/unZPXX52/vKjp6vhU6Xx6j6etcelbTxbfw6AK6fGVLBybMx2
         Ee6tE87p8dD6BzYKMhcAhuSxPFpWj6fklc+JIXm4pA16J/13/pjdyz/SnEJ2+Nlrz0km
         VtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769243; x=1793374043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ulO8TPekTBB+OWa2HIRbuFwUD+ZmDaEZk6DpzvHpZKk=;
        b=V24n0pPWZjlQgj7td0hOGLtOuU6Lq5lKhq/xdUtH9hlSSCoLCKukwIfK5czOdQBfgD
         5nznXvFA3f5S9iPKdp+OAJ3cMkvtNwVsQecT1MK5yVZpmE4/wcdhPi60YOS702MIbpd7
         fJz2qE1flX13gfat7X77c+jBEmOg5gbSsxsQKDaAK4Re/0LHWs7DDwbVcpwTPioiQDZi
         +N4voaCb3AeWaSN47IFDCSGe3P/MndaiqP/Kvf20RTKXzDiZLB62iuCmLguzOhixutRn
         bLYTt7NU7XmSmQBGpL7Mc65bDsr01nWJrAPYMk8i9HgQhucZa6y5NnnkFZ3Bq89JcZl8
         83rw==
X-Forwarded-Encrypted: i=1; AKwUvBxXWAhXzJg5nPqBiIwrGtYf/zLWnRcxrzsu9fSNGKInhcVhMhFrzt6yX6j77AcYepMFNKYPF2Ok1xgcGg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIJh2yEFJG8R6AKZRuji7JoC9B+bFte1O5VR7ZheAh9A/3/4Quu
	Ynux7rZy+9zPM+jPQjxkLxOsRok//10aS7xTot0fYWWCHHIGOWsZz93fAyPi0/2jO3Q=
X-Gm-Gg: AYBFou0tbPaRq/Eu/ugBEFKl6f5n6Qj09c7Wl9UAM5fOHcLwjBy1AALE8eHkAb9uqFh
	k/rgjn2RA+DcZn6OA+QbA2Ytwko+JEI4w3fpbDjZBhj3bnbFUraew1l2UdmF3w0ygtEo+tWSCLi
	J8NRyvkETEPwtxXzxaEjbxqgiH39ND6pgR1+RNtnLZg3ua8k43Jwoic9ebmNtRh3OcThMgn7ARz
	7txfn0arZ20sloemLzz5PV2Bce7agHxl23KeQRDRsozKwjdTLzZbOt2+RfXReMkgpElXv1W//y0
	r4g/1wt372MS8q5TK1aHFPnMnEO6eHRvlgVaOX2SMUn+vEe3SZrrUEWXtjCTsNfi/LM0Hk/2Kqa
	B23w7Bhgdgwm5+fdq0SfoNj/pGgTJ2lnyuq3bHKb+tDoJntcrO+A+bRnQsuYe+e1N+pJhwq4oQa
	xMHymm/h3WKUBfDb9EP8qWnjtcVyA+Qpz2a30hRdG9EC+DWrKzJy7Hu1BBtaIz3PoYw0dvv5kT1
	KS5wxIEn7+Lsxr055FYoSIJtKbePk213tTXgSd8rEQY8Q9iICVD8qudJdggPPZ63WsalKE9raia
	7cM4p1ivr3c=
X-Received: by 2002:a05:600c:3542:b0:4a2:b73:d15c with SMTP id 5b1f17b1804b1-4a211c51a9bmr42977465e9.3.1792769243400;
        Fri, 23 Oct 2026 08:27:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2a92a42adsm11731145e9.3.2026.10.23.08.27.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 08:27:22 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] ASoC: cs43130: Drop only the clock reference hw_params() took
Date: Fri, 23 Oct 2026 17:27:21 +0200
Message-ID: <20261023152722.15912-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

cs43130_hw_params() and cs43130_dsd_hw_params() take a reference on the
internal clock (clk_req) and cs43130_hw_free() drops one, but hw_free()
can run twice for one hw_params(). When a stream's hw_params() fails,
soc_pcm_hw_params() rolls back the DAIs it had set up, the codec DAIs
included since they come before the CPU DAIs, and snd_pcm_hw_params()
then calls hw_free() once more, which reaches every DAI of the link
whether its hw_params() ran or not. Each failed hw_params() so left
clk_req one lower than it should be. An application that tries a format
the CPU DAI refuses before one it accepts then gets clk_req back to 0
after its successful hw_params(), so the next stream skips the switch
from the RC oscillator to the external MCLK.

Seen on a HiBy R1 (CS43131 on an Ingenic X1600 I2S controller): after
an S32_LE attempt the I2S controller refuses, then S24_LE, SYS_CLK_CTL_1
reads 0x06 instead of 0x04 while playing and every signal plays with
loud white noise mixed in.

Keep the DAIs holding a reference in a bitmap: a DAI takes one at most
once in hw_params() and hw_free() drops it only if held. A second
hw_params() without hw_free() no longer takes a second reference either.

Fixes: 8f1e5bf9b440 ("ASoC: cs43130: Add support for CS43130 codec")
Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
The double hw_free() comes from the core: soc_pcm_hw_params() rolls back
with rollback = 1, then snd_pcm_hw_params() calls hw_free() again and
soc_pcm_hw_clean() runs with rollback = 0, which reaches every DAI. Other
drivers that count references in hw_params() may see the same. If you
would rather that be fixed in soc-pcm, say so and I will look at it
instead.

Tested on v7.3 on a HiBy R1 (CS43131); build-tested with W=1 on
734bef548a96 (v7.3-7363). The set_tdm_slot() RFC I sent for this driver
earlier today touches the same DAI ops; the two only meet there.

 sound/soc/codecs/cs43130.c | 15 +++++++++++++++
 sound/soc/codecs/cs43130.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 48d88dad4ceb..325f9f0fccaa 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -820,6 +820,9 @@ static int cs43130_dsd_hw_params(struct snd_pcm_substream *substream,
 	u8 dsd_speed;
 
 	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (test_and_set_bit(dai->id, &cs43130->clk_dais))
+			goto clk_held;
+
 		if (!cs43130->clk_req) {
 			/* no DAI is currently using clk */
 			if (!(CS43130_MCLK_22M % params_rate(params)))
@@ -838,6 +841,7 @@ static int cs43130_dsd_hw_params(struct snd_pcm_substream *substream,
 		if (cs43130->clk_req == 2)
 			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
+clk_held:
 
 	switch (params_rate(params)) {
 	case 176400:
@@ -883,6 +887,9 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
 	u8 dsd_speed;
 
 	scoped_guard(mutex, &cs43130->clk_mutex) {
+		if (test_and_set_bit(dai->id, &cs43130->clk_dais))
+			goto clk_held;
+
 		if (!cs43130->clk_req) {
 			/* no DAI is currently using clk */
 			if (!(CS43130_MCLK_22M % params_rate(params)))
@@ -901,6 +908,7 @@ static int cs43130_hw_params(struct snd_pcm_substream *substream,
 		if (cs43130->clk_req == 2)
 			cs43130_pcm_dsd_mix(true, cs43130->regmap);
 	}
+clk_held:
 
 	switch (dai->id) {
 	case CS43130_ASP_DOP_DAI:
@@ -990,6 +998,13 @@ static int cs43130_hw_free(struct snd_pcm_substream *substream,
 	struct cs43130_private *cs43130 = snd_soc_component_get_drvdata(component);
 
 	guard(mutex)(&cs43130->clk_mutex);
+	/*
+	 * ALSA calls hw_free() after a failed hw_params(), also when this DAI's
+	 * hw_params() never ran: drop only a reference it took.
+	 */
+	if (!test_and_clear_bit(dai->id, &cs43130->clk_dais))
+		return 0;
+
 	cs43130->clk_req--;
 	if (!cs43130->clk_req) {
 		/* no DAI is currently using clk */
diff --git a/sound/soc/codecs/cs43130.h b/sound/soc/codecs/cs43130.h
index dbdb5b262f1b..b0dba903403f 100644
--- a/sound/soc/codecs/cs43130.h
+++ b/sound/soc/codecs/cs43130.h
@@ -513,6 +513,8 @@ struct	cs43130_private {
 	/* shared by both DAIs */
 	struct mutex			clk_mutex;
 	int				clk_req;
+	/* DAIs holding one of clk_req's references, by DAI id */
+	unsigned long			clk_dais;
 	bool				pll_bypass;
 	struct completion		xtal_rdy;
 	struct completion		pll_rdy;

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5

