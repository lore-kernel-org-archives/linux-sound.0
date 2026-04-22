Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73B03624B5
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 02:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776824936; cv=none; b=fg2f3+Gt0VvkBXRuqkuPyIg3N2hIrECvHx2UhMj0UwWzVDZ8kwcl14f2vXrPncXi9QPTrGyWLXm5o6IVgzHpY2Ofimir0ZIlsCT3uQ9lK9wXf/dVG3QBiB6BCdLxfeaj9Rvsy6ZL+eAWocuGOkW/W+J704IffXIVVKSTKjIP5fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776824936; c=relaxed/simple;
	bh=vH7XvGxiEzeJbWUkoGUs80Izt7he/vcvT09JGqZUvxk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MyzxQKAsJvPlkpDwNNsiia/+SAIiNy3E9eH9N4roDkPVPUa/SsIdM9FeRpJ+62rj4O3LMv8AQkq7jV9H6D1HP0CR356vnrIS8ZIRpLtNKVWeWA9ZWfgB7amCaX7/lEQjxnNxUnCYmK97yr3s9CVofKh/wpp9gRdVKoKfb7Fk0Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TyDcs4y8; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--guanyulin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TyDcs4y8"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82f6a5b4f88so6715448b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 19:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776824926; x=1777429726; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eLlmK95IKP9UuAoAlUFLXcBo6WK00dlUYN9hpEKXLIg=;
        b=TyDcs4y8tJPb4w2xlqUBiGR0OClOKy11WR7J1ZqEj37llMi7HpJ0ki4RZ0eFZlGmi0
         cVpx0jtbPlozgrYp9TAhmcmMwBGcAFpfIB6Grv+l79cUMgL7QxvgCx01wLn2F/ez6frq
         Y8J4mhzHDuiyK/maTK00fDvNn6MZ2ryDfG50iUI4OtoWcdoPh6cJH+GnhJNAkYvY0oQX
         B+LdZ+jIK79DV69DD3hAiu3yPwUGJt2cUNkIfk1adZHOIRRejH8u2K6oLfveHcmRamxA
         Ph6/p+nvfbhHuyPkkuDosSx9dZP1tkjS03HPRp+PXTqE2clKS9yr4A++PrRJ532VPCT9
         r7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776824926; x=1777429726;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eLlmK95IKP9UuAoAlUFLXcBo6WK00dlUYN9hpEKXLIg=;
        b=X5AAL+RSIJU1KcMEvO5mNtvcfad+c2KHUqze41Mxq/wkDbutWoj6CjwngNRvXMK3+l
         s7+vSeyCEryhb7WK8C7Y1reY+La8Xqty7fnGpDZBIbK1Go6ldUPWjT8jqw3hhCHNBrZ4
         6aV+HJ8NlHexIfaR6KppDeM5J+nrtuEsYZIm/ISGo9CUtSjCBpR2sO9nux1mtPBVOmxZ
         yr31y4vYg10dKMA716zWjcZePzD7kbpoAKINC+qA8dNeCplXBaric+njJIev1qbGfNQb
         iomFndOVr4K9C7YnAvoLYczVe45LULuXM+wILT+jxtvguqQM8gBarplnLyCQlpvrrcWY
         uz7w==
X-Forwarded-Encrypted: i=1; AFNElJ+Mo9nH4H9aJynCRsXTU1qIj4QpZ7kax4zoMH1aXhYht+8UoP/vg3FhLukH69QXvF1LThKcAKZlxmo6sQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyK03hFzUp69kURn+E4UP2T2a2DtT55Co2k/2CXT/ldVN2vXae6
	cSPxQqECav28xccL+iVT5YCjpTLnM9OezE1Dad19rononQQbLw/X+5pq4oK7Y1QKVMkTpcfV1Y1
	z0/dTpdL7dz7fKtGEjg==
X-Received: from pfuw1.prod.google.com ([2002:a05:6a00:14c1:b0:82f:a366:f295])
 (user=guanyulin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1f09:b0:82f:b5:8044 with SMTP id d2e1a72fcca58-82f8c7dec94mr20491369b3a.6.1776824925524;
 Tue, 21 Apr 2026 19:28:45 -0700 (PDT)
Date: Wed, 22 Apr 2026 02:28:39 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260422022842.1543366-1-guanyulin@google.com>
Subject: [PATCH v3] ALSA: usb-audio: qcom: move offload usage counting to
 stream request handler
From: Guan-Yu Lin <guanyulin@google.com>
To: gregkh@linuxfoundation.org, perex@perex.cz, kees@kernel.org, 
	tiwai@suse.com, quic_wcheng@quicinc.com, arnd@arndb.de, 
	wesley.cheng@oss.qualcomm.com, nkapron@google.com, 
	harshit.m.mogalapalli@oracle.com
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
V2 -> V3: Fix canonical patch format error
V1 -> V2: Add error handling path in handle_uaudio_stream_req()

v2: https://lore.kernel.org/all/20260421094337.740485-1-guanyulin@google.com/
v1: https://lore.kernel.org/all/20260417054641.3814385-1-guanyulin@google.com/

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

