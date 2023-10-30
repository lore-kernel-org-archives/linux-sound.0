Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402FEC4332F
	for <linux-sound@archiver.kernel.org>; Mon, 30 Oct 2023 11:50:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjJ3Luj (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Mon, 30 Oct 2023 07:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232887AbjJ3Lui (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Mon, 30 Oct 2023 07:50:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AF1C5
        for <linux-sound@vger.kernel.org>; Mon, 30 Oct 2023 04:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698666636; x=1730202636;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Wf36bxPgVsxUy5j/UtNTilNJi30VLZXPAL0pSlxW5cM=;
  b=iY2aOb4f75UIYS8boivec4g8dhjvu5mS8rC6cV6jtp+qW3XPbQFvdukY
   jiz7dvv/rcVsGQprpwSednxfHDggw4o2Ge6xM/96TlZaHEQz75VzJSIhU
   oVp4nxei0YdBmuU3y2q6qrxVH5WjfkVd3961URynBOQy3+3gT9FpkUlFv
   mSn+nyNRuOIi2CXbqYLmXAjDXF6RWCgdmtsVIfRTWTNnBpSzS9tt+Bf1g
   JRcTERe3xSPbczASkyAZswOUnFMO8dz7aw1Pbn+LpBgjWuxoYXZgZ/FYh
   GQrAfHELz4ygVDOdYEmyPx71C+cXv+yw6hIxdu7F9uiuMoR1VYzHRZXeS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="385256797"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="385256797"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 04:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="1007395006"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="1007395006"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91]) ([10.94.0.91])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 04:50:32 -0700
Message-ID: <f431a348-6e32-4e19-be56-1373f9e65aee@linux.intel.com>
Date:   Mon, 30 Oct 2023 12:50:30 +0100
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
From:   =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <db8fb570-0532-45d2-b0dd-adfb8727f258@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

On 10/28/2023 10:46 AM, Krzysztof Kozlowski wrote:
> On 27/10/2023 13:05, Amadeusz Sławiński wrote:
>> To support AVS-rt5514 configuration add machine board connecting AVS
>> platform component driver with rt5514 codec one.
>>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> ---
>>   sound/soc/intel/avs/boards/Kconfig  |  10 ++
>>   sound/soc/intel/avs/boards/Makefile |   2 +
>>   sound/soc/intel/avs/boards/rt5514.c | 187 ++++++++++++++++++++++++++++
>>   3 files changed, 199 insertions(+)
>>   create mode 100644 sound/soc/intel/avs/boards/rt5514.c
> 
> ...
> 
>> +
>> +static struct platform_driver avs_rt5514_driver = {
>> +	.probe = avs_rt5514_probe,
>> +	.driver = {
>> +		.name = "avs_rt5514",
>> +		.pm = &snd_soc_pm_ops,
>> +	},
>> +};
>> +
>> +module_platform_driver(avs_rt5514_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:avs_rt5514");
> 
> You should not need MODULE_ALIAS() in normal cases. If you need it,
> usually it means your device ID table is wrong.
> 

In theory yes, in practice it is a bit more complicated, as we use the 
driver alias in sound/soc/intel/avs/board_selection.c in 
snd_soc_acpi_mach and they should match.

For example for rt286, there is:
# modinfo 
/lib/modules/6.4.0-rc3+/kernel/sound/soc/intel/avs/boards/snd-soc-avs-rt286.ko 
| grep 286
filename: 
/lib/modules/6.4.0-rc3+/kernel/sound/soc/intel/avs/boards/snd-soc-avs-rt286.ko
alias:          platform:avs_rt286
name:           snd_soc_avs_rt286
as you can see platform_driver::driver::name is not matching the driver 
name.

I've did quick test with removing alias and changing snd_soc_acpi_mach 
definition for one board and it didn't load.

Now that you pointed it out I also lean towards trying to remove 
MODULE_ALIAS() from board drivers, but it will probably require some 
more investigation if we really want to do it and implementing it properly.

