Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391976;
	b=WvQOI7WmNVMEsk+j4Cck1VfeT3N9vFrPXXeukN1TOoC22nDl7VOLDRbDwedJ7n4FAHPx
	 w0X+jSav4FTmni+a8qrcYevTXOINekTpeHR28nXlIhXYl2E1J1wWeaxzPUmqodqndBlUO
	 0PvjxmA9AAQ12snbyYhPcAxo8jGH7hcINVy+OYVozkxFr4fPKqEH94CN3rI4NUi5R1UnP
	 IyGROmFg2s7ABGZAEhP5DrQe0FtBPb+Tg5vtr2cgHGajZb1wxKFj+Qo2Qa3v4C+1dSV8O
	 CoFB446nBrFwp6uFpOXoZ386SighYNiziD/lROcG7fJ2GbhW7SGh2FywqUzi7ac790A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=n3v1AgR+CHCMi0QrlArcix8UUVt6MgDpIHZcAPaGD/I=;
	b=MZKm2JIxe+PChpVWFylwZptKM6zNi1o58FxsYO/zL8LhEd0GnMO6PCWcwdpLSe2vA3kD
	 tyduZ0JkBKsaQ7ysp4Ug3R8ugW8xVg6kv3Romaa9KQjiBLwZlM4pWsxaEdXOob4rzEOP4
	 2UVfyfdUSXv75t29xUKKjjgf1g+LxxAEuY+u3tYWrwc5ZixItKN/LEhj2fv4QB0iFHaok
	 7smfHxd8/Jgajf1Zy6v74OViwjDgPYQ04yItN13FyZNEZGcqaRbd5im4/KYZiVGsVivK5
	 vJLrvdxwOHn1ysDCDxfUEbSP+LUownaH+fpF2IWm2mhT2k0zNYhCZci43Z/xtpQcLbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W5pBskQy;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C97606A321
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 10:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C97606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W5pBskQy
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso28741915e9.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794391975; x=1794996775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3v1AgR+CHCMi0QrlArcix8UUVt6MgDpIHZcAPaGD/I=;
        b=W5pBskQyFgi5GqCuy+i2ozI+skZ24DZK7z7acKRm58KQ9eVXKzfa9GWqNP+Caz2c5e
         TEumgVvMeVYKxJBA/Be4pGa6hILpvjhqMMdFoMzDn7rGm3dxiTLJHB9h09f8UwRlZsQR
         4C2rK4wSnc0w0gyTC5VGzz2JZzSZfOVJ724/8ktaoeg39miuYrdSVUdVfrmOIouIFyUf
         XXJDVk1YVJMlh/sxxzvu//1DpkGCyAPRdOmvoV48o9UDxfAU5+s7AJh+25/RPkUF2lo1
         ThXxnX26bIQFUi4CqXLZry7UfWZOHz9aRKlLOXZ9S3UMv4t5867opROfBEdzQc9d9751
         21IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391975; x=1794996775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3v1AgR+CHCMi0QrlArcix8UUVt6MgDpIHZcAPaGD/I=;
        b=aOL5dEMTrrzvWfUsUOp5AXOpmH6p8Hy66CYzUA3WKWLGZ5E/HFG/vYnV93SyZd572d
         6PSM7KdjDW+sQqHCl83jbdFy1R1+5jUgabxVKLmPuKeJgVRYAnZLLQymQ1nmix4gJllP
         yNfyS+Sk90dwS/II3JZS9QSfq7rOM0EPrEsGsRR8cc2ofhGrWgJP/zskCpx0QGwDNpVK
         SjLHjlvhcBakTze4svoIlN0vnX8sFpyEok1/4qFUEFiVd8f4llVLPxeuF5pcT5vYoGf+
         prDhd5wdcAeVQoHg3X4auUKZVaJ3Au9G4/wyqRrdmpeJgKlB4TatwtlarFfgHVeyIg40
         Ba9Q==
X-Gm-Message-State: APuU4Z/yeUFxhojGhlmWrljNfNReKFJE9i63tEYZ8GQpomt2ND11uAsQ
	pWuBTx391Y5go7Q6UqSt/d2dX53PwOdXOBuS7Cr2o1Wy4TtjW7PsrsYRV2WQCJps4Lk=
