Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F021279DCA
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 03:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767842960; cv=none; b=giQMglCW0RBeXL2teahHDnRtXm3yHjzk/hyuKY2d23WkSpkpRnVP5ao+BQw4XtzrsSJgRqerBQlqTZs5GWmUT/pszT2rdowsXVai9fIjsVQjB/QXgU+Pb0ejfzCsbE9MZWq2/FFaO1oa4lPZfovncISBkrJ0Xf+OhlkikRjiNaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767842960; c=relaxed/simple;
	bh=7uGJS9/dBOzyDh3XRHOFkPLTIWySqc6mwhJsJmITg6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bOAI3mPG8r1WbEhR+2roDKmXl2CWwLaN3o61EiSOvDhm0AkQMfQNwvyWVKuY2Tt9xFJlaL1VrPTBlfgvdE5zCT8Sx0BGE3s+VFjK67R7TsD2ebkCX0w5ewOctPUHa4q9Jcj2oPbq7uXRhXwIe/xRuzEY6ZLQjwddZZuTZIAdo6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TF7gnBNF; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TF7gnBNF"
Message-ID: <a74b90ee-5885-4acc-88f0-60642e0284e5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767842956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YMV/an3UFzjodQ+Gd71/k9nZfFwTkL6lKrky5uVZxO0=;
	b=TF7gnBNFi639JvGioiFVVIWtLCJ8yDfMuYtoHsUDKjih717Vpkx/FHsUdhzUwTLfq0Betb
	KOPgSr6JKAtQM2RFfahP/zzycL0YWTvH61P1nb4Aje4whKGrLdTfUIupHcCKjxMtjxxjJ6
	Q6KSRNrqE26/63edW6ho4jevImAtiHs=
Date: Wed, 7 Jan 2026 19:29:11 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Prevent throwing away custom
 calibration addresses
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 tiwai@suse.de, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <862C1A43-9C43-404F-A940-920FCD7D1919@linux.dev>
 <CAGwozwGXCe-nDi7moPvPH++_Bz687Ksffe1GU37qcTxR2ygx+g@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <CAGwozwGXCe-nDi7moPvPH++_Bz687Ksffe1GU37qcTxR2ygx+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 1/7/26 2:21 AM, Antheas Kapenekakis wrote:
> On Wed, 7 Jan 2026 at 12:17, Matthew Schwartz
> <matthew.schwartz@linux.dev> wrote:
>>
>>
>>
>>> On Jan 7, 2026, at 1:32 AM, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>>
>>> ﻿The V2 UEFI spec for per-device calibration data in TAS allows for
>>> manufacturers to specify up to five custom calibration register
>>> addresses and values to optimize per-device in factory.
>>>
>>> A basic description of the spec is found in a comment in function
>>> tas2781_apply_calib(). However, currently, for the condition of
>>> p->dspbin_typ != TASDEV_BASIC, if custom calibration addresses have been
>>> provided by the manufacturer, they are ignored and the ones listed in
>>> firmware are used.
>>>
>>> In case the manufacturer chose to change different registers other than
>>> the default ones (r0, invr0, r0_low, pow, tlimit), this causes the
>>> UEFI calibration data to scratch different registers and cause the
>>> firmware to misbehave. This is true in the Xbox ROG Ally X, for one of
>>> the firmwares, where it pops and has audio dropouts after the
>>> calibration data is applied.
>>>
>>> Therefore, add a new bool to indicate that UEFI supplied custom
>>> calibration addresses, and if so, use them regardless of dspbin_typ.
>>>
>>> Link: https://lore.kernel.org/all/CAGwozwFQKoQgo_Q=qdr-FTD+uoVWA8AtHyDmKwTOV4ZU6+F3SQ@mail.gmail.com/
>>> Reported-by: Matthew Schwartz <matthew.schwartz@linux.dev>
>>> Closes: https://lore.kernel.org/all/0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev/
>>> Co-developed-by: Matthew Schwartz <matthew.schwartz@linux.dev>
>>> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>
>>> ---
>>> @Matt: can you kindly verify this patch works for you?
>>
>> I’ll have time to debug it more in the morning but the patch does not work, it’s still using the same calibrated data as before with dropouts.
> 
> If you can check that the register addresses changed that would be
> great. Especially that we enter and exit the calibration block.
> Perhaps that was happening before as well and the addresses were
> overwritten by firmware later

