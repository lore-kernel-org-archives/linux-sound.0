Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5618F3E95BB
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385179; cv=none; b=XqhkDo3XLok2dLYl7VXffvpMrQjuiIf3Xy5KrFzARmUJOdW5zv2B24bb66I/r/0x47N+hYei17SAYga8Dj02wiX8T55V5S4BYLjUFdSCXFp3u7gbXQE3vZPoLiIpxGFCCdIDURU1ajCOgGO3X4ZeO1kESQgqyptKPTz5pNRYB3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385179; c=relaxed/simple;
	bh=SFzeZNngfk6pzQZG1K86K3/FE1h1oF8yNczk9fEL2iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=gozdQHg8/YxCY9vefmb4eG4cciatnImTnr8ceyjfFv+6zTeddloSxwiltumx+lEvzTURa3NcAfNSKZkkLs2GI+smcSM1vVLAZeZR9ehpV3xdbeHkKjTWxi/4CRi27SvI3hp/KrxGJDLBpz1QIX2IA80ZwCxlI4nDwniNJ0vC/gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xh/jsRXO; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xh/jsRXO"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43615d9c507so1504001f8f.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Feb 2026 05:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385178; x=1770989978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dltqQMJngvNeBjsYoxwqpyWA+TzyQUr8qrynWVFhjYM=;
        b=xh/jsRXOXV1ND+4V0fQi2O6FOKFAsrWLpVpxsZuyYbYrg7SEdk9hU3o4Ewo2Nr8Mhr
         ig+uONzIqn/BLC60vN45rPCESXTYcLeV5IlAbLTVw8x9+nLRXyv+jsk+cra5gmsIP6wk
         4KC4Fe211xIabdxmzRH8/g4lSkQlYQjZqibY4DsUlCsXEvsePZ05fpeEiKpQyR5zJ4K3
         jkYotzpoAxnes3ZJ5ZrBcWQTJml+5PJKRRBxagg5dInpD1/bi5verjUeaHBEvkwUK8bF
         UH2cOdMvXZIP0D5VzQ8SKXZ9QQQYqMzw0VTe3oMkNLBWbwYQtL0aE15SHKDVgFpV3zHx
         Ez7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385178; x=1770989978;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dltqQMJngvNeBjsYoxwqpyWA+TzyQUr8qrynWVFhjYM=;
        b=k1rIBQnCqEuNFLpBQa4XELzZ8GHKLAJs2qHwtGup6IDhfdzSJMCfR0pxCX9olrQ7yo
         86hBi9FthVsHhp7c58pmbWLXNhtgdzLIoVjEfXVrZe/ag6fk+6Z//PEle6t1+8cPD7bZ
         TSEKEUQbHZ/Hd5tAR0uNblpx7IMEY/vAcJ062igHis9sqwTnyRr5ednPwThqhT79XTgY
         53TAV2htsP67Ortinlqbm0yIS/DOt+2Lll7pmFeNNkIVD9XcFt6ro/BC/cp/Ln0Oj/Bl
         DRjctkbD60rWkrCGWGi41woN2aoLmZft9iluSrVhmb9TAvkVLFqfqs3j8FQwi7+OFrKg
         89Og==
X-Forwarded-Encrypted: i=1; AJvYcCUTJyJplKXwr8YhUpYYDYLr1Fxf0PB4STb7LAQB28SnnCNaJBxIe/HW7f4lyPE4mxjhUUUvBYbPdXNyRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCWCDDCojIox0rUCLtHgIvDvrOgTeRDPQ5Dz1vU1gmPVzzdmjq
	ro5wElCWwVlxiH1ropIafb6FphAThuY8cJqqESK4b7dSFJVxtM8FP4Zjkf79mvTGuw8=
