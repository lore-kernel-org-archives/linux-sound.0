Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DyD2BmfQ"
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD99B2
	for <linux-sound@vger.kernel.org>; Thu, 30 Nov 2023 01:59:12 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AU794Rx032229;
	Thu, 30 Nov 2023 03:58:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=1rOwpFjOxzEjLmE
	ZDplb6yDZq9WDb8VUAMixCUzaH4g=; b=DyD2BmfQHB0BvZFAzh87LUECHRuw7RE
	f6x/idiqOmNFOS/TUrUXtDf5/fzDyk0CV4u0Fd1h9HQS90Zh8PlRh+5bE//C5aPc
	TcCD34t4nD5DvavIZrkhw7o/4Iqv6D82VjKXV0UOcFqFCajZOXziJyRpjMtTi0LG
	ylXkvbrHYyDcAi+QS7fJ98/Bu9OqeVDtwvF+MdkXQfc/J9f078jyVJ8dTQtEbV+l
	VAxA5jYmt5rmrnWPvMtUJDB/lhcE1kB0IEWvxj4GLGc2QMM61cSeqsydsCOsoBJ5
	S9E9FxTUcl3Nm3wFHF1e4/LWgHbPE4VwEQ7HGTchgE8wyxggWF2tFvw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3unvhp9vgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 03:58:47 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 30 Nov
 2023 09:58:44 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.39 via Frontend Transport; Thu, 30 Nov 2023 09:58:39 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7B3F646B;
	Thu, 30 Nov 2023 09:58:39 +0000 (UTC)
Date: Thu, 30 Nov 2023 09:58:39 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Paul Handrigan <Paul.Handrigan@cirrus.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Nikita Shubin
	<nikita.shubin@maquefel.me>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 00/10] ASoC: Convert Cirrus codecs to GPIO descriptors
Message-ID: <20231130095839.GS32655@ediswmail.ad.cirrus.com>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: zg2bKV2ldjblk2ECC4yce6v9havYl31k
X-Proofpoint-ORIG-GUID: zg2bKV2ldjblk2ECC4yce6v9havYl31k
X-Proofpoint-Spam-Reason: safe

On Wed, Nov 29, 2023 at 10:28:36PM +0100, Linus Walleij wrote:
> This series walks over the Cirrus Logic ASoC drivers and
> clean out the use of legacy GPIO numbers and legacy
> GPIO APIs.
> 
> The CS4271 affects an ASoC driver for EP93xx which Nikita is
> actively working on moving over to device tree, so I don't
> know about that patch specifically, but I think the collision
> would be max "the file was deleted".
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Except for the typo Mark spotted the series looks good to me:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
