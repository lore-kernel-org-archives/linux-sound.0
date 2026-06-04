Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B90248F73
	for <linux-sound@vger.kernel.org>; Thu,  4 Jun 2026 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780566059; cv=none; b=pRF8Q1pUlu6q/gi1v1zgukrxDoTE9SlsEYPcH2eBE7eMSrbnUrlFUcfTU+/I6nJ3PHdwmZXJTIV1dUHyRnC6USoStF9RpNy1/l1mwRuN8LfiTes3K/Wry5UIqZioajNU5O5geMBSAZJtB4nw0Yp0SXxcdJ08SHxOPkuygDbHXgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780566059; c=relaxed/simple;
	bh=qU4BslHZ74r22kx2bCC4P0rvOF3leSYEK570XRqtJpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xj23MFLiX9Yx+QeQEarqk0DIXbrDAn4tySSY2UnXvYC0nhDAkxr3eDSSUOWgKaQrdpKMBOh39Hqxf7TGrgMUBZeKW+QXcB90aDTKan78GIbY8jhn8dxmqAQvq/2W3A6ot3bRETTfB/XtxTP2srJnuVX/+JM66n/6EkWFEfuyolA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUmjwqoE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUmjwqoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780566058; x=1812102058;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qU4BslHZ74r22kx2bCC4P0rvOF3leSYEK570XRqtJpQ=;
  b=IUmjwqoEBkg4n8YokCX4JNYyhVbY0mc9MuipUuKB2wtKrKW5aDx6AFbX
   QttoxV6k9hXXY5Rsqdj8skYnpsJIm8Z+vYlRTKkrJYYHFVe+mmXIiLWfL
   zaZddOmKqSc80LPT0pR2teHfPxYwpQusRUdEkZ1l6D1YJqdpStB1H68a+
   jhWMeWjuWLjlM1XtDS1Imgzc2uZH5xVFJVG/iE5csO0/AEcMZJdwMQ5y+
   IRSA3KCwnavwakpWuZmdUYUhx9ARw3MAVTmAO+CEUuFZM1c1NJ9HGujK+
   j7t3qegU5wMjMqJ1TpYCW7O+Tn/Tplse0x/a9PmEeIfsBsiZn61QdbjCL
   g==;
X-CSE-ConnectionGUID: uEiGJy1GT1iNx6+KhPZj5Q==
X-CSE-MsgGUID: 3/iODrPnRg2hpwozORtUOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92875625"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="92875625"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 02:40:58 -0700
X-CSE-ConnectionGUID: KZu7s+IuQiWqSA8vbN00tg==
X-CSE-MsgGUID: Dou0U+j3TqeuHZWSfUlL9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="249420500"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.172]) ([10.245.246.172])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 02:40:55 -0700
Message-ID: <c73fa4af-2b70-4798-8041-9237466e92e6@linux.intel.com>
Date: Thu, 4 Jun 2026 12:41:03 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question about Intel skl_hda_dsp_generic.c
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Linux-ALSA <linux-sound@vger.kernel.org>
References: <87qzmm4wxj.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <87qzmm4wxj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Morimoto-san,

On 04/06/2026 09:55, Kuninori Morimoto wrote:
> 
> Hi ALSA ML, and Intel developers
> 
> I noticed that Intel skl_hda_dsp_generic is doing strange things.
> It is calling cleanup function (B) when register Card (A) fails.
> It is using for_each_card_rtds() loops (C) in (B).
> 
> (B)	static void skl_set_hda_codec_autosuspend_delay(...)
> 	{
> 		...
> (C)		for_each_card_rtds(card, rtd) {
> 			...
> 		}
> 		...
> 	}
> 
> 	static int skl_hda_audio_probe(...)
> 	{
> 		...
> (A)		ret = devm_snd_soc_register_card(..., card);
> 		if (!ret)
> (B)			skl_set_hda_codec_autosuspend_delay(card);
> 		...
> 	}
> 
> But, in case of Card register fails, I think Card doesn't have rtd.
> Is this really needed operation ?

I'm not sure to be honest, this code has been added in 2020 by:
3a24f135e6cc ("ASoC: intel/skl/hda - set autosuspend timeout for hda
codecs")

And actually it executes the skl_set_hda_codec_autosuspend_delay() if
the devm_snd_soc_register_card() returned with success, so this is doing
actually valid and correct thing, no?

> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
> 

-- 
Péter