X-Gm-Gg: AZuq6aIkHwEdKLapTzFCcbOFS6i40ult30isEthuhtk6TKX6W7N8v3RgO1kQoSzFa0t
	kQSRMQcwZqfGA+D9ByKHqdSSRxbyzyWZqkk38uJLyFmjIKtr2/IucJmecNXSPNV5W2T1mmvuFbc
	pcoj/l3FvQIg7Er0V7j8jwlZQ/RLAkr824MMQobiDkqZ9a4JQtKOWRpWgGrlBUiF/UEtgEBPuKw
	1dL42f21nlZPoGP7bVT8scR7IvdB8ApWweugnHThM0+giOVcBpUQL6bZ4+EkmVhzjQs950SknMp
	P8GLAkZz31JnnfHVJvnAUis5mRC9d29qSuqSctds0RXEc/SbF1eo5WhZ03vZnk73aYrxs5eFF5c
	F+NypOV8W3iXmFI6QLDmbvMwxC9CaM3OO/ioS4KKuP6I/95BGT7Roh1nMcBqGrZo9abVzhbUABn
	SjvYUhpOgIR11v4nud
X-Received: by 2002:a05:6000:18a6:b0:435:e47b:e746 with SMTP id ffacd0b85a97d-43629378231mr4469759f8f.36.1770385177665;
        Fri, 06 Feb 2026 05:39:37 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629744ec6sm6910737f8f.35.2026.02.06.05.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:39:37 -0800 (PST)
Date: Fri, 6 Feb 2026 16:39:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] ASoC: SOF: ipc4-control: Add support for generic bytes
 control
Message-ID: <aYXvFr-LVHVJSvS7@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Peter Ujfalusi,

Commit 2a28b5240f2b ("ASoC: SOF: ipc4-control: Add support for
generic bytes control") from Dec 17, 2025 (linux-next), leads to the
following Smatch static checker warning:

	sound/soc/sof/ipc4-control.c:365 sof_ipc4_refresh_bytes_control()
	warn: missing error code here? '_dev_err()' failed. 'ret' = '0'

sound/soc/sof/ipc4-control.c
    324 static int
    325 sof_ipc4_refresh_bytes_control(struct snd_sof_control *scontrol, bool lock)
    326 {
    327         struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
    328         struct snd_soc_component *scomp = scontrol->scomp;
    329         struct sof_ipc4_control_msg_payload *msg_data;
    330         struct sof_abi_hdr *data = cdata->data;
    331         struct sof_ipc4_msg *msg = &cdata->msg;
    332         size_t data_size;
    333         int ret = 0;
    334 
    335         if (!scontrol->comp_data_dirty)
    336                 return 0;
    337 
    338         if (!pm_runtime_active(scomp->dev))
    339                 return 0;
    340 
    341         data_size = scontrol->max_size - sizeof(*data);
    342         if (data_size < sizeof(*msg_data))
    343                 data_size = sizeof(*msg_data);
    344 
    345         msg_data = kzalloc(data_size, GFP_KERNEL);
    346         if (!msg_data)
    347                 return -ENOMEM;
    348 
    349         msg->extension = SOF_IPC4_MOD_EXT_MSG_PARAM_ID(data->type);
    350 
    351         msg_data->id = cdata->index;
    352         msg_data->num_elems = 0; /* ignored for bytes */
    353 
    354         msg->data_ptr = msg_data;
    355         msg->data_size = data_size;
    356 
    357         scontrol->comp_data_dirty = false;
    358         ret = sof_ipc4_set_get_kcontrol_data(scontrol, false, lock);
    359         if (!ret) {
    360                 if (msg->data_size > scontrol->max_size - sizeof(*data)) {
    361                         dev_err(scomp->dev,
    362                                 "%s: no space for data in %s (%zu, %zu)\n",
    363                                 __func__, scontrol->name, msg->data_size,
    364                                 scontrol->max_size - sizeof(*data));
--> 365                         goto out;

ret = -EINVAL;

    366                 }
    367 
    368                 data->size = msg->data_size;
    369                 scontrol->size = sizeof(*cdata) + sizeof(*data) + data->size;
    370                 memcpy(data->data, msg->data_ptr, data->size);
    371         } else {
    372                 dev_err(scomp->dev, "Failed to read control data for %s\n",
    373                         scontrol->name);
    374                 scontrol->comp_data_dirty = true;
    375         }
    376 
    377 out:
    378         msg->data_ptr = NULL;
    379         msg->data_size = 0;
    380 
    381         kfree(msg_data);
    382 
    383         return ret;
    384 }

regards,
dan carpenter
