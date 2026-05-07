Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF0315D3B
	for <linux-sound@vger.kernel.org>; Thu,  7 May 2026 14:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164125; cv=none; b=fywprdoyMiGvB0/HEixNSC17AqODLKFGfF3ZvKpe1o0iiRVtz2QAJ4YnC7yOLiJU/LsBfAj3iDJoJpok2v/uIi+NP+aTRWWRHgS6JJ4R6po5ofUgzTWS5gJkRGwbVccTzy3KUEbULZ4ZkY7rXSnRaMWznN+KM8ueWlI+hD3rRlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164125; c=relaxed/simple;
	bh=PCbwbQNt4FGuy1Mx/UEcWlVmDbt9jGbh+cLIMf+sZ+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ff6AP0evBmxPMXqGsPHJOBrfCCsHOZGJ7neNEh2b10I8Q/E88pJ2ovz9XqHrKZVgsYkKLX8zeBCIZrQrTnPMcIlbyuABk9VGNcZwL6lDM5qfAJemL9m1exqtnxKsRYvzy8K2i5tbnPJA5buhXZumcqDFVSJ/mURvXjQMEsmQbeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZAYt23c; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZAYt23c"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c19d23b19so1683395c88.0
        for <linux-sound@vger.kernel.org>; Thu, 07 May 2026 07:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778164122; x=1778768922; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m52C9FnSjkJyGIM2Iz6ci+a0fVJqmhLXSC8+wk7x+s0=;
        b=WZAYt23c09uQluW0pEeorWwjbt46T0T1/VnA/6zpoXOGRFwJYL7Kuaq8OueoNrhFwo
         J3M+67Kc53GZQyuj/ODocfIe8VbpdhE4i6swpU+f2o4oEeK8e4ltSXdpcw++2vdkvZI7
         nHBusH6AUXVgrRS53PE0XVBbXPmIVKXMGRVusCg1AhyCex+/kI1nYadhnUxZT3YDCSzj
         NAQ8SAZdUDWVgeq9TQWgjvXDxIRmonvroAIVrsECx6VbLai4Xnd68i7EHpsGLThlD3CG
         NK+i5htGe/By8YKIfc8cPUsBYXmjdlfpmIDJ0asA145ZS3kTVJJy+rBDb9RXi6Zeydv+
         iRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778164122; x=1778768922;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m52C9FnSjkJyGIM2Iz6ci+a0fVJqmhLXSC8+wk7x+s0=;
        b=KI0Rv/9JcXOw3PA0weihVDcz2Ssdn80PQizyFf3ZplteI/sgz/KJn8hphe08s9OBpz
         Flfu192mNRhmVBIJ9zAuMufMpgqDVqLmnQjJAVNRFYvT217cLO1JVLnfI+fqODe7NDUH
         BbtILR7C/AfErchmiXegk9wMNk8oz2RuL5+isGakQJjTjNJrzUgVlBPDU+Gbj2eLH7pG
         nabxQ0kaXHuQKGBr9VFvRqHVlIztnEnbH/2yQMeOmyXtwQuZ4EWTtMs0H0gmTUvRJ7sD
         lrat+yE74FVy5p3rsoBbnQS3L7dbwaO6prQI6VMD5ZsH59vYzVNHhgi3oHtZiZWm7lUD
         3O/g==
X-Forwarded-Encrypted: i=1; AFNElJ+eo5ttmiH84B8+Lu+R5tN8zdEu5ff77QsSp9NLxMg7aTrPGLScpK7sDtJcPSzrek51e962h9nXgLHCRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMuO/oKis33qSuakzD4nvyyVNmgLr3aO2cSJgbsY98uBo9UxNV
	hhckYKDWNBPGp9HwLJh/HIjXhEMD0K679JAtwbFKJzwOCSm6seh6RiUV
X-Gm-Gg: AeBDieuJEzTuj4AMJoitBFdiNMLdTNPNEHtXH7vHjMDFC3yH2qK1+9JPSQNKCsJ7EWp
	y2ziSKtesuz4nxzANQyJuC/E8K059UlvLjLpqBXYqzq9aX3FmQBBvAUQmQrkV4X2oEOMmjEr5Wy
	4pYDkXPGGFTScVFztOJACxtiw4keT7+PHT9ml4sWN3qhwbN8kAeNaNzQGPtwFl9+ahwbloc42yq
	6F6vYcL1gHamM44dleBDfzwd7/VewFrvkSYnxOPWLiwCH92BW39SwhovmGpnbbdxyAEbd8eU430
	Zn2NFb3zi/BHZRUU4l5zlpxiCEz2xFHYQSBaWAlQqPF1q9YzGma3lWrDiLlFo9dzMCXOws7ltAv
	uDPWQf9kSPR+atLx8LoznopT5Nw+Fj4/xO5MwA6YHMY0d4rYGKzlk8R7i9QSOj3pgTvzio6+bP+
	AYH11cTvnt+PBjl+X4E4J7wXiNgKSDLuoeKPqOpHg2R+CfUTH5hQ268ZbcDvmRm1ilz3D/YSKag
	/B2mXZaAkKF
X-Received: by 2002:a05:7022:6899:b0:132:5e72:43d3 with SMTP id a92af1059eb24-1325e724784mr399692c88.29.1778164121302;
        Thu, 07 May 2026 07:28:41 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f570384e46sm8829554eec.26.2026.05.07.07.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:28:40 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 07 May 2026 11:28:30 -0300
Subject: [PATCH] ALSA: virtio: Validate control metadata from the device
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260507-alsa-virtio-validate-kctl-info-v1-1-7404fb12ec37@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ7CIBBA0as0s3aSiqULr2JcDDDVUQKGocSk6
 d1FXb7N/xsoF2GF87BB4SYqOXUcDwP4O6Ubo4RuMKOZx8lMSFEJm5QqGRtFCVQZn75GlLRkNM7
 xydlgw2yhR16FF3n/Bpfr37q6B/v6rcK+fwDp1AvdggAAAA==