X-Gm-Gg: AYBFou2wYGEmxxA3sXZcxRevFTh3bDRzskkf0dvlIgUGF8Sa9q2mFhNxWS2Wj4D8dJP
	iThJ4hA6aUiki+obH0wE8qy+tt0TdpJiSzv/XokjPqCmAvAd/3s77uLiTNK4HRTvPyy0H2Bw0gL
	GSc7MGwQeNU4l7+gp+DF3i4QgawQXrX3weN9yabE4umSK/0SgCK4Rq+yZ0JPAWyj+6owbNbX5yZ
	vOdk1c1jjVsqiPnyB6AVkiX+J1PM3hhBeblYkS7M0Gn+vVn/dJI27ZERL04uPuqaE9DI+1Nl/Sp
	6v8EWP4L8VuJFfrY3MJY8Tk5sLO4vvGSJrQQvka4D1BStT/Ds5eUClnnihEEgwXlIxn49TEeQ7r
	uOVYsPTO5jFtCzbpbUiF/8qjnquw2WdIYdi5Czrp7ul+MTGxmbDj3HpLOoUAZxCUzMwuo7W/ErD
	LQCC6E35KKDbVv3HIamqtdePyFAEM/To41ZwV9q2N3EcoWK5xaB+ennJd5QfUNOQCXoeO93jtGL
	Gc4i7ozbVAq8lYBgHOL0LzbYugr71dC9ZP5K+utSiTUFzfeBTVChm0K/qNfZdL9fM+HFqu3rYD3
	HFOi+gr40h2/DIxBKOsaVNWwZptk
X-Received: by 2002:a05:600c:1c0c:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4ba091a5bcbmr39187675e9.0.1794391974882;
        Wed, 11 Nov 2026 02:12:54 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm124194375e9.10.2026.11.11.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:12:54 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 11 Nov 2026 11:12:48 +0100
Subject: [PATCH v2 1/2] ASoC: meson: gx-formatter: change stream lock from
 mutex to spinlock
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-gx-formatter-use-spinlock-v2-1-763241aeca52@baylibre.com>
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6296; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=AM5clnX3PNR8b5jWnSWhqcd+0TC3ywf0Ls6D1xVD6fs=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlf7JeIHVcOnz7ZzPIyH2f50x0x+8PPf/DoePR8k9ufw
 zLV7aJ8HaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZiIUTDD/1reef7JW5+1Bdr9
 i7g0jZvR+o6h2ivt1hsPzj076tSo+pThr2jr82DTQ63bXtSc8syJ1tBtc+AzO5/8lIvLXs8pYI4
 iIwA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Currently a mutex is being used in 'struct gx_stream' to serialize
access to structure data. This was inherited from the AXG design. An
important difference though is that in axg-card dai_links are nonatomic
so callback functions like 'trigger' are allowed to sleep. In GX instead
dai_links are atomic.

For example, starting playback from userspace with
'CONFIG_DEBUG_ATOMIC_SLEEP=y' results in a warning message like:

[ ] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:316
[ ] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 272, name: speaker-test
[ ] preempt_count: 1, expected: 0

due to the following call stack:

snd_pcm_do_start (called with spinlock taken)
  dpcm_fe_dai_trigger
    dpcm_fe_dai_do_trigger
      dpcm_dai_trigger_fe_be
        dpcm_be_dai_trigger
          soc_pcm_trigger
            snd_soc_pcm_dai_trigger
              soc_dai_trigger
                aiu_encoder_i2s_trigger
                  gx_stream_start (takes 'ts->lock')

Fix this by changing the lock type from mutex to spinlock. This is safe
on GX platform because all formatters' functions only perform MMIO regmap
calls that do not sleep.

'spin_lock_irqsave' is used in 'gx_stream_start'/'gx_stream_stop' because
trigger runs with IRQs already disabled and stop can also run in IRQ
context (e.g. in case of XRUN while executing 'aiu_fifo_isr').
'spin_lock_irq' is instead used in 'gx_formatter_attach'/
'gx_formatter_detach' in order to prevent IRQs on the same CPU that might
end up calling 'gx_stream_stop' and therefore deadlock.

While at this also improve 'gx_formatter_detach()' by moving
'gx_formatter_disable()' under the spinlock guard. This makes it symmetric
to 'gx_formatter_attach()' and ensures that the prepare/enable/disable
formatter callbacks are called with spinlock held.

Fixes: a295be8d6210 ("ASoC: meson: gx: add gx-formatter and gx-interface")
Signed-off-by: Valerio Setti <vsetti@baylibre.com>

---

Changes in v2:
- Moved 'gx_formatter_disable()' under the spinlock guard in
  'gx_formatter_detach'. [Martin]
