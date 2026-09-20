Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E463B71AE
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 07:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789891028; cv=none; b=pRYnWxNygKcwT58nFynkcR5vYR3z8Z8jRVBiu0pRzQ5bkputT9kE99qBWeFaUHmp4jbTQWbQLRDl+wrnf5D++u/Dot+NMn104tfgWLbt9PjNQpTdWyob+IogLoL93WPE0L9TrpC0uX9lMcwj+ke2Gjz3+ut+QycDaSzuVMLICZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789891028; c=relaxed/simple;
	bh=10UWPSPmb9XW2GawhnmSC1jutTzA20MxAv6SW9wOgh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ig0400f1eiGEK6a6w4jCdoW7Tuiybm/vnT3xF5583oHtAIrjcSRctaw8JqzNMihOtZxOZph62tdo2gHOoZv7Fmf7jy3gzGmO+ZJ8pBsq54yz0Oa3wvZOALV3vRDgHUS9LBfMHnrVQMxUEXAv3jzWdEWjfaxO9VFFPRKwzwmYKC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGsCSbWH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+jWb76x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGsCSbWH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+jWb76x"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K54kT02455542
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 07:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J0ImLy8UpTS0ySvphSuc+ywmwojEWmjCqD9SI1nmb1k=; b=LGsCSbWHC8Mzhb/F
	J6WtV7kSM6ioc0dz5kSHyF+hbTsa7x+S9LxHwwKQiB+lGf0dwrclR/iqY2rPdZwZ
	zhq6WxAIMs5+oNlKdoetKy+KzBLm7JijwbScyVxTeaaGcfrEX+E2bPw0AyIH8/Hl
	CIv7CnfSWgC9QoptDu1At0fvYuOjdlXCiVHyPXEMI3+WjixQdiSY8v9UjxxnyCNp
	6JxIxQ38dfxKRDBLY38Ji0SOBA5v35j4dCw/toMi39HZ8HzH+Sbw+37tNrIZl6lJ
	gx/WbG6yolKnrRvhX+gTB8A/0qT27a+MfRUPSsKp0NrNgfRAM8ASsd6iXfoD0jH1
	acprbg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsap9d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 07:57:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d959904658so37805845ad.2
        for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 00:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789891025; x=1790495825; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0ImLy8UpTS0ySvphSuc+ywmwojEWmjCqD9SI1nmb1k=;
        b=C+jWb76x/t0oaxv+3qO+x5orMbNURvT6seahhK00aSEUP9WwW8tGSgsYE102tywTvL
         yv1Xc49PhMWJGgAQnr172+R7VJjCkk/6TIzLPAcbUhUZvxJFE1FaHuehJBspbZ8dqpBL
         LmpYHzAKcUx6/Ky5x50RDmVKzdH+psRlWz33Ay7tM/AXZu4xUy46va5IaRt9uYFrUZkj
         HGt6EX3Xqh2wSyhwNXF/hW/tFRdlYuonqMgbEI8oT7S4fxEaK6OldIwIjSiPzxHpEPot
         qUwosGYMVnbWk4UA07xqdpb8Pz5f6yQIUZyjUmhJRvdcZIjMQ8ZUWcgSHLNYVVyjpz1z
         zInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789891025; x=1790495825;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0ImLy8UpTS0ySvphSuc+ywmwojEWmjCqD9SI1nmb1k=;
        b=Oj5N3P5YTBIdowYHmJTw6jUR/1XYSYU1Z9//sLozdCg7pZ9qcWQlRzDil2qGqNWPTR
         rpIGrGmhB4hujqd6WA4I406cqrv+EXvWFTh+TA15vBo84lCUd1DsS6pHMvjD3oGSO6tx
         D3wJYAFHK58sRnTq8EjLYd1zo97e8icTZ0pULbMdDXdbyycZVHTiNXipNz61PGImD5DO
         wY3fsDU8KL54KBrJLwydgMW53Wh8fsxyMmWdb9QV6Z0s015CHPkwknUeBsbegoWaJ0Gn
         h7hSkdGRIHTqCpRtXEyOGkveK3lHurXMW2BypM1IUiAfHjr2YbtsW9lgg2z27Ttycq1+
         C5AA==
