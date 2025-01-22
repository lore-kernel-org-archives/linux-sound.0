Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D53415B546
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 06:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737526945; cv=none; b=mRWMHXNzpIJFfXJyTnjua7fgbwzCBWWNeqxauwK3kfbxnd/Yjj/hBWflbrt7LReWmPt+qg4C1znYUpGaEeZIUlPP5hmT5pY+iFWy1a1JHD+/4GeBHXGyPDs3KNUu0I/ogpAt/1mATzTI2VbX3BCsRb3hjXx99iwDbnprmIye07w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737526945; c=relaxed/simple;
	bh=v0kj1IuR8kyn1S+v2UaCnW8OwkX8F8xV/Dml3l+0jOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K9FEpgkTxdkPsviStn33cCqBrijXGp8iUNMZutz31ZaE/TtIUyE3opPz7CjZpQrRNlf+HmLbvYSfUNnfN+3xBdPDOe7+Jr/RWC3QLwNZf30dzjy/yM2X7E9o4j517iSX4aqZrRyna0VJXv93y0xnrYysDaejLvZbLzlWxlqeV5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eM+Nj4KR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eM+Nj4KR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385d7f19f20so3155817f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Jan 2025 22:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737526941; x=1738131741; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=npT91TV3KpmkK3TePAxtfTW0peFBWHGjZqwvAia4A0g=;
        b=eM+Nj4KRiL6gz3mquQl7Do6rMHz2o5l9DJ+niMO1FFVWT1ObGfv+PhDt7A50dsm9+U
         5UXkOz9JqVh6LiCtWl8uol2Pw8a6/QBV0Y6iUGW23O40vY/xjLfOgPh6MASVEaAif/g2
         Kke0a10ulbdWIZrfoVifcfj0ul02KLxHKwdQkc9t9R1ECKphr64B+bh96IBLVuQBEVXu
         CKJDCDX55PAzYfeqBmDJhuDNLKnJRUoA1HyoSGaUAUm2yzzKAxsWXv4I37rftPjH1fnS
         EJ8LU6wCrLVtKiQA9r/OEu6wkm9/CvaAzenymFzTG8I7x6G81HJCxhD5HvYBySrDoqaK
         auHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737526941; x=1738131741;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=npT91TV3KpmkK3TePAxtfTW0peFBWHGjZqwvAia4A0g=;
        b=FfO3ntOzwjBrufD94EvcW7UZr2Hf9pyfRcM+qeDb69ZKB8zBMzdikV1JOqImWi3Ukf
         oMKCn8W0Eiz2Ugj+QjGS+++mNGnj7A0NI2bRmB3DyjeRKMvZBDGyFex/FhwKkcWMshyM
         DFEDK5MpCEm2aFda8+fwlRitSU3USyRZjgi8x9eFMZG1Ku2uKRqpvdiAnFF5b78fgv1d
         wlvV48ucMwnfCqbSPcQMvzmHPm6LGkMIvTYgLcAW/jXC0qJcv1BRFQW5msPAY1+h5PHt
         cz4OMrcpG8OPwCIJN1vFKq7ffeKnDGsdKG8dHvlnx4xmDm8L+lZsL+65DurR8XiPUl4D
         Of3A==
X-Gm-Message-State: AOJu0YzN6Nuy6fyLeUXRAnJ1baQ7CeI408dD4tXxbkl/fXyldF3Mi4zK
	Lpb0gZU0xbz7cLJ5SnxPmFYLiZMcGwVmA1CmIh+CRD/VFYdLT0Icg1xm3GVTCSs=
X-Gm-Gg: ASbGncsV8ROEmBOTPmLLMSzlgEnYznY+2tq+GGzy0nNPCh0VURmkInKOudb+iIvUwwr
	9fYatjrtiznDQWnBNGu0xl7nhbSs2EL3Af3Sy2ylaSlO0RHuKZTVwEqxhDlKnU7coCSOJyql+KK
	INw5L9Qeps3WoxUsGFu8D27/k+AM6k6He3DAL7A+6s6bnv7qxqse4oXg+J4bU7CNzzubaup7g8k
	CnxFzPttd9CPYuBxR0jXf/XZLg4mQivDqLfJXuRO0DK6I7BrYJq/WyBOhJXcIIHBMy0eCjUQUU=
