Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A0523506F
	for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 15:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760972669; cv=none; b=EliEBgNlJe9SDFRxjIfxtHzdIfvMK6U545mMptDdaqzmZFGGvRZjvD1T4F5VFz1g2S++hJuwnFZozXobO9khh5ErZDEfQKWH9biqYTOxPQtdzitOsCbyp6DUbwwkc0+ATSi/p0urh9wV201tzrxQkne7STaRxQkjT5ZpJK4TQUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760972669; c=relaxed/simple;
	bh=NQTt3yR3wb555kAg+WKMiqLQ3QOmGXvQw1+WcPNE6mk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=De1XZVU4wYvBfekl+Aa1bZBzOP2QENOOK530ATQTZLNFDgSvRlx9mqFVn++k/J/5N21AZyEYLMsVMFKykBSBm2wSPrRcw2v4aGKPaw+MWsG/+TAlmTGgxyH8839DV6FG+uMr++NdjIwAMcqCusvHEbG7+ve7OpJz3s5W5VxfnHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UCIyZ/am; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UCIyZ/am"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-471076f819bso35893225e9.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Oct 2025 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760972666; x=1761577466; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7j5YzMBOCDrFLrL1gjEGQ9zi19aLgZpxoO0BZALkK7I=;
        b=UCIyZ/amgYCUKpmSi2zCw1JGpsCsGWkMe4lwWX6WkmtRk6juK6CIbkwBYZ57y8ZdmM
         jmqWvtxnzwfo4+Q8tHe4MdEBPRG/baug1JI5umGrC3+QKypZ2W1TmHWn15N965W/BkjY
         ZFIYYiX7Iz3gO534fWQ8k+/LzP9mR/Q1I5QmcDZEIPFp9nZ5cP/jdLxJtAdtggWFI4rk
         pLZMtSs0k2U9KEcu7ZGg/TJpvHn5K7aiULdMXqRu7HtUnt+K+WIFhFhcTLda75cPrPP+
         9OnOhxRkyCXkAyGo5R1comx9x1eNq0s7m7byvwMmjIayGMdOwpVtbGHVUsa0alq7MKAI
         nnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760972666; x=1761577466;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7j5YzMBOCDrFLrL1gjEGQ9zi19aLgZpxoO0BZALkK7I=;
        b=CvgrPCYcaQk6MxSeilyd7DaUwR376yN0NfgtDqWtG4CwKUL3epkdG7i37v8YYxNqzk
         kt6eo16viNVgA1KYGHQeocMkIsHQjuzgUXihdJgPFWuZPGng/4b7W+JuI5HELmxVSy1D
         2VQE0+RoeYNBE5IItioacJ+AFR8SBpTc2Fs666F1kzeHqrhrVmaXiFf2M46LtajrFizb
         WowHS7h9mdvV1F4Of5dT28AR6gKypylIDaLNCw4eMLPXjVMjBKQlg8dqENstP4onPB+e
         fyLScPs0HBJ/HEzhriXYZA5Kqmdu+uQcUZrZFF+9zrm+iWK6BNuWVxBwVmnJX58g+Ou0
         kcQA==
X-Forwarded-Encrypted: i=1; AJvYcCU9X4IVKYKHLh/EmLEcQqNsJsNG1rgTa10mlzwfYESdm+6hKRWfi69x4GIDiDk4AMD8Ual72SXsDtQ6+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKQo0nhY6dWzhnovRr7Z6D5apiv3L4sNu/kDBse3iWGygNhqGy
	jI0xHEvIZ9mF8CNnQkSOxue5iZT8MuB2YxUGFYneQgwzu0DZin/MxXx4JzZZfQjr5WFFl7cCWpt
	jyyGu
X-Gm-Gg: ASbGnctc2CRTBbQ+ZEjF/qNuj/2LpXSMyPQvEcnYEcjnIfXQSfXpzF3xNudqJ25+8w0
	fie/Ie3RsBoGQ9rND3oTh3boc805pLtYMipk7ZUrsAd32XFASr0b37l2znlEbCYKPIBTbs+EO7r
	pd8QiD2slgqXrovjVV6IQs4YRw4pm1OEAJSXGevQD4/fK2YLAHVJqoyrjKOkX76Q/v10WOLPAm8
	IMP2SF5ztXYhkBzBh26VaSXlg0T7cG1FCp6Hqv5/8h/+B11o9qyjboXpX7GW4QwAeaNJVhXgNdS
	KF0NI8Ufczkpx++7SfDJyxNT9X3IFxjbWyf9BGfT9sZ11qcN967KEZgOvcJlPJPp5rNEUXAI4Ib
	SBUmMycjkoV0KrgZ6z+YVB5MYr50Ar260QxAeXzf6+hKw1CIXEU+f+GNxisy45HZn3Z5lxC0m+x
	I8oVsJGBEOc7W2sw==
X-Google-Smtp-Source: AGHT+IH+kjVEaLAgrhbcv9wCPGNvII0B3F+6rlxLJXUsp++tlTBLtRr0Ji9BepfUMnPNIQ4qAWtnfA==
X-Received: by 2002:a05:600c:5299:b0:471:95a:60b1 with SMTP id 5b1f17b1804b1-471179192d4mr122728725e9.32.1760972666014;
        Mon, 20 Oct 2025 08:04:26 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:9f99:cf6:2e6a:c11f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b9853sm15747079f8f.33.2025.10.20.08.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 08:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Oct 2025 16:04:24 +0100
Message-Id: <DDN8PM13DWWZ.BCXRTJIFB7PD@linaro.org>
Cc: <perex@perex.cz>, <tiwai@suse.com>, <srini@kernel.org>,
 <linux-sound@vger.kernel.org>, <m.facchin@arduino.cc>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 7/9] ASoC: qcom: q6asm: add q6asm_get_hw_pointer
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-8-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251015131740.340258-8-srinivas.kandagatla@oss.qualcomm.com>

On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
> Currently we are performing an extra layer of calculation on the hw_ptr,
> which is always prone to errors.
> Move this to common dsp layer for better accuracy.

The subject says that the change adds q6asm_get_hw_ptr but here it says
that calculation of hw_ptr is moved. Where is it moved out of or from?

Currently the commit message is confusing.

It seems to be potential confusing split with commit.
("ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer") where calculation
of hw_ptr was implemented in q6asm-dai.c.

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6asm.c | 12 ++++++++++++
>  sound/soc/qcom/qdsp6/q6asm.h |  1 +
>  2 files changed, 13 insertions(+)
>
> diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
> index 371389c8fa7a..643ca944b1b5 100644
> --- a/sound/soc/qcom/qdsp6/q6asm.c
> +++ b/sound/soc/qcom/qdsp6/q6asm.c
> @@ -6,6 +6,7 @@
>  #include <linux/mutex.h>
>  #include <linux/wait.h>
>  #include <linux/module.h>
> +#include <linux/atomic.h>

Ideally this should be sorted but it seems it was not initially.

>  #include <linux/soc/qcom/apr.h>
>  #include <linux/device.h>
>  #include <linux/of_platform.h>
> @@ -248,6 +249,7 @@ struct audio_port_data {
>  	uint32_t num_periods;
>  	uint32_t dsp_buf;
>  	uint32_t mem_map_handle;
> +	atomic_t hw_ptr;
>  };

Thanks,
Alexey