X-Forwarded-Encrypted: i=1; AKwUvBzrpf2mRknsMCjJWwBV0+vCkDN+ai1vTqlbmUnj5JQ6885mg2RRfi2EXB8F2++3avAk+9mnsQEWEINvtQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m0jf6NhXO/YNoi17M2TaowsT0bSZqTVKXr1bWWe+0tDvE/5X0i
	iyrApPI/Z6yN+WI2SoVQuu7UBPY9D/brp+ZDtDQyIdFMGXQmVJmxraxmx/VUt6jxUPobH5pDR9I
	g7gyEHe8OZsFyCLUuvnIzW7lRixQXG0nfnMmcO9uDCYbJNTetpX7ty9eDz94I1Qqz+A==
X-Gm-Gg: AYBFou217hg+1V4pOtP0Qmy3ECOP4cj+MepjJL2ia/OJWV4byXQLaizlRICMlBwpL9B
	IisiNRDsgipRE1V2PE7HNulQHuqnzv2WcAPvUj3UdjnFnJJaXywoCsoZACBSYsSRxN78Flu47ex
	9Z/I+Vh7TOI8yCATcbckzR8E/JgNIsoMOiQjKwKqYSG3K3SXGeARvHQ2avg/IaBOB5oHTGyFv7O
	RQN38gDif8d7Q6Ze0ASvxCzCsOKiT70ElKi/chuV36bjz73k/Xk0QVa5uO/PC60n/arcvftD6CR
	FR49PE5H1p/jQTTv1xMQASryOzLXo5rHYShbi5fc/lc0fPORzwqOUyu20bRuiiWy75EGPAT+lBw
	91WRFhZA4OnkIQtvCkWul/HR7oVB5p8eVow==
X-Received: by 2002:a17:902:e810:b0:2dd:c100:7cc7 with SMTP id d9443c01a7336-2ddc1007e2cmr61637605ad.67.1789891025462;
        Sun, 20 Sep 2026 00:57:05 -0700 (PDT)
X-Received: by 2002:a17:902:e810:b0:2dd:c100:7cc7 with SMTP id d9443c01a7336-2ddc1007e2cmr61637415ad.67.1789891024990;
        Sun, 20 Sep 2026 00:57:04 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.235.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331aef9bsm10737773eec.25.2026.09.20.00.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 00:57:04 -0700 (PDT)
Message-ID: <2b3fd8cb-8ac4-4d40-a074-2365c7465b8f@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 13:27:00 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] slimbus: qcom-ngd-ctrl: Implement disable_stream
 callback
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260810-slim-disable-stream-support-v2-1-c2e8fcc3c99d@oss.qualcomm.com>
 <d4b07e0a-24f0-4857-b5db-0e74ffe537ed@kernel.org>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <d4b07e0a-24f0-4857-b5db-0e74ffe537ed@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: crUUywHbEWgL-lKbmsFOqdq9GnmiCHmj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDExMyBTYWx0ZWRfX79yY2P5V0ndG
 07qke+5I46SQ2wv/d+L88Ow3NXaLPxVhaEnmVaoziUrGBB67L/jUd5lSVj1uUojjMnXU3RMzIwp
 DzDjBul6qQC0tD8C0DxVESDF2m9G2Lr0dYdPVrZG/CP30WTCd+g/GJYDkscBeVLTqiDWlgyfzHl
 FlUuwOX/egssC2L+qdQvs5gf5r0eiMXo3fbMT0ZRryl7Tayj7W3UdUsWGZvmQqwkAmX9bD0H/or
 W7QKCd11hkUXdsxRcUFS9HerZ5Pz6zqWaE3sLWsfQIeII5hwJFzalU9ANDb0rOCa+++7eAl7d4+
 vBxhSg4fnQbUDyhGtShqUgp/UjRxWHkxDKHQkD8L/Ja6HvASrow64LGvv+dgY/TTseo+YBRJhuU
 vj6sCVlFKttTAiXIFo7Sji/KP9fMNBmxtAzlZzxI8MCejZf46tboAGp0NCnZSXv/9wmSKoWqcKp
 ROFP2IhyDH6+Cb0/NIA==
X-Proofpoint-ORIG-GUID: crUUywHbEWgL-lKbmsFOqdq9GnmiCHmj
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6aaf91d2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=pmtpKdcgZ0pbyg+hYGrA9w==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=t_RhiFrL2OtSvlCdtxkA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDExMyBTYWx0ZWRfX6EBmx50Tnvs6
 IrYbFBq5JmUE+vtHA6GyIx63ol6ZXZi55j0cH52paVMFKbYNx7cOLuYZg1FueKNF4+mzU+xhjCJ
 jEthW1fL9A9SrpH8srk4D03nfGBpVWs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200113



