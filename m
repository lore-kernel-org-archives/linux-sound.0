Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D62A21571F
	for <linux-sound@vger.kernel.org>; Mon,  9 Dec 2024 09:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733738039; cv=none; b=kvhWq9Ts4Ccf76mUKbc3Yqbz2wAFR7Q8gKGFKtUNT5zC8HyYQ1sMhH+bCydvmDQE2jXw2+R0BbyQlnSElUvH25wCgN+sY7DJhUFnejD2XfxaRwKymgE+vKv5rdP3CmAzPSIatg4UAW1WGUGqx5Sum74VPc00cA0VQ1FaRXDxpdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733738039; c=relaxed/simple;
	bh=G7P4WFySdM9J6B3gL7v7zq13XcU+IF+zjj7ttGGoZSk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBlnJnnjTg3AJdYTWouc8p9BUe5wVqzVhBD3hW69b0dYuApYtwv1k7wT6fLxpEP2O0JFX+EHJZmLR5tT+opRLd1p6SwS/s03jvFjGkR107s0i1ktNfKMSN90c/kfQOljfgU0/0OtZQiDjUxGdOXNTRcf5e54HELkMmmqhHC3VIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Y+NzqaSn; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Y+NzqaSn"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B97SI8a010517;
	Mon, 9 Dec 2024 03:52:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Ut6LcVsTIG0oZHILjN
	iw4Y5NRvtVX4JYmOtGu6tel8w=; b=Y+NzqaSnCn1hSJqEGDNt0snTrcrGE1RT3T
	8flZij+Jcn5ehw4PL96FJTG7FTPmibGaIiXVk9FtR7h1Ne0ACfqsUFG4fHW8Cg9U
	iPFJL7rRU0vhK7yAaoEyPJNPZc5uDba1jCnUZaBTprgvvaYxQL+pDN9UZ/i7+YFs
	aVYKt/l5FE60PEIecIZm7QPkyGSnRK5uRhQR1vcM1fQY/c63ibCkwDSNuEFLXXe9
	CCHETHwl1N7UYNbBUYtTdeH8oTP3lNPGwKuns28Hh6HnaKPgOt+UHxbBi+n6InzL
	sZYmXna/XDh/rSYWqbtnIUCUf46gmoHy5t6UqU77Xb8BMROs0M/w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43cknk9v33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 03:52:54 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 9 Dec
 2024 09:52:53 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 9 Dec 2024 09:52:53 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 337D6820248;
	Mon,  9 Dec 2024 09:52:53 +0000 (UTC)
Date: Mon, 9 Dec 2024 09:52:52 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: =?iso-8859-1?B?Ik51bm8gU+Ei?= <nuno.sa@analog.com>,
        =?iso-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?= <u.kleine-koenig@baylibre.com>,
        Daniel Mack <daniel@zonque.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Lars-Peter Clausen <lars@metafoo.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        "Takashi
 Iwai" <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
        <linux-rpi-kernel@lists.infradead.org>, <linux-sound@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH 00/17] ASoC: remove snd_soc_dai_set_tristate()
Message-ID: <Z1a99HJuL04nWuqx@opensource.cirrus.com>
References: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
X-Proofpoint-ORIG-GUID: 6sC2AuF3yPVyGwHQRs2Fhx6Ba-fI5Urq
X-Proofpoint-GUID: 6sC2AuF3yPVyGwHQRs2Fhx6Ba-fI5Urq
X-Proofpoint-Spam-Reason: safe

On Mon, Dec 09, 2024 at 07:38:52AM +0000, Kuninori Morimoto wrote:
> Hi Mark
> 
> snd_soc_dai_set_tristate() has added in v2.6.27 (2008/Oct) by this commit
> 
> 	8c6529dbf881303920a415c2d14a500218661949
> 	("ALSA: asoc: core - add Digital Audio Interface (DAI) control functions.")
> 
> But it has never been used during this 16 years.
> Let's remove it.

We have definitely used it in out of tree code for some phones in
our times. Whilst I don't feel super strongly, I would say it seems
like fairly reasonable functionality and it does no harm, so I
would vote to keep it.

Thanks,
Charles
