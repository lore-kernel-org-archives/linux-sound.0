Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03563E1738
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 21:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953081; cv=none; b=uliW8VPjm03t2Z242HOyEYVRQrU33y9CRInP32Ix0jHwKDkdi9uEbhgHT7MSYWxg6KhjY8gw9E3JY+S9h8JyNoYDwmGDvBxr6Fpt6YCfyKLouR9g6k+K9ndBJO29vZXeAkxMtkepAZCzl23m3Ka1MckSAabyxRtIzmUl4Kkk39E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953081; c=relaxed/simple;
	bh=6k3p0ySqBDsyF/vFgmLfucoHCiVzOtKxA6qYkh5DRN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGz8Fc2j4jJQ1LU0xncxvmE045MzLAizE8cYH7TyN89Ri0XmWsWyAhz7EzgR6Ug7awgWBL71z5Ypcry+792Zv3shuzBiHVvbEPkZp+zzqlShft10gcYZEek4PqIlOtzQw3ObOKWNURFRLawUVTza4R+Jt9H0jLejvoJKU39TQ94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b3OlHNtQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NEt44Klp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b3OlHNtQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NEt44Klp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SJ7k223989305
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 21:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6yZymeJtaZo5lERvmK0bkufR21pmFncW0lW87uQacK4=; b=b3OlHNtQDLxxWgkH
	vZlP6F9g/Yib2f3oKfIWTJex3sp5cnOeiBe7vG0+Bu8171znXyzSz5UFagBcefBQ
	dRZqPCUqNuU34WjVHP3QSHZFBg4xlw4545qoRVdPcp77Yx6M3r7b/dlcXbMorA5W
	753v2QuVEkgCr7ApykfewqtkSWPIlHW5zZpsbx/Y+6ZhwGujgxLqhpI62yBFkmr9
	thDvRPf7M1K3zdAPrx4R5DHTN6lcWU4XwWf9gFqR+3xly7RAgiumMRmWPuxxz6Nd
	GiKbl4ferOpecVHGyogmADW/BVzwbCQbSL5SqAZqgc2DR2/hWZaiC5pDL+u+yAnr
	Gi8oYA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h336u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 21:37:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2299470a91.3
        for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 14:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787953078; x=1788557878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6yZymeJtaZo5lERvmK0bkufR21pmFncW0lW87uQacK4=;
        b=NEt44KlpXlwDgNnmUE3bsh71d84a8h8mLRU9KPcrJM9RWwkPiaH7dd2+qL5GauQ/x8
         6HSyC5z0LR2lNHMJCdw5JVgOJ+Rb7ezTK2nyab+xQEYPvNYUtIc7qIDqVYf/0vdQ6/+q
         1ZRI8QPRdRkNGD/DTSU4Z55y+rG7IbYONuPYRh2IqEt81738btN+gUDpwIpAxNzeUoSe
         jYD3WcNBT6ADHZumFGvTmrav2IEv5az8wrEjr0YvFvxZHB0gMpa0RzBs23G7xIvQmfJD
         eU3heMXBukUDxrbm7423bPbtJnvnvoD/t6u7cgNbjtecVIxfAEhVUbTwdKFusGcIYW/Y
         LMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953078; x=1788557878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6yZymeJtaZo5lERvmK0bkufR21pmFncW0lW87uQacK4=;
        b=SecoT2f7XbFMe4dhC8Au9Uq/3Ev7ToqLETpFwGbTMfTBYvviQh48BEYu782lKk2MZv
         2PpbJ/PHq3krslro9AXffXkwsa+pDwE4XWc9OJ93WUmCmDKap5CbZjUIi7cB0cjliAqw
         odRp8r1cIComwchFxXdS7RRbIR6gQ1if3JndSbhJhkqP91b58SYz2is1sGLqZbDWmXC6
         awnvF0wq0h4i90seNtXGeW5OrXgNRxRfxaTAqAORiBS3iL+85CkQQ1c8bcNchfnWM8zi
         L8TU+kNHdp/xHfM1thHBjpuJlzY3GqCr8sohoICFW01D5RdLaKyP6RYFoyMpfSgvLLgj
         NGuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHoL4oudAWDXRyCzWkshtLJbJxsHzHxaNbXbdhQxQZmANxWteSdmm9ImLHFj7qxBWws9m2vSSUz5XaCg==@vger.kernel.org
X-Gm-Message-State: AFuF++kUQKfgB7b2A8h1tcznRACnhBqkJCsEmyZTBc6pMdEtsGrNVVff
	YpPH94qgKDtcsTjc76bLjR4kaund39wqsLL1EQlZf0VWuXQS3BV99JrYo74r8UZ036FOJnICs4x
	7VbVUPZbcugfoqKazvcaXriVhzo8pP+Z9EXzEPkFtZhfulYb1DYZwJpEioA+NWyrLZG6s2kf3mA
	==
X-Gm-Gg: AYBFou0TFiAh/ePfv7okDhDbBhCDRUv9Y5TIoh5w+gumFMaodgQM7lBNN1oe4fMBeDm
	U7/ERRJqWoWvukeN1LQ/5TE9mn9v68mfWqVS3GpeeSTs2NxWmcq0AG4+neiuPZudJjK/3KN26CG
	+AJKk7jimQhosTflBNgCSv9asxqMKvVJZQ7C+M302h7RokahU7UGyu+1xMY3w7RxrGYAOcyvxgz
	amOv+zlF+G9QONnSAd8VYmfsOWmvXHG+EDk9KbCa3qdlSQQDxOlwyJqDFXC9x5L/4GvDOztnHh1
	cjYbsUwRuLFI1fDFgSk0wpJi2vBIfRWrm1E9ETqndbej6xyZJS+S4yn0pWcEstFy2dBRUZ5I2uR
	LXhfqUg5WUAyaGtOKX8T1kF6dZid8WPxXgxIXUzUPYrKZBl6DpWah
