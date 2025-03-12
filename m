Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED72242923
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741794518; cv=none; b=Oore+wy7mWaEwWkkFhd/Dku6tGSOxHv7slnAdPiFU75a+z3YVy6h9sw9ky3AhN0ZPYzImXo07BnQXiY7JalyWSEWEXaKdom2zaZZmjVnnu1YsVgil3/yv4/QLbYh1huNchEzPfgatp1S3z2imVPLGHMZ/sI4wYZiiY4bzKyRZUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741794518; c=relaxed/simple;
	bh=C8bHug6M1U3HEASWvoVojbuBclEVzbVrwoBzNbdUsok=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7KkF2dUefsRH1sD3dl2Wk3lwL2M4xLh6aVqoUMKBHvJ3mJSovebqHtCDrkao5gfZ8UIYpa98kfGYBnr8hwch3H6KgvsxRws6UOuBq6EYSxdxzd82IW+s2LhO+MjxDTzuMSGhjPy4FAVsgABXGYIPJ8u5NyEf22PBOxLbWL45HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=JEtcsdWQ; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JEtcsdWQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C82ipU029680;
	Wed, 12 Mar 2025 10:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=PlRDi936qJjtbYCb0/
	gkSpqFUmXE4ZvtDy0Ou44ITmQ=; b=JEtcsdWQot7U1M8FlTclXX3QcjC+H7EE9y
	/y0vNM44F5Y8qfue2ll4rQ54gDJHH+Fff8ffU/x/gOyoosNZ7fhEDmmlMZ8SuVD2
	3UeYmDOzSjQq7vv3eMypGJeFIeR/GCmUFPy7Tt5wUQpInq9c4CrX21x7oG96LFfi
	NSpIikFJGfrN4BaiqH+eXskaLxxCiFXsE+/xFCSAiVcVh97MHVS7aTjBZFcjj8B5
	u7pL4TkKBq1yIzSdYqo1G7nLHtvWUqp3RcVR6PA+fWME1KSCKRrZ8HAn2j14TgiF
	FpbHuZBkPfyb5wyOGVgquwaPHlJSxwxv2icGIzN80NGmzRw1tK7g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45b6dkryj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 10:48:24 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 12 Mar
 2025 15:48:22 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 15:48:22 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 9082182255A;
	Wed, 12 Mar 2025 15:48:22 +0000 (UTC)
Date: Wed, 12 Mar 2025 15:48:21 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
CC: Mark Brown <broonie@kernel.org>,
        Maciej Strozek
	<mstrozek@opensource.cirrus.com>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH] ASoC: cs42l43: Fix build error without CONFIG_PM
Message-ID: <Z9GsxY9xMUFGRB/x@opensource.cirrus.com>
References: <20250312145642.26646-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250312145642.26646-1-tiwai@suse.de>
X-Authority-Analysis: v=2.4 cv=CaQI5Krl c=1 sm=1 tr=0 ts=67d1acc8 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=PdbQN8Mg_roGxP0lZ5EA:9 a=CjuIK1q_8ugA:10
 a=-FEs8UIgK8oA:10 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 2EOg0CyMLwhsPBJpUh8y9ddt2slTlaX-
X-Proofpoint-ORIG-GUID: 2EOg0CyMLwhsPBJpUh8y9ddt2slTlaX-
X-Proofpoint-Spam-Reason: safe

On Wed, Mar 12, 2025 at 03:56:39PM +0100, Takashi Iwai wrote:
> Put __maybe_unused to work around the build error without CONFIG_PM
> or CONFIG_PM_SLEEP for the newly defined system suspend callback.
> 
> Fixes: 164b7dd4546b ("ASoC: cs42l43: Add jack delay debounce after suspend")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/codecs/cs42l43.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
> index d307b56a7f38..4c7a598f5e73 100644
> --- a/sound/soc/codecs/cs42l43.c
> +++ b/sound/soc/codecs/cs42l43.c
> @@ -2402,7 +2402,7 @@ static int cs42l43_codec_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static int cs42l43_codec_runtime_force_suspend(struct device *dev)
> +static int __maybe_unused cs42l43_codec_runtime_force_suspend(struct device *dev)
>  {
>  	struct cs42l43_codec *priv = dev_get_drvdata(dev);

I believe this should already be fixed by this patch:

https://patch.msgid.link/20250305172738.3437513-1-arnd@kernel.org

Which is probably a better fix as well.

Thanks,
Charles
