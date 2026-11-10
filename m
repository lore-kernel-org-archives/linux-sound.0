Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278303;
	b=BFhimAxsuOpkxLhhHekg0as0nYrnrbVnLGmnLedOTTZOLsXEmDtRFldgWZiuD8SYYNAj
	 ovrfChEqEEyadCngrHAunJwm+22MVMKd2cPF+QrpUWNuadPRuCfajjLac2Wc4RqsY5QyR
	 deYfm7XOIq4NvtCiLn4b4jxl2sdL0Ylarj4n0i6uQmiFsJEr/102pZDcwJudOOKiLUxJm
	 jxV/ElBHOr2Obj0MOPp2YH8C73O5I/d7t7CwhXTBwMuzu6SSwTSErub4E5mpVPBqZkOXN
	 /VHYCMrtEWbw2/NqREU3lIyAW5s+fYYb5sCin7/V6iOKCpiFj2MXWBXDH4EqNg15T3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278303;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=;
	b=kWIrc8AfIM/aKePnph8efB9iMjqX14OEXMzsZjTYqMegHcdSqNizRu7ypEpyhMTEUMyT
	 fUi0456MCV/X4Ze8nsFmFyLlcqZ6zpvGgZ+ipNZAR4QAuI2Xvm4auIOKJV9q7xS2yPQLQ
	 kavMoUWrc91tzMgzcH/UkCAKmcpC7ozvAG+Jd/q4Mw5z5o3EMfsjK7iC/1BW/9LcwiyiN
	 r7Z5GKUIqa6um3Vv+Pcr7X2UCYhIHnpzKGeCIxUeIdVcb0IYu7j28XG+WQJDhUI8I+tTU
	 9YtEC+nUVcL4KU22xvt9fBkxwY/9+Eup2We/hkp0Yam5/hkSYjUjQl5ZgkuVNifd1mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c29rIQ9I;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ajLsqC03;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD657606A32E
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 02:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD657606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c29rIQ9I;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ajLsqC03
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0j1tA1850069
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 02:38:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=; b=c29rIQ9IjlYx01iI
	Gsf/ypiBEAhSB73FLPnpRnCOVBagg/nrnCHB9eHRgfcHSBDu0fCvScBekgev+omc
	y050Jhh3nhD2X6PLlzbnZtiq5KYi/aOeyQUHblpJGuK16jFflQrJ3yrhCup0FP+9
	DUqIlp46U5YSeffFUFWpDpu2OiDGji3y5ZQcLYPL/d32i6yhrrPEGiMgDS8taWTf
	1rVPiaWFwreSloVBKll1VqdxL7kVVq5gckjRNOLXimpiOKtZdx/mvJ0CBDsa3ufa
	/jnRDmG4V4ETnMHbwrkUabUekFbJIqCSKqeglyXAnjYlFVW5erGgspPtmFjaCe4O
	J0RwkA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5u75b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 02:38:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37390b2989bso3117845eec.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 18:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794278301; x=1794883101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=;
        b=ajLsqC03ovQIjFSJYG6Ir65Z/lqYyRhRUj2vaTGn9bg05A+6zh3WUnbQdqYCIrv60n
         x21PfG7wXz1G7gTvoiCYfemy95UgqOHV92jLGzhLRzCWF4LfSaWOIYAxAuj9FOTvEK9l
         CW4MjnjSY0UWFzlgczhI5OB5T2EgDZbcIlEyEtMH4kNtHO9qi/5XhPxEigP/zeuvP9c6
         ErPp0U11En1H04YDsUhuSEK7M2DVcrwOcJS5IBkWP+xFyxF9aVfQl+RvXW+DIGyWJa5M
         FEl5U9Kwf0mbKCo4VBlvz+qk3QXhGwJs/7S4gW0YW8uBp67IpduIUXppIfmxl7Sf921c
         NqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278301; x=1794883101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q4cC91N9RhqgKD2qCHYgdvM0qlmdbQhBjY9tX3xcT0k=;
        b=tI0UKUcb7Vv2gRTOfUt+JSOcce1d2JS3/HZfkdcbRL0vpTOltm7uE+dlXNilPvH+8r
         kb7Zl8MpKyOQuXXdTVk4U4LonJGjZWtKPYeMd5F28dX3LeyI65gju3bp8yeXQJdkl82N
         PKmw43T7KF76hQRdfA1R/h9UvWeJp8wZgEwPM48pPnR+4mg8MqsLxsBCQ+/4awcTX1Lu
         lQ6Vr2FzJ7gdCAu6Mta2o9oBqqsIehRwcbP7/x8v41rtnhnfbJ7dfT0YSwGKGFCAYXiN
         eFx43C5NHQDdcowX50WMEBwRaTtun/arj7MAQSDaEn2MCHEsJApd65uiebed6/g7O+mP
         X5PQ==
