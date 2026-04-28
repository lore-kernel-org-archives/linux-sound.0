Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5985432F764
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 16:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394852; cv=none; b=fIa5RIuvFBqZgzhqTfCbUNt8lBeiH+NCFa8Urr8AhvGbgPRk277ojyYg7VDXrq/T0BlJm/Zj45xCVRf5i4LB+6U51lfShO7padoiXd+DMtd3wjcpUxEh0TPChhmbl2yAEO1q+zLExjhdLXiKVMk4LXQn5eJzymWXgRBZT+2ulA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394852; c=relaxed/simple;
	bh=9S9GoA2wdMOKBwQUq6uU4RsjDD9B9w9gbFBChUNcp5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MN7xE+wKLsXL8N1/VIa6WOAeIZahBNEthG3BTnGhVRdLtf/DEJ7VoMDMZfte/siuzDc2u9vrI2SlpTiFZfYjF4Qogjx3mOS7tvz6mQI/qV9WSIctYg8Q57Vrifp5GP06McXaS03SofRVfLIwud/OKvXigA5XeVDpZqI7EGVBJkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=XfiIGnuM; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="XfiIGnuM"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4042fe53946so5208359fac.3
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 09:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1777394849; x=1777999649; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lsaS50fJFWEgKS/X3mmwXYg/L5d5/h6qIX6nFemmP8U=;
        b=XfiIGnuMwfnSZxVU2xMgiQkpcZx9aOzJFtBz/g7B0AIMVtPkX6kMu59YPBadlEyBuM
         FQF2p+kRwFoecg5nfEGOocMnL5tUqrba1mQGA9Vfuqpjh/BsagGOYnQzCwHt7+h5XFOb
         xfmVVCQ4cXKEpESLS4Di0RDcO629CVyZPLD6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394849; x=1777999649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsaS50fJFWEgKS/X3mmwXYg/L5d5/h6qIX6nFemmP8U=;
        b=UL/tMf0v2HGuc576S3wCFgCYAELtqEPc7NV+M1ciqGcCa4Mu2xv7WXclSKUoWUL9Kp
         6GtUixJ8uVtnsur+FsfDW+ho5fMIINs1Z33fS6cRd94lp0hW+QV2VJQZYVuoZ3paNHsE
         4aO8TjO4Oq6nP4ISz5inlrXiv1wis1pCkess4OAaBEVxV5O3IfgQUenoBZPGG+1TXvu7
         TbNtyZ/dnped5NIklfYhmNVpVCcNCFCtei+sfbSVqFRXky61K7ec58z2PhnjCDKF0ifK
         GevkgqqXb7CSnVsr1x/bqh+IhJGFMbD0NNKhN1ExKfjk7WYo0P1huMOXsJdmZ/lVcNk5
         uoHw==
X-Forwarded-Encrypted: i=1; AFNElJ+HE/aHC+8e4lCMxKddfBHg8nyMHdN9Q05fxfXkTbKqMhZr37Ni1QBeN/HtvEirC9h2sxKD4SseWUDttw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyydmcBcXoVxIFmYNzNXkBdaFE/alZoyWKidER0o50BdmvI5W8
	16RBdUlYprrYDqWRki0e5uAyoselbh8X/g9Y7GYad5ov6xvptJJjyfSqm1oG09RsPg==
X-Gm-Gg: AeBDieuUTcnxxcfwGpi5kcTcGvqUn6YXX+RAFVLDtwRcosm8sUtmd4PIOesZIX9ukqJ
	EN8FGL8PqpXgR+bH2StfrOcfH07Uw01Zo4M3czVD8rGu8N8bGI3XN/3AGbYPPbhD4i4ZyzZTLKv
	ldUw+uSMEWMuFRL5GGMy3QKken87MZ5N36H9sHb3kZFlQ+Ml665mYCWrbGmJFm2hUTjAbQrAqvN
	tfHr4JjybM5TQ/mL6oQcxgnF9k7ZCbpg9iOnwJxl0iZVQ+oMjjSwrRMIwQZf7YidRIpI4gMi5Sx
	V804BjWG5FvUdiXME9hD4M3Ld5QU7VaXENzoTr18RhbTVp0Ja2JqqJcESJ9/1xGtcTbphvb7K6U
	bmxZQEsb46h3jZ5QQHFdqOBjQMeJydm28cbRYbZgTLKSd3b+QaZUwO9wOcl8pUGJKCamMl6S2rE
	3fv2faxA5WiWpTbxdkRiH0OC4nPD67RUZ52FgrQBA0FLBzQHgBUN2kjSI1UaRscrewGRU2
X-Received: by 2002:a05:6871:e78f:b0:42f:ba47:36f5 with SMTP id 586e51a60fabf-433f396963emr2135147fac.17.1777394849189;
        Tue, 28 Apr 2026 09:47:29 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-433efbf1d8dsm2255892fac.6.2026.04.28.09.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:47:28 -0700 (PDT)
Message-ID: <bf380b65-1513-4792-9e3c-d03bff17c141@ieee.org>
Date: Tue, 28 Apr 2026 11:47:26 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] net: ipa: Use the unified QMI service ID instead
 of defining it locally
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
 andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeff Johnson <jjohnson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kees Cook <kees@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-2-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260316171419.2619620-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/26 12:14 PM, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Looks good!

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/ipa_qmi.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
> index d771f3a71f94..37936ad132a2 100644
> --- a/drivers/net/ipa/ipa_qmi.c
> +++ b/drivers/net/ipa/ipa_qmi.c
> @@ -66,11 +66,9 @@
>    *   determination of when things are "ready"
>    */
>   
> -#define IPA_HOST_SERVICE_SVC_ID		0x31
>   #define IPA_HOST_SVC_VERS		1
>   #define IPA_HOST_SERVICE_INS_ID		1
>   
> -#define IPA_MODEM_SERVICE_SVC_ID	0x31
>   #define IPA_MODEM_SERVICE_INS_ID	2
>   #define IPA_MODEM_SVC_VERS		1
>   
> @@ -484,7 +482,7 @@ int ipa_qmi_setup(struct ipa *ipa)
>   	if (ret)
>   		return ret;
>   
> -	ret = qmi_add_server(&ipa_qmi->server_handle, IPA_HOST_SERVICE_SVC_ID,
> +	ret = qmi_add_server(&ipa_qmi->server_handle, QMI_SERVICE_ID_IPA,
>   			     IPA_HOST_SVC_VERS, IPA_HOST_SERVICE_INS_ID);
>   	if (ret)
>   		goto err_server_handle_release;
> @@ -501,7 +499,7 @@ int ipa_qmi_setup(struct ipa *ipa)
>   	/* We need this ready before the service lookup is added */
>   	INIT_WORK(&ipa_qmi->init_driver_work, ipa_client_init_driver_work);
>   
> -	ret = qmi_add_lookup(&ipa_qmi->client_handle, IPA_MODEM_SERVICE_SVC_ID,
> +	ret = qmi_add_lookup(&ipa_qmi->client_handle, QMI_SERVICE_ID_IPA,
>   			     IPA_MODEM_SVC_VERS, IPA_MODEM_SERVICE_INS_ID);
>   	if (ret)
>   		goto err_client_handle_release;

