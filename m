Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749202;
	b=xu6Zy6OJfMXaK2dzeuZfTmF4yv0dhO5T+0a+8aw8o0MJ1dGylH/jbynqXM1qD8/2GzDT
	 v8FNFdV4wRWRvZyaTmEH5Dh+pnUDzyTy2EJcyQTx/p1XDGAFw03dA1bd+huRh/HMqapct
	 XZaxbVkkF6aqca/Rcgj3rAOf5iAqvss+S2+XJCkwvkEZ0HC8hxdwnclH3uC3HfqePbcyF
	 ELm92JD9AxvTJeJPO66xbvVUG8+apaeMEBtiK5I6wlcIvcbSBQKBN5R3E/PpeTulB+EM9
	 5rP2Y4lOJxvjGIgF4I0X6/IS6oCP0qt/08WJJH58JL0UR0GBAvMNTfk+snhW4qtvnfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749202;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lvXZcfaa+HN98EXHPn5d1WDUoJ4ZesFQ3Otqng7SRvs=;
	b=yrpmVHR5P3i5oMOzy/4u8LIsMLPW85ThgYLeR3TwIPMKy+xLYsdC4lcF71OgIlZRThnl
	 cHPTO/VMdaG68wzIue+xv0nGfN+XjwQMlskoVW5+J87Bto9jDRPbSK4RwZlXEGkaFxzAJ
	 23EnIcO+F/Z6lKYFb3Ii5z5hpLWckq+bVgHec+kwSpFvAwPXwFwqRSeMlqHYKf1MQ6kdZ
	 As+86I1TvRjiTGlT7WMBAhilODhzwjGmpF04CH5DmU53HqHK6HwLoauG5ZKKHNmbmqD5D
	 7SEn//hDf68AH87VN+Xy13IQec/9kuNmaYKvqyME3+5vDBdD2ARNSiKGeToEasEPvdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A+058vLe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HC6rcW/g";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7958B606A33C
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 23:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7958B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A+058vLe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HC6rcW/g
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKilu3993609
	for <linux-sound@vger.kernel.org>; Tue, 3 Nov 2026 23:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lvXZcfaa+HN98EXHPn5d1WDUoJ4ZesFQ3Otqng7SRvs=; b=A+058vLe4yk1a4Ah
	mUwnCinRo1m4OuqqVF+g1tVczfD6Kfq3Aje95zEQW/OWC94p3mGxs7P70MU3N34X
	xuvMOTCXo7xsCOTvJOMicneiSgxDCkzcjHwtRXs7vNjNOM8QGBK9Ta48VmiZXIkz
	fmbp6duji1R9SuoZOnG/GJOWFpD9shv98dlJMn3xBvvC/QmAKZpJuHg+Wr4czU6M
	5txUSEVv6HF9u7IDE/KNgh1lkdhYj0PR+u5MME6FD8GGfWutjrCr32DfdanHCNuk
	IQDiaRl4qp+gAVfZLF2cSF3Tq5FoJPwQFPEvqawioTBkemF2M9ziuTMre/abtN1K
	SayxNQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8ngxqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 23:40:00 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so598651c88.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 15:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793749200; x=1794354000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvXZcfaa+HN98EXHPn5d1WDUoJ4ZesFQ3Otqng7SRvs=;
        b=HC6rcW/gQELyjPO1QsNgqY6vn6iag8YYVn/CMqG7vleaQswD7efIfTVB7pGNThdeOd
         nmDZISbBWsW4Wh9Ln+BAPXdz4naBkagNEC3JpfzBgQPl9jv9ZPfIPFgYYRFXqz3FBTSU
         KTKaHS2SdsC9e+rgF4q9gz/EJP7uerxlzQgQhlfvKyKtb4HknOMKU0M3MNTufLe5BHLZ
         +3suMkl5pk0N0AHuXRPPjfIaYIGTZFi9gfHWrc+zMoCRh/XUJPXWd4QfpxDG6zboCFug
         Db/kYL2PwSoDSgCM622GoX5K3WfQct1xeJ9Py6LlM4k6ApReQaifmt166nLqdLleSz/E
         /WXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749200; x=1794354000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lvXZcfaa+HN98EXHPn5d1WDUoJ4ZesFQ3Otqng7SRvs=;
        b=tjlaeR4gcSUizNgu1gB2nAmbRhzDgqG+YgUOX1tdfMyzAriclAFcDIkCZtaZPhRVw4
         ZsaAgUVA7HBSdAQeVFEqMZ/8L6jWcQznmsE4DGl9zFvRNml4ZpFZOgQQ0y3rEz5udTZC
         00MMD9ZgE89fpX86eswOcLExadGH4QrbB60X/e73AOPe7PRHU/G1ou1Ed5tM2rATH0as
         ioaNCprFn52duYdL9teDVODMT3wVOf+OEMzGWsy7j6WSeGK1zKp/q7/1mTEVZ2JsagCz
         tCdUS8IN0csVMkrwF6GNRxPEVjXaCxicLlfq+7j8Df2EIdqa1lRmSBG6VnosGciop0HH
         uqiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgcfZj/Sum/EgXt495rjYd/xYVmwlL3JnlplqOCiP/KuEU+dsv8W+GWU5oQK2uLIdnc5iFTk+xQnex1Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z///DOfnD16XwkEcdX1c1yYqRW1jrdLxUYvrpAPlGd4WYSjRKbh
	jNC+YJncH7iDZQmleAYpyLmtNP3msR9kRggPCAkfzFbuBC7gbxQWQYCBcz2MrlyIFr4hxCFsH+3
	4tvxmhKWd6s6u4oO0O+cyDYae+jgXMzMu4E4c3UGolF8f2NsI+kRqK39aYMdIVTNRsg==
