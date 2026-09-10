Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2651376BD1
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 01:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789005073; cv=none; b=jNNrABoV+fJo/sRVOgTMyFpnAtPSVlUMmpRKIUMjcBKGZ46JqUf6wpYDOiuQGT7s4JRD6U+9i7ePMrLFGKwD9YQoLs4qfnVfZcPxmlOkzaQrAZuAGpAJXVDPGjoJSCqSQBPLU9q8qu68CxNWHBHdsz6sl0Qhug3XldsnH47heCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789005073; c=relaxed/simple;
	bh=ErTbnNhn3Icw19SWQ9dG6pRskDLs8W/CJuJN2DZ3Byo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gUeRJMWZhnrU+T32xHIVDrnx1sVbqC3SuHA3Lh13ocwiwd012RbL/srJyeY3c8Xzjeegk85HIruxZSgVia7oD46KciLVOv07q7Hf3FWFOQGZJnXpccYuE1QhiUp3bOPHE1FCkO6NOIBnTGJOJ1j5O3pbtGl9Q7JpSAIBKC9pG/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCZ2aePf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pr9mo189; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCZ2aePf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pr9mo189"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1lRjc4054740
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 01:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	imASvVJhKjiXPIqBSU3/Ev92EBtBW9MXWBIV8CDpb68=; b=QCZ2aePfCwk6CkJi
	eG7ML5uKb0zrPnRjAAExEo9Ux5kKKFXBMYoTL/5Wg/QSRXDXqIoHU49hgEhz5orm
	U4KVypIiOXJpsi0IPEJoHHhfEpQm9e7fxKruI/jkg8HyrBOO7B8G3I5T1R9VGT0L
	f5uU7sZNZhj432s+OQN/50wQacMZUTLhTG5ewGBHNom7UyZLPs2kULRpl/VOWmQt
	FLhyJyltuObi1ljvBktFF0+0Ou2+xxmUnSB0erP/legyYl4Z7zo5z+D1B9VvcDCl
	nJr1nHpmKGxtCqR5b4hT/IsErE0r42mW7HiqggJm1uaaWDNlKWepzB1zVz63b3go
	4ClKFg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg1gy5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 01:51:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4afc810bfso455571a12.0
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 18:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789005069; x=1789609869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=imASvVJhKjiXPIqBSU3/Ev92EBtBW9MXWBIV8CDpb68=;
        b=Pr9mo189r47dZqaCiSBNEMXcZJ8OWCxR3vDiBXhMBIMYEUhxd+YFREePSF49BKkkP+
         enLs//NKwk6//ex+iGPGp1WJGMf2wFY/fjOizkVKc1Sk404h2GXTIqB9X6jyKq6Z14IY
         cOg1Q2+gj22UgizmdXPCnFH9WjzmTfs1lbFzdV+jGXd4zoGc7psV+bJgZiCKAoEWltIi
         6cXRY8AHAzirEscNxt4vE0fE1frbu+jIWCe6FFJxs8SdxdSbpXHivsww3rD9eNNoUKMo
         AjxYhiNi/sbk6pPLa/bp7N0P6AzUgi1VpB23/5JKgU/ollEDJzDWygpyV6roGuLkXnT4
         G9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789005069; x=1789609869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imASvVJhKjiXPIqBSU3/Ev92EBtBW9MXWBIV8CDpb68=;
        b=ZsUJSTKBh/KSZOY1g+CHNSQLzMDqo2kYBqldOAoMgHrqNE2Lul0FRG0oFhVUfbMKVg
         EAJAHT70GDRNc6ud7ytQ5Git+EJ8CjwmD75WeC771I6NCbOcdASXJ4c2xedqG9y0aZLT
         Zktckke/zHGz6ubMhj/EFo0ulMVZPs32YWYutjaW84OmZb5g7WM7yI5fQo0CG/AlO4nd
         HuGAHa51e7l5D2lUUW71K8+lOfKZj78j/i6qXJidL5rfJztuo9FO3qGtFHud2vByWp7C
         cg7OalYPHlQ8KvTFyLxKP/njnElVqfGRnjaF6VBckyCIa4hr3TK1tuuH6K+Y/WWRlDLF
         Ezyg==