[    2.415699] snd_hda_codec_alc269 hdaudioC1D0: bound i2c-TXNW2781:00-tas2781-hda.0 (ops tas2781_hda_comp_ops [snd_hda_scodec_tas2781_i2c])
[    2.417548] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: dspbin_type_check: ppcver=0x19500 -> dspbin_typ=2 (0=none,1=BASIC,2=ALPHA,3=BETA)
[    3.809849] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_apply_calib: enter, dspbin_typ=2, chip_id=0xadd
[    3.809855] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_apply_calib: default cali_reg: r0=0xbf4 invr0=0xc0c r0_low=0xc14 pow=0x9f0 tlimit=0xc7c
[    3.809858] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_apply_calib: UEFI custom cali_reg found: r0=0xce4 invr0=0xcf4 r0_low=0xcfc pow=0xae0 tlimit=0xd70
[    3.809860] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_apply_calib: using cali_reg for r->regs (custom_addr=1, dspbin_typ=2)
[    3.809861] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_apply_calib: exit, total_sz=42, is_user_space_calidata=1
[    6.180351] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_hda_playback_hook: action = 0
[    6.330017] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: enter dev 0, is_user_space_calidata=1
[    6.330021] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: writing UEFI cal data to regs: r0=0xce4 invr0=0xcf4 r0_low=0xcfc pow=0xae0 tlimit=0xd70
[    6.330022] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: cal values: r0=3c5f7222 invr0=10f615d5
[    6.332137] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: enter dev 1, is_user_space_calidata=1
[    6.332138] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: writing UEFI cal data to regs: r0=0xce4 invr0=0xcf4 r0_low=0xcfc pow=0xae0 tlimit=0xd70
[    6.332138] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: cal values: r0=3c90e72d invr0=10e83c28

Looks like the addresses changed. I'm just going to send out a patch to skip calibration for the device as Jim suggested, as that is confirmed to work.

> 
> Antheas
> 
>>>
>>> Then verify your sign-off for the coby tag. If you would rather a
>>> different acknowledgment tag (e.g., tested-by or suggested-by), lmk
>>>
>>> Thanks.
>>> Antheas
>>> ---
>>> sound/hda/codecs/side-codecs/tas2781_hda.c | 4 +++-
>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda.c b/sound/hda/codecs/side-codecs/tas2781_hda.c
>>> index 96e6d82dc69e..6efdf0a3442b 100644
>>> --- a/sound/hda/codecs/side-codecs/tas2781_hda.c
>>> +++ b/sound/hda/codecs/side-codecs/tas2781_hda.c
>>> @@ -64,6 +64,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
>>>       TASDEVICE_REG(0, 0x18, 0x7c),
>>>   };
>>>   unsigned int crc, oft, node_num;
>>> +    bool custom_addr = false;
>>>   unsigned char *buf;
>>>   int i, j, k, l;
>>>
>>> @@ -104,6 +105,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
>>>       for (j = 0, k = 0; j < node_num; j++) {
>>>           oft = j * 6 + 3;
>>>           if (tmp_val[oft] == TASDEV_UEFI_CALI_REG_ADDR_FLG) {
>>> +                custom_addr = true;
>>>               for (i = 0; i < TASDEV_CALIB_N; i++) {
>>>                   buf = &data[(oft + i + 1) * 4];
>>>                   cali_reg[i] = TASDEVICE_REG(buf[1],
>>> @@ -151,7 +153,7 @@ static void tas2781_apply_calib(struct tasdevice_priv *p)
>>>       }
>>>   }
>>>
>>> -    if (p->dspbin_typ == TASDEV_BASIC) {
>>> +    if (custom_addr || p->dspbin_typ == TASDEV_BASIC) {
>>>       r->r0_reg = cali_reg[0];
>>>       r->invr0_reg = cali_reg[1];
>>>       r->r0_low_reg = cali_reg[2];
>>>
>>> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
>>> --
>>> 2.52.0
>>
> 

