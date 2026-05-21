Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6402FD1B3
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 07:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349977; cv=none; b=IPELiNhaiVv2t+MPx45i/j8tF3tx50BvFmw6uhc/oSn79Rw51PiEIv7pq+Q1KpDr2Qcd/p/AGvBHNaUjaDWEM2oTo5uJg7aczRJ2vDFgjz16wU5ZETR5Ni29NsLAxPYw50omDUJwKJx7OE0X9YpN5GmHrphnb2ECWPRsItufpCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349977; c=relaxed/simple;
	bh=stVPPS6O8UFoAUjYnTraqqaK8al/lIlE9rgsYzMSiIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnMiaz69l+EjL1lMXrOjz5Pbwu0q1sUHI/1mDI0C3M4LyzOQ1XDbk8zoWg2A5HKZ7ZulcoY5KUIiWZsD4PqZYpJiXZEZGbYPoco4W7VgI98wQLvatW710lTXpSRdXB4nwF+bbkv9nnWFZkUL+Y4cjFIRbJxnTzqD9omTzLnejF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KZ1G0JTH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f4gqyLRB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KZ1G0JTH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f4gqyLRB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L78mL5119131
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 07:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+gnhFm+Z05zsb0VJc1wdbQL302KSFbm3E9qMnG4C42A=; b=KZ1G0JTHIHa/1L94
	4xcRazHzg87YkBNF/xyPb9sCZzF2NJconO6K4fygn/DBfFUM7wn4IbykM5JcO/lA
	EwH/wLjqz79s5u+94adtjkBIeN7oO2SIBtH2wmEnyNcrrklhTgTMD9AjCSfKf3ab
	WYxBX03fzrBikgIR4NuZ9dj4WJXVEqLoOIKkId7Kte3NeXtkg5OnK9rxdnDBNVOf
	eYwOIPdyMSXBdFX0S4XFQLJad9anlvUCEzIbfLJzMao8lWXIbyznoGzer+XddECe
	aIBCGBcDOV6fNQRnd+nxutP1QEEJL+pwKlLJQ5LykOLj7dr3f8q3LqT7Q7Lh5rIz
	dQIEUw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8btxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 07:52:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-515224a8aa0so95339401cf.0
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 00:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779349973; x=1779954773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+gnhFm+Z05zsb0VJc1wdbQL302KSFbm3E9qMnG4C42A=;
        b=f4gqyLRBrYZ9FdyHFNeXvTHlSHJJegBQiEBZemk8sFZnbXx8d8S0nEtVzpvUxTRFVQ
         M+MhO/HGEnYsA4y7sd1bI/y2Absn6br8Se4JHRNLfjpWZ0HNz54Ur66CJAefWJgXLUqe
         OYNtKy8xzT1PVJWuPWTfIS2JZ46cebUDf0p72K95KwBVPtUchydZ4kj5ncqs/1Z+P2Zz
         +BMJ/Is3nPH9lVDQFqusK8HrCR14CPwqHLmDpIY3uO5NeYtsNGAmV9oWf0mlmMoYWR3q
         vMoFvBo7rxt1vgUQ9sOlhzvOcalU+A+4rHNxaYRTIoa/0YMBU3NTKg/poF1PMsFApqkc
         ZqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779349973; x=1779954773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gnhFm+Z05zsb0VJc1wdbQL302KSFbm3E9qMnG4C42A=;
        b=oQdcNLgWLW7je6rCwfIO2xIPmd071vNEHKLP7yY+NOXgbv99lMarQg7B+4Qx3lCMC3
         r2lGvZ7VplDvn0PswCC9AHHysub2j3IMk+3CzGfOxEPtE4ONvt5N9KbOKM7Ewuf1Hq9l
         vVSi3wE7bIA2g1XeP4vNl0/rZaKkKc4rM6m6VIi7Flg8GtdEZpLKWctACZcDYvsviFq1
         sdeRGr1oEL0yJD0B2k9IASs7pet2X4QbG4oCZUhL/WMeD1+dAD0EuYY3z4mQZ764emwj
         f1fefsWYn2xxkJJgv5wP5ULjtv8MrVpPvDkvIgxYAYGbF106kQ8Dyftf+IEz+8Urjp6b
         ErKA==