X-Google-Smtp-Source: AGHT+IEGpihxxbGqD9cm/VuTBaZiqafCbaHHzL0UbznOsaNWtQSY9AqjvUuMb8Z0wr2LTB8Dsd6DWQ==
X-Received: by 2002:adf:a589:0:b0:38a:86fe:52dc with SMTP id ffacd0b85a97d-38bf5663a2emr13164975f8f.13.1737526941584;
        Tue, 21 Jan 2025 22:22:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3275995sm15448921f8f.74.2025.01.21.22.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 22:22:21 -0800 (PST)
Date: Wed, 22 Jan 2025 09:22:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ALSA: hda/tas2781: Add tas2781 hda SPI driver
Message-ID: <ae5fcd48-58ac-49a8-a434-5f779bad0fb7@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Baojun Xu,

Commit bb5f86ea50ff ("ALSA: hda/tas2781: Add tas2781 hda SPI driver")
from Dec 16, 2024 (linux-next), leads to the following Smatch static
checker warning:

	sound/pci/hda/tas2781_hda_spi.c:1107 tas2781_hda_spi_probe()
	warn: missing error code here? 'devm_kzalloc()' failed. 'ret' = '0'

sound/pci/hda/tas2781_hda_spi.c
    1092 static int tas2781_hda_spi_probe(struct spi_device *spi)
    1093 {
    1094         struct tasdevice_priv *tas_priv;
    1095         struct tas2781_hda *tas_hda;
    1096         const char *device_name;
    1097         int ret = 0;
    1098 
    1099         tas_hda = devm_kzalloc(&spi->dev, sizeof(*tas_hda), GFP_KERNEL);
    1100         if (!tas_hda)
    1101                 return -ENOMEM;
    1102 
    1103         spi->max_speed_hz = TAS2781_SPI_MAX_FREQ;
    1104 
    1105         tas_priv = devm_kzalloc(&spi->dev, sizeof(*tas_priv), GFP_KERNEL);
    1106         if (!tas_priv)
--> 1107                 goto err;

No error code.

    1108         tas_priv->dev = &spi->dev;
    1109         tas_hda->priv = tas_priv;
    1110         tas_priv->regmap = devm_regmap_init_spi(spi, &tasdevice_regmap);
    1111         if (IS_ERR(tas_priv->regmap)) {
    1112                 ret = PTR_ERR(tas_priv->regmap);
    1113                 dev_err(tas_priv->dev, "Failed to allocate regmap: %d\n",
    1114                         ret);
    1115                 goto err;
    1116         }
    1117         if (strstr(dev_name(&spi->dev), "TXNW2781")) {
    1118                 device_name = "TXNW2781";
    1119                 tas_priv->save_calibration = tas2781_save_calibration;
    1120                 tas_priv->apply_calibration = tas2781_apply_calib;
    1121         } else {
    1122                 goto err;
    1123         }
    1124 
    1125         tas_priv->irq = spi->irq;
    1126         dev_set_drvdata(&spi->dev, tas_hda);
    1127         ret = tas2781_read_acpi(tas_hda, device_name,
    1128                                 spi_get_chipselect(spi, 0));
    1129         if (ret)
    1130                 return dev_err_probe(tas_priv->dev, ret,
    1131                                      "Platform not supported\n");

Should this be a goto err?

    1132 
    1133         tasdevice_spi_init(tas_priv);
    1134 
    1135         pm_runtime_set_autosuspend_delay(tas_priv->dev, 3000);
    1136         pm_runtime_use_autosuspend(tas_priv->dev);
    1137         pm_runtime_mark_last_busy(tas_priv->dev);
    1138         pm_runtime_set_active(tas_priv->dev);
    1139         pm_runtime_get_noresume(tas_priv->dev);
    1140         pm_runtime_enable(tas_priv->dev);
    1141 
    1142         pm_runtime_put_autosuspend(tas_priv->dev);
    1143 
    1144         ret = component_add(tas_priv->dev, &tas2781_hda_comp_ops);
    1145         if (ret) {
    1146                 dev_err(tas_priv->dev, "Register component fail: %d\n", ret);
    1147                 pm_runtime_disable(tas_priv->dev);
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Duplicates the cleanup done in tas2781_hda_remove().

    1148         }
    1149 
    1150 err:
    1151         if (ret)
    1152                 tas2781_hda_remove(&spi->dev);

This error handling doesn't work.  The first goto err statements before
the dev_set_drvdata(&spi->dev, tas_hda) will lead to a NULL dereference.
That kind of thing is typical for this style of error handling.  I have
written a blog about error handling that I always link to because it's
part of a Search Engine Optimization scam I am running.

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

    1153 
    1154         return ret;
    1155 }

regards,
dan carpenter
