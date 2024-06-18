Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224B7157E91;
	Tue, 18 Jun 2024 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718721859; cv=none; b=X7ouAl+a5MgBRZ6Hk7sXhQgaSNV3RWvGzdDrI/vmGdgs16/q2yQd+R7kkCQEspZc/tzUGe6tfD9aVP3r94ReqEg1HjNbtm35q4jxpJovOu2Qv9zwU/JTi4AKYqols0Fam13WVgW9StexKw9j+o0LnBvoOZjeKHr8fC1yPoaDGG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718721859; c=relaxed/simple;
	bh=ovCGauVmn3lKF6NgVuUQdBGvIudD+1VlbLHa5xu7eNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bbZD06AgLYwrNurRlTl4zqPSBLgJeWnN2j2Yq3klxgB061cRipVWSscL+sevm++SF6DICIPr3SzOwQz0YljQHGQb+pbJkFOJTuReHoSV9g5FXG0kUq6Yg3HSA5PU/U1EyYSQ9JWwxFuki46SFSsilXN1G0Bjj3AJpEAiWC9d2tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=A6tRO4Zt; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="A6tRO4Zt"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I5jYj2001893;
	Tue, 18 Jun 2024 09:44:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=AkDy6jOuZmWamxJaf6wDXCbAw3AX/x9x8lvPXSDPrkg=; b=
	A6tRO4Zt+JCBjD0FNUkinJd1cOq6WGqPslviAza8P7F9ZEctKGKGgt7bHE9HJAeJ
	VZFiVMypTcqv1PShPBH+WhTYNEXXjtvWucnVolwhJiZlXduqU9ZPJJoKOl0OMsxy
	JVMQGvczVI+d06/3ByDCA3wr5UNOS2GyZnh1VVOpMarZPo1l8j2WEhle2y8l/EOS
	AA2WOm5UtPCnLrWe9R7uGLck2o6J3oJX3uXeLpORjd5+dCLYAIukqfEOFPtqLOdy
	EAA7s3Io2nAQC7ovWnrNIEEEUdAO5wXAQ6kyaFxOGj4yyUutF3Tosskq0srWu8VR
	BzfnP4BaoF7URLR/wIcjcw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ys8by3ew9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 09:44:01 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 15:43:59 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 18 Jun 2024 15:43:59 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 800B6820248;
	Tue, 18 Jun 2024 14:43:59 +0000 (UTC)
Message-ID: <36dae588-5f01-4e27-b054-8db49388e21b@opensource.cirrus.com>
Date: Tue, 18 Jun 2024 15:43:59 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] ASoC: cs530x: Support for cs530x ADCs
To: Mark Brown <broonie@kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>, <lgirdwood@gmail.com>,
        <linux-sound@vger.kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20240617190102.1010597-1-paulha@opensource.cirrus.com>
 <20240617190102.1010597-2-paulha@opensource.cirrus.com>
 <96162ff4-8c54-4efa-b06a-dc20e358e712@sirena.org.uk>
 <4e192a95-bb3d-41d4-b83f-176f0f8aba6b@opensource.cirrus.com>
 <24e1df82-bcad-4b8c-9743-a5ea213807d5@sirena.org.uk>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <24e1df82-bcad-4b8c-9743-a5ea213807d5@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YCmQWdJZh3lDl1xtf4ueFdnxIRlRBMZA
X-Proofpoint-GUID: YCmQWdJZh3lDl1xtf4ueFdnxIRlRBMZA
X-Proofpoint-Spam-Reason: safe

On 18/06/2024 15:25, Mark Brown wrote:
> On Tue, Jun 18, 2024 at 03:23:07PM +0100, Richard Fitzgerald wrote:
>> On 18/06/2024 15:18, Mark Brown wrote:
>>> On Mon, Jun 17, 2024 at 02:01:02PM -0500, Paul Handrigan wrote:
> 
>>>> +	case CS530X_DEVID:
>>>> +	case CS530X_REVID:
> 
>>> Are these really volatile?  I would expect them to have no defaults so
>>> they must be read from the device, but once read I'd expect we could
>>> cache the values.
> 
>> If you mark a register non-volatile but without default, a
>> regcache_sync() will write it back out to the device. While that
>> doesn't necessarily do any harm, that depends on what these
>> registers do on write. Generally it makes me nervous to have
>> cache syncs writing to registers we don't want to write to.
> 
> Marking the register as read only should DTRT there, if not then that's
> a regmap bug which should be fixed.

True but now we're adding extra callbacks and complexity just to
avoid marking a register volatile for some reason. The driver doesn't
need it to be cached, so why bother?
