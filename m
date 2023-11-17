Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E03CC197A0
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 13:26:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbjKQN0t (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 08:26:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbjKQN0t (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 08:26:49 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB21D4B
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 05:26:39 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9e5dd91b0acso273775466b.1
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 05:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700227597; x=1700832397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l6G3xvxB5f+NI6xOHD8WIHTGWAYq+KZZMoLHsPn646o=;
        b=s0mizB5uG7FPwIBXbVch1sGsn8vvqiKik1BNcYH5NQ/1gszOKFFOxcP03gww1ox9S4
         8W/IUH0Ba0WNQQb2lA28JsO9IVkIe/Qtn5VdGV6s0dMOt17rtNXSBnwooAa2r60TKRvE
         hHD125oX9k7zR76f/WQSGTLbwqeDlp2J5r3S+kDqdnZhzFg3Fa2vS3fIjywv2qIxTU4V
         6bOoGTgRWg7x5wn3R4jnzaWNybgOLa0AaepXwIaKAsuvbGvOC1/Df6px00JFlsWlk46F
         tGvVSJDsXSIuomg0que41bS4SGVyQUmwrE/JnSjEQYsBtmE6rAUAr1H9RLAU6cVQffgq
         qkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700227597; x=1700832397;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l6G3xvxB5f+NI6xOHD8WIHTGWAYq+KZZMoLHsPn646o=;
        b=wLurq0TNfHDTRY0pNEk1NuMXKgDoc8dbLTwKxDf+9EBv7mNlynas5Z6iR1dBjufq5g
         MHJmUgLXGL6kInAzAqHiDpkyyf0qKKlINc22F7gI0IenMZHfJJc+d+VpbYVN1lthpjhJ
         NrkmQyZr1S81/nd2TQkHxQIxPZzXKXn/JF6KdNhPbrYENmYn9sjdwZ7kyZySPYS7+t+c
         lXnxdYKvIeNAM649UYps8Zqz5hJw82HOWXWE18m5MtZPwfn95Xkb0XT6u1U4fMUreIYY
         ogJgkE7lQKyS9IIbAe63ZzGi2H8V4M4WK6ige2TJf7lAuaCkZ/1Uf4eqsU9PDhBXo1xm
         1U8A==
X-Gm-Message-State: AOJu0YweuAvuJJflhjRLlMPa71K5cdxLc04Rp/WzWn+nD2SukxLAl3S1
        FbhOMr191Cxq0Wl30Ig+vdz08A==
X-Google-Smtp-Source: AGHT+IFDYwhUxI3cRDD28jbJeMe1uTr+77t/xwGbAjRDoq9ekWAOvz54m82XmiBQ+477xqPPF0zlsw==
X-Received: by 2002:a17:906:bc99:b0:9c5:844f:a7f4 with SMTP id lv25-20020a170906bc9900b009c5844fa7f4mr14575766ejb.35.1700227597494;
        Fri, 17 Nov 2023 05:26:37 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id p20-20020a170906a01400b009adc77fe164sm789874ejy.66.2023.11.17.05.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 05:26:37 -0800 (PST)
Message-ID: <1afb9593-5ea2-455b-afd4-bb83e46bc68b@linaro.org>
Date:   Fri, 17 Nov 2023 13:26:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] ASoC: qcom: q6core: expose ADSP core firmware
 version
Content-Language: en-US
To:     =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
        linux-arm-msm@vger.kernel.org
Cc:     Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20231029165716.69878-1-otto.pflueger@abscue.de>
 <20231029165716.69878-2-otto.pflueger@abscue.de>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231029165716.69878-2-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Thanks Otto for the patches.

On 29/10/2023 16:57, Otto Pflüger wrote:
> Add a q6core_get_adsp_version() function that returns the version of the
> ADSP firmware (2.6, 2.7 or 2.8), also known as the AVS version (see [1]
> in downstream kernel).
> 
> Some APIs differ between these versions, e.g. the AFE clock APIs.
> 
> [1]: https://github.com/msm8916-mainline/linux-downstream/blob/LA.BR.1.2.9.1_rb1.5/sound/soc/msm/qdsp6v2/q6core.c#L193
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>   sound/soc/qcom/qdsp6/q6core.c | 65 +++++++++++++++++++++++++++++++++++
>   sound/soc/qcom/qdsp6/q6core.h |  9 +++++
>   2 files changed, 74 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6core.c b/sound/soc/qcom/qdsp6/q6core.c
> index 49cfb32cd209..855ab4ff1e59 100644
> --- a/sound/soc/qcom/qdsp6/q6core.c
> +++ b/sound/soc/qcom/qdsp6/q6core.c
> @@ -20,6 +20,9 @@
>   #define AVCS_CMDRSP_ADSP_EVENT_GET_STATE	0x0001290D
>   #define AVCS_GET_VERSIONS       0x00012905
>   #define AVCS_GET_VERSIONS_RSP   0x00012906
> +#define AVCS_CMDRSP_Q6_ID_2_6	0x00040000
> +#define AVCS_CMDRSP_Q6_ID_2_7	0x00040001
> +#define AVCS_CMDRSP_Q6_ID_2_8	0x00040002
>   #define AVCS_CMD_GET_FWK_VERSION	0x001292c
>   #define AVCS_CMDRSP_GET_FWK_VERSION	0x001292d
>   
> @@ -63,6 +66,7 @@ struct q6core {
>   	bool get_state_supported;
>   	bool get_version_supported;
>   	bool is_version_requested;
> +	enum q6core_version adsp_version;

May be rename this to just api_version would more readable than 
adsp_Version.

>   };
>   
>   static struct q6core *g_core;
> @@ -108,6 +112,14 @@ static int q6core_callback(struct apr_device *adev, struct apr_resp_pkt *data)
>   		if (!core->fwk_version)
>   			return -ENOMEM;
>   
> +		/*
> +		 * Since GET_VERSIONS is not called when GET_FWK_VERSION
> +		 * is successful and these commands may return completely
> +		 * different versions, assume that the version is 2.8 here.
> +		 * Older versions do not support GET_FWK_VERSION and we do
> +		 * not care if the version is newer than 2.8.
> +		 */
> +		core->adsp_version = Q6_ADSP_VERSION_2_8;
>   		core->fwk_version_supported = true;
>   		core->resp_received = true;
>   
> @@ -115,6 +127,7 @@ static int q6core_callback(struct apr_device *adev, struct apr_resp_pkt *data)
>   	}
>   	case AVCS_GET_VERSIONS_RSP: {
>   		struct avcs_cmdrsp_get_version *v;
> +		int i;
>   
>   		v = data->payload;
>   
> @@ -125,6 +138,32 @@ static int q6core_callback(struct apr_device *adev, struct apr_resp_pkt *data)
>   		if (!core->svc_version)
>   			return -ENOMEM;
>   
> +		for (i = 0; i < g_core->svc_version->num_services; i++) {

We have two places where the api info is stored based on adsp version, 
g_core->fwk_version->num_services and g_core->svc_version->num_services
this code is only going thru one list which will not work as expected in 
some revisions of the firmware.

> +			struct avcs_svc_info *info;
> +
> +			info = &g_core->svc_version->svc_api_info[i];
> +			if (info->service_id != APR_SVC_ADSP_CORE)
> +				continue;
> +
> +			switch (info->version) {
> +			case AVCS_CMDRSP_Q6_ID_2_6:
> +				core->adsp_version = Q6_ADSP_VERSION_2_6;
> +				break;
> +			case AVCS_CMDRSP_Q6_ID_2_7:
> +				core->adsp_version = Q6_ADSP_VERSION_2_7;
> +				break;
> +			case AVCS_CMDRSP_Q6_ID_2_8:
> +				core->adsp_version = Q6_ADSP_VERSION_2_8;
> +				break;
> +			default:
> +				dev_err(&adev->dev, "Unknown AVS version 0x%08x\n",
> +					info->version);


> +				break;
> +			}
> +
> +			break;
> +		}
> +
>   		core->get_version_supported = true;
>   		core->resp_received = true;
>   
> @@ -293,6 +332,31 @@ int q6core_get_svc_api_info(int svc_id, struct q6core_svc_api_info *ainfo)
>   }
>   EXPORT_SYMBOL_GPL(q6core_get_svc_api_info);
>   
> +/**
> + * q6core_get_adsp_version() - Get the core version number.
> + *
> + * Return: version code or Q6_ADSP_VERSION_UNKNOWN on failure
> + */
> +enum q6core_version q6core_get_adsp_version(void)
> +{
> +	int ret;
> +
> +	if (!g_core)
> +		return Q6_ADSP_VERSION_UNKNOWN;
> +
> +	mutex_lock(&g_core->lock);
> +	if (!g_core->is_version_requested) {
> +		if (q6core_get_fwk_versions(g_core) == -ENOTSUPP)
> +			q6core_get_svc_versions(g_core);
> +		g_core->is_version_requested = true;
> +	}
> +	ret = g_core->adsp_version;
> +	mutex_unlock(&g_core->lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(q6core_get_adsp_version);
> +
>   /**
>    * q6core_is_adsp_ready() - Get status of adsp
>    *
> @@ -334,6 +398,7 @@ static int q6core_probe(struct apr_device *adev)
>   	dev_set_drvdata(&adev->dev, g_core);
>   
>   	mutex_init(&g_core->lock);
> +	g_core->adsp_version = Q6_ADSP_VERSION_UNKNOWN;
>   	g_core->adev = adev;
>   	init_waitqueue_head(&g_core->wait);
>   	return 0;
> diff --git a/sound/soc/qcom/qdsp6/q6core.h b/sound/soc/qcom/qdsp6/q6core.h
> index 4105b1d730be..472e06bf8efc 100644
> --- a/sound/soc/qcom/qdsp6/q6core.h
> +++ b/sound/soc/qcom/qdsp6/q6core.h
> @@ -9,7 +9,16 @@ struct q6core_svc_api_info {
>   	uint32_t api_branch_version;
>   };
>   
> +/* Versions must be in order! */
> +enum q6core_version {
> +	Q6_ADSP_VERSION_UNKNOWN,
> +	Q6_ADSP_VERSION_2_6,
> +	Q6_ADSP_VERSION_2_7,
> +	Q6_ADSP_VERSION_2_8,
> +};
> +
>   bool q6core_is_adsp_ready(void);
> +enum q6core_version q6core_get_adsp_version(void);
>   int q6core_get_svc_api_info(int svc_id, struct q6core_svc_api_info *ainfo);
>   
>   #endif /* __Q6CORE_H__ */