X-Change-ID: 20260424-alsa-virtio-validate-kctl-info-2bbe3b5d5d65
To: Takashi Iwai <tiwai@suse.com>, 
 Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: virtualization@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3816;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=PCbwbQNt4FGuy1Mx/UEcWlVmDbt9jGbh+cLIMf+sZ+o=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJl/Fk7cXbMuuOnqBrbkK5Ix27yez6pyilfSjmraorb7I
 N/70/t8O0pZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAiS7oYGc6kRSboX3+SH/6F
 oS2pb88fnj+h641Oul1etjx0/azE2MeMDEun6J4L0D14TXz53ZuvshrnLWZaalcjymqbkbdmRnp
 wGgsA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

virtio-snd control handling trusts the device-provided control type and
value count returned by the device.

That metadata is then used directly to index g_v2a_type_map[] in
virtsnd_kctl_info(), and to size loops and memcpy() operations in
virtsnd_kctl_get() and virtsnd_kctl_put() against fixed-size
virtio_snd_ctl_value and snd_ctl_elem_value arrays.

A buggy or malicious device can therefore trigger out-of-bounds access by
advertising an invalid control type or an oversized value count.

Validate control type and count once in virtsnd_kctl_parse_cfg(), before
querying enumerated items or exposing the control to ALSA.

Fixes: d6568e3de42d ("ALSA: virtio: add support for audio controls")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/virtio/virtio_kctl.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/sound/virtio/virtio_kctl.c b/sound/virtio/virtio_kctl.c
index ffb903d56297..45f7b6a5b308 100644
--- a/sound/virtio/virtio_kctl.c
+++ b/sound/virtio/virtio_kctl.c
@@ -18,6 +18,21 @@ static const snd_ctl_elem_type_t g_v2a_type_map[] = {
 	[VIRTIO_SND_CTL_TYPE_IEC958] = SNDRV_CTL_ELEM_TYPE_IEC958
 };
 
+/* Map for converting VirtIO types to maximum value counts. */
+static const unsigned int g_v2a_count_map[] = {
+	[VIRTIO_SND_CTL_TYPE_BOOLEAN] =
+		ARRAY_SIZE(((struct virtio_snd_ctl_value *)0)->value.integer),
+	[VIRTIO_SND_CTL_TYPE_INTEGER] =
+		ARRAY_SIZE(((struct virtio_snd_ctl_value *)0)->value.integer),
+	[VIRTIO_SND_CTL_TYPE_INTEGER64] =
+		ARRAY_SIZE(((struct virtio_snd_ctl_value *)0)->value.integer64),
+	[VIRTIO_SND_CTL_TYPE_ENUMERATED] =
+		ARRAY_SIZE(((struct virtio_snd_ctl_value *)0)->value.enumerated),
+	[VIRTIO_SND_CTL_TYPE_BYTES] =
+		ARRAY_SIZE(((struct virtio_snd_ctl_value *)0)->value.bytes),
+	[VIRTIO_SND_CTL_TYPE_IEC958] = 1
+};
+
 /* Map for converting VirtIO access rights to ALSA access rights. */
 static const unsigned int g_v2a_access_map[] = {
 	[VIRTIO_SND_CTL_ACCESS_READ] = SNDRV_CTL_ELEM_ACCESS_READ,
@@ -36,6 +51,37 @@ static const unsigned int g_v2a_mask_map[] = {
 	[VIRTIO_SND_CTL_EVT_MASK_TLV] = SNDRV_CTL_EVENT_MASK_TLV
 };
 
+static int virtsnd_kctl_validate_info(struct virtio_snd *snd, u32 cid,
+				      struct virtio_snd_ctl_info *kinfo)
+{
+	struct virtio_device *vdev = snd->vdev;
+	unsigned int type = le32_to_cpu(kinfo->type);
+	unsigned int count = le32_to_cpu(kinfo->count);
+
+	if (type >= ARRAY_SIZE(g_v2a_type_map)) {
+		dev_err(&vdev->dev, "control #%u: unknown type %u\n",
+			cid, type);
+		return -EINVAL;
+	}
+
+	if (count > g_v2a_count_map[type] ||
+	    (type == VIRTIO_SND_CTL_TYPE_IEC958 && count != 1)) {
+		dev_err(&vdev->dev, "control #%u: invalid count %u for type %u\n",
+			cid, count, type);
+		return -EINVAL;
+	}
+
+	if (type == VIRTIO_SND_CTL_TYPE_ENUMERATED &&
+	    !le32_to_cpu(kinfo->value.enumerated.items)) {
+		dev_err(&vdev->dev,
+			"control #%u: no items for enumerated control\n",
+			cid);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /**
  * virtsnd_kctl_info() - Returns information about the control.
  * @kcontrol: ALSA control element.
@@ -385,6 +431,10 @@ int virtsnd_kctl_parse_cfg(struct virtio_snd *snd)
 		struct virtio_snd_ctl_info *kinfo = &snd->kctl_infos[i];
 		unsigned int type = le32_to_cpu(kinfo->type);
 
+		rc = virtsnd_kctl_validate_info(snd, i, kinfo);
+		if (rc)
+			return rc;
+
 		if (type == VIRTIO_SND_CTL_TYPE_ENUMERATED) {
 			rc = virtsnd_kctl_get_enum_items(snd, i);
 			if (rc)

---
base-commit: 5bddc5123566e6431fff826fe76a8e378ae9db78
change-id: 20260424-alsa-virtio-validate-kctl-info-2bbe3b5d5d65

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

