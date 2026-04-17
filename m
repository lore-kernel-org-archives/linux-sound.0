Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B422F99B8
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 05:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776404807; cv=none; b=rXdNgGfR4BqZNPW7pF/dizB9fZsJfm2uAX3xF+EOhPWc5ileEr5hv8XFKrZ4MBwBIQ2WZ2wHxO6wVF4aIrCk8y+47DLvNwhet5eyVyNis0FZam0FTCpStZfBToodLM5QJGsDgW594QGc6AWr5RBgwrw925lhbrokvczjvemgIKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776404807; c=relaxed/simple;
	bh=zuBx2lHMrOhC9tUrkOQKybW4pKf1/wASJ/MwCL932Eg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qJXednYHpy09gDraI+L0eSuWfCg51F8GsVNQ4iyLtcOUs5YFCvB/q9J/vYQgR8w/fz29xB9Di6bP0hWwSIietubK/GZPpQMY6Sszm5d5Fv0hmErB6D9Dw5pTimeVyh8cwmNc/gJnIyN2A/+ac+7v5UfdPmfwo/+NPAWrUBh54DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IRXdCqS2; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IRXdCqS2"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b2523e0299so8574825ad.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Apr 2026 22:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776404805; x=1777009605; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/9OCTEDZMd1ju3ghJZzcgE05vXb4dI6avT3iWmFse2Y=;
        b=IRXdCqS2lfugSUUx9GMkZ+Ge6EdzR3A6BjCAFGrwJGoMPuJmBWNLStlB7oDfqHIL+w
         O3DIdwsiumgmE+oK3W20G+QooDz/LTmkbL3jeIiqnP8w2RIn4cVTCgvufhr+HjEoMn8K
         ywzd0poAFlWs/rDHaViBf+2+n53VduYgzPwmERO1E2MNsovJabgk6s6RlWyd8mR9uVAu
         5+ijkgYdcVgvbjwFzMwdHYkK5Rz+/Sq89tom9rn6gBXlmp1U5JscjTYtwjuM8OBZWrH9
         hfj7qoqkk7y6eXKKaKBqWr/3/zh1nr/EoMYsE7H6UYqhEBC0vITyFlWJ1hQc+5tNiRrr
         eqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776404805; x=1777009605;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/9OCTEDZMd1ju3ghJZzcgE05vXb4dI6avT3iWmFse2Y=;
        b=P2TLBa6pZ6altZdKSu8zvCqUzcE0CAQHoKpmzuz546MhzIbQRfugpCwMwzRkHn0Azw
         Ei6YJZeG0P0KAqz/dqCJc4gau3vdBZmj/OIWZ5Cga3QnB6ClXrXayEZbdhZ3Vc82L9fE
         aNBCqcgaV8LG93MMU/XL4OIcTbBOym9a2EC9nIHgi4xpHCmHEdG6YNtRO6jeXk2oCqqS
         etOd7NpuYIDhJp6CXME/LwHxtCWghjXse64oEpHJ5uc3MiImIky8bkHlV3LyYD0O2YUv
         R/ci7yypycO2hbn3Axi2z1owTm5w+yey/7dlOKqhoCcptLjP7dfvAj0k+jkII7p7+h/g
         bi+w==
X-Forwarded-Encrypted: i=1; AFNElJ8QbAbJ5zDcleCy02YplWJzdrZPyD+Qqho8cDxG787j3rOGLGwD5TbOLrrln1xbO8GuXXIFXN/8/wicpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFzwekH1BedvjEt5+wmPUqqfHCDYY/XyXQaW+F0gwlod2cIXU8
	lQjGgf+n+9hlce7vdwwqODPQF5SG/b31pc2AclPKos7CJ3C1N55mlcCHlIQS7Er4vlthoHZ5n8V
	hQ5egNOHChxL3O1uYLg==
X-Received: from pgbcx10.prod.google.com ([2002:a05:6a02:220a:b0:c66:7f77:eb66])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:4306:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3a08d68f1f4mr1455697637.2.1776404804684;
 Thu, 16 Apr 2026 22:46:44 -0700 (PDT)
