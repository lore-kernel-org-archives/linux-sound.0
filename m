Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="JHp6evJF"
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD051A4;
	Mon,  4 Dec 2023 07:54:47 -0800 (PST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B4FgDvs016348;
	Mon, 4 Dec 2023 09:54:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=IZUWin5EelBcVCwXF9m42SDzkrRDDfJE27u7Pqz+/Ak=; b=
	JHp6evJFr0W8eDl30hvb+oD3WVFRr9YfK2s+c48A9lp3rwO91aV2chXN1sbuZMOg
	bEmR/fTRfmHp7Zca6RTUNvct+kqjQwvdkmDzXehsbv++n3JsaRQB1YOkfFjDl4am
	jq3tMULEc8zr+6Z/gfaqU24YbPGDAHwGR9lEPbFl2kPDgLP74RzUl/GMUTacquQr
	S5+HSNBYqT5rPSZos6QUVl20nJA9VqiuXQIFzTdexHyhSj169fBiXtEExLKuQHAU
	W6OJFNsc0NWLjCkdoYr3PLN1t5/zIfDNGKQpedUJo67mlCU4COmiER8KPFc4gMBv
	9bD2FzMLXATT62fYmFhoXg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ur1vnj3v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 09:54:37 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 15:54:35 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 4 Dec 2023 15:54:35 +0000
Received: from [198.90.251.82] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.82])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B9D94468;
	Mon,  4 Dec 2023 15:54:35 +0000 (UTC)
Message-ID: <f2dec209-6bc7-49ab-9dff-57a2ca4efb03@opensource.cirrus.com>
Date: Mon, 4 Dec 2023 15:54:35 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43 and
 cs35l56 support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <broonie@kernel.org>, <peter.ujfalusi@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>
CC: <kai.vehmanen@linux.intel.com>, <cezary.rojewski@intel.com>,
        <ranjani.sridharan@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20231204135614.2169624-1-rf@opensource.cirrus.com>
 <8510b464-9352-480d-88cf-857597e16cbc@linux.intel.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <8510b464-9352-480d-88cf-857597e16cbc@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JC-uyXW0VORSYtc4g51NQ7HKt1O_BmeG
X-Proofpoint-ORIG-GUID: JC-uyXW0VORSYtc4g51NQ7HKt1O_BmeG
X-Proofpoint-Spam-Reason: safe

On 04/12/2023 14:55, Pierre-Louis Bossart wrote:
> 
> 
> On 12/4/23 07:56, Richard Fitzgerald wrote:
>> From: Bard Liao <yung-chuan.liao@linux.intel.com>
>>
>> This is a test configuration for UpExtreme with Cirrus Logic
>> CS35L56-EIGHT-C board.
>>
>> The codec layout is configured as:
>>      - Link3: CS42L43 Jack
>>      - Link0: 2x CS35L56 Speaker (amps 1 and 2)
>>      - Link1: 2x CS35L56 Speaker (amps 7 and 8)
>>
>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> ---
>> Changes since V1:
>> - Changed ALSA prefixes for CS35L56 to 'AMPn'
>> - Renumbered the CS35L56 prefixes to match the numbering of the
>>    OUTn speaker sockets on the EIGHT-C board
>> ---
>>   .../intel/common/soc-acpi-intel-tgl-match.c   | 78 +++++++++++++++++++
>>   1 file changed, 78 insertions(+)
>>
>> diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
>> index 5804926c8b56..e5f721ba5ed4 100644
>> --- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
>> +++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
> 
>> +static const struct snd_soc_acpi_adr_device cs35l56_0_adr[] = {
>> +	{
>> +		.adr = 0x00003301FA355601ull,
>> +		.num_endpoints = 1,
>> +		.endpoints = &spk_r_endpoint,
>> +		.name_prefix = "AMP1"
>> +	},
>> +	{
>> +		.adr = 0x00003201FA355601ull,
>> +		.num_endpoints = 1,
>> +		.endpoints = &spk_3_endpoint,
>> +		.name_prefix = "AMP2"
>> +	}
>> +};
>> +
>> +static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
>> +	{
>> +		.adr = 0x00013701FA355601ull,
>> +		.num_endpoints = 1,
>> +		.endpoints = &spk_l_endpoint,
>> +		.name_prefix = "AMP8"
>> +	},
>> +	{
>> +		.adr = 0x00013601FA355601ull,
>> +		.num_endpoints = 1,
>> +		.endpoints = &spk_2_endpoint,
>> +		.name_prefix = "AMP7"
>> +	}
>> +};
> 
> Don't we need the same change of name_prefix for
> soc-acpi-intel-mtl-match.c? I see this in the existing code:
> 

The chain that Peter sent only has CS35L56 added to tgl-match.

I've checked the history of mtl-match and the patch that added CS35L56
there was not cc'd to any cirrus.com email address so we didn't notice
it. Otherwise we would have picked this up earlier. alsa-devel is noisy.

I haven't got a MTL platform to test on but I can send a separate patch
to change mtl-match if you are happy with this prefix change.

FWIW I was going to switch to using "cs35l56-n" prefix but while editing
all our unit test cases to the new prefix I realized that's a problem if
we make similar devices with the same controls. We often make a family
of devices that have the same (or very similar) software interface - for
example CS35L41/L51 and the CS47L15/35/85/90/92/93/48L92 family. If we
use the chip ID as the prefix it would create a bogus change in the ALSA
control names even though they are the same controls. OTOH if we used
"cs35l56-n" for all cs35l56-like devices (to avoid the name change) it's
strange that there's a control named for a chip you don't have...

If it quacks like a duck it would be nice if it looks like a duck :)
