Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A597E35E1A8
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 21:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953086; cv=none; b=b0FEv7/cOJse8pW6OfpN7KHwDkanN+Hg7DHXkBWYEDY/z//Tq0H8GZBg6x/KTGSML5ekwWZ7eMasqZl2ST3BUAbtIw1rzeU8OhiN4vMWgHTPSkkJI5mcI2dZbiFyf7IXMURmZ7FXcvdwzhuw9ImujDYF4pBWONArimxd7ej5GiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953086; c=relaxed/simple;
	bh=FNQrozwGe9BoZpI4GBh5WAtDpvMJBU/Pn6W9l/5qiAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UxzHYL/49dIxlzbRSgnpTHE6kj+jD31lDA5mBq9TvuZy1aJsoTymUyEhwCcvmxquOZGlRlR4zcNYoalRnZ83chIASzCFrecs/tADxxKiXwFO5oj3olxD4XJ0BHG05F5vkW40ANbQuqc8uaN+Urz7Vbi0Iwf2ex1xpxy9n68dcpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/XmdU09; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9zoPMhV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/XmdU09";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9zoPMhV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SKZiAQ4122121
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 21:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Rz0iVeAXXDDxoPKkN9pDDWOnBof2/EJ5U0hjC8lqJM=; b=d/XmdU09pZ8yo+nc
	TzCjIY/b0FiYQ2jWxVcxxDyNwp4eQQqWHZFiySbnE+lQnwOTRv21/WRjWMJngE0w
	DOb6AzTk8Q7GNX5blHDqBzMYNHHwGbiUnHAu5ghKiw2VdHM6LRS5mQQkPxAf5W6t
	ICd08KNVa7ez5tXLhHU2pPbSZEazlucx4/gwdKuNpn2jsxlPZR9a3hUL/x/tcgIQ
	0gcQw7ruUahoA8T62r+RWZ3UBOw/7ncQxN3chHupUtHTZVC1A+Acj5p+k0mSUHLx
	3qzBlDFezDSyxFrHPmyRmfqiEK/DbNOWkl0QsLmwYtZddHR8V5yYr4YGKPb903SV
	9OqXeQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbhgq859k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 21:38:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so2720549a91.1
        for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 14:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787953081; x=1788557881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Rz0iVeAXXDDxoPKkN9pDDWOnBof2/EJ5U0hjC8lqJM=;
        b=i9zoPMhV06IBzHtgqjABBfgEZcVbK/U762KKDEpZqa+YPJJGWxJeok4I0udrfaOc2q
         bkvhNQRSPd+wbGgnWKyFq2EdgeZwMSWl7Xy23juzhj3ljqjgwGHq8lcoqjklkKRHqRqI
         Ayj+HYvxYpBbSzUnLw4jjT9QG3mIv7PADmxsRBY4LLfslErdUW1BqxwxkfeTUeCooSyn
         9fID19NlR1ZdgKQB+fPaN3eW/olqmPmv2Qon9Baabo3pAxa8MCdeQtxcDTwVqV34wx9h
         CXgHzF8Ch6vqeEm9m4Vc3eRmSwe27UEe6WNhg9o9cCvFFiDSrUG16gIaZ0kgRTQfQcqO
         7D2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953081; x=1788557881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Rz0iVeAXXDDxoPKkN9pDDWOnBof2/EJ5U0hjC8lqJM=;
        b=XsxLPBMTUm0wCOpsxyirgInh9saos7vzQ8Rz5CpJObRB3rVVef9vGANgg6+1FE+05S
         AERXCj5Z2R18lArtOYEGYPRdTHWK53NjvXoVsgNe/Obk+sHivREqlvuF4t4+9M38n7zL
         APljq2vnroUxHoZ3fe23Z0Mkxi+O/JwDXW2pvxC2JKtvNU3K+gBLrOSGiVTqbkVwIy24
         /Ny0nJjhg9WwKfuhebUwjYgS9FNaAKKMgELKpg423HQUWV7TrGfAtUfNVvDRR4Qr3Dnb
         MuX36YKrT0aekelTdRPgGumdJLwdOWwQR0LQNQhvDJJNraeSkTunR3XSN9pk4uTP/Gwt
         d5FA==