X-Forwarded-Encrypted: i=1; AFNElJ8cI1Ws1TlCH3a59egkY0kLrTYFSDzmFsxR3tR1dQPWM1L0x+YjpJ7tE5B7krBCQd3xdwkqXJU/HYPBcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfQKUSaYKMeOpu2yhOll726kvSRMdrA7jCRYxJmdR6V4Vj/BlL
	SZe7k4DSqqU687Qi9M0XJjFpKh26NW7kbW2nmR+++zl0gAeABa9ksKxzYlNDAJzro6XfKy68gU9
	k3DCR58uJVqpCWxcFXN71AiZEmg3aqydPXw10KeD0n97J8AyY4LDbNeMt/yh5tmVHM9Jt0enadQ
	==
X-Gm-Gg: Acq92OGGP0mpf+Geql4QQQDEtVt4vuFhGypwg/gKGLXuGvb/kVagC+2ixRihKvE0dxg
	jfRRFhaEg3J6cqD4iShSDHK2bNbJlE3xAOZD83Wsn33Oc1kcMiJP71S4zDO9DeBpoUgVx45UzR0
	JOA8yO1HQiopqPPW/1XhjHFJPjCcOpu6Ym7bNzyWAp9cJsNwHF4vf8A96eEJ7ZU2FHGSQwid1RI
	Sc1u5J66JhtbynGHj8Jkk0/xLCIgrx8CB7Sec9EzfmDHFEMvH0FFqKfRXeWwmzORi1iMmKrxKSm
	KOPksRM5RgfFoCWYBxGgsbiC5ZqdlntT0B4QQkKAP3IMs2f26eIRALJITS63AbAs1c4B5wAi22L
	a2y8XU7Q55k0dO4DT0O9+P6SxuECMaUXkFY4LPDLYD0j/dERLESnqDquD5Qs=
X-Received: by 2002:a05:622a:5e14:b0:50d:81c4:4c79 with SMTP id d75a77b69052e-516c557611bmr21837501cf.35.1779349972802;
        Thu, 21 May 2026 00:52:52 -0700 (PDT)
X-Received: by 2002:a05:622a:5e14:b0:50d:81c4:4c79 with SMTP id d75a77b69052e-516c557611bmr21837291cf.35.1779349972343;
        Thu, 21 May 2026 00:52:52 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4903ad2ee77sm9386845e9.0.2026.05.21.00.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 00:52:51 -0700 (PDT)
Message-ID: <9793ea97-70bb-49a4-9b93-a6fe38e07965@oss.qualcomm.com>
Date: Thu, 21 May 2026 07:52:50 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ASoC: qcom: q6apm: add watermark event support
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com,
        mathieu.poirier@linaro.org, verhaegen@google.com, andersson@kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260519131527.4002526-6-srinivas.kandagatla@oss.qualcomm.com>
 <DINUJUCEDNXP.2BDISX62IPSQ2@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DINUJUCEDNXP.2BDISX62IPSQ2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jSC-Aesc6iAGxNOXHmB2v6Fr1mkU2HqH
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0eb9d5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=LvOwEAKMvOOzFXVW9JgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA3NiBTYWx0ZWRfX86SJu5aJz4UE
 P+1a7xaFj2+3JnzE7A3Ug5aVO9ufGGwpv0mQWSih9WB1u04LSHLdnJyKuX0cqllQLadzmNfv0+F
 4ngOfPephkeV4rCPkK/D8hzDDAgdg78fSiKs5/VTvhxYA7F1GutreusFs8Hg+YaQTzkCCaK2xhz
 S8I+SvhTWKNlzQMpwJNr1bdjTNjSyVafIc3Iey4f/bj563ij+jQ938+jeZft80/X5y2xC/urC4U
 7JVjMzLmww056H/9dEJq/2f6J6EMI7xrnNcxy0RbZPanAubUloNKC+oiP2YjwjXaWNG8bFru4/Y
 Ko9NBOYkyrmNrQ+i9EG5akw9A8BgCvjT09DqiNWrtvukRvw/YI1LApAb9Lwgkv6BSd+TAvHjoMc
 1mv2/Vdm02f9Hor/OIwPI5sKgEtUUyxosn3O192y798cIXHKhYYIw3kWvZtvBoTwAZkVJNQypEC
 nFqFxINE4W+8ckHwBzg==