X-Forwarded-Encrypted: i=1; AKwUvBwjGcG3e/XrUQJbSsRESZ44a1exW/AFgp+2qSyOgicIpxGJU0q0nfq03UheA0lF1I8/bWlKF7BbtUGoLQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lq9+2VHMSEaahhgx30qRfBVM5yviNQFxRUGM8/AJ+GYe377hAN
	w0lUj5evn8qITsLZtfg75az+R7HgOMv4TRPZbSLCyUzlmSg+MNY8LKB0z5R4IF0rUzo9IZptf4x
	XY+TgL+YGB6k9S0qxKQv5Rh9tP963VGCE9DvxGWYgVSpCv63jMxdBvbdPYsGVodwmh2Bs/6YcOQ
	==
X-Gm-Gg: AYBFou1O2tU9cIRTbDxHd1BghMJIhnvZjttKBPGS+0esL2nWp4oI5ukWpZkrvpJLUBa
	AsOWdh7TI6jCs5RCXBtZEbKw3XkuaTEx44HtdKKtaEpnBhLOh73R0jYFjl1NO7TI93XkTl8Dt7q
	c5ItU9Sg67QjDsV1m0l7h8DlnX9Cjgg5v60YCnNK6vDbMdceL1K6djeAm9x7jexxj3ep5UJfPmR
	zkYrzGmy5Jm6hoVzrODwB5sCUyfffP70NBKO+AGkGQk2tl1MePqu6f38Dx2dtrMrEpK+iJO3iai
	9BZyAcyAbYe5jbKrhLJFF0TwEIig/Eo3+Azk65clE+f597vNetGz82J1qGz8NLQWWaMwRiFpIzI
	3a5jT39nMqFh+u+SfWkBZDaEwIuS9QlqrvIDpD6drbvwcMa4bbpzI
X-Received: by 2002:a17:90a:fc4f:b0:396:669c:b5f6 with SMTP id 98e67ed59e1d1-39d7796cf16mr2864269a91.12.1789005068370;
        Wed, 09 Sep 2026 18:51:08 -0700 (PDT)
X-Received: by 2002:a17:90a:fc4f:b0:396:669c:b5f6 with SMTP id 98e67ed59e1d1-39d7796cf16mr2864217a91.12.1789005067781;
        Wed, 09 Sep 2026 18:51:07 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm47446234eec.12.2026.09.09.18.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 18:51:07 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 18:50:59 -0700
Subject: [PATCH v4 3/5] usb: xhci: sideband: allocate sideband ring
 segments from a dedicated pool
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-16k_offload_v1_b4-v4-3-f24a86617597@oss.qualcomm.com>
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
In-Reply-To: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=YZYodARf c=1 sm=1 tr=0 ts=6aa20d0d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4UCl4-NCj7P3W_cXDs0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfXxsAqCVaYkhGS
 0zc60FRYr/+okQHpIYBuKx269d4s9NCKHDV9vxR44tUg5CF2TIH6xK7qoKmyl9yJbqy15d7/uod
 ySvMup2Q7EnCZHcmbz3IvSdyhGbB+GI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxOCBTYWx0ZWRfXxfn9Ov+olVnd
 W1JOI9DxiIC+Kw0uIjq3TCJK+pw7GuHs6zZiftOrijE04MIMQMEVBe7t/F5B4bIByf4F1UNpP2p
 WOBP25EEwLbO9kdLCBokt76EKSmeymk+9s3H+qvHaHZFvPxCXfE67BwyQpRqcwqZjiQ09fdWgHr
 2AZUikAclv0BLVWH/WsLP7K64Zl29zb/K+sjozc+5nAcD7YS62rFtBCECXMSk2j90eQuoLqAhLD
 SEId6K8OwhU5Iz7lTgVX6UayeBjKvyXsM6Fi7kqAYb7oZD/IW6biT/wLbdSxvULmRKTvMjODvIx
 3mNfxas6yPAGHSO+o/aP6WCASaBIHo/sfcrwbfJeX3n4F2PHGvnUsHlev0mzCKMhguaxZgg8jRi
 23MwFzDUg/65fbEkbv0p0zjN08ZFyN6Acy6W00Ji3fiHh/L8F2uY4jedXlymXk1nHx3DlN0xxSN
 Rgm7hkbrmNhqLmnog0w==
X-Proofpoint-GUID: IubXv4GoMCHPGlA4wm26SqoDwZEd3LJ2
X-Proofpoint-ORIG-GUID: IubXv4GoMCHPGlA4wm26SqoDwZEd3LJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100018

A sideband client that maps a ring buffer directly via the IOMMU
(which operates at page granularity) needs to know exactly which
page(s) back the ring, and only pages that are actually intended to
be exposed to that client should ever be mapped this way.

