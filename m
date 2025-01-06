Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F12650285;
	Mon,  6 Jan 2025 16:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736179390; cv=none; b=CTCSmVfMoIUEh2I47orN+8YdWrmNHl0+6DO/73lWUzMmwkrKjnK8mLw1sz6gzL0VTJtcMhGk/BiW4T4HihoIBaBp4aW5oHXdqU5B0NNMF/yuPG4h1oTEiewu8mNMm1Mpa8JHUpHl8YwArimm7WF8+Z0kiCv3Q0e0LTM9+pNTL4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736179390; c=relaxed/simple;
	bh=7400QFwYG6Oz3WkwjbzQXI6u+kLXSfgSXiRWwVd3d+4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naix6IA9YM0Pgavs2pZIC8j/79q0OD3zqCxEzdFP9us3crK6VXy/msBxtZ4rEtCy5aEOWF1kzRXe21uzB1U8XfI/Q8y+MOOIHXyr0Zf9ZqY+9scQALES83mvUjrF9+4lM3cSmnZwV2G7JR4l7C7ro0TNTPSjJSrQdpRUkdeFp3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CcfQFzoy; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CcfQFzoy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5064rhqd021827;
	Mon, 6 Jan 2025 10:02:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=jH0MscwFf6qcvQZ4Ub
	H3qwQw2F4EOOy9u2ZCF7tp1+E=; b=CcfQFzoy5EvMpZGvdp6Et90lMT9rljC436
	G28bdUYydQfPXW8AUGMEGtFiKKj2ijXHZKCpypj6e72lq30uF3cI4FSJtrxLD7dt
	SZdi6Wy6X1d5PR06LZ1egMI6jRnGDtQWNzxBcHFuBIHjGaNfUP8GigGIBRKy3MbU
	5JE6YxRsmDRrN2plfH5QzHr2luI4RwSrIcUVKKkcD/caR/Nd6CRNPJlIc7GwCC3g
	gEptKRG13OxzxpOF1HHSpCYn6Jk3TU+VovoUbA3v1UpCXiZzWcbysbTBi7jL/QxG
	hIr9v/M0US8r6M1Ej7HJ8epudMgVg5V9Am4vGbxqbcNXkHWAeefw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43y3929xcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 10:02:46 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 6 Jan
 2025 16:02:44 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 6 Jan 2025 16:02:44 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 4F059820248;
	Mon,  6 Jan 2025 16:02:44 +0000 (UTC)
Date: Mon, 6 Jan 2025 16:02:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: madera: Use str_enabled_disabled() helper function
Message-ID: <Z3v+o8NKvr+Z236V@opensource.cirrus.com>
References: <20241229174043.781856-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241229174043.781856-2-thorsten.blum@linux.dev>
X-Proofpoint-GUID: j4wjBhZIovKEjZD3DzJqOPdQOYKjMJZ-
X-Proofpoint-ORIG-GUID: j4wjBhZIovKEjZD3DzJqOPdQOYKjMJZ-
X-Proofpoint-Spam-Reason: safe

On Sun, Dec 29, 2024 at 06:40:44PM +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  sound/soc/codecs/madera.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
> index b24d6472ad5f..86abfbe56e1f 100644
> --- a/sound/soc/codecs/madera.c
> +++ b/sound/soc/codecs/madera.c
> @@ -3965,7 +3965,7 @@ static int madera_enable_fll(struct madera_fll *fll)
>  	}
>  
>  	madera_fll_dbg(fll, "Enabling FLL, initially %s\n",
> -		       already_enabled ? "enabled" : "disabled");
> +		       str_enabled_disabled(already_enabled));
>  
>  	if (fll->fout < MADERA_FLL_MIN_FOUT ||
>  	    fll->fout > MADERA_FLL_MAX_FOUT) {
> @@ -4252,7 +4252,7 @@ static int madera_enable_fll_ao(struct madera_fll *fll,
>  		pm_runtime_get_sync(madera->dev);
>  
>  	madera_fll_dbg(fll, "Enabling FLL_AO, initially %s\n",
> -		       already_enabled ? "enabled" : "disabled");
> +		       str_enabled_disabled(already_enabled));
>  
>  	/* FLL_AO_HOLD must be set before configuring any registers */
>  	regmap_update_bits(fll->madera->regmap,
> @@ -4576,7 +4576,7 @@ static int madera_fllhj_enable(struct madera_fll *fll)
>  		pm_runtime_get_sync(madera->dev);
>  
>  	madera_fll_dbg(fll, "Enabling FLL, initially %s\n",
> -		       already_enabled ? "enabled" : "disabled");
> +		       str_enabled_disabled(already_enabled));
>  
>  	/* FLLn_HOLD must be set before configuring any registers */
>  	regmap_update_bits(fll->madera->regmap,

This should also add an include for the string_choices header,
but otherwise looks fine to me.

Thanks,
Charles
