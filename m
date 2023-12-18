Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD14B37885
	for <linux-sound@vger.kernel.org>; Mon, 18 Dec 2023 14:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="R+MCuH6t"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BI5gNTW015248;
	Mon, 18 Dec 2023 08:57:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=IRa5Fh96vB4OlKk
	bnUSzrneEj8/B7LU+a/uIBvZ0X68=; b=R+MCuH6tRcxT0tggDc0x2h/a0MG1LFb
	a2bGQ5YWwbZA/1qjxCNQYYg0vLc6td411wEdmlU/wd4GeiKH7kbvIeoU1Obkkf11
	Fw0oY++pc9/hwVlpMd7FcFA6Bk2+TvHxnyK6E0cVoAx89oAmBrw+Q8VAuBUpbQFC
	oNrgRwOHE2AIhGKqNDq3Hg2fy8l44eOG06k64BmNymYbhSp2OXGjPkWhrwc96bs/
	tqKM8Bo8XObLGaRYgCADsx5iYcp6KYk/i9HGbLY9z83noEarTPvhoa9jHXafRK4F
	hBlhAMSo0R9WQP3Yk6U79mP90opf89tlwq7fKrsEYYxQ15xCMCd1R7w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3v1a622teh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 08:57:18 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Dec
 2023 14:57:16 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 18 Dec 2023 14:57:16 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7DDE115A5;
	Mon, 18 Dec 2023 14:57:16 +0000 (UTC)
Date: Mon, 18 Dec 2023 14:57:16 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: Vinod Koul <vkoul@kernel.org>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <tiwai@suse.de>, <broonie@kernel.org>,
        <vinod.koul@intel.com>, Bard liao <yung-chuan.liao@linux.intel.com>,
        Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>,
        Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
        Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>,
        <vijendar.mukunda@amd.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Shuming Fan
	<shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        Oder Chiou
	<oder_chiou@realtek.com>
Subject: Re: [RFC PATCH 07/16] soundwire: bus: add API for BPT protocol
Message-ID: <20231218145716.GA14858@ediswmail.ad.cirrus.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-8-pierre-louis.bossart@linux.intel.com>
 <ZYAy9ZM0o3uAk2qY@matsya>
 <4f66f792-79c0-4221-82b5-a0d9ec5a898b@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4f66f792-79c0-4221-82b5-a0d9ec5a898b@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: zH1EZc8v2MQKsCCCVHTGRnDzkn_ZK7uB
X-Proofpoint-ORIG-GUID: zH1EZc8v2MQKsCCCVHTGRnDzkn_ZK7uB
X-Proofpoint-Spam-Reason: safe

On Mon, Dec 18, 2023 at 02:12:36PM +0100, Pierre-Louis Bossart wrote:
> > Is this a protocol requirement?
> 
> No, it's an implementation requirement.
> 
> We could move this to host-specific parts but then the codec drivers
> will have to know about alignment requirements for each host they are
> use with. IOW, it's more work for codec drivers if we don't have a
> minimum bar for alignment requirement across all platforms.
> 

I do certainly see that side of the argument and it does probably
warrant some thought as to how a slave might learn the alignment
requirements. I guess maybe some sort of core helper function to
return the alignment? Or putting it in properties the slave can
access? One could even keep the check here, but just pull the
value from something system specific.

The danger with putting it in the core is IMHO:

a) It rules out certain use-cases, generally I think its a bad
idea if the framework design prohibits stuff the underlying bus
could do because someone will, at some point, want to do it.

b) The core limit could get a bit out of hand once more
controllers are added. The core limit needs to be a multiple of
all the controller limits, if a controller comes along with a
weird alignment requirement, that gets problematic fast.

Thanks,
Charles
