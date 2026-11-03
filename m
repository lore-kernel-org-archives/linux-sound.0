Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749202;
	b=NG2tBhSVvQdjb6taU9GxVmsSeq6bt7uO1mK+bh9MpIXqr44R5qK+3x84hqAfn5sMojea
	 robDcaiy/7NkaffTmdn7wfbeors6zM5k2r2wGmAXKBIwXfasbk/8D1fR3JMcKNpcqxWH0
	 15WBB9VY+VUD/sey/siYo9j870WfN8aK+4xFnhSA6ZoAqtmSNfiQgig7YtUvzuaoAIFor
	 EbL+Z4EZOaiTorNcc7zC1a+R2f8XY+qEPoEfxMeSZFwPCGHQb6wW/Ou6OfeCtHKVAARsl
	 xEbX7fD85xwGcD3Ty/dUURRYFJ+DRh8UqQYZ8V5SFM9bs36pR93ZqAYcBmArDkmZWtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749202;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=;
	b=wTZGhxfIriKVo+3Hn00/hs2/tFKtLPYcyF4Jcn5cDnPX0vh/ksBXPn+8qwfRhszZvrfC
	 RYgUQyeXuaufzbZQNhSehQvi4+bqEw1kSTEJUdZ2lLKdKaYHPm2C+/ScFu7VD9k2bwH7E
	 ZocZB7fvJ5wUc5yP1jGltXb1W0lNPiGZHywg7gh0V0Q+fDNn+mtI37UGQ1OMtg0i1zlhY
	 a5gqQSGMewRwAZmgt+8SzWzlM1VALDwsHCeoQJ5bHYaZvQVVFJ/UH9OtMZxVh0z2oq08r
	 3D3AraTa7YTKuwCp8Xd0juoPKlgocqdAF3aOgqrpjK2jnBXIS9TD5P8xZb5x3xLaL1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jzxb/KYl";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EY+l3FNT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7A7606A32E
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 23:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E7A7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jzxb/KYl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EY+l3FNT
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LL3Kp3678040
	for <linux-sound@vger.kernel.org>; Tue, 3 Nov 2026 23:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=; b=jzxb/KYlhU6jWHrE
	WlzEfu79azVu/5vTDeWNgkasc6CrrHHvFnawbsEZJAvG8O6QHbTjh5PV/NHbjl4R
	a+mowJ7xGEpbhvDnGBR2DwY9ciKwVHQ4D0TJamIzkCA/1JrIlYf/ZxkEzSdjmTsU
	G5Ah8Hf7R8RKu4LWJaeUiFeCL2Y880peHhgcK4VnFKLBzQr0Zky1t6sgSBexHXnn
	C5c9PAwhJ1e95GH2mOH9GjgdAHsakj5eOmG50Zz3MrFsk/XRDpOYe/+cTwYC1E93
	EEAPC/UPc0XPxm9CSL0KdZxI/+YXL03JzoyKpj/UQUqji0PXBFcURzsWduzKTzFT
	qavfYQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bj93j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 23:40:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so102368eec.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 15:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793749198; x=1794353998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=;
        b=EY+l3FNT07tDOa+tdRWneL3n0da/Ks5gzlXQs4qq8pFia+XTbAsHP1Nt3jOIztWTtr
         JWRIImsKbaJHjn2mjzXIHnc0qK5bbhEm+D1A8CB2/jWG16qEMPhcr87PHMraX5b6eEJL
         7zTv21/ZxsEO46xH/Gy9W3foEEN4bt6zQFXcY/BUXbS1xPsVfn29xRaFaU8WLNi/0TcQ
         qcvjRZkXuaSKJrrLpzPQnkcFhFKsqTMUL0nrhuUfl4bZ91VI09IfCmM140N4QXx/AxhE
         Nq4B5M6HwyVqCl6Qw7Hs6ZQDVzzmITxEGTx+8YL9f/qFsdjysR3z9eNeQ9K0IceQDC44
         fJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749198; x=1794353998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=;
        b=OeAlQ6+m/p6/jhYEbigyYHvgCjJnR8TGwWq+4Uinotxro864MZHseRcVNe5NrJTWDF
         ADQdJ3IMuWhMwga1dBLaBIymETBbrsPS9i/P1w41wCuUQYTveC1y+O8QdTGVKdmWSgrc
         u+0w6zm9XYm2FC7zv9UbqBWbGt/+IG/GJsKNHuVx9pTLwbTJpSrk76KhTsv0MciTpauG
         gceOCa6J9r9faqs4mUyI3qHdaRaGt90zrQHFc5pm1Dx6UoGCNEtzv+2I/FUdXbnu+vx1
         WmFDTHJsHsBvp6W8m/JfrxS/cboiLXtwr6jEGi9EIqzJnTCySKyEoqQ+bQzf0fFlX+4F
         V8pA==