X-Proofpoint-GUID: jSC-Aesc6iAGxNOXHmB2v6Fr1mkU2HqH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210076



On 5/20/26 10:11 PM, Alexey Klimov wrote:
> On Tue May 19, 2026 at 2:15 PM BST, Srinivas Kandagatla wrote:
>> Push-pull shared memory modules can report watermark events when the DSP
>> read/write index reaches configured circular buffer levels.
>>
>> Add support for registering watermark levels with the shared memory module
>> and route the resulting module event to q6apm clients using a new
>> APM_CLIENT_EVENT_WATERMARK_EVENT event.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/qcom/qdsp6/audioreach.c | 36 ++++++++++++++++++++++
>>  sound/soc/qcom/qdsp6/audioreach.h | 50 +++++++++++++++++++++++++++++++
>>  sound/soc/qcom/qdsp6/q6apm.c      | 19 ++++++++++++
>>  sound/soc/qcom/qdsp6/q6apm.h      |  2 ++
>>  4 files changed, 107 insertions(+)
>>
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
>> index c984b12409dd..e6e9eb2e85aa 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>> @@ -1118,6 +1118,42 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
>>  	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>>  }
>>  
>> +int audioreach_shmem_register_event(struct q6apm_graph *graph, int bytes, int num_levels)
>> +{
>> +	struct apm_module_register_events *event;
>> +	struct event_cfg_sh_mem_pull_push_mode_watermark_t *level;
>> +	int i, payload_size;
>> +	struct gpr_pkt *pkt __free(kfree) = NULL;
>> +	void *p;
>> +
>> +	if (num_levels <= 0 || bytes <= 0)
>> +		return -EINVAL;
>> +
>> +	payload_size = sizeof(*event) + sizeof(*level) + num_levels * sizeof(uint32_t);
>> +
>> +	pkt = audioreach_alloc_cmd_pkt(payload_size, APM_CMD_REGISTER_MODULE_EVENTS, 0,
>> +				     graph->port->id, graph->shm_iid);
>> +	if (IS_ERR(pkt))
>> +		return PTR_ERR(pkt);
>> +
>> +	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
>> +
>> +	event = p;
>> +	event->module_instance_id = graph->shm_iid;
>> +	event->event_id = EVENT_ID_SH_MEM_PULL_PUSH_MODE_WATERMARK;
>> +	event->is_register = 1;
>> +	event->event_config_payload_size = sizeof(*level) + num_levels * sizeof(uint32_t);
>> +	p += sizeof(*event);
>> +	level = p;
>> +	level->num_water_mark_levels = num_levels;
>> +
>> +	for (i = 0; i < num_levels; i++)
>> +		level->level[i] = (i + 1) * bytes;
> 
> Let's hope that compilers optimize this to avoid multiplication, anyway
> it shouln't be a hot path, although I don't really know.
> 
> - don't you need a check like num_levels<=ARRAY_SIZE(level->level) before
> this loop? Looking at the code it seems that it relies on pkt which is
> allocated using audioreach_alloc_cmd_pkt() taking payload_size into
> account. Looks okay but I wanted to double check.
> 
thanks for the review Alexey,
Yes, its okay, its flexible array in that struct , as long we allocate
enough space at the end equal to number of levels its fine. This is
exactly what we do in
payload_size = sizeof(*event) + sizeof(*level) + num_levels *
sizeof(uint32_t);

> - level->level[] is of u32 types. Can level->level[i] = (i + 1) * bytes
> overflow?you mean overflow u32 bit value? Technically yes, but the level is
period bytes are limited to max of period size and num of periods which
is BUFFER_MAX SIZE that is 64k*8,


--srini

> 
> [..]
>> +struct event_cfg_sh_mem_pull_push_mode_watermark_t {
>> +	uint32_t num_water_mark_levels;
>> +	uint32_t level[];
>> +} __packed;
> [..]
> 
> Best regards,
> Alexey

