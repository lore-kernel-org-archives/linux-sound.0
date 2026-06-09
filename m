Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345EB2D7DC6
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 08:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995212; cv=none; b=TxEvMKo6Ti5WGWVqiXXzp90McQ1yozDAznVBG6Znx0T38AxBgqXQNTrG/mBnV6nB3v2EuFEF5gQeKDLRW6vKHDPMCGo4lAtoHIYGKNMqoudo2YtsyWckD6tyv83sWDbq7nQIqMMTzGv5jJEB0NXOLFVkoNzFFOVtqWr6DTmcApw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995212; c=relaxed/simple;
	bh=/FSMGn29BC7ORLv22Sa7o74cNNiRrr9HIkI5/qYctTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fga58AfhwNX7G7oQH8YuOUepI7aEYZlWH49bJHkyZi+k3H8Udf5xTw4v8LM9r9EQeVapNR264TjBSoEYhOigdHtznay1fpujYfunnyzpwo7UPWTWAUK83LUkoShgdRZVFSc0uE8cHMKB46pmsXw+93bMDWgQJVpG3JkxKvCI7hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIyAsMac; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OFLrqi5u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIyAsMac";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OFLrqi5u"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rdOx1958610
	for <linux-sound@vger.kernel.org>; Tue, 9 Jun 2026 08:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qxjGI4Ozh3EujmkmvmGGntYY6me51VER/HBizqF9uJk=; b=LIyAsMacW+rW/x2u
	estfjDemu1BZ42GBzSHJdqmU21fmxHPLGKjRC4SlLF7oQKWXf/yVujEvfu1jowFV
	cPdwzyXeSH7Kk9vJu82dszmJqiYdqCsIdJqau327Gw0YKbkCCcZS/OXOF4GEkvCB
	bYpOT3INz80BBdrBUPdM/HczOIv8K8CoPUVHf4XAIWvNUmSzkc6jrKnZKc6PBRUi
	y9+rIezfbIcJOQ6F5tLo2VEaseDgSRR1QQTnFmkxLTigtcRF7MUDEzPBWJzHHpfN
	5xHwoeGx3kbdeLFGfv2XpEFgMkGT+RkcZGizDszN3NReATOyOR00qrDtwXdByHJt
	jQr0Bg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds8n0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 08:53:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ced43ac48fso49087946d6.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 01:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780995209; x=1781600009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qxjGI4Ozh3EujmkmvmGGntYY6me51VER/HBizqF9uJk=;
        b=OFLrqi5ur8HypNk3cWBf0Y4CjKJmmCt3XmtPscmM8UPQnF2KNPRkFoolZuiKQSZEEb
         O2P6Lx45acp3QvJT3PSgPut8LqV7xcqSMdH4I1lSS8y7kXiVMotCFODoy5+0kYT0wZOa
         NDxh1QV1Bif7ZnQYdzzuZNi0u3mFJ0Dtj2KdKQD0n66yl0xupyJKixidGly0vGXQUe3u
         VA1ewxc0s4q2LMRe3DZhfeOlHaSnVG8BmnXxUQ2HevFfOiuzLbRvI3G7aQHD4c0vfoNB
         C17/roqkuwsZUo2lPsT35HkoLeTgOITf6mtwye8Pq4ooljogLoIySHPsmhVNYvaeUjl8
         J7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995209; x=1781600009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxjGI4Ozh3EujmkmvmGGntYY6me51VER/HBizqF9uJk=;
        b=ZRm38N6ZQ1eMusBtCEFjxZYBD4Xr7xdpFTBw400ckOj+p2lQjPjHe+tSI8wAHEC/MO
         XKUitHnmQshp1S5ygnf0gDZiS2MfGS5396fUuQtrHeb1h8/+eZwcl0C1SrXlOEvHZyb6
         5VfrFS90p1/rNCOKCTA0oLYKUNQL7klK1h9+EvC7RE2bP7+klJ8zFEBtqYHmZ/pKAb+H
         GtLXR8ggluaVZovXO4+BYHr7dKs43T/gJwEXIKe8Z1I9ggehk1FvJmDRv+ai1f6XqODg
         pFaq+hjw0Pz5Zzl5GdrYjFk7xZ/9hdEchJJmlcRbA5u0kgaYC0F/5t+zZzkNEicUynQL
         rp6g==
