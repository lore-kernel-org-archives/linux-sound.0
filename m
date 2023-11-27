Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="epMn+3ql"
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67DF9131
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 06:40:50 -0800 (PST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AR9uWst002549;
	Mon, 27 Nov 2023 08:40:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=0s8Y5Yt9NDwm5kv7YhMcjG9KbosgGmr0+RQWDzytH+Y=; b=
	epMn+3qlFvlyadPh3FvKEp4yAWZnsE02jvZSBaNYeCjv1sa5boQjdu1oqTKTjSUw
	tiTSr1khG+UzYl0K0Y/rGutS4Er2FBlGOPrTHhLHYx9sGgpodiBFMB/SBX0NpcQ+
	t31q5hqdF/Lm7m7q4bnbbNxN/SjovI7JBIJDgKIv5sInGnJpArXwYzJY/fmKN8bE
	suQZkPOpBeRD3k7LmOd18VZCfjoV+YWPkhXbYujkQuYmh69i/QDaWBimBvTNwKtO
	z9e6Y8JCyNOdduVzrUzq05kpDJPezL2+XMkLTC0jdkoZdoWynNtXJhuSFg9yVXHp
	yGf3Ekat9CbP830jBH9DEQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uke7pj146-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 08:40:34 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 27 Nov
 2023 14:40:32 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.39 via Frontend
 Transport; Mon, 27 Nov 2023 14:40:32 +0000
Received: from [198.90.251.82] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.82])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 102D615A5;
	Mon, 27 Nov 2023 14:40:31 +0000 (UTC)
Message-ID: <9660e9df-2061-4b2c-ba59-5e6f8a61f07d@opensource.cirrus.com>
Date: Mon, 27 Nov 2023 14:40:31 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43
 and cs56l56 support
Content-Language: en-US
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <cezary.rojewski@intel.com>,
        <yung-chuan.liao@linux.intel.com>, <ckeepax@opensource.cirrus.com>,
        <yong.zhi@intel.com>, <chao.song@linux.intel.com>
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
 <20231127133448.18449-7-peter.ujfalusi@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20231127133448.18449-7-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RaAjJM9BQooL7NFLL1q0vXgQP04P3zOr
X-Proofpoint-ORIG-GUID: RaAjJM9BQooL7NFLL1q0vXgQP04P3zOr
X-Proofpoint-Spam-Reason: safe



On 27/11/2023 13:34, Peter Ujfalusi wrote:
> From: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> This is a test configuration for UpExtreme.
> 
> The codec layout is configured as:
>      - Link3: CS42L43 Jack
>      - Link0: 2x CS35L56 Speaker
>      - Link1: 2x CS35L56 Speaker
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>   .../intel/common/soc-acpi-intel-tgl-match.c   | 78 +++++++++++++++++++
>   1 file changed, 78 insertions(+)
> 
> diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
> index 5804926c8b56..49834bffa50c 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
> @@ -41,6 +41,20 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
>   	.group_id = 1,
>   };
>   
> +static const struct snd_soc_acpi_endpoint spk_2_endpoint = {
> +	.num = 0,
> +	.aggregated = 1,
> +	.group_position = 2,
> +	.group_id = 1,
> +};
> +
> +static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
> +	.num = 0,
> +	.aggregated = 1,
> +	.group_position = 3,
> +	.group_id = 1,
> +};
> +
>   static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
>   	{
>   		.num = 0,
> @@ -400,6 +414,64 @@ static const struct snd_soc_acpi_link_adr tgl_712_only[] = {
>   	{}
>   };
>   
> +static const struct snd_soc_acpi_adr_device cs42l43_3_adr[] = {
> +	{
> +		.adr = 0x00033001FA424301ull,
> +		.num_endpoints = 1,
> +		.endpoints = &single_endpoint,
> +		.name_prefix = "cs42l43"
> +	}
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs35l56_0_adr[] = {
> +	{
> +		.adr = 0x00003301FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_r_endpoint,

Assigning CS35L56 to "left" or "right" endpoints might be confusing.
All CS35L56 in a system receive both left and right channels and by
default they output a mono-mix of left+right.

The left/right of an amp is determined by the firmware file (.bin) that
is loaded and the current settings of the "Posture" ALSA control. So
this amp might be the left channel after a .bin is loaded.

It would be better to have generic names for the endpoint that don't
imply position, for example:

group1_spk1_endpoint
group1_spk2_endpoint
group1_spk3_endpoint
group1_spk4_endpoint.

> +		.name_prefix = "cs35l56-8"

Can these prefixes be "AMPn" to match the CS35L41, CS35L51 and
CS35L56-hda driver? This prefix is used to find the matching firmware
files and our naming convention for these has been cs35lxx-xxxx-ampn

Is there anything that depends on the prefixes being "cs35l56-n" ?

> +	},
> +	{
> +		.adr = 0x00003201FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_3_endpoint,
> +		.name_prefix = "cs35l56-7"
> +	}
> +};
> +
> +static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
> +	{
> +		.adr = 0x00013701FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_l_endpoint,
> +		.name_prefix = "cs35l56-1"
> +	},
> +	{
> +		.adr = 0x00013601FA355601ull,
> +		.num_endpoints = 1,
> +		.endpoints = &spk_2_endpoint,
> +		.name_prefix = "cs35l56-2"
> +	}
> +};
> +
> +static const struct snd_soc_acpi_link_adr tgl_cs42l43_cs35l56[] = {
> +	{
> +		.mask = BIT(3),
> +		.num_adr = ARRAY_SIZE(cs42l43_3_adr),
> +		.adr_d = cs42l43_3_adr,
> +	},
> +	{
> +		.mask = BIT(0),
> +		.num_adr = ARRAY_SIZE(cs35l56_0_adr),
> +		.adr_d = cs35l56_0_adr,
> +	},
> +	{
> +		.mask = BIT(1),
> +		.num_adr = ARRAY_SIZE(cs35l56_1_adr),
> +		.adr_d = cs35l56_1_adr,
> +	},
> +	{}
> +};
> +
