Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749200;
	b=kOw4V7X29Ipj3+kqmLuIXQ1ui0guAy8jFx561rzAuRfcZ+X6W5JLPwnRkSribvi8yrks
	 Oc9rPT2c4/u40BkzU9584r1g8iMM+ArqioUZyv7qLZmEPpzvqYQAtKeXJox4Pld2+KEfI
	 xuZ+mYLVS/UZzOafyqga/IzOfDIbH3tUhsz2DZFXnwkTJP852BbseEFNlYkVqd5lREvo8
	 HfraOcd6d5Y1h4hLSCKW39e0vMDlWzZLi1eg9cNMnEGr8ue7+9XIsSkeZU/nRzRiQ+nHr
	 wtOJVAUutluXj6Yjx1kd/o0qmHWQUaSdQr6fiP4Ls3x2YLeQEKplzA0g1B4kyJ4Ippw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ODVxWNmMdKejpIzRU8i3GHd6rEhkDG7I1sweDfnrATo=;
	b=d6Evnc8L5x/ihIpnJ1Pmv7rCl5FnWffjmJ+PR5stm+wNZKeTHrkhNbv3I4YXMc6N/r7H
	 4GQrTCGiBVapCPBet3dU/P0rX+MzDfa9KFSRp9qxZPeA9azSWnvAUxy3KqltcSmypiC+n
	 WYBPGeQZFJD2j64BUnqeUN7FG2xp4OKsRpd8pj1TZ5uo4T8WlvhEg0bvB1IFS3svsaFNV
	 afhiblyy39as5QeidVa/f/Hr4V9FqYw0Wc6ltVjZbICns9AzUjhGJVxr5UD1bRivpryDw
	 mMFc9d1PgCDlpKPgYjfYBOCR2yHArAZKZd5eduqgMbDTvOKQeyXaelI9CLxFZOicBxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lZEyuYbu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UN0xhxj2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FE3606A324
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 23:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0FE3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lZEyuYbu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UN0xhxj2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LLBUu2944270
	for <linux-sound@vger.kernel.org>; Tue, 3 Nov 2026 23:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ODVxWNmMdKejpIzRU8i3GH
	d6rEhkDG7I1sweDfnrATo=; b=lZEyuYbuAB7ar7h/AwOhYRaQbwpENXlMH+h1Fs
	D6we0IyqXug9+RAR3QJzxE2ynG9sfNBEs8C5XDcf131eDha9UzsctUywI2Sbymyk
	AxVgvo6vLnZDLnb3ufrtBzwc3zboj9ih4AmdoCFRRBeR0EI0FXvltPnOkvlTOUrZ
	gFngAXl7HkYa7JMY5myZdEkCvnMnwuLTS0UoixZslqBaTWu81N0Hj8NWoNoB3ais
	e5gBVDFC5pCWDYodmmKxRAwW++/OgOYE65p6oq2oEyJUcWQyQqm21Z8e4Ocfu149
	WZEAJdA65q15+HOepi9aRv8Oy5zUmXoY14y8kb27suU9qFyQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbs4hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 23:39:58 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b238436265so138563c88.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 15:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793749197; x=1794353997; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ODVxWNmMdKejpIzRU8i3GHd6rEhkDG7I1sweDfnrATo=;
        b=UN0xhxj2/nWkAo9g7RQaoWh2JoMOTqUd9oLkZRqgOhfvE+KKToUqDsCsVhMFep3TuU
         i+GpdFSCjaRHnc40PRWVETRbyrkQOqhcm0rdtkQxKN5ObNlkdLooyO/Fsk1PxGBIL3dI
         McS66ij48BjTZuOxI6CrK6yTi8wEonUDudIYZ/bDGnxZKkeuIKriJ/8GzRq468AEaoIH
         DIrl926lPId6Vu0zzxpxYxmrNka3mqZ4B2zG28/8hgbLKE3u0PWykj5/kC0kIZnqsfN5
         eAa+Npr2en/9QmZuuwdUQwi2BX+y/xX77hq6l/pi+rBmDULQ6Q8pkO9bij1r0rCIlSc0
         LvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749197; x=1794353997;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ODVxWNmMdKejpIzRU8i3GHd6rEhkDG7I1sweDfnrATo=;
        b=H2aN02IC5DCzCAvjJxcmo9AM27z8+Xrm8qu/NfD+jMI4gHlbcECdnWIvNPNKjxz2iq
         g3kAnDRjNHIpOXDRe0214h+ZnhddqitVVNJhmhkwpO51Cnvf/Wrq89F2KSLYBb45zjix
         RsxM6N5WhJ2NhXAjN+8G26/hShW1xRuPVAVwKwvkXWAVC455RTI1wVTRA19jeh4HZp3s
         XP+MRreo3uGtq5ncxeS7LaDuq2vGshqJ6ZyhQqv0Yyj9IpW22tHb0I9nHLXIquQHpF/K
         KWfWPMmkFHDUupnflrmS+0iSoALVG2rv4CTwYwPStGFqIqr/qjRR8Kjl7PLyg8FxUJmq
         5yug==
