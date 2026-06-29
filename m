Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC801B86C7
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 04:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707638; cv=none; b=hcQgysvaldRBesTobHvCD7RlALrbKs5+D0H82nCPgd2fdURQ/yK7hdutMgx1bZ+0/LSuDC9+l0cifvJALvRzVSh4PAo4eE/2N2o3+3CHyUAiJuJJVrcrZjYb6T1DkJPT3D16n8BTyJRYqX2KnmRmKoqLUCVQk4g0UA8RqUf8L0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707638; c=relaxed/simple;
	bh=6U7kt3WRYUewAYtsxfxhxMoy//KQUd+ej5BF1+8M214=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcYf9I7dlwn9YEy7h+0/Dd68UOK7AG3jg27PNzy7y9U7UqV454I2KRIFCKectjhmz+IodVXsfAI/gaEofkupKLvS/Ulawv36W/zPFloJ9dnYfg3HVmFPKlFG0aJkVpVYuFtcX2YKENrgum76K9tDeLRtx96Bt1xmORxMf3+V16Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IZwSAWUs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKS9vfnC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IZwSAWUs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKS9vfnC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NH4M1737493
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 04:33:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CERH0yTwG1xBkHY67nIpH2ruyI72D2G8dS77s4oIjpc=; b=IZwSAWUs8j1ia4cr
	egfmpZKokmDKuRrMJlGQHu3oR//ZUg+xpS5rMo8W141ptPa9ytI3j5I0oQS2RtcK
	6q0kVz6NHe4WkqkWf2fBxLNGM3CilBRVbUeMd5qKMOOiqPfN3bls8YmiYwiJoz2K
	A07j/FZpkIgZiUdfEAPkqeImm+tVSsmUMeEUPFcurPm2fbwfpOfeEYUy3Gdml2D6
	JeqMm6h9eQllDuEHA355qn9dF+tJ/HRyctF9nLi4f8kcFSp07oUItkQjmz6hSN++
	edkWvJvoMG7LNCpGfdeCozC2ez61LptAffRZK6HWJ2v1Lgh+5+gHeQEvXwaf5mBC
	mU+nYg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f279cmbtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 04:33:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ba395b047so10578987eec.0
        for <linux-sound@vger.kernel.org>; Sun, 28 Jun 2026 21:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782707636; x=1783312436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CERH0yTwG1xBkHY67nIpH2ruyI72D2G8dS77s4oIjpc=;
        b=YKS9vfnCEs30uGmdSW8BgmDqYZnJgmjERhJuTtyIdR+NTsVmXst9VuoDJF/ZlGvjUT
         xC/xPdFCvwXSJ46C4WH1ovPQW5nnXFI5RubN2ofhjE0DzaDnL2yqBJAnCYTJCJP1vp6V
         erl90Eao8l/7atQEyePeHfvT/l0DVk4k9ze6fEpDAbIixzCJ8gVzWUmLqC2i+I4BAfSr
         VkFsEfX0aR8e7N4yCUF9OywFMsWYDYHjJmXa/xPRmkFUqj1lhfgVyeKw5uQm6ZVOlWHd
         c4L3s+ZX2vyR4tILtUnvsb0ChY71mes2IxS73Ltu/V+4OEdFhQFfuvcMIhkeWSadXZiA
         36+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707636; x=1783312436;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CERH0yTwG1xBkHY67nIpH2ruyI72D2G8dS77s4oIjpc=;
        b=iXDWUAuEg5g0xtKVS3QkdhyoTmSfGhtldJczK88BXNWnL62MjmbrycZSdYVdTRsU4o
         dSLUSnVNIULdEzLwCRWa+jbZuyZxmIyNqsSQYzDEvtCVJ5KtHTvi1YCGL8+fXlWcjGG+
         yggkOU2xg79UuWGXgo0auu/8V92yHQ3sxZDHbzDMt4zNkLAZr38Tt1gXx+Kg51OH69xb
         wii3yondEx3kCya9dp8djfoSoYGpHk0TKZ/kWvSrwxt4aBn02S27Nx9WEmFmEGXGkOOf
         PlgwxHCQXv6l5omVIR93cClhKijIwRAkjVryjlqw/9KDxEZJWq6OI/DX32YnixiKsyHy
         13/g==
