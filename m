Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CE9156963
	for <linux-sound@vger.kernel.org>; Mon, 29 Jan 2024 16:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706545642; cv=none; b=pF3zrnFVollacUeZTtGbXgRzQ3Pg99v/cjy4ZOGu2OCkWm0KAZS057r3xqRcsa8XGJH0cyDLUbx6NTpO+s/EeeRdIaEpMnrr7PIxpZwj4EnLO6gspHa9kiNkMR8n9bLDk5izQShrtP2EN6dTHxMuCbmRwjUtJNpDD8FcWgOzLmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706545642; c=relaxed/simple;
	bh=U2e1W5oI8/J4cPBAshZCwvAQB+UNl7ic7ITb9kxduGs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjeQyfCdY4Mcvw+mczWIpHnh9vvYMwlcew1qx7871syRSJjw7B8fFpt6cEuZZgVAyMoJA0WykxYuU1jHChG4XCgWN9Ii6BikA+B7mmkiYy5wQPqYZKmYngAGCs7plI0cI0Bt/2x9vWlqBWkY2vwgHXFiqmqICyBet3LkG4CCxxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Us4flF+N; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Us4flF+N"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40T5Upj4006490;
	Mon, 29 Jan 2024 10:27:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=
	PODMain02222019; bh=tAteh6KFAibWfbZe814d/E/E/D/jDOhwi0vIZQGxGs0=; b=
	Us4flF+NeUAdVQ/bqKtn4RDFdTpFZ/ewjTMGZWqLvaGbDel7jnYVuDd088V/NOea
	049ApQClifAbFjqFIFT2KMx76gCaZV8taOVProIg6uT3bUikwSGFhA77hLQnnHKf
	pphtK/N4vVRO1osY+Pq7vsUuG6sCeUQ3d796hvBfE2DA4wHgWW1WXWEmaiK63B+S
	JXxpVvYYX1iO+7WnK9wkeAw/wvFoPuLBJdmNn4QHM/+EXzSsEqgDxG4ARamJvdQf
	Kx08ulodgdg3eEHNjLOe8Rizw+vn532ZYwpZF0AMTo185x8CC+DC9Bk53iVckbMi
	iO7Ek8v5HfmV7ZZKEG4cfw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vw043t8yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:11 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:09 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 8DC61820242;
	Mon, 29 Jan 2024 16:27:09 +0000 (UTC)
Date: Mon, 29 Jan 2024 16:27:08 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 6/7] ASoC: cs42l43: Refactor to use for_each_set_bit()
Message-ID: <ZbfR3IzRYpP7YCns@ediswmail9.ad.cirrus.com>
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
 <20240125103117.2622095-6-ckeepax@opensource.cirrus.com>
 <CAHp75Ver-NMTtHmeE9+sdnt1FVH2iGhXQxQf21jjDGOn+6mbhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Ver-NMTtHmeE9+sdnt1FVH2iGhXQxQf21jjDGOn+6mbhw@mail.gmail.com>
X-Proofpoint-ORIG-GUID: xb17VPz_JLHetAmvqOmmQH0VUv2Mhr57
X-Proofpoint-GUID: xb17VPz_JLHetAmvqOmmQH0VUv2Mhr57
X-Proofpoint-Spam-Reason: safe

On Thu, Jan 25, 2024 at 09:11:44PM +0200, Andy Shevchenko wrote:
> On Thu, Jan 25, 2024 at 12:31 PM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> Adding nslots parameter is a good idea, but I still think the code can
> be refactored better (have you checked the code generation, btw? I
> believe my version would be better or not worse).
> 
> > +       for_each_set_bit(slot, &mask, BITS_PER_TYPE(mask)) {
> > +               if (i == nslots) {
> > +                       dev_warn(priv->dev, "Too many channels in TDM mask: %lx\n",
> > +                                mask);
> >                         return;
> > +               }
> >
> > +               slots[i++] = slot;
> >         }
> 
>        i = 0;
>        for_each_set_bit(slot, &mask, CS42L43_ASP_MAX_CHANNELS)
>                slots[i++] = slot;
> 
>        if (hweight_long(mask) >= CS42L43_ASP_MAX_CHANNELS)
>                dev_warn(priv->dev, "Too many channels in TDM mask\n");
> 
> The code is simpler and behaviour is not changed.

I don't think this works, the limit here is on the number of
channels not on the position of those channels. The last parameter
of for_each_set_bits appears to measure against the bit position
not the number of set bits. So for example 0xFC000000 would be a
valid 6 channel mask, but would result in no slot positions being
set in the above code.

Thanks,
Charles
