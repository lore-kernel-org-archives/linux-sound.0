Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B9625CC67
	for <linux-sound@vger.kernel.org>; Fri, 28 Feb 2025 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739461; cv=none; b=JvnsWFE8XdhoicfPCm/yU7Dmv6nJKQ1dsWD3DI48oDrDcD70oXedJWEQeSvmIzrKvxFjshQwqImkYskhnFKaC8HNoX1M77jcCdoRLwjJIAOjMpZM14Pa4yAcUrbqemMVUxixDsI18cB+VwlmEqU63+B7bCM4eT6MEsp0xTbVUYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739461; c=relaxed/simple;
	bh=foaTT+uQlviSXelfDcFQWM9XWiFXgnv8+hR9wB+9aq8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTGldVZlnCej514a8opT4eO0gOTTWKwu5XPOGPVkrExEif88prl0mP49NrT0Y+DoMGPhlt5OCslkF5fzEyvctTlxzf3MOhLssfnYF2DaTMHeQDg7sucLeImYltU0ioXiag0i9Gq5RNmrctwB5JPARGO/Bu+ZYGSYfq/pZZ4rxEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=CxX3zcru; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CxX3zcru"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51S90tBF000323;
	Fri, 28 Feb 2025 04:44:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=RF2lB4QNio0Md9V2Cd
	9rf8KUn4npe9eDTOpPtpkYKGI=; b=CxX3zcrujNtpaGf/HH3eVd11NS+fC0actm
	i1RJCUpeC+YMpHJPGW0NxAvnI2sxU8JEEfkY7nChjGZYoIhb5aH/149iRuyhUmmP
	g19OWBvbUXNWosNnSmrclOHvSFNu5BURTkr3yn8aOCFpW2TJSPnOfGnqevnY7ST+
	Z6Fy7Wsv4pbRnVOGG7lm47INOUwLdnBxc1VJ7mf0gg2mz6hgPs4NHmYWTDITz+cu
	pfUCNpEvW5GJoQql4b4XrTjVO9CnBz3s1vxcks2SJtiE84KJaaCjGEVCdWvHIGDF
	8T5tHhepT/kxGOBXSI27/DjMJouElU9CAclhaPfbFD6b0i1pxCSg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 451pspxkuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 04:44:04 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 28 Feb
 2025 10:44:02 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 10:44:03 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id D7E7E820248;
	Fri, 28 Feb 2025 10:44:02 +0000 (UTC)
Date: Fri, 28 Feb 2025 10:44:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <johan+linaro@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <marex@denx.de>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: ops: Revert addition of min whilst checking
 platform max
Message-ID: <Z8GTcW8AgaezL8FE@opensource.cirrus.com>
References: <20250227143513.3283891-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250227143513.3283891-1-ckeepax@opensource.cirrus.com>
X-Proofpoint-GUID: 91Vd-hRG_h8KSJj_gYkz9l-6jZhbEXhP
X-Proofpoint-ORIG-GUID: 91Vd-hRG_h8KSJj_gYkz9l-6jZhbEXhP
X-Authority-Analysis: v=2.4 cv=U8ZoDfru c=1 sm=1 tr=0 ts=67c19374 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=T2h4t0Lz3GQA:10 a=JBjmdsyLyNi883KRWlkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Thu, Feb 27, 2025 at 02:35:13PM +0000, Charles Keepax wrote:
> This reverts commit 9bdd10d57a88 ("ASoC: ops: Shift tested values in
> snd_soc_put_volsw() by +min").
> 
> There are two ways the platform_max could be interpreted; the maximum
> register value, or the maximum value the control can be set to. The
> patch moved from treating the value as a control value to a register
> one. When the patch was applied it was technically correct as
> snd_soc_limit_volume() also used the register interpretation. However,
> even then all the other usages treated platform_max as a control
> value, and snd_soc_limit_volume() has since been updated to also
> do so in commit fb9ad24485087 ("ASoC: ops: add correct range
> check for limiting volume"). That patch however, missed updating
> snd_soc_put_volsw() back to the control interpretation. The control
> interpretation makes more sense as limiting is typically done from
> the machine driver, so it is appropriate to use the customer facing
> representation rather than the internal codec representation.
> 

Seems there is also one other case in snd_soc_info_volsw_range
than needs fixed will do a v2 and resend.

Thanks,
Charles