Date: Fri, 17 Apr 2026 05:43:30 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.rc1.513.gad8abe7a5a-goog
Message-ID: <20260417054641.3814385-1-guanyulin@google.com>
Subject: [PATCH] ALSA: usb-audio: qcom: move offload usage counting to stream
 request handler
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, perex@perex.cz, kees@kernel.org, 
	tiwai@suse.com, quic_wcheng@quicinc.com, arnd@arndb.de, 
	wesley.cheng@oss.qualcomm.com, nkapron@google.com
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

Centralize usb_offload_get()/usb_offload_put() calls from various helper
functions to handle_uaudio_stream_req(), which ensures the usage count
is tied directly to the QMI stream enable/dsiable requests from audio
DSP. Such design provides a clear synchronization point for the
offloading lifecycle and correctly balances the count for both playback
and capture paths while avoiding redundant increments during auxiliary
operations.

Suggested-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 sound/usb/qcom/qc_audio_offload.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 2ac813d57f4f..cddab55d4691 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -699,7 +699,6 @@ static void uaudio_event_ring_cleanup_free(struct uaudio_dev *dev)
 		uaudio_iommu_unmap(MEM_EVENT_RING, IOVA_BASE, PAGE_SIZE,
 				   PAGE_SIZE);
 		xhci_sideband_remove_interrupter(uadev[dev->chip->card->number].sb);
-		usb_offload_put(dev->udev);
 	}
 }
 
@@ -1183,16 +1182,12 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 	dma_coherent = dev_is_dma_coherent(subs->dev->bus->sysdev);
 	er_pa = 0;
 
-	ret = usb_offload_get(subs->dev);
-	if (ret < 0)
-		goto exit;
-
 	/* event ring */
 	ret = xhci_sideband_create_interrupter(uadev[card_num].sb, 1, false,
 					       0, uaudio_qdev->data->intr_num);
 	if (ret < 0) {
 		dev_err(&subs->dev->dev, "failed to fetch interrupter\n");
-		goto put_offload;
+		goto exit;
 	}
 
 	sgt = xhci_sideband_get_event_buffer(uadev[card_num].sb);
@@ -1224,8 +1219,6 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 	mem_info->dma = 0;
 remove_interrupter:
 	xhci_sideband_remove_interrupter(uadev[card_num].sb);
-put_offload:
-	usb_offload_put(subs->dev);
 exit:
 	return ret;
 }
@@ -1489,7 +1482,6 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 	uaudio_iommu_unmap(MEM_EVENT_RING, IOVA_BASE, PAGE_SIZE, PAGE_SIZE);
 free_sec_ring:
 	xhci_sideband_remove_interrupter(uadev[card_num].sb);
-	usb_offload_put(subs->dev);
 drop_sync_ep:
 	if (subs->sync_endpoint) {
 		uaudio_iommu_unmap(MEM_XFER_RING,
@@ -1605,6 +1597,12 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 	uadev[pcm_card_num].ctrl_intf = chip->ctrl_intf;
 
 	if (req_msg->enable) {
+		ret = usb_offload_get(subs->dev);
+		if (ret < 0) {
+			guard(mutex)(&chip->mutex);
+			subs->opened = 0;
+			goto response;
+		}
 		ret = enable_audio_stream(subs,
 					  map_pcm_format(req_msg->audio_format),
 					  req_msg->number_of_ch, req_msg->bit_rate,
@@ -1658,9 +1656,11 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 			uaudio_dev_intf_cleanup(uadev[pcm_card_num].udev,
 						info);
 		}
-		if (atomic_read(&uadev[pcm_card_num].in_use))
+		if (atomic_read(&uadev[pcm_card_num].in_use)) {
 			kref_put(&uadev[pcm_card_num].kref,
 				 uaudio_dev_release);
+			usb_offload_put(subs->dev);
+		}
 	}
 	mutex_unlock(&qdev_mutex);
 
-- 
2.54.0.rc1.513.gad8abe7a5a-goog

