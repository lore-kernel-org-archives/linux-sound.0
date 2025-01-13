Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3EA23ED45;
	Mon, 13 Jan 2025 14:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736777646; cv=none; b=bvQiS1ALS5EDFh5iqs3NPCYpyTyXoCd57Xyt27vJVlvUJ824INgxYWBEZ0YVLw7riIOEUhni9nCZ/9/9wkUwzbiNLacLoUfTwHWsoleZvme6wkDNNSWUKInUr8WFkk2u4kT8HWObV3E54nM5oO0+gMyWbpiNGGxrPsX/GNw92F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736777646; c=relaxed/simple;
	bh=40oXc1Buk2LyRV3T5pAjmjk7sbjXw3BVzBCVZFX0KG4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ubU8695x9tLfl/yVcXdjuCgpKH+kTz/2C2W9IKBkeRPAKP/0A7mL8YXFXL244nFxGVgppmUIvVSP8ea1xOLmspdo9O4lK7KNTeqDiOYL9uvxjU2lKTVkzVXdZ3momfWXspCqLmheKSf4CmKAFR24l5ufi18LXwNqVoL4KoJVDi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=S8VistAB; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="S8VistAB"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D4LGLl006799;
	Mon, 13 Jan 2025 08:13:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=sxKP20kTZx2Twn4The
	0jLwSDqQ55EkIQadozko+gFHQ=; b=S8VistAB18IFLaCC65dlgTbBBom1c4r5uk
	2J6zTTqCjSX1ZOUSwp5ceKrqJ5U1zFUgzz0tTJO9RT02o8TFfPfOWWiU9s+IORTZ
	HoIqNnAHsMP9nFf46fXnPuRTUXht5ewOoTQ3cSQCHi4juZIYby/FvWP7C0Wjm2wA
	jUNXvZRu2IISlmiZ7cDNODsGPRS0S1YaiEBh35xtM514lphcnYzRuqI1zCwO9TjX
	0X/3CH8t2p02Llf4REQ7sPYZz5YNX2wlWqUtbL6JAZovcgdu5MDE88vY9uS7YDK7
	RPFGRu+mtWVZaBZB7B2X+kD1+SDW/b0AygOyJhicmC/zkh/388Ww==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 443px4hxyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 08:13:42 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 13 Jan
 2025 14:13:39 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 13 Jan 2025 14:13:39 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id D3D5782026C;
	Mon, 13 Jan 2025 14:13:39 +0000 (UTC)
Date: Mon, 13 Jan 2025 14:13:38 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-sound@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
        <s.nawrocki@samsung.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <linux-kernel@vger.kernel.org>, <jbrunet@baylibre.com>
Subject: Re: [RFC v2 1/2] ASoC: soc-dai: add snd_soc_dai_prepare() and use it
 internally
Message-ID: <Z4UfkpbDUiJZm2b2@opensource.cirrus.com>
References: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
 <20250110210730.705613-2-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250110210730.705613-2-martin.blumenstingl@googlemail.com>
X-Proofpoint-ORIG-GUID: wMOCrEd8y3OIs-67QofQm6ABfXXcjNbn
X-Proofpoint-GUID: wMOCrEd8y3OIs-67QofQm6ABfXXcjNbn
X-Authority-Analysis: v=2.4 cv=XdhzzJ55 c=1 sm=1 tr=0 ts=67851f96 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=VdSt8ZQiCzkA:10 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=w1d2syhTAAAA:8 a=0EpnaMWjD1AAUn5LxXYA:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=IawgGOuG5U0WyFbmm1f5:22 a=3gWm3jAn84ENXaBijsEo:22 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-Spam-Reason: safe

On Fri, Jan 10, 2025 at 10:07:29PM +0100, Martin Blumenstingl wrote:
> Add a new snd_soc_dai_prepare() which can be used (in an upcoming patch)
> by soc-dapm.c. Use this new function internally in
> snd_soc_pcm_dai_prepare() to avoid duplicating code.
> 
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
