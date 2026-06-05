Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2611337B032
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 04:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780632913; cv=none; b=EaIUQQ7gP0H2sdTMebD8kjv5pxeGTjhVTqzdJJ5lmwG87GZNEjrUOhGg2bKcbn6iFMa1uObaqLHIxUzb+vDT3WEQHJmFpZOGPU5yfovwwqgUgtbTgy5Q/8rEpl30VqsOGG4DVYKS7mPlQmwkAeQ5belhITS7FvgkzXuhrecJhk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780632913; c=relaxed/simple;
	bh=UKVuNdIwrJbey3Frar5jsdTaMIoI6yP+r39UrWt10tQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aKFovpRXfWwiHhueKUXrsp8PlURBUANx3OYFQtwJ/RDDNzEzpf8qmPk1qZeDQmsd7Ycyf+atmrgvQPZYL7CsUiUMbfOngfT+DX7YGp6MHH/XR19BmLrIdw2wAcSHQKCcnIhKA0UFs1XXYVb1mIR02feibaUYSNaMoGNJCEaYxco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q/0OvLUp; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q/0OvLUp"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137dd523634so2485412c88.1
        for <linux-sound@vger.kernel.org>; Thu, 04 Jun 2026 21:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780632908; x=1781237708; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OVnO26slniRK2FmkJZvabdg4k7aFVKg33wMgtkQUsgs=;
        b=Q/0OvLUpcz1vPL0YNrQVqNHug+L5ftM27ueugF1huK1yZQ8nn5K3AZFxd89AqZ/aQu
         BgPSUcAGUUWwYjZxxwolyqpb2rzDbMUANFd4c5S8aci5jS20YipteHxabGZfppTKD+WW
         MaDltHu/ctAeFwcdd26qBONZK11cMygALBbinBnTbSv839DwmRlvfBjWaVjrbFmM1hGo
         uvuIHglbxOgRNbkWqHmccAW0eItemEVjZo/KYE42kIq+p5zXFM31EnJbqrEsoImQ9/1b
         UO0c124CIIT87Gg1QepcOX81XBEsngOmSi75PN6dg1UZ33SoY0vwZIGaTmIKKu6Gvs6t
         GiYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780632908; x=1781237708;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVnO26slniRK2FmkJZvabdg4k7aFVKg33wMgtkQUsgs=;
        b=Q6i0O+n4Gz5Y70csrIXosZ8I7edPOlC2J0iCiBXCs/iqm/LazWYpaiZAryexjm4Dxw
         muNGnsykwm2w+qqTpnlZ4bYvZgkphpxjPqjMy0W4fW1tvRNnbuzzwUN/Kk/aCUWgvWRF
         DE7jIHJ5Yl1wsCzx1fj87oq+a3FLOMyW6CPljrF0yLZX4bMT6014Deu3IcdFhDaLnhuZ
         Q9c0cxarHJecKw0fDfREuijv/Mab2RTQT5VwoRwqab26+wboDaNW6kpt284MyVHWRGoN
         a3Mtd5HBiG+eifQ4SzMLDxqIyWm3cs9JCAi2M/DLb8v1/aJNlCh5Qc7KOeR29fohES+e
         s2jw==
X-Gm-Message-State: AOJu0Yy5/1jCF6+5APXgQDVFJ3N2ydDM827+WtHpfaBajvomvGssnq0D
	Tk7ziqr1e7WxebajC7uK14fslViYrjez8oFiw++CIUmgStdVK13t20Ye