X-Forwarded-Encrypted: i=1; AHgh+RpPSo+DgbhyqRg0dYibQTwf8UQosTBs6LD0vS1WDJCk4W3medXV8QtW4E5EaDnqThIpDKmrfUKxwFMaZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6qEZ87TcVM+jikZXaqASBTt4EprtbCnDNoNmzFXvRHvxbo6I9
	z9n7gFut89aDSke+zvKR6bCOIlMg2fq/v4Sc+8sJJ1T3odjzoswq8QJifvY2WjbE2lCoHyCfYjj
	MmrAmeDo+nb1h5++4IV+kJj9c78wGfmtIYoNAkVHCbWoFDzKAiZEcPvB/zRud7pNuhw==
X-Gm-Gg: AfdE7cnQ6f4Rah0upfo6olzdmmbgEKi3qT5Nm4P7LX9rypfGE8p4zZC2KCng8F7FdY5
	sfo0UJFcloHzVWvnvmQkzi/IKNhir5dZbD1VtXUUy29Luwky19ZblHe3MKn66zFTsFBhjKzY7mc
	SuviX0DdMzdris+ghN14qCptdcI166GXsFioxKXO0Itc7Reb/WTtOwKOLiooCFaIiU3TUheTRiS
	XgS7Cs85BhUEWz/ODzOLJpFKg69qJz4GWSU4VXbVxRfDT8o2ydLOBVlsnDa6eG6rX/ny2UHUbGh
	GnyU5INakrdF8u92Ny8Ij0rDgrTJzlceuspMrMCWZ+y29vEsx1R+MO2PylOwHJa5gs8hsPX5ShY
	Gfk5bjovzTHcJxea7TZb6rbmqpoaPb4UgKQrIHce3aIUR6gYY5Q==
X-Received: by 2002:a05:7301:6502:b0:30c:a9a:ee57 with SMTP id 5a478bee46e88-30c84c1c69emr14867689eec.15.1782707635765;
        Sun, 28 Jun 2026 21:33:55 -0700 (PDT)
X-Received: by 2002:a05:7301:6502:b0:30c:a9a:ee57 with SMTP id 5a478bee46e88-30c84c1c69emr14867666eec.15.1782707635157;
        Sun, 28 Jun 2026 21:33:55 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139eac62642sm22311683c88.10.2026.06.28.21.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 21:33:54 -0700 (PDT)
Message-ID: <d13f04d5-27e1-4ed6-acf0-eda9496535ec@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:03:49 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] soundwire: qcom: add EE-aware register layout and
 cpu selection
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260608175345.3118060-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608175345.3118060-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <314beaa0-3dc4-4cba-a37f-c358532e90dd@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <314beaa0-3dc4-4cba-a37f-c358532e90dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=evzvCIpX c=1 sm=1 tr=0 ts=6a41f5b4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=URT9HZ16PL6rH1bhHOQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNiBTYWx0ZWRfX0dt1pQZHZ8es
 V1edRXnDsu1w9+VmeuDG/A1vvZ5w525+gxg+VMkWxGGPG80udRtfE6QaevPqRb6WJm5sj3EPuom
 YPVX5WUx88i106OP6lx5vHqWzV0+z+g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNiBTYWx0ZWRfX9WOX7ZvedTya
 Y0OIODS5bxCeQbN+lvMUfpJSJ/ZunS5UbjHYEJiih4V0vG6KGvDUFhFdo4+Xuk0fk6oaU+LEE6u
 GMGOzWCFKUUCS3/byxQTLSIgocL5Rg80qWu2zedGN+kHKng4n5mKHqQh1TQvPLdaJJrFw3pYI20
 9KV3J6ybG6jj5vZaTw0IbJn2ThyZdr5GvVjDuKN9a5/7mon+0SCnRHdWSaGw4q0amn5GKfmc4zW
 EgDQsFJwl1P1yG81Sb4Fa4VOOFFOarXTJl5qWULtBCjKF4HQeWNeC+pvoQSXsSYGSDKaO8g2d2y
 OuJ/7pub+Mq3fQWdO8eZaRLr04o9Agxtjt232xp37ioSPO+2HWFUHrWkS310C31OwuNKKsBM2xt
 OpgnqzlDm37AP99HpTnXdcxop3MoWdFeDhG9yjmr6hB9KCnMLJZiyA/hBIVMVhqHKdPtWSyGfMs
 Qn4Vrq/uFxdKsgTsQLA==
