Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0DB2327A3;
	Sat,  3 Jan 2026 00:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767400286; cv=none; b=hFV34XzwuWFa82UK6BnzkLSOowmncvZMlvkXQl1yyG5hU9JJuluuUTzaPmAiiWZnOViH0ySPS+g5rMEh05d5971CpETjJjixpHUOUO6Ou4dCqScoMY9670s/oLAhmJ7cpyRFyYE8JP4nDLO0x/onBEmLl9Ac8XsWx454qPpf85A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767400286; c=relaxed/simple;
	bh=zgzXzvFdxaYLbLeuKpgdWx5pNUtLI10Tthzi6zGaCTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QMyArZTDQdwRFjf7zYRn6wJ1DLgQ6UjQpyCpIUNBKLrG78nNdC2TmL535xKN95pLih7iE1THxELTHVKr4CGSLk9wnur0PpM88LdrnbuQgx625EwqJPkd4AB4m4tVwYJccvLoBXCMTzpQFUPVE6V/eCSO9MunaDnUabQ3xFzn86o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dI38Ytux; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dI38Ytux"
Message-ID: <0b18b97f-a5dc-4f24-9716-e1eb26ac85af@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767400276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aVTfFy7VZ9X9yL1qBU0oBLlC+4eHg5+jLAo8Z4HmgZ4=;
	b=dI38YtuxHyM4KLR8xe+pjILU9h76zmuHzez8Da8wL7SMFxkwguno6dyAb/BTMNwpe+Wxtn
	LJw1d9l3QpzWaFgxQKcrOsu0SM9MV18by7zIega/NrUnJrhRs2hSfuHhqyRpwEGdTA40MS
	/Z99HGdPQOdE/QA9RKIwAk7N4dJ+YVM=
Date: Fri, 2 Jan 2026 16:31:09 -0800
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
 <c7929aa2-93d4-40d5-aa6f-d554729f4bee@linux.dev>
 <CAGwozwH6A-NNCioS7J_EiTbxv2Y0B3YFXuyeWU_RMsW2Z+YsRA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <CAGwozwH6A-NNCioS7J_EiTbxv2Y0B3YFXuyeWU_RMsW2Z+YsRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 1/2/26 3:13 PM, Antheas Kapenekakis wrote:
> On Fri, 2 Jan 2026 at 21:17, Matthew Schwartz
> <matthew.schwartz@linux.dev> wrote:
>>
>> On 1/2/26 9:12 AM, Antheas Kapenekakis wrote:
>>> On Tue, 30 Dec 2025 at 22:44, Matthew Schwartz
>>> <matthew.schwartz@linux.dev> wrote:
>>>>
>>>>
>>>>
>>>>> On Dec 8, 2025, at 8:00 PM, Matthew Schwartz <matthew.schwartz@linux.dev> wrote:
>>>>>
>>>> - snip
>>>>> 2.52.0
>>>>
>>>> After reading the TI E2E forums, it seems these calibration tuning configurations are only meant to be used during a calibration process.
>>>
>>> A source would be good here, a link or two
>>
>> Sorry about that, here is where I read about the differences between the two configs:
>> https://e2e.ti.com/support/audio-group/audio/f/audio-forum/1558310/tas2563-what-is-the-difference-between-tuning-and-calibration-configuration-in-exported-smartamp-binary
> 
> This link describes "calibration" configurations that are used in the
> calibration procedure. It is not clear to me that it refers to the
> calibration parameters exported by UEFI or in the configuration itself
> to be used alongside a configuration. I would tend toward this being
> irrelevant.
> 
>> It's about a different amplifier model, but I assume the same applies to tas2781 given the naming structure is the same for the configurations.
>>
>>>
>>>> Instead, something else I found that works is not overriding the firmware file calibration data with the UEFI calibration data:
> 
> I misunderstood what you meant by this before. I thought you meant
> that the firmware overrode the UEFI data, not the other way around.
> Surely, using the dummy data in the firmware file is better than using
> incorrect data from UEFI. However, the manufacturer calibrated data
> from the factory floor for each specific unit is in UEFI, so that is
> what should be used.
> 
>>> I did not look into the source code, do you have any reference in the
>>> ACPI TAS code that r0_buf is prefilled with UEFI data?
>>
>> From what I understand, I think the current flow goes like this:
>>
>> 1. During driver init, tas2781_save_calibration() reads UEFI calibration data into the cali_data memory buffer and sets is_user_space_calidata=true: https://github.com/torvalds/linux/blob/master/sound/hda/codecs/side-codecs/tas2781_hda.c#L162-L173
>>
>> 2. When switching to a DSP config, tasdevice_select_tuningprm_cfg() calls tasdevice_load_data() which writes the firmware configuration, including any calibration values embedded in that config: https://github.com/torvalds/linux/blob/master/sound/soc/codecs/tas2781-fmwlib.c#L2510
>>
>> 3. Immediately after, tasdev_load_calibrated_data() writes the UEFI calibration data from step 1, overwriting the values just set in step 2: https://github.com/torvalds/linux/blob/9b043680446067358913edc2e9dd71bf8ffae208/sound/soc/codecs/tas2781-fmwlib.c#L2392-L2428 + https://github.com/torvalds/linux/blob/master/sound/soc/codecs/tas2781-fmwlib.c#L2519
>>
>> I confirmed this this by inserting some debug logs around tasdev_load_calibrated_data:
> 
> I went through the code. It loads the UEFI data, sets
> is_user_space_calidata=1, then if the data is available it loads it.
> This is correct.
> 
> To me this seems like the calibration data for amp 1 is written to
> both amp 1 and amp 2, and for your firmware this breaks amp2.

