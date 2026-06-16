Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE5D2F12AE
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781642819; cv=none; b=hdDwQ3mx2RNnwp+F0sNtfkNVUn5dUTdVy1W2PcyS627df0eN1nMFllskXZSEEkWlmA614dC7hisWGyG3fDpIv0u69CB0KtKzodTt7361GzESK07vcEh/AZOkOJYF6LODc5sZXlXZyzl7Ncy7ACQZoNdGR5a24JDvKOMn+Jc5gus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781642819; c=relaxed/simple;
	bh=BkabaxZRxJgxf1snaLA8gpHc5/y0hsVZLbOOE9WHF50=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tx+n5cXqI+p3AG1yquzyQlqTXCvkWF5WwYYpZCken+iKfgVjU+iZiSioREbes8dFgNu1UB3vRN84DiV8DXMHLgZKfmxdRlN29/k0ctK38J/n9KHoYxENchG70IQ2CYbSCMip3waqVdLI50o3PaGCOX+XFDUw380BEkCs2sFQWAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRs+nOeI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eUKCGkmY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRs+nOeI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eUKCGkmY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIONBa1376156
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S79+1kCVYd7/FiCBbAZw5DiiDHHoFuJkYe5IV8Q1vWc=; b=GRs+nOeITzRjG1VI
	DlBeHD40bhg5+f4hUp4Y/Z5mMrQRRdEp9x6HIzS25LKpaUlBEmO5/4IWJsjgvDL6
	UXzF+SGjJU2TXRvuwfj7y51E8oldEelRn/3kE4Jln9lsdY+zInH397g7f9hPr8hV
	ay/iu6Q3bFoQEGTddchRbiOP94oMySDs+63+MBOl4c7JYU5Im+3Sd2vvC/Blo+FD
	/kmUlKlPeFOZvYaz5M3XisOyL1TBlBZQSi7hoF950LezuOwSUPBLl0zecbU78s69
	Ox9mnBx09Cc4sSJwOiLVez+YztXb8IDEEldXCU2TOePovHnriqnPu/rddcEkCQpp
	bbu/Eg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xsbge2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 20:46:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915757be497so719355585a.2
        for <linux-sound@vger.kernel.org>; Tue, 16 Jun 2026 13:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781642816; x=1782247616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S79+1kCVYd7/FiCBbAZw5DiiDHHoFuJkYe5IV8Q1vWc=;
        b=eUKCGkmYSMP9R+/tV3P/WZmHpo4NkuGm943VfIYGquJd39+fkKtZQSj6k8+snJ+hZ9
         p45rFWjB5zdY3RkTGpaQIK98ojrQzRFcAyar1Lu2wNROfKlDhNEjj6I6BTjOLQ8M5+Ny
         swWeq6AT2+D08bONtwQvvjRUBLofA11fj8XdjHcyqgg7b7RESfqxcIp9MHAzCKFpQrei
         Tw8zADpCeHiZ+VEldIwR84YCA+5NBm47hYxu3hgymDFJxqce+FZ8Ygywe29u6BNIRiDN
         fNOY9R2HwuzXP7f6b7LIFnbl3KelVKPClA5tZXWN5dVk7jrD0KgqlWhXIU4kDxi7A2xc
         Rhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781642816; x=1782247616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S79+1kCVYd7/FiCBbAZw5DiiDHHoFuJkYe5IV8Q1vWc=;
        b=ErBZQaTpifcZzA5ZKi6gmq0wsROj62NQkD/Lt4IfdblLQnL484Yyh1TVHoG3DInVvk
         /BUblwOiidivrkBsZkhhtIYKXHOFylUDRLgE2S0LcNORoXq13oWBiAVeBKRc56Pb52Gd
         IYx6WCXdoAsjjylBEI/9wcJyZv/uHHXHqVmc/7QvQ/dBeRoZVy4jfkAR6hHYgqF8nSyh
         Lxg5NmDMg++oDAbo4CHIZhzfp+2tEKnroqSNe1rpKGAxEEpCO81zDa9+VWMpjxkPYCif
         km3hQTAY7vEPOiKsw5gJFjTHWjK0bIJxo1MVzATKxEBQ38LGk1G3znLPTNTrdMbVHKft
         u3ew==