Allow each xhci_sideband endpoint to pass its own segment_pool, allocated
separately from the core xhci->segment_pool, so every segment backing
a sideband-tagged endpoint always comes from a page that is meant to
be visible by the entity handling the offloaded endpoints. Normal
(non-offloaded) endpoints are unaffected, as they keep allocating from
xhci->segment_pool.

The offload client owns the pool's full lifetime, and since
that lifetime is no longer tied to the sideband instance itself,
xhci_sideband_unregister() must free any ring still backed by a
client-supplied pool before returning, rather than leaving it for xhci
to free later when the client and its pool may already be gone.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-sideband.c  | 38 +++++++++++++++++++++++++++++++++++---
 drivers/usb/host/xhci.h           | 10 +++-------
 include/linux/usb/xhci-sideband.h | 20 +++++++++++++++++---
 sound/usb/qcom/qc_audio_offload.c | 32 ++++++++++++++++++++++++++++----
 4 files changed, 83 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index 274da38f333d..1bb6e5034b58 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/usb/xhci-sideband.h>
+#include <linux/dmapool.h>
 
 #include "xhci.h"
 
@@ -67,6 +68,7 @@ __xhci_sideband_remove_endpoint(struct xhci_sideband *sb, struct xhci_virt_ep *e
 	xhci_stop_endpoint_sync(sb->xhci, ep, 0, GFP_KERNEL);
 
 	ep->sideband = NULL;
+	ep->priv_seg_pool = NULL;
 	sb->eps[ep->ep_index] = NULL;
 }
 
@@ -113,6 +115,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_notify_ep_ring_free);
  * xhci_sideband_add_endpoint - add endpoint to sideband access list
  * @sb: sideband instance for this usb device
  * @host_ep: usb host endpoint
+ * @pool: dma pool to allocate this endpoint's ring segments from, or NULL
+ *        to leave the endpoint's current pool selection untouched
  *
  * Adds an endpoint to the list of sideband accessed endpoints for this usb
  * device.
@@ -123,7 +127,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_notify_ep_ring_free);
  */
 int
 xhci_sideband_add_endpoint(struct xhci_sideband *sb,
-			   struct usb_host_endpoint *host_ep)
+			   struct usb_host_endpoint *host_ep,
+			   struct dma_pool *pool)
 {
 	struct xhci_virt_ep *ep;
 	unsigned int ep_index;
@@ -153,6 +158,9 @@ xhci_sideband_add_endpoint(struct xhci_sideband *sb,
 	ep->sideband = sb;
 	sb->eps[ep_index] = ep;
 
+	if (pool)
+		ep->priv_seg_pool = pool;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_add_endpoint);
@@ -288,6 +296,7 @@ EXPORT_SYMBOL_GPL(xhci_sideband_check);
  * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
  * @sb: sideband instance for this usb device
  * @num_seg: number of event ring segments to allocate
+ * @pool: dma pool to allocate the interrupter's event ring segments from
  * @ip_autoclear: IP autoclearing support such as MSI implemented
  *
  * Sets up a xhci interrupter that can be used for this sideband accessed usb
@@ -301,7 +310,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_check);
  */
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear, u32 imod_interval, int intr_num)
+				 struct dma_pool *pool, bool ip_autoclear,
+				 u32 imod_interval, int intr_num)
 {
 	if (!sb || !sb->xhci)
 		return -ENODEV;
@@ -315,7 +325,7 @@ xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
 		return -EBUSY;
 
 	sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci),
-						   num_seg, NULL,
+						   num_seg, pool,
 						   imod_interval, intr_num);
 	if (!sb->ir)
 		return -ENOMEM;
@@ -370,6 +380,8 @@ EXPORT_SYMBOL_GPL(xhci_sideband_interrupter_id);
 /**
  * xhci_sideband_register - register a sideband for a usb device
  * @intf: usb interface associated with the sideband device
+ * @type: xHCI sideband type
+ * @notify_client: callback for xHCI sideband sequences
  *
  * Allows for clients to utilize XHCI interrupters and fetch transfer and event
  * ring parameters for executing data transfers.
@@ -436,6 +448,15 @@ EXPORT_SYMBOL_GPL(xhci_sideband_register);
  * After this the endpoint and interrupter event buffers should no longer
  * be accessed via sideband. The xhci driver can now take over handling
  * the buffers.
+ * Any transfer ring allocated from a client supplied dma pool is freed here
+ * as well, as the client is not expected to keep that pool alive any longer
+ * than this call. This includes rings of endpoints already removed with
+ * xhci_sideband_remove_endpoint(), which xhci would otherwise only free once
+ * the device is reconfigured or torn down, i.e. after the client is gone.
+ *
+ * The caller must ensure the usb device is no longer streaming through the
+ * normal, non-sideband path when calling this, as the freed rings are still
+ * referenced by the endpoint contexts until xhci reconfigures the device.
  */
 void
 xhci_sideband_unregister(struct xhci_sideband *sb)