X-Forwarded-Encrypted: i=1; AFNElJ9WOdckSRAGteVT5VSKzkz/yeikjT2DNyolxoZo2NJcABzj5XqbR4yhFFiy3PfIL+/MPxiLSFvIh3Dv+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj60GdWdAgsLMZfCNYeA/+VvM6MfUAhyyBMzLGxTQLMxPuQk9L
	GCUW3aZ5HkHyGJMAYOlX2b2Xfr+4vuoZ1NG+POOmZw9P+cf8J/8e1XlQBu2EYQ4x90HqwOE+jsr
	MUsTlDj2zkazj+Sxz+WOeDLnb/Kxw4OV1UIxpgcgJZwnqDCtQ7T62lYnm0i5QzB5U7g==
X-Gm-Gg: Acq92OGa+zFYWJIMWoMpBVknXIQppn9ecl2hemDqeqe6+IxK1HyEAIr+w6t5k0cVIiB
	BsfluAzn872sPcSeLRzTAq2eNvqJxlPMEeHHZZ8vZl22//QDbHfjbgv7qkS2XUYBhbtHCy8Ei9B
	83rlwE9rWi3mcQ91lmBt6xa0E3raMoJKDroKcXbatkhWtRBlU1BGB6vxKMo2vpb8iIQWWlBsdbz
	kP5Ez+Hj0fVGMcIyZdaAU9d1r6+KT3I5Xy/G525s85xVVue4FmfxAndTBvuiD0Nw3dc79lNENN/
	GlVjJF/KgQD16y40ejS7qcqlxA3d3eTHkHc7VWLiBz9i/ZDHnRuvSXKToOxSK1B4sx58XJdyPgw
	qxxSZSVsn7Dq4lGkvlwoGsIWAOX1p76o5bFi17R/gV8QLkqrTLBOyMuLTYYY=
X-Received: by 2002:a05:622a:2489:b0:50d:66b6:1564 with SMTP id d75a77b69052e-51795b8650fmr177165281cf.14.1780995209403;
        Tue, 09 Jun 2026 01:53:29 -0700 (PDT)
X-Received: by 2002:a05:622a:2489:b0:50d:66b6:1564 with SMTP id d75a77b69052e-51795b8650fmr177164921cf.14.1780995208906;
        Tue, 09 Jun 2026 01:53:28 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6912365bd3fsm4736019a12.5.2026.06.09.01.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:53:27 -0700 (PDT)
Message-ID: <314beaa0-3dc4-4cba-a37f-c358532e90dd@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 09:53:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] soundwire: qcom: add EE-aware register layout and
 cpu selection
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
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
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260608175345.3118060-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VetjQvF_Zu3xNR_wikuGRBhiSTrlEJqR
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27d48a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nzkHmdKqgOy-9w5VjhwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: VetjQvF_Zu3xNR_wikuGRBhiSTrlEJqR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4MiBTYWx0ZWRfX9bp2oJ5SwZP6
 DrJGtmo5jGgr7TnmNpdBYu+0Zx2fa1V25aefQmk/mHbKilSvCnIY5Q7pU0BfCwGWgryAFUv0t8t
 ywJI41VmdMBrzqQ8e0fVvHuPfQHGhJ5rCEsjnAC/VZqaPWuqtjQDyUwlLYEXigO5PU63WhElliy
 0R8Mz35NgJ8SNaLLc7mU6aeQi1eYvcpJli+hPdXxm5AWq7w5KNiIilThxmV3i2Lom9DrauDGNWj
 gUtDmXLiZ7rBg3NIMRfO+RIwaTxjsejrkoPKzSdRdBlrPzLCsAiVtNVhwpBNvnKjSPgKBr5TRla
 inKW33hscLnPuX1AJ1XiN71BidLixmgd551N1prpaLB6cvHTaF2i8Eb1/P5qBVnt2ghMAnoelsa
 HrnV/2TgCtaVix0TeODIN4H8NuIRpAaiagCUdxsSL9AOJo36zQEMECVLh12Wg5WQEKFGkqUMZyD
 bh3uDyM3IaF0C+tdH/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090082



