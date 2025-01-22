Received: from mail.gtsys.com.hk (web.xit.com.hk [111.91.236.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C342A170A30
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 07:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.91.236.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737529861; cv=none; b=mdhbS+DB5zpEoFx0pUEUAS25700DUOasMp9klfZVQP9dvtpoGpjXuuKFlbR0bfUtw3o/cOKlRz+QN1Hq6C+p1xj7dw1onM03nvAnOU0QnKavLhB0uBNcuqxjomPKuOl+81BNwKsHuEbVow2OKrefhefMEWTNIuYkGfgZ7ZGxHVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737529861; c=relaxed/simple;
	bh=qmfJ0pN/XRVvTM9McnGCelAExcfMfq9OlhQHBvgczmM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=m6pxgv55urlgcX556rIvoSDBbgL1EbFnPIQ34oBCK3TaA/9W4uhOko4ktVi2slY9axQYdU2dJlhm68OqJ7YzxCaQsue3R0qlYcMvlmcm+kbvdPaf7rs8OZosNg7+rTxg5H8uAW4zOnffh8QU//W/hfgwV7Cgc+bkUjToPgyvOOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtsys.com.hk; spf=pass smtp.mailfrom=gtsys.com.hk; arc=none smtp.client-ip=111.91.236.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtsys.com.hk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtsys.com.hk
Received: from localhost (localhost [127.0.0.1])
	by mail.gtsys.com.hk (Postfix) with ESMTP id 0AF0E17A2
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 15:10:54 +0800 (HKT)
X-Virus-Scanned: Debian amavis at gtsys.com.hk
Received: from mail.gtsys.com.hk ([127.0.0.1])
 by localhost (mail.gtsys.com.hk [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttR9JncFXZVH for <linux-sound@vger.kernel.org>;
 Wed, 22 Jan 2025 15:10:53 +0800 (HKT)
Received: from gtsnode.virtual.gtsys.com.hk (gtsnode.virtual.gtsys.com.hk [10.128.4.2])
	by mail.gtsys.com.hk (Postfix) with ESMTP id B18CD621
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 15:10:53 +0800 (HKT)
Received: from [10.128.1.32] (unknown [203.145.95.233])
	by gtsnode.virtual.gtsys.com.hk (Postfix) with ESMTPSA id 536F51FCC5
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 15:10:53 +0800 (HKT)
Message-ID: <dc3014fe-c58f-46e3-af95-6179952b5a31@gtsys.com.hk>
Date: Wed, 22 Jan 2025 15:10:51 +0800
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
Content-Language: en-US
In-Reply-To: <27307cdd-436c-4520-94d0-0baa4d65c49d@gtsys.com.hk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/1/2025 18:33, Chris Ruehl wrote:
> Hi,
> 
> Fighting for over a week try to get the headphone sound working on a orange-pi 
> 4b (rk3399 + rt5651-codec)
> as simple-card setup. So far I got all clocks working on the i2s1 bus and use 
> alsamixer set Dac1 mix to HPO_L/R.
> Jack plugin gpio is working correct and I see the status change in the /sys/ 
> kernel/debug/sound/card1/Headphones Jack/status
> All I got is a 'knack-noise' when starting/stopping the stream.
> 
> More details below.
> Please, someone spot the missing link?
> 
> I have no idea what is going wrong.
> 
> Thanks!
> Chris
> 
> 
> To have the clocks running, there are two simple codes applied to the 6.12 kernel.
> rk3399-cru.h: add
> #define SCLK_I2SOUT_SRC 64
> 
> clk_rk3399.c : patch clk_i2sout_src
>         MUX(SCLK_I2SOUT_SRC, "clk_i2sout_src", mux_i2sch_p, CLK_SET_RATE_PARENT,
>                         RK3399_CLKSEL_CON(31), 0, 2, MFLAGS),
>         COMPOSITE_NODIV(SCLK_I2S_8CH_OUT, "clk_i2sout", mux_i2sout_p, 
> CLK_SET_RATE_PARENT,
>                         RK3399_CLKSEL_CON(31), 2, 1, MFLAGS,
>                         RK3399_CLKGATE_CON(8), 12, GFLAGS),
> 
> dts:
>          rt5651_card: rt5651-sound {
>                  status = "okay";
>                  compatible = "simple-audio-card";
>                  pinctrl-names = "default";
>                  pinctrl-0 = <&hp_det>;
> 
>                  //simple-audio-card,name = "realtek,rt5651-codec";
>                  simple-audio-card,name = "rt5651codec";
>                  simple-audio-card,format = "i2s";
>                  simple-audio-card,mclk-fs = <256>;
>                  simple-audio-card,hp-det-gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> 
>                  simple-audio-card,widgets =
>                          "Microphone", "Mic Jack",
>                          "Headphone", "Headphones";
>                  simple-audio-card,routing =
>                          "Mic Jack", "micbias1",
>                          "IN2P", "Mic Jack",
>                          "IN2N", "Mic Jack",
>                          "Headphones", "HPOL",
>                          "Headphones", "HPOR";
> 
>                  simple-audio-card,cpu {
>                          sound-dai = <&i2s1>;
>                  };
>                  simple-audio-card,codec {
>                          sound-dai = <&rt5651>;
>                          // system-clock-frequency = <11289600>;
>                  };
>          };
> 
> &i2s1 {
>          status = "okay";
>          pinctrl-names = "mclkpins", "i2sbuspins";
>          pinctrl-0 = <&i2s_8ch_mclk>;
>          pinctrl-1 = <&i2s1_2ch_bus>;
>          rockchip,capture-channels = <2>;
>          rockchip,playback-channels = <2>;
>          assigned-clocks = <&cru SCLK_I2SOUT_SRC>;
>          assigned-clock-parents = <&cru SCLK_I2S1_8CH>;
> };
> 
> orangepi# cat /sys/kernel/debug/clk/clk_i2sout_src/clk_parent
> clk_i2s1
> 
> orangepi@joyai3:~$ aplay -l
> **** List of PLAYBACK Hardware Devices ****
> card 0: hdmisound [hdmi-sound], device 0: ff8a0000.i2s-i2s-hifi i2s-hifi-0 
> [ff8a0000.i2s-i2s-hifi i2s-hifi-0]
>    Subdevices: 1/1
>    Subdevice #0: subdevice #0
> card 1: rt5651codec [rt5651codec], device 0: ff890000.i2s-rt5651-aif1 rt5651- 
> aif1-0 [ff890000.i2s-rt5651-aif1 rt5651-aif1-0]
>    Subdevices: 1/1
>    Subdevice #0: subdevice #0
> 
> 
> aplay -D sysdefault:CARD=rt5651codec -f cd -c2 StarWars60.wav
> Playing WAVE 'StarWars60.wav' : Signed 16 bit Little Endian, Rate 22050 Hz, Mono
> [   46.759884] rt5651 1-001a: Sysclk is 5644800Hz and clock id is 0
> [   46.760590] rt5651 1-001a: bclk is 705600Hz and lrck is 22050Hz
> [   46.761111] rt5651 1-001a: bclk_ms is 0 and pre_div is 0 for iis 0
> and
> Playing WAVE 'sample-6s.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo
> [   65.825775] rt5651 1-001a: Sysclk is 11289600Hz and clock id is 0
> [   65.826491] rt5651 1-001a: bclk is 1411200Hz and lrck is 44100Hz
> [   65.827020] rt5651 1-001a: bclk_ms is 0 and pre_div is 0 for iis 0
> 
> root@joyai3:/home/orangepi# cat /sys/kernel/debug/clk/clk_summary | grep i2s
>                  hclk_i2s2            1       2        0        100000000   0   
> 0     50000      Y                  ff8a0000.i2s                    i2s_hclk
> 
>                                            i2s@ff8a0000 no_connection_id
>                  hclk_i2s1            2       2        0        100000000   0 
>        0     50000      Y                  ff890000.i2s                    i2s_hclk
> 
>                                            i2s@ff890000 no_connection_id
>                  hclk_i2s0            0       0        0        100000000   0 
>        0     50000      N                  deviceless no_connection_id
>            clk_i2s2_div               0       1        0        800000000   0 
>        0     50000      N            deviceless no_connection_id
>               clk_i2s2_frac           0       1        0        11289600    0 
>        0     50000      N               deviceless no_connection_id
>                  clk_i2s2_mux         0       1        0        11289600    0 
>        0     50000      Y                  deviceless no_connection_id
>                     clk_i2s2          0       1        0        11289600    0 
>        0     50000      N                     i2s@ff8a0000 no_connection_id
> 
>                                               ff8a0000.i2s i2s_clk
> 
>                                               i2s@ff8a0000 no_connection_id
>            clk_i2s1_div               1       1        0        800000000   0 
>        0     50000      Y            deviceless no_connection_id
>               clk_i2s1_frac           1       1        0        11289600    0 
>        0     50000      Y               deviceless no_connection_id
>                  clk_i2s1_mux         1       1        0        11289600    0 
>        0     50000      Y                  deviceless no_connection_id
>                     clk_i2s1          2       2        0        11289600    0 
>        0     50000      Y                     i2s@ff890000 no_connection_id
> 
>                                               ff890000.i2s i2s_clk
> 
>                                               i2s@ff890000 no_connection_id
>                        clk_i2sout_src 0       0        0        11289600    0 
>        0     50000      Y                        deviceless no_connection_id
>                           clk_i2sout  0       0        0        11289600    0 
>        0     50000      N                           audio-codec@1a    
> no_connection_id
>            clk_i2s0_div               0       0        0        800000000   0 
>        0     50000      N            deviceless no_connection_id
>               clk_i2s0_frac           0       0        0        40000000    0 
>        0     50000      N               deviceless no_connection_id
>   clk_i2s0_mux                        0       0        0        0           0 
>        0     50000      Y   deviceless                      no_connection_id
>      clk_i2s0                         0       0        0        0           0 
>        0     50000      N      deviceless                      no_connection_id
> 
> 
> orangepi@joyai3:~$ amixer -c1 | grep -3 HP
>    Capabilities: pswitch pswitch-joined
>    Playback channels: Mono
>    Mono: Playback [off]
> Simple mixer control 'HP',0
>    Capabilities: pvolume
>    Playback channels: Front Left - Front Right
>    Limits: Playback 0 - 39
>    Mono:
>    Front Left: Playback 33 [85%] [3.00dB]
>    Front Right: Playback 33 [85%] [3.00dB]
> Simple mixer control 'HPO L',0
>    Capabilities: pswitch pswitch-joined
>    Playback channels: Mono
>    Mono: Playback [on]
> Simple mixer control 'HPO MIX DAC1',0
>    Capabilities: pswitch pswitch-joined
>    Playback channels: Mono
>    Mono: Playback [on]
> Simple mixer control 'HPO MIX HPVOL',0
>    Capabilities: pswitch pswitch-joined
>    Playback channels: Mono
>    Mono: Playback [off]
> Simple mixer control 'HPO R',0
>    Capabilities: pswitch pswitch-joined
>    Playback channels: Mono
>    Mono: Playback [on]
> Simple mixer control 'HPOVOL L',0
>    Capabilities: pswitch pswitch-joined
>    Playback channels: Mono
>    Mono: Playback [off]
> Simple mixer control 'HPOVOL R',0
>    Capabilities: pswitch pswitch-joined
>    Playback channels: Mono
>    Mono: Playback [off]
> 
> 
> 

Keep going debugging,
add a dev_dbg to rockchip_i2s.c to compare the bclk rates.
and there is a difference in i2s vs. rt565 where the bclk frequency is 1/2 of
what i2s is using.

[   72.204217] rt5651 1-001a: Sysclk is 5644800Hz and clock id is 0
[   72.204922] rt5651 1-001a: framesize: 32
[   72.205272] rt5651 1-001a: bclk is 705600Hz and lrck is 22050Hz
[   72.205792] rt5651 1-001a: bclk_ms is 0 and pre_div is 0 for iis 0
[   72.206345] rockchip-i2s ff890000.i2s: mclk_rate: 5644800 bclk_rate: 1411200 
div_bclk: 4 div_lrck: 64