X-Forwarded-Encrypted: i=1; AFNElJ8Nkd3MARrP13ElaaTlU6+t5CKqDxaKcGHyeaEWB+e32NnPF6xeq5pewVRs/7zPixBfJ4XyUkvC6p2j7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcXTGRnwa0CTc4lRExN8Qp+U8ST6oVQITvnslVKsrld/k3WYpS
	sy41DsFHCnF3/4yID/UkTxU7VwNeC/2pE4E5jtUQrKTa7jHz57e+0YpaVDeziQaWYb3p0yaUsBw
	VkjEppPLpIAQ21WDygjSC5roL405x+Vt4dQMN27BIA8n0pQ1e2ZwT+eSvG4BOPCP5bQ==
X-Gm-Gg: Acq92OGJ+3ZvmHWTFkg3SU+ok0Xg0m/u/Oyk8mHiDFhjIlk/nA2GS+7wL79Om3DqiXl
	jrNPBMD+mmQ6rsYrqJHTmnqtlUp0oY8I+n1g8C7a3eYOL6Z5y3aG1ycRBKH/nZpTST/iU6VwRrA
	1TKpjSlFeMIV9p2sdnwae1SxFiWV5D1MqakWDXg9d3nhRhYIqe5eDZr1pR+F0X5Iib/NRYNpLna
	t7ouuLikNj+JDMYB16va3xswMEKdGgWG3G/31gM80ErD1PbttCL208o5/mzyjlDOLETiMRp8OQ2
	RvEPZV1f5U8sXa7YzrxwZtKXPbQYNFWu/l47MduYcKRi9dj6zpNE3ey39p7pMiG0cneLW4nJs6U
	l4FzlaAdfbie0SwD3yG+aQPSeyUJNR90JguIvDSgonZeoc98O
X-Received: by 2002:a05:620a:4503:b0:915:9c4b:fdb4 with SMTP id af79cd13be357-91db9e7c9d3mr107382785a.22.1781642816369;
        Tue, 16 Jun 2026 13:46:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4503:b0:915:9c4b:fdb4 with SMTP id af79cd13be357-91db9e7c9d3mr107377385a.22.1781642815817;
        Tue, 16 Jun 2026 13:46:55 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f26f3basm45057320f8f.12.2026.06.16.13.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 13:46:55 -0700 (PDT)
Message-ID: <5b2ccc0c-293a-47dd-8be0-bb2342568880@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 21:46:54 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: apr: Drop unused apr_device_id
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Sohil Mehta <sohil.mehta@intel.com>, Raag Jadav <raag.jadav@intel.com>,
        Heiner Kallweit <hkallweit1@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <dee008af1510ee2a71087f3798814dd516730413.1781517268.git.ukleinek@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0SFvisyjG9OACpi2gHR-YUHBeXJS-gc0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIxMCBTYWx0ZWRfXzNMShByp4LRj
 ztuR8RUSOXkVIG3GbgYThTI+Nx6CHCW1C603hLeDUQe0tiu0AD5kbmxlsq3FIxZfzm1PmqroZYw
 vZ6MV1uTSdLcgwH02Jfl6pSIfQDioQgGEMJUP/T0DQVGOv4SqfXwd2xedkRoRMKX0wveIhjQkbB
 iiGID41MStDvEl8AIhZKGqZeZNQ17XJuMktt3bOMdkQ4/xj/Ys0JRA+GHOfFifbb8ZuYJMUGV5I
 WMXAlRxiHNHzUdpIwr7NRHz9/nMiSzd+g4h3s+OaHAQG8ga2KXdm1l/z8Pllzb93t4K+CY9IEnh
 vdD9KLsNgiV8KPxt4OP1LNLE5Dr8N5jf/RGDZQ8Etqsj2S3l19kbq2rX35nljXx7EG0goKvQPpR
 OhKjNgfbZ6Gy+uUpCyV+lLvNPzs4FVb1ZJghLifB13EjeXYoDzEfwta7/1BIOj8dhHAhNbhluDX
 S7Y2Yx7r0l8HT9sae1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIxMCBTYWx0ZWRfX2CoewiQe3rcH
 lRiQ7ZwlvP8w5EHFHWX7qqQAj0lmeWsetv4KPJBHedX1Ry+AyS38TBKEUZ5J+el59/vK8vjnHqF
 KpLnDddCVOP5jNoZkMK0AzVWua6IboA=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a31b641 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=LHjQ_0QYFXRRo-03oDcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: 0SFvisyjG9OACpi2gHR-YUHBeXJS-gc0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160210



