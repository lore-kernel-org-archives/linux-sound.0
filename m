Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="CYdZNzfq"
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB00319D;
	Thu, 23 Nov 2023 02:52:11 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AN5lWrm021272;
	Thu, 23 Nov 2023 04:52:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=RSshxsOe/WpI9Zh
	vx3znWw9Og1R8TvaJz6zt8sGGClA=; b=CYdZNzfqonmbYuLq5QqkJdfsvc9DRix
	siAT998YsCAn+2jS2Of1dNeua5XrpyLaSlpNNS6WgF4S3Xl5v74O7KPrvOaASjwh
	p8zaDsKjk73Dlb/9WtcAW/Is3uanjPbHk5TJJj7N5u0nJWA1+RG2DKIbQ6c2w6Jw
	PWV/XaH7u4d6SOZDtKtWAJSU2Kf5r1jT0a/D/EmTCGiwryfaPlMwUeNH2MSs5K4b
	5LFIA4BwCMYpuFs4HwlUVAKZFO0lB4MvRJmi6fFArTXspRkg62I/0JreYUMvAJCu
	oeMjo3dk3AW2YqkPSAmb8s5T/KtdfyECeWNVQRRyQD8pfsmq0di8ssQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ueuj2dmwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 04:52:05 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 23 Nov
 2023 10:52:03 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Thu, 23 Nov 2023 10:52:03 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 27074357F;
	Thu, 23 Nov 2023 10:52:03 +0000 (UTC)
Date: Thu, 23 Nov 2023 10:52:03 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] ASoC: cs43130: Allow driver to work without IRQ
 connection
Message-ID: <20231123105203.GP32655@ediswmail.ad.cirrus.com>
References: <20231123090658.10418-1-mstrozek@opensource.cirrus.com>
 <20231123104624.GO32655@ediswmail.ad.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231123104624.GO32655@ediswmail.ad.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: qKX3GwV0qDWZUXbT5DPlthRZsCGgZXz2
X-Proofpoint-GUID: qKX3GwV0qDWZUXbT5DPlthRZsCGgZXz2
X-Proofpoint-Spam-Reason: safe

On Thu, Nov 23, 2023 at 10:46:24AM +0000, Charles Keepax wrote:
> On Thu, Nov 23, 2023 at 09:06:58AM +0000, Maciej Strozek wrote:
> > Add a polling mechanism that will keep the driver operational even in
> > absence of physical IRQ connection. If IRQ line is detected, the driver
> > will continue working as usual, in case of missing IRQ line it will
> > fallback to the polling mechanism introduced in this change.
> > This will support users which choose not to connect an IRQ line as it
> > is not critical to part's operation.
> > 
> > Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> > ---
> 
> Sorry hang on this doesn't apply to Mark's tree, will need a v6.

No that is me being a moron, apologies ignore this noise.

Thanks,
Charles
