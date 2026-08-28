Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183CE3DDB1A
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 21:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787953084; cv=none; b=Nyk7HUHHrNgWQ6aj6bOirDNz03MKjCF/0jh6u1UT7rFFVM1mWGIMBbjt4zJCDqPur35SMEE3NUJe3KUHSJNTPzjmz4swYTi4OG0YKIyjJa2nSsFI0ecx2P7AjmDqcJUxo1hc62ga+8taLpzNsZyY68m9vdcFKsA9iIgo6M57bA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787953084; c=relaxed/simple;
	bh=uIuRToF6+GYeUp9B7mtrYh1Ht28jMpvmqqD4otUBEic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pzYZbCfBeIf6dnx0ShxhjmASnooa2HcqN3QlTN4fAnzwCpjF7EflkUj7xYmGSAqm+bDvlVQ2jc5PMaaRz648ua/zIFcDmlOMo9HbwOYr+botMf6ud6UfAd9IjiEg+pVbf+dgdDW2Lq+3hyftaLDRYoVfibIYNiARz0lxm3Ylmi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LfscWWmg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T95E4Hk3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LfscWWmg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T95E4Hk3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SKZxna492780
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 21:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abItBtmIQwjb67EQFY51LZAO+X7YMVVSbxtZU8hrtr0=; b=LfscWWmgywmJ+L06
	quLxcxKpGSHQwY1IWXYpbR3YL4uBQqz79EPOUlAhBmzgYr5xXz3tZV2ZxsQtVNOX
	0OBf5hrQ84mtDgf2yO/cJ4zJHS7+qpm+hhFvcFC68UCG+eIuy8eDx7d9HmhSlow6
	q0xyITthKr62YKbVD55ATopXV0Ya9SxZ73YIzV9j1c2Ot+Jw30YAr+hHEhK59Izq
	tOqQ85/1jZgFXQHW3lHasEOOR42skokucqmDzkAjUhLeeAbd9zKDPcbGSBHyvxz2
	JIzXSdngaeAM25obE0HQ3JPcrQBTR2fDiyPjAMLqBATrbn0jMXqNdbUdb0MVpia0
	1YdNFw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbhgtr524-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 21:38:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6fed0652bso21008045ad.2
        for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 14:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787953080; x=1788557880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abItBtmIQwjb67EQFY51LZAO+X7YMVVSbxtZU8hrtr0=;
        b=T95E4Hk3q0AQDGiKD+su7DDaRI4MCQunnxyXoc207aVED609XA8C86pZugpIUdCEgy
         49Hxna5P3WDkwltP3XM3EupfK9QiXLubnczX5+iFGLWXaych/Wlvt8QJbcrdtd/Jdpq8
         ciL92nQvZzPLUTkQ6Ctgn5vfKUCPW1lSGt8P/wCR0VRf7YYly6hFOC1vvfeVoN7a66WA
         MhXIzA+mVVtxNi0jAx/S6/HaMximBV0XtvIAPkjCydSMT2jp3NEkBZ0e1qiKJgDrzOhy
         OgrM5tUZ7S86e8vDt4gBdnGYWDpFYyoyUhzR+PISoY8x75zUH2Q+nmxZWHzE3a5GYAkS
         ZEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787953080; x=1788557880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abItBtmIQwjb67EQFY51LZAO+X7YMVVSbxtZU8hrtr0=;
        b=FOPNpxz5B11/dab2FEK85Rcse2+0pS+S38m+wR+gqUdRKm8tZFQaQQWTgUGu5vz/uU
         4Y+iyipISslfDQSVxcksmui6QPjrx45Qomz/dT+USUa+m3XKQlpRJr9NHwjon+Z8ljth
         WFn5ys3CRU9a3ZG5STcRC2zIUYr8Cx5u9HrCnZyuRVO6sb+LLNKbsYvYFynDOr0wkUSu
         AjmCS6lYZE10cjmaUbMdu5NarccYuPRiHzRSYgQQ3asnwwCokyaVu9BX4ixkjHVmI32F
         nP8HBf2IjVPqyusUttweh9TeiwzSeAgXH1rhRzUof8OqXG9Z7YbfU6Ebp5trNXUW/zD0
         x1xg==