If this were the case, shouldn't my debug logs have the same data being written to dev 0 and dev 1?

[    6.367380] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 0 writing calibration: r0_reg=0x000ce4 data=3c5f7222
[    6.371718] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tasdev_load_calibrated_data: dev 1 writing calibration: r0_reg=0x000ce4 data=3c90e72d

> 
> In tasdev_load_calibrated_data(), an i index is provided, but
> cali_data is nested under priv. So only one calibration set is
> supported. This means that amp 2 gets amp 1 calibrations.
> 
> Perhaps there is a "SmartAmpCalibrationData2" that should be read
> instead for amp 2 instead, can you dump the EFI variables and check?

(128)(deck@steamdeck ~)$ ls /sys/firmware/efi/efivars/
AmdAcpiVar-79941ecd-ed36-49d0-8124-e4c31ac75cd4               BugCheckProgress-ba57e015-65b3-4c3c-b274-659192f699e3             MemoryOverwriteRequestControl-e20939be-32d4-41be-a150-897f85d49829
AmdMemMcsrTimeStamp-ba0fc662-3edc-4038-8060-5a980d46d09f      BuiltAsSecuredCorePC-77fa9abd-0359-4d32-bd60-28f4e78f784b         MemoryOverwriteRequestControlLock-bb983ccf-151d-40e1-a07b-4a17be168292
AMD_PBS_SETUP-a339d746-f678-49b3-9fc7-54ce0f9df226            CALI_DATA-1f52d2a1-bb3a-457d-bc09-43a3f4310a92                    MFG0-91b89306-5bac-4ae0-aab3-207ec12e989b
AMD_RAID-fe26a894-d199-47d4-8afa-070e3d54ba86                 ChainedLoaderDevicePartUUID-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f  MonotonicCounter-01368881-c4ad-4b1d-b631-d57a8ec8db6b
AmdSetup-3a997502-647a-4c82-998e-52ef9486a247                 ChainLoaderEntryFlags-399abb9b-4bee-4a18-ab5b-45c6e0e8c716        MyasusAutoInstall-607005d5-3f75-4b2e-98f0-85ba66797a3e
AMITCGPPIVAR-a8a2093b-fefa-43c1-8e62-ce526847265e             CloudRecoverySupport-607005d5-3f75-4b2e-98f0-85ba66797a3e         OA30-91b89306-5bac-4ae0-aab3-207ec12e989b
AodCoreInfo-5ed15dc0-edef-4161-9151-6014c4cc630c              CNFG-91b89306-5bac-4ae0-aab3-207ec12e989b                         OfflineUniqueIDEKPubCRC-eaec226f-c9a3-477a-a826-ddc716cdc0e3
AodCoreInfoTemp-5ed15dc0-edef-4161-9151-6014c4cc630c          ConIn-8be4df61-93ca-11d2-aa0d-00e098032b8c                        OfflineUniqueIDEKPub-eaec226f-c9a3-477a-a826-ddc716cdc0e3
AodSetupStx-5ed15dc0-edef-4161-9151-6014c4cc630c              ConInDev-8be4df61-93ca-11d2-aa0d-00e098032b8c                     OsIndicationsSupported-8be4df61-93ca-11d2-aa0d-00e098032b8c
ArmouryCrateStaticField-607005d5-3f75-4b2e-98f0-85ba66797a3e  ConOut-8be4df61-93ca-11d2-aa0d-00e098032b8c                       PK-8be4df61-93ca-11d2-aa0d-00e098032b8c
AsusClearPspNvram-6aae2279-b4d8-4cf9-aa2a-3607fdb4ccee        ConOutDev-8be4df61-93ca-11d2-aa0d-00e098032b8c                    PKDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c
AsusEDID-607005d5-3f75-4b2e-98f0-85ba66797a3e                 CurrentPolicy-77fa9abd-0359-4d32-bd60-28f4e78f784b                PlatformLang-8be4df61-93ca-11d2-aa0d-00e098032b8c
AsusGpnvVersion-607005d5-3f75-4b2e-98f0-85ba66797a3e          db-d719b2cb-3d3a-4596-a3bc-dad00e67656f                           PlatformLangCodes-8be4df61-93ca-11d2-aa0d-00e098032b8c
AsusManufactureVersion-607005d5-3f75-4b2e-98f0-85ba66797a3e   dbDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c                    SecureBoot-8be4df61-93ca-11d2-aa0d-00e098032b8c
AsusMcuPwrSaving-68ebf80b-5a73-415c-a363-045837cd9168         dbt-d719b2cb-3d3a-4596-a3bc-dad00e67656f                          SetupMode-8be4df61-93ca-11d2-aa0d-00e098032b8c
AsusPostLogoSound-607005d5-3f75-4b2e-98f0-85ba66797a3e        dbtDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c                   SIDSUPPORT-7d3dceee-cbce-4ea7-8709-6e552f1edbde
AsusVariable-607005d5-3f75-4b2e-98f0-85ba66797a3e             dbx-d719b2cb-3d3a-4596-a3bc-dad00e67656f                          SignatureSupport-8be4df61-93ca-11d2-aa0d-00e098032b8c
AuditMode-8be4df61-93ca-11d2-aa0d-00e098032b8c                dbxDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c                   SmbiosEntryPointTable-4b3082a3-80c6-4d7e-9cd0-583917265df1
AuthVarPreBootPhase-7b59104a-c00d-4158-87ff-f04d6396a915      DefaultBootOrder-45cf35f6-0d6e-4d04-856a-0370a5b16f53             SmbiosEntryPointTableF000-4b3082a3-80c6-4d7e-9cd0-583917265df1
BitLockerStatus-607005d5-3f75-4b2e-98f0-85ba66797a3e          DeployedMode-8be4df61-93ca-11d2-aa0d-00e098032b8c                 SmbiosScratchBuffer-4b3082a3-80c6-4d7e-9cd0-583917265df1
Boot0000-8be4df61-93ca-11d2-aa0d-00e098032b8c                 DeploymentModeNv-97e8965f-c761-4f48-b6e4-9ffa9cb2a2d6             SmbiosV3EntryPointTable-4b3082a3-80c6-4d7e-9cd0-583917265df1
Boot0001-8be4df61-93ca-11d2-aa0d-00e098032b8c                 _DMI-91b89306-5bac-4ae0-aab3-207ec12e989b                         SmmSupervisorVersion-d4adfc6f-2f58-4bcf-a887-05efb47d4299
Boot0002-8be4df61-93ca-11d2-aa0d-00e098032b8c                 EnableDIPM-a44da20b-add4-4ddf-bd44-2084a225e120                   SPIROMSIZE-4175b27b-b5ed-41e9-b532-45f3d1d61bef
Boot0003-8be4df61-93ca-11d2-aa0d-00e098032b8c                 EnableHIPM-a44da20b-add4-4ddf-bd44-2084a225e120                   Timeout-8be4df61-93ca-11d2-aa0d-00e098032b8c
Boot0004-8be4df61-93ca-11d2-aa0d-00e098032b8c                 ErrOut-8be4df61-93ca-11d2-aa0d-00e098032b8c                       TouchPanelDeviceInfo-8ee681db-b7a9-4684-b3cb-58ae37096492
Boot0005-8be4df61-93ca-11d2-aa0d-00e098032b8c                 FastBootOption-b540a530-6978-4da7-91cb-7207d764d262               TPMPERBIOSFLAGS-7d3dceee-cbce-4ea7-8709-6e552f1edbde
Boot0009-8be4df61-93ca-11d2-aa0d-00e098032b8c                 GAMING_CNFG-91b89306-5bac-4ae0-aab3-207ec12e989b                  TpmServFlags-7d3dceee-cbce-4ea7-8709-6e552f1edbde
Boot000A-8be4df61-93ca-11d2-aa0d-00e098032b8c                 HiiDB-1b838190-4625-4ead-abc9-cd5e6af18fe0                        UmaCarveOutDefault-0e5ce58d-e59b-4f93-904a-6ef2b97a41d7
Boot000B-8be4df61-93ca-11d2-aa0d-00e098032b8c                 HwErrRecSupport-8be4df61-93ca-11d2-aa0d-00e098032b8c              UmaCarveOutIndexDefault-cfff9da9-99ad-4e94-9ffd-02306b427b1f
Boot000C-8be4df61-93ca-11d2-aa0d-00e098032b8c                 KEK-8be4df61-93ca-11d2-aa0d-00e098032b8c                          UnlockIDCopy-eaec226f-c9a3-477a-a826-ddc716cdc0e3
Boot000D-8be4df61-93ca-11d2-aa0d-00e098032b8c                 KEKDefault-8be4df61-93ca-11d2-aa0d-00e098032b8c                   VendorKeys-8be4df61-93ca-11d2-aa0d-00e098032b8c
Boot000E-8be4df61-93ca-11d2-aa0d-00e098032b8c                 LanguageControl-74265840-9434-409e-9846-92d21e5daa65              WifiSetup-ec87d643-eba4-4bb5-a1e5-3f3e36b20da9
BootCurrent-8be4df61-93ca-11d2-aa0d-00e098032b8c              LastBoot-b540a530-6978-4da7-91cb-7207d764d262                     WifiSetupRecentConnectInfo-beca2d18-062a-47bd-b998-7f5befd4c523
BootOptionSupport-8be4df61-93ca-11d2-aa0d-00e098032b8c        LastBootFailed-b540a530-6978-4da7-91cb-7207d764d262               WIIM-beca2d18-062a-47bd-b998-7f5befd4c523
BootOrder-8be4df61-93ca-11d2-aa0d-00e098032b8c                LoaderDevicePartUUID-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f         WriteOnceStatus-4b3082a3-80c6-4d7e-9cd0-583917265df1
BugCheckCode-ba57e015-65b3-4c3c-b274-659192f699e3             LoaderInfo-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f
BugCheckParameter1-ba57e015-65b3-4c3c-b274-659192f699e3       MaximumTableSize-4b3082a3-80c6-4d7e-9cd0-583917265df1

