Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D39713B293
	for <linux-sound@vger.kernel.org>; Fri,  2 Jan 2026 19:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767381447; cv=none; b=suIPj3Y+fpa+aASfoTowNZmXJ//ehiDKbDsc5MjMIHDCP0aaaI9qxkpoV4FV6eamVoQ71f3QevylM18MkE6KDgyAlLANpLO32bMsu1pTQZbJtsQa4N0FaCr5+7c1HmxRwNSXDOS0b18F2SKD1C5yJRyY1t1vr4P59vsHotIDiBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767381447; c=relaxed/simple;
	bh=Zgx5qbXfSO9bqabupLn89dLRqFynj3Djd+F5S3jZYF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ulgj2I6C7pY1hcgVz3zhgCW5fjVVjCWwJcYV5x3nvZnC+qJnvZKwYv8U/14OpgAkK+JzrGzneNviNf6RAvgx9pjNUNlkUtzLdUU9Vmt9ovPerYTLxhSP1oZAAw+U8FVhy2KJB0l0+IoJZ50aa8nXwNIa5i4MiAIwxnlQQv0ROJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rX58L5fH; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rX58L5fH"
Message-ID: <c7929aa2-93d4-40d5-aa6f-d554729f4bee@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767381432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2LTj/SH+86JUADoV0UEdZ+hlvRyGo2M5qNIOwDT4iNs=;
	b=rX58L5fHIKBOfWxc2BPDJmHaE9P88rLhGiAI0/Yr/IvJC6kYTquk6slKre/ifFlsq2KW21
	QxCD1J+yhXQ2sVR7zCt75n96xB0XqBgdSn3lTmkJUNcXfWM8NUB6pR9qKZPFqwxLd/mkOa
	X+bT/Pms33S4SSiKVOBf8jqLSb7kfrs=
Date: Fri, 2 Jan 2026 11:16:57 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [BUG] hda/tas2781: ASUS ROG Xbox Ally X audio issues with default
 firmware
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Baojun Xu <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>,
 linux-sound@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, tiwai@suse.de
References: <0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev>
 <2d8b782c-a97c-4521-9307-a2cf8934802a@linux.dev>
 <288f6482-9a6b-4362-ac97-18043659deb7@linux.dev>
 <09148B42-71C2-4428-8D21-903F85853091@linux.dev>
 <CAGwozwEJRDq96ZUQv+8H5fiXBVQ2jFvvuK48WpDqZ0eQ_NB+NA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <CAGwozwEJRDq96ZUQv+8H5fiXBVQ2jFvvuK48WpDqZ0eQ_NB+NA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 1/2/26 9:12 AM, Antheas Kapenekakis wrote:
> On Tue, 30 Dec 2025 at 22:44, Matthew Schwartz
> <matthew.schwartz@linux.dev> wrote:
>>
>>
>>
>>> On Dec 8, 2025, at 8:00 PM, Matthew Schwartz <matthew.schwartz@linux.dev> wrote:
>>>
>> - snip
>>> 2.52.0
>>
>> After reading the TI E2E forums, it seems these calibration tuning configurations are only meant to be used during a calibration process.
> 
> A source would be good here, a link or two

Sorry about that, here is where I read about the differences between the two configs:
https://e2e.ti.com/support/audio-group/audio/f/audio-forum/1558310/tas2563-what-is-the-difference-between-tuning-and-calibration-configuration-in-exported-smartamp-binary

It's about a different amplifier model, but I assume the same applies to tas2781 given the naming structure is the same for the configurations.

> 
>> Instead, something else I found that works is not overriding the firmware file calibration data with the UEFI calibration data:
> 
> I did not look into the source code, do you have any reference in the
> ACPI TAS code that r0_buf is prefilled with UEFI data?

From what I understand, I think the current flow goes like this:

1. During driver init, tas2781_save_calibration() reads UEFI calibration data into the cali_data memory buffer and sets is_user_space_calidata=true: https://github.com/torvalds/linux/blob/master/sound/hda/codecs/side-codecs/tas2781_hda.c#L162-L173

2. When switching to a DSP config, tasdevice_select_tuningprm_cfg() calls tasdevice_load_data() which writes the firmware configuration, including any calibration values embedded in that config: https://github.com/torvalds/linux/blob/master/sound/soc/codecs/tas2781-fmwlib.c#L2510

3. Immediately after, tasdev_load_calibrated_data() writes the UEFI calibration data from step 1, overwriting the values just set in step 2: https://github.com/torvalds/linux/blob/9b043680446067358913edc2e9dd71bf8ffae208/sound/soc/codecs/tas2781-fmwlib.c#L2392-L2428 + https://github.com/torvalds/linux/blob/master/sound/soc/codecs/tas2781-fmwlib.c#L2519

I confirmed this this by inserting some debug logs around tasdev_load_calibrated_data:

[    3.908963] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_apply_calib: dspbin_typ=2, ndev=2, Setting is_user_space_calidata=true
[    6.215164] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdevice_tuning_switch: state=0, cur_prog=0, cur_conf=0, profile_cfg_id=0
[    6.215169] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdevice_tuning_switch: fw_state=3, is_user_space_calidata=1
[    6.215171] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdevice_select_tuningprm_cfg: Loading config[0] name='configuration_RC73_Veco_ISLR100_Tuning Mode_48 KHz_s2_0' nr_blk=8
[    6.365075] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev=0, is_user_space_calidata=1, cal_fmw=0000000000000000
[    6.365081] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: Loading user-space calibration for dev 0
[    6.365668] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 0 BEFORE r0_reg=0x000ce4: 408f5c29
[    6.366039] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 0 BEFORE invr0_reg=0x000cf4: 0fdc788c
[    6.366411] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 0 BEFORE r0_low_reg=0x000cfc: 0f7e9100
[    6.366889] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 0 BEFORE pow_reg=0x000ae0: 009b5281
[    6.367378] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 0 BEFORE tlimit_reg=0x000d70: 25800000
[    6.367380] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 0 writing calibration: r0_reg=0x000ce4 data=3c5f7222
[    6.367831] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 0 writing r0_low_reg=0x000cfc data=2e9b9aac
[    6.368168] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 0 writing invr0_reg=0x000cf4 data=10f615d5
[    6.368511] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 0 writing pow_reg=0x000ae0 data=0096915d
[    6.368963] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 0 writing tlimit_reg=0x000d70 data=25800000
[    6.369414] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev=1, is_user_space_calidata=1, cal_fmw=0000000000000000
[    6.369415] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: Loading user-space calibration for dev 1
[    6.370005] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 1 BEFORE r0_reg=0x000ce4: 40cccccd
[    6.370374] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 1 BEFORE invr0_reg=0x000cf4: 0fcd6e9e
[    6.370750] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 1 BEFORE r0_low_reg=0x000cfc: 0f8d4fdf
[    6.371233] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 1 BEFORE pow_reg=0x000ae0: 009b9c58
[    6.371716] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 1 BEFORE tlimit_reg=0x000d70: 25800000
[    6.371718] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 1 writing calibration: r0_reg=0x000ce4 data=3c90e72d
[    6.372173] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 1 writing r0_low_reg=0x000cfc data=2ec1c8ff
[    6.372514] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 1 writing invr0_reg=0x000cf4 data=10e83c28
[    6.372853] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 1 writing pow_reg=0x000ae0 data=0096cefc
[    6.373305] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 1 writing tlimit_reg=0x000d70 data=25800000

where it loads the UEFI calibration over top of the firmware calibration.

> 
> It could be that there is a specific priority, where UEFI data is
> supposed to be loaded after the firmware code, replacing the
> calibration data from the file, or that is what is done in Windows.
> But here it is done the other way. In that case, it might be more
> appropriate to set a dummy var such as bool uefi_calib that becomes 1
> when loading calibration from UEFI, and skip loading from the fw file
> if available.
> 
> But links, etc. Here, this would affect all TAS devices too, so it is
> more major.

Yes, was really hoping to get TI's feedback before potentially sending it out, as it would be a major change and the documentation on this is scarce. I could also be misunderstanding the calibration data load flow, but this is just from poking at this issue from every angle I can think of. 

Happy new year,
Matt

> 
> Happy new year,
> Antheas
> 
>> diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
>> index 78fd0a5dc6f2..1e768e6187da 100644
>> --- a/sound/soc/codecs/tas2781-fmwlib.c
>> +++ b/sound/soc/codecs/tas2781-fmwlib.c
>> @@ -2377,6 +2377,7 @@ static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
>>         unsigned char *data = cali_data->data;
>>         struct tasdevice_calibration *cal;
>>         int k = i * (cali_data->cali_dat_sz_per_dev + 1);
>> +       unsigned char r0_buf[4];
>>         int rc;
>>
>>         /* Load the calibrated data from cal bin file */
>> @@ -2389,6 +2390,20 @@ static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
>>         }
>>         if (!priv->is_user_space_calidata)
>>                 return;
>> +
>> +       /*
>> +        * Check if the DSP config already set the calibration registers.
>> +        * Some tuning configs contain their own calibration data which should
>> +        * not be overwritten by user space calibration data.
>> +        */
>> +       rc = tasdevice_dev_bulk_read(priv, i, p->r0_reg, r0_buf, 4);
>> +       if (rc >= 0 && (r0_buf[0] | r0_buf[1] | r0_buf[2] | r0_buf[3])) {
>> +               dev_dbg(priv->dev,
>> +                       "%s: dev %d r0_reg already set by config, skipping calibration\n",
>> +                       __func__, i);
>> +               return;
>> +       }
>> +
>>         /* load calibrated data from user space */
>>         if (data[k] != i) {
>>                 dev_err(priv->dev, "%s: no cal-data for dev %d from usr-spc\n",
>>
>> Is this more suitable to be upstreamed?
>>
>> Thanks,
>> Matt
>> <snip>
>>
> 