X-Forwarded-Encrypted: i=1; AKwUvBzDm4QnlZ1Hs0/ZkecSZrREePBNh1/dPWPa9+F9OZPnoL2aPipP/S7YX8wmliiHhU22Hd5QGEyQCpgY6w==@vger.kernel.org
X-Gm-Message-State: AFuF++nXbk4QtR6p+dpmrzJBAXVnrQAZVX8+c0P8ZDnGMx0ekS33rsnO
	hitF9FlTPwR9JUvPMcgxW8EJxdMrqqZV757DKC4eN0k2cbfv/afzzQQRHIuDzTcmnZKk87HPOCw
	e6dUEaWUv9850rFcDF4gIjmwP2x50ky/rlFt4zwYl2rK2kBA8CsewX8N4j6Ljq8iQ3nLBfnEH/Q
	==
X-Gm-Gg: AYBFou3kmveXOwgN8ZGk/xpTRFjhuusC3vPFbbNK16NNM1CWNXehEpn28xZ2gS5DWG5
	gd0eAxYOOmdszoU/ot11hgLpnrpHv0m2+0uFFeSZnavFcUY9Iyi2NojcQ/daG9ay/SsM/EIRYit
	cZUjQHv6jvwxiKMWIEfqmvmSHD7J1KU/ufzNaLi2YNf0fnOdoPxVo8nwIaK1xEKmAJJ/Dy6FOCT
	ERWYPdy2a8771ZvtdKklvRcuMVeG3yZrpXjauhNSl381wI+WWenJUTCfYJHK+re1wyzzMeNg7Yx
	qhwQ/BlikrANbXoVGS4gXhezvjWtCfyVixEdqvn6P3uvYuGgQ/zpMwqh6+vmnZYdS4T9xoceK9R
	h7laiOSLG4Kr1I3bUUmDeVY/H2mwRyFUvJ4PNSKwWpNY/EofaAxRI
X-Received: by 2002:a17:90b:2c88:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-396d0f52a0amr18763177a91.8.1787953079764;
        Fri, 28 Aug 2026 14:37:59 -0700 (PDT)
X-Received: by 2002:a17:90b:2c88:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-396d0f52a0amr18763126a91.8.1787953079236;
        Fri, 28 Aug 2026 14:37:59 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm5892112c88.11.2026.08.28.14.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 14:37:58 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:37:55 -0700
Subject: [PATCH v2 3/4] ALSA: usb-audio: qcom: tag sideband endpoints
 before ring allocation
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-16k_offload_v1_b4-v2-3-8a46369ebbb6@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfX33ZtYg3b7bnk
 yMQNQyI/VeybB8wtnlSgnPkhnvsTKcrTx1vSoYzSluFsbQsMBDEOjvciy3VW+fbJsgRvT8lh/HL
 r9eS58x1xDEQuIr/1tU5dRyeWUDiOa4=
X-Proofpoint-GUID: rD0JMRKLn5tSlNM08A3vdxhQrbG6NBLF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE4OCBTYWx0ZWRfX8JPgMyLF5GCj
 kSyULU+apirLebo2JKYiD6U4WnXZ27tHtnPCLijK4YSqvXly2L9yikrS3dg7cK56kUMLcw5u+jX
 2m6d3FQTZKiNbBsgrXIDh+ovFAcpTbIo3zK3ajcEDe6l+ibjUrtLMRTBpQ0cKS2aOOHPW38d8/W
 xEuvOlkt4/oMnJxzOeXWvk1+qZYivhr0gszX/93xgI5RR37WAAhJpFiP5UAqwVmyuGH+vn+7rhw
 3oQR9QvU+pnfiOpIQkKNoIHoPav5GHGt7Yzgqk1Q+fhJXoxbniBxGCXhjMMsWTfevfPGLjCTG4D
 s1EvkUp1Bo6guDakoJ7vzpoiHKLOWvaEDxn2ttUw4BuiJBU4k8Jnt6KwLUtT15melZt1qZwqX0r
 xhllJ7IDzeZXWFQNnWjbB0eZJA9O+rXT7KiaHF9vPNrl1+SDSTUb67GrXJVLIeenP49V18hF11+
 4bT50M3o/pJXvVhNYFw==