@@ -458,6 +479,17 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
 			if (sb->eps[i])
 				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
 
+		spin_lock_irq(&xhci->lock);
+		for (i = 0; i < EP_CTX_PER_DEV; i++) {
+			struct xhci_ring *ring = vdev->eps[i].ring;
+
+			if (ring && ring->segment_pool != xhci->segment_pool) {
+				xhci_ring_free(xhci, ring);
+				vdev->eps[i].ring = NULL;
+			}
+		}
+		spin_unlock_irq(&xhci->lock);
+
 		__xhci_sideband_remove_interrupter(sb);
 
 		sb->vdev = NULL;
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 15ce0bb7aa3f..1353d6fa2776 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -19,6 +19,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/io-64-nonatomic-hi-lo.h>
+#include <linux/usb/xhci-sideband.h>
 
 /* Code sharing between pci-quirks and xhci hcd */
 #include	"xhci-ext-caps.h"
@@ -740,8 +741,6 @@ struct xhci_interval_bw_table {
 	unsigned int		ss_bw_out;
 };
 
-#define EP_CTX_PER_DEV		31
-
 struct xhci_virt_device {
 	int				slot_id;
 	struct usb_device		*udev;
@@ -1255,14 +1254,11 @@ static inline const char *xhci_trb_type_string(u8 type)
 #define NEC_FW_MAJOR(p)		(((p) >> 8) & 0xff)
 
 /*
- * TRBS_PER_SEGMENT must be a multiple of 4,
- * since the command ring is 64-byte aligned.
- * It must also be greater than 16.
+ * TRBS_PER_SEGMENT and TRB_SEGMENT_SIZE are defined in
+ * <linux/usb/xhci-sideband.h>, shared with sideband client drivers.
  */
-#define TRBS_PER_SEGMENT	256
 /* Allow two commands + a link TRB, along with any reserved command TRBs */
 #define MAX_RSVD_CMD_TRBS	(TRBS_PER_SEGMENT - 3)
-#define TRB_SEGMENT_SIZE	(TRBS_PER_SEGMENT*16)
 #define TRB_SEGMENT_SHIFT	(ilog2(TRB_SEGMENT_SIZE))
 /* TRB buffer pointers can't cross 64KB boundaries */
 #define TRB_MAX_BUFF_SHIFT		16
diff --git a/include/linux/usb/xhci-sideband.h b/include/linux/usb/xhci-sideband.h
index 005257085dcb..6d318e6a3bf6 100644
--- a/include/linux/usb/xhci-sideband.h
+++ b/include/linux/usb/xhci-sideband.h
@@ -13,7 +13,19 @@
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 
-#define	EP_CTX_PER_DEV		31	/* FIXME defined twice, from xhci.h */
+/*
+ * Constants shared with the xHCI host driver (drivers/usb/host/xhci.h),
+ * which includes this header for its canonical definitions.
+ */
+#define EP_CTX_PER_DEV      31
+
+/*
+ * TRBS_PER_SEGMENT must be a multiple of 4,
+ * since the command ring is 64-byte aligned.
+ * It must also be greater than 16.
+ */
+#define TRBS_PER_SEGMENT    256
+#define TRB_SEGMENT_SIZE    (TRBS_PER_SEGMENT * 16)
 
 struct xhci_sideband;
 
@@ -72,7 +84,8 @@ void
 xhci_sideband_unregister(struct xhci_sideband *sb);
 int
 xhci_sideband_add_endpoint(struct xhci_sideband *sb,
-			   struct usb_host_endpoint *host_ep);
+			   struct usb_host_endpoint *host_ep,
+			   struct dma_pool *pool);
 int
 xhci_sideband_remove_endpoint(struct xhci_sideband *sb,
 			      struct usb_host_endpoint *host_ep);
