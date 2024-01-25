Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8499A1CD00
	for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 09:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706176353; cv=none; b=eljXBVj0wLXocgND8jvJPGA7Kcywo8s64EZPw62hH+/Cq6I9yNIEekfg3MCXpPDSQQpMLtvTbhWOt/dieGzXz7cDXVJmVQkwpMa13dASvpj1/X98OkCGfn1joVCP6q3Jc1PDyQtDWXxWfxpqaBkHBfR0vgQ6mGglcIyPPi17cX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706176353; c=relaxed/simple;
	bh=hUTV/d6M9IsBFUd4/YbDs7cO7WzwxA3VmL/4irIndYM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2I4jdMCfsz2XKmlANvDJT7U2R9yCHr/piajesEMmViaMNAk3u156XXUhyk/UDQb6vDOyyAYXogmdjke4lXWgfR52fSHJ9DZL3Z6piKds417qMhH1d2Y5Ukc2m86iOe0BCfsY8mR9QeGm3Fxg5VCOHz7TjJCrxVH+7CS5bnUIDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bjZhuXgP; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="bjZhuXgP"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P5Phw6014771;
	Thu, 25 Jan 2024 03:52:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=
	PODMain02222019; bh=vGrNSh62BaIht8+twse3zms0TY0FwQUJRwvQcagQHms=; b=
	bjZhuXgPZTSUUec+kRV7ga1yWlD4neFBTLeUVdef9NVO0lYjmf9qHhaA9+p4ZXnU
	Ho+B4tYyoV13aVJ9cY5edNXTEVU25bqRIAJHLS6ZvkddSesqTeJq4ES0ZIXgoiVE
	o0pSxbuaT68KSHeW3I28wTwPF0YtmFmXnkwmojRICP8lTXM/6f+zeweWosa1ov4o
	PLcQ6jpkc3cFKGdrtS3umV8E8tcMiQphGsHIG2Qu7aOxuUm2pz51HomLW6JOrql7
	Up9D2Hmda//xhdfxqemn1AtKvHsTeepImLLc7ratenC5kECtHA1HGpWUUNWJ3qFg
	JKxQMrb8h7WXudezyQnhPQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj24c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 03:52:22 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 09:52:20 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 09:52:20 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 6E52A820241;
	Thu, 25 Jan 2024 09:52:20 +0000 (UTC)
Date: Thu, 25 Jan 2024 09:52:19 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH 6/7] ASoC: cs42l43: Refactor to use for_each_set_bit
Message-ID: <ZbIvU+UJTB2NbvxZ@ediswmail9.ad.cirrus.com>
References: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
 <20240124165558.1876407-6-ckeepax@opensource.cirrus.com>
 <CAHp75VdmpPXmQTDSJLotiYSxVO=4Fn27tWwQsByzYQuZwmHJ9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VdmpPXmQTDSJLotiYSxVO=4Fn27tWwQsByzYQuZwmHJ9A@mail.gmail.com>
X-Proofpoint-ORIG-GUID: auRHtjoCfyH6Qy4EOMaajMZsgJWhwXEH
X-Proofpoint-GUID: auRHtjoCfyH6Qy4EOMaajMZsgJWhwXEH
X-Proofpoint-Spam-Reason: safe

On Thu, Jan 25, 2024 at 12:42:13AM +0200, Andy Shevchenko wrote:
> On Wed, Jan 24, 2024 at 6:56 PM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> >
> > Refactor the code in cs42l43_mask_to_slots to use for_each_set_bit.
> 
> ..._bit()
> 
> ...
> 
> >  #include <linux/bitops.h>
> 
> > +#include <linux/bits.h>
> > +#include <linux/find.h>
> 
> No need, it's included by bitops.h (and there is kinda guarantee for these).
> 

We just moved a bunch of includes out of the cs42l43 header files
to be directly included in the C files. It makes sense to be
consistent if each file is going to directly include each header
it uses it should do so. The header guards will weed out what is
already included.

> > +               if (i == CS42L43_ASP_MAX_CHANNELS) {
> > +                       dev_warn(priv->dev, "Too many channels in TDM mask: %lx\n",
> > +                                mask);
> 
> This is invariant to the loop, you may check even before it (I'm
> writing by memory, might have made mistake(s) in the snippet):
> 
>   nslots = hweight_long(mask);
>   if (nslots >= ..._MAX_CHANNELS)
>     dev_warn(...);
> 
> >                         return;
> > +               }
> 

This would result in a change of behaviour, as one would need to
return before the loop to ensure we didn't overflow the slots
array. We could possible do something with masking the slots to
ensure it only has the right number of bits set, but it is really
starting to get a little micro-optimisation for something that is
likely only going to run once whilst the kernel boots.

Thanks,
Charles