X-Proofpoint-GUID: 4vZQWY-GxkSyJVYoAi9N5ViYiuBzICYf
X-Proofpoint-ORIG-GUID: 4vZQWY-GxkSyJVYoAi9N5ViYiuBzICYf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290036



On 6/9/2026 2:23 PM, Srinivas Kandagatla wrote:
> 
> 
> On 6/8/26 6:53 PM, Mohammad Rafi Shaik wrote:
>> Some Qualcomm SoundWire masters expose interrupt, FIFO and status
>> registers in EE-specific register windows on v2.0 and newer hardware.
>>
>> Add support for selecting the SoundWire execution environment from DT
>> and use it to program the correct register window for the active EE.
> 
> So this is integration details, which can be derived dynamically based
> on version or compatible.
> 
Yes, agreed.

This can be configured dynamically based on the compatible string.

I will try to add SoC-specific compatible entries and configure the EE 
accordingly.

> 
>> The driver now reads the EE value from the new
>> qcom,swr-master-ee-val property, with qcom,ee as a fallback for
>> backward compatibility.
> 
>>
>> For v2.0+ hardware, the IRQ/FIFO/status register layout is adjusted by
> Which exact version, do we have minor or step values for this?
> 
>> the EE window stride so the driver programs the correct bank for the
>> selected EE. The interrupt enable path is also updated to always use
>> the selected EE window.
>>
>> This change allows SoundWire interrupt routing and register accesses to
>> work correctly on platforms where the master is not mapped to the
>> default EE1 window.
>>
>> In Shikra, the soundwire execution environment is set to 0 unlike other
>> Qualcomm boards.
>>
> 
> Can we get this integration details dynamically.
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   drivers/soundwire/qcom.c | 78 +++++++++++++++++++++++++++++++++-------
>>   1 file changed, 65 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 3d8f5a81e..f4b8ff77b 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -26,6 +26,7 @@
>>   #define SWRM_COMP_STATUS					0x014
>>   #define SWRM_LINK_MANAGER_EE					0x018
>>   #define SWRM_EE_CPU						1
>> +#define SWRM_MAX_EE						1
> 
> Can we not make the EE_CPU dynamic and everything should fall in place?
> isn't?
> 

yes right, I will implement dynamic configuration based on the 
compatible string.

> Is the register layout changed?
> 

Layout is same logically, but access differs per EE via stride-based 
windows.

>>   #define SWRM_FRM_GEN_ENABLED					BIT(0)
>>   #define SWRM_VERSION_1_3_0					0x01030000
>>   #define SWRM_VERSION_1_5_1					0x01050001
>> @@ -118,6 +119,7 @@
>>   #define SWRM_V2_0_CLK_CTRL					0x5060
>>   #define SWRM_V2_0_CLK_CTRL_CLK_START				BIT(0)
>>   #define SWRM_V2_0_LINK_STATUS					0x5064
>> +#define SWRM_V2_REG_EE_STRIDE					0x1000
>>   
>>   #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
>>   #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
>> @@ -202,6 +204,7 @@ struct qcom_swrm_ctrl {
>>   	struct mutex port_lock;
>>   	struct clk *hclk;
>>   	int irq;
>> +	u32 ee;
>>   	unsigned int version;
>>   	int wake_irq;
>>   	int num_din_ports;
>> @@ -222,6 +225,7 @@ struct qcom_swrm_ctrl {
>>   	u32 slave_status;
>>   	u32 wr_fifo_depth;
>>   	bool clock_stop_not_supported;
>> +	unsigned int reg_layout_local[SWRM_OFFSET_DP_SAMPLECTRL2_BANK + 1];
>>   };
>>   
>>   struct qcom_swrm_data {
>> @@ -328,6 +332,36 @@ static const struct qcom_swrm_data swrm_v3_0_data = {
>>   };
>>   #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
>>   
>> +static void qcom_swrm_set_ee_register_layout(struct qcom_swrm_ctrl *ctrl,
>> +					     const struct qcom_swrm_data *data)
>> +{
>> +	int ee_offset;
>> +
>> +	memcpy(ctrl->reg_layout_local, data->reg_layout,
>> +	       sizeof(ctrl->reg_layout_local));
>> +	ctrl->reg_layout = ctrl->reg_layout_local;
>> +
>> +	if (ctrl->version < SWRM_VERSION_2_0_0)
>> +		return;
>> +
>> +	/*
>> +	 * Current register constants map EE1. For EE0, use the EE register
>> +	 * window stride to access status/IRQ/FIFO registers.
>> +	 */
>> +	ee_offset = ((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE;
>> +	if (!ee_offset)
>> +		return;
>> +
>> +	ctrl->reg_layout_local[SWRM_REG_FRAME_GEN_ENABLED] += ee_offset;
>> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_STATUS] += ee_offset;
>> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CLEAR] += ee_offset;
>> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CPU_EN] += ee_offset;
>> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_WR_CMD] += ee_offset;
>> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_CMD] += ee_offset;
>> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_STATUS] += ee_offset;
>> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] += ee_offset;
> 
> Why not make these registers take the ee value rather then doing this way?
> 

