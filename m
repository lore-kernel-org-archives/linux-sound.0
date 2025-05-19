Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB51421D3C9
	for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 22:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747695008; cv=none; b=sF/FFCTl8dHwNRwC/kTKbQlPKpVhPLr1uprLAXigHsTgmQS3SOkSuQqklLd/vCQdaPreiRLJ00Bpa7T28T1mxRYrrBhmJ6/gDAVMPMuGfGOiJb50zxLxg8C1nKQRHgoAX/nS6uE0mNFtT73BHEkHiAmu1a0LAG+cCz9uLCX2Xi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747695008; c=relaxed/simple;
	bh=jJxUSpH/oIgswiEGVQuzEdnD7o8wzYyWJywnaYD7Rlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fmafHuSQmBeTL60zraECwggkFo97x51fVdyMqCm/mqDyRXXufvilPk2OQDSyBIYHZwYQos78/4QdPHwSNzYyiK43/jofQnrGLxaC20JE+vrnPr1ysqq8SozIR76BGm9kClwe/3fnWto0N1/LB8vMN+SZKnqGmG5wlaG278QLkwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=edburcher.com; spf=pass smtp.mailfrom=edburcher.com; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=edburcher.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=edburcher.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-445b11306abso12457215e9.3
        for <linux-sound@vger.kernel.org>; Mon, 19 May 2025 15:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747695005; x=1748299805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uF29dXnIkQCQ7WaI5xrrq+X3GjkCy+7GlljrGFZMHE=;
        b=rIxKH5lj5t/QagIj8Ay55fa/pdIABRZmEad0E72Z5hfEmNOAEe3NnJBdou4veKprBO
         abx5nQ6aXDT8qGQNXbdiNET+vTJ785oIBg7nMAA0CV7t5yt3lEzZb8qCZm5LnxmOQjUg
         ZOgWTVyJSJ6PlqLiwgqL+8ysAPKypMQUi1IQMV5TjnVjfO28VP65pqU2V7Wz25r64ULX
         AL05IuHTTrjPKVLBWKloBOILiB8lh6MulSOLG4ywTfmL9q5zgvxo5ECqTPKyvbxDxp8H
         V8BEOPJ01maUK2fAy9ZxW9xsKAT20L9q0vcdeT8nNDWctYlDt9VmV2GTf3UVHnK/VMsG
         u1hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQ4o67YgDOeHlMWl8qAyggcpqaXtE+qNkcQ6sED8HRmyUg3dyGMWGEOecTepT3xDkzd2EgGyltC9VJAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqlueB8T+ay6qC52YXD8c0LVB38OYH7W9mXgO+kmEphOxAp29T
	4ED7To8AZATk/hPcl9ihaNsCDRYlY1Vf0ALc2feb+ffoC7rnL05HbKpRZJIsiRd+xQmy33KcgQJ
	jZ7Rsw/k=
X-Gm-Gg: ASbGncsYbzbWUuLnbviUKJGVWeSpiSchcHLFLjOR3yb8Q5fiDP6PbOyfA+dC6Ex47LW
	QPOCeQz/wRBB/wdE1tBK8431B0Z5Zi+IcwbZSknD7mWvTQcJb2BXv+xyVgGSBrl9Y9EjFh7hNAb
	jxY1oX9uyxBSdvCbQ/ibYxz2kpB7QHrrRKX+ey50xFCCigv7ihgnNIJigqB2bi9rYOrGfAeKjhV
	vDq2uGFFZdwDKlofWJTF3NDJwxUhrNtNEjaf2h5fhKAlf/G5rgrNpmXip9Bylty8KTinQTuya0W
	XJhDOYOrN1ivnbDsRvreahYX1BhsCMTBO1ENwHjpoZ6uMMCjkFs=
X-Google-Smtp-Source: AGHT+IEkOHajP7NZwiCpyFVHw4bpYXfpftFwBiCbiJo9nP3bNqK30Cee7sh3fZqQERN1np/2Ch/tAQ==
X-Received: by 2002:a05:600c:c16:b0:43d:53c:1ad6 with SMTP id 5b1f17b1804b1-442ff031a30mr109705465e9.26.1747695005013;
        Mon, 19 May 2025 15:50:05 -0700 (PDT)
Received: from electron.local ([188.74.119.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a5b4sm14054161f8f.21.2025.05.19.15.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 15:50:04 -0700 (PDT)
From: Ed Burcher <git@edburcher.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: git@edburcher.com,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP10
Date: Mon, 19 May 2025 23:49:07 +0100
Message-ID: <20250519224907.31265-2-git@edburcher.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250519224907.31265-1-git@edburcher.com>
References: <20250519224907.31265-1-git@edburcher.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lenovo Yoga Pro 7 (gen 10) with Realtek ALC3306 and combined CS35L56
amplifiers need quirk ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN to
enable bass

Signed-off-by: Ed Burcher <git@edburcher.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 8a2b09e4a7d5..4d719dddf02f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -11300,6 +11300,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x38fa, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38fd, "ThinkBook plus Gen5 Hybrid", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
+	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3913, "Lenovo 145", ALC236_FIXUP_LENOVO_INV_DMIC),
 	SND_PCI_QUIRK(0x17aa, 0x391f, "Yoga S990-16 pro Quad YC Quad", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3920, "Yoga S990-16 pro Quad VECO Quad", ALC287_FIXUP_TAS2781_I2C),
-- 
2.48.1