On 6/15/26 11:04 AM, Uwe Kleine-König (The Capable Hub) wrote:
> apr_device_id was introduced in commit 6adba21eb434 ("soc: qcom: Add APR
> bus driver") in 2018, and since then not a single driver made use of it.
> 
> So drop the unused id_table pointer from struct apr_driver and move
> APR_NAME_SIZE to the apr header which still has a usage of it.
> 
> Note that with the id_table being NULL apr_device_match() degrades to just
> of_driver_match_device(), so replace this callback accordingly.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---

Thanks for the cleanup.


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


>  drivers/soc/qcom/apr.c          | 25 +------------------------
>  include/linux/mod_devicetable.h | 11 -----------
>  include/linux/soc/qcom/apr.h    |  4 ++--
>  3 files changed, 3 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> index ea7f83916d8d..2073edb416a4 100644
> --- a/drivers/soc/qcom/apr.c
> +++ b/drivers/soc/qcom/apr.c
> @@ -338,29 +338,6 @@ static void apr_rxwq(struct work_struct *work)
>  	}
>  }
>  
> -static int apr_device_match(struct device *dev, const struct device_driver *drv)
> -{
> -	struct apr_device *adev = to_apr_device(dev);
> -	const struct apr_driver *adrv = to_apr_driver(drv);
> -	const struct apr_device_id *id = adrv->id_table;
> -
> -	/* Attempt an OF style match first */
> -	if (of_driver_match_device(dev, drv))
> -		return 1;
> -
> -	if (!id)
> -		return 0;
> -
> -	while (id->domain_id != 0 || id->svc_id != 0) {
> -		if (id->domain_id == adev->domain_id &&
> -		    id->svc_id == adev->svc.id)
> -			return 1;
> -		id++;
> -	}
> -
> -	return 0;
> -}
> -
>  static int apr_device_probe(struct device *dev)
>  {
>  	struct apr_device *adev = to_apr_device(dev);
> @@ -401,7 +378,7 @@ static int apr_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  
>  const struct bus_type aprbus = {
>  	.name		= "aprbus",
> -	.match		= apr_device_match,
> +	.match		= of_driver_match_device,
>  	.probe		= apr_device_probe,
>  	.uevent		= apr_uevent,
>  	.remove		= apr_device_remove,
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 7f44057aa65e..d74ff3ee1424 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -547,17 +547,6 @@ struct slim_device_id {
>  	kernel_ulong_t driver_data;
>  };
>  
> -#define APR_NAME_SIZE	32
> -#define APR_MODULE_PREFIX "apr:"
> -
> -struct apr_device_id {
> -	char name[APR_NAME_SIZE];
> -	__u32 domain_id;
> -	__u32 svc_id;
> -	__u32 svc_version;
> -	kernel_ulong_t driver_data;	/* Data private to the driver */
> -};
> -
>  #define SPMI_NAME_SIZE	32
>  #define SPMI_MODULE_PREFIX "spmi:"
>  
> diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
> index 58fa1df96347..2e4231092088 100644
> --- a/include/linux/soc/qcom/apr.h
> +++ b/include/linux/soc/qcom/apr.h
> @@ -5,7 +5,6 @@
>  
>  #include <linux/spinlock.h>
>  #include <linux/device.h>
> -#include <linux/mod_devicetable.h>
>  #include <dt-bindings/soc/qcom,apr.h>
>  #include <dt-bindings/soc/qcom,gpr.h>
>  
> @@ -135,6 +134,8 @@ struct pkt_router_svc {
>  
>  typedef struct pkt_router_svc gpr_port_t;
>  
> +#define APR_NAME_SIZE   32
> +
>  struct apr_device {
>  	struct device	dev;
>  	uint16_t	svc_id;
> @@ -158,7 +159,6 @@ struct apr_driver {
>  			    const struct apr_resp_pkt *d);
>  	gpr_port_cb gpr_callback;
>  	struct device_driver		driver;
> -	const struct apr_device_id	*id_table;
>  };
>  
>  typedef struct apr_driver gpr_driver_t;
> 
> base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b