On 6/8/26 6:53 PM, Mohammad Rafi Shaik wrote:
> Some Qualcomm SoundWire masters expose interrupt, FIFO and status
> registers in EE-specific register windows on v2.0 and newer hardware.
> 
> Add support for selecting the SoundWire execution environment from DT
> and use it to program the correct register window for the active EE.

So this is integration details, which can be derived dynamically based
on version or compatible.


> The driver now reads the EE value from the new
> qcom,swr-master-ee-val property, with qcom,ee as a fallback for
> backward compatibility.

> 
> For v2.0+ hardware, the IRQ/FIFO/status register layout is adjusted by
Which exact version, do we have minor or step values for this?

> the EE window stride so the driver programs the correct bank for the
> selected EE. The interrupt enable path is also updated to always use
> the selected EE window.
> 
> This change allows SoundWire interrupt routing and register accesses to
> work correctly on platforms where the master is not mapped to the
> default EE1 window.
> 
> In Shikra, the soundwire execution environment is set to 0 unlike other
> Qualcomm boards.
> 

Can we get this integration details dynamically.
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  drivers/soundwire/qcom.c | 78 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 65 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 3d8f5a81e..f4b8ff77b 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -26,6 +26,7 @@
>  #define SWRM_COMP_STATUS					0x014
>  #define SWRM_LINK_MANAGER_EE					0x018
>  #define SWRM_EE_CPU						1
> +#define SWRM_MAX_EE						1

Can we not make the EE_CPU dynamic and everything should fall in place?
isn't?

Is the register layout changed?

>  #define SWRM_FRM_GEN_ENABLED					BIT(0)
>  #define SWRM_VERSION_1_3_0					0x01030000
>  #define SWRM_VERSION_1_5_1					0x01050001
> @@ -118,6 +119,7 @@
>  #define SWRM_V2_0_CLK_CTRL					0x5060
>  #define SWRM_V2_0_CLK_CTRL_CLK_START				BIT(0)
>  #define SWRM_V2_0_LINK_STATUS					0x5064
> +#define SWRM_V2_REG_EE_STRIDE					0x1000
>  
>  #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
>  #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
> @@ -202,6 +204,7 @@ struct qcom_swrm_ctrl {
>  	struct mutex port_lock;
>  	struct clk *hclk;
>  	int irq;
> +	u32 ee;
>  	unsigned int version;
>  	int wake_irq;
>  	int num_din_ports;
> @@ -222,6 +225,7 @@ struct qcom_swrm_ctrl {
>  	u32 slave_status;
>  	u32 wr_fifo_depth;
>  	bool clock_stop_not_supported;
> +	unsigned int reg_layout_local[SWRM_OFFSET_DP_SAMPLECTRL2_BANK + 1];
>  };
>  
>  struct qcom_swrm_data {
> @@ -328,6 +332,36 @@ static const struct qcom_swrm_data swrm_v3_0_data = {
>  };
>  #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
>  
> +static void qcom_swrm_set_ee_register_layout(struct qcom_swrm_ctrl *ctrl,
> +					     const struct qcom_swrm_data *data)
> +{
> +	int ee_offset;
> +
> +	memcpy(ctrl->reg_layout_local, data->reg_layout,
> +	       sizeof(ctrl->reg_layout_local));
> +	ctrl->reg_layout = ctrl->reg_layout_local;
> +
> +	if (ctrl->version < SWRM_VERSION_2_0_0)
> +		return;
> +
> +	/*
> +	 * Current register constants map EE1. For EE0, use the EE register
> +	 * window stride to access status/IRQ/FIFO registers.
> +	 */
> +	ee_offset = ((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE;
> +	if (!ee_offset)
> +		return;
> +
> +	ctrl->reg_layout_local[SWRM_REG_FRAME_GEN_ENABLED] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_STATUS] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CLEAR] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_INTERRUPT_CPU_EN] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_WR_CMD] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_CMD] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_STATUS] += ee_offset;
> +	ctrl->reg_layout_local[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] += ee_offset;

