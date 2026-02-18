Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E23D343D7F;
	Wed, 18 Feb 2026 16:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771430544; cv=pass; b=VCPbF4LYahK9V7wF1K52uNbQZXccWtEl3ca5mLm+RXhWW7kM0qi6hSeJERmGFjjoYWkEykDQVMlzwNg2S79MBMAAF/XTLYnvvj3PQvSVJUEQ5LX8tGuhFsoZmleGnLOMoKG0ahLX8lZvNHwUl2g9vW6OBeIk3yYl6dKybjCRZZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771430544; c=relaxed/simple;
	bh=1rvPIIi4h8xY84oHU5RjQB/rNIcvjO16trs8HGrYib4=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=N7IuSTPGVZfgFqr27jbdSRZRkBTUC1nh073fl67dr1/VtHt7OkT5GZlzOWIrefsMQq/2b9vM9XmYpGXhrZRm+SMplXJveUItYStpa4Wv9TXymDBPRFAfdNEo6yog8qbetUtC76BaljIceHwP/Z+cGSpCrzA0IBNtJYV8X69PhVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=O7UoA6ND; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="O7UoA6ND"
ARC-Seal: i=1; a=rsa-sha256; t=1771430507; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OkYC7Kjk4iFQ7Wj235FoHabtSPR0Z/t7HDc0woy83kSa58IypS9xb59LRv/NEiPnSCL+4XZNyhETAbIj6w3i8KrgmkPcREC7ArW91BQD3IHNh06xl1646yFJTtC7QyojTsSae7neh8MQelulltKHdQk7jriMuejmp8aNhm13TRg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771430507; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qrN1DqLTdQHmKSmkzyv6qmv41jOxmqT0TGHhkOY3204=; 
	b=bNI5rT1LyyIJFi3NKPZ8yxW4pAmteI5PeQ394AOAR3OI+gnvuum6gSsOWM3CSAsG+38wrD3NJyfO2Tb3Xgo9W9RNxGsOYclcTja2wl1wY0soJAi1pWM7RsFKTPjOElPGlqR8l/ts72uTdkbmautyeRNoWTZBj8Wutz74DrONtTs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771430507;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=Content-Type:Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Message-Id:Reply-To;
	bh=qrN1DqLTdQHmKSmkzyv6qmv41jOxmqT0TGHhkOY3204=;
	b=O7UoA6NDRSrlj8Y4L67/svoF77IiW4VKDao9Ns9MOWCWwocJd9dQLMoXP+Y/F7rm
	fFRpnZyZS0cKAQTzjv2BKamwVl9yGx5wMGquJLRoIpWptlZGbvx0m3jkwSFiEQ5J8/V
	wYXxO5/C7XZPwLpnW2+AwJ168ogmDbB3c1Wo53Mc=
Received: by mx.zohomail.com with SMTPS id 1771430504557384.40031491399884;
	Wed, 18 Feb 2026 08:01:44 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------NsrepD4PzYz0aHUDNLQur39l"
Message-ID: <34f61d25-607c-4967-bc67-3c7517c7fe14@collabora.com>
Date: Wed, 18 Feb 2026 11:01:42 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-kernel@vger.kernel.org
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, alexandre.belloni@bootlin.com,
 thomas.petazzoni@bootlin.com
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
 <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
 <DGI2YVYBECUM.3O0UN9VMKF7FJ@bootlin.com>
Content-Language: en-US
From: Detlev Casanova <detlev.casanova@collabora.com>
In-Reply-To: <DGI2YVYBECUM.3O0UN9VMKF7FJ@bootlin.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/271.423.95
X-ZohoMailClient: External

This is a multi-part message in MIME format.
--------------NsrepD4PzYz0aHUDNLQur39l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lucas, sorry for breaking support on your board.
I'm also surprised that you were not added in CC of the original patch.

Can you try to keep the patch and apply the attached one instead ?

Detlev.