X-Proofpoint-ORIG-GUID: rD0JMRKLn5tSlNM08A3vdxhQrbG6NBLF
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a91ffb8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=CbMfP9IJxQ5wjS32uxIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280188

xhci_endpoint_init() picks the ring's segment pool based on whether the
endpoint has already been tagged via xhci_sideband_add_endpoint():
sideband-tagged endpoints get their ring allocated from the sideband's
own segment_pool instead of the shared xhci->segment_pool, so the
buffer reported to the ADSP over QMI is guaranteed to come from a page
meant to be ADSP-visible.

xhci_sideband_add_endpoint() must therefore run before the endpoint's
transfer ring is first allocated (i.e. before snd_usb_endpoint_prepare()
triggers xhci_endpoint_init()) for that pool selection to apply to the
first allocation. Move the xhci_sideband_add_endpoint() calls out of
uaudio_endpoint_setup() and into enable_audio_stream(), before
snd_usb_endpoint_prepare() is called for the data and sync endpoints,
and unwind them on the new error paths.

At that point in the setup sequence dev->ep_in[]/ep_out[] are not yet
populated, since the endpoint's altsetting has not been activated, so
usb_pipe_endpoint() cannot be used to find the usb_host_endpoint. Add
uaudio_find_host_endpoint(), which resolves it directly from the
interface's altsetting descriptor table instead.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c | 93 +++++++++++++++++++++++++++++++++------
 1 file changed, 80 insertions(+), 13 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 1b8877b8ee62..bd3f84a3652b 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -942,6 +942,45 @@ static void uaudio_dev_release(struct kref *kref)
 	wake_up(&dev->disconnect_wq);
 }
 
