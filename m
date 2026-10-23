Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792787385;
	b=ZtQypK1bmpB7usMASCh3cX9iLBNKWyQ6ar2A+vRQSiny0YiOn761w7nY+H8RunSC0z7m
	 ws8APe3VoHB0VhFS7OUr0biLI7lmtNuz1/QkhOXGm6RlyhLK2c4tI/9n5FgmadPvy992u
	 qDgVU49BvvA8NkgapWjZkHX0AxYTcg73JNzYCR+i69qyp0rkgg6bNEscP2Y3/1Aq9+DxL
	 HUw6scEF60tyAv7nDbu5RJ5SNIr7AcEjGiiAcxYv9BcOnTUezUoHO+A+hVxGvBzh8Fmmh
	 iSEplrMn9Rhti1Fy29qwm/LlIKDcwSkEdBxlsUo+J4wW62f8s5/4bH7fLI0xNJGFMOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787385;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GgbJBFlyL5VJ+u9+6kLgrJgW6qsgKW6r992B04iJnzw=;
	b=SLRxmsGXddrTfjI82EBftj+bCqoyGfYCNEUVZQoEkHbAXfM5t4x/U5svcLoJkv7FsRHw
	 q2E7YCLwayXKcWrwkgmOR5Pq59Hq972j+ykiJq+SIinY2b9V/PSHJkE6ZbLl38UEoaHao
	 qwdXIlVVie2j1nAdQXynNtJ3FvOhknFaGz1ce3oNQYhcgUfv5a9a0V8znzL7/5a72NTSo
	 H4JEVyJv03ToSvu24F9Wp9qOq02HMiNKvw+qsj5YgKFgcdpOIwNKIGOhWNzQxHOtKAle2
	 X8CRxraayq8BdCSuD+W3nJpGVZevSkN1c2VpQhCqiCGjW6ZpnXDPdvH04SOfKLasvig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=OEPgxxXF;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606B2606A31A
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 20:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 606B2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=OEPgxxXF
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48df54150dfso715501f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 13:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792787383; x=1793392183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GgbJBFlyL5VJ+u9+6kLgrJgW6qsgKW6r992B04iJnzw=;
        b=OEPgxxXFrbIlaVDj1Db4CK4E2gGqGIJxdfn9bjPKquaJY1Om3b77x6jO/i/Hh1xX5Z
         NbSoBfPu8Xa7udl90ai8dtTgIfLjWUagCiKxiJGax/QR3N+KzsrNd1oDtjx2btHvwOxV
         sY7AEtHMD71MJeO0PgXNUwCiY31NvysM/OqgO+2xJFB3YVeFWaR1vhHlRgFgxbjajEXr
         ll1h54ylG1KDe2/dim0NH6Oz0LwI2GkVSBEg9ZjkgzTqgKA7OKYHIeMS8y3AnWFZ3HgH
         Bft+Ni6ydF/GGS8PblvWmTDxQrA8ydYo3L6/oe5u9YsWVGXLJYeojftXQsUEnB4/olD6
         8EAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792787383; x=1793392183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgbJBFlyL5VJ+u9+6kLgrJgW6qsgKW6r992B04iJnzw=;
        b=oUEPAtRsyPUoC1RBUzc+ZjHzO96IxE2ybAJp0YUTt8VjKW36HCiQsiP+HgKHPLinfI
         dJGuphgsBRvvUO8VSU2iZOlLXG9xFyDKIVxsCohdwj1LiKf4me3icoGF5Lj7zMPE6v6u
         wq6ALLdHS7kj8yGYtrLDj7/DVetI4KwmFi+IUsKFx9w1zQQi1M804J/Sbz7XBHVXMszk
         9xUZ1+qPuCeDf+Z3ipIvKhX2EFheab+MSzok2inhZMP2P50rcb3ATyaSmtR8IaS5EkjY
         A0jpQ4+H8aYMkX4XV65+zBuMZ9J1PXmpYMOiOZmy0JK6TWJ6J+F6jqBYSQYYa8CkJsn+
         fZCA==
X-Forwarded-Encrypted: i=1; AKwUvByOvD6DkN4O+dPHeqydNWxEph4hhuMWsI+Bngzrrym1zESPtyjsVkUKSmf3W3PgBruePtatTN50JyO9YQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYImMG5YVqXMdz2qWzV6PSEPWdIH3j+i21YZavWnC5l/FxzCS6dO
	RcJuap+wBfU2n9l0v4dtVnVzFNsrm3+uvw0RaijI36T//wv1ho489ZA4wPUkUEDifgY=
X-Gm-Gg: AYBFou38FabKp31TnFsjFQBpQ0p2IPgFq/35D5falDdtkjjeuBu9F3niqLyNQODLpVn
	Vq4SxHW+AXo2a/XhcxvIqccjX7pocit0YMDFe7MtstsRl4m1FmbMeQqkjvXhn/DrrKQpdJsfsqK
	tyPQ3nrcZw3IbGK9syUYc8qfGT5twpPCOSQBvM1xupJD3nOXWFK3U1IFbQzCs5eYhvhEyZnkjVr
	/XgP7t7j0c5i1m3xm9dbNC8bGvvQSnlXWeTXatCLr3DwfbQZ9IH8ZX4VaKmcC+kYdercgk0mWZ5
	Ylb915KhJrbkDeRVpXVAy3Nhc1DR7P2bPYE7BjxO5+NoYdou7/Hi+kQavb3xcL469EZTYx7G8vO
	K7Qy+z2HsOGTjsgxiSp8g+sicTrcLKnPflmVrW0DaEU5MNy7gl3aUqseFRfLcGLpRCDA+b9JEPQ
	NLONmkk/4O8XdX38d0cN0v97KRV8sljbI44itQfPXLU2QApq12lRnnh8slOK9x4ZK8lgbLA3iVS
	4kgiOwecJr8Vbv8Qd4Rbao98Jm90mmQcogX/R3A60F6NhebejOOiZlX+16SDsg5A8lR7lEK2z6m
	Y9JVkndB8xV2Da+NC7cplMpGeJkwIkB4
X-Received: by 2002:a05:6000:2dc8:b0:48a:f073:336b with SMTP id ffacd0b85a97d-48e3eb88c9fmr166733f8f.23.1792787382528;
        Fri, 23 Oct 2026 13:29:42 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7c3sm191708f8f.51.2026.10.23.13.29.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 13:29:41 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/2] ASoC: cs43130: Drop only the clock reference hw_params() took
Date: Fri, 23 Oct 2026 22:29:40 +0200
Message-ID: <20261023202941.87999-1-olivier@mgcrea.io>
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
Changes in v2: rebased on broonie/sound for-next (8cf9607d2d85), where
v1 did not apply. The conflict was only context: the
.auto_selectable_formats lines now in the DAI ops. No change to the fix.

The double hw_free() comes from the core: soc_pcm_hw_params() rolls back
with rollback = 1, then snd_pcm_hw_params() calls hw_free() again and
soc_pcm_hw_clean() runs with rollback = 0, which reaches every DAI. Other
drivers that count references in hw_params() may see the same. If you
would rather that be fixed in soc-pcm, say so and I will look at it
instead.

Tested on v7.3 on a HiBy R1 (CS43131); build-tested with W=1 on
for-next.

 sound/soc/codecs/cs43130.c | 15 +++++++++++++++
 sound/soc/codecs/cs43130.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 7bbb2e83a1ff..7fb23522f081 100644
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

base-commit: 8cf9607d2d855629260fc78e6b54ea7a98525708
-- 
2.39.5