X-Received: by 2002:a17:90b:3a45:b0:396:5785:843 with SMTP id 98e67ed59e1d1-396d0f09a46mr18686541a91.8.1787953077854;
        Fri, 28 Aug 2026 14:37:57 -0700 (PDT)
X-Received: by 2002:a17:90b:3a45:b0:396:5785:843 with SMTP id 98e67ed59e1d1-396d0f09a46mr18686481a91.8.1787953077320;
        Fri, 28 Aug 2026 14:37:57 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm5892112c88.11.2026.08.28.14.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 14:37:56 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:37:53 -0700
Subject: [PATCH v2 1/4] xhci: sideband: fix ring sg table for sub-page TRB
 segments
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-16k_offload_v1_b4-v2-1-8a46369ebbb6@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfX6tIXh7cvpVQY
 /OoYXa1QKxZA5nEW6ePNHbyFMMEZdSkYyHActmnpRoyUOzSwKDpzUO8hxwhyDAxeroXPXgwXFKs
 UULvyZG3Xi1YxbOhsYNIuQxZHjj+Zao=
X-Proofpoint-GUID: hesJaeabglOsL2ak83SRzBJFYTHViG5W
X-Proofpoint-ORIG-GUID: hesJaeabglOsL2ak83SRzBJFYTHViG5W
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a91ffb6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=aXGjAn6Wb1zARzc8srgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfX6Ah+FCOpxgZ3
 /+gc3JIL6b6V9VsUlw1ZF8O4FoNH42RF/IQRbsVmJvVN05n8dGjKCY0om4D4/OZbD5iXPF5XA5T
 I3WBDcuc21OYmFPBRJneIu+Kr2UwzmAomYm5m+w5OXsWsFJLIzndNOfdEApp9tD05uF0pN4PjLI
 7oi7zryqv3RCiwYWQTY4j2OdlW5ygY/1BbGb72Ec6SzHuPIwV2hlNJX5EwkjQbrtVNih/8aioPz
 QSPKyVDalRelDqqA1lviM38crzWXtZnZdaI0fukM4pxz8cMZsMVTQUDXCkcGamKEEQ/wKgZ8Iy0
 ty7g2EuytDp+LS3ff0RiXeMtfxUYulgl2qyyUGiI/SjHq0u/jeUTyWGp5NthjRgRH7yAzD6z0z5
 CJvdSp5EBJl2G+/nJ2ZX0yrJQoDphrWpOo+70fGY0vC4i2i2ESdTq8GqSY8FexphtfOx8PSxvTg
 dDswetNeoo+EKEemi5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280188

xhci_ring_to_sgtable() sized its pages[] array from
PAGE_ALIGN(sz) >> PAGE_SHIFT and always passed offset 0 to
sg_alloc_table_from_pages(). Since TRB_SEGMENT_SIZE (4096) can be
smaller than PAGE_SIZE, multiple ring segments can be packed into the
same physical page, and the first segment can start at a nonzero
offset within its page - PAGE_ALIGN(sz) undercounts the number of
distinct pages actually needed in that case, and a hardcoded offset
of 0 silently drops the first segment's true offset.

Take max_t() against ring->num_segs so there's always at least one
pages[] entry per segment, and capture the first segment's page
offset from dma_get_sgtable() to pass to sg_alloc_table_from_pages()
instead of assuming it's zero.

Assisted-by: Claude:claude-sonnet-5Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/usb/host/xhci-sideband.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sideband.c
index a5deeee4d5dc..1585c47720e0 100644
--- a/drivers/usb/host/xhci-sideband.c
+++ b/drivers/usb/host/xhci-sideband.c
@@ -24,10 +24,14 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 	struct device *dev;
 	size_t sz;
 	int i;
+	unsigned int first_seg_offset = 0;
 
 	dev = xhci_to_hcd(sb->xhci)->self.sysdev;
 	sz = ring->num_segs * TRB_SEGMENT_SIZE;
 	n_pages = PAGE_ALIGN(sz) >> PAGE_SHIFT;
+
+	/* TRB_SEGMENT_SIZE may be smaller than PAGE_SIZE; need one entry per segment */
+	n_pages = max_t(unsigned int, n_pages, ring->num_segs);
 	pages = kvmalloc_objs(struct page *, n_pages);
 	if (!pages)
 		return NULL;
@@ -51,11 +55,13 @@ xhci_ring_to_sgtable(struct xhci_sideband *sb, struct xhci_ring *ring)
 		dma_get_sgtable(dev, sgt, seg->trbs, seg->dma,
 				TRB_SEGMENT_SIZE);
 		pages[i] = sg_page(sgt->sgl);
+		if (i == 0)
+			first_seg_offset = sgt->sgl->offset;
 		sg_free_table(sgt);
 		seg = seg->next;
 	}
 
-	if (sg_alloc_table_from_pages(sgt, pages, n_pages, 0, sz, GFP_KERNEL))
+	if (sg_alloc_table_from_pages(sgt, pages, n_pages, first_seg_offset, sz, GFP_KERNEL))
 		goto err;
 
 	kvfree(pages);

-- 
2.34.1