X-Forwarded-Encrypted: i=1; AKwUvBx6+dx/FCnkRM32ygMZb+8PIgt0P+cIqQ5nzN/2r8N9kDl9A/IqgrqXCiWfforrzdyDAHutsRrsxXMY1g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8SbiNzq6j11qlIWpQlbkZSvZNTF8lweSIcCH2SwqCxqfWbCjiI
	7GlsTwieK5mSvdtVHz5LAOqgjyxvfYyOsCJJmcsLWfkh6yv40tron0dXbbX/g3YmmElXgQuk4Ko
	Tin++XZ1G+6GZxQAEhmhtaIgZmaejWrvm3Cl8f9isBl+EsfzQpRDXsEhqqAfrf8cq9w==
X-Gm-Gg: AYBFou2rdLTo/L41dPZIHvQl8dOOdPb2oRouD6DSES326bwG8wgaahXYIbL0q/3kT6V
	8W2aITjMcQchHYjnADG/8a67KOWkauVTWwUqjTPeKDUOjOm5X00MBwJHw+LZoNgJ3qHju6b362h
	2YEF7YR8MPC0hbx4tk/EJILvtuSJg9TIaCwNP9SUysp66vFthuFbgZfUkXlKc8VTXPyBM0dREeF
	XosAbNpGraPFoitYYY8iV2N0LuB0VJV2fM+8NpmZxziydknVU7djTZWynSkvMExeRiBHnLqCC1U
	xwSyaa+TsslFVUHqiPocQ6gUKJmgZrCnC52QFByqvJTog8iv7kLP7T6/kWFQI+z58qfDA8F51di
	pV+Uai5AF3B5pRiDVluqW/gKqWD2raFdfgPzerNPJJJF+js/B8dAOGYHZ6e2T2WhlBmlXsvrO5g
	PxpmV9ldeVaSvwWv2v3MmA45jSBw==
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr35245434c88.29.1793749197927;
        Tue, 03 Nov 2026 15:39:57 -0800 (PST)
X-Received: by 2002:a05:7022:4392:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1ac5de53bc8mr35245392c88.29.1793749197211;
        Tue, 03 Nov 2026 15:39:57 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm2356442c88.1.2026.11.03.15.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:39:56 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:39:53 -0800
Subject: [PATCH v5 1/4] usb: xhci: sideband: fix ring sg table for sub-page
 TRB segments
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-16k_offload_v1_b4-v5-1-67184126e91c@oss.qualcomm.com>
References: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
In-Reply-To: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfXwANmUrU18Gy5
 MzC7t9WxVC/LGlGpkb5NVZnp8btSeAn/C+3l4kb76XDg7rjYB2RzAecq6+KubTiM5HIKlC46CvD
 YEQhofZsfxUyydY+62bgxgmsz0ZwKcE=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6aea70d0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zbI7ttHqI6kfeEXDPioA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: X8UMzL0g1iGbWycoalB-4cmAlnsPwBSl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfX6hpqTT5MvtIL
 8BAxOynpcg7gY209uJHIR3tc3tqdPcVnmIr7KUhJli60hP08m6s1ig2LXN2eEbYW2l5Zi8PjZBX
 FyTb3QdvK54MHCM4GwO6D3cbJ6n41/HUG5k/Ga8N7Hrc89W6FQqelFrnYOa2WkyHNxz89z4i2L4
 s+OEqwjmzSMrAO9EgutPVW8kCEaEDHu1yBTcRPdZxKQ0HMqm6C7RB6m32JpjQdNxXL7dVABLrkW
 Bsuiz/qA7d+hb9mZzd2CTtk/9pEC8ZzgkC6QI7ZEMZ7hw4TfeE/DNtgM0Hth0dneJm5A08YUCWZ
 fhOxpVir0OozBCN2xm9vupTYI3vnQuor8pMUkiIPWhj/gIFmpSb9yUqOCoqyy17/HnoWCKQ8ir7
 8DT3MfUy4HVeU1wJ9r/kMEv4ipTyvSoeOgFgHJAgPxavgxsn/quO8cxgAUmigJZy6V8RJiiljJC
 bEBz2eJzWdJNEk3AXcQ==
