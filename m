Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA163350A27
	for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 10:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770977366; cv=none; b=UzFyx1J36UCLkdlHbeFpGhuW48SrNzglNjAgtWgUYKnxW8KW3aMAsFDr7+WGMASzMPCQ7CUlRc6yYHpV3TXAoOxi0eiAjIFnnoo9w61+chZ4Yb/ByZxn5THL7wfTyMnwTUagbiQjBLUDEvwjytyc1geC6RUQOotJxe44rnezZxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770977366; c=relaxed/simple;
	bh=nEMCIOnsanEJMnLYmB5e41nP6UMT7vo619hj5X6ToIQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VzavKRia3V32qbm0sqLOLEeZNMrq3dfTIU22hcBfer6/xZUO7nR6CsNlO67T5sMk5xJbHkGtogHwH3pDkS/KGl0BH8sOu+ou8yGWMN3A/LHxtbU9gyLN2zRz8SsWJH0PVDbUK9BLFzS5ltRqeAB/KGobqnyqgLfeufPhp29nVVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qrRATXF/; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qrRATXF/"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-353c9d644b0so644564a91.2
        for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 02:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770977365; x=1771582165; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6H578zF40bIvw0kW2/BZM5eR8EPStj53jblRqAXiqY4=;
        b=qrRATXF/DSXdU5UJqW3LPIGgJIjEkRjTN89lmtG8kzDeaVlcTM9S9JQfUKnaSqYbJ/
         wBDPU7ZBCc365c0JAoPccaWcOJgCXDHTSnZebvwPuChdTSAAWxILFscDniFsqXPawIpn
         ed46QkXBKjKjt/W51iU52UB1FevqK+yT5JflHmH3s+DfsXSHxy5+WKfaQ8aXA9K249pq
         jw+Z5BFrU3IcHwG5EZMVPIexP4NS3xc3Y/l+qCt6KzPMTmi6RXQzqhWjPyIwPZCDB0UT
         9LOSE5PKkOiw28RdCcMLYlRVIB8xZRdxODfseQnfGyzNnX3eNatbCkKgX8Dr7s5Mk3jB
         l9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770977365; x=1771582165;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6H578zF40bIvw0kW2/BZM5eR8EPStj53jblRqAXiqY4=;
        b=ZR6cU9Wx0TbEmbsF1N+XHa+6T05UFOMKitfBiZeWpDJbnjvlL/gSbPAZwgXt+ZGauM
         C4fP9Y4mojALhmRQfrNzUK2DaPALgeS5PHM61e0UGWhVpwwmoZxhri2YA9ZZwTHBz9fq
         BzpoAT+1lAuUTi1MqIUbr17kfQRc0vq2BmWHjkcYrK70LkH+eQ7pYyuuF2rZnb11aH4F
         sB1m8qxF9liltCElLm0nIsRGOa1hOM6UORYVmw5wn4fGWdyLKp0t9thIh8ZB+1Hi+XSP
         GxscoYiDphR115pL3odahtHhsbsLiJGGLSnGilCR34VpfmLuLPulTG+Bu+KpxlidYq8k
         5RiA==
X-Forwarded-Encrypted: i=1; AJvYcCWcb+3SQfW7+vY8p1k+wbo6WAliaU88NzUaZFKIqo8+xGXq26yhA8CmEIFoj9xAhwcQHJiRoDGmpA5tLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybhmiX6vSnOJHrFt9moQkqqZTFcPefRnrLDJN8piYhK75dyzym
	3d1zX1JcR8mNu7IWaf6ZCOi44UHjcvXS57X27xWiAnDRhBxO3IRfBOFg/sRMnHHhmGawPhh2Bt6
	2iiguVnMDXiXQ3PaL3g==
X-Received: from pjbbx10.prod.google.com ([2002:a17:90a:f48a:b0:356:28cb:9650])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5550:b0:354:a065:ec3e with SMTP id 98e67ed59e1d1-356aad900fbmr1526714a91.26.1770977364914;
 Fri, 13 Feb 2026 02:09:24 -0800 (PST)
Date: Fri, 13 Feb 2026 10:07:36 +0000
In-Reply-To: <20260213100736.2914690-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260213100736.2914690-1-guanyulin@google.com>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260213100736.2914690-3-guanyulin@google.com>
Subject: [RFC PATCH v2 2/2] ALSA: usb: qcom: manage offload device usage
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, perex@perex.cz, 
	tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	harshit.m.mogalapalli@oracle.com, wesley.cheng@oss.qualcomm.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, Guan-Yu Lin <guanyulin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Qualcomm USB audio offload driver currently does not report its offload
