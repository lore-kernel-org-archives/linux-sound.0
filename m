Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B702C0F6F
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 06:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772001976; cv=none; b=Ghl/Y7R6Avs/AMziMU3hhHggOJPskYHa9dcPk/kKU58xI1EraMuLBULmeE8B6NuKUummvyqLXJQLW0xpOyCWxH1p+0XFoSIUKq9KClZ18dPvrVB27U/P0eebrENghyO0FjUQcKqIdJi8XKC/5knMJKcC5BTJHH45d4jjkaQ9In4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772001976; c=relaxed/simple;
	bh=KapOGnfYOh0PXxFD3beN+OUTsZGlUIANBotOvS5qfBU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p4/KVBiWmQ1GK/7sNgX8TNmELbbFyroFJI3J3FqO0hCqvInmPqajY/j8lo8LNxXFZRse+7BY/x2cH2hAtGeu4slgKMysobGUIkRbGfoqqC17EVyn0JsCsJsFrCKwuDtPUlq92Qi82x5ibf6FvS35BIYoU+nBigLoRLmKhzH03YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fOuKXTg7; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fOuKXTg7"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c6e1e748213so4075102a12.2
        for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 22:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772001975; x=1772606775; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QnjS8olMajKnP/sZl5vPFhjp48gpsJXv+tm2dwICITg=;
        b=fOuKXTg7xdPgbuvDQh9UA4vsU2GLSCulXctaJ3hj1RVw7GEuVJaA0ySUC4PYUee2Ri
         9s3TndCsOySG+Leu9bNlX3vCHgj+roHQsdRR6mp9w2l9TKvBIX7CFQmvYH/og0mt3m9D
         yEl1HG1ncHxFdjbPpZDzq+QiLZKnXu4BKNvMDVEFRK4lySAcGylCnNEo503XHA0tLjXY
         NXN/rE9B/b3IzNmKiGxmsQ9+hxtOttbiZgO34R/YnJzibTMowrsG7q2LN+tr6oiSDHTi
         SZ8WDOG3sqC/PKSH/DflhYxC/QYIF2/sAgAe1cjtGMevef0QEfmUwbFPCl7TLWX+1f21
         Ab4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772001975; x=1772606775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QnjS8olMajKnP/sZl5vPFhjp48gpsJXv+tm2dwICITg=;
        b=febwGEpM3ZLZJllOp7VB4i1EKBtJ9AMpW9eF3rh8e4vMHJoeO2VsgnOlzsXbjpkjir
         aN0nDyML4nXoL0/CXPkkhTlOpsi9h/Cj3DKUSfycJNrNeJJ7m+ZD9tQFg1bLS1GOYqyy
         DfyZjKBtlItlvQ8ih9jJJlqtZQlhsLyKrOWw8gAfWg5oP+ZRUg6SdJ/+y17NBhL2H2Gp
         2KjUQz4lRgPVRxARHAVxfj+bfdPuUmZHX0sIWGwLHSmTmzwKVvhLAa9pdcHH9snQ1sKY
         quiRPrpeqRIf7w9MpCjlj5MiPnbe5b+c0IFUnuMR5n9GDyKLdCHB4I99g0/xEr2f90vD
         4xLA==
X-Forwarded-Encrypted: i=1; AJvYcCWk5yX4tGMKfwc9mRUKt1D4y7w6RmVj3+Vsll1fwPfcm7XoQgSaaP/MVhRlmeu/dafRTz0h4NoboYipWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2GM+PbSuKnMmTeVjV6Mr3Yn24inUBpzeI0O2mGEoZWvfCjrOM
	yeqRE2SH+HSPv5q7xj2HVuE9svECrHfn4Uc/aGR0WMdyWjAheE8fs7r0/31V35ySHuC+XNztNgh
	DVquiL0+kj5+TFNh65w==
X-Received: from pgce1.prod.google.com ([2002:a05:6a02:1c1:b0:bd9:a349:94a5])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9d91:b0:394:6208:6623 with SMTP id adf61e73a8af0-39545ed01cfmr12186049637.27.1772001974577;
 Tue, 24 Feb 2026 22:46:14 -0800 (PST)
