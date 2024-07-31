Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF851B29AB
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 13:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722433922; cv=none; b=qRMMn9Ss32jl8cJ99ofWUpqbZFPBKkJj2SD4jjZofsgu+3gKnaZX5Vql+1zAu/bovlWd7ka6HB0fh3VSCapJ+LNyxGWQaiW7tZNFCs86PPaN0qffRDnEVboMhwX5IMKPFru1QUPueCs0NOwNn042RSPaFhqACw62LMzFzuaWjDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722433922; c=relaxed/simple;
	bh=9R5oo3GqCl5byKUP4cdCVzEJaAQFQ4ndDFj9AtwAkFg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EK7H7h2AbAvL/nh/iwQN85H4AbRQHZp4dGpHPeGayRWqbqH+yiLXxF1SKtgwyvlgwyEQhpi48r6VKUPpQKaI7WIldZJaPoaWTNOIW+1QbDoBRETryNZh1kwO2cdcfnUeAW5Iyj1nPT+9TXvnKckc08gGwq9BuhgP96a9isXRguU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ak2NV5Xq; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ak2NV5Xq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V9i9re014719;
	Wed, 31 Jul 2024 08:51:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=uDaa/d7RVH8bsfoasv
	GEKK6dAmoj1G2ABR0Z4/K07PY=; b=Ak2NV5XqUovVzeXSJ7yA97O9BZyPIqZz2W
	QsEv+V7UfrrM76LmQl5DFCSQNrv6Cf7OUoG9pBkcmBccv3lVrDK6CT61KpT9/IYS
	V7k7eiHHqd4EXpM/6eKumZjjgnVPTSAth4ZbALMDNsl6VqsXHdeVI0H//eRYaJEV
	U7P86c29d0m78XqYcOOr/xB1fTBXoqhji8pwPjSBY74mFMk3Pz1N1lGUq54qizhQ
	5uoqJ5zHxLfmEWvH/88kkBH+eV/3+kdRN1mSF9mSSWNqOQhK8TWyc3rp17xeCSoi
	F9ZsVdkg/mSkNT4sVcXwEeqEskVy5kv2d2VYbiHHVKVgLiKMN0Ww==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40qjw98afp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 08:51:27 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 14:51:25 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 31 Jul 2024 14:51:25 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id BB8A1820244;
	Wed, 31 Jul 2024 13:51:25 +0000 (UTC)
Date: Wed, 31 Jul 2024 14:51:24 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2 4/4] ASoC: cs42l43: Cache shutter IRQ control pointers
Message-ID: <ZqpBXGH2+PZG2W95@opensource.cirrus.com>
References: <20240731133905.1254796-1-ckeepax@opensource.cirrus.com>
 <20240731133905.1254796-4-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240731133905.1254796-4-ckeepax@opensource.cirrus.com>
X-Proofpoint-GUID: pa-euLx9kv8mX3_VtLnh1H4hr38maLP_
X-Proofpoint-ORIG-GUID: pa-euLx9kv8mX3_VtLnh1H4hr38maLP_
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 31, 2024 at 02:39:05PM +0100, Charles Keepax wrote:
> The microphone/speaker privacy shutter ALSA control handlers need to
> call pm_runtime_resume, since the hardware needs to be powered up to
> check the hardware state of the shutter. The IRQ handler for the
> shutters also needs to notify the ALSA control to inform user-space
> the shutters updated. However this leads to a mutex inversion,
> between the sdw_dev_lock and the controls_rwsem.
> 
> To avoid this mutex inversion cache the kctl pointers before the IRQ
> handler, which avoids the need to lookup the control and take the
> controls_rwsem.
> 
> Suggested-by: Jaroslav Kysela <perex@perex.cz>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  static const struct snd_soc_dai_ops cs42l43_sdw_ops = {
> +	.probe		= cs42l43_dai_probe,
> +	.remove		= cs42l43_dai_remove,
>  	.startup	= cs42l43_startup,
>  	.set_stream	= cs42l43_sdw_set_stream,
>  	.hw_params	= cs42l43_sdw_hw_params,

Actually probably makes slightly more sense to use the ASP ops
for the caching the control names, I will leave the patches
overnight for any other comments then send a v3 tomorrow.

Thanks,
Charles