X-Forwarded-Encrypted: i=1; AKwUvBz20UGb3ifTvmN0A02sEcaUw+icPid+J0ogm2n75H4Jk4TctNx7/5lcTioLVTmO8ydtm16fm6+lAXXBLA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9XMvPNHDHdOh+wkeTJ+Vwzr2yfw3w5kLwYh1rKkWOTQm9/Mbc0
	NJeh7IeJpWz6IuzmMu9zMr0ZrN6kTCGsfCk1p5R1XCFbk1O3lmaJCsHy/kJdv1ToNiFQGdnFH0r
	4p1eHqUWsJWDp7jlqoZ1WetFCuOJc0VqoB1MMCfICbqnxpv+IkzOqecEcdy/ZPFscHw==
X-Gm-Gg: AYBFou0EhlXOjuPfqQW+pYEg50lbIqZLuoCfrmYMllrbMh4W0iTLlESiK6d3fWUVN7O
	mJQcfevhluzNQlPyWRsWGFYUndLmMq0dW6ERG4OJieSm4nTXN48NwB9IQoCJZh1HS/ldphEU21+
	kqvF9eDRWNEzgYjJxtmNC3Jo9KEV03QsTBY7micXJTYB89B/5HNQhJCd4FWNmaTInm1o2gTSsP0
	Ya0En6lh5sa1rSmeLY10y3ByoJRuLm7PnniWzqRVJXD55cgiso+GjvVlgpwj7VWVZSijyLnHjlx
	edSpdw6zie98nHftxNms/Vstun5W3hYS8L5s+P/OLy4YgFLWDUVdQvDksQyFQ/SKbYGTmkWT9Xw
	BAQALV99FZggZ1dmPCp01c3ARZVXn1KBSteJm3UZaZK1jYTVWhk0cMffFnRpjm+Zjk46ZFgE4y4
	HZgsCjMbpMUxDi7wSZQ9/y9O6kAg==
X-Received: by 2002:a05:701b:42d1:20b0:14a:d8fe:3390 with SMTP id a92af1059eb24-1ac5ceee0dbmr23120749c88.32.1793749197105;
        Tue, 03 Nov 2026 15:39:57 -0800 (PST)
X-Received: by 2002:a05:701b:42d1:20b0:14a:d8fe:3390 with SMTP id a92af1059eb24-1ac5ceee0dbmr23120685c88.32.1793749195761;
        Tue, 03 Nov 2026 15:39:55 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm2356442c88.1.2026.11.03.15.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:39:55 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 0/4] Add larger page size support for USB audio offload
 path
Date: Tue, 03 Nov 2026 15:39:52 -0800
Message-Id: <20261103-16k_offload_v1_b4-v5-0-67184126e91c@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMhw6moC/33NQW7DIBAF0KtErEs0wHgMXfUeVWUBxglpElqTo
 FaR716cLpKFk81IX/rz/oXlMMaQ2evqwsZQYo7pWEPzsmJ+a4+bwGNfM5MgCbRELuizS8OwT7b
 viugcctULJEBo2hZZ/fsawxB/rub7x3/OZ7cL/jRDc2Mb8ymNv9fRIubeM78IDhyNJRcIvFXwl
 nJef5/t3qfDYV0Pm2eKvIf0EiQrpC2SIhOcc/QAUjfIgFqCVIWEaozUvZcI+gGE95BZgrBCg0S
 riUTbmHYBmqbpD/mICsWmAQAA