X-Gm-Gg: Acq92OG0m4CaPUBcI1w16BjF3sHV5BM1Ku/SezYbMnwjGg470IDYZWy7D28Na608GHs
	S51mm5h50ZaZxAz/9SGb3rWvutg7n4F3hdfx4U1MoxPqhrMGDdpAKHrM2aDZ4t7jfdhqi0vGwvF
	gZTA107h+Q16OQe1e61tggUJV2aXTPwncxtKlDvCFEXremgMjVc0ADwNPWiE+btj/Xn+voFRDju
	7XD2MqVfqoKrNSsC4Rs69sX2PKE1TTjrRcCwWKABjKmUl9eEYuxbf/tUMElGx3lE5fvckXM+efo
	ZipwirFo7FRdQagSGdOcO0nye9VLNX2mzkZZBsGTyfKzb2rwDyn2NarbLHRic3Z27NyIOL9cvPU
	/qFOS/tji7F3PBMky16fZ7gRN9a807TEhdFhNcuDHKH/1EILEl76YTWCrtmtMpCILHAjJS+9ryj
	MWviSAVKRyFcLOMg1+BSp17e1QhEZmrb2Vd8OH1mqwHdek/uxDsUdLVNVCxkuz6gln3NnSitgfr
	pxcDLMFSTcXTht1pbd/dEI=
X-Received: by 2002:a05:7022:6999:b0:138:5ef:f31 with SMTP id a92af1059eb24-138067214demr736863c88.27.1780632907765;
        Thu, 04 Jun 2026 21:15:07 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm5300845c88.11.2026.06.04.21.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 21:15:07 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 05 Jun 2026 01:14:40 -0300
Subject: [PATCH] ALSA: usb-audio: qcom: Initialize offload control return
 value
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260605-alsa-usb-qcom-offload-ret-init-v1-1-dc72fcc4bd3b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNTQrCMBBA4auUWTswCbagVxEX+ZnoSE00k4pQe
 nejLr/NeysoV2GF47BC5ZeolNxhdgOEq8sXRondYMlONNGIblaHi3p8hnLHktJcXMTKDSVLQ0s
 H8maMhvcJeuRROcn7Nzid/9bF3zi0bxW27QO38PZwggAAAA==
X-Change-ID: 20260605-alsa-usb-qcom-offload-ret-init-2090b15d1e4f
To: Takashi Iwai <tiwai@suse.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=UKVuNdIwrJbey3Frar5jsdTaMIoI6yP+r39UrWt10tQ=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlKvs5LRCeFCt7fe6f2wn29Sf/Md3/YVJBWVFiyVUGRU
 SFWaK9pRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEwkpoSRoVHr45Tg2cdPxRwQ
 lzP32n/PeQnb1pULdgbFLiucplT2V4ORYZs1W+a87QaHdqSppj0sbIvulp6twPczR90gn+Mgm/w
 eVgA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_usb_offload_create_ctl() returns ret after walking the USB PCM list,
but ret is only assigned after a playback stream passes the endpoint and
PCM-index filters.

If all playback streams are skipped, for example because there is no
playback endpoint or because all PCM indexes exceed the 0xff control
range, the function returns an uninitialized stack value.

Initialize ret to 0 so the no-control-created path returns deterministic
success, while preserving the existing negative error return when
snd_ctl_add() fails.

Fixes: a67656f011d1 ("ALSA: usb-audio: qcom: Add USB offload route kcontrol")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/qcom/mixer_usb_offload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/qcom/mixer_usb_offload.c b/sound/usb/qcom/mixer_usb_offload.c
index 48e55d5872d5..b1591361e76c 100644
--- a/sound/usb/qcom/mixer_usb_offload.c
+++ b/sound/usb/qcom/mixer_usb_offload.c
@@ -113,7 +113,7 @@ int snd_usb_offload_create_ctl(struct snd_usb_audio *chip, struct device *bedev)
 	struct snd_usb_substream *subs;
 	struct snd_usb_stream *as;
 	char ctl_name[48];
-	int ret;
+	int ret = 0;
 
 	list_for_each_entry(as, &chip->pcm_list, list) {
 		subs = &as->substream[SNDRV_PCM_STREAM_PLAYBACK];

---
base-commit: a5b51356e6b570571592b1a0f9a994f2573227e2
change-id: 20260605-alsa-usb-qcom-offload-ret-init-2090b15d1e4f

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