+/**
+ * uaudio_find_host_endpoint() - look up usb_host_endpoint for a snd_usb_endpoint
+ * @subs: usb substream owning the target snd_usb_endpoint
+ * @endpoint: sync or data snd_usb_endpoint to resolve
+ *
+ * usb_pipe_endpoint() resolves via dev->ep_in[]/ep_out[], which are only
+ * populated once usb_set_interface() has activated the endpoint's altsetting
+ * (i.e. after snd_usb_endpoint_prepare() has run for it). Looking that up
+ * beforehand returns NULL.
+ *
+ * Instead, look the endpoint up directly in the interface's altsetting
+ * descriptor table, which is populated once at enumeration time and stays
+ * valid regardless of which altsetting is currently active.
+ *
+ * Return: matching usb_host_endpoint, or NULL if not found.
+ */
+static struct usb_host_endpoint *
+uaudio_find_host_endpoint(struct snd_usb_substream *subs,
+			  struct snd_usb_endpoint *endpoint)
+{
+	struct usb_host_interface *alt;
+	struct usb_interface *iface;
+	int i;
+
+	iface = usb_ifnum_to_if(subs->dev, endpoint->iface);
+	if (!iface)
+		return NULL;
+
+	alt = usb_altnum_to_altsetting(iface, endpoint->altsetting);
+	if (!alt)
+		return NULL;
+
+	for (i = 0; i < alt->desc.bNumEndpoints; i++)
+		if (alt->endpoint[i].desc.bEndpointAddress == endpoint->ep_num)
+			return &alt->endpoint[i];
+
+	return NULL;
+}
+
 /**
  * enable_audio_stream() - enable usb snd endpoints
  * @subs: usb substream
@@ -959,8 +998,9 @@ static void uaudio_dev_release(struct kref *kref)
 static int enable_audio_stream(struct snd_usb_substream *subs,
 			       snd_pcm_format_t pcm_format,
 			       unsigned int channels, unsigned int cur_rate,
-			       int datainterval)
+			       int datainterval, unsigned int card_num)
 {
+	struct usb_host_endpoint *data_ep = NULL, *sync_ep = NULL;
 	struct snd_pcm_hw_params params;
 	struct snd_usb_audio *chip;
 	struct snd_interval *i;
@@ -998,17 +1038,47 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 			goto detach_ep;
 		}
 
+		data_ep = uaudio_find_host_endpoint(subs, subs->data_endpoint);
+		if (!data_ep) {
+			dev_err(&subs->dev->dev, "data ep # %d not found\n",
+				subs->data_endpoint->ep_num);
+			ret = -ENODEV;
+			goto detach_ep;
+		}
+
+		ret = xhci_sideband_add_endpoint(uadev[card_num].sb, data_ep);
+		if (ret < 0) {
+			dev_err(&subs->dev->dev,
+				"failed to add data ep to sec intr: %d\n", ret);
+			goto detach_ep;
+		}
+
 		if (subs->sync_endpoint) {
+			sync_ep = uaudio_find_host_endpoint(subs, subs->sync_endpoint);
+			if (!sync_ep) {
+				dev_err(&subs->dev->dev, "sync ep # %d not found\n",
+					subs->sync_endpoint->ep_num);
+				ret = -ENODEV;
+				goto remove_data_ep;
+			}
+
+			ret = xhci_sideband_add_endpoint(uadev[card_num].sb, sync_ep);
+			if (ret < 0) {
+				dev_err(&subs->dev->dev,
+					"failed to add sync ep to sec intr: %d\n", ret);
+				goto remove_data_ep;
+			}
+
 			ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
 			if (ret < 0)
-				goto detach_ep;
+				goto remove_sync_ep;
 		}
 
 		ret = snd_usb_endpoint_prepare(chip, subs->data_endpoint);
 		if (ret < 0)
-			goto detach_ep;
+			goto remove_sync_ep;
 
-		dev_dbg(uaudio_qdev->data->dev,
+		dev_dbg(&subs->dev->dev,
 			"selected %s iface:%d altsetting:%d datainterval:%dus\n",
 			subs->direction ? "capture" : "playback",
 			subs->cur_audiofmt->iface, subs->cur_audiofmt->altsetting,
@@ -1020,6 +1090,11 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 
 	return 0;
 
+remove_sync_ep:
+	if (sync_ep)
+		xhci_sideband_remove_endpoint(uadev[card_num].sb, sync_ep);
+remove_data_ep:
+	xhci_sideband_remove_endpoint(uadev[card_num].sb, data_ep);
 detach_ep:
 	snd_usb_hw_free(subs);
 
@@ -1141,14 +1216,6 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 
 	memcpy(ep_desc, &ep->desc, sizeof(ep->desc));
 
-	ret = xhci_sideband_add_endpoint(uadev[card_num].sb, ep);
-	if (ret < 0) {
-		dev_err(&subs->dev->dev,
-			"failed to add data ep to sec intr: %d\n", ret);
-		ret = -ENODEV;
-		goto exit;
-	}
-
 	sgt = xhci_sideband_get_endpoint_buffer(uadev[card_num].sb, ep);
 	if (!sgt) {
 		dev_err(&subs->dev->dev,
@@ -1638,7 +1705,7 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		ret = enable_audio_stream(subs,
 					  map_pcm_format(req_msg->audio_format),
 					  req_msg->number_of_ch, req_msg->bit_rate,
-					  datainterval);
+					  datainterval, pcm_card_num);
 
 		if (!ret)
 			ret = prepare_qmi_response(subs, req_msg, &resp,

-- 
2.34.1

