Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C451FBC91
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471176; cv=none; b=R1AKd20vPDxyr/ijXnYxdlw5w3WKUSlZF0uAZtQ5tvJY4aNXW8BnpxASehQc4rKEygx3nRUvNfNPRbePIR/UWRNEUTPCl9RdUQpQYm8ubJGamebytBO2NKYLqCoioVGiQVlQsMsQDMIyp3CTxKsZbnPO65hgAVJKKU/i21N6xBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471176; c=relaxed/simple;
	bh=SkYNBp2tGs+KkKatm/7UabgqugkSjHvT8/wNzK4u0vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWRsNYhZB27U/lFYV8u9hKKrTkntn49Qbrym/7x+Llta4fQgyXONIgs2ESdc+Rs21bCFa5uVKntgE60k56ekmZyf315v5tLbaWmB+nK3MKSbsHEC2JiAYFS4UBu0xMAbt3dMC3x3bUiOjppH61WQChZ1YqjTuxiMcMAgVpCqhqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nx/UDdDg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nx/UDdDg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599LiFI019082
	for <linux-sound@vger.kernel.org>; Mon, 9 Jun 2025 12:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ozx1cNx6vaQiGhztUqHI8rPbCJVrrhmKdjb2oMY9jXM=; b=nx/UDdDgQ4IIJ//p
	ECPmR5ls+/cK7p0h5ysYtB8+Ah5eFY1k1VKyBkyOGn+cidcMPDMH3BB7lhedvKdI
	MA4+c7SBa5GRI/ct4Cz9/BT0FoYwFZozhKz3LbKs7uYc6TSiQh5HNhoUybwY7dP9
	BbMWHZ4ayW3vdaFw8BXUPkpKfCekGssxB+ntEhkvhQg3MsrrmzYNMKb7L2fA3Ra0
	q1Npl1g+pd/5OP5EgQjgTt0DKKwv5ocajGSh5bS0UVscLA3rKPLfPZwWzOUKE73Q
	LAFK6Rmf3MDH9EDQMiQ0MjpYhFSv3OouLKcp0IJhLY8ju04G7D2SPiUWhcc/GsFy
	cKX6ng==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpnnyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Jun 2025 12:12:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d2107d6b30so560934185a.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Jun 2025 05:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749471166; x=1750075966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ozx1cNx6vaQiGhztUqHI8rPbCJVrrhmKdjb2oMY9jXM=;
        b=GaYqnC9ewjEAoEKMxh6m2yWcnGF0RbhdQrjqk0z52PJdchltO0AQA4tMSzvkOvre5h
         LYuivnwYrHkztffkVMX6/mvEmjK5UIhVbFNwTmg4s9Nw+JJ7Aq+PD/jCqmXN8XpwhukU
         UUr9u3WurRyyvV1VKNUGKCCJOWCmka5TZoZCg46NWT7U6g2tgTI2Bk82bp49WyxtX+2/
         28Tb6rkfml8NzFAnFmahQKxR50Q3Kq8SRclnK1JOQntopH2cEMSUtAQ0DInKCwOuejpG
         wc1M78HnstrQTRHVt/qexZK8crU8NI/kEDkn12Tj/gBYjJSCWTaBCKsqgEDzpJ1W8ulT
         f6Eg==
X-Forwarded-Encrypted: i=1; AJvYcCU/KHW/OqecXwXJC3hHZTC0UOu8Gfe/XdHssASBg0FhxKICA2McpF3fU8C5SmrdlubDeDnrGgy5SxLC9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0HRGzQ9N2GBb1T/tyVIkINuyUR1b2pxFw9Wy2RWdPmsHIzeHF
	6M6D3TG4zuuV79MRz+tn0QCkT9Opo2DskVx4PU3Rp6B7dgm8LTw8gKGccxJd+Sw+Jgibl8vUuL6
	qEeM7cHHsltw8ajTRQsbVZ+H/NUWv1JspZNYD60Jtn+GV2gvnDFioLYhJOJ6XLkI5YQ==