X-Gm-Gg: AYBFou2ATp9b/fURjRpKxr51E2eInZ4L/nfk4kjWBpUWNGpfDdB6qK56Cb58KfkQbq6
	y0q9BY1YCfwfi76QSzdYBOoM1zOcJk0EvnogUryI3Fl3ZfgW4zXx7+SHOwc6NFMEUWiT7CA7niW
	P9UNPSRJGF91Q5EHMCI5PWCiAtQIMg5a0Q/VW9DIaaMvtlWcSQ8wY0fuTOKYE8sa+fI0ubZoWIT
	/L/9qr6c5recIiiDB4iId5pDZVudzbqTysoNiLfrpZUk+d3FFjiEWVA30Z5XmUkLmNpAgPgqg4W
	lfj293hYOfXxQ8uYkz45zb6AAbToZhnz3P+eP72UA3AQNLODlHDl+ETAbcYexAdxz4wm52Xt4lM
	16z3gPdBBN6kUUSmSZkjvqbaY1cRaQBBya29U35iGSe1fHD54rT5eys8BISRUTvEyNzpIZm9XjX
	iqxJJZlR1Lwm4s1/Boon2l8y3xdA==
X-Received: by 2002:a05:701b:240e:b0:1b2:3e9b:3dcd with SMTP id a92af1059eb24-1b23e9b3e26mr4717148c88.10.1793749199960;
        Tue, 03 Nov 2026 15:39:59 -0800 (PST)
X-Received: by 2002:a05:701b:240e:b0:1b2:3e9b:3dcd with SMTP id a92af1059eb24-1b23e9b3e26mr4717114c88.10.1793749199083;
        Tue, 03 Nov 2026 15:39:59 -0800 (PST)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b86fbesm2356442c88.1.2026.11.03.15.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:39:58 -0800 (PST)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 15:39:55 -0800
Subject: [PATCH v5 3/4] ALSA: usb-audio: qcom: tag sideband endpoints
 before ring allocation
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
Message-Id: <20261103-16k_offload_v1_b4-v5-3-67184126e91c@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfX9Phxv5xqxtyu
 Y2CQpmK3C3ma+JNuQ27T321rZPJ5qVJqkQBU7RAgEPD2Y7r4hGI7zYyVPUrqUM//csvBS0dVulL
 fznxc0yGHCX8UZmmIm+41m3mDL8Ck1J2QPfum3fKw0yydcgtRrDydWJU+54AoRhyuLXm56I+4dS
 lt4b03bkP8F/+kezPhQuZgvI2JBuDCRkvD/ubRJoLjFQaC1Hn5b6zAVlmS5ZTvrfqblOgEXHRN+
 7jlVwZIX+91I94aYOClEOqryE0hb34FPA2FjkkTY9fb667iz9/gbE7vFZh++gVquyYcIjrDUXkK
 2+Juxfo5YJQiT+125SRh+Zw9DzGoKQ4o4oYseE4U2TleJlyRcq+VV4mNBHlbH2tD5naGRgTZv+b
 XnVc5eTLDebwHI49Ld//w+3tjurcnzKyLuALaoVghAhJb4brmsNdKBfUHFskWBT+4CMsHgs+gWk
 gzq9u8DJFbPsblkZmVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5NCBTYWx0ZWRfX47ltxYqn6/DM
 E3DxASGe6ac1zXZZVwHpn/GKhULb+O7ojyRgWLyS2Grqc4N4hbBDzZz1Lav6TRLDtM0FaLJJb4l
 UksmxCjHDJLLRFGey1AKUBhN+XNsrsU=
