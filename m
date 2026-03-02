Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0F938F645;
	Mon,  2 Mar 2026 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444698; cv=none; b=W/a4biXjET3tWLMTceNwTpOWL9ATq0yYFtPJh3H1amCXcT8FGWwGJHLdy9QUVbkSRR4yn1abJOaLtlJIhMLqmr+nD/0Qqykxl583Eqgkyy+26pJS5l2iMdLftdVlZV8spQM0s5AcCbiVVSdkKuN+CMiKJQN4YNxx7XdbPpF0f0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444698; c=relaxed/simple;
	bh=YgrilhQNpe9Lj6ukah4A+zh/1X64Yb8snFI0f/+CLA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fh6iuLow5piWpa3FN4oYQHwF15Fpll3FHP0b8CmvzoYbSJ9ejrMCDNbnLyz7KvX3j+kuoIhzUhYqxmOyER5thKUxKbpaJlAz7SWzROozLtHPpF4ClOcbxfuVZmXFUrxaSEkMDOZYAHJu4VghVdgxRy+sQZKvbEAAp35qYsRdu/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLb60bEl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLb60bEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772444695; x=1803980695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=YgrilhQNpe9Lj6ukah4A+zh/1X64Yb8snFI0f/+CLA4=;
  b=mLb60bElbKV+DPxID3K+se/XTRFxhfNOvEXrTA4o3SGHvSibZYO6VwrZ
   tpVMQHUrwZqqGcixDefux08LLEX0slvhh/X1CSxarAGL7q3qCq7SzRSc4
   FpWR5semx7oEcbwhpVuSmnsFDFJw8fLVhKkGJ3enIFmd74bHb9PQmR6Pc
   bOjjFCYMUuWyAMfKEiGkeIavuMue7HWOyflu6DisY7adxb2dLP04xz+Aa
   SB79qjeV/7TADj3CUmcShsIc7t7ulRp/nNVg/RZ+ZVeIgsCGNV5baP7B5
   8t0wrW5k0KRV6ukzGtxrVh8QKY5TTL8GEE90SBjs7VtrAfbMrk7s66bvH
   A==;
X-CSE-ConnectionGUID: VEF4jYCeQwq2c8We155hMg==
X-CSE-MsgGUID: 7qqGpIlSTwGoW9JaiyDkOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="96064454"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="96064454"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:44:54 -0800
X-CSE-ConnectionGUID: ReacdULBQP6op7Tn3RSdVQ==
X-CSE-MsgGUID: 136BOjurRWOSDHlTh0O8gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="222105255"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.52])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:44:49 -0800
Date: Mon, 2 Mar 2026 11:44:46 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Xu, Baojun" <baojun.xu@ti.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.de" <tiwai@suse.de>,
	"13916275206@139.com" <13916275206@139.com>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Yi, Ken" <k-yi@ti.com>, "Lo, Henry" <henry.lo@ti.com>,
	"Chen, Robin" <robinchen@ti.com>, "Wang, Will" <will-wang@ti.com>,
	"jim.shil@goertek.com" <jim.shil@goertek.com>,
	"toastcheng@google.com" <toastcheng@google.com>,
	"chinkaiting@google.com" <chinkaiting@google.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1 2/2] ASoC: tas2781: Add tas5832 support
Message-ID: <aaVcDvYvi28wFR2S@ashevche-desk.local>
References: <20260226075737.405-1-baojun.xu@ti.com>
 <20260226075737.405-2-baojun.xu@ti.com>
 <20260227-ubiquitous-dashing-copperhead-b2c6a0@quoll>
 <9f861c7df09c4434a98a203ecff913bc@ti.com>
 <63b0f42e-56e8-474f-8805-4e01bb2f189e@kernel.org>
 <a7316acf9ba248f9ad1fab0313a95654@ti.com>
 <3cfa4036-e7a7-4cde-9dab-a171a63bdee3@kernel.org>
 <4865c7f626a340d7847354512367577e@ti.com>
 <596f90d0-8dbd-4afe-a722-bf2ba65e1776@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <596f90d0-8dbd-4afe-a722-bf2ba65e1776@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Mar 02, 2026 at 10:27:49AM +0100, Krzysztof Kozlowski wrote:
> On 02/03/2026 10:22, Xu, Baojun wrote:
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> Sent: 02 March 2026 16:58
> >> On 02/03/2026 09:24, Xu, Baojun wrote:

...

> >>>>>>> static const struct of_device_id tasdevice_of_match[] = {

> >>>>>>>       { .compatible = "ti,tas5827" },
> >>>>>>>       { .compatible = "ti,tas5828" },
> >>>>>>>       { .compatible = "ti,tas5830" },
> >>>>>>> +     { .compatible = "ti,tas5832" },
> >>>>>>
> >>>>>> So it is fully compatible with tas5830 and most of the changes here are
> >>>>>> not needed?
> >>>>>
> >>>>> Yes, it's fully compatible with tas5827/28/30.
> >>>>
> >>>> Then above hunk and many others are not needed.
> >>>
> >>> Hi, because those chips have different on the voltage, so the parameters
> >>> is different, have to use different firmware binary, so we must identify
> >>> every chip in the driver.
> >>
> >> That would explain other ID tables (and should be briefly mentioned in
> >> the commit msg), but not this one, because here you do not customize the
> >> binary at all.
> > 
> > Hi, we save the chip_id in the dev_name:
> > strscpy(tas_priv->dev_name, tasdevice_id[tas_priv->chip_id].name,
> > 	sizeof(tas_priv->dev_name));
> 
> And where do you see the name in above table?

I don't know what you are trying to get from them, but I²C enumeration
on DT platforms works in a way that it takes two tables into account,
hence, if there is no compatible (with given part number) there will be
no matching name.

AFAIK it has to have a compatible to make it work in such a case.
What did I miss?

The code in question is i2c_of_match_device_sysfs() call in
i2c_of_match_device() which does this magic.

> > And get firmware binary from this dev_name:
> > scnprintf(tas_priv->rca_binaryname, 64, "%sRCA%d.bin",
> > 	tas_priv->dev_name, tas_priv->ndev);
> 
> Or here?

-- 
With Best Regards,
Andy Shevchenko


