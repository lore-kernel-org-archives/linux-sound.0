Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619533;
	b=Kov1IQ6rkK8IYN2Ps1DDLrBOUtuDDpGrCbJClFbijgpY/Vb3nIiDUL/mI2ylZjsX91+p
	 x0/xk6eARpOgK6tNi+z4wZXH6JTzJMn1gWxVTEiTFEJ3FqYTLEHQGLh52tP3hE8xSL7Ab
	 pVEEiPZFoPyJY8oB3gkZIgMaF8gMY8NKF09MvJvvVaMRKQjqZRFDlhyTfp0bpZmzRRBVa
	 Y4GUcz/mius1Ri1DOGAl00VNWATMJYf9ObPr1tuLGPkWXjAwsXTKhDUvVBcJWac1eo2+C
	 /tCzCjjNcJd1wzYgWu3snU4HKsE5DQZDRTrmranVjE8gji13wavyJIM5Jj8SHAftRsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=+e9kTl0gTJdhkEEUdGkZ8+xd5uH94iYTy0NqVjeDG4Q=;
	b=FDdHj9e+ZdrEefHS7dZzuHNc4BC+4TMgemJdTKy9E55p7+anKjGTHM/Rxerw56SvseT+
	 X+8YnQ/xIAjbgGTgc0/2pByLJFcTS2NaH/nKn7CRS8vYqHy5iHi1LvdgQhqmTc8dNkXdd
	 n52dofmAmZBSpFYLKPZDernu2GTg+xd6/oZFA7a3RuH9fzlrjeEORVskRiJkdH8wmuZE/
	 VZWs210lRU37Tx4kXlW3nkuqifeuHxyGy1OLTYZ2mDdjEbNnY9ZBcR3t0g/taZneJZWvF
	 VKFXpRam9LJCAN24/NENmBFO6tfpDvWvuEpXEnrjxOE0D8lkvtvAw5koJkVqB0zMi1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AdxdjyxL;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8BA606A31A
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 21:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F8BA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AdxdjyxL
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so1621155e9.1
        for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 14:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792619529; x=1793224329; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+e9kTl0gTJdhkEEUdGkZ8+xd5uH94iYTy0NqVjeDG4Q=;
        b=AdxdjyxLeSlf+obyDYfEbqunpkqqNzl6wbQgc5/AbXmc9cKvrsqHRlaqfIfkpRXNGC
         /JouS00lBfXcqOhxHlHy7L8sdkyHEHG4mab+2fxMEghgKxmTGGjrxySU1KGMN4wnanUj
         gKWSVSjMzVpR/Mp6OR9f5T994jDvJ+g7pcZfJBdYuHZd6PvgyLSkwOD4azX6lKwn7alJ
         xfrfySHpSLt4iUQR+bNt5qf6WHuaW6yUtf3lOPkrFXLjpt1Z0o/8W9flYj6gEcVkx4aF
         NzEDdo7Q6ghv/7P2vOmSjLVtCXeamrUzToeoc2elWeqMwNwYJnfhQp1YdOt2VGaeUMm2
         TLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792619529; x=1793224329;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+e9kTl0gTJdhkEEUdGkZ8+xd5uH94iYTy0NqVjeDG4Q=;
        b=yI6aptmtir8jvNMjhwsY4y7G/TYeJ7rhx7ly1iZJy0QAwbsVi9OMTlK56MxkgrvOga
         CcszqqCL+JcVIZRSL5PcQ8BAX5n91gAY/tggbqYzUzwtA3h0PTyWrCh4KnGEzy1Gp0r7
         XMBqDnqqi/66sllSLS0N22pr9WAuBlkOvL3tbZez7LTUxF3TxE8mIqEkt15G+M6wrKaa
         mJ72SoHwhUHuYwjx1g+ncI1ms3PbH00g9GXwek4iB7LULO1eMLqDfyhkq4pzhbL0+OrJ
         FavsMkzGa7nCPQa4ByQouXF7s/qMT35z25JdbISykh6U4Wd8qb7VRHdvjJocmv6oEGzn
         NQSA==
X-Gm-Message-State: AFq9FYKwSFbJkyDfEM2YDu4/Vv3Y3RBltlihe6Ak/6dIvAy4Uaved28F
	g/ZE1zHdYtxqHKKl3sV2EtPWdYDisX/Qe6Tk5c9JOiV687zYmf7k1JGJFd9u+mvMTkU=
X-Gm-Gg: AYBFou1IzbWNUUlx8tiu7RF0Kapbtvkin+v6AKxwa9A3kIXWwFZrbAIzY2d2/m8GajI
	bLQfUJGcbKZ81MSgrpKMRx6RU5r+xYh1HwIeU079g8zd0FJy7t91iobLz6GA5P2QnwFBhrtl8eI
	Hh1DiqJUWhqhUtPKowVYV1duHr3NdPVQ/M3HK0EL860Dk8HjzihD02163RPMPOeVsc832p5hv8U
	DU/VU1s9BHkv4D1cCM47/5KZ8aOXyfdQmY7+xk7KqEHwQygo4eJtiFf/Fjf1FujfVpmkLzJwO7T
	/FXnMyzAXGZWS1I8qrGUfe4/LG4G5Ndhxa5TnymcW42fiHPFbVHFKuLmCr+Z37GVRZKG8pFyS4J
	sYq6+Igfz8LIr1KE33SBEZp97Lo11xdCWRRJGUA5QogfP4CJamxyhhqKDNe6xbRtQZUui1jLRFA
	B9v9ZY73rdPDi7Nvyeesi12jPOCFRBiI+NtBDtuRt/UcLo99F2LT0Df3UNzIRkR/I3yeBisMr15
	QSMIYuxphMDD6zsyC9+81VCd2s97Udqw9Q9NjV1bbfCO0ZaAZPi5g==
