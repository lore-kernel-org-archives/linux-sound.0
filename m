Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFBE22A80D
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756807289; cv=none; b=V+Y195Tvpir2MuHKBLKimgUXsNuZiwgbhtrA9bEA1ewcrAH/OalhwYqIgwJGCghxprfdk/zKvod5HA/sJ+Mtoi0LCamQM5mco4f0HzB4hoV21DyvPUdMT6UllnjAKmHRbD2zOjWeSexYYPgqL8p1VpBynmJnyEAQYjT4Fw2ofUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756807289; c=relaxed/simple;
	bh=b6S9aXJNB9FiVBmBPI0rNYFgxKArdGV25PtMwNxpkC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GEzeIpBMMhSvL9GEIJDB6HsPJE8e6aM6qP2uvGELKo1Y9VnmRQqoriXrJ3vZHkidagScMSfOkCNW9lAZFIL7vrX6CqI/m/anqS6lDzDbNqkSlkwfLxfVot5rEbsiYZ3ybJ//8OHFoAOLy/Ae+LQcFd1XAkmvsN7+LE5dSrXaL70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hg6usMRP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hg6usMRP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822Rkq6020481
	for <linux-sound@vger.kernel.org>; Tue, 2 Sep 2025 10:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mnQNdYjKaImdUhh2EuI5V2L3ZbgZUQIXMGDK998UTcI=; b=hg6usMRPaHWKB0j2
	HP6v8tvSgV/t3chlAA9i/5ahJV4ZWkb3gpjRJ8PizQOE7mzt/l8AvFZHdYYzKVHs
	+JQ1GxBaFb9wB9+koCx+8rFUzObZq8WgdmMLzEV2+/IG1wbuCuwNm35AU3YAHgpA
	HTq/i+W9lwkPtNOLXFWfvwV/5YGPnTab2YtDy8kip+ZyoiUP3edCtUf8OdEYxfwP
	RwfT/nFZaoaROr0hdz4R1sxSZ/07I9QLPahXlfdhxhoJDvN+XBQzrxL4xvi80mk0
	7AOT8DHsEKq7QOPJKsF183WDH7fM3NqSmSzjsofX0AiDrGdec4eDzbXr98CafUhy
	cOBkBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8ryeu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 10:01:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109af71a5so20144071cf.1
        for <linux-sound@vger.kernel.org>; Tue, 02 Sep 2025 03:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807285; x=1757412085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnQNdYjKaImdUhh2EuI5V2L3ZbgZUQIXMGDK998UTcI=;
        b=DWCBD9dmQQMU5Z7O3WEB4Ti/8Yj+aYt8izZRm2zX0xJ25wl38ewHUG1vgyi8kLRubO
         YOspMfExF5r6IF1hv8pzJtl/05Dg7/JvqXFOobpYNNNJNiYOa9JwUCMvU6Nn+dvAubV8
         9LWDu9mfQqI4Jqlnx67DWBNm+zut17PFssuFltCp9ieVXLxS15yGlqviPnEcISEY9/kK
         Pm+i+EWx740AA0X4BCQC50XlwPEU28VsqCqq0IM1gQH5NV8OBRmdLP9wIJuF2C/WrXX9
         AihO4ITjvM9zSclvnwGUoRWNK1X/7khVp7Yh8J4Eg1CGTaiOMQ/eLofc5+3xpXNbCLJ7
         hQ8A==
X-Forwarded-Encrypted: i=1; AJvYcCXU7U/siDFEymS0oWgXMpTDykNzrdJMUcuWYbpYSTZF6kiiB5+L32Etcfcwipw6+bFMYbrny/VvU+uYIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0t9Fk4aOLC9d8VpDpuZcUaWX1gOpy9ru8snkPPROIpt7JykSl
	D7ANba8ypztxDyEbbSadZmFYa2UfxKDGfiJtxrYer97Z5kbWxZoWdzDADLKctfUb+hPnUNC0Bzf
	/+0wTJ2Ob8aqNx9t/j3M350RRekpa5BKPpP5jGRDmzeSgLYemuA9FNyI/hEVZw+pmEA==
