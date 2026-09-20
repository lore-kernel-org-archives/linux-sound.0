Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3523CB541
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880175; cv=none; b=Y8BF+1KfiKTGQrF/9TuK7bJ4iXtcV4sFZm2N3irBmh31i3QSZGg/bAoFoXNcPOchLXZzgLjPmKrwSGIFm9ekA91HQ1E+yuAgejf56z/JGadngdQjnKbSd+MpdFiTPeFIWhuB3M+oJcnTZCkY18TSeugrlSLcF6AX0ZGJfN9YxFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880175; c=relaxed/simple;
	bh=N7Gm9GhSadDaVeGyGSMSt56iAjPKqX+nSRnxDMmatR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LBLY1zNMuf+ggqmuYR1/VrEseyapjkGY0vJcfs/91rEreg/pDrzOPDIpiqR0aoAGY7ahhqT0sXiTIyvAjOn1H38bSv9O4vKWxeuEg6H2i0NZSBaQuFMc22b/9hQWeYZ1zLH+bG0et5GrSZO6GEcpFKTHWkFyiCvSQYMfk1vFo4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6aDLreB; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6aDLreB"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300825so20378555ad.1
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880174; x=1790484974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4y87oy6OKAiqnu/jIL3XduDUN3BGcMssQM5AWBSQLw=;
        b=d6aDLreBwnNoeagsPLbdIA6REqUcqrcDIcmOM8YkT91UwYk7tO85AV/rs5jpwlwqSU
         an/W2jjODuTXHnUfUgXBD7DTKaLVW4JDXwDgCWNCqy/nk25mrzkHMxcUb31WwLfQdnk4
         usLVb0pu9EjuRAFDQKmZ263x13wb2u7cq96SHpfw5xTu+Wgll9BE2sfcKvzBIedr9HKD
         e2bJuXJux7BXjZqOFCVZps0qNiMrDeDQEHlvRHCplOBeHvJnsIzoNMXe6vaSuBBaIK+S
         UtJ7kkR9Poo0aTzOoJW0AXJATnL+WVLD74xCQsZ+loCd+E8S5UHOBM9PmSTkBoYgsP5+
         SCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880174; x=1790484974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4y87oy6OKAiqnu/jIL3XduDUN3BGcMssQM5AWBSQLw=;
        b=1Pvyot66RPuVx4UQjUgSDJXqRBU0dJwVll6ZY8qQs9udu+HmtroNlzfWSJ/QTy6Vbh
         mTRw/jQHujw+2Nj1JFjry8lLizm2FFEWLrdLJPhzpulIHivogU5qjc2IPahpcZuEilKL
         hAtcDpQwEUvfy09vkvcmBrRlNBzS2GnbVBYPTeL41BDxJt5uUTiMuPGd/A/P8RhJGni2
         BCs9W7t1tooUmyVatgjgOJbpxk4zDcToG7UKnQbThrMzqU+FbpQ9gDQDDLBtPQpbt70t
         AS8h04xuTRsvzoW0P9agTBocrqQEwgaCn3WEfANT0ChK1rzjH1j+GY6XSHP/UEuYNXtF
         8n3A==
X-Forwarded-Encrypted: i=1; AKwUvBwFsFAFwsJjtNqEuHUmtonWJaT91jOFngKvPu8Kkc0opw0Kx1SZu/o6EkWeANh64oM7W9P2NiAW+K5opA==@vger.kernel.org
X-Gm-Message-State: AFuF++mZUZSWrSYOfa1Xon7DkooAIZKDsj5ipE1ygya+XOdmSxYIWk21
	dpRwP1+12ufNlnaWDfdkHE4U+UpcCBtKT2X5oyFU+phzpsWhQR84AUJd