Date: Wed, 25 Feb 2026 06:45:51 +0000
In-Reply-To: <20260225064601.270301-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260225064601.270301-1-guanyulin@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225064601.270301-3-guanyulin@google.com>
Subject: [PATCH v1 2/2] ALSA: usb: qcom: manage offload device usage
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, mathias.nyman@intel.com, perex@perex.cz, 
	tiwai@suse.com, quic_wcheng@quicinc.com, broonie@kernel.org, arnd@arndb.de, 
	harshit.m.mogalapalli@oracle.com, wesley.cheng@oss.qualcomm.com, 
	dan.carpenter@linaro.org
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
 sound/usb/qcom/qc_audio_offload.c | 102 ++++++++++++++++++------------
 1 file changed, 60 insertions(+), 42 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index cfb30a195364..1da243662327 100644
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
@@ -1597,50 +1612,53 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 
 	uadev[pcm_card_num].ctrl_intf = chip->ctrl_intf;
 
-	if (req_msg->enable) {
-		ret = enable_audio_stream(subs,
-					  map_pcm_format(req_msg->audio_format),
-					  req_msg->number_of_ch, req_msg->bit_rate,
-					  datainterval);
-
-		if (!ret)
-			ret = prepare_qmi_response(subs, req_msg, &resp,
-						   info_idx);
-		if (ret < 0) {
-			guard(mutex)(&chip->mutex);
-			subs->opened = 0;
-		}
-	} else {
-		info = &uadev[pcm_card_num].info[info_idx];
-		if (info->data_ep_pipe) {
-			ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
-					       info->data_ep_pipe);
-			if (ep) {
-				xhci_sideband_stop_endpoint(uadev[pcm_card_num].sb,
-							    ep);
-				xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb,
-							      ep);
+	udev = subs->dev;
+	scoped_guard(device, &udev->dev) {
+		if (req_msg->enable) {
+			ret = enable_audio_stream(subs,
+						map_pcm_format(req_msg->audio_format),
+						req_msg->number_of_ch, req_msg->bit_rate,
+						datainterval);
+
+			if (!ret)
+				ret = prepare_qmi_response(subs, req_msg, &resp,
+							info_idx);
+			if (ret < 0) {
+				guard(mutex)(&chip->mutex);
+				subs->opened = 0;
+			}
+		} else {
+			info = &uadev[pcm_card_num].info[info_idx];
+			if (info->data_ep_pipe) {
+				ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
+							info->data_ep_pipe);
+				if (ep) {
+					xhci_sideband_stop_endpoint(uadev[pcm_card_num].sb,
+									ep);
+					xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb,
+									ep);
+				}
+
+				info->data_ep_pipe = 0;
 			}
 
-			info->data_ep_pipe = 0;
-		}
-
-		if (info->sync_ep_pipe) {
-			ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
-					       info->sync_ep_pipe);
-			if (ep) {
-				xhci_sideband_stop_endpoint(uadev[pcm_card_num].sb,
-							    ep);
-				xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb,
-							      ep);
+			if (info->sync_ep_pipe) {
+				ep = usb_pipe_endpoint(uadev[pcm_card_num].udev,
+							info->sync_ep_pipe);
+				if (ep) {
+					xhci_sideband_stop_endpoint(uadev[pcm_card_num].sb,
+									ep);
+					xhci_sideband_remove_endpoint(uadev[pcm_card_num].sb,
+									ep);
+				}
+
+				info->sync_ep_pipe = 0;
 			}
 
-			info->sync_ep_pipe = 0;
+			disable_audio_stream(subs);
+			guard(mutex)(&chip->mutex);
+			subs->opened = 0;
 		}
-
-		disable_audio_stream(subs);
-		guard(mutex)(&chip->mutex);
-		subs->opened = 0;
 	}
 
 response:
-- 
2.53.0.414.gf7e9f6c205-goog

