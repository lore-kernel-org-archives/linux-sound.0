Received: from omr008.pc5.atmailcloud.com (omr008.pc5.atmailcloud.com [103.150.252.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53210481A3
	for <linux-sound@vger.kernel.org>; Mon,  2 Dec 2024 06:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.150.252.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733120570; cv=none; b=XM1PSXMCK6BfOhaY8gW2LMcOSSy7s/jaedIMaWzN54mMf6lAIA5vb0PBAt/5SzUww61c9vwUDTga1b8mWhT2cfxJVpBdiJstxfQAfeVk5U2F3ylQBgAYxuDdN37glhVS6+SvmH/YvnJXB9TLASStoAhOavZ70HgX9pZqlzKhZn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733120570; c=relaxed/simple;
	bh=hYCupowGw8zZIQbKIVCpCgES1GDWR66omEfcRIwJMGs=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=eZh+uTUesJg53jMAoAUklGxfkC721Yp/oYMagFWPjO1DCpIxA1syj3ypLV2wLoTuRUCP/uqFwCxoia/SJ96FbH8bz5Re9BPldRqrrSk02UlWXc7UC1McTTeFpOD2uWAiAL7OeYQw6pAdkTnO+C/OekzNOeXeoT9px7eckZTtrZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au; spf=pass smtp.mailfrom=iinet.net.au; dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b=LNhR/bcs; arc=none smtp.client-ip=103.150.252.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iinet.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iinet.net.au header.i=@iinet.net.au header.b="LNhR/bcs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iinet.net.au; s=202309; h=Content-Type:Subject:From:To:MIME-Version:Date:
	Message-ID; bh=mb3CMYRJ+5J/ZOPYv8dOrsfq/YiM7j+8S4AqvlbNUfU=; b=LNhR/bcsr0JhmE
	AMoLqbwvGpvdC238Z7HJ0gs+5PrUr2mD4D3HKtNF6bQyx8UKLjZ5LkbJX4bk18/Xuak1xEUTJOVFw
	UYScnImf9+YW5QtnY50BS8UUL9PW/u5wrQRUWdl/D9EraGv5CU6+7acKwdw4RSd5yDgoDCrDrQaRk
	TCFUXhkiXznJZXOHC7/FPifXuCVBzOwzATNamN8RFx9AiF1HK9OyzGyn+w50QcM2WaiPOx0W2vKAj
	hjcmqYNoFvNBrsrMGfbG8PlR6CcDif4uNK+uxmxU2jm06VthlPxG9QathyRPTrKpyp326hsPJXTuZ
	U7zPxdoMYZy0bBlvJyYQ==;
Received: from cmr-kakadu03.internal.pc5.atmailcloud.com (cmr-kakadu03.internal.pc5.atmailcloud.com [192.168.1.5]) 
	by omr.internal.pc5.atmailcloud.com (Exim/cmr-kakadu03.i-08bfa4c5bdedaf3a1) with ESMTPS
	(envelope-from <gordoste@iinet.net.au>)
	id 1tHzGm-000000000gt-430Q 
	for <linux-sound@vger.kernel.org>;
	Mon, 02 Dec 2024 05:46:52 +0000
Received: from [220.233.184.101] (helo=[192.168.20.106])
	 by CMR-KAKADU03.i-08bfa4c5bdedaf3a1 with esmtpa
	(envelope-from <gordoste@iinet.net.au>)
	id 1tHzGm-000000004qo-2uVY
	for linux-sound@vger.kernel.org;
	Mon, 02 Dec 2024 05:46:52 +0000
Message-ID: <b64a630f-d71f-49ee-a5e7-ea1e3a7f8de5@iinet.net.au>
Date: Mon, 2 Dec 2024 16:46:48 +1100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-sound@vger.kernel.org
From: Stephen Gordon <gordoste@iinet.net.au>
Subject: Questions about an unusual use case
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Atmail-Id: gordoste@iinet.net.au
X-atmailcloud-spam-action: no action
X-Cm-Analysis: v=2.4 cv=AvHo3v9P c=1 sm=1 tr=0 ts=674d49cc a=HSUqTxjWRdnMbJspRni59w==:117 a=HSUqTxjWRdnMbJspRni59w==:17 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=x7bEGLp0ZPQA:10 a=NEAV23lmAAAA:8 a=bQbKzAxCrHK6Kodup1EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kxav86IEnfDDszDCmKJH:22
X-Cm-Envelope: MS4xfGu+YoVQbgsId0xDo46oIlENEcz2oi/K/nb9kbOWfhghUWvhbYw3D9DPsTLEqGEtqRSU+/GzTFNUKkRHSxaAULYM3FFQzQ1goAW9ZQuuZ9QEOxAxzQ2T Y1rh8YwWFWdwrodUo0AmrIoCW5UC7CQYv8ihNCp5m59bFxfokfEQCxyQGXQan94fsDRxz+wI8Nia+Q==
X-atmailcloud-route: unknown

Hi there,

First of all, please feel free to direct me to any other forum where it
would be more appropriate to ask these questions.

I am building a soundcard based on the PCM3168A codec. This codec has
a DAC and ADC,each with separate LRCK/BCK lines. The codec's system
clock is from an external crystal and the codec will produce the I2S
clocks. Since the target CPU only has a single pair of I2S clock lines,
the two pairs of clock lines from the PCM3168A are tied together, and
the codec DAC will be clock producer, with the codec ADC and the CPU as
clock consumers.

                                   -------------------
---------            ------------| LRCK     DAC
      LRCK|-------+--/     -------| BCK  producer  C
CPU      |       |       /       |                O
       BCK|-------|---+--/        | ------------   D
consumer |       \   |           |                E
---------|        ---------------| LRCK     ADC   C
                      `-----------| BCK  consumer
                                   --------------------

Importantly, the CPU's I2S peripheral is constrained to be a clock
consumer (it has another peripheral that can be a clock provider).

As far as I can see, this needs two DAI links:

1. Playback DAI link: CPU (clock consumer) - codec DAC (clock provider)

2. Capture DAI link: codec ADC (clock consumer) - CPU (clock consumer)

The PCM3168A is connected via I2C, and I have successfully tested it
using the dummy codecs (linux,spdif-dir and linux,spdif-dit) and
manually setting the codec's registers using i2cset. In that setup, the
codec was set as clock producer on both DAI links, but it didn't matter
because the codec driver didn't do anything.

However, I am unsure how I would get this working properly with the
PCM3168A codec driver.

When I set up soc_simple_card with no clock provider specified in the
capture DAI link (see DTS at bottom), it throws this error:

[  792.329694] designware-i2s 1f000a4000.i2s: ASoC: error at 
snd_soc_dai_set_fmt on 1f000a4000.i2s: -22
[  792.329833] asoc-simple-card: probe of soc:sound failed with error -22

The function in the I2S driver is pretty simple:

https://github.com/torvalds/linux/blob/bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a/sound/soc/dwc/dwc-i2s.c#L390

As far as I can see, this error would result from trying to set the
I2S interface as clock provider when it doesn't have the ability to be
a clock provider.

This raises the following questions on how best to proceed:
1. Does SoC support DAI links that have clock consumers at both ends?
2. Does soc_simple_card support specification of these links?
3. Is there some other DT setting that would make this work?

Thanks for your time and any advice you can provide.


Stephen



     fragment@2 {
         target = <&sound>;
         __overlay__ {
             compatible = "simple-audio-card";
             #address-cells = <1>;
             #size-cells = <0>;
             i2s-controller = <&i2s_clk_consumer>;
             status="okay";

             simple-audio-card,name = "i2smulti";
             simple-audio-card,format = "i2s";

             dailink_out_master: simple-audio-card,dai-link@0 {
                 reg = <0>;
                 format = "i2s";
                 bitclock-master = <&pcm3168_playback>;
                 frame-master = <&pcm3168_playback>;
                 cpu  {
                     sound-dai = <&i2s_clk_consumer>;
                     dai-tdm-slot-num = <2>;
                     dai-tdm-slot-width = <32>;
                 };
                 pcm3168_playback: codec {
                     sound-dai = <&pcm3168a 0>;
                     dai-tdm-slot-num = <2>;
                     dai-tdm-slot-width = <32>;
                 };
             };
             dailink_in_slave: simple-audio-card,dai-link@1 {
                 reg = <1>;
                 format = "i2s";
                 cpu  {
                     sound-dai = <&i2s_clk_consumer>;
                     dai-tdm-slot-num = <2>;
                     dai-tdm-slot-width = <32>;
                 };
                 pcm3168_capture: codec {
                     sound-dai = <&pcm3168a 1>;
                     dai-tdm-slot-num = <2>;
                     dai-tdm-slot-width = <32>;
                 };
              };
         };
     };
