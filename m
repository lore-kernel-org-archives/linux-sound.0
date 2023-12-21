Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87787171D5
	for <linux-sound@vger.kernel.org>; Thu, 21 Dec 2023 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="p0Ir59av"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BL8GX9d016665;
	Thu, 21 Dec 2023 03:46:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=2mPypVus8kxF8qk
	jRR0Akx7qGIv3qn15L01qU9PKMkc=; b=p0Ir59avbb3yhpZallP84N7sBsN5pwU
	fbq3ZAskCt+o54H0h9lwEUfPKl3FhsL0IiIxMcykxJgJ5gG1JLKAC0CXX3t2Yw0a
	3vha9VaZMjjIYQwMS9FyWJ/w7GOjBw9S13/QK2H5WEXVhI2edTGTcAysPGETk+M9
	Vzpvkge+iy8R5WwG3d0u6k3SOte0UStGHh/ddVhA93xrxw4nSUzBP30P3fbtPTP0
	mhvf5rOfukCNq69ix9XEAQaCKK6utn5r9C5B4ReHDaVnQuNrQGs2oeBoRn967pv1
	bHwDzicVqaNmmhxASvGwrC0a0Htbdusot2fC2UWKnSjJhoM2AwJiC8g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3v1a6273rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Dec 2023 03:46:38 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Dec
 2023 09:46:36 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Thu, 21 Dec 2023 09:46:36 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 347AD15B4;
	Thu, 21 Dec 2023 09:46:36 +0000 (UTC)
Date: Thu, 21 Dec 2023 09:46:36 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <tiwai@suse.de>, <vinod.koul@intel.com>,
        Bard
 liao <yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
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
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Message-ID: <20231221094636.GE14858@ediswmail.ad.cirrus.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <38d0c1c9-d60c-4ddd-b2ee-091d1717a377@sirena.org.uk>
 <5b8e74ad-460f-4e68-a17b-3131d810f29b@linux.intel.com>
 <ZXOPWRWvrRddOWpT@finisterre.sirena.org.uk>
 <700e564d-7e87-463a-a764-c4713ddf11cd@linux.intel.com>
 <bec481f0-5361-4090-b69c-1123f83ac8ac@sirena.org.uk>
 <f24a2a89-3d8a-4a6d-849a-cddbae4c1e03@linux.intel.com>
 <20231220151631.GD14858@ediswmail.ad.cirrus.com>
 <546d698c-3e23-4a92-9081-f1bebd6b33ae@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <546d698c-3e23-4a92-9081-f1bebd6b33ae@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: oKBkNLvCQh8eI1M36pKd7t46MudCjgxN
X-Proofpoint-ORIG-GUID: oKBkNLvCQh8eI1M36pKd7t46MudCjgxN
X-Proofpoint-Spam-Reason: safe

On Wed, Dec 20, 2023 at 07:26:24PM +0100, Pierre-Louis Bossart wrote:
> On 12/20/23 16:16, Charles Keepax wrote:
> > On Tue, Dec 19, 2023 at 06:08:15PM +0100, Pierre-Louis Bossart wrote:
> >> On 12/19/23 17:53, Mark Brown wrote:
> >>> On Tue, Dec 19, 2023 at 05:50:30PM +0100, Pierre-Louis Bossart wrote:
> Put differently: is there any sustained objection to the proposal of
> extending regmap with async BRA transfers?

Seems good to me, was not my intention to object to the idea itself.

Thanks,
Charles
