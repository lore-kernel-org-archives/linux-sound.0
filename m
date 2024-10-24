Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F19156C74
	for <linux-sound@vger.kernel.org>; Thu, 24 Oct 2024 21:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729806992; cv=none; b=a7dl+aL+eOIPv+6x1rkYIXaNqVuqIF91SX/c+l84XCAZ0igBS4fJlLo2oSdslLQgaG4lLd7N8+fpGlciik7ZU/Zdla9sgrUWBdDXdxK7RdW2BI6fPLO94GwOMPZ0vs0dJZYexerLV9QTr2LhIWwsJ1K2tNrx1FmZNt9NWJRXcZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729806992; c=relaxed/simple;
	bh=Mnxt680wMpf+a3OkgJwOzC/ycmapgstvhdEeZoGIGwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tRjbqXU+eVcYF1iTWVEgksMutju7vtYlFY9HvfHffeDQXcq4oVVhw0g5d/PIAmmuwe03EwZdKOOUWk80sBAf+nPp1A7R+kCYyNE39dB6kdx2m+0aCm50mMImyW2zdD1/BO/X1FadEtUsObdUYetO4Wv67X8Nz2d2B3pDg0RIZt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B4SVvEY6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B4SVvEY6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729806989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cbmq3d6uLzOyCD9nLckii3j2RHl1P2IaFb86nJgOIY0=;
	b=B4SVvEY6n9a7rqq08gMuBGi3/ksIz0TBIOE1rBv+2MUj86+n7VK4cUGhZ4zqkWAZExx3qK
	WTVjd+H740kpySla4WQPwN3t/X7fAUu3DkEkrs4NrEGcBpxO/nD40vvRpa5HAmbo2Le5mw
	o+tVzw5KrhtT2qVzjBUAWDF/bIB+TrI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-501-o_dciBSCOX2Uijik40t96g-1; Thu,
 24 Oct 2024 17:56:26 -0400
X-MC-Unique: o_dciBSCOX2Uijik40t96g-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AD5841955BCF;
	Thu, 24 Oct 2024 21:56:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.75])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 01FC419560A2;
	Thu, 24 Oct 2024 21:56:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: codecs: rt5640: Always disable IRQs from rt5640_cancel_work()
Date: Thu, 24 Oct 2024 23:56:12 +0200
Message-ID: <20241024215612.92147-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Disable IRQs from rt5640_cancel_work(), this fixes a crash caused by
the IRQ never getting freed when the driver is unbound from the i2c_client
with jack-detection active:

[  193.138780] rt5640 i2c-rt5640: ASoC: unknown pin LDO2
[  193.138830] rt5640 i2c-rt5640: ASoC: unknown pin MICBIAS1
[  193.671218] BUG: kernel NULL pointer dereference, address: 0000000000000078
[  193.671239] #PF: supervisor read access in kernel mode
[  193.671248] #PF: error_code(0x0000) - not-present page
...
[  193.671531]  ? asm_exc_page_fault+0x22/0x30
[  193.671551]  ? rt5640_jack_inserted+0x10/0x80 [snd_soc_rt5640]
[  193.671574]  rt5640_detect_headset+0x93/0x130 [snd_soc_rt5640]
[  193.671596]  rt5640_jack_work+0x93/0x355 [snd_soc_rt5640]

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/rt5640.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 16f3425a3e35..855139348edb 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2419,10 +2419,20 @@ static irqreturn_t rt5640_jd_gpio_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void rt5640_cancel_work(void *data)
+static void rt5640_disable_irq_and_cancel_work(void *data)
 {
 	struct rt5640_priv *rt5640 = data;
 
+	if (rt5640->jd_gpio_irq_requested) {
+		free_irq(rt5640->jd_gpio_irq, rt5640);
+		rt5640->jd_gpio_irq_requested = false;
+	}
+
+	if (rt5640->irq_requested) {
+		free_irq(rt5640->irq, rt5640);
+		rt5640->irq_requested = false;
+	}
+
 	cancel_delayed_work_sync(&rt5640->jack_work);
 	cancel_delayed_work_sync(&rt5640->bp_work);
 }
@@ -2463,13 +2473,7 @@ static void rt5640_disable_jack_detect(struct snd_soc_component *component)
 	if (!rt5640->jack)
 		return;
 
-	if (rt5640->jd_gpio_irq_requested)
-		free_irq(rt5640->jd_gpio_irq, rt5640);
-
-	if (rt5640->irq_requested)
-		free_irq(rt5640->irq, rt5640);
-
-	rt5640_cancel_work(rt5640);
+	rt5640_disable_irq_and_cancel_work(rt5640);
 
 	if (rt5640->jack->status & SND_JACK_MICROPHONE) {
 		rt5640_disable_micbias1_ovcd_irq(component);
@@ -2477,8 +2481,6 @@ static void rt5640_disable_jack_detect(struct snd_soc_component *component)
 		snd_soc_jack_report(rt5640->jack, 0, SND_JACK_BTN_0);
 	}
 
-	rt5640->jd_gpio_irq_requested = false;
-	rt5640->irq_requested = false;
 	rt5640->jd_gpio = NULL;
 	rt5640->jack = NULL;
 }
@@ -2798,7 +2800,8 @@ static int rt5640_suspend(struct snd_soc_component *component)
 	if (rt5640->jack) {
 		/* disable jack interrupts during system suspend */
 		disable_irq(rt5640->irq);
-		rt5640_cancel_work(rt5640);
+		cancel_delayed_work_sync(&rt5640->jack_work);
+		cancel_delayed_work_sync(&rt5640->bp_work);
 	}
 
 	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
@@ -3032,7 +3035,7 @@ static int rt5640_i2c_probe(struct i2c_client *i2c)
 	INIT_DELAYED_WORK(&rt5640->jack_work, rt5640_jack_work);
 
 	/* Make sure work is stopped on probe-error / remove */
-	ret = devm_add_action_or_reset(&i2c->dev, rt5640_cancel_work, rt5640);
+	ret = devm_add_action_or_reset(&i2c->dev, rt5640_disable_irq_and_cancel_work, rt5640);
 	if (ret)
 		return ret;
 
-- 
2.47.0