X-Gm-Gg: ASbGnctiImE4QEW7V9awcx2l8qWNqwwP2tsd4wy41m4glk4B+UDeCcUwcEvw1ym3rZW
	Q8020Nvg7oVSsDno/dS8sh/wzqhS3nqnpdwEwwqKekJVa0+DDHv0F52Ds0m8KCJ7LRsCvzP6/zn
	cE4ylmQOqHuUw7y7wW9E93QlH+NfI4YO0W198PVOpxeTh3A0GuEjoDJSnAcOfR96033tcQARruB
	wql41fMhM1us0R7EipirXCHwxBQoKk+oF7AgEtzaQUtIgY0zADsOKPQQeoa7KZi73Ke/WPiyG5B
	RTgefm+hjU38+nnTQsvThvzChGKrfSTgJcTj8GJW+208SWlC
X-Received: by 2002:a05:620a:45a1:b0:7d3:914b:abe6 with SMTP id af79cd13be357-7d3914baf06mr669829985a.23.1749471166657;
        Mon, 09 Jun 2025 05:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWvU3u5w14J+qlrmR9XemVZPLaY5kePeOwYsaLUltPqBZJ+np6mmxSmQWTrNQY2VReY/jN3A==
X-Received: by 2002:a05:620a:45a1:b0:7d3:914b:abe6 with SMTP id af79cd13be357-7d3914baf06mr669827185a.23.1749471166299;
        Mon, 09 Jun 2025 05:12:46 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4521375bca3sm110438475e9.39.2025.06.09.05.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 05:12:45 -0700 (PDT)
Message-ID: <fb03dd8d-8caf-4861-b56a-2c10b070e2dc@oss.qualcomm.com>
Date: Mon, 9 Jun 2025 13:12:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: qcom: demote probe registration printk
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale <sanyog.r.kale@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250523085317.11439-1-johan+linaro@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250523085317.11439-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=6846cfc0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kt4YovZ3MTeTNe02vhkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MSBTYWx0ZWRfX31aYts+WgpnN
 BmPnvsysHs78JrLDa8ap/agiLUjswuIO0mNZSigZKMepgxmZ1MGOy2DMYRjsuOKzRfuxczXbex0
 Osxavv8eiXa/Fw5qSXn7mWQUq8Mk4FL7CrjaszGj65D3pMDTIlhbjJmrM9K3Qv68yhUDlwi81of
 iIun/5xYBJ203ONbdbDjKL4amizzuWbH5GfKpG7q/Lm7tIwqeRLhyOMOIYHUGpUUp22ANsqMbml
 1hFbpQChokA81UKaOmsWxUIOJjX/0FKAhkKQRqkHwWhbXZnL0VPAEjAQsCRZFwwO60RC08xwiws
 zlnMYXcBT+n3hOQTD91it0YzB/zRapZNd4mIEvOIVNyPbDVQgwESSA8d83Whs7DIowLpd8wk/wb
 UoqjbNxbKDdoM1sKpcBAcMUuKHLTPbzFH1JfYoZI/pWEJJVTP0gtmw/Yd/DkR8ZoeNTppCPs
X-Proofpoint-GUID: Sj4ZQyaD_231Hk7kfLJwaupdX6WOSq-Q
X-Proofpoint-ORIG-GUID: Sj4ZQyaD_231Hk7kfLJwaupdX6WOSq-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090091

On 5/23/25 9:53 AM, Johan Hovold wrote:
> Driver should generally by quiet on successful probe.
> 
> Demote the Qualcomm controller registration info message to debug level
> to make boot logs a little less noisy:
> 
> qcom-soundwire 6ab0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6ad0000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6b10000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> qcom-soundwire 6d30000.soundwire: Qualcomm Soundwire controller v2.0.0 Registered
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---


Acked-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  drivers/soundwire/qcom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 295a46dc2be7..3265c39e6b51 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1648,9 +1648,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_master_add;
>  
> -	dev_info(dev, "Qualcomm Soundwire controller v%x.%x.%x Registered\n",
> -		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
> -		 ctrl->version & 0xffff);
> +	dev_dbg(dev, "Qualcomm Soundwire controller v%x.%x.%x registered\n",
> +		(ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
> +		ctrl->version & 0xffff);
>  
>  	pm_runtime_set_autosuspend_delay(dev, 3000);
>  	pm_runtime_use_autosuspend(dev);