X-Forwarded-Encrypted: i=1; AL+hErF+lJoHr4ObvXoye9VpzCbi+ZG22PsG4uu86yNGl8LbqitU3sJISOoczKTD5wV+ic1D26OFhYeIqZThXg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/aUEQtqeieTuDfJmsdnMZfNMFinUkqKe1GdUpia/hBZen/YGGI
	Bs357xw+ri+KF7mpIUF5w+sOK8iY+W3aako0VX+HRcrtiGEHQ84B2ruCSErmhz6XQLovrrnQuGL
	uizuj329aYz8oLTDurezShzabWDGXDVrIb3veYoXBUxqjFq6Zw1T0QGCbvZM8rGQyZg8//n5qSQ
	==
X-Gm-Gg: AYBFou1zTavXgWIXMU9STvEu/QXXy66Xn6gZDXh6DuMAPG1NEKp66HTe6wn1df91LU+
	K+M09NYOGELfnudOOkIbU9BUwcprQ0wPwPPAGem78e408aQZ7wVoswkumwdMfhVod8qQxKJwZUy
	2lEvRpHjNUW6RrlAcmQ33gHU4e9wHbVvp7TeKuzK2bBJG0OYoicetn3qRGY0gzyRybm/2ml7UN3
	+c4WMPRgen3p5x7lTGMCt+OP6KdEm47aJCE2OM45lUuOqybJrtGE+AN6vP9iNz97XIXXLlwGiuv
	80sWyqtHcnXZJcX5vMo1FEW8g3CpKOCC5E+5IMYSAn+Is0kOCLWTJPiO7SFjeZfKj1a37ikf0km
	yriQUmGBLRvb+0luFD3jT3c89ZhU7b7nZaQKVu7EujVYEOUZPhf/NZXp1X7HlDnpwGnzW2G7++1
	x/G27BLPybIdhhHgTXRJryI1dV
X-Received: by 2002:a05:7301:618b:10b0:36c:a93b:1ba3 with SMTP id 5a478bee46e88-3751ee7bec5mr1628488eec.20.1794278301261;
        Mon, 09 Nov 2026 18:38:21 -0800 (PST)
X-Received: by 2002:a05:7301:618b:10b0:36c:a93b:1ba3 with SMTP id 5a478bee46e88-3751ee7bec5mr1628456eec.20.1794278300600;
        Mon, 09 Nov 2026 18:38:20 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm3800183eec.22.2026.11.09.18.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:38:20 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:38:07 -0800
Subject: [PATCH v6 1/4] usb: xhci: sideband: fix ring sg table for sub-page
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
Message-Id: <20261109-16k_offload_v1_b4-v6-1-858c6e0e007d@oss.qualcomm.com>
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
In-Reply-To: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxMCBTYWx0ZWRfX1E82aOc4I0s8
 f/d7mJpBO7haRSYs7Mg2yA+rBb3IyVcpotRanZOuvI6Gg5u38S32NcPScDvsS5UO2B0HQJYWjOw
 4cg2DX7nXd1+rxd+OAwR/VNgS1d0TBs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxMCBTYWx0ZWRfX/g1gvjkM8YTz
 h55n5daaJMvOXzq64DPN4n0VTlE2UNQ3yDcXUwHIXWqlGqAxUs9o2lFf+ajTC/2mLFvGHE8O08L
 rp3lHVK7IksEriEkDLFGpU5B5P83+m3o7o7KIa0/6v13kEmlIjU8t9jS0i4OwU5ZSX+XvlFElHb
 gXAK6asOT8GYBEV2Ocm1BCJNZphtYAzP1qxj3b/pFWJXs2TdthEkEN+bNBgDd5IJun/rX8PP2y4
 I0cHvB5OOmemHgryjv7Dp6kiHLKjihCV19yJ0qo7qn3T1idI0cbRkROi+anrubOpDDvwjGo4Ch1
 cphJoVHBW8qiapz1v7sqBe9WNvYZcrvXINExCuQk92N4+/Ao+6UVB8Vnx+stcEyun55bZTMtn2K
 7ZmFWc+AdSoy2rhwmVTBHKwFi0atliiC203Fpy5fOp8cleMo5HSlJSTBqR36HXts0pV4qn85xti
 w+qvkdo2UNGJ8DShd0w==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af2839e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zbI7ttHqI6kfeEXDPioA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: C2QGaNJlCXSYVgSLV_c4aZ42HaHn4l0Z
X-Proofpoint-GUID: C2QGaNJlCXSYVgSLV_c4aZ42HaHn4l0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100010

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

