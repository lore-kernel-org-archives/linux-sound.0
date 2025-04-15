Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD52F2957A2
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 10:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713972; cv=none; b=C2E1Iy54n+1n3B2kVTKyTyr36VMV5P4O4ShwCrqMJdXEcDzAmIDVwN2IpjE8edJ5zyXa9ixRcbYLzc2sbaxOHnKi9q9GSY3HEjaE+cAvzkIUmzeTFXvvXsssmS/zNqQwWWuw+OjEiuyeeX4W+/QbkULiRKQSVtmB2UBgmjBRqZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713972; c=relaxed/simple;
	bh=1bmlRXNw7Wj96w/Pag2FprruTB2o/m+IGx8ttq+1Tdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bi/I3FPXwxK/uoaO9M7aIQih4onx5K1WKbyXYtKqkEC4iMoQvWTBQ8JskG7rfOlxNw4+23rvymSKinr37ISLms4kDBoCtpt//XI+S+d3ykdZrlNtAKM5+iavxhD+qW24sF3hGMmYaFvIvylBDDqxlPki2C1VYZGe3Deis0bIFJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rein5IwO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rein5IwO"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3965c995151so2385686f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 03:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744713969; x=1745318769; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Rp3GVoH3UxHVJl84m6BMYPjGLsA0ExgNEo8pFvhMl8=;
        b=Rein5IwOQVvWmsKSRipeTbSl5WANEM7M6b0UpRSXfbalmI5yBDCVUOsNyhOmNN3TtB
         Yyd2bOS3EAZq0IV/nRx2X615oV5K7JZoj/V8tH9BNMPHriKfkfmyLJuLxRBL2V4ctOIK
         bszoEmCccUdBtxcEW9lRXDAqn+4HXt6wI92F083gcOY4CPw2aGHYzfK5ZjAxUtSOPUKt
         3/SvSAzpxYc4uwxey0J2fL8CS6GKr9v2e+yYDZKGy/tntgr1hyzVBw/EkxK8b5OWf5CQ
         Dcgc7M22NDKskPY222yPHxgvAVwYhbDw9vcTVPnqUtCFnkeSR1pSVWl7iC592ZK6q0Lx
         R+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713969; x=1745318769;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Rp3GVoH3UxHVJl84m6BMYPjGLsA0ExgNEo8pFvhMl8=;
        b=SXWT4B2f4lEF77fWuJgx1/NilSO4UR8cBFclI6/qCImHpaA+1VjvKTfpEGptfdA8Sf
         FIizVEOD0oTSHOhzCwK+SFz7Vz8eX7jviFj1F2h3KjUKJcNgKaOmweGXrc2NAiPpAyJU
         bNJlZXW9nJv10EsQGccjPsO57v4hps8xAVKLuiMxdj/ljNfb4N6xINtqv3ERWMFUehCz
         fkGE60Rh8K/swB6imAmFvTBpPnqWtU1hkeQO2h4Evjtts9nxxUdo5FjZATmWzjNaDVOq
         n1nHJJjFP0O1ZYaUKhN5LZftwQ+vlhFCiDfGTrHdi9UB8nRXzDiaBydVzAo+sKQIHoiN
         iikA==
X-Gm-Message-State: AOJu0YxnHvASuyQRxXUj31prUq2lbv/RjQnI2SWG7sbu6rl2YpOSLp0D
	0du00egPuo2//JQ9SxOHKdf4orx40u2Wi1MVdqM3Ts63cl7a1dXs7RDP6vUnz5k=
X-Gm-Gg: ASbGncup57MSd6LC/g+QdnO64B16hVDFnJDy4G87HZiTClKtoc/KI/vpq3ETmOo227p
	DquSC6BNyBe+FlHYpjxRaqc6GWbtpz0cpJ3+s6YJLfyDjfUAN6CYWEFH9n1Z44PpszrYh2TDH/8
	jEWREXXKtKI+4Q5viC/d34pIILohw1zbGcyei4eoIrrHhOBa3VtPNVkNgDV0imz0unvZY4mHb/m
	2ImjBEq2GAdz5fm0+00C03YltZnZzER2Tfp45VW9ajFmkPRisWDbbKXanFigJgPMeT6y9FUAuaN
	SlGe41IpqCjCSSbO/nNyhPkIi5ogyejLyCMqAHeSbhtTzg==
X-Google-Smtp-Source: AGHT+IFIWp3LukWWe2XMUJem9p5WuOEMm9t2qNQIvYzDDPeLQAqLE4EenGCZMD4bgCZ+Sxn+F+teRQ==
X-Received: by 2002:a05:6000:402b:b0:391:31c8:ba59 with SMTP id ffacd0b85a97d-39ea51d1033mr12024815f8f.4.1744713969022;
        Tue, 15 Apr 2025 03:46:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae978023sm13876678f8f.47.2025.04.15.03.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:46:08 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:46:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ALSA: usb-audio: qcom: Introduce QC USB SND offloading
 support
Message-ID: <Z_447cXhvGLSVg_7@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Wesley Cheng,

Commit 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND
offloading support") from Apr 9, 2025 (linux-next), leads to the
following Smatch static checker warning:

	sound/usb/qcom/qc_audio_offload.c:762 qmi_stop_session()
	error: we previously assumed 'subs' could be null (see line 761)

sound/usb/qcom/qc_audio_offload.c
    737 static void qmi_stop_session(void)
    738 {
    739         struct snd_usb_substream *subs;
    740         struct usb_host_endpoint *ep;
    741         struct snd_usb_audio *chip;
    742         struct intf_info *info;
    743         int pcm_card_num;
    744         int if_idx;
    745         int idx;
    746 
    747         mutex_lock(&qdev_mutex);
    748         /* find all active intf for set alt 0 and cleanup usb audio dev */
    749         for (idx = 0; idx < SNDRV_CARDS; idx++) {
    750                 if (!atomic_read(&uadev[idx].in_use))
    751                         continue;
    752 
    753                 chip = uadev[idx].chip;
    754                 for (if_idx = 0; if_idx < uadev[idx].num_intf; if_idx++) {
    755                         if (!uadev[idx].info || !uadev[idx].info[if_idx].in_use)
    756                                 continue;
    757                         info = &uadev[idx].info[if_idx];
    758                         pcm_card_num = info->pcm_card_num;
    759                         subs = find_substream(pcm_card_num, info->pcm_dev_num,
    760                                               info->direction);
    761                         if (!subs || !chip || atomic_read(&chip->shutdown)) {
                                     ^^^^
Check for NULL

--> 762                                 dev_err(&subs->dev->dev,
                                                ^^^^^^^^^^^^^^^
Unchecked derefrence

    763                                         "no sub for c#%u dev#%u dir%u\n",
    764                                         info->pcm_card_num,
    765                                         info->pcm_dev_num,
    766                                         info->direction);
    767                                 continue;

regards,
dan carpenter
