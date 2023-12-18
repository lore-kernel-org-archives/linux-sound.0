Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAAC37871
	for <linux-sound@vger.kernel.org>; Mon, 18 Dec 2023 14:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RcIiff7Z"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BI5ucvm029947;
	Mon, 18 Dec 2023 08:29:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=Q3K2jRhiUj+p3q9
	pzVaLQolrGJbvLSKGMXyIqTW5100=; b=RcIiff7ZLBLLuGCvlQSuI/wrkRxCGcM
	XcKikPcRb2cP+YcM7UZMMLGWgZWvYZcG4ZM61M3e+VandUWQ8solAnlhFGx3q1Yg
	Q4dNUU8EH9/jXU8oo/SnTHnAlvigBTJMBBQhcLdM5cNTCtRUPJMLvIxhJcqnOWUE
	aillJMRALIzLY09P30aaUClvAkthbWOPpEhzCYqFAvsCXm+r3fDzL7F9nU54UUXJ
	YPZ3RGLrNjbUTTtWaeGdCnHEO3VBHYG0I/2S+pNd6OSjD3lIRh9rBd1ds/+zv1zY
	DjKta/cQfIL6ti7DL9J7FOPkoEwDKJDl2/FVPkOiU0c30yahSYu2hIA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3v1a622scj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 08:29:49 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 18 Dec
 2023 14:29:46 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 18 Dec 2023 14:29:46 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DDEF915A2;
	Mon, 18 Dec 2023 14:29:46 +0000 (UTC)
Date: Mon, 18 Dec 2023 14:29:46 +0000
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
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Message-ID: <20231218142946.GZ14858@ediswmail.ad.cirrus.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <ZYAvoFbEP8RH_x0Y@matsya>
 <a5d0e3a7-e45c-4971-8ad7-7ba19702acf1@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a5d0e3a7-e45c-4971-8ad7-7ba19702acf1@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: fTecLkRAfwiwFOOz9SQ3rNt-s_rvS7z5
X-Proofpoint-ORIG-GUID: fTecLkRAfwiwFOOz9SQ3rNt-s_rvS7z5
X-Proofpoint-Spam-Reason: safe

On Mon, Dec 18, 2023 at 01:58:47PM +0100, Pierre-Louis Bossart wrote:
> > why not have a single API that does both? First check if it is supported
> > and then allocate buffers and do the transfer.. What are the advantages
> > of using this two step process
> 
> Symmetry is the only thing that comes to my mind. Open - close and send
> - wait are natural matches, aren't they?
> 
> We do need a wait(), so bundling open() and send() would be odd.
> 

I agree send->wait->close would be odd, But you just bundle close
into wait. So the API becomes just send->wait, which seems pretty
logical.

> But you have a point that the open() is not generic in that it also
> prepares the DMA buffers for transmission. Maybe it's more natural to
> follow the traditional open(), hw_params(), hw_free, close() from ALSA.

I think this just makes it worse, you are now adding even more
calls. The problem I see here is that, open and close (at least to
me) strongly implies that you can do multiple operations between
them and unless I have misunderstood something here you can't.

Thanks,
Charles
