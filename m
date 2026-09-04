Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B7D420490
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 06:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505089; cv=none; b=JUYqIKZiPsLvdkNdP7vzEHMrpVe5ndaty8S43MdFyVro6TnJTQQPkwq/3y2TM2CGb3TJK/XnFQy+kTvoiyU3cQQn02ZpnxmZfeUjr7peyVUfPJAbTtgA/YVXkoobewddf4EODf7IMpLELulj6L9fjjwT0Xs1xE/RuqoztBoZWwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505089; c=relaxed/simple;
	bh=MC8RF8exbnRdyxfzrjSNLOlOV7Cnba1woExTrACXBa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i5hzYCJybTgq5OPJV+QQZzV4J9NppB7nqs7uHUxFgULatIMc7uE1b2D0Nix49sB7IvyMivQQdW50fbVgA2NYr/2wWHiuWX6uMrD9Ht78y8w2XdeFnEeVPS2IaP6ZCXkkeTv3DjhFn9qWECbKBD2XluZkFVhYnH4KplWze79K/SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPF64rvP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WgZziDPq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPF64rvP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WgZziDPq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462gi12125272
	for <linux-sound@vger.kernel.org>; Fri, 4 Sep 2026 06:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qLcKeVUAGDAqIIR+NcT+dw/2isBatO7SL2E+KRjKb9M=; b=JPF64rvP1YU48bat
	gpLVWml1fLZ03YMZhx7M+tEUF/S9QB7lrPYtK/oyiKTGOfzWDg3Wux5evgFHPNA4
	JbkozSRW3FyJ9ramd4hH8AMBNRyH7XMOUGQ92BwIgrGTKt3o4tfOeYY38aosMBhq
	9u4ahSd/YSmvHKAsMMhJKvj8khnaVPg1RXlLAX4MC690jv+3ikp+39YYqbvzJinU
	6j0iL+IHz3UNACEip0mENQT6DVPz5e2zcMam4BsoB0lCe4YURTQ1187/LAqb+dJP
	3UIVCOHVC+d7R95QVIkDcg8DRsDjH6akkQYH7jWmSN1CqaprF9fk/j8RUojzs8GG
	6sSvSQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fgm74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 04 Sep 2026 06:58:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so750000a12.3
        for <linux-sound@vger.kernel.org>; Thu, 03 Sep 2026 23:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788505086; x=1789109886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLcKeVUAGDAqIIR+NcT+dw/2isBatO7SL2E+KRjKb9M=;
        b=WgZziDPqTZPQZYRF3UZY8XNxWTbI5yVu/dHuS5u85ibe/st6qp9v4H3rtnfMAp0umy
         3EiHIcplqSGgxU6zA01MTrgHxIo8Tg7R/Y3C0XCRasWOu6R+wd2lIbWsqzPkztqBH/uq
         KYh1/V6z2fg0EhHcwWjgSEgW1V25SdH30/dI1FapwTF4QfI90XNuFTvMrf5QxgPWT4+3
         XIv5F25mFDWASA6RkaKWIX7ZdLk7YXs5HFKflj+heUug0SaYwQW+LPYxrAkqlThK5PG5
         AEQeObO+FI/5s/C9KysC8EPxviriDkieHbWiEXIyhIauQHRfny2EKO5Mpgl3KxOICNaP
         hddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788505086; x=1789109886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qLcKeVUAGDAqIIR+NcT+dw/2isBatO7SL2E+KRjKb9M=;
        b=YSxRI8UyXxCbsvtgexebbn2m26WwU6MIJgqppI9DztaJ8F87pj6cyOKHacblCSIpFs
         HmQvYd7e6nP49+Qr9F9hJd78Wt1VbUacYQEBDBYR0v7CmFfegaAFVZr68ocOdX+49n/0
         d9PEh1v83Ymu4KfkQRL01upXmMFApDlaUpD2hlFwP198zbgmyJDH0VZ/SrsyvVDKqCCY
         b65C2jWi4XnqxQSkeBQPv4UAFk8R8xkb7WHsNWMwd9nWcwnc8W+q/js2QXpRPBkHniyK
         K/s9rH9ZZfbSjxdjkd6QUtoHsoLfdnvR6z+WCXv0MSBy9JKq/qH1oYyrUrc0YuscTe2e
         2RWQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQY0UhvMe1YCdLk2yM6NJF91aws/kxxES3aDAq4h4hErgiKe3yxYarHFAjccRAdlWWzNIpPZ126Y0pLw==@vger.kernel.org