On 2/18/26 07:19, Luca Ceresoli wrote:
> Hello Detlev,
>
> On Tue Feb 10, 2026 at 10:54 AM CET, Luca Ceresoli wrote:
>> Hello Detlev,
>>
>> On Fri Jan 17, 2025 at 5:31 PM CET, Detlev Casanova wrote:
>>> In commit
>>> 9e2ab4b18ebd ("ASoC: rockchip: i2s-tdm: Fix inaccurate sampling rates"),
>>> the set_sysclk callback was removed as considered unused as the mclk rate
>>> can be set in the hw_params callback.
>>> The difference between hw_params and set_sysclk is that the former is
>>> called with the audio sampling rate set in the params (e.g.: 48000 Hz)
>>> while the latter is called with a clock rate already computed with
>>>    sampling_rate * mclk-fs (e.g.: 48000 * 256)
>>>
>>> For HDMI audio using the Rockchip I2S TDM driver, the mclk-fs value must
>>> be set to 128 instead of the default 256, and that value is set in the
>>> device tree at the machine driver level (like a simple-audio-card
>>> compatible node).
>>> Therefore, the i2s_tdm driver has no idea that another mclk-fs value can
>>> be configured and simply computes the mclk rate in the hw_params callback
>>> with DEFAULT_MCLK_FS * params_rate(params), which is wrong for HDMI
>>> audio.
>>>
>>> Re-add the set_sysclk callback so that the mclk rate is computed by the
>>> machine driver which has the correct mclk-fs value set in its device tree
>>> node.
>> I'm afraid I just found this commit breaks audio capture on the RK3308.
>>
>> Using 'arecord -Vmono -d 2 -c 8 -f S16_LE -r 96000 /dev/null' I get:
>>
>>    rockchip-i2s-tdm ff320000.i2s: ASoC error (-22): at snd_soc_dai_hw_params() on ff320000.i2s
>>     ff320000.i2s-rk3308-hifi: ASoC error (-22): at __soc_pcm_hw_params() on ff320000.i2s-rk3308-hifi
>>
>> Tested on:
>>
>>   * Radxa Rock Pi S
>>   * Upstream kernel
>>   * arm64 defconfig
>>
>> Tested kernel versions:
>>
>>   * v6.12 works
>>   * 5323186e2e8d (this commit) fails
>>   * 5323186e2e8d^ works
>>   * 21cfbeae7d7c (same patch on stable/linux-6.12.y) fails
>>   * 21cfbeae7d7c^ works
>>   * v6.19 fails
>>   * v6.19 + 'git revert 5323186e2e8d' works
>>
>> I don't have more information at the moment.
> Let me add some more info to my previous report.
>
> The function failing is clk_set_rate() in rockchip_i2s_tdm_hw_params().
>
> I added some logging to rockchip_i2s_tdm_hw_params() and here's the output:
>
>    On v6.19-11566-g254edc893f3a (current Linux master)
>
>    At boot:
>      [    3.324622] rockchip-i2s-tdm ff320000.i2s: The target mclk_tx freq is: 50176000
>      [    3.324720] rockchip-i2s-tdm ff320000.i2s: using zero-initialized flat cache, this may cause unexpected behavior
>    When launching arecord:
>      [   18.429389] rockchip_i2s_tdm_hw_params:653 i2s_tdm->is_master_mode = 1
>      [   18.430154] rockchip_i2s_tdm_hw_params:654 i2s_tdm->mclk_tx clk_i2s2_8ch_tx
>      [   18.430815] rockchip_i2s_tdm_hw_params:655 i2s_tdm->mclk_rx clk_i2s2_8ch_rx
>      [   18.431465] rockchip_i2s_tdm_hw_params:656 i2s_tdm->mclk_tx_freq 50176000
>      [   18.432097] rockchip_i2s_tdm_hw_params:657 i2s_tdm->mclk_rx_freq 0
>      [   18.432677] rockchip_i2s_tdm_hw_params:658 i2s_tdm->clk_trcm 0
>      [   18.433230] rockchip_i2s_tdm_hw_params:659 substream->stream 1
>      [   18.433858] rockchip_i2s_tdm_hw_params:678 mclk clk_i2s2_8ch_rx
>      [   18.434423] rockchip_i2s_tdm_hw_params:679 mclk_rate 0
>      [   18.434977] rockchip_i2s_tdm_hw_params:682 clk_set_rate(clk_i2s2_8ch_rx, 0) returned -22
>      [   18.435743] rockchip-i2s-tdm ff320000.i2s: ASoC error (-22): at snd_soc_dai_hw_params() on ff320000.i2s
>      [   18.436699]  ff320000.i2s-rk3308-hifi: ASoC error (-22): at __soc_pcm_hw_params() on ff320000.i2s-rk3308-hifi
>
>    On v6.19-11566-g254edc893f3a + 'git revert 5323186e2e8d'
>
>    At boot:
>      [    3.283853] rockchip-i2s-tdm ff320000.i2s: using zero-initialized flat cache, this may cause unexpected behavior
>    When launching arecord:
>      [   11.952290] rockchip_i2s_tdm_hw_params:631 i2s_tdm->is_master_mode = 1
>      [   11.952955] rockchip_i2s_tdm_hw_params:632 i2s_tdm->mclk_tx clk_i2s2_8ch_tx
>      [   11.953615] rockchip_i2s_tdm_hw_params:633 i2s_tdm->mclk_rx clk_i2s2_8ch_rx
>      [   11.954355] rockchip_i2s_tdm_hw_params:636 i2s_tdm->clk_trcm 0
>      [   11.954917] rockchip_i2s_tdm_hw_params:637 substream->stream 1
>      [   11.955477] rockchip_i2s_tdm_hw_params:652 mclk clk_i2s2_8ch_rx
>      [   11.956048] rockchip_i2s_tdm_hw_params:653 params_rate(params) 96000
>      [   11.956769] rockchip_i2s_tdm_hw_params:656 clk_set_rate(clk_i2s2_8ch_rx, 24576000) returned 0
>
> I cannot point to the right fix but the value 0 in i2s_tdm->mclk_rx_freq
> appears as a good clue, perhaps it has never been set.
>
> I hope this helps.
>
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
--------------NsrepD4PzYz0aHUDNLQur39l
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-sound-rockchip-Use-param-freq-if-not-provided-by-set.patch"
Content-Disposition: attachment;
 filename*0="0001-sound-rockchip-Use-param-freq-if-not-provided-by-set.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBmMjQ0MTg1OWMzNjhmZTI1NTEyYTcxZTgyMTYwYjBhMzA3ZWQ0NDI5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBEZXRsZXYgQ2FzYW5vdmEgPGRldGxldi5jYXNhbm92
