Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D3C1DB95E;
	Mon,  6 Jan 2025 12:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736166038; cv=none; b=oBft2dN8fbWHo7fCYHIzcYanNDPNsrgf9MCUBbBQQXO37jIliJzq2f/iPKKZOCoxfDshwfe69c2ARQys4dgxV6SExr/B6Dt/C6LLCSHktQOMViqenSC0sxBzfjJSM5SHI4Go5wjliILqPL9Ebnvp9zJc2j2be7GFVM9GyEZWY/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736166038; c=relaxed/simple;
	bh=Dg+N5wdZI6HGgQKAgO1KYyGmnPJ/nQ5HV894NIfFIvo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qgu7YjXK9IpIAhIiGekiXWqaCnGEboCCKMPpfFG9irYwYsr251SaX3QUMfnDRpOd7HhcElSgZAeZmUH+1pnBuSQYBQ6F+OCHJjOPRBA7KsjOu5sawqRoMvt8KexemCvoY90qbVj5d1LCVGS33q++er1C5OSgD1DbXH9vsGL2XGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ecoAOsPm; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ecoAOsPm"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5067ULeJ019030;
	Mon, 6 Jan 2025 06:20:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=4oXb2e7aSrrfUR1gSJ
	ZmJ39bgwDDSXfuEFCD8GCwHKU=; b=ecoAOsPmkVnwIxxzEN1wlETBvOijVJFndt
	hkowy7Hk4G7duEBZAvtNX5p5J5l9jPaD+oO9QJQT6rJKUu6SasIFsNBMVNMr4Hy4
	/cRz8HOYQ2qPGBl7Qbhm7pSL4cAe5DtzL96+s1lBlLgmJmOVe6PCvNlwltjJxwz9
	sZDD9ahFSgryTwNFSM7aBvEz7ZKMr8BwM//VgmxYGi3/ud04SdDzF6FJ5kndEYqj
	TTYRr+3nR5KRneDtHvHDEQypknGj+aLyShJ49QgnWiqP47T60d0iqNy0AbQN3cnI
	+EFJ32vt2q1ATQfHy7GaW8h4SW+Cn14z787+OTFGa6Evo6PI3tCw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43y29k9shb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 06:20:11 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Mon, 6 Jan
 2025 12:20:10 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Mon, 6 Jan 2025 12:20:10 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 3A196820248;
	Mon,  6 Jan 2025 12:20:10 +0000 (UTC)
Date: Mon, 6 Jan 2025 12:20:09 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH 4/5] ASoC: SDCA: Add missing function type names
Message-ID: <Z3vKeVipRSC9ABia@opensource.cirrus.com>
References: <20241220173516.907406-1-ckeepax@opensource.cirrus.com>
 <20241220173516.907406-4-ckeepax@opensource.cirrus.com>
 <f2038977-4f5b-4a9a-bd5f-89e6839e1703@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f2038977-4f5b-4a9a-bd5f-89e6839e1703@linux.dev>
X-Proofpoint-ORIG-GUID: 5fvf8KB-JPdimmYtvwZ9Arhy056YExBX
X-Proofpoint-GUID: 5fvf8KB-JPdimmYtvwZ9Arhy056YExBX
X-Proofpoint-Spam-Reason: safe

On Thu, Jan 02, 2025 at 04:01:19PM -0600, Pierre-Louis Bossart wrote:
> On 12/20/24 11:35, Charles Keepax wrote:
> >   	case SDCA_FUNCTION_TYPE_IMP_DEF:
> > -		dev_warn(dev, "unsupported SDCA function type %d\n", *function_type);
> > -		return -EINVAL;
> > +		*function_name = SDCA_FUNCTION_TYPE_IMP_DEF_NAME;
> > +		break;
> 
> but this one is controversial. We really have no idea what to do in this
> case. There could be completely different 'imp-def' functions that require
> different drivers. I don't know how the entire binding mechanism would work.
> Probably best to err on the side of throwing a 'not supported' error?
> 

I would certainly agree with you that a generic class driver
implementation would not bind against an imp def function, but I
see no reason to prevent custom driver implementations from being
able to access this function. They will be creating the parent
auxilary stuff and can bind whatever they like to this imp def
function.

Thanks,
Charles