To: Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: s9C2pqep3lJaQM0i6qlaXTSBpRbxVExB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfX+2nCFiGf9Zrq
 gzYXhsb0eduiudy47IT8iTnEwP6S+j2xALbng5qnZNPZxO8+H/45QgnEcyQJb1cfdCL25iXZMxj
 gurk9AeRPI5Bg2aFH/hSKHh5xflFqica2xrSQ2BIIGQo2taOPhoiI5gVaAEmnW1CuDh585kBl5l
 6mYBLzJEtNHhMnRJE3mZ3QS9adGWPcGcn3iMbLY7A7F/vNBND3Fa1E2n2ZCUIc8getUommnwJoc
 kMKjtG7mp1bAs+m31EKCTTK/Fs2SMyUM4ztj1w61XsHD4AugUj9Fs/9bt4oi4w3DME52T0w3qnC
 mmPdFDN2kayLMH6G75JSC+naMIEgA2X57sm1Uhru13YJCdSM+LpM8Gkma7SEQQ7QC/AeB6ySApR
 mPFZ7tdWdUnieOs1Km5I9WLfO59w4Yrq5M+39H6cJnvW6V1APuy6+uWy2WtUU0sYwRa3djZ4h15
 23EhqAvZ0CydRXlr5zQ==
X-Proofpoint-ORIG-GUID: s9C2pqep3lJaQM0i6qlaXTSBpRbxVExB
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea70ce cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=ag1SF4gXAAAA:8
 a=iox4zFpeAAAA:8 a=VwQbUJbxAAAA:8 a=GjhRyQdd-c_DPEUQ6LMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfX9VUmM+NC1bMp
 Be+/l5Xxp/NNREm/SnKfw7Ob4b16R7T+HZugeJzZgXXHi7vdzZuscas5JB8gYNFMUA46dJvoVIA
 l/lfNk4Gqur6Qpp1Y3gGWAqgRis3xPw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030094

On some environments, 16kB pages can be enabled from the Linux subsystem,
which manages the IOMMU mappings for the audio DSP within the system.  In
the current design, the following assumptions break when 16k pages are
utilized:
  1. xHCI ring size is equal to PAGE_SIZE
  2. Ring addresses start at the beginning of a page

When the USB offload driver maps the rings (w/ the audio DSP SID), it is
set with a 16k granular, which is a problem, as several xHCI rings could
exist on the same page.  This is because the rings are currently allocated
from the segment_pool.  Hence, potentially mapping non USB audio related
rings into the region accessible by the audio DSP.

To mitigate this, sideband rings are no longer allocated from the
segment_pool.  When PAGE_SIZE is larger than TRB_SEGMENT_SIZE, xHCI
allocates the segments of sideband-tagged endpoint rings, and of the
sideband secondary event ring, using dma_alloc_coherent(), which gives
each segment a page of its own.  Before the USB audio offload path is
enabled, the USB audio data streams/endpoint are not active.  Only when
the class driver issues a usb_set_interface() call (done from
snd_usb_endpoint_prepare()), will the xHCI allocate the transfer ring
resources.  The offload client driver therefore tags the endpoints with
xhci_sideband_add_endpoint() before that point.  The new ring allocation
flow for sideband/offload clients will be as follows:

handle_uaudio_stream_req()
  ▼
enable_audio_stream(subs, ..., pcm_card_num)
  ├─ data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint)
  ├─ xhci_sideband_add_endpoint(sb, data_ep) ← ep->sideband = sb; ep->no_pool_alloc = PAGE_SIZE > TRB_SEGMENT_SIZE
  ├─ snd_usb_endpoint_prepare(chip, sync_endpoint) ─┐
  ├─ snd_usb_endpoint_prepare(chip, data_endpoint)  ├─→ xhci_add_endpoint()
  │                                                 ▼
  │            xhci_endpoint_init(xhci, virt_dev, ep, ...)
  │            new_ring = __xhci_ring_alloc(..., ep->no_pool_alloc, ...)
  │            ▼
  │            xhci_alloc_segments_for_ring(xhci, ring, flags)
  │            ▼
  │            xhci_segment_alloc(xhci, max_packet, num, ring->no_pool_alloc, flags)
  │            seg->trbs = dma_alloc_coherent(dev, TRB_SEGMENT_SIZE, &dma, flags)
  ▼
