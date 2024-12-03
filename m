Received: from omr008.pc5.atmailcloud.com (omr008.pc5.atmailcloud.com [103.150.252.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499351E4929
	for <linux-sound@vger.kernel.org>; Tue,  3 Dec 2024 12:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733227307; cv=none; b=rg+te8pK5/qfsHLIIuU/7pPMvalWLqL0v3a7hgexCJBFBzdtQeiq/6OtR24i84Yw4XEIVLpNlrbzfBJu9x4oFybNHGRIQf1ojHxrsBJkRDK3BIYLEA9AS35DUD2+dr5VGV5UEc2gWGE7a1msE9FtrbeL31C5Cr7OEvCvgYdVOps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733227307; c=relaxed/simple;
	bh=dST8VrQazrnkchOWuMVpU7cZ3DR81rw+cDhZEndYGI8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=sj07iLussOedUt/d3etaLafuM7KM6jq0Wjfp8ajxDzLxUpQFBR/dhvkhWlOPKXDCFVBQ0g4juBNw4wCDBkxyym8/yrcEYWXEk+hHQafdT8IHuNq6qxDxLxGoX3sORSuT0GW8nPEMIfUcyOfVwrxfm9KiQgXITe0A69NhvLqP2bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=Swlz0KSB; arc=none smtp.client-ip=103.150.252.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="Swlz0KSB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=Content-Type:Subject:From:To:MIME-Version:Date:
	Message-ID; bh=4711xJ66FxhpDzaiQ9GZcTtkAqP9f+3Ccu6zo05/sxk=; b=Swlz0KSBfMwycr
	ODToIy0Ss3hxpPyAFSD/93poikcwm4/FYPjurg69FKJB3OAu+4coqUzt+tpFo+BoOEmfbsBMVHO6i
	drI1Pv5IXcPp4hSSYW/gQJ2swwHu/D//67zeEqOnNp44/gPvRSFilvtj6+kTZx69JoSfn34Z/W/ob
	PgfjjdBhR5F1yst1gxE/zA2Euhrr711+JKF+C7wkOu6d/s/D3tnARIRtSsFH0t+arht9GRbiD+h1E
	ulm0QwIBDeifhSTPnA/RyQmkMjOjHECreBWJ7LG6HHO4TvFvxA/2Lq+uP3m6MqrrsBee8dHYIB5Oa
	TEUD/LDKtqKOsj46ottg==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-0b90e6e05a7b179c7) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tIRax-000000006bA-0VCi ;
	Tue, 03 Dec 2024 12:01:35 +0000
Received: from [220.233.184.101] (helo=[192.168.20.106])
	 by CMR-KAKADU03.i-0b90e6e05a7b179c7 with esmtpa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tIRaw-000000000qe-34VX;
	Tue, 03 Dec 2024 12:01:34 +0000
Message-ID: <ea504848-eeb1-4e8e-bbf2-394114802c20@iinet.net.au>
Date: Tue, 3 Dec 2024 23:01:31 +1100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@vger.kernel.org
From: Stephen Gordon <gordoste@iinet.net.au>
Subject: [PATCH] ASoC: pcm3168a: Add option to force clock consumer
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=SanxdORu c=1 sm=1 tr=0 ts=674ef31e a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=4jraHwQkAAAA:8 a=PA-jjX1Vhq5T2YEptLMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Cm-Envelope: MS4xfLdjdtfLs99pk1efUxIHVn0VMWqWkPMgKEprIOxM2Rqer7T9nUadZLO2DiGmm1xe83XsLSwlkPU347tmy/HdtgxcUGl7PnFN5FM29CB5z+4hKoaZccVH rlTqzTI8JEoujONBnhEJpNHJPA+TZ9aK3AjJD926AotbxWy5Ed+Ab5qaOYMR5zeudgZv0x1Hs+ChRw==
X-atmailcloud-route: unknown


Scenario is that DAC's clock pins are tied to ADC's clock pins, with
codec acting as clock producer for the I2S bus, and the CPU has a single
pair of I2S clock pins used for both playback and capture.

Both DAI links will have codec acting as a clock producer, but we need
to configure the codec so that only one of ADC/DAC drives the lines.

Add DT options to support this configuration. adc-force-cons/dac-force-cons
cause MSAD/MSDA to be set to 0b000.

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 9d6431338..5e3590f2d 100644
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
@@ -757,6 +764,13 @@ int pcm3168a_probe(struct device *dev, struct 
regmap *regmap)

         pcm3168a->sysclk = clk_get_rate(pcm3168a->scki);

+       if (dev->of_node) {
+               pcm3168a->adc_fc = of_property_read_bool(dev->of_node,
+                               "adc-force-cons");
+               pcm3168a->dac_fc = of_property_read_bool(dev->of_node,
+                               "dac-force-cons");
+       }
+
         for (i = 0; i < ARRAY_SIZE(pcm3168a->supplies); i++)
                 pcm3168a->supplies[i].supply = pcm3168a_supply_names[i];



Signed-off-by: Stephen Gordon <gordoste@iinet.net.au>
