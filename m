Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883261DF73A
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 04:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778474208; cv=none; b=f8jaYz7+k9QnNM5OvdPy63GzJASdraL3GT143AM5nwZwq8J7lnu4+wS/+uSXsGTXzy03YYuWIY9hUQuLs+VtPAEXT1s1joI1y2yFIDGm5D/Y73DrDElfPyuyCiYWMmVA5IKbhH7fvpnZQ5V6YNj3rjBYNUX/xqUOl9zX4VyHsis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778474208; c=relaxed/simple;
	bh=xz4Q2/bvZnl47FmwyqOLbYEmF0mtTjZCnGvYrSSP7PI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q+LRK2WqA2Cip0LoAGdAB354O17a3GSRmDO8OC6MV9hJRS0igOiIZd0NTYda0zJZ3lC1Q4Jd+7GF7eSmCL/CBa8ba38aTOTbebz40ftY4Xn7cQ+vIq3W1CPfeZ0uGCaf1tF+EtB+2Qa+HnQyc246WGGGiewt21lf2Vwho0bY0Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgciqqKi; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgciqqKi"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-130b2295ed0so10833537c88.0
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 21:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778474207; x=1779079007; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNmK8eiOPDvhAT6YZbtLUE/AFt3/E5twms2XcUfuzaE=;
        b=pgciqqKin6UtQWqck1Jh7ycyPoC+R+U+xeFNYyvVYotk2JBrrbz9Vr7S5Vz0tjsLcN
         Tp13d8BnHNs4WhFVW5vmnG1ogCxgb6BLbbZdlpmbu72GhPLg9O5P+1ktFwbFGQoaA53q
         IDTLn4rEcSkBqp31E2Ek749Pvmdogq5aZPVKHnN8rCARFThJGOcJZrxmNOQdoZipz3Yu
         /LxFzLkV5hjD4NOkl7CAY9uNico4hmLnpNUBSekiQ+n/STXP8/vBMPvK9NZyIZwjmN7+
         XG4QOO3Y1iq2+y8MkdAdAZh0YMUg04M9lV6VGjI+/UMXH1XmcJY5EpF6mZ9znYCh7KdO
         N4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778474207; x=1779079007;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNmK8eiOPDvhAT6YZbtLUE/AFt3/E5twms2XcUfuzaE=;
        b=fvArzUoH8MqX0kzMnPrIJjBUYAC5krj0E33RqrZi9i52tjdNJMVrbtqyOB1FTeZF56
         KDLzmEy7NzlOQ36mYjf3nnOL3O7jahP+ww1ov/FbA2LXyuKi1VmxgnpA1ctRr8Ojun2j
         RlUDFCeHzHmdJq1TaiKydKxUjFbQr5lZdLFjMqYHonMUl1fFAa9vpMLaTtP5hnEwoC7u
         DPGCFHo/+BWEJHUkWXIjqA6P54sikVj2DzOceTC6yoPEQHiBO4UgrDPgEUSiP8UR7P9/
         6KF01CQnvVm2AZnQS4VfNJq0envavhflKrhRzsLtomAmZgPY6eMYpm+bhOnnxG0lTYQT
         y1RQ==
X-Gm-Message-State: AOJu0YzSEpv/mDOYM8a2Ng/0yGSP5AZr1LgaJArXiuo1LfyVcm65Ma2Y
	O0bErhEihiEK3TshBYy3WB+1/oTcgByUQuCsBDIFDZSS2CGkPtQLz9tT
X-Gm-Gg: Acq92OG6u2W1icKZf31QMzoLxCdVAw5Fr4uXkIK4E6Q9/0wIvBbwcYpsSWckzwyHPbv
	IqvxCPYfsn4m7auJwS1vePzBSf/GPzCjO2tV0d+4BSKyFUWHp3uC9yTuaqnhId5yYn9eTwmn4Yh
	Za7smg47CxS8Kav6/UQS3sgfcbg0kTgLM9Wa87+apD1Srft70OYWXUMGQ9+cfZTkD5Cso60Y5QJ
	27GQxA4Rd4hxNHIOSVHr/LQx0cjHx0RxRktpjcN8FjSgXG1sCseJKNJrahsITIx4MJi0nd9Ljjh
	jbQWV/k9DmMj4S1267pcMemssDk+CkuHWgyIsXwOnFo3pHozhBAi2WR4ua16p1UdakG3YR0KVmE
	bwlqZBss+RxaCAJitUD81Nt4pJeb/MLKsz5L7QNyAQDXHbN1QvjzsxG09xVXoYTWave7+5t4Gki
	6OZhFs1SL/fmyZtUrTO/HM4jcKENsc9CUtByxXbCejnpVLLV8xeyR9FJqUpmnB/2M9H2aoMVhIj
	w==
X-Received: by 2002:a05:7022:3d05:b0:11a:4016:44a5 with SMTP id a92af1059eb24-1318e917705mr10856939c88.24.1778474206475;
        Sun, 10 May 2026 21:36:46 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327865700asm12975784c88.9.2026.05.10.21.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 21:36:45 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 11 May 2026 01:36:37 -0300