activity to the USB core. This prevents the USB core from properly tracking
active offload sessions, which could allow the device to auto-suspend while
audio offloading is in progress.

Integrate usb_offload_get() and usb_offload_put() calls into the offload
stream setup and teardown paths. Specifically, call usb_offload_get() when
initializing the event ring and usb_offload_put() when freeing it.

Since the updated usb_offload_get() and usb_offload_put() APIs require the
caller to hold the USB device lock, add the necessary device locking in
handle_uaudio_stream_req() and qmi_stop_session() to satisfy this
requirement.

Cc: stable@vger.kernel.org
Fixes: ef82a4803aab ("xhci: sideband: add api to trace sideband usage")
Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 sound/usb/qcom/qc_audio_offload.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index cfb30a195364..6bcb6033e688 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -699,6 +699,7 @@ static void uaudio_event_ring_cleanup_free(struct uaudio_dev *dev)
 		uaudio_iommu_unmap(MEM_EVENT_RING, IOVA_BASE, PAGE_SIZE,
 				   PAGE_SIZE);
 		xhci_sideband_remove_interrupter(uadev[dev->chip->card->number].sb);
+		usb_offload_put(dev->udev);
 	}
 }
 
@@ -750,6 +751,7 @@ static void qmi_stop_session(void)
 	struct snd_usb_substream *subs;
 	struct usb_host_endpoint *ep;
 	struct snd_usb_audio *chip;
+	struct usb_device *udev;
 	struct intf_info *info;
 	int pcm_card_num;
 	int if_idx;
@@ -791,8 +793,13 @@ static void qmi_stop_session(void)
 			disable_audio_stream(subs);
 		}
 		atomic_set(&uadev[idx].in_use, 0);
-		guard(mutex)(&chip->mutex);
-		uaudio_dev_cleanup(&uadev[idx]);
+
+		udev = uadev[idx].udev;
+		if (udev) {
+			guard(device)(&udev->dev);
+			guard(mutex)(&chip->mutex);
+			uaudio_dev_cleanup(&uadev[idx]);
+		}
 	}
 }
 
@@ -1183,11 +1190,15 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 	er_pa = 0;
 
 	/* event ring */
+	ret = usb_offload_get(subs->dev);
+	if (ret < 0)
+		goto exit;
+
 	ret = xhci_sideband_create_interrupter(uadev[card_num].sb, 1, false,
 					       0, uaudio_qdev->data->intr_num);
 	if (ret < 0) {
 		dev_err(&subs->dev->dev, "failed to fetch interrupter\n");
-		goto exit;
+		goto put_offload;
 	}
 
 	sgt = xhci_sideband_get_event_buffer(uadev[card_num].sb);
@@ -1219,6 +1230,8 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 	mem_info->dma = 0;
 remove_interrupter:
 	xhci_sideband_remove_interrupter(uadev[card_num].sb);
+put_offload:
+	usb_offload_put(subs->dev);
 exit:
 	return ret;
 }
@@ -1483,6 +1496,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	uaudio_iommu_unmap(MEM_EVENT_RING, IOVA_BASE, PAGE_SIZE, PAGE_SIZE);
 free_sec_ring:
 	xhci_sideband_remove_interrupter(uadev[card_num].sb);
+	usb_offload_put(subs->dev);
 drop_sync_ep:
 	if (subs->sync_endpoint) {
 		uaudio_iommu_unmap(MEM_XFER_RING,
@@ -1528,6 +1542,7 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 	u8 pcm_card_num;
 	u8 pcm_dev_num;
 	u8 direction;
+	struct usb_device *udev = NULL;
 	int ret = 0;
 
 	if (!svc->client_connected) {
@@ -1597,6 +1612,8 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 
 	uadev[pcm_card_num].ctrl_intf = chip->ctrl_intf;
 
+	udev = subs->dev;
+	guard(device)(&udev->dev);
 	if (req_msg->enable) {
 		ret = enable_audio_stream(subs,
 					  map_pcm_format(req_msg->audio_format),
-- 
2.53.0.273.g2a3d683680-goog