X-Gm-Message-State: AFuF++kTpz3KbBnpqLy2xl7E1DWv922ldRPBvFCy0WH8G5iPXIAxvPwz
	NJJ+uOXoxw402mMza6plSIj53ssb/nEJL2TQ2bhfUf1CD5hArLaxIPwDAzB65mxftK55lrRtg6D
	NGeHUFImcr+qRComgPz+6kCrcGKn2XbhmK7J+f6YTdTS+nZ7k2ciPhIRl9QexcsxH1A==
X-Gm-Gg: AYBFou1ALgH+glilK9IPlqWWN+J0h/EqtJjYS6ha5CuarlefbyrOr/bzVS3hy/98CHi
	nU1xwH+bzVNhod/CALC7f1zLkOoS6Wvcll01wz3mC6iwnwmsOZn/VW83Rvhp++694vTBsK292ZJ
	ii0xom/lqFjN+FT69MhbbqNLqcib1G7yMT18jB6VAsZGkyVTXU3HRYDGMCZQfJ3BQkpao+78OZt
	rLEVuoid2U7hyBbYzfDAAiTBXxB55KYoZteNmOYTTvRHPRlJEJMQ21fEDF9GakF02v68z0g+BHQ
	fMCOsERqhNBIkupOvjQsi8KMNyUs8uSw76dHmSZ66yQ00UJa+bWex2+nROnWDAkNUgwYch1DgyY
	ge/Hp7/U/7rFSZg0nvHXIA6LfTkriOUNHK6lotWtrffeUHOhUL5zL
X-Received: by 2002:a05:6a20:9151:b0:3d3:af44:ee12 with SMTP id adf61e73a8af0-3da3a2067e9mr5515709637.27.1788505085790;
        Thu, 03 Sep 2026 23:58:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:9151:b0:3d3:af44:ee12 with SMTP id adf61e73a8af0-3da3a2067e9mr5515661637.27.1788505085365;
        Thu, 03 Sep 2026 23:58:05 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm4760900eec.2.2026.09.03.23.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 23:58:04 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 23:57:50 -0700
Subject: [PATCH v3 1/4] xhci: sideband: fix ring sg table for sub-page TRB
 segments
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-16k_offload_v1_b4-v3-1-135928dc2408@oss.qualcomm.com>
References: <20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com>
In-Reply-To: <20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9a6bfe cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=aTe8jcWzyPiXfLMz6F4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: RVULFQP37Q-FWwR_DtqnoiT_3DqPjnO1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2MyBTYWx0ZWRfXy5wJ8IlJpw73
 74GkmbYiSnTm34leCAIYy8C2Ird8VDUXaOplvdlcpUHj6VLvJp0CwFOUCntoXsgX//rRKTDBIOt
 6IWE8dxGtjf95PzcKqlPfzSRgDAI1Gs=
X-Proofpoint-GUID: RVULFQP37Q-FWwR_DtqnoiT_3DqPjnO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2MyBTYWx0ZWRfX4hKFt1HZ4HTk
 DQeHyBTtLbL3O9iTNGLoQhbna7wKp8T8nCJm/N2zfVMak680PIjbV/S4AXn+/A/vmEohqGabW/C
 xyRHTcMzg8yt23815CtBUZVkNt8FzszTq3y0etos2NyOexZIlhakfOhG/od/n6eolEYQA6SaKx7
 IMAledYJLF0bKZUFMxeTLkpJ63O/u4qRMUFprIjvs7aLjQWhDUh8ONLvriKUakRK2gV3d9T9nHu
 FDssOlKRPDIVyIJdVAcLeO+IYa/uX8Frls3bldxB/v0yqm5doei/em40+HKVuVKyn+ZkZmLL5aU
 v/I104YVj2z1Lpb+JfxfQzyx+sPa4TtdjjdXdMAIBi7xj0NfSGz2n7pbqb3OjkK0z9oq3OBywYY
 l2OEXjUsqhOLWC2lNphZhkkiG9OMZURsPyKjKrPSHCtD0CX3V1UfamzRQIw+e2y9wM8ZHAvpcR9
 1DIPlgLy5we2iN2gcrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040063