---
 sound/soc/meson/gx-formatter.c | 22 +++++++++++-----------
 sound/soc/meson/gx-formatter.h |  4 ++++
 sound/soc/meson/gx-interface.h |  3 ++-
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
index 2d3218cce426..d3bc0c6c81cd 100644
--- a/sound/soc/meson/gx-formatter.c
+++ b/sound/soc/meson/gx-formatter.c
@@ -61,7 +61,7 @@ static int gx_formatter_attach(struct gx_formatter *formatter)
 	struct gx_stream *ts = formatter->stream;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irq(&ts->lock);
 
 	/* Catch up if the stream is already running when we attach */
 	if (ts->ready) {
@@ -74,7 +74,7 @@ static int gx_formatter_attach(struct gx_formatter *formatter)
 
 	list_add_tail(&formatter->list, &ts->formatter_list);
 out:
-	mutex_unlock(&ts->lock);
+	spin_unlock_irq(&ts->lock);
 	return ret;
 }
 
@@ -85,11 +85,10 @@ static void gx_formatter_detach(struct gx_formatter *formatter)
 	if (!ts)
 		return;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irq(&ts->lock);
 	list_del(&formatter->list);
-	mutex_unlock(&ts->lock);
-
 	gx_formatter_disable(formatter);
+	spin_unlock_irq(&ts->lock);
 }
 
 static int gx_formatter_power_up(struct gx_formatter *formatter,
@@ -212,9 +211,10 @@ EXPORT_SYMBOL_GPL(gx_formatter_create);
 int gx_stream_start(struct gx_stream *ts)
 {
 	struct gx_formatter *formatter;
+	unsigned long irq_flags;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irqsave(&ts->lock, irq_flags);
 
 	/* Start all the formatters attached to the stream */
 	list_for_each_entry(formatter, &ts->formatter_list, list) {
@@ -228,7 +228,7 @@ int gx_stream_start(struct gx_stream *ts)
 	ts->ready = true;
 
 out:
-	mutex_unlock(&ts->lock);
+	spin_unlock_irqrestore(&ts->lock, irq_flags);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gx_stream_start);
@@ -236,8 +236,9 @@ EXPORT_SYMBOL_GPL(gx_stream_start);
 void gx_stream_stop(struct gx_stream *ts)
 {
 	struct gx_formatter *formatter;
+	unsigned long irq_flags;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irqsave(&ts->lock, irq_flags);
 	ts->ready = false;
 
 	/* Stop all the formatters attached to the stream */
@@ -245,7 +246,7 @@ void gx_stream_stop(struct gx_stream *ts)
 		gx_formatter_disable(formatter);
 	}
 
-	mutex_unlock(&ts->lock);
+	spin_unlock_irqrestore(&ts->lock, irq_flags);
 }
 EXPORT_SYMBOL_GPL(gx_stream_stop);
 
@@ -256,7 +257,7 @@ struct gx_stream *gx_stream_alloc(struct gx_iface *iface)
 	ts = kzalloc_obj(*ts);
 	if (ts) {
 		INIT_LIST_HEAD(&ts->formatter_list);
-		mutex_init(&ts->lock);
+		spin_lock_init(&ts->lock);
 		ts->iface = iface;
 	}
 
@@ -272,7 +273,6 @@ void gx_stream_free(struct gx_stream *ts)
 	 * are removing the TDM DAI. It should not be possible
 	 */
 	WARN_ON(!list_empty(&ts->formatter_list));
-	mutex_destroy(&ts->lock);
 	kfree(ts);
 }
 EXPORT_SYMBOL_GPL(gx_stream_free);
diff --git a/sound/soc/meson/gx-formatter.h b/sound/soc/meson/gx-formatter.h
index b90b1814d79b..9f5a1720481e 100644
--- a/sound/soc/meson/gx-formatter.h
+++ b/sound/soc/meson/gx-formatter.h
@@ -20,6 +20,10 @@ struct gx_formatter_hw {
 
 struct gx_formatter_ops {
 	struct gx_stream *(*get_stream)(struct snd_soc_dapm_widget *w);
+	/*
+	 * Following functions are called with gx_stream->lock held and local
+	 * IRQs disabled so they must not sleep.
+	 */
 	void (*enable)(struct regmap *map);
 	void (*disable)(struct regmap *map);
 	int (*prepare)(struct regmap *map,
diff --git a/sound/soc/meson/gx-interface.h b/sound/soc/meson/gx-interface.h
index 2a6207e393e8..a6a5cc9e7af0 100644
--- a/sound/soc/meson/gx-interface.h
+++ b/sound/soc/meson/gx-interface.h
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/regmap.h>
+#include <linux/spinlock.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
@@ -24,7 +25,7 @@ struct gx_iface {
 struct gx_stream {
 	struct gx_iface *iface;
 	struct list_head formatter_list;
-	struct mutex lock;
+	spinlock_t lock;
 	unsigned int channels;
 	unsigned int width;
 	unsigned int physical_width;

-- 
2.47.3