X-Forwarded-Encrypted: i=1; AKwUvBwSUvTdVIdAuqk0JSV6pOscfSTFpPLdSdAzDy0HOzbbbR440GLl+Vx7iH8ii8+mt1gegiMVqc49BXbLGA==@vger.kernel.org
X-Gm-Message-State: AFuF++lKvVIo0l1YLJr2vmfLQSwWNIwmJxMJr3C1gG5qAIjK12TtH7wI
	XqSa0dUT5id06NxP1gFr3+ZyjEl+gqLdzImSx+Y/UCGKcFgnSYatD+vINLRVEdUCeVVrFbSyDGb
	b1x3Zfwp54QgiZofYmYhsJ6nLNjgcwJHP6Zlrc99C+goWjp4WF4/qlfQBqwopCDXngUsczIUpJw
	==
X-Gm-Gg: AYBFou2n4G02ypT5ad0xeXXArxN1IIEw/RaO6M3pNDEvSGA40mO6lEKVX28wwIWDuLW
	aAEA1JXKQS7TzC+sH5evq6ULIGqRpyUlZg7SgmdTmk1+qzDP96eZXk3GS5Bkvt+fDcQ1ja7d08H
	jr8sqrsOgGTt3GHiLJ8Y/1TMS1ioXMuP/8kNu79X8NQCYh8lZvw9cR3yXk7gfNYqxTvTzKMHQq0
	RCr9O5fKIaroxtQs2nN9Bd3el2DbYNNjxL9t1MqDEpErYG3l8Mlsvldjm19OmPnYKltODnzEHr3
	vduK2YVRImuZc0U+5HIkcI2HAVoKg4z7TT654oYKvZhz0iiyAEA+agTNJjXj1vnksXd4T6HLFOJ
	8OA9skmdbLBCO26tyfFtRnbd+EMQXLH+RHgFf0zCyIjdvtDmTSw97
X-Received: by 2002:a17:90b:3a05:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-3989be8ead8mr4014476a91.22.1787953081168;
        Fri, 28 Aug 2026 14:38:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3a05:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-3989be8ead8mr4014412a91.22.1787953080676;
        Fri, 28 Aug 2026 14:38:00 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm5892112c88.11.2026.08.28.14.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 14:37:59 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:37:56 -0700
Subject: [PATCH v2 4/4] ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on
 16K+ page kernels
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-16k_offload_v1_b4-v2-4-8a46369ebbb6@oss.qualcomm.com>
References: <20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com>
In-Reply-To: <20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 1BozTKr5fgNbO_4fmKz2SPxC5j1DBkjR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfX5neVjAi/7ygT
 6476EA7QxIvR7r2kWoZPmrzxWB8gfJixecgm4BVBZALMQWkpr2rgQCKZeQTKDD2ZSIpaNO5h0C4
 SqgmdyyhBG3AI1WEnagYAMgfLXoDPEY=
X-Proofpoint-ORIG-GUID: 1BozTKr5fgNbO_4fmKz2SPxC5j1DBkjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfX6eczBnuOL9Wn
 Go4/GUTToBz73cV+ngrI/vkQ3UvVYA4GsQUvSOMvcptjySJboannXM6eatXOPZmIQUHeCkQf2ab
 /CU2ZMjc2rERRev5qyIT/ikoIpc5rhEpaaFBTTp+rnw0M5ioaUSZltrFwOYuqt0yIi66BnbQzG4
 Ka6zYFyv2tdKYjHU+GlHxwFRQ17PXktaI7AUMUjNc/k2+8LTJOdPSZrRgDwKWh9+8bFkjIsmenY
 ocoPPqGoGkXMT4AQcBSFCTfe4jjbdzZP2mqxcMM/dTiFp1lO7NabcWJlEX/2EJ/GHamuMNx8zC8
 DKBYqXXKO6HLQ+7hzyFGY2GtjjLPFmTGlhmxDAXcczGGpyQYBJt3cC/2wPY1MWDdKKQfeV6W6oA
 m06sk65P8dDZfBwZqmktovIQifAQ7Mj7HfC2BYU4k0QdIzgp/pdUJ7tQrr97FGPrSUk807x2E53
 PuobCRsNhwIqGZMKKhA==
X-Authority-Analysis: v=2.4 cv=CsGPtH4D c=1 sm=1 tr=0 ts=6a91ffba cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4X7XonqLFEBPzPt-dYYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280188

TRB_SEGMENT_SIZE is hardcoded to 4096 bytes, but on kernels built with
a larger PAGE_SIZE (e.g. 16K or 64K page arches) the IOMMU still maps
and unmaps in units of PAGE_SIZE. A ring segment's physical page can
therefore start at a non-page-aligned offset relative to the segment
itself, and the DMA address handed back for the ring
(sg_dma_address()) carries that same intra-page offset.

