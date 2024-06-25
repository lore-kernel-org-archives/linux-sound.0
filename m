Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C85405F8
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 07:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719299661; cv=none; b=DwhTmB4iBNkc88N4fdJQ2ngHhjxVUbJCZjDAWPgwD0aWzCPRVAG3BQn9gl8Hyqo+QKkwRCowBFP9mkiW+R4kumiTLbWbbzFDXizufRlaQOZn2W7Z5cm9I+XK9U29LnuTwutpUNblh8klqhHaOBFhXshKqYAnFuHekFBw55+454Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719299661; c=relaxed/simple;
	bh=YAxo8rPkFrJEn1p+LyKEP+l/7QiPW5WOQ36QnaRKPhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cV5/T7OYyDO4d4xCCtkLdeonbhBBqeUbtUQQ3OfMaLhF5WOPLTFZI6IhB1mlLfmfXtX/y3Jt1sAt1+zkSNM8uMVMXAaMYzT0SQwj56kpq2MF/+fr8u8hoh7l+SIqWRrlLIVobxvv+56ivMtGPPzlM7Uq02ymtLC5AEwsWelIm0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=drtd5ce+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="drtd5ce+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719299660; x=1750835660;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YAxo8rPkFrJEn1p+LyKEP+l/7QiPW5WOQ36QnaRKPhE=;
  b=drtd5ce+YThymi+uGZhbcRYpDp9JdgZxSZcFzr1+mvHeQok6ceCIAYWd
   5rYEIA1n7Rjie0nJ1u9cGlWTGbfpIrg3VOKDu67OeFIuOAGw/TPl38XAQ
   LTy0McIyB/F46GAtH8MtXnuVGeFw5qy3a6dwwwdRhvv0d9gSL8sD/Nlzb
   swB1Q7zncy1NdxnvcB4bExCcl14HvL97bNaJvBf79Goi8Kd/VRY6my9WR
   6QZ0r+x6bpq9JKt1j7503ES4LwnRaAcby63K+/bAF6fGCFUDLwPKXL4Zr
   ldRMTOJ7+vn5/aW6B04qbg2CgwRrBXP6jHHxGve4EvRhSXH8iDI4eS68I
   g==;
X-CSE-ConnectionGUID: gMll/6vSQyaFgB/+Dh0liw==
X-CSE-MsgGUID: 9m8xEToRQVypC1MnoHdWLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16124902"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="16124902"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 00:14:19 -0700
X-CSE-ConnectionGUID: 3sEctz1oSL6vmhGsPeXlWQ==
X-CSE-MsgGUID: gSTUFzwsS+2/jLaOwGp9Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="66772178"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 00:14:17 -0700
Message-ID: <c66336a3-70d6-4351-b07e-602725bdef2f@linux.intel.com>
Date: Tue, 25 Jun 2024 09:14:14 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ALSA: hda/relatek: Enable Mute LED on HP Laptop
 15-gw0xxx
Content-Language: en-US
To: Aivaz <reichaivaz@gmail.com>, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, kailang@realtek.com,
 Aivaz Latypov <pngdrift@mail.ru>
References: <CAGRy+7BMH-4Kwp5mqCiDcjjQKJ2Q7gMwF=ZJO02hj+DyV1gkFA@mail.gmail.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <CAGRy+7BMH-4Kwp5mqCiDcjjQKJ2Q7gMwF=ZJO02hj+DyV1gkFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/2024 11:16 AM, Aivaz wrote:
> This HP Laptop uses ALC236 codec with COEF 0x07
> controlling the mute LED. Enable existing quirk for this device.
> 
> Signed-off-by: Aivaz Latypov <reichaivaz@gmail.com>
> ---
>   sound/pci/hda/patch_realtek.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index f4454abadc8d..51225c5770ea 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10067,6 +10067,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>    SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
>    SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
>    SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
> + SND_PCI_QUIRK(0x103c, 0x87d3, "HP Laptop 15-gw0xxx",
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>    SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx",
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>    SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
>    SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC",
> ALC236_FIXUP_HP_GPIO_LED),
> --
> 2.45.2
> 

As far as I can tell, those are kept in sorted order, so they are easier 
to find, so should be added after  0x103c, 0x87c8  in this case?

Thanks,
Amadeusz