X-Proofpoint-GUID: X8UMzL0g1iGbWycoalB-4cmAlnsPwBSl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030094

xhci_ring_to_sgtable() populated its sg_table via dma_get_sgtable()
per segment and sg_alloc_table_from_pages(), both of which only
operate at whole PAGE_SIZE granularity. Since TRB_SEGMENT_SIZE (4096)
can be smaller than PAGE_SIZE, these helpers describe a full page for
each ring segment on larger-PAGE_SIZE kernels (16K/64K), and cannot
correctly represent segments that share the same physical page.

Build the sg_table directly instead: allocate one sg entry per ring
segment with sg_alloc_table(), and fill each entry explicitly with
sg_set_page() using the segment's own page, TRB_SEGMENT_SIZE as the
length, and offset_in_page() for the exact intra-page offset. Walk the
table with for_each_sg() so this also works for chained sg tables.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-sideband.c | 80 ++++++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index a5deeee4d5dc..d0c0f75d6085 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -8,68 +8,78 @@
  * Author: Mathias Nyman
  */
 
+#include <linux/dma-mapping.h>
 #include <linux/usb/xhci-sideband.h>
-#include <linux/dma-direct.h>
 
 #include "xhci.h"
 
 /* sideband internal helpers */
+static struct page *
+xhci_segment_to_page(struct device *dev, struct xhci_segment *seg)
+{
+	struct sg_table sgt;
+	struct page *page;
+
+	/*
+	 * Remapped coherent memory is in the vmalloc area, where
+	 * vmalloc_to_page() finds the page for any offset into the allocation.
+	 * dma_get_sgtable() could describe the buffer from the start of its
+	 * allocation instead.
+	 */
+	if (is_vmalloc_addr(seg->trbs))
+		return vmalloc_to_page(seg->trbs);
+
+	if (dma_get_sgtable(dev, &sgt, seg->trbs, seg->dma, TRB_SEGMENT_SIZE))
+		return NULL;
+
+	page = sg_page(sgt.sgl);
+	sg_free_table(&sgt);
+
+	return page;
+}
+
 static struct sg_table *
 xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 {
+	struct device *dev = xhci_to_hcd(sb->xhci)->self.sysdev;
 	struct xhci_segment *seg;
-	struct sg_table	*sgt;
-	unsigned int n_pages;
-	struct page **pages;
-	struct device *dev;
-	size_t sz;
+	struct sg_table *sgt;
+	struct scatterlist *sg;
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
 		return NULL;
-	}
 
-	seg = ring->first_seg;
-	if (!seg)
-		goto err;
-	/*
-	 * Rings can potentially have multiple segments, create an array that
-	 * carries page references to allocated segments.  Utilize the
-	 * sg_alloc_table_from_pages() to create the sg table, and to ensure
-	 * that page links are created.
-	 */
-	for (i = 0; i < ring->num_segs; i++) {
-		dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
-				TRB_SEGMENT_SIZE);
-		pages[i] = sg_page(sgt->sgl);
-		sg_free_table(sgt);
-		seg = seg->next;
+	if (sg_alloc_table(sgt, ring->num_segs, GFP_KERNEL)) {
+		kfree(sgt);
+		return NULL;
 	}
 
-	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
-		goto err;
+	for_each_sg(sgt->sgl, sg, sgt->orig_nents, i) {
+		page = xhci_segment_to_page(dev, seg);
+		if (!page)
+			goto err;
 
-	kvfree(pages);
+		sg_set_page(sg, page, TRB_SEGMENT_SIZE, offset_in_page(seg->trbs));
+		seg = seg->next;
+	}
 
 	/*
-	 * Save first segment dma address to sg dma_address field for the sideband
-	 * client to have access to the IOVA of the ring.
+	 * Save the first segment DMA address for the sideband client. The returned
+	 * table is metadata and must not be passed to dma_map_sg().
 	 */
 	sg_dma_address(sgt->sgl) = ring->first_seg->dma;
 
 	return sgt;
 
 err:
-	kvfree(pages);
+	sg_free_table(sgt);
 	kfree(sgt);
 
 	return NULL;

-- 
2.43.0