X-Gm-Gg: ASbGnct/X7t+zYa381Q6xZDNCKLHsHD2V4vFBRGQroOKyiZDPukf3yo9CGTyKwWwo0P
	wqygc/xGRN6ozhcZgKbVcnKoYpd6od3QgZ4et96subELi8wBxwG/xgKT9cCTr11+VIAlQoEYfUo
	mKOXkC6+9FJGIgr1QDnJ5VyVVLGAOGTA3ZlAKZ40LyrPzhFNm6UNNhu7BFjt7URpL8S//awxm9M
	8mmF2uekyteB3Q8F08IpXZQwanogIZ6OPZ8lA8YCn+CX3CGm7A1xgNOMKAFf3YaH1uEoQb9KasP
	ksAYcLZcv/cRWguSx0hycIkf3fH9jM8NjWT4SFogIeYyLjefLpJEFsthbQKAvaEy2RVNNDTqKTN
	IdgyKF/lL6H1G9mvta0ILlA==
X-Received: by 2002:a05:622a:3c8:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b30e906341mr107308941cf.2.1756807284298;
        Tue, 02 Sep 2025 03:01:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqXLx8JVOaMKleJHkt/Tpo2I5yJcV/rljW8zQPxddy/yHMAylistjFE8GUMWq+nIvbZOF7NQ==
X-Received: by 2002:a05:622a:3c8:b0:4ab:6e68:1186 with SMTP id d75a77b69052e-4b30e906341mr107308451cf.2.1756807283676;
        Tue, 02 Sep 2025 03:01:23 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0432937d7esm398015266b.17.2025.09.02.03.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 03:01:23 -0700 (PDT)
Message-ID: <bd11cb82-d8ad-40bf-8bed-82f9e8710117@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 12:01:20 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] soundwire: qcom: remove unused rd_fifo_depth
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250901195037.47156-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250901195037.47156-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250901195037.47156-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX8Dk935+1zHH/
 0tY3MiDvhaNQ5Y0ysFrcsMN6ttqpelV3I74nnNBOLCdBsB9ypVYrCf9qgwbGFgb32x7nd8lTnN6
 /+JfGCBhGHU13kZ1Qw/C8PwGAkfhP3dJB+35te8JqTJGa3X5lXuPwGZWO1hA5iIzsEY+Msfuq4S
 P6YsqFyo0h8iu9VDTZxV6uVQdacmUzDV0sgM/BQAoPo09c2ugbej1a0J3AjB+B7YESVWzAN/3nS
 fQ7rIWPujW0LRJlSOGxnk/SIK9KUNRMj3iouIRI+KMlqPooBqh98lwkX9LTzi79+Xp+in7cRMQq
 VrYEFJqrft9xYwyOu5FP60ufj/DHriOEqAfjOzr3LWfEroI2nfdZrqNgqwW1mrJ41jLYpqsnWgD
 h+uB7a3a
X-Proofpoint-GUID: Jv02EJoA-mPeiC-f_6PFoOQRIvIeh2MR
X-Proofpoint-ORIG-GUID: Jv02EJoA-mPeiC-f_6PFoOQRIvIeh2MR
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6c076 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EBKaaXEv9MviPiDEuogA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On 9/1/25 9:50 PM, Srinivas Kandagatla wrote:
> remove read fifo depth field parsing logic, as rd_fifo_depth is never
> used in the driver, cleaning this up would benefit when adding new
> version support.

The last sentence is mildly confusing> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soundwire/qcom.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index bd2b293b44f2..7f19ebba6137 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -209,7 +209,6 @@ struct qcom_swrm_ctrl {
>  	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
>  	u32 slave_status;
>  	u32 wr_fifo_depth;
> -	u32 rd_fifo_depth;
>  	bool clock_stop_not_supported;
>  };
>  
> @@ -898,7 +897,7 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	swrm_wait_for_frame_gen_enabled(ctrl);
>  	ctrl->slave_status = 0;
>  	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
> -	ctrl->rd_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_RD_FIFO_DEPTH, val);
> +

But my grep confirms this remains unused

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