@@ -94,7 +107,8 @@ static inline bool xhci_sideband_check(struct usb_hcd *hcd)
 
 int
 xhci_sideband_create_interrupter(struct xhci_sideband *sb, int num_seg,
-				 bool ip_autoclear, u32 imod_interval, int intr_num);
+				 struct dma_pool *pool, bool ip_autoclear,
+				 u32 imod_interval, int intr_num);
 void
 xhci_sideband_remove_interrupter(struct xhci_sideband *sb);
 int
diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index e4bfd43a2488..c94b15423a9a 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -7,6 +7,7 @@
 #include <linux/ctype.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma-map-ops.h>
+#include <linux/dmapool.h>
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
@@ -131,6 +132,7 @@ struct uaudio_dev {
 
 	/* xhci sideband */
 	struct xhci_sideband *sb;
+	struct dma_pool *segment_pool;
 
 	/* SoC USB device */
 	struct snd_soc_usb_device *sdev;
@@ -1140,7 +1142,8 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 
 	memcpy(ep_desc, &ep->desc, sizeof(ep->desc));
 
-	ret = xhci_sideband_add_endpoint(uadev[card_num].sb, ep);
+	ret = xhci_sideband_add_endpoint(uadev[card_num].sb, ep,
+					 uadev[card_num].segment_pool);
 	if (ret < 0) {
 		dev_err(&subs->dev->dev,
 			"failed to add data ep to sec intr: %d\n", ret);
@@ -1211,8 +1214,9 @@ static int uaudio_event_ring_setup(struct snd_usb_substream *subs,
 		goto exit;
 
 	/* event ring */
-	ret = xhci_sideband_create_interrupter(uadev[card_num].sb, 1, false,
-					       0, uaudio_qdev->data->intr_num);
+	ret = xhci_sideband_create_interrupter(uadev[card_num].sb, 1,
+					       uadev[card_num].segment_pool,
+					       false, 0, uaudio_qdev->data->intr_num);
 	if (ret < 0) {
 		dev_err(&subs->dev->dev, "failed to fetch interrupter\n");
 		goto put_offload;
@@ -1786,6 +1790,7 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 	struct usb_interface_descriptor *altsd;
 	struct usb_host_interface *alts;
 	struct snd_soc_usb_device *sdev;
+	struct dma_pool *segment_pool;
 	struct xhci_sideband *sb;
 
 	/*
@@ -1804,10 +1809,21 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 		if (!sdev)
 			return;
 
+		segment_pool = dma_pool_create("xHCI sideband ring segments",
+					       interface_to_usbdev(intf)->bus->sysdev,
+					       TRB_SEGMENT_SIZE, TRB_SEGMENT_SIZE,
+					       TRB_SEGMENT_SIZE);
+		if (!segment_pool)
+			goto free_sdev;
+
 		sb = xhci_sideband_register(intf, XHCI_SIDEBAND_VENDOR,
 					    uaudio_sideband_notifier);
-		if (!sb)
+		if (!sb) {
+			dma_pool_destroy(segment_pool);
 			goto free_sdev;
+		}
+
+		uadev[chip->card->number].segment_pool = segment_pool;
 	} else {
 		sb = uadev[chip->card->number].sb;
 		sdev = uadev[chip->card->number].sdev;
@@ -1844,8 +1860,11 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
 	return;
 
 unreg_xhci:
+	segment_pool = uadev[chip->card->number].segment_pool;
 	xhci_sideband_unregister(sb);
+	dma_pool_destroy(segment_pool);
 	uadev[chip->card->number].sb = NULL;
+	uadev[chip->card->number].segment_pool = NULL;
 free_sdev:
 	kfree(sdev);
 	uadev[chip->card->number].sdev = NULL;
@@ -1905,8 +1924,13 @@ static void qc_usb_audio_offload_disconnect(struct snd_usb_audio *chip)
 	 * This is to accommodate for devices w/ multiple UAC functions.
 	 */
 	if (chip->num_interfaces == 1) {
+		struct dma_pool *segment_pool = dev->segment_pool;
+
 		snd_soc_usb_disconnect(uaudio_qdev->auxdev->dev.parent, dev->sdev);
 		xhci_sideband_unregister(dev->sb);
+		dma_pool_destroy(segment_pool);
+		dev->sb = NULL;
+		dev->segment_pool = NULL;
 		dev->chip = NULL;
 		kfree(dev->sdev->ppcm_idx);
 		kfree(dev->sdev);

-- 
2.34.1

