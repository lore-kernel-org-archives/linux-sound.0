Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87768345CCA
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776764623; cv=none; b=s28WByPavsPRK0VmkhlqoUaWqdKK0nAfv12SPmy5gv02HSLDk96aEv/5ZDRxEumBUrahKDC45AluYRRZEf/ICXSfCvxHhfc3Cl0hITpzEVosWOASla6wM9tvcKV32fEPM+26487I+xj47JYXtMqw6W8GDUO1oRLbvwc5/3PIgao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776764623; c=relaxed/simple;
	bh=/FnxmEJ1TL25VoHztH2ITWokV5Acev1L/sllLt8ObBw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QJiEYmC0pboeyLC94Xi3nA7jJM97JipIRfdMFTDbBtNtjOpKrjSHRbCBCqHu7thTqM85oSp+zZWCn0T6eToQZgEfHreRaefYtGTOafso7teygMHs3xtpCjCttxd7TvO2vDhCGifHLlfheLrvnPcMFsHg1hb75f+E1z4O0G7fAeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eDEw2YB7; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eDEw2YB7"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35e56ed5d5bso5749147a91.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 02:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776764622; x=1777369422; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z9/TsGvPXcj44YjRZTn9OYHmV4pYFirfCXBCEtOgz3s=;
        b=eDEw2YB7NhyatGuPBK4EB1349EdWrWF9Rz9jBfGAo1xQlPPbvfb3BnVcHkiydnvjYI
         UgfbWfGRtNL3NxNMplMa3jYv3cGfOhkLlH0XeIGoAwqK2PaQSk8rIipTij0U1V3TKvqi
         0lwR2/lF9+yGpv+sXpU5dESzF/XvJinaBg85LNnQlDoyos8eteo/HZekwkTK69D+L5KJ
         8KiOtnNEZ+7Z9uw0bhzhC1+2dHdOn66Z8+dak5xwai5+x1qhEKHXu8MXXTGpXzlVuAir
         T/JB5nvpDZ2UX1QQt/FvU5ZxYfm4uyccaF1YGnorJ3lGYrF7wt89HCXdFotPsz24Eu1W
         gUug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776764622; x=1777369422;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9/TsGvPXcj44YjRZTn9OYHmV4pYFirfCXBCEtOgz3s=;
        b=X/tIfJISfYOvC6TL7E7sxXLHLR4agC021yMDGyFpJ+pXJ3GtGgTNue9AvyH8cFY9C9
         inAlv4TJgH2aSDSyAvZcOLCiIpGHzbiw7gW6iKlbALXv9olZ5hDiHNoJjhG40Z5eYI5j
         H5M6eRjwaWIQgzkYn1NjhbDslvrmJYg/vbFeTgXmMf8YPmDvzEvnaYR0eSSfNpMak72/
         Mfiv8GHfrxwBc652bxwCh1b8+9IkaNoab0rYtIOSA0RxlfkHtL8pbczqj5S1o9OPhBKh
         W53n1dj0yAD6dEsi2GHNpLCRJfsKJju/g1TiUSBE2Q3WAIyWInCXOfyQV6Q1RdJShSNP
         8xJw==
X-Forwarded-Encrypted: i=1; AFNElJ+HdU5DOrrEJK1ie08bdAIOqC6ZHpCbJVEAMcSZ9g12yN31blIQPx2S/WG4Yp6Kj0s3QewI4AQpGSwy1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAyFWRDpBNzRsogMeDGIg59OmTZu8qycfZRA9g3dNBMj831KX3
	FDBHFdDO23OPSFe5DGH/xozqxJ0PFdcG1bZ75rdejaMZIhno5VMVRx40ePiJaFEAi+Wtl0J8q34
	SgpVY1dwkGxh33qa1Vw==
X-Received: from pgbdp2.prod.google.com ([2002:a05:6a02:f02:b0:c79:74ce:b2a5])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3d82:b0:39b:af8e:496f with SMTP id adf61e73a8af0-3a08c910f4dmr14575059637.14.1776764621620;
 Tue, 21 Apr 2026 02:43:41 -0700 (PDT)
Date: Tue, 21 Apr 2026 09:43:35 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260421094337.740485-1-guanyulin@google.com>
Subject: [PATCH v2] ALSA: usb-audio: qcom: move offload usage counting to
 stream request handler
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
 sound/usb/qcom/qc_audio_offload.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 2ac813d57f4f..6b4349d85665 100644
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
@@ -1614,6 +1612,7 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 			ret = prepare_qmi_response(subs, req_msg, &resp,
 						   info_idx);
 		if (ret < 0) {
+			usb_offload_put(subs->dev);
 			guard(mutex)(&chip->mutex);
 			subs->opened = 0;
 		}
@@ -1658,9 +1657,11 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
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
2.54.0.rc1.555.g9c883467ad-goog

