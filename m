Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794154223;
	b=vdVZ4lMimCNKVSlE2/KeDzaO+Sq821dTiMK0fW4ES+UFjuaW22Hu45qEksdlBhJwFNzs
	 6BsePPSsmrBX/GyJu0gRMxOjXwqS5vYU1eQQ5qewi8CdfmIplfMHu/k60oyKCm8V6dK88
	 8giNI7ozsWfpW0mSwz4fG9J87qwUq5rQt+vGqVC7VqvU0L/+boiTZDlVUFAgswKQVXWbn
	 Su02GO6YhDS4MWssVFWnSZQq7vQuS3/pIIAbKgRQ4Pc9nB4pe24LV2uhYWcSCYdU6U9tU
	 Q1DMw0k15G/xv8eXkJpdoM7YbrxBeFWgcyHO63z3J+VrYm0xHZxeIFp99+MUv+huoZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fm7/aHIW/1P599V7mhSZ2sKud5lmZUMj6TxkPF73djU=;
	b=kGvIqrnMleeC/LdUEDLgWndM562dysTjjfVO/bEdaC8wF5WSsQPenzg/uuJe69y6RjE+
	 sqtQHHdK4CX+rZq6KGV7frFc/fvHOP3qDKCyN0PhHg0I4KEANnVv1Kj38kKIwksXAFbrs
	 7xQy94vdLF332LofB7FhvcFnRYpH3AMwrDIJdC5trJixvpWsGwuJ/tyLVt9nAi1jegFHG
	 MHn/aKQztChEsIBgcFt+o8rFl/Nl/vjF7u4LmLxy3eUOvOji6VidQ/qHJ14lxCJwITOHF
	 H0hpQKGAOEmzpB/1FaBbgsfYbdKiMetq8qp+2e3N7GBDZqo2Lmf6ixi5uqhZVzXE5bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=naiTJOaq;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187E8606A31C
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 16:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 187E8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=naiTJOaq
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so355746c88.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 08:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794154222; x=1794759022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fm7/aHIW/1P599V7mhSZ2sKud5lmZUMj6TxkPF73djU=;
        b=naiTJOaqxO1BV5PApiTZjmeYwylCJ00DvaFqQ0bMvB5t7NEKJoRMBOpHWYFXpCh2vv
         HBPgALcXVWVvO//YWAQ3lTU0IeC9IiCU6ke+s0R4Q3ny+C5fGqUSHZyWdfrbX1gXPXLD
         JX5ToWRinl5n3d2lE1S5fwjOFPAyhAyOLUXJJlSSwO7eBP1Abz45D9el8154F2huogDa
         F6Zhter8A1q1S4WUJ6PwTvnJ4auh9WHKhepobPuybfl5xMxA1RiRtFePxqaRDS2adSjD
         T/IXWK/Qy9xmAnGWVZGQ3Ezsu9CNn7Cm+SnUdueAW0KHFeZqMDzB8DmLizrWbx4bRx0H
         KTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794154222; x=1794759022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fm7/aHIW/1P599V7mhSZ2sKud5lmZUMj6TxkPF73djU=;
        b=TBQC7pSPZbbKNl2pwKeNkRez6QzM848Zsnh7p5u9tliIwgLg8JNVEQJrQ5qEcnUAVS
         ldXdgktkGwEEq19+f93ri4Lv/uLZx6xZl0DSnrqX9L5f+NwlHJa4SPgUxgLfrnjIDKW0
         BCr3ItV7d4Dk/A8pCf6so4VfS+v2oXCaU8xIT/O7u9N/Kz5BuveXb37QY6GEwQLl762/
         EHjxl9bv/aQ85jMv63dzuGjDZ+ICkxXbaQAr7EXO1fVopJmpZMtbT321+zGn2p1Qw/BW
         oX+tBpE/zRXXY6OgZzA7DvsC08gswYCx/Jr9hkUZxnLJRIxiVaW7N9fwQ7bsBAdUOgfD
         PZvQ==
X-Forwarded-Encrypted: i=1; AL+hErG2Dc3uuvD+/twiBM9kTN8SusViNiKwG5l1aagVrHKcqC8TS/QIeWYWLRap1LOIfVTM6VozLIf9QcD1CA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+VqXX6IxGWtjwdkfuoFjuMIcYnH2R4NifRdwht4O7MbDDBSXoG
	+t+LAMWcVdzm9Fz3vdlUG+pd/hNEprGiy4ab+uxuZfp5avw6q89mnljr