xhci_ring_to_sgtable() populated its sg_table via dma_get_sgtable()
per segment and sg_alloc_table_from_pages(), both of which only
operate at whole PAGE_SIZE granularity. Since TRB_SEGMENT_SIZE (4096)
can be smaller than PAGE_SIZE, multiple ring segments can share the
same physical page on larger-PAGE_SIZE kernels (16K/64K), which these
helpers cannot correctly represent.

Build the sg_table directly instead: allocate one sg entry per ring
segment with sg_alloc_table(), and fill each entry explicitly with
sg_set_page() using the segment's own page (resolved via
is_vmalloc_addr()/vmalloc_to_page() or virt_to_page()),
TRB_SEGMENT_SIZE as the length, and offset_in_page() for the exact
intra-page offset. This guarantees each segment gets its own sg
entry regardless of page sharing.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-sideband.c | 57 +++++++++++++---------------------------
 1 file changed, 18 insertions(+), 39 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index a5deeee4d5dc..beb637407e47 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -9,57 +9,42 @@
  */
 
 #include <linux/usb/xhci-sideband.h>
-#include <linux/dma-direct.h>
 
 #include "xhci.h"
 
 /* sideband internal helpers */
 static struct sg_table *
-xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
+xhci_ring_to_sgtable(struct xhci_ring *ring)
 {
 	struct xhci_segment *seg;
 	struct sg_table	*sgt;
-	unsigned int n_pages;
-	struct page **pages;
-	struct device *dev;
-	size_t sz;
+	struct page *page;
 	int i;
 
-	dev = xhci_to_hcd(sb->xhci)->self.sysdev;
-	sz = ring->num_segs * TRB_SEGMENT_SIZE;
-	n_pages = PAGE_ALIGN(sz) >> PAGE_SHIFT;
-	pages = kvmalloc_objs(struct page *, n_pages);
-	if (!pages)
+	seg = ring->first_seg;
+	if (!seg)
 		return NULL;
 
 	sgt = kzalloc_obj(*sgt);
-	if (!sgt) {
-		kvfree(pages);
+	if (!sgt)
+		return NULL;
+
+	if (sg_alloc_table(sgt, ring->num_segs, GFP_KERNEL)) {
+		kfree(sgt);
 		return NULL;
 	}
 
-	seg = ring->first_seg;
-	if (!seg)
-		goto err;
-	/*
-	 * Rings can potentially have multiple segments, create an array that
-	 * carries page references to allocated segments.  Utilize the
-	 * sg_alloc_table_from_pages() to create the sg table, and to ensure
-	 * that page links are created.
-	 */
 	for (i = 0; i < ring->num_segs; i++) {
-		dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
-				TRB_SEGMENT_SIZE);
-		pages[i] = sg_page(sgt->sgl);
-		sg_free_table(sgt);
+		if (is_vmalloc_addr(seg->trbs))
+			page = vmalloc_to_page(seg->trbs);
+		else
+			page = virt_to_page(seg->trbs);
+
+		sg_set_page(&sgt->sgl[i], page, TRB_SEGMENT_SIZE,
+			    offset_in_page(seg->trbs));
 		seg = seg->next;
 	}
 
-	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
-		goto err;
-
-	kvfree(pages);
-
 	/*
 	 * Save first segment dma address to sg dma_address field for the sideband
 	 * client to have access to the IOVA of the ring.
@@ -67,12 +52,6 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 	sg_dma_address(sgt->sgl) = ring->first_seg->dma;
 
 	return sgt;
-
-err:
-	kvfree(pages);
-	kfree(sgt);
-
-	return NULL;
 }
 
 /* Caller must hold sb->mutex */
@@ -254,7 +233,7 @@ xhci_sideband_get_endpoint_buffer(struct xhci_sideband *sb,
 	if (!ep || !ep->ring || !ep->sideband || ep->sideband != sb)
 		return NULL;
 
-	return xhci_ring_to_sgtable(sb, ep->ring);
+	return xhci_ring_to_sgtable(ep->ring);
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_get_endpoint_buffer);
 
@@ -276,7 +255,7 @@ xhci_sideband_get_event_buffer(struct xhci_sideband *sb)
 	if (!sb || !sb->ir)
 		return NULL;
 
-	return xhci_ring_to_sgtable(sb, sb->ir->event_ring);
+	return xhci_ring_to_sgtable(sb->ir->event_ring);
 }
 EXPORT_SYMBOL_GPL(xhci_sideband_get_event_buffer);
 

-- 
2.34.1

