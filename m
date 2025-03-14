Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09111519B0
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966583; cv=none; b=bLBzQYb0ldeXylhVpUESAMi9f6moV/b3Ll+Z1HYpCpELWXNqMOtz2+4NCXRwtzZmnAuxFmMI761OSWCHA/oHuRHER6n1a0QjOBnXZ5BM6Oiad8Nw1GzwQKyUw0joNXtsuY+qcbbDVrSM4f4i+NUOZwdRxJX31R5mvqgs8CYKm/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966583; c=relaxed/simple;
	bh=si63lhWQTSEqzhWr2q8x7ZXv3rgkFSup8gdo8W4ogUE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCArPwrjFa9op3PUBg0bnYwU7r+EmxKHpnAj0oMpzokkkfGYp87etjWYcUaV4GZ8NIIVE2mOMlzfjiL9GeFpL4p5MPW9XCWnS/wqvJ5SP7IhgpjCIwL58uUWL6vUKOadNQtXkz4HYLrl3jw5emm5GoxeIkbZQ59vBvJ4qXMcSLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XqbKdntP; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XqbKdntP"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52EDP4Yj008593;
	Fri, 14 Mar 2025 10:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=dQK0xI4gNTcymk2ReM
	FN14uajujfdQ9fy7NQ3htwFzI=; b=XqbKdntPkjjaYTHLNQV7hiVk38B35tUDXw
	r6+I545j+lEu1ar7wFrHIwr0O977GJXiGVI72YopVJnYQPRyRU8xpVCgxEpwoAE5
	uC5b+JqVpCL+zjN1W98uGHmWmQtbdFM3oAPH8/M1XCoh9a7u8sPOsMxX7TuZRe0f
	FXEWWCHTjy48DquDFY+zZi8+SvFv/bqrLM1YKCdfMygQSi/qzm2qatdQRXNaxNm1
	sRUTqJgbOspCmMDiQqusZ5rqSk0yefAh2ngNbf65BShMJVF38Niq1wGg+B7r3ib6
	ocT2gBA7oh6mKaeTX020YxJVTR5x+p9+mXRVx6SRw0ppoA3wdJVg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45bsngbps5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 10:36:03 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 14 Mar
 2025 15:36:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 15:36:01 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 26EAB822563;
	Fri, 14 Mar 2025 15:36:01 +0000 (UTC)
Date: Fri, 14 Mar 2025 15:36:00 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>
CC: Mark Brown <broonie@kernel.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH 00/89] ASoC: Convert to modern PM macros
Message-ID: <Z9RM4KVVQ3G540N2@opensource.cirrus.com>
References: <20250313174139.29942-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250313174139.29942-1-tiwai@suse.de>
X-Proofpoint-ORIG-GUID: DJ5T8xS_yDqNGzhfkX1gTG9wBbZSAJ7f
X-Authority-Analysis: v=2.4 cv=Mdhsu4/f c=1 sm=1 tr=0 ts=67d44ce3 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=w1d2syhTAAAA:8 a=PBG0yx6CkTKinI7PZlUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: DJ5T8xS_yDqNGzhfkX1gTG9wBbZSAJ7f
X-Proofpoint-Spam-Reason: safe

On Thu, Mar 13, 2025 at 06:40:05PM +0100, Takashi Iwai wrote:
> This is a series of small and trivial patches to convert to the newer
> PM macros, e.g. from SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS().
> 
> The conversions are systematic, and we could reduce messy
> __maybe_unused and ifdefs with those changes.
> 
> Merely code refactoring, and shouldn't change the actual driver
> behavior.
> 
> 
> Takashi

For the Wolfson/Cirrus bits:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Mostly looks good to me some of them have RUNTIE pm ops in the
commit message but personally I would just leave it :-)

Thanks,
Charles