X-Gm-Gg: AYBFou13qztCu0bCPkdXSyJYAipOTxLYzyrzVqj8MbBdrqXWKLs+kLXCAnj0YZ+r9Ku
	A8HJKAOeWlcaJ9c8qdR6mW7phWBdEsMsoytwPO2GqPUP4lqPgqmK3uWboCVfHHIkIG4MHfruvoo
	xhSf+iy4j9mvmZvxwDvOBck4vSW7cRmo4y7OS0c0Sy6Q4J34h1PbMz+DQAza6C1t/ahugXGgQyA
	FvniDzVSkHIkmHYOjDqgb/tdhYB2GmVMDUNklfL2XG6Nhh92iiosCw8lZxemZKxS5sP7SiPUMs7
	VPkQBjjxMG2pTOQuxz+5MAgxbInkWndJYhFP0Qqo040sE5sM9lkdycVM8J/CLaXODDI2mFS5sQ6
	42e2h+VQU8Dz/u+PMeqTACB1mui1pzxi188FHJ1M0NaCCX5RfuigtirWTVZ4ver9YDRY2f/vd68
	pD4OJhrsKIQtxC3WRY5aMEkjJzUO7NiH4OzZV2b4pD9Zl7BNgrbAeSZRIEma0IwhCzwgPtfP8sh
	iQ4S/E6X6SNSweBLpLKhXx1E43i7U59T/RUIp3KgzxIHJfWv+g1N9RdZ/qgLVDmhcsGCb848lGQ
	mlafgmIw8WCw3spyH5YWF1/RcSi+UhNypVuodgaiAD5FqcQhwRlda4Ft0sxIQnP5jXBtsUuG
X-Received: by 2002:a05:701b:2816:b0:1b3:a012:2e40 with SMTP id a92af1059eb24-1b3a0123932mr2505396c88.42.1794154222149;
        Sun, 08 Nov 2026 08:10:22 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b372ed839fsm6950278c88.0.2026.11.08.08.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 08:10:21 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: sreekuttan2156239@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: [PATCH v2] ALSA: control: Validate element info in compat ioctl
Date: Sun,  8 Nov 2026 16:09:25 +0000
Message-ID: <20261108160925.8774-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261108141219.7655-1-sreekuttan2156239@gmail.com>
References: <20261108141219.7655-1-sreekuttan2156239@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The compat ioctl code calls the control's info callback directly
in get_ctl_type() to obtain the element type and count.

Unlike the normal control info path, this code does not validate
the information returned by the callback.

The compat read and write handlers use the returned type and
count to access fixed-size value buffers and calculate copy
sizes. Invalid metadata could cause these handlers to access
memory outside the expected buffer boundaries.

Rebuild the element ID and obtain the control's access flags
before validating the returned information. Respect the
skip-validation flag to preserve the existing behaviour for
controls that request it.

Call snd_ctl_check_elem_info() when validation is enabled to
ensure that invalid element metadata is not used by the compat
ioctl handlers.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Rebuild the element ID before validation.
 - Set the control access flags and respect
   SNDRV_CTL_ELEM_ACCESS_SKIP_CHECK.

 sound/core/control_compat.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/core/control_compat.c b/sound/core/control_compat.c
index 87f7ad5ab739..0c1b80c856f2 100644
--- a/sound/core/control_compat.c
+++ b/sound/core/control_compat.c
@@ -169,6 +169,8 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 			int *countp)
 {
 	struct snd_kcontrol *kctl;
+	struct snd_kcontrol_volatile *vd;
+	unsigned int index_offset;
 	int err;
 
 	guard(rwsem_read)(&card->controls_rwsem);
@@ -183,6 +185,17 @@ static int get_ctl_type(struct snd_card *card, struct snd_ctl_elem_id *id,
 	info->id = *id;
 	err = kctl->info(kctl, info);
 	if (err >= 0) {
+		index_offset = snd_ctl_get_ioff(kctl, &info->id);
+		vd = &kctl->vd[index_offset];
+		snd_ctl_build_ioff(&info->id, kctl, index_offset);
+		info->access = vd->access;
+
+		if (!snd_ctl_skip_validation(info)) {
+			err = snd_ctl_check_elem_info(card, info);
+			if (err < 0)
+				return err;
+		}
+
 		err = info->type;
 		*countp = info->count;
 	}
-- 
2.55.0

