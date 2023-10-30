Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07273C4332F
	for <linux-sound@archiver.kernel.org>; Mon, 30 Oct 2023 12:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232979AbjJ3MPl (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Mon, 30 Oct 2023 08:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjJ3MPk (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Mon, 30 Oct 2023 08:15:40 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE3B6CC
        for <linux-sound@vger.kernel.org>; Mon, 30 Oct 2023 05:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698668138; x=1730204138;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=A1MRYlb5eiyY5x1I+6oe/5jLsE4NugEzWN3sEtgDzOQ=;
  b=lLUhht7b/Rp6EszjUDW6oSho5tDi9dyBNClZi3W3XSNJp1rAWQXmMTec
   VTF1IAmMGPxkSDeNMiJmAxoj1plqbUsYjlmSg6etuhma2LkdIsbRnUOp/
   MBsx9MGS0kOSRqXttkFyFZzwNoe/R9qiVNX4CRNzTDmh76I0ktiaRwL/G
   hUnFgvo63Zo4nErAx9bFB2+PJKVyqvHdxT1hA2Ew8DNgoyBctsCSRafMz
   xgyu7jYEQYWH52c70Gz+ZumPXkcBb8eOWNUJs+pkzGgQpaW6H0bjg3ihX
   bJ+XkFjjiERPvUktef5oI/fXzA8zCfZ+G/QIkIbuBoTz3CXX5z+LWSMBX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="6692506"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="6692506"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 05:15:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="850897696"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="850897696"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91]) ([10.94.0.91])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 05:15:34 -0700
Message-ID: <087525de-588e-45f0-9d84-8d5bd83834ff@linux.intel.com>
Date:   Mon, 30 Oct 2023 13:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: Intel: avs: Add rt5514 machine board
Content-Language: en-US
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org,
        =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
References: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
 <20231027110537.2103712-2-amadeuszx.slawinski@linux.intel.com>
 <db8fb570-0532-45d2-b0dd-adfb8727f258@kernel.org>
 <f431a348-6e32-4e19-be56-1373f9e65aee@linux.intel.com>
 <4b6af85b-3d22-4f78-9db9-11cb463c0b2a@kernel.org>
From:   =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <4b6af85b-3d22-4f78-9db9-11cb463c0b2a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On 10/30/2023 12:59 PM, Krzysztof Kozlowski wrote:
> On 30/10/2023 12:50, Amadeusz Sławiński wrote:
>> On 10/28/2023 10:46 AM, Krzysztof Kozlowski wrote:
>>> On 27/10/2023 13:05, Amadeusz Sławiński wrote:
>>>> To support AVS-rt5514 configuration add machine board connecting AVS
>>>> platform component driver with rt5514 codec one.
>>>>
>>>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>>> ---
>>>>    sound/soc/intel/avs/boards/Kconfig  |  10 ++
>>>>    sound/soc/intel/avs/boards/Makefile |   2 +
>>>>    sound/soc/intel/avs/boards/rt5514.c | 187 ++++++++++++++++++++++++++++
>>>>    3 files changed, 199 insertions(+)
>>>>    create mode 100644 sound/soc/intel/avs/boards/rt5514.c
>>>
>>> ...
>>>
>>>> +
>>>> +static struct platform_driver avs_rt5514_driver = {
>>>> +	.probe = avs_rt5514_probe,
>>>> +	.driver = {
>>>> +		.name = "avs_rt5514",
>>>> +		.pm = &snd_soc_pm_ops,
>>>> +	},
>>>> +};
>>>> +
>>>> +module_platform_driver(avs_rt5514_driver);
>>>> +
>>>> +MODULE_LICENSE("GPL");
>>>> +MODULE_ALIAS("platform:avs_rt5514");
>>>
>>> You should not need MODULE_ALIAS() in normal cases. If you need it,
>>> usually it means your device ID table is wrong.
>>>
>>
>> In theory yes, in practice it is a bit more complicated, as we use the
>> driver alias in sound/soc/intel/avs/board_selection.c in
>> snd_soc_acpi_mach and they should match.
>>
>> For example for rt286, there is:
>> # modinfo
>> /lib/modules/6.4.0-rc3+/kernel/sound/soc/intel/avs/boards/snd-soc-avs-rt286.ko
>> | grep 286
>> filename:
>> /lib/modules/6.4.0-rc3+/kernel/sound/soc/intel/avs/boards/snd-soc-avs-rt286.ko
>> alias:          platform:avs_rt286
>> name:           snd_soc_avs_rt286
>> as you can see platform_driver::driver::name is not matching the driver
>> name.
>>
>> I've did quick test with removing alias and changing snd_soc_acpi_mach
>> definition for one board and it didn't load.
> 
> Sorry, but why do you talk about platform name? We talk about ID table!
> 
>>
>> Now that you pointed it out I also lean towards trying to remove
>> MODULE_ALIAS() from board drivers, but it will probably require some
>> more investigation if we really want to do it and implementing it properly.
> 
> Ehm? We have been there. I've been dropping these useless aliases as
> well. You miss DEVICE_TABLE and proper ID entries, not adding aliases.
> 

Ah, DEVICE_TABLE, that's what I was missing, so I just to confirm, 
something like:

diff --git a/sound/soc/intel/avs/boards/rt274.c 
b/sound/soc/intel/avs/boards/rt274.c
index dd613aa15e80..659e10b1dcad 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -257,6 +257,14 @@ static int avs_rt274_probe(struct platform_device 
*pdev)
         return devm_snd_soc_register_card(dev, card);
  }

+static const struct platform_device_id avs_rt274_driver_ids[] = {
+        {
+                .name           = "avs_rt274",
+        },
+        {},
+};
+MODULE_DEVICE_TABLE(platform, avs_rt274_driver_ids);
+
  static struct platform_driver avs_rt274_driver = {
         .probe = avs_rt274_probe,
         .driver = {
@@ -268,4 +276,3 @@ static struct platform_driver avs_rt274_driver = {
  module_platform_driver(avs_rt274_driver);

  MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_rt274");

for all the boards?