X-Gm-Gg: AYBFou0Bx9h/j9WNXhaDNaT9ycrqTXMqdZWi26ONXEPAtrL+yCNBoLcarl2fuwr9Rzg
	1JaC/UXwlvAQKa/TE6wJ3Y8NsZSAF6WYukZWb/6fXgfrOuYllX5iPArhdVmp1+UC96zILeLyUvO
	V2q5Yq+1w1suR0+ar5LKMUPLEU+5StK2YJXM2yyroUVrimebwwT+RaMbeXuWp6/56j/Iw+y7nxX
	4DczaTkGVJVkjNuUUgbFCF2DlXTycqULyef972oMA/SquEc3jusei4IQnYs/c5n7NO0zWPgIxcw
	/lNQKbuWQRWzPDP5U7CIxw5K4AonDWrFpO1jDHCseCv6x/uTbgrYFCMlnqireQB1l5Y5+fV+zkd
	H2UoKApcxMcQPZ5yGGZ6d0VmfNh2zlb1HHpCjjks0OBV8fMYrse0dst9/XBNhSeZ3J2kEe98xuO
	0GGoQQ8QyURdoKrKGM07vVz6WjhJBNwsJH4gflGYQ450yWYDjbuJ//jzKze3pLWpLq9FNQxsLk1
	enooYH45jnyjij+z69UMeZYWkXoxA8gkMcgJ9po6Rtehazlwyudb344NK6me3Oi0b+zof8DRBnb
	KUijnSXe+1Ux0UMfBqGkbGTy7f1LBfzh15k2ti8fW8O7IbI=
X-Received: by 2002:a17:903:b48:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2ddb1adc353mr126021925ad.7.1789880173735;
        Sat, 19 Sep 2026 21:56:13 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:13 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:46 +1000
Subject: [PATCH 07/28] ALSA: Support nonatomic dmaengine PCMs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-7-741cc20a74e5@gmail.com>
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
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2677;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KObS9Pt9I+T74LqcNTQHQ5cFB2c2q8qsj/Np1ljqwI0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xU2+4Xv/r+xROS6dVFDzcSiOyfWXf7+o3x2v8XN+
 f7e1oJ/OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFP9+xXDX8GZ9xRU9+7bXXMt7eK5Zew5L14t2sB48Drv779sq+Sd1d8xMkxZv9d
 N4ur99eJhaqns17xjBA3fHwku4TzRxB7rpBbQwwsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Add support for nonatomic dmaengine PCMs.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/core/pcm_dmaengine.c | 32 ++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index e59b561b849d..839ff2711f5e 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -22,6 +22,8 @@
 struct dmaengine_pcm_runtime_data {
 	struct dma_chan *dma_chan;
 	dma_cookie_t cookie;
+	struct work_struct complete_wq; /* for nonatomic PCM */
+	struct snd_pcm_substream *substream;
 
 	unsigned int pos;
 };
@@ -147,6 +149,24 @@ static void dmaengine_pcm_dma_complete(void *arg)
 	snd_pcm_period_elapsed(substream);
 }
 
+static void dmaengine_pcm_dma_complete_nonatomic(struct work_struct *wq)
+{
+	struct dmaengine_pcm_runtime_data *prtd = container_of(wq,
+							       struct dmaengine_pcm_runtime_data,
+							       complete_wq);
+	struct snd_pcm_substream *substream = prtd->substream;
+
+	dmaengine_pcm_dma_complete(substream);
+}
+
+static void dmaengine_pcm_dma_complete_nonatomic_callback(void *arg)
+{
+	struct snd_pcm_substream *substream = arg;
+	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
+
+	schedule_work(&prtd->complete_wq);
+}
+
 static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream)
 {
 	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
@@ -169,7 +189,11 @@ static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream)
 	if (!desc)
 		return -ENOMEM;
 
-	desc->callback = dmaengine_pcm_dma_complete;
+	if (substream->pcm->nonatomic)
+		desc->callback = dmaengine_pcm_dma_complete_nonatomic_callback;
+	else
+		desc->callback = dmaengine_pcm_dma_complete;
+
 	desc->callback_param = substream;
 	prtd->cookie = dmaengine_submit(desc);
 
@@ -322,6 +346,10 @@ int snd_dmaengine_pcm_open(struct snd_pcm_substream *substream,
 	if (!prtd)
 		return -ENOMEM;
 
+	if (substream->pcm->nonatomic)
+		INIT_WORK(&prtd->complete_wq, dmaengine_pcm_dma_complete_nonatomic);
+
+	prtd->substream = substream;
 	prtd->dma_chan = chan;
 
 	substream->runtime->private_data = prtd;
@@ -361,6 +389,8 @@ static void __snd_dmaengine_pcm_close(struct snd_pcm_substream *substream,
 	 */
 	dmaengine_terminate_async(prtd->dma_chan);
 	dmaengine_synchronize(prtd->dma_chan);
+	if (substream->pcm->nonatomic)
+		flush_work(&prtd->complete_wq);
 	if (release_channel)
 		dma_release_channel(prtd->dma_chan);
 	kfree(prtd);

-- 
2.55.0