YUBjb2xsYWJvcmEuY29tPgpEYXRlOiBXZWQsIDE4IEZlYiAyMDI2IDEwOjQ2OjUwIC0wNTAw
ClN1YmplY3Q6IFtQQVRDSF0gc291bmQ6IHJvY2tjaGlwOiBVc2UgcGFyYW0gZnJlcSBpZiBu
b3QgcHJvdmlkZWQgYnkgc2V0X3N5c2NsawoKSGkgTHVjYXMsIHNvcnJ5IGZvciBicmVha2lu
ZyBzdXBwb3J0IG9uIHlvdXIgYm9hcmQuCkknbSBhbHNvIHN1cnByaXNlZCB0aGF0IHlvdSB3
ZXJlIG5vdCBhZGRlZCBpbiBDQyBvZiB0aGUgb3JpZ2luYWwgcGF0Y2guCgpDYW4geW91IHRy
eSB0byBrZWVwIHRoZSBwYXRjaCBhbmQgYXBwbHkgdGhpcyBpbnN0ZWFkID8KCkRyaXZlcnMg
d2lsbCBub3QgYWx3YXlzIHNldCB0aGUgc3lzY2xrLgpJZiB0aGF0IGlzIHRoZSBjYXNlLCB1
c2UgdGhlIGNsb2NrIHNldCBpbiB0aGUgcGFyYW1zIG11bHRpcGxpZWQgYnkgdGhlCmRlZmF1
bHQgbWNsay1mcy4KCi0tLQogc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX2kyc190ZG0u
YyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX2kyc190ZG0uYyBiL3NvdW5kL3Nv
Yy9yb2NrY2hpcC9yb2NrY2hpcF9pMnNfdGRtLmMKaW5kZXggNzcwYjliZmJiMzg0Li5mMmNk
YTdlNjRiNzQgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9yb2NrY2hpcC9yb2NrY2hpcF9pMnNf
dGRtLmMKKysrIGIvc291bmQvc29jL3JvY2tjaGlwL3JvY2tjaGlwX2kyc190ZG0uYwpAQCAt
NjY1LDYgKzY2NSwxMiBAQCBzdGF0aWMgaW50IHJvY2tjaGlwX2kyc190ZG1faHdfcGFyYW1z
KHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLAogCQkJbWNsa19yYXRlID0g
aTJzX3RkbS0+bWNsa19yeF9mcmVxOwogCQl9CiAKKwkJLyogSWYgdGhlIGRhaS9jb21wb25l
bnQgZHJpdmVyIGRpZG4ndCBjYWxsIHNldF9zeXNjbGsoKSwgc2ltcGx5CisJCSAqIHVzZSB0
aGUgZnJlcSBmcm9tIHRoZSBwYXJhbXMuCisJCSAqLworCQlpZiAoIW1jbGtfcmF0ZSkKKwkJ
CW1jbGtfcmF0ZSA9IERFRkFVTFRfTUNMS19GUyAqIHBhcmFtc19yYXRlKHBhcmFtcyk7CisK
IAkJZXJyID0gY2xrX3NldF9yYXRlKG1jbGssIG1jbGtfcmF0ZSk7CiAJCWlmIChlcnIpCiAJ
CQlyZXR1cm4gZXJyOwotLSAKMi41My4wCgo=

--------------NsrepD4PzYz0aHUDNLQur39l--