X-Received: by 2002:a05:600c:84ce:b0:4a1:e84e:e38b with SMTP id 5b1f17b1804b1-4a204beaabemr9343955e9.11.1792619529563;
        Wed, 21 Oct 2026 14:52:09 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581eed3sm8840888f8f.12.2026.10.21.14.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:52:09 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 21 Oct 2026 23:52:04 +0200
Subject: [PATCH] ASoC: meson: gx-formatter: change stream lock from mutex
 to spinlock
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
Message-Id: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAM02WoC/yXMTQ6CQAxA4auQrm3CVELUqxgXMHSw/syQdjAkh
 Lsz6vJbvLeCsQobXKoVlD9ikmKBO1Tg710cGWUoBqqpdTU5HBcMSd9dzqw4G6NNEl/JP5FO5/7
 IxE07BCj9pBxk+b2vt79t7h/s83cI27YDiy5IKX0AAAA=
X-Change-ID: 20261021-gx-formatter-use-spinlock-289b3e2e46df
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6431; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=JmRd5q70Ih5GAyDXoaeuH8rg99srkjjU5+Roj8RNuXY=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFk3TVgrPsseYNlbFfzT5cq6NWnHI+9bpW4V0L7TcP+7/
 8Y9Oe4rO0pZGMS4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCR1ToM/6MM7+31tMsTVfht
 Xu6XyFvGbmLPEGt/YglTRfWuFSrOFQz/KzPaXc+fXLfW2v7plm9/O+9Vq/XPWGM6aU5grWH6qRY
 +dgA=
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

Fixes: a295be8d6210 ("ASoC: meson: gx: add gx-formatter and gx-interface")
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
This fixes a pre-existing bug, present since v7.3, reported by Sashiko [1]
while reviewing the series adding I2S input support for Amlogic GX
SoCs [2].

[2] depends on this patch to address Sashiko's comment.

The commit message provides all the details of the fix.

[1] https://lore.kernel.org/all/sashiko-outbox-176054@kernel.org/
[2] https://lore.kernel.org/all/20261018-audin-v5-0-4b8cc13a1b22@baylibre.com/
---
 sound/soc/meson/gx-formatter.c | 21 +++++++++++----------
 sound/soc/meson/gx-formatter.h |  4 ++++
 sound/soc/meson/gx-interface.h |  3 ++-
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
index 2d3218cce426..6b4155f9f05e 100644
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
 
@@ -85,9 +85,9 @@ static void gx_formatter_detach(struct gx_formatter *formatter)
 	if (!ts)
 		return;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irq(&ts->lock);
 	list_del(&formatter->list);
-	mutex_unlock(&ts->lock);
+	spin_unlock_irq(&ts->lock);
 
 	gx_formatter_disable(formatter);
 }
@@ -212,9 +212,10 @@ EXPORT_SYMBOL_GPL(gx_formatter_create);
 int gx_stream_start(struct gx_stream *ts)
 {
 	struct gx_formatter *formatter;
+	unsigned long irq_flags;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irqsave(&ts->lock, irq_flags);
 
 	/* Start all the formatters attached to the stream */
 	list_for_each_entry(formatter, &ts->formatter_list, list) {
@@ -228,7 +229,7 @@ int gx_stream_start(struct gx_stream *ts)
 	ts->ready = true;
 
 out:
-	mutex_unlock(&ts->lock);
+	spin_unlock_irqrestore(&ts->lock, irq_flags);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gx_stream_start);
@@ -236,8 +237,9 @@ EXPORT_SYMBOL_GPL(gx_stream_start);
 void gx_stream_stop(struct gx_stream *ts)
 {
 	struct gx_formatter *formatter;
+	unsigned long irq_flags;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irqsave(&ts->lock, irq_flags);
 	ts->ready = false;
 
 	/* Stop all the formatters attached to the stream */
@@ -245,7 +247,7 @@ void gx_stream_stop(struct gx_stream *ts)
 		gx_formatter_disable(formatter);
 	}
 
-	mutex_unlock(&ts->lock);
+	spin_unlock_irqrestore(&ts->lock, irq_flags);
 }
 EXPORT_SYMBOL_GPL(gx_stream_stop);
 
@@ -256,7 +258,7 @@ struct gx_stream *gx_stream_alloc(struct gx_iface *iface)
 	ts = kzalloc_obj(*ts);
 	if (ts) {
 		INIT_LIST_HEAD(&ts->formatter_list);
-		mutex_init(&ts->lock);
+		spin_lock_init(&ts->lock);
 		ts->iface = iface;
 	}
 
@@ -272,7 +274,6 @@ void gx_stream_free(struct gx_stream *ts)
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

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261021-gx-formatter-use-spinlock-289b3e2e46df

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

