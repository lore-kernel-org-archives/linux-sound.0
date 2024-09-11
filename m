Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCD68494
	for <linux-sound@vger.kernel.org>; Wed, 11 Sep 2024 07:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726040031; cv=none; b=qCcTAKuVpGFwtSB9OuJ+uDyRuapPdV80T3NVHO1J8ykYIvyQ1C/JiBQN+x5G9CuDFx2oa8FDxjwwghOFrn7xDg+uRFW1dA5xmAOYkfJT9gRT2NIRe8V71cdQQIL4/XoBz+8v0JlWb2ptaiyu/36EqLbS357qwuDO3Lcp7/CYuTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726040031; c=relaxed/simple;
	bh=kbIB2aH6D4eVMlRKAMRiIvsp9tXkQR2Odr+w625/2WE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hlmuzRVqjtf+ItA+Nt8YEy96SKZt0sIPTzJyJg4Pw39wshux3nvNPoCCgbcsKKgoNYE4pNjbmMvnlgSoHZFKa5qmNSyWuNNRPYoJPyV4M14JwpZg2PFWcyRTJ4cShgzzECMMyfm1M+kmnGvsr5pEbSiW1VaGkVGPkAuLS5fDEIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OW9c8EJE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OW9c8EJE"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374ba74e9b6so5059910f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 11 Sep 2024 00:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726040028; x=1726644828; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=waChnXwLMhRh3dlZr0LgUZgVxCRtJHDpRHsW78jjWKY=;
        b=OW9c8EJEhwQPm6Md1Kfo47FWorpRlF64fjGJtzfmvmm+Hg8QT6zA+1pp8m+41SyfNi
         3AR253OnXbxGXKW1dA56s8523yAgMRpSQDIpt39nmNA9j4YGPppvrhxp8uwbT+ce0abe
         x5IZgxkq0zXbYBdw2mEOXPk4coZQaHQp1LKzMbKQcugNtZnCCTF1WVaTPBjCXWHfU5Ul
         uT5L1J/UuIdc/yBqOOW34/k1mnG82ubwQWTYMVYmkWeQtVodBloSDunoe4qwNrVb3S+z
         /oYYHJwIjK1UXDfJLFbsWX4w3Hgv/tAsVU79V0+VcbnSCeoqGnB1bNJRH0a/ClPCQN04
         TLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726040028; x=1726644828;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=waChnXwLMhRh3dlZr0LgUZgVxCRtJHDpRHsW78jjWKY=;
        b=nTg4+Yfljl1izzsstSWDQEKKql4elgNO1W5cIZ0+9CA61lxVSLDRFpDmox7TSpsEG7
         Pw24EHAbmSb9pDx5w7oSjbQYCXv9i5HeNiU0LO2D7IWuBR2PlzUBLPnn2ecI+OKMQql9
         zNKlmZ5/udBZ2owQa9epjwHQtxAJM9w3vX6e/j3M+QnSDOkZ1NK9HTG7zaaU+UeSU9CD
         HahoEHWj0RNoonQ+tZXJ68+bND34ipI5TcERrzeRHjaUsIijV3JZJZ9fzXT+sNGL8Pr8
         VQ5hT9cqhB7XTLGNLMwwrmSfcbf+AgCU1PKagOd+nt7b73dDn5BLSlxohzC9FVuHnZhq
         XgAg==
X-Gm-Message-State: AOJu0YwEw/aB3mJQdZULXBf8euNg+4oZLCjvNXYyjBqiCEFvuJEB1gCr
	nsPPvAeIxlF/uh+roiAzX7J9UGfo5sIKu3Ce+WxbBg8qFtJpd4uglR1jTqifKzVx4I0B1/SmTJp
	j
X-Google-Smtp-Source: AGHT+IFMVgzPMtBRrBHgElmU/sBq1NB5UAguIy0Y4R1hUBBFHq+7IGxgt5spwjTOJVmuneLA6Zx7pA==
X-Received: by 2002:a5d:4248:0:b0:374:c512:87ce with SMTP id ffacd0b85a97d-378922b7b58mr11531383f8f.30.1726040028125;
        Wed, 11 Sep 2024 00:33:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb8b050sm133397595e9.40.2024.09.11.00.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:33:47 -0700 (PDT)
Date: Wed, 11 Sep 2024 10:33:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] ASoC: mediatek: mt8365: Add I2S DAI support
Message-ID: <67af3580-a907-403d-8bfd-76b5c304ab99@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Alexandre Mergnat,

Commit 402bbb13a195 ("ASoC: mediatek: mt8365: Add I2S DAI support")
from Jul 22, 2024 (linux-next), leads to the following Smatch static
checker warning:

	sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:271 get_iir_coef()
	error: buffer overflow 'iir_coef_tbl_list' 8 <= 8

sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
    259         const u32 *coef = NULL;
    260         unsigned int cnt = 0;
    261         u32 i = freq_new_index[input_fs];
    262         u32 j = freq_new_index[output_fs];
    263 
    264         if (i < 13 && j < 13) {
    265                 u32 k = iir_coef_tbl_matrix[i][j];
    266 
    267                 if (k >= IIR_NO_NEED) {
    268                 } else if (k == IIR_RATIOVER) {
    269                 } else if (k == IIR_INV_COEF) {

These if statements limit "k" to the 0-8 range.

    270                 } else {
--> 271                         coef = iir_coef_tbl_list[k].coef;
                                       ^^^^^^^^^^^^^^^^^^^^
But this array has 8 elements so it's off by one.

    272                         cnt = iir_coef_tbl_list[k].cnt;
    273                 }
    274         }
    275         *count = cnt;
    276         return coef;
    277 }

regards,
dan carpenter