xhci_sideband_get_endpoint_buffer(sb, data_ep) → xhci_ring_to_sgtable()

Similar logic is added for the secondary interrupter path as well.  The USB
offload class driver calls xhci_sideband_create_interrupter(), which will
be responsible for allocating the secondary event ring.

xHCI core remains responsible for freeing these rings, once the endpoint
has been dropped or the slot disabled.  This also covers disconnecting the
USB audio device while audio offload is active: usb_set_interface()
returns early as the interface is unregistering, and the rings are freed
later, when USB core drops the device's endpoints.  As xhci_free_dev()
frees the virt device with interrupts disabled, where dma_free_coherent()
can't be called, those rings are freed after xhci->lock is released.

This was confirmed to work on the SM8350 MTP platform, with the
CONFIG_ARM64_16K_PAGES config enabled, alongside tinyaudio binaries:

tinymix -D 0 set 513 1  (Enables USB_RX multimedia#1 path)
tinyplay -D 0 -d 0....  (Routes PCM data to ASoC platform sound card)

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
Changes in v5:
- Dropped the offload client owned segment pool, as suggested by Mathias.
  xHCI now allocates sideband ring segments with dma_alloc_coherent() when
  PAGE_SIZE is larger than TRB_SEGMENT_SIZE.
- Free rings that are not allocated from the segment pool outside of
  xhci->lock in xhci_free_dev().
- Modified the xhci_ring_to_sgtable sequence to address an error from Sashiko
  where it questioned the safeness of virt_to_page.  Leverage
  dma_get_sgtable, which will call the appropriate DMA mapping
  implementation.
- Link to v4: https://patch.msgid.link/20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com

Changes in v4:
- Split xHCI patches from xHCI core and xHCI sideband.
- Make the dedicated offload segment pool optional for secondary
  interrupter creation. (xfer rings support this already in previous
  revs)
- Fixed some inter-patch build/functionality failures in
  qc_audio_offload. Incremental builds between patches now
  work on 4k pages. (16k support at end)
- Link to v3: https://patch.msgid.link/20260903-16k_offload_v1_b4-v3-0-135928dc2408@oss.qualcomm.com

Changes in v3:
- Moved sideband segment pool assignment to when a sideband endpoint
  is added.
- Address an issue where during USB device disconnect (while offload
  active), where the offload client driver is freeing the DMA pool
  before xHCI core is able to free the dma allocations.
- Update xhci_ring_to_sgtable to correctly allocate and fill the sg
  table which capture rings within page offsets.
- Link to v2: https://patch.msgid.link/20260828-16k_offload_v1_b4-v2-0-8a46369ebbb6@oss.qualcomm.com

Changes in v2:
- Moved from using alignment_req to having the offload driver maintain
  its own segment pool.
- Fixed OOB condition seen in xhci_ring_to_sgtable() and will capture
  page offsets properly.
- Addressed inter-patch build failures.
- Link to v1: https://patch.msgid.link/20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com

To: Mathias Nyman <mathias.nyman@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org

---
Wesley Cheng (4):
      usb: xhci: sideband: fix ring sg table for sub-page TRB segments
      usb: xhci: Allocate sideband ring segments with dma_alloc_coherent()
      ALSA: usb-audio: qcom: tag sideband endpoints before ring allocation
      ALSA: usb-audio: qcom: fix xfer ring IOMMU unmap on 16K+ page kernels

 drivers/usb/host/xhci-mem.c       |  63 +++++++++++++-----
 drivers/usb/host/xhci-sideband.c  |  97 +++++++++++++++++-----------
 drivers/usb/host/xhci.c           |  13 ++++
 drivers/usb/host/xhci.h           |   5 +-
 sound/usb/qcom/qc_audio_offload.c | 131 ++++++++++++++++++++++++++++++--------
 5 files changed, 228 insertions(+), 81 deletions(-)
---
base-commit: 69f0645f043feed4dc07690c74597574f43c41b4
change-id: 20260824-16k_offload_v1_b4-3d1460405774

Best regards,
-- 
Wesley Cheng <wesley.cheng@oss.qualcomm.com>

