Received: from omr011.pc5.atmailcloud.com (omr011.pc5.atmailcloud.com [103.150.252.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424A01FF7A1
	for <linux-sound@vger.kernel.org>; Fri,  6 Dec 2024 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733486102; cv=none; b=a+BDj4mo1Ly+d0UPoDcnYjJdsDactMiVBj/YaCQsfDzancOs0qLKg/K1NNJSQIy8r6SEPYrt3GuSt++t/KioxPl7VLIKlcivlTnTjR7jKRyi55hdTv0pAPY+NEz0jSWhMOcInLoOd4+wDJvZ2kyE/4uncqX9Q8ZYeTDzd1uifv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733486102; c=relaxed/simple;
	bh=TSgIWRweqC5T+74Y7kPqPy3XlpjS0OdZOWqBCDegLWk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:Cc:
	 In-Reply-To:Content-Type; b=hlVQL5nxZBNTYr59VaKO8d0/WaecRF0WU5OnNWI3BwlK5KkYYWRpZy5SEmphE58iqdlVcxmXdhliGNHQJYbl+2UsW/GkLe1YFCyD5sIB3nhIMeRo57eGaHkstKdUrV1pQ5QGyMwBbzcgg+1MbWYL6PMtuIU6WrmqquISwOh/GfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=m+9ZWafc; arc=none smtp.client-ip=103.150.252.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="m+9ZWafc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=Content-Type:To:Subject:From:MIME-Version:Date:
	Message-ID; bh=84H7hIW6+jX3uQhnJx1hqUDS5cEH5f4pqeOv+JAyuB4=; b=m+9ZWafcdwsj5H
	ybw8NMO8pmVXzcBV/eb+OD0wrBjwLDrU5pRbnb8AnWK1/XE6KliOYxticnhJJ7JlsrDloA6pdp5ZA
	drSYdSYw+wIkn3wGQIUqy9M8t3Pb+eVym0ZrNyi2Zplt/iZbx71Pb82QTpKij3c3pJqGYZtts2ryF
	OnEB84Tp2IZ0Wz3FlDUJ9sGKcXsRb1MmbeYFy8g0LonnND6bQje7OYXVTPVoKhg0gM9ZsYioazpbI
	pv0g4onf4BvQH5lunKxTMR8MmgurbzEX4np23emJFsx4hUKWK2DmPUFjltY/5unpWES9T/jaKz5wJ
	Mq9f8y1s2v8k1fW+/wqQ==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-0e9f9ba0eb9e9598e) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tJWv4-000000006uX-221t ;
	Fri, 06 Dec 2024 11:54:50 +0000
Received: from [220.233.184.101] (helo=[192.168.20.106])
	 by CMR-KAKADU03.i-0e9f9ba0eb9e9598e with esmtpa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tJWv4-000000001CX-08DO;
	Fri, 06 Dec 2024 11:54:50 +0000
Message-ID: <5011ceef-5100-441d-b169-dabba135d27f@iinet.net.au>
Date: Fri, 6 Dec 2024 22:54:43 +1100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stephen Gordon <gordoste@iinet.net.au>
Subject: [PATCH v2] ASoC: pcm3168a: Add option to force clock consumer
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <ea504848-eeb1-4e8e-bbf2-394114802c20@iinet.net.au>
Content-Language: en-US
Cc: linux-sound@vger.kernel.org
In-Reply-To: <ea504848-eeb1-4e8e-bbf2-394114802c20@iinet.net.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Envelope: MS4xfO8gTLXVnKZK35xsBnkpQV/g/fToUgWgraMHTeTsBTEDtyG4GrxksDLkqW62oqe+G7hq6eHXQfyR3X4CTZM6P2l6FEaNQFYijCvCGHXXqYRk9Q2hKrrD o01hNLi1JdiKBHDYFAov4Wb1Ow2ffLlnfcA3oCM1llo+3XcTo3WflClLkVIjbMj/5S/q++QhZX/+MQ==
X-Cm-Analysis: v=2.4 cv=FeMxxo+6 c=1 sm=1 tr=0 ts=6752e60a a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=4jraHwQkAAAA:8 a=Z0YmYDo3DvnjE13v2BIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-atmailcloud-route: unknown

Hi,

Resending with signoff tag and including linux-sound on CC.

Scenario is that DAC's clock pins are tied to ADC's clock pins, with
codec acting as clock producer for the I2S bus, and the CPU has a single
pair of I2S clock pins used for both playback and capture.


                                  ,-------------------
---------            ------------| LRCK     DAC
      LRCK|-------+--/     -------| BCK   (producer)  C
CPU      |       |       /       |                   O
       BCK|-------|---+--/        | ----------------  D
consumer |       \   |           |                   E
---------         ---------------| LRCK     ADC      C
                      `-----------| BCK    (consumer)
                                  `--------------------

Both DAI links will have codec acting as a clock producer, but we need

to configure the codec so that only one of ADC/DAC drives the lines.


Add DT options to support this configuration. adc-force-cons/dac-force-cons

cause the corresponding component to be configured in consumer mode.


Signed-off-by: Stephen Gordon <gordoste@iinet.net.au>




diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 9d6431338..1a4cf8d63 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -61,6 +61,7 @@ struct pcm3168a_priv {
         struct clk *scki;
         struct gpio_desc *gpio_rst;
         unsigned long sysclk;
+       bool adc_fc, dac_fc; // Force clock consumer mode

         struct pcm3168a_io_params io_params[2];
         struct snd_soc_dai_driver dai_drv[2];
@@ -479,6 +480,12 @@ static int pcm3168a_hw_params(struct 
snd_pcm_substream *substream,
                 ms = 0;
         }

+       // Force clock consumer mode if needed
+       if (pcm3168a->adc_fc && dai->id == PCM3168A_DAI_ADC)
+               ms = 0;
+       if (pcm3168a->dac_fc && dai->id == PCM3168A_DAI_DAC)
+               ms = 0;
+
         format = io_params->format;

         if (io_params->slot_width)
@@ -757,6 +764,15 @@ int pcm3168a_probe(struct device *dev, struct 
regmap *regmap)

         pcm3168a->sysclk = clk_get_rate(pcm3168a->scki);

+       adc_fc = false;
+       dac_fc = false;
+       if (dev->of_node) {
+               pcm3168a->adc_fc = of_property_read_bool(dev->of_node,
+                               "adc-force-cons");
+               pcm3168a->dac_fc = of_property_read_bool(dev->of_node,
+                               "dac-force-cons");
+       }
+
         for (i = 0; i < ARRAY_SIZE(pcm3168a->supplies); i++)
                 pcm3168a->supplies[i].supply = pcm3168a_supply_names[i];