Why not make these registers take the ee value rather then doing this way?


> +}
> +
>  static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
>  				  u32 *val)
>  {
> @@ -904,12 +938,13 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
>  
>  	if (ctrl->version == SWRM_VERSION_1_7_0) {
> -		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> +		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>  		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
> -				SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
> +				SWRM_MCP_BUS_CLK_START << ctrl->ee);
>  	} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
> -		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> -		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
> +		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
> +		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
> +				((int)ctrl->ee - SWRM_EE_CPU) * SWRM_V2_REG_EE_STRIDE,
>  				SWRM_V2_0_CLK_CTRL_CLK_START);
>  	} else {
>  		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
> @@ -935,11 +970,9 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
>  			0xFFFFFFFF);
>  
> -	/* enable CPU IRQs */
> -	if (ctrl->mmio) {
> -		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
> -				SWRM_INTERRUPT_STATUS_RMSK);
> -	}
> +	/* enable CPU IRQs for the selected EE window */
> +	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
> +			SWRM_INTERRUPT_STATUS_RMSK);
>  
>  	/* Set IRQ to PULSE */
>  	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
> @@ -1545,7 +1578,22 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	data = of_device_get_match_data(dev);
> +	ctrl->ee = SWRM_EE_CPU;
> +	ret = of_property_read_u32(dev->of_node, "qcom,swr-master-ee-val", &ctrl->ee);
> +	if (ret)
> +		ret = of_property_read_u32(dev->of_node, "qcom,ee", &ctrl->ee);
> +	if (ret)
> +		ctrl->ee = SWRM_EE_CPU;
> +	if (ctrl->ee > SWRM_MAX_EE) {
> +		dev_warn(dev, "invalid SoundWire EE %u, using EE%u\n",
> +			 ctrl->ee, SWRM_EE_CPU);
> +		ctrl->ee = SWRM_EE_CPU;
> +	}
>  	ctrl->max_reg = data->max_reg;
> +	/*
> +	 * Defer EE register window selection until HW version is known.
> +	 * For v2.0+ the IRQ/FIFO window is EE-banked.
> +	 */
>  	ctrl->reg_layout = data->reg_layout;
>  	ctrl->rows_index = sdw_find_row_index(data->default_rows);
>  	ctrl->cols_index = sdw_find_col_index(data->default_cols);
> @@ -1623,6 +1671,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	prop->default_row = data->default_rows;
>  
>  	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
> +	qcom_swrm_set_ee_register_layout(ctrl, data);
>  
>  	ret = devm_request_threaded_irq(dev, ctrl->irq, NULL,
>  					qcom_swrm_irq_handler,
> @@ -1733,16 +1782,19 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>  		reset_control_reset(ctrl->audio_cgcr);
>  
>  		if (ctrl->version == SWRM_VERSION_1_7_0) {
> -			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> +			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
>  			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
> -					SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
> +					SWRM_MCP_BUS_CLK_START << ctrl->ee);
>  		} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
> -			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> -			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
> +			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, ctrl->ee);
> +			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL +
> +					((int)ctrl->ee - SWRM_EE_CPU) *
> +					SWRM_V2_REG_EE_STRIDE,
>  					SWRM_V2_0_CLK_CTRL_CLK_START);
>  		} else {
>  			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
>  		}
> +
>  		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CLEAR],
>  			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
>  

