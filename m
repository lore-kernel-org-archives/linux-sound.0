Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7177D1F236B
	for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947110; cv=none; b=ORC0JvqP9xCHDCQmcj2hFm72SlfNLi4tXUFbyerHKGyTxn+DUMeqdyVl4/6hIg5Eciv0QJtI4n57tsIWqw1GkxBHXHY/xe+uWNWVx238VSR0bdCOQz1T85WNdrkDSanF9FGxzRHkySm5dOlKJTkS7aGe1Gnwe9judLaVB5v9QDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947110; c=relaxed/simple;
	bh=1Vi0CajOHRKeNKzH6avY9kIwFZ/TezpCqJGypsjuUds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cUwQNQqvoHdGa5IteGxyVerEHLzxgaFXUlgR2OPrpJh/JN6+7RiRSon27cmKeJ6x0BaSgjHIzcoyPe9QlEaNcEkr/1BZoYnGGT1rTdfzSfT5xFaWYAXOV8sutQAUHyRIo0wvc7YqGBQq0SJlJfY6NsgnLW4V9fekugNyGa7Vtb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f/BlHhQI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f/BlHhQI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso12028985e9.2
        for <linux-sound@vger.kernel.org>; Fri, 14 Mar 2025 03:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741947107; x=1742551907; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IXrdPdZYVwV2bWnv1UKchMA+tMF9lSgD0HH6znImayo=;
        b=f/BlHhQIdTYqTmPA/b5rXE/Z/Uwi37jn73qTlU30S6DYZNhAu/o5Gbd4w3GHON9ZI/
         fq9Wj4Lt3PLeD4mZKrxRpQghy07pQWxwsGPMEo/P9warcLMx+GcDF5xxbWzDZWEysjyZ
         ljBZzVros80DZIjd65x8TX5sZ8yMHVjOPDJCyXmMJN4YZL5YM01fJoqLOmzb4pWkz1pi
         ipvKJj68NGqq9GRer9n9MXwC5Ou2eQJUEnV0ZmG2oR1eFBftJrtgj7umYfNvFb+mToJk
         42mdbVEhTWL6qkCxmmn+VMF9DydsuAFds1sqUSajijuPmEO4bJf9fUQp87/6SqZS/mZK
         KikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741947107; x=1742551907;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXrdPdZYVwV2bWnv1UKchMA+tMF9lSgD0HH6znImayo=;
        b=o5DcF9Ev4HdnBDga9zAlpvaa1jpIS20+jL9LkpyM5n6VSaPGu3860hBn2L8iuWXBAn
         ZjThGeRsycoi6jhZwq3bdmR0HMyZ5Owz+Di9pyhTZzpCBKRFnwr03+FfQ0ZJC8q7csla
         IltkHEz4M7vRGn6LHWb16HhNvg6/HI7pi8VBN6ySbj4t5WMkJZJcl3EOM7tbRTqxOhmE
         welNiCSPZsUlc9uMLPuRF1RVJ94bgraTuOAQiP/mnsFlCwMQMOYanQ4afit1CXhbizdy
         vba38GSBN43R+u4ifxJ2l2BafX4m0FRDZjk7vNVV+ZFNpgu3TwqFCoVXCQLOdKDWIBaq
         Y3lg==
X-Forwarded-Encrypted: i=1; AJvYcCV4mTbd/0xSBziT7g2Hqns46lw1tKcTe+2iEC1UXLxhMQoi3M5dEtH08qEun2YDQBAJQgGZ2XkQNNGtQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlEnBnJp25HlgKXmt7Ha4qin+Z9pFsiR8izVtWYK6VOm3EglQi
	XYBVeNSBu0n6S0+i6V/j0FNMygBPdBI6YJ6YN2LjR33GJ6bwptDTeuWRV1qdbE8=
X-Gm-Gg: ASbGncsquJrPzPYu2zGM6JVwNT2ll8/5zWGqxvw8E5Hdo+UCrJrzRt2g7g88dy0xiRI
	TrxQfmmqXSe10eTP9xiRylpe/pUTUEibE2zUoZiFWWNm+0QB71ROMku/qal2XUOjlZXdFUrzFwb
	SXmyWfRdINfBYPKX/UA5oKqXzbfdbjXq1xkvJg6VcX2cYgssZMnp3yp4+IhfPJ4NjDzr/a1o3kx
	0TeHy+RielN4WlMY0/N+bhjFxT/mP7f6h6qo4EWSiPeALs0CxKMV29pKCSkmPCevf7aP3roaohT
	glM919X5lfyRC/KWpX5RZEFjpE6V7+Ql/0AALoVmMrxsnND+sA==
X-Google-Smtp-Source: AGHT+IFu33nlZq8eDE9nkYaBwVTjMj37ygSLQh0y3dybArIim3lL6otY1GCHq+RK2eeNyDGoSAttHg==
X-Received: by 2002:a05:600c:3108:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-43d1ec66daamr22153745e9.4.1741947106739;
        Fri, 14 Mar 2025 03:11:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d2010e2a2sm12352535e9.39.2025.03.14.03.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 03:11:46 -0700 (PDT)
Date: Fri, 14 Mar 2025 13:11:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: amd: acp: Fix leak in acp_pci_probe()
Message-ID: <3dad80cb-e177-45aa-97ac-df9c98a47d94@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There needs to be some cleanup on this error path.  We can't just
return directly.

Fixes: aaf7a668bb38 ("ASoC: amd: acp: Add new interrupt handle callbacks in acp_common_hw_ops")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/amd/acp/acp-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 9322379cb36f..123524f90d6c 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -183,7 +183,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 			       IRQF_SHARED, "ACP_I2S_IRQ", chip);
 	if (ret) {
 		dev_err(&pci->dev, "ACP I2S IRQ request failed %d\n", ret);
-		return ret;
+		goto de_init;
 	}
 
 	check_acp_config(pci, chip);
-- 
2.47.2

