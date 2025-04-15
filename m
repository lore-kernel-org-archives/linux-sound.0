Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6AD2973C8
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714030; cv=none; b=UsMF97O4007kGTcl2b0pwdtcKYtMEjQvdWBExgANJ88CoFTMIQdNrD/cnIktgXQUMYsSorplwLPRBEvJIyTBeLsVEyc0zhVGj01QMZgEoSwRxSZMqF7Jpy476wAPYj0OhGgii6j0pXmn2Coq+GRQV4T6IUQddhYtvFxeSispMtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714030; c=relaxed/simple;
	bh=QlssfZojBJkscgItEPe6oYtMDEqUb2U2RJAOssoe+UE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bHpGC87VGJSzZiZgCMgYRbL6ZkiuqWPw8YdYAQZO39ch+YolGeyuhpU1vRf2LlbKxj1ZX6pLLK2xoTZi96f0h7kOoie/8HnxDo3a6/qtMYfT/17tdO8Rid0n5vVrxYv0Dg0AK777NcMnnhb+FS34Yy2Nx+X0gprxSSHhD0kfc/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QTCSueS5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QTCSueS5"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43edb40f357so44915505e9.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744714027; x=1745318827; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vbiQxXPXZoIjdcXP9wPiLLUJ/jfx9FujGe4wL4vIgI=;
        b=QTCSueS5Vf86w7iY20wxzSdXQ50fqydRbQ61fRBo8epj0YPphkEDrL0wOPVFkgikZD
         GIN15P09Bk8W0iiXYooQu/HYmdEV5RmwdoW/aVkI6p1hGJIX2kMtaRAZ3IS4xFNEItnc
         W/cWle038QxqJgV/+BUUBjvDHWuA4xakwcKIeZbGAUKeLSq8kCb3cz/gbycMZJNhWlBs
         Hxu6PNkgE/PaUmhwIYPCFiBjYhIMd88VUmRe3wCS+OsqeUxa2CDSd4DRfnugorl8IGaV
         Jfnwv9X2Ly2n/aYZFANytb5sIp2bRWk51B7zpiJkcMgpy9MWDRVTJ0iwEhhWKYC6LKx/
         X0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714027; x=1745318827;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2vbiQxXPXZoIjdcXP9wPiLLUJ/jfx9FujGe4wL4vIgI=;
        b=i1DFR4L6RFGEmP40+/Y1/uZGOXgx2xO8s2vg24BMLlZOxE1yysEybcjL8/0kcDoXyh
         grEZZ6OIO3J2Eb8iVW2HW/WnzvwSnHtHa3O29iHbPl44gc/OzAWvTeVTc7w9q/BIxfo3
         RgJHZPrNxUWz/+alQtjo2telcK1qAQrsEDEOBj3/gCWUowsIf9jZihPlOeNbgLyExLtH
         V7HGVbTgefIZrpPW49xqqKrWhvUtUSbYj9VcVokwXvqvu613yb3VK1nfc6YyILd9is/Z
         rSbZBspOkXM5DzG3hf03Zgt64HHbNev6vDrIaF1O2oMkW8UrRX/yeILy0m+0ievWv+QC
         vuBA==
X-Gm-Message-State: AOJu0YxJ9WVYbWKlPiwumkimcBRBwK7MyToJjjGHM3QMku34qIiNpEvM
	QYiaIYKhqAhZ4AeESmFvso2U9C54X6X5/bu1eiaWjaiFr9hcI2jYuZV986947j8=
X-Gm-Gg: ASbGncu+yA/jk1AmmLWpoaoqRmsp59gG46L8WelufntmyqhNEW9gSrZbZ4ie/PIb2dF
	iNuD8gyKv7TVUddzKcLzZfYF2WcTvAGSed4YyQqUY7NdYViW8aJ5pum+0Xnc+7nREq6XGLMQgiK
	oVGRCbvK2JzidTwQC1cUvxSNeVfqmt5DqoKQ46ZQ5OhLkzh7pY2SJMH97MKpjr3cO6jc+cC3vVd
	1niVrkeTdq/uT8/XoN5Qz8vXA8onJQuCjaiasjmcslcQbyaWPXmxCGbXC5t9QIfiDWGvvhD83NM
	2IYkSknt1EXLbg3jlGL0/kha3CO36d8/LToEXqatY6BnSg==
X-Google-Smtp-Source: AGHT+IEoJydkAHRaSYA6WXwU2ip4fUvoX1JPjhd0W1zXOEHAsZoHf6ssl5rOoGbNVzDnuNuXajUg6A==
X-Received: by 2002:a5d:5f87:0:b0:38d:d701:419c with SMTP id ffacd0b85a97d-39eaaebc768mr12798742f8f.41.1744714027155;
        Tue, 15 Apr 2025 03:47:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f233a2c46sm204290665e9.13.2025.04.15.03.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:47:06 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:47:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ALSA: usb-audio: qcom: Introduce QC USB SND offloading
 support
Message-ID: <Z_45JyNuBhlwApX_@stanley.mountain>
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

	sound/usb/qcom/qc_audio_offload.c:785 qmi_stop_session()
	error: we previously assumed 'chip' could be null (see line 761)

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

We should check if chip is NULL here

    754                 for (if_idx = 0; if_idx < uadev[idx].num_intf; if_idx++) {
    755                         if (!uadev[idx].info || !uadev[idx].info[if_idx].in_use)
    756                                 continue;
    757                         info = &uadev[idx].info[if_idx];
    758                         pcm_card_num = info->pcm_card_num;
    759                         subs = find_substream(pcm_card_num, info->pcm_dev_num,
    760                                               info->direction);
    761                         if (!subs || !chip || atomic_read(&chip->shutdown)) {
                                              ^^^^
Instead of here.

    762                                 dev_err(&subs->dev->dev,
    763                                         "no sub for c#%u dev#%u dir%u\n",
    764                                         info->pcm_card_num,
    765                                         info->pcm_dev_num,
    766                                         info->direction);
    767                                 continue;
    768                         }
    769                         /* Release XHCI endpoints */
    770                         if (info->data_ep_pipe)
    771                                 ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
    772                                                        info->data_ep_pipe);
    773                         xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb, ep);
    774 
    775                         if (info->sync_ep_pipe)
    776                                 ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
    777                                                        info->sync_ep_pipe);
    778                         xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb, ep);
    779 
    780                         disable_audio_stream(subs);
    781                 }
    782                 atomic_set(&uadev[idx].in_use, 0);
    783                 mutex_lock(&chip->mutex);
                                    ^^^^^
If it is NULL this will crash.

    784                 uaudio_dev_cleanup(&uadev[idx]);
--> 785                 mutex_unlock(&chip->mutex);
    786         }
    787         mutex_unlock(&qdev_mutex);
    788 }

regards,
dan carpenter
