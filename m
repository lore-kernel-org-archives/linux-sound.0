Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54557410D26;
	Mon,  2 Mar 2026 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772466879; cv=none; b=ib71U+0/qFkUOK3a7ld0SmDpFVlK+X+p8rhEdqPgo+BE2IOUqQX0wGtl4vSMEwYOA4sK/bXXT8i2CleB9HY1ECe8Y0OOgOGhJYrn3WhaEQ+tMQpfALcpW6KWJWFvW8TWuxUVoVUa2rjec2EwAJTSe5GppgZ3t6/C66PfxYQPOqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772466879; c=relaxed/simple;
	bh=f3nt4cY+lyewyjBg8MbL/zv6mMnuOxgV+8qAUagkKOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBD3HnY7W4I5UKls0m3e3s+9zSYhQH3H+NDyCU/bIpVvMSbJNclPwIel4yYPrmZkIqvXpzePlmCeJ7vCFAnOxsbbDwOjrkCgIeT9WCwPeW1gqpAcKaWJiG6pE9kevwfBHC0R+LjkFHV+SxpgXLRcgWmCPDH9/kQ9c5iwcysKQGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X57JtpwJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X57JtpwJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772466874; x=1804002874;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=f3nt4cY+lyewyjBg8MbL/zv6mMnuOxgV+8qAUagkKOI=;
  b=X57JtpwJZXFCm5fYMSuFe1kITxRgZum0B936gyVNJ2X5rGD3bB7TVsoD
   aNuySJEtm7yuP+UF5BtGSBDuF6dXYRGGBInWQjLsh+vA59Ew6Lt57NFyo
   LYAOLCM6ILPe1pyXG72C5GVa3faI9UOot4mu74VxKt+rRqB9SCwCyS+P6
   1lecLPEXR27StXuaYIOE2gZ1uw7GSk95yEJq9vagsjUD+TuJw07Zyj/PS
   anyM0gZ/WSF31CP0yKanjySEVy4M2fWcSVYh3v2mEJpkbn4xr2OCfnlFf
   x5HJLbfXkyshP9s7DsieTGwRxnT2eY7FP8y7gYkGuApmj8qGsb0W/HUvk
   g==;
X-CSE-ConnectionGUID: JtWwjuZBSxyh9abXMLn6NA==
X-CSE-MsgGUID: Lvp0SkM5T1+sC6sWsyWNNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84185447"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="84185447"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:54:00 -0800
X-CSE-ConnectionGUID: xJOn8S5hSv65W3bhlnNrug==
X-CSE-MsgGUID: eqPDhnkMTIGTSw853iSp6A==
X-ExtLoop1: 1
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.232]) ([10.245.246.232])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 07:53:57 -0800
Message-ID: <e29bd016-b8f4-46d1-8cfb-ace4b2512082@linux.intel.com>
Date: Mon, 2 Mar 2026 17:54:05 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ASoC: Intel: soc-acpi-cht: Unify device quirks
To: Yauhen Kharuzhy <jekhor@gmail.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>
References: <20260301-asoc-yogabook-v2-v2-0-adcc7ed40985@gmail.com>
 <20260301-asoc-yogabook-v2-v2-1-adcc7ed40985@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20260301-asoc-yogabook-v2-v2-1-adcc7ed40985@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 01/03/2026 23:33, Yauhen Kharuzhy wrote:
> This file contains two types of quirks, both checking DMI for
> machine-specific strings and returning machine data for a matching entry.
> 
> The first one, `cht_quirk`, is used to override the default entry for an
> existing ACPI codec node if the node's info is invalid. It returns either
> the matched machine data or the default entry if no match is found.
> 
> The second one, `cht_yt3_quirk_cb`, is used for devices (originally the
> Lenovo Yoga Tab 3 Pro) without a valid codec DSDT entry. It is bound to
> the SST ACPI node and returns either the matched machine data or NULL if
> no match is found.
> 
> To allow adding new machine entries to the second case and to use a single
> DMI match entry for both cases (for example, if two variants of one device
> exist: one with a valid ACPI entry and one without, like the Lenovo Yoga
> Book YB1-X91 and YB1-X90 - Windows and Android versions), reorganize
> these quirks functions to use the same approach: machine data is set in
> the matched dmi_system_id entry as driver_data field.
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> ---
>  sound/soc/intel/common/soc-acpi-intel-cht-match.c | 100 +++++++++-------------
>  1 file changed, 42 insertions(+), 58 deletions(-)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> index e4c3492a0c28..57097c1d011e 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c

>  
> +static struct snd_soc_acpi_mach *cht_quirk_nocodec(void *arg)

This is confusing, why it is _nocodec?
cht_quirk_strict() or something might be better?

-- 
Péter

