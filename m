Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5B82D77E9
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 11:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777633857; cv=none; b=r7n9BnyUgJ6xr2d2UgYEnWoYhQDxW7AGrd/yeX4Qrp2CGNdp0Y956vVko3oSvTlNdue0ruT9GamFyTUgkQHDy1ayNpHsPSQE86uma0qpkkXJdt+7hnj5R7jEFJFpypymBTzYUzRd9ChSmVoYmZ3xNIL1dyEQZt57ToG8fjEWIes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777633857; c=relaxed/simple;
	bh=3Wcuv7vWXril4wnR8nrnNGWz346GKjDN1CfiXRWaVXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FmS1o7KmYzbVqwx3XZUO+yNZByzz9w19xpRRF4nVmGP0qHRpr7S8jCtox3nzbXlYLgt8C6XC5sfddrHFMruXVVHpVD4oQowg4zH4ILcsIOAd9Cqv8ozcRCfUHSgo76z1wxZ43PWIVBykJElzlwx8HXT4P5k0DYtvNpOW3Vw1/fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qwgoRfh1; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qwgoRfh1"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c45281a06so2876463c88.1
        for <linux-sound@vger.kernel.org>; Fri, 01 May 2026 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777633855; x=1778238655; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p8/WVfHESUffqanqnB+tvboreu3xWHPzbWiU3q5ebRc=;
        b=qwgoRfh1kk3G23t+6ZpOqk7PiNtmaK8YnrASu25n/sMJcaB7K9s+v6pOFBrNRDRdgG
         tVhO9WJN0L/RFybt2GgKd0klvcE4k21VSAAcr2RO+++jHTMW0M/HmiThgjqzsKFjFYCp
         ioipJ3xUIuVzC7P4w1wTRhCYcv87e9d9ER1j/nJbPMm1DljaWcW0nFImxqRqCaYTlwGJ
         Pv7t/rBvx7GwlWTqplPFXodfBEsMpSoYHPws8myzo81FQ71UYWF+nm3dSVnhWCbk4NBt
         K6TsGnD0dPkB+9ED8K28j8KQYe25hViBHt12DOUlIdciTXnFWvEquUGHEDMaPP+lSKNG
         KX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777633855; x=1778238655;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8/WVfHESUffqanqnB+tvboreu3xWHPzbWiU3q5ebRc=;
        b=KY0mYnX3WDcun6H/Pt3gtrekHQcFQM0kW80nd9Mfwta9lBZ6iu5ol59cD6IVOsyDoz
         ukHLZqztsiG2Ybjk7W2p2S4aG7blbJ5GGfPcUZHzPh+4sAvF6PCb/qEZp1J3+qZCtn+d
         9S6VOSu+iXEJpVA49Habbn3Ee/jxwgQf5AJntOPjuG2QPNjttMq7AL37uATglmIDI2KV
         m8VNlVBY8v8Crkzm8FwkgMudHnPwVXFKK/pdDQeS0gDcnralKJDYi9q9eJcIxBYBLcDU
         YPesuFuTe8AB7V0Qz6hcJh6nE2Rmq/0khMT9LmYbksyEYqgLyanUrL2DmSOa8/IJlC/g
         hP+A==
X-Gm-Message-State: AOJu0YzsI6SXLmqv+rfAkh3y78qiFuf9ZNKNjk40y3FsXo7rdIZGYPVw
	XGyT4YAO5Ea9g35qp8s/MWEGDB9ucP8y/47iQPLOwEdhWrBo5MtQwpRj
X-Gm-Gg: AeBDievbKKG0vIdyUei7dhzDyQQfE8eozPwJe83fWXJDCC1GUTiOfyUtOf36V8Xc6+A
	0ima5caeio9VR+2pOj5fdQsxgQ+epeoxh4jw7ndcRJaiKPVqLg/nYT9Oz6Pr5KWf+bV3O4gZYaW
	xUKGvNk2hbPW8FdXOby1RXSF8ofC/2fuqszcFr9lqUC48avgn5n+t7hPnSBsD+f5mfpiccC+tfh
	UCOdATuTy3i2Wp0qiRWi+RpwXF7/DejunB2WWEpxETwYfOvYT7XGAae81US8P3+JXZLD+Gyuw9G
	821b9QPNZhiozjwdVhJYFVxywPtbYx0hOm+s09IbE+tkzwVbpMaX0ykI2pGMrmDrxExo4O522T/
	g3Cpw9ut4Q5rBycfg+/1zqzyxjY9Vh6QcAGugltzCgnheyfjTEpnMCtE2ylJRIAPInHH3c+gPZ1
	tgXZfUU3IQgb1JnN929JKGzxxam9chiXtG4Ne5uwabb0EShjiozRX/XGld0aj1MJw7Ie/Ld1xmL
	lH9Ffj4sKIscUI6oKFpPmoRIffY/7G4BQ==
X-Received: by 2002:a05:7022:1a85:b0:11b:923d:7753 with SMTP id a92af1059eb24-12deac47e55mr3671481c88.3.1777633854634;
        Fri, 01 May 2026 04:10:54 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8279e57sm2628939c88.3.2026.05.01.04.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:10:53 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 01 May 2026 08:10:46 -0300
Subject: [PATCH] ALSA: usb-audio: qcom: Check offload mapping failures
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260501-alsa-usb-qcom-offload-map-errors-v1-1-ea927afd42c0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCQAxA0auUrA3UQat4FXGRTDI60nZqYkUov
 bujLt/m/wVcLavDqVnA9JU9l7Fiu2kg3mi8KmaphtCGrt2FgNQ74eyMj1gGLCn1hQQHmlDNijm
 KMHfC6bA/EtTMZJry+7c4X/72me8an98urOsHUE9eJYQAAAA=
X-Change-ID: 20260422-alsa-usb-qcom-offload-map-errors-ddbb6dbf758a
To: Takashi Iwai <tiwai@suse.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mark Brown <broonie@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3601;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=3Wcuv7vWXril4wnR8nrnNGWz346GKjDN1CfiXRWaVXg=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlfuqzO8G9h5Z947LPZmziJD2uVMuKFc/4kalTL1AWkH
 VMROK7YUcrCIMbFICumyLI6aZHlnq4HV+vjVnjAzGFlAhnCwMUpABPpCGT472Kx8WvbDn6bv4km
 hvy6u1mV18ycvGHp8oQOnTNPeuNrGxn+8MmFcRs4KrG+q5paZWDo7DfTW51vC/vpTdmqzGoGjdu
 ZAA==
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

