Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42843296D25
	for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714020; cv=none; b=SAFNMQhJ2OUXGwBblcUXCUE+3c6Mdr3InwrKoq1Cw2PxWxliD2e7x7NJp9cPoRNeHqxk9Npz2pu80l95VyZQd1cmL50gAqvjtWCSmnApgf2UBakg+JF+ytWCUiumudbyfHTw7M5DRDeCcftWMdN26pp5BU9NF2p9mnjGKomSVBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714020; c=relaxed/simple;
	bh=lM6J1u2tRVAC9uilYLU1E0j5zgP+FCRKzIR82z69UGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=flSGuyj6+EbCp+m5U4oikc2LYHmN+N7SSfBqdAshINHmwA0br87te7yu8CX7bZOUq1TO5YYuUDTmvXwRE9gR3AfN1oaoLofOOzzhyhxmT7xHdKl5j/solpKt/M6Goxh83wuFTitlNK8HsziV6Ve82Vwms+v0K1XTBGdnbTBE7xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XzF6597g; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XzF6597g"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso56609645e9.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Apr 2025 03:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744714016; x=1745318816; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HfPskfdk6P+7hmW9CqDhSwkUxt3ZRzFNJ/6Y+a2CHS8=;
        b=XzF6597gttWAGx52TQY9RAazFtQ9ky8O5pumNhj962cwRMPoSDW26uCE1Wq+v+rG70
         Pxz4qiNw9i/ZSKIJ9yIgChixwtLAepyI1NN65MMOAKf9fqE0qeQ1x0nFQDYP6C+DWJ6z
         v3qJkgk7tZl+SuLBQbEVwwYjSHO0ck2M8chN9QTdfdHzXD4NaeDGg7A8evRUX70uE52C
         iq+KHdhcUdYljU8hIIQeCVhXlmtoM46VA5CWPKXeB91+UyyFlGo5S+byqZluBqWCtild
         DxQiIw0jnc6AG9zAGHN3gvgOkT6Bk+tkrBxk+QdFTiV+2Yt19/6m74c2RGZ+hucnzxYZ
         +9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714016; x=1745318816;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HfPskfdk6P+7hmW9CqDhSwkUxt3ZRzFNJ/6Y+a2CHS8=;
        b=Gke0SB4x5k+mSfrHonAz5BfH38PbHkAYU5xiNkD7VJdOXyWbLFsgXWWg/IYu39MwFp
         638SW6zWwopctzMRhT5F6068BwJFif1XC1oui4vGjnbfKDIlrTpaAePwMVroKnOm2i00
         ALQuhcLTaQOAfA9Jp6dmUk+Q8FXbWhmhxJLhpuVNKAUdgwSWtsbhyjq0CU8LgZzFv+GD
         xaFDK2vLMeN4ZEiUCnAzq5dcCrsJUgYv+MVL8jY+PFwRjiPrqk3ZWDCMmUrp06OIkeV4
         aesAMaRfcKI/NWKA9bpN5qogIdhWP8Dleup/dv7Gz1DulCUhgGJHKd3RD9202x547OBJ
         s+Tw==
X-Gm-Message-State: AOJu0YwlFHX6JSN5yRLCWYTuPNqdvLmZyb52uXnmyosajylocKjYp+w+
	4pzUhOqAiDjGkAqaKsfYXH4Lhm7onWy6gZcB1MjOIFS3hoKVo4PBFOkzU0rFOPo=
X-Gm-Gg: ASbGncsyHQ9SbsS6D/wUVYs3NFQ/3fZ1AgJ4pHC8QvK8HMVh9z8eH0qSZ5MSlsR+YO5
	57vj7A7h7IYYR/UMYXF1WGKdA+5aOMhFcyq/5t62ODAYck3opMsR3KWj+aSqt+7mNW4xYBSCg6N
	+0kpVS/+8SufGlXz+yBPYV2eApRgDq6Jg4fsdYCJR1qeaORubbdSbkaAkKAe+jxLVGSE04r1+Bj
	7cOqbAx+PC3dZdmH2WV8z3emmq9FffyUhjisR/Ix6hX1GR7YUNCYODlIy/Chj9ycooreyU0OtKU
	ajQIafeON08RvEFPDcRXtaX5SeQAZK6fhkh3umfAwai2IQ==
X-Google-Smtp-Source: AGHT+IG9GlkvZe/4zRAi8H0JVH9ACzZygu/ktddu4tlRTcovlswzzU2At42Q0PcqOpPfgvB0n410qw==
X-Received: by 2002:a05:600c:1c8e:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-43f3a95dc30mr135390355e9.15.1744714016485;
        Tue, 15 Apr 2025 03:46:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae964073sm13741229f8f.9.2025.04.15.03.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:46:56 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:46:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-sound@vger.kernel.org
Subject: [bug report] ALSA: usb-audio: qcom: Introduce QC USB SND offloading
 support
Message-ID: <Z_45HSk7z296xzMt@stanley.mountain>
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

	sound/usb/qcom/qc_audio_offload.c:773 qmi_stop_session()
	error: uninitialized symbol 'ep'.

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
                                        ^^
ep not set on else path.

--> 773                         xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb, ep);
                                                                                      ^^
uninitialized.

    774 
    775                         if (info->sync_ep_pipe)
    776                                 ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
    777                                                        info->sync_ep_pipe);
    778                         xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb, ep);

same

    779 
    780                         disable_audio_stream(subs);
    781                 }
    782                 atomic_set(&uadev[idx].in_use, 0);
    783                 mutex_lock(&chip->mutex);
    784                 uaudio_dev_cleanup(&uadev[idx]);
    785                 mutex_unlock(&chip->mutex);
    786         }
    787         mutex_unlock(&qdev_mutex);
    788 }

regards,
dan carpenter