Subject: [PATCH RESEND] ALSA: usb-audio: qcom: Check offload mapping
 failures
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260511-alsa-usb-qcom-offload-map-errors-v1-1-6502695e58bc@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3654;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=xz4Q2/bvZnl47FmwyqOLbYEmF0mtTjZCnGvYrSSP7PI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmMMbe8jqiunxW+xvtLrMf7O23v5Kw3BdZIFxsm77+0b
 aLxwtbOjlIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZjIZCFGhtuX84Vj9kRL8Bd8
 LxDb5Sv6bumK9celLG0CVW7fbylVVmX475r18NtVoaBph2qcd6g03Wi7YBG3/+KiuTPfGb39z5K
 0iw0A
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

uaudio_transfer_buffer_setup() calls dma_get_sgtable() and then passes
the sg_table to uaudio_iommu_map_xfer_buf() without checking whether sg
table construction succeeded. If dma_get_sgtable() fails, the sg_table
contents are not valid.

uaudio_iommu_map_pa() also ignores iommu_map() failures for the event and
transfer rings and still returns the allocated IOVA to the QMI response.
That can expose an unmapped IOVA to the audio DSP. For transfer rings,
the failed mapping also leaves the IOVA allocator state marked in use.

Check both operations. Free the coherent transfer buffer when sg table
construction fails, free the sg table when transfer-buffer IOMMU mapping
fails, and release the transfer-ring IOVA if iommu_map() fails. Also
return the existing event-ring IOVA when the event ring is already mapped,
matching the pre-split helper behavior.

Fixes: 326bbc348298 ("ALSA: usb-audio: qcom: Introduce QC USB SND offloading support")
Fixes: 44499ecb4f28 ("ALSA: usb: qcom: Fix false-positive address space check")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/qcom/qc_audio_offload.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index 5f993b88448c..a0009503b2c5 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -565,6 +565,7 @@ static unsigned long uaudio_iommu_map_pa(enum mem_type mtype, bool dma_coherent,
 	unsigned long iova = 0;
 	bool map = true;
 	int prot = uaudio_iommu_map_prot(dma_coherent);
+	int ret;
 
 	switch (mtype) {
 	case MEM_EVENT_RING:
@@ -582,10 +583,24 @@ static unsigned long uaudio_iommu_map_pa(enum mem_type mtype, bool dma_coherent,
 		dev_err(uaudio_qdev->data->dev, "unknown mem type %d\n", mtype);
 	}
 
-	if (!iova || !map)
+	if (!iova)
 		return 0;
 
-	iommu_map(uaudio_qdev->data->domain, iova, pa, size, prot, GFP_KERNEL);
+	if (!map)
+		return iova;
+
+	ret = iommu_map(uaudio_qdev->data->domain, iova, pa, size, prot,
+			GFP_KERNEL);
+	if (ret) {
+		dev_err(uaudio_qdev->data->dev,
+			"failed to map %zu bytes at iova 0x%08lx: %d\n",
+			size, iova, ret);
+		if (mtype == MEM_XFER_RING)
+			uaudio_put_iova(iova, size,
+					&uaudio_qdev->xfer_ring_list,
+					&uaudio_qdev->xfer_ring_iova_size);
+		return 0;
+	}
 
 	return iova;
 }
@@ -1054,15 +1069,17 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
 	if (!xfer_buf)
 		return -ENOMEM;
 
-	dma_get_sgtable(subs->dev->bus->sysdev, &xfer_buf_sgt, xfer_buf,
-			xfer_buf_dma, len);
+	ret = dma_get_sgtable(subs->dev->bus->sysdev, &xfer_buf_sgt, xfer_buf,
+			      xfer_buf_dma, len);
+	if (ret)
+		goto free_xfer_buf;
 
 	/* map the physical buffer into sysdev as well */
 	xfer_buf_dma_sysdev = uaudio_iommu_map_xfer_buf(dma_coherent,
 							len, &xfer_buf_sgt);
 	if (!xfer_buf_dma_sysdev) {
 		ret = -ENOMEM;
-		goto unmap_sync;
+		goto free_sgt;
 	}
 
 	mem_info->dma = xfer_buf_dma;
@@ -1073,7 +1090,9 @@ static int uaudio_transfer_buffer_setup(struct snd_usb_substream *subs,
 
 	return 0;
 
-unmap_sync:
+free_sgt:
+	sg_free_table(&xfer_buf_sgt);
+free_xfer_buf:
 	usb_free_coherent(subs->dev, len, xfer_buf, xfer_buf_dma);
 
 	return ret;

---
base-commit: ab4a88fdef2813446e3af179a708d024622ff4fa
change-id: 20260422-alsa-usb-qcom-offload-map-errors-ddbb6dbf758a

Best regards,
--
Cássio Gabriel <cassiogabrielcontato@gmail.com>
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>

