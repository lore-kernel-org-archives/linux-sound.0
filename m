Received: from mail.gtsys.com.hk (web.xit.com.hk [111.91.236.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0A713B7A3
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 07:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.91.236.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737616008; cv=none; b=gf/mNm2tTEXqkiXTPj+GDM+2/pvHJegQe282Zjwz3nvgtFewmpOd7fmySvPn0cWy7E9Ya2/+lWPvSjUwxNC0HJ4LUxdNuxLIVcKyv6aVAZ+gpluVWze5OV0hBJIqruWaI7BPnyc27oK7BZsmWMWZcyThSe2GdTSAoy1bbBJE690=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737616008; c=relaxed/simple;
	bh=QcDhUXoksUbtFqIc0Hu1OCe0+z4WE/lmYzY+4iVdwJE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=D7jdSD5iuE6ge5uZOuSIlec33EthN+jeHohSi1VfHFnJG0XIvv4cbWrnQUKw4vm5Sld2asg1syVP1jznszKVLlSA/tlMgkrflG/EdkfNjihljneX8DyIsMWahWB65GjJjwgZAXVch5TV8Awb0ggSRGIoNXPM1+w+iIWEH0T/yzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtsys.com.hk; spf=pass smtp.mailfrom=gtsys.com.hk; arc=none smtp.client-ip=111.91.236.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtsys.com.hk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtsys.com.hk
Received: from localhost (localhost [127.0.0.1])
	by mail.gtsys.com.hk (Postfix) with ESMTP id 241E117B5
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 15:06:35 +0800 (HKT)
X-Virus-Scanned: Debian amavis at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
 by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeogTL6feL37 for <linux-sound@vger.kernel.org>;
 Thu, 23 Jan 2025 15:06:34 +0800 (HKT)
Received: from gtsnode.virtual.gtsys.com.hk (gtsnode.virtual.gtsys.com.hk [10.128.4.2])
	by mail.gtsys.com.hk (Postfix) with ESMTP id 6B9FE816
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 15:06:34 +0800 (HKT)
Received: from [10.128.1.32] (unknown [203.145.95.233])
	by gtsnode.virtual.gtsys.com.hk (Postfix) with ESMTPSA id D13AB1FCC5
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 15:06:33 +0800 (HKT)
Message-ID: <79b9105f-5e4b-4691-9af0-484233612f84@gtsys.com.hk>
Date: Thu, 23 Jan 2025 15:06:32 +0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: rt5651 + rk3399 orange-pi 4b no HP output
From: Chris Ruehl <chris.ruehl@gtsys.com.hk>
To: linux-sound@vger.kernel.org
References: <27307cdd-436c-4520-94d0-0baa4d65c49d@gtsys.com.hk>
 <dc3014fe-c58f-46e3-af95-6179952b5a31@gtsys.com.hk>
Content-Language: en-US
In-Reply-To: <dc3014fe-c58f-46e3-af95-6179952b5a31@gtsys.com.hk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 22/1/2025 15:10, Chris Ruehl wrote:
> On 21/1/2025 18:33, Chris Ruehl wrote:
>> Hi,
>>
>> Fighting for over a week try to get the headphone sound working on a orange-pi 
>> 4b (rk3399 + rt5651-codec)
>> as simple-card setup. So far I got all clocks working on the i2s1 bus and use 
>> alsamixer set Dac1 mix to HPO_L/R.
>> Jack plugin gpio is working correct and I see the status change in the /sys/ 
>> kernel/debug/sound/card1/Headphones Jack/status
>> All I got is a 'knack-noise' when starting/stopping the stream.
>>
>>
>> ....
> 
> Keep going debugging,
> add a dev_dbg to rockchip_i2s.c to compare the bclk rates.
> and there is a difference in i2s vs. rt565 where the bclk frequency is 1/2 of
> what i2s is using.
> 
> [   72.204217] rt5651 1-001a: Sysclk is 5644800Hz and clock id is 0
> [   72.204922] rt5651 1-001a: framesize: 32
> [   72.205272] rt5651 1-001a: bclk is 705600Hz and lrck is 22050Hz
> [   72.205792] rt5651 1-001a: bclk_ms is 0 and pre_div is 0 for iis 0
> [   72.206345] rockchip-i2s ff890000.i2s: mclk_rate: 5644800 bclk_rate: 1411200 
> div_bclk: 4 div_lrck: 64
> 

Finally have it working, the Realtek Codec driver rt5651 not enabled the master 
clock gate to the MBCK port on the chip. Other codes like rt5616 do this.
In consequence, non of the other rk3399-*.dts with same config can have a 
workable headphone output!

Here is my patch to make the headphones working:
--- sound/soc/codecs/rt5651.c.org       2025-01-23 14:44:54.488095319 +0800
+++ sound/soc/codecs/rt5651.c   2025-01-23 14:47:07.125695637 +0800
@@ -6,6 +6,7 @@
   * Author: Bard Liao <bardliao@realtek.com>
   */

+#include <linux/clk.h>
  #include <linux/module.h>
  #include <linux/init.h>
  #include <linux/delay.h>
@@ -1298,6 +1299,7 @@
                 dev_err(component->dev, "Unsupported frame size: %d\n", 
frame_size);
                 return -EINVAL;
         }
+
         bclk_ms = frame_size > 32 ? 1 : 0;
         rt5651->bclk[dai->id] = rt5651->lrck[dai->id] * (32 << bclk_ms);

@@ -1511,6 +1513,9 @@
  static int rt5651_set_bias_level(struct snd_soc_component *component,
                         enum snd_soc_bias_level level)
  {
+       int ret;
+       struct rt5651_priv *rt5651 = snd_soc_component_get_drvdata(component);
+
         switch (level) {
         case SND_SOC_BIAS_PREPARE:
                 if (SND_SOC_BIAS_STANDBY == 
snd_soc_component_get_bias_level(component)) {
@@ -1531,6 +1536,12 @@
                                 RT5651_PWR_FV1 | RT5651_PWR_FV2,
                                 RT5651_PWR_FV1 | RT5651_PWR_FV2);
                         snd_soc_component_update_bits(component, RT5651_D_MISC, 
0x1, 0x1);
+                       ret = clk_prepare_enable(rt5651->mclk);
+                       if (ret) {
+                               dev_err(component->dev,
+                                       "failed to enable MCLK: %d\n", ret);
+                               return ret;
+                       }
                 }
                 break;

@@ -1546,6 +1557,7 @@
                 /* Leave PLL1 and jack-detect power as is, all others off */
                 snd_soc_component_update_bits(component, RT5651_PWR_ANLG2,
                                     ~(RT5651_PWR_PLL | RT5651_PWR_JD_M), 0);
+               clk_disable_unprepare(rt5651->mclk);
                 break;

         default:
@@ -2241,6 +2253,11 @@

         regmap_write(rt5651->regmap, RT5651_RESET, 0);

+       /* Check if MCLK provided */
+       rt5651->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+       if (IS_ERR(rt5651->mclk))
+               return PTR_ERR(rt5651->mclk);
+
         ret = regmap_register_patch(rt5651->regmap, init_list,
                                     ARRAY_SIZE(init_list));
         if (ret != 0)

--- sound/soc/codecs/rt5651.h.org       2025-01-23 14:45:09.173212267 +0800
+++ sound/soc/codecs/rt5651.h   2025-01-23 14:47:07.685582610 +0800
@@ -2084,6 +2084,8 @@
         unsigned int ovcd_th;
         unsigned int ovcd_sf;

+       struct clk *mclk;
+
         int irq;
         int sysclk;
         int sysclk_src;

Is there a patch upstream lined up?

Regards
Chris
