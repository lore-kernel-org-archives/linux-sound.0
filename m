Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A970127E06
	for <linux-sound@vger.kernel.org>; Thu, 23 May 2024 21:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716498065; cv=none; b=bZukeBTnNzrZrOVZgDzCNyZCT4aK43Gh3oUvIz/Y1bH++IoXZKdbgYSgRlHGpQ2o05oQhvxkLotC/mPaBRdAqLl1h+8WQzLRaQSFQbLQ5s9zKdCpDTYOhjK/CUjdiAm3OlA1M2XzxV6VajQ2fRl6uut9qqe44qC4xhiC/yh26uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716498065; c=relaxed/simple;
	bh=MLRoC0thQOuzEHIlv6stzYrhKJ9GQ18Xlt/1K6ccX7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ik9e2unEnIxif2exXUI3H4r2PJ2FPDk60ptmmKhBRnFtZ/PYfygoIsA+2wlAG60Hiv9/RwLAFL/bgDwSDOvPyXTtJooFyrfCAA6s6Aqtbv/kFPUuoq4Ayf2Jyg/Iqg0AbU6EnK5sR0PHYUhpL9pXpYrgwi8pn4oc2iOY+wmkbeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZzHedyHg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZzHedyHg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NHVWVg027296;
	Thu, 23 May 2024 21:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQnsBVnaYXpG7L5MGqppgBDc1E9zJ9v50nE5+jRwhK0=; b=ZzHedyHgwVpMVCb5
	TRQNfqjj0Y7Ve3gzpwIsWyZLf9uC/zzXc22jAJTVmj0UGdyNM73hDvL4BmXbj0o/
	sATH9x37pq7QK0hwCj1kswQzD8Xq3Afa5FMSRvOuqFmbGXLIjwDf/ARevggIYUC9
	c6Mcws5BS5HoS7TgGZUvAnFNMTnbKG/2T3Q9HqZzvtbfs2YwnvFjaSnB5PJnBi4r
	Bd2EgCUbIh8zKj+wgYNXRyMzdCv5bNqkdCfiKsttjmvMsuiaOcVrl/l+3elV1i7g
	VlaP0hPuw0d8kN4063Yd4eTlCsiOOy/oaibPxmwV+wDHgmH3Ne1PokTeK0nDD0P6
	a9KmDQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa97rdef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 21:00:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44NL0lAa020949
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 21:00:47 GMT
Received: from [10.81.24.74] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 May
 2024 14:00:46 -0700
Message-ID: <a27cfec6-8d01-4ecf-8931-86cf514adb80@quicinc.com>
Date: Thu, 23 May 2024 14:00:45 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] ALSA: Use *-y instead of *-objs in Makefile
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Takashi Iwai
	<tiwai@suse.de>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <linux-sound@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        <sound-open-firmware@alsa-project.org>
References: <20240507135513.14919-1-tiwai@suse.de>
 <ZjpQm-hxLQtpgkUx@smile.fi.intel.com> <ZjqU2rAoHHcrTaVH@smile.fi.intel.com>
 <87ikzod6bt.wl-tiwai@suse.de>
 <dbee6345-1513-4b55-8f8f-d579d577a6d6@linux.intel.com>
 <87o79ealgv.wl-tiwai@suse.de> <Zj4sDtKBNq7yJmk-@smile.fi.intel.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <Zj4sDtKBNq7yJmk-@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TLD7ev2BiB6RhRnfIpD7lpYObf2u9Vp3
X-Proofpoint-ORIG-GUID: TLD7ev2BiB6RhRnfIpD7lpYObf2u9Vp3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_12,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2405230144

On 5/10/24 07:15, Andy Shevchenko wrote:
> On Thu, May 09, 2024 at 08:28:32PM +0200, Takashi Iwai wrote:
>> On Thu, 09 May 2024 18:10:39 +0200,
>> Pierre-Louis Bossart wrote:
>>> On 5/8/24 04:02, Takashi Iwai wrote:
>>>> On Tue, 07 May 2024 22:53:46 +0200,
>>>> Andy Shevchenko wrote:
>>>>> On Tue, May 07, 2024 at 07:02:35PM +0300, Andy Shevchenko wrote:
>>>>>> On Tue, May 07, 2024 at 03:55:00PM +0200, Takashi Iwai wrote:
> 
>>>>>>> this is a series of trivial cleanup patches for Makefile in sound/*
>>>>>>> (modulo ASoC -- which will be submitted later in a separate series).
>>>>>>>
>>>>>>> As Andy suggested in a patch review, *-objs suffix in Makefile is
>>>>>>> basically a mis-use nowadays for kernel driver modules.  They should
>>>>>>> be replaced with *-y suffix instead.  This is a result of systematic
>>>>>>> conversions, separated per directory.
>>>>>>
>>>>>> I briefly looked at this and since it's a mechanical conversion I don't see
>>>>>> any issues, so
>>>>>>
>>>>>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>>>>
>>>>> Btw, make W=1 nowadays enables modpost checks, which complain about absence of
>>>>> MODULE_DESCRIPTION().
>>>>>
>>>>> Example:
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-intel-atom.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-byt.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-bdw.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-utils.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-acpi.o
>>>>> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
>>>>>
>>>>> I'm not sure what the case now for ALSA, just FYI.
>>>>
>>>> Indeed there are lots of code that miss MODULE_DESCRIPTION().
>>> ...
>>>> There are too many stuff in sound/soc/sof/* and I leave them to SOF
>>>> people (Cc'ed), while I'm going to submit the fix patches for the
>>>> rest.
>>>
>>> ok, I'll take care of it. I wasn't aware this was a requirement.
>>
>> It wasn't, but now became so :)
> 
> Seems this is the result of fixing... the 2008 bug:
> https://bugzilla.kernel.org/show_bug.cgi?id=10770

I've been slowly cleaning these tree-wide.
Will now remove sound/... from my "hit list" :)