X-Proofpoint-GUID: mkZeLBVRrxFUmdIUjJfI9IwURxjIslAj
X-Proofpoint-ORIG-GUID: mkZeLBVRrxFUmdIUjJfI9IwURxjIslAj
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aea70d0 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=N4D07k82oIDTXTuHkvEA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030094

On kernels with a PAGE_SIZE larger than TRB_SEGMENT_SIZE,
xhci_endpoint_init() allocates the ring segments of endpoints that have
already been tagged via xhci_sideband_add_endpoint() with
dma_alloc_coherent() instead of from the shared xhci->segment_pool, so
the buffer reported to the ADSP over QMI is guaranteed to come from a
page of its own.

xhci_sideband_add_endpoint() must therefore run before the endpoint's
transfer ring is first allocated (i.e. before snd_usb_endpoint_prepare()
triggers xhci_endpoint_init()) for that allocation to apply. Move the
xhci_sideband_add_endpoint() calls out of uaudio_endpoint_setup() and
into enable_audio_stream(), before snd_usb_endpoint_prepare() is called
for the data and sync endpoints, and unwind them on the new error paths.

At that point in the setup sequence dev->ep_in[]/ep_out[] are not yet
populated, since the endpoint's altsetting has not been activated, so
usb_pipe_endpoint() cannot be used to find the usb_host_endpoint. Add
uaudio_find_host_endpoint(), which resolves it directly from the
interface's altsetting descriptor table instead.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 sound/usb/qcom/qc_audio_offload.c | 86 +++++++++++++++++++++++++++++++++------
 1 file changed, 74 insertions(+), 12 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index e4bfd43a2488..48ee55116004 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -941,6 +941,40 @@ static void uaudio_dev_release(struct kref *kref)
 	wake_up(&dev->disconnect_wq);
 }
 
+/**
+ * uaudio_find_host_endpoint() - look up usb_host_endpoint for a snd_usb_endpoint
+ * @subs: usb substream owning the target snd_usb_endpoint
+ * @endpoint: sync or data snd_usb_endpoint to resolve
+ *
+ * usb_pipe_endpoint() resolves via dev->ep_in[]/ep_out[], which are only
+ * populated after usb_set_interface() activates the endpoint's altsetting.
+ * Look the endpoint up directly in that altsetting before preparation instead.
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
@@ -958,8 +992,9 @@ static void uaudio_dev_release(struct kref *kref)
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
@@ -997,15 +1032,45 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
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
+				"failed to add data ep to sideband: %d\n", ret);
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
+					"failed to add sync ep to sideband: %d\n", ret);
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
 
 		dev_dbg(uaudio_qdev->data->dev,
 			"selected %s iface:%d altsetting:%d datainterval:%dus\n",
@@ -1019,6 +1084,11 @@ static int enable_audio_stream(struct snd_usb_substream *subs,
 
 	return 0;
 
+remove_sync_ep:
+	if (sync_ep)
+		xhci_sideband_remove_endpoint(uadev[card_num].sb, sync_ep);
+remove_data_ep:
+	xhci_sideband_remove_endpoint(uadev[card_num].sb, data_ep);
 detach_ep:
 	snd_usb_hw_free(subs);
 
@@ -1140,14 +1210,6 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 
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
@@ -1637,7 +1699,7 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
 		ret = enable_audio_stream(subs,
 					  map_pcm_format(req_msg->audio_format),
 					  req_msg->number_of_ch, req_msg->bit_rate,
-					  datainterval);
+					  datainterval, pcm_card_num);
 
 		if (!ret)
 			ret = prepare_qmi_response(subs, req_msg, &resp,

-- 
2.43.0

