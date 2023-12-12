Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pBdu7Tt2"
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E4F113
	for <linux-sound@vger.kernel.org>; Tue, 12 Dec 2023 04:31:07 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BC6V1UD016265;
	Tue, 12 Dec 2023 06:30:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=nPRJvl3VBcj2Fd6
	XFnbw1C0De3KTbG8ckK4ud7nuDjI=; b=pBdu7Tt22fe9Q1fd547SnLJ5yHZ3yrz
	IKclmczkG4tK/GSa48MeAl5b3hrVl5ehUqL6r3Oy4Mltj8AhVSytLMV4sq591IBl
	FFH9wrdm11W0lBWNPaelCO9Ab4/eYl6KPxAWBOmL4dr2AJrmAjvRj5p1OwjO0luS
	VB8tdv4/LeO3NUU+jsclTeJiPFu+gpm0n78ZNBppCdiLhTuRGV8Ww9Cw5brjrGBr
	ah4hTOLT5xgyTPuxEbXq8wqIRXslHOxfqYKCKrm1AvqxqMjACWkPMcwv+dFU7WEa
	JdtSCbB3CDJVPpuTPvqCN3f4PgfL8PFa1zoSLXPnidQsMeo2DGXGDOQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3uwawkac30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 06:30:47 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 12:30:45 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Tue, 12 Dec 2023 12:30:45 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9B83815A0;
	Tue, 12 Dec 2023 12:30:45 +0000 (UTC)
Date: Tue, 12 Dec 2023 12:30:45 +0000
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
Subject: Re: [RFC PATCH 06/16] soundwire: stream: reuse existing code for BPT
 stream
Message-ID: <20231212123045.GY14858@ediswmail.ad.cirrus.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-7-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231207222944.663893-7-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 0M-s16s4bDFnvqAe1U7vkvHAjZq5hvIu
X-Proofpoint-GUID: 0M-s16s4bDFnvqAe1U7vkvHAjZq5hvIu
X-Proofpoint-Spam-Reason: safe

On Thu, Dec 07, 2023 at 04:29:34PM -0600, Pierre-Louis Bossart wrote:
> DP0 (Data Port 0) is very similar to regular data ports, with minor
> tweaks we can reuse the same code.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
> -	dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave,
> -					  s_rt->direction,
> -					  t_params->port_num);
> -	if (!dpn_prop)
> -		return -EINVAL;
> +	if (t_params->port_num) {
> +		struct sdw_dpn_prop *dpn_prop;
> +
> +		dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave,
> +						  s_rt->direction,
> +						  t_params->port_num);
> +		if (!dpn_prop)
> +			return -EINVAL;
> +
> +		read_only_wordlength = dpn_prop->read_only_wordlength;
> +		port_type = dpn_prop->type;
> +	} else {
> +		read_only_wordlength = false;
> +		port_type = SDW_DPN_FULL;
> +	}

Would it be nicer to just add a special case sdw_get_slave_dpn_prop
to return dp0_prop and avoid all this special casing in the rest
of the code?

Thanks,
Charles
