Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5890E149C79
	for <linux-sound@vger.kernel.org>; Fri, 23 Aug 2024 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724404026; cv=none; b=BaEjk4msRLLu3TwfjJDWrC/bDIwynJvQmxl/Ts5n6rtULRglsie+6JVEtNtWukQlqSR15+Nf4KXymU8EygHW3i7fct19YHdjildBsMFkuna3nElNUvnAfzxUhzuhrgjyuh6OdTzImsX/qI2egMYNakQRBxz5j46m/s42Z+wGkhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724404026; c=relaxed/simple;
	bh=gIB2TJheovV1v9z2PyqBJKTVOtzHTmetTgKJxxIWdwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VxD9lFE8nfy/G/7i6XJ0KLO4J3IlkV4VowfSZhEEHrclADeDrJIEPOhIGOmxFvIQ1l9dx6w0RZ8uX71I/X01e6B82zMsxyy/di7QSzoSHjemB1mr5w/zNFIm/Bd4fbPj03oPIhlajFuGDfFlBv6GmrFkvRhCj/5gPu9i82iJlww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYY8PrkN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYY8PrkN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724404024; x=1755940024;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gIB2TJheovV1v9z2PyqBJKTVOtzHTmetTgKJxxIWdwA=;
  b=LYY8PrkNriBJr2EL1Z11ueO9VylIED+cJnumA28/CNDF4GLFYnRBjmjZ
   FeRgUpIGICjKW5Eg1MdW+p3OWxA0i8qGJ71kN5w2Nsr7D1Sa00AkTizYZ
   FIPQ7nOp8kMR4t+VRkP29ZmpO5Fe2iMmGMnVSJAb0H/EKN0UpOl1XsSw6
   +DRZV+ms7y+7qOcAn0+LHZYJk3UqpWavIrpcHLcMdF59pqrkl2xkbpi0O
   8WWTHvcxtC1WbjA5QjLAkwzciqRq5/JIjGZfbiywrCxDi9FD/+O14lws4
   btKNHnaeqZO989Sdx5TmPUbM+dJ7n0/WMrcA31tVqTHmJGxqxrt4afjy1
   g==;
X-CSE-ConnectionGUID: uQD1abH3TWam1LmqqyUBkg==
X-CSE-MsgGUID: 42Nif1NJSrq2dtfVWnWeNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40377611"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="40377611"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 02:07:04 -0700
X-CSE-ConnectionGUID: DRJGRhJ6Rt+62hyXIBh6WA==
X-CSE-MsgGUID: uusFQn/DQoGKZqliEoianQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="62041940"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.219]) ([10.245.246.219])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 02:07:01 -0700
Message-ID: <17e94fd8-f2e4-4e8a-a05b-0d7ae7b261d8@linux.intel.com>
Date: Fri, 23 Aug 2024 09:49:25 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-cht: Make Lenovo Yoga Tab 3 X90F
 DMI match less strict
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240823074305.16873-1-hdegoede@redhat.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240823074305.16873-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/23/24 09:43, Hans de Goede wrote:
> There are 2G and 4G RAM versions of the Lenovo Yoga Tab 3 X90F and it
> turns out that the 2G version has a DMI product name of
> "CHERRYVIEW D1 PLATFORM" where as the 4G version has
> "CHERRYVIEW C0 PLATFORM". The sys-vendor + product-version check are
> unique enough that the product-name check is not necessary.
> 
> Drop the product-name check so that the existing DMI match for the 4G
> RAM version also matches the 2G RAM version.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/intel/common/soc-acpi-intel-cht-match.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> index 5e2ec60e2954..e4c3492a0c28 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> @@ -84,7 +84,6 @@ static const struct dmi_system_id lenovo_yoga_tab3_x90[] = {
>  		/* Lenovo Yoga Tab 3 Pro YT3-X90, codec missing from DSDT */
>  		.matches = {
>  			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> -			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
>  			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
>  		},
>  	},

