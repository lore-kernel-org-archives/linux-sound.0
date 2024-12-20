Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8043621B199
	for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715746; cv=none; b=quvZ2IL6t4c2/hFPASDnpYgvsmQZQwgnl6npWwrMT06o50LDFXOXW7t/UeKOuh+5KWSri4EvdCvsm5EysqXMiG37tU+nKc7OD0X6Z58uY8SJWhQl6Ts6yEgiRKV4vWzMWyJuKq9ygWTs/jVB7/J3J3zISEM2U3DVV4aNbDLqp4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715746; c=relaxed/simple;
	bh=54mNiOr3IQ7krmcawF/Z9Wu7/C+6iT0Y3iYX6CtU7h0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYiSBJG3mDtmrsSOYsJJzImpPLTS0HUdYtbdDskKwZb5pwGtaiTJqY5mntGgVVjJ/wuvirCOY1NGvzKIFo7hDAU1m3mTNBO0M/G3wfHXNLhX0+ImWYGyYnLvOelMSUrffP7huCYCRMI8PAgvbq8Wi+61r4lGAGNYuuKtOiI1aEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gwbJY55h; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gwbJY55h"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385e0e224cbso1255628f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Dec 2024 09:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734715743; x=1735320543; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mr5mkQdWXfLMAZrUWH7pKzqkwwdmrlCBRUfvbnxrnPM=;
        b=gwbJY55hmPGcUk2yrnOfiuopuhTBJibbySBkzkSFUK5jwSaG8DnS8QDqbA/uN8Ea32
         W418IFqL9n3Q0c2JM0GydtGSzuyZ6aDFCS8ph10U8kGjZfCx0PTaqo8gmBbnUz9C+IxW
         xUCZL5ZcHKpaYWSJ1zWmcDglA0LgYsWdcOoG5UoTM5Fidzh5jZkv7SdfWNLpIlb2UYuh
         jrdsmjh1fDVpHNSzlKbg6P7jZ35sN2Anu2ciCEgrLQ/5bauAdRS1SIoNIPSsXr2ggwP6
         d7wa5j1mh63xrkzpiz2rf2GpfBhmyIZ+qPN7ENe3ynNj9OzWOdkw93ajJY5BlZc5nyoS
         y/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715743; x=1735320543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mr5mkQdWXfLMAZrUWH7pKzqkwwdmrlCBRUfvbnxrnPM=;
        b=owkPNzi1KHKkioKdv6JVBMOxJpNbUmeRMFF6Cd+gqTt2t5+Gjqi0bsZIKMthJ8/iA2
         aG62FPQOGOzoXTnhm3z3hQXEMHlS9o3mocwlLrysp/8j9ABgborEmTpq3t9w+7nyeKC5
         hMYFiuLsZsKRoB0dYT9IafU9ppTxCX82sRrL4yn4Vp8laaL0ST/rr4ITtiqWi5hqaeQc
         CM1gdJKxqF1LzeNsVhQiWgznz9vLhqhwvlOTv14L4ySUgVdHCqMVwvc/icDVyPkSykV1
         PQBQWczbbfYcmUncVa/jhwi9VUOCzlq0wBT8llTB7MQqvj++Wd/F3KUyOtiCy5P7ODTI
         UJ7g==
X-Gm-Message-State: AOJu0YxbeH7evMrSSn70/Trhd8G/5htwEXljODWMqFzg7SwgNsLwnN4C
	mf4oQlP5517zD/i7ZLQaQeGFh7u6QyVsIizCbqbvZZUvY6FRsOjw45TuwGE6P9qJapWNfcHm5Xn
	E
X-Gm-Gg: ASbGncuUvydqNEVKl3dom8iFkMa4POO7zBf0rtVHZrzp1t6TwaxhAJyTGPsM89LOm3L
	Q73lUQMzb63kKcV1gIY0Lq7wZDxV7QU/W6Orh4d/2aP0/QticF+nAnHlm3HSdEq9invHzJlHgzb
	hN9hWK2ABkd00wadl0ikC0w2WsWCpCwJfNtVCVRmqcAMu2LEfkdUgCOmScUrSZyGzLC5r40V4mW
	2t4Q+okz29NspDl6Oa3kVNoJo5M2EgpS2Yioi0xyEEGJ4eO2YMcd1JhcN4M0fnuxF/KWiR2F0E=
X-Google-Smtp-Source: AGHT+IEI19kxGk/zbuSPDDSjPfqup9SJvXXyMjTViaCcYrvpnJOUwXjZmnZw9ZDld9G7Km7x+i2DAA==
X-Received: by 2002:a05:6000:4614:b0:386:2e8c:e277 with SMTP id ffacd0b85a97d-38a22408c81mr3945283f8f.55.1734715742755;
        Fri, 20 Dec 2024 09:29:02 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c89e140sm4608965f8f.79.2024.12.20.09.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 09:29:02 -0800 (PST)
Message-ID: <8055a3db-5bb3-4550-b434-28a9df85c7a1@linaro.org>
Date: Fri, 20 Dec 2024 17:29:01 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 RESEND] slimbus: messaging: Free transaction ID in
 delayed interrupt scenario
To: Visweswara Tanuku <quic_vtanuku@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241202135708.26219-1-quic_vtanuku@quicinc.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20241202135708.26219-1-quic_vtanuku@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/12/2024 13:57, Visweswara Tanuku wrote:
> In case of interrupt delay for any reason, slim_do_transfer()
> returns timeout error but the transaction ID (TID) is not freed.
> This results into invalid memory access inside
> qcom_slim_ngd_rx_msgq_cb() due to invalid TID.
> 
> Fix the issue by freeing the TID in slim_do_transfer() before
> returning timeout error to avoid invalid memory access.
> 
> Call trace:
> __memcpy_fromio+0x20/0x190
> qcom_slim_ngd_rx_msgq_cb+0x130/0x290 [slim_qcom_ngd_ctrl]
> vchan_complete+0x2a0/0x4a0
> tasklet_action_common+0x274/0x700
> tasklet_action+0x28/0x3c
> _stext+0x188/0x620
> run_ksoftirqd+0x34/0x74
> smpboot_thread_fn+0x1d8/0x464
> kthread+0x178/0x238
> ret_from_fork+0x10/0x20
> Code: aa0003e8 91000429 f100044a 3940002b (3800150b)
> ---[ end trace 0fe00bec2b975c99 ]---
> Kernel panic - not syncing: Oops: Fatal exception in interrupt.
> 
Missing Fixes and Stable tag.

--srini
> Signed-off-by: Visweswara Tanuku <quic_vtanuku@quicinc.com>
> ---
>   drivers/slimbus/messaging.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
> index 242570a5e565..455c1fd1490f 100644
> --- a/drivers/slimbus/messaging.c
> +++ b/drivers/slimbus/messaging.c
> @@ -148,8 +148,9 @@ int slim_do_transfer(struct slim_controller *ctrl, struct slim_msg_txn *txn)
>   	}
>   
>   	ret = ctrl->xfer_msg(ctrl, txn);
> -
> -	if (!ret && need_tid && !txn->msg->comp) {
> +	if (ret == -ETIMEDOUT) {
> +		slim_free_txn_tid(ctrl, txn);
> +	} else if (!ret && need_tid && !txn->msg->comp) {
>   		unsigned long ms = txn->rl + HZ;
>   
>   		time_left = wait_for_completion_timeout(txn->comp,