Add that offset back onto the mapped iova before sending it to the
ADSP over QMI, so the reported address resolves to the start of the
segment rather than the start of its containing page, and report the
true TRB_SEGMENT_SIZE instead of PAGE_SIZE as the ring size.

This broke the reverse direction: recovering the raw, page-aligned
iova for iommu_unmap() by masking off the low PAGE_SIZE bits of the
QMI-reported iova only works if that iova happens to already be
page-aligned before the offset was added, which is not guaranteed.
Add RING_IOVA_BASE(), which instead subtracts the exact offset that
was added at setup time, and use it for both the cached
data/sync_xfer_ring_va and the drop_sync_ep/drop_data_ep unmap error
paths.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index bd3f84a3652b..d6e4bcaa7239 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -58,6 +58,8 @@
 #define PREPEND_SID_TO_IOVA(iova, sid) ((u64)(((u64)(iova)) | \
 					(((u64)sid) << 32)))
 #define IOVA_MASK(iova) (((u64)(iova)) & 0xFFFFFFFF)
+/* recover the raw xfer ring iova by subtracting the intra-page offset added at setup */
+#define RING_IOVA_BASE(mem) (IOVA_MASK((mem).iova) - ((mem).dma & ~PAGE_MASK))
 #define IOVA_BASE 0x1000
 #define IOVA_XFER_RING_BASE (IOVA_BASE + PAGE_SIZE * (SNDRV_CARDS + 1))
 #define IOVA_XFER_BUF_BASE (IOVA_XFER_RING_BASE + PAGE_SIZE * SNDRV_CARDS * 32)
@@ -1238,8 +1240,10 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + (mem_info->dma & ~PAGE_MASK),
+					     uaudio_qdev->data->sid);
+	mem_info->size = TRB_SEGMENT_SIZE;
 
 	return 0;
 
@@ -1307,8 +1311,10 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 		goto clear_pa;
 	}
 
-	mem_info->iova = PREPEND_SID_TO_IOVA(iova, uaudio_qdev->data->sid);
-	mem_info->size = PAGE_SIZE;
+	/* add intra-page offset so DSP IOVA resolves to the correct 4K slot */
+	mem_info->iova = PREPEND_SID_TO_IOVA(iova + (mem_info->dma & ~PAGE_MASK),
+					     uaudio_qdev->data->sid);
+	mem_info->size = TRB_SEGMENT_SIZE;
 
 	return 0;
 
@@ -1547,10 +1553,10 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 
 	/* cache intf specific info to use it for unmap and free xfer buf */
 	uadev[card_num].info[info_idx].data_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_data.iova);
+					RING_IOVA_BASE(resp->xhci_mem_info.tr_data);
 	uadev[card_num].info[info_idx].data_xfer_ring_size = PAGE_SIZE;
 	uadev[card_num].info[info_idx].sync_xfer_ring_va =
-					IOVA_MASK(resp->xhci_mem_info.tr_sync.iova);
+					RING_IOVA_BASE(resp->xhci_mem_info.tr_sync);
 	uadev[card_num].info[info_idx].sync_xfer_ring_size = PAGE_SIZE;
 	uadev[card_num].info[info_idx].xfer_buf_iova =
 					IOVA_MASK(resp->xhci_mem_info.xfer_buff.iova);
@@ -1585,13 +1591,14 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
 drop_sync_ep:
 	if (subs->sync_endpoint) {
 		uaudio_iommu_unmap(MEM_XFER_RING,
-				   IOVA_MASK(resp->xhci_mem_info.tr_sync.iova),
+				   RING_IOVA_BASE(resp->xhci_mem_info.tr_sync),
 				   PAGE_SIZE, PAGE_SIZE);
 		xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->sync_endpoint->pipe));
 	}
 drop_data_ep:
-	uaudio_iommu_unmap(MEM_XFER_RING, IOVA_MASK(resp->xhci_mem_info.tr_data.iova),
+	uaudio_iommu_unmap(MEM_XFER_RING,
+			   RING_IOVA_BASE(resp->xhci_mem_info.tr_data),
 			   PAGE_SIZE, PAGE_SIZE);
 	xhci_sideband_remove_endpoint(uadev[card_num].sb,
 			usb_pipe_endpoint(subs->dev, subs->data_endpoint->pipe));

-- 
2.34.1