There's only one EFI var that seems to be for calibration data:

xxd /sys/firmware/efi/efivars/CALI_DATA-1f52d2a1-bb3a-457d-bc09-43a3f4310a92:

00000000: 0700 0000 dd0a 0000 0300 0000 7e4a 9d68  ............~J.h
00000010: 0000 0000 2272 5f3c d515 f610 ac9a 9b2e  ...."r_<........
00000020: 5d91 9600 0000 8025 0100 0000 2de7 903c  ]......%....-..<
00000030: 283c e810 ffc8 c12e fcce 9600 0000 8025  (<.............%
00000040: 8000 0000 0000 1964 0000 1974 0000 197c  .......d...t...|
00000050: 0000 1560 0000 1a70 eb7f b12b            ...`...p...+

> 
> In that case, a minor refactor to move cali_data and
> is_user_space_calidata from priv to priv->tasdevice[i] and then use
> the proper efi var would fix this.
> 
> Antheas
> 
>> [    3.908963] tas2781-hda i2c-TXNW2781:00-tas2781-hda.0: tas2781_apply_calib: dspbin_typ=2, ndev=2, Setting is_user_space_calidata=true
>> <snip>
>>
>> where it loads the UEFI calibration over top of the firmware calibration.
>>
>>>
>>> It could be that there is a specific priority, where UEFI data is
>>> supposed to be loaded after the firmware code, replacing the
>>> calibration data from the file, or that is what is done in Windows.
>>> But here it is done the other way. In that case, it might be more
>>> appropriate to set a dummy var such as bool uefi_calib that becomes 1
>>> when loading calibration from UEFI, and skip loading from the fw file
>>> if available.
>>>
>>> But links, etc. Here, this would affect all TAS devices too, so it is
>>> more major.
>>
>> Yes, was really hoping to get TI's feedback before potentially sending it out, as it would be a major change and the documentation on this is scarce. I could also be misunderstanding the calibration data load flow, but this is just from poking at this issue from every angle I can think of.
>>
>> Happy new year,
>> Matt
>>
>>>
>>> Happy new year,
>>> Antheas
>>>
>>>> diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
>>>> index 78fd0a5dc6f2..1e768e6187da 100644
>>>> --- a/sound/soc/codecs/tas2781-fmwlib.c
>>>> +++ b/sound/soc/codecs/tas2781-fmwlib.c
>>>> @@ -2377,6 +2377,7 @@ static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
>>>>         unsigned char *data = cali_data->data;
>>>>         struct tasdevice_calibration *cal;
>>>>         int k = i * (cali_data->cali_dat_sz_per_dev + 1);
>>>> +       unsigned char r0_buf[4];
>>>>         int rc;
>>>>
>>>>         /* Load the calibrated data from cal bin file */
>>>> @@ -2389,6 +2390,20 @@ static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
>>>>         }
>>>>         if (!priv->is_user_space_calidata)
>>>>                 return;
>>>> +
>>>> +       /*
>>>> +        * Check if the DSP config already set the calibration registers.
>>>> +        * Some tuning configs contain their own calibration data which should
>>>> +        * not be overwritten by user space calibration data.
>>>> +        */
>>>> +       rc = tasdevice_dev_bulk_read(priv, i, p->r0_reg, r0_buf, 4);
>>>> +       if (rc >= 0 && (r0_buf[0] | r0_buf[1] | r0_buf[2] | r0_buf[3])) {
>>>> +               dev_dbg(priv->dev,
>>>> +                       "%s: dev %d r0_reg already set by config, skipping calibration\n",
>>>> +                       __func__, i);
>>>> +               return;
>>>> +       }
>>>> +
>>>>         /* load calibrated data from user space */
>>>>         if (data[k] != i) {
>>>>                 dev_err(priv->dev, "%s: no cal-data for dev %d from usr-spc\n",
>>>>
>>>> Is this more suitable to be upstreamed?
>>>>
>>>> Thanks,
>>>> Matt
>>>> <snip>
>>>>
>>>
>>
>>
> 