On 9/18/2026 4:05 AM, Srinivas Kandagatla wrote:
> 
> 
> On 8/10/26 6:52 PM, Viken Dadhaniya wrote:
>> Switching a channel to a new frequency without first disabling the stream
>> causes the channel to be re-enabled without a clean shutdown, leading to a
>> crash on the DSP subsystem.
>>
>> Implement qcom_slim_ngd_disable_stream() so clients can properly close a
>> channel before switching to a new frequency.
>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Rewrite commit description for clarity.
>> - Fix initializers: use { 0 } instead of {0} and {0,}.
>> - Use reverse christmas tree ordering for local variable declarations.
>> - Replace open-coded shift/mask with FIELD_PREP() and GENMASK-based defines.
>> - Add SLIM_MSG_HDR_LEN macro to replace magic number +4 in txn.rl assignments.
>> - Fix dev_err format strings: add spaces after colons and commas.
>> - Update enum slim_ch_control comment to kernel-doc format with @member tags.
>> - Link to v1: https://lore.kernel.org/linux-arm-msm/247e4ce7-1ba2-43b8-8a11-ec70f99a4fc1@linaro.org/T/#m3b50aa43a6493f8d3b607b1607b37bf14b199f69
>> ---
>>  drivers/slimbus/qcom-ngd-ctrl.c | 82 ++++++++++++++++++++++++++++++++++++++++-
>>  drivers/slimbus/slimbus.h       | 13 +++++++
>>  2 files changed, 93 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
>> index 934c44c5bc1a..30d6ac52072b 100644
>> --- a/drivers/slimbus/qcom-ngd-ctrl.c
>> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
>> @@ -1,7 +1,11 @@
>>  // SPDX-License-Identifier: GPL-2.0
>> -// Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
>> -// Copyright (c) 2018, Linaro Limited
>> +/*
>> + * Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2018, Linaro Limited
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> Why are you modifying this?

Updated the copyright header to use a single multiline comment, including
the Qualcomm copyright attribution.

> 
>> + */
>>  
>> +#include <linux/bitfield.h>
>>  #include <linux/irq.h>
>>  #include <linux/kernel.h>
>>  #include <linux/init.h>
>> @@ -86,6 +90,10 @@
>>  #define SLIM_ROOT_FREQ	24576000
>>  #define LADDR_RETRY	5
>>  
>> +#define SLIM_CHAN_CTRL_CMD		GENMASK(7, 6)
>> +#define SLIM_CHAN_CTRL_LADDR		GENMASK(4, 0)
>> +#define SLIM_MSG_HDR_LEN		4
>> +
>>  /* Per spec.max 40 bytes per received message */
>>  #define SLIM_MSGQ_BUF_LEN	40
>>  #define QCOM_SLIM_NGD_DESC_NUM	32
>> @@ -1085,6 +1093,75 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
>>  	return ret;
>>  }
>>  
>> +static int qcom_slim_ngd_disable_stream(struct slim_stream_runtime *rt)
>> +{
>> +	struct slim_device *sdev = rt->dev;
>> +	struct slim_controller *ctrl = sdev->ctrl;
>> +	struct slim_msg_txn txn = { 0 };
>> +	struct slim_val_inf msg = { 0 };
>> +	u8 wbuf[SLIM_MSGQ_BUF_LEN];
>> +	u8 rbuf[SLIM_MSGQ_BUF_LEN];
>> +	int i, ret;
>> +
>> +	txn.mt = SLIM_MSG_MT_DEST_REFERRED_USER;
>> +	txn.dt = SLIM_MSG_DEST_LOGICALADDR;
>> +	txn.la = SLIM_LA_MGR;
>> +	txn.ec = 0;
>> +	txn.msg = &msg;
>> +	txn.msg->num_bytes = 0;
>> +	txn.msg->wbuf = wbuf;
>> +	txn.msg->rbuf = rbuf;
>> +
>> +	for (i = 0; i < rt->num_ports; i++) {
>> +		struct slim_port *port = &rt->ports[i];
>> +
>> +		if (txn.msg->num_bytes == 0) {
>> +			wbuf[txn.msg->num_bytes++] =
>> +				FIELD_PREP(SLIM_CHAN_CTRL_CMD, SLIM_CH_REMOVE) |
>> +				FIELD_PREP(SLIM_CHAN_CTRL_LADDR, sdev->laddr);
>> +
>> +			ret = slim_alloc_txn_tid(ctrl, &txn);
>> +			if (ret) {
>> +				dev_err(&sdev->dev, "Fail to allocate TID ret:%d\n", ret);
>> +				return ret;
>> +			}
>> +			wbuf[txn.msg->num_bytes++] = txn.tid;
>> +		}
>> +		wbuf[txn.msg->num_bytes++] = port->ch.id;
>> +	}
>> +
>> +	txn.mc = SLIM_USR_MC_CHAN_CTRL;
>> +	txn.rl = txn.msg->num_bytes + SLIM_MSG_HDR_LEN;
>> +	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
>> +	if (ret) {
>> +		slim_free_txn_tid(ctrl, &txn);
>> +		dev_err(&sdev->dev, "TX timed out: MC: 0x%x, mt: 0x%x, laddr: 0x%x, ret: %d\n",
>> +			txn.mc, txn.mt, sdev->laddr, ret);
>> +		return ret;
>> +	}
>> +
>> +	txn.mc = SLIM_USR_MC_RECONFIG_NOW;
>> +	txn.msg->num_bytes = 2;
>> +	wbuf[1] = sdev->laddr;
>> +	txn.rl = txn.msg->num_bytes + SLIM_MSG_HDR_LEN;
>> +
>> +	ret = slim_alloc_txn_tid(ctrl, &txn);
>> +	if (ret) {
>> +		dev_err(&sdev->dev, "Fail to allocate TID ret:%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	wbuf[0] = txn.tid;
>> +	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
>> +	if (ret) {
>> +		slim_free_txn_tid(ctrl, &txn);
>> +		dev_err(&sdev->dev, "TX timed out: MC: 0x%x, mt: 0x%x, laddr: 0x%x, ret: %d\n",
>> +			txn.mc, txn.mt, sdev->laddr, ret);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>  static int qcom_slim_ngd_get_laddr(struct slim_controller *ctrl,
>>  				   struct slim_eaddr *ea, u8 *laddr)
>>  {
>> @@ -1624,6 +1701,7 @@ static int qcom_slim_ngd_ctrl_probe(struct platform_device *pdev)
>>  	ctrl->ctrl.clkgear = SLIM_MAX_CLK_GEAR;
>>  	ctrl->ctrl.get_laddr = qcom_slim_ngd_get_laddr;
>>  	ctrl->ctrl.enable_stream = qcom_slim_ngd_enable_stream;
>> +	ctrl->ctrl.disable_stream = qcom_slim_ngd_disable_stream;
>>  	ctrl->ctrl.xfer_msg = qcom_slim_ngd_xfer_msg;
>>  	ctrl->ctrl.wakeup = NULL;
>>  	ctrl->state = QCOM_SLIM_NGD_CTRL_DOWN;
>> diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
>> index 00a7f112574b..c1137e8aedf4 100644
>> --- a/drivers/slimbus/slimbus.h
>> +++ b/drivers/slimbus/slimbus.h
>> @@ -1,6 +1,7 @@
>>  /* SPDX-License-Identifier: GPL-2.0 */
>>  /*
>>   * Copyright (c) 2011-2017, The Linux Foundation
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> same here, why?

Updated the copyright header to use a single multiline comment, including
the Qualcomm copyright attribution.

>>   */
>>  
>>  #ifndef _DRIVERS_SLIMBUS_H
>> @@ -316,6 +317,18 @@ enum slim_transport_protocol {
>>  	SLIM_PROTO_EXT_HALF_DUP,
>>  };
>>  
>> +/**
>> + * enum slim_ch_control: Channel control.
>> + * @SLIM_CH_ACTIVATE: Schedules channel or group of channels in the TDM frame.
>> + * @SLIM_CH_SUSPEND: Keeps the TDM schedule but halts data transfer.
>> + * @SLIM_CH_REMOVE: Drops the channel or group from the TDM frame.
>> + */
>> +enum slim_ch_control {
>> +	SLIM_CH_ACTIVATE,
>> +	SLIM_CH_SUSPEND,
>> +	SLIM_CH_REMOVE,
>> +};
>> +
>>  /**
>>   * struct slim_stream_runtime  - SLIMbus stream runtime instance
>>   *
>>
>> ---
>> base-commit: 415606a7be939835db9b0d6b711887586646346d
>> change-id: 20260803-slim-disable-stream-support-43599401607f
>>
>> Best regards,
>> --  
>> Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>
> 

