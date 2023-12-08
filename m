Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mPNv0jBe"
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26962173F
	for <linux-sound@vger.kernel.org>; Fri,  8 Dec 2023 08:29:00 -0800 (PST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B8FeRJ2004881;
	Fri, 8 Dec 2023 10:27:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=0HWZUD+gNPGdTS3
	1RBA/QqGm7ZI0O39dD0eoI6266U8=; b=mPNv0jBeENPGWeoXiCD/V2X6Z1fMIPM
	RpZirjpxrtV/l1DYyrHQIE9tk1hqMYvRncAFJH+os4r7GC6sEpx70dxBV0q2kt7F
	cJs9BahRwBKHIHtAmijQcBXb2AZMlDT/iAzPds0ylEnmIpuufAWCp4CRfOfQu7LF
	wqOkWO3fTR9ohveh+GfOF4MnpUwaF39UDzMmI+wEIuU9d42tQh0vX1piN55JgWOF
	K6PIe73yPf+7Tfaz5jJL/+f2ht25YXupK4EW7xlel0gV09+o+s4krOZ9YV6+NZl2
	XoyxyqtNXvJb1VgH8CJHTRC7jqxdoN7jl7d481k2b7rWTaGDD6f5ufA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3utd1wbqc4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 10:27:37 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 8 Dec
 2023 16:27:35 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 8 Dec 2023 16:27:35 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D2DC111AB;
	Fri,  8 Dec 2023 16:27:35 +0000 (UTC)
Date: Fri, 8 Dec 2023 16:27:35 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <tiwai@suse.de>, <broonie@kernel.org>, <vinod.koul@intel.com>,
        Bard liao
	<yung-chuan.liao@linux.intel.com>,
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
Message-ID: <20231208162735.GV14858@ediswmail.ad.cirrus.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: rmyWVHnc9on0167-CfgnfC99u-bSf5iL
X-Proofpoint-ORIG-GUID: rmyWVHnc9on0167-CfgnfC99u-bSf5iL
X-Proofpoint-Spam-Reason: safe

On Thu, Dec 07, 2023 at 04:29:29PM -0600, Pierre-Louis Bossart wrote:
> The Bulk Register Access protocol was left as a TODO topic since
> 2018. It's time to document this protocol and the design of its Linux
> support.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
> +Concurrency between BRA and regular read/write
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +The existing 'nread/nwrite' API already relies on a notion of start
> +address and number of bytes, so it would be possible to extend this
> +API with a 'hint' requesting BPT/BRA be used.
> +
> +However BRA transfers could be quite long, and the use of a single
> +mutex for regular read/write and BRA is a show-stopper. Independent
> +operation of the control/command and BRA transfers is a fundamental
> +requirement, e.g. to change the volume level with the existing regmap
> +interface while downloading firmware.

Is this definitely a show stopper? Not saying that it wouldn't be
desirable to do both from a speed perspective, but current
systems that download firmware (I2C/SPI) typically will block the
bus for some amount of time. There are also some desirable properties
to a single lock such as not needing to worry about accessing the
same register in the bulk transfer and a normal command transfer.

> +Audio DMA support
> +-----------------
> +
> +Some DMAs, such as HDaudio, require an audio format field to be
> +set. This format is in turn used to define acceptable bursts. BPT/BRA
> +support is not fully compatible with these definitions in that the
> +format may vary between read and write commands.
> +
> +In addition, on Intel HDaudio Intel platforms the DMAs need to be
> +programmed with a PCM format matching the bandwidth of the BPT/BRA
> +transfer. The format is based on 48kHz 32-bit samples, and the number
> +of channels varies to adjust the bandwidth. The notion of channel is
> +completely notional since the data is not typical audio
> +PCM. Programming channels helps reserve enough bandwidth and adjust
> +FIFO sizes to avoid xruns. Note that the quality of service comes as a
> +cost. Since all channels need to be present as a sample block, data
> +sizes not aligned to 128-bytes are not supported.

Apologies but could you elaborate a litte on this? I am not sure
I follow the reasoning, how does the 48k 32bit DMA implementation
result in 128-byte limitation? I would have thought 1 channel would
be 4-bytes and you are varying the channels so I would have expected
4-byte aligned maybe 8-byte if the DMA expects stereo pairs.

And what exactly do we mean by aligned, are we saying the length
all transfers needs to be a multiple of 128-bytes?

I think we might have some annoying restrictions on the block
size on our hardware as well I will go dig into that and report
back.

Thanks,
Charles