Will review and address in the next revision.

Thanks,
Rafi.

> 
>> +}
>> +
>>   static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
>>   				  u32 *val)
>>   {
>> @@ -904,12 +938,13 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>>   	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
>>   
>>   	if (ctrl->version == SWRM_VERSION_1_7_0) {
>> -		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
>> +		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>>   		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
>> -				SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
>> +				SWRM_MCP_BUS_CLK_START << ctrl->ee);
>>   	} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
>> -		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
>> -		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
>> +		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>> +		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
>> +				((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE,
>>   				SWRM_V2_0_CLK_CTRL_CLK_START);
>>   	} else {
>>   		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
>> @@ -935,11 +970,9 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>>   	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
>>   			0xFFFFFFFF);
>>   
>> -	/* enable CPU IRQs */
>> -	if (ctrl->mmio) {
>> -		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
>> -				SWRM_INTERRUPT_STATUS_RMSK);
>> -	}
>> +	/* enable CPU IRQs for the selected EE window */
>> +	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
>> +			SWRM_INTERRUPT_STATUS_RMSK);
>>   
>>   	/* Set IRQ to PULSE */
>>   	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
>> @@ -1545,7 +1578,22 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   		return -ENOMEM;
>>   
>>   	data = of_device_get_match_data(dev);
>> +	ctrl->ee = SWRM_EE_CPU;
>> +	ret = of_property_read_u32(dev->of_node, "qcom,swr-master-ee-val", &ctrl->ee);
>> +	if (ret)
>> +		ret = of_property_read_u32(dev->of_node, "qcom,ee", &ctrl->ee);
>> +	if (ret)
>> +		ctrl->ee = SWRM_EE_CPU;
>> +	if (ctrl->ee > SWRM_MAX_EE) {
>> +		dev_warn(dev, "invalid SoundWire EE %u, using EE%u\n",
>> +			 ctrl->ee, SWRM_EE_CPU);
>> +		ctrl->ee = SWRM_EE_CPU;
>> +	}
>>   	ctrl->max_reg = data->max_reg;
>> +	/*
>> +	 * Defer EE register window selection until HW version is known.
>> +	 * For v2.0+ the IRQ/FIFO window is EE-banked.
>> +	 */
>>   	ctrl->reg_layout = data->reg_layout;
>>   	ctrl->rows_index = sdw_find_row_index(data->default_rows);
>>   	ctrl->cols_index = sdw_find_col_index(data->default_cols);
>> @@ -1623,6 +1671,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>>   	prop->default_row = data->default_rows;
>>   
>>   	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
>> +	qcom_swrm_set_ee_register_layout(ctrl, data);
>>   
>>   	ret = devm_request_threaded_irq(dev, ctrl->irq, NULL,
>>   					qcom_swrm_irq_handler,
>> @@ -1733,16 +1782,19 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>>   		reset_control_reset(ctrl->audio_cgcr);
>>   
>>   		if (ctrl->version == SWRM_VERSION_1_7_0) {
>> -			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
>> +			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>>   			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
>> -					SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
>> +					SWRM_MCP_BUS_CLK_START << ctrl->ee);
>>   		} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
>> -			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
>> -			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
>> +			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>> +			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
>> +					((int)ctrl->ee - SWRM_EE_CPU) *
>> +					SWRM_V2_REG_EE_STRIDE,
>>   					SWRM_V2_0_CLK_CTRL_CLK_START);
>>   		} else {
>>   			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
>>   		}
>> +
>>   		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
>>   			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
>>   
> 

